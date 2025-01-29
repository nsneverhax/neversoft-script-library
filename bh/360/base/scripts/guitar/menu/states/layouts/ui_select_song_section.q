g_sss_highlighted_index = 0
default_section_rgba = [
	183
	186
	255
	255
]
default_section_focus_rgba = [
	21
	41
	78
	255
]
song_section_preview_ready = 1

script ui_create_select_song_section \{from_in_game = 0}
	if GotParam \{data}
		if StructureContains structure = <data> from_in_game
			from_in_game = (<data>.from_in_game)
		endif
	endif
	pad_back_script = ui_select_song_section_back
	disable_pause
	if (<from_in_game> = 1)
		StartRendering
	else
		UnpauseGame
	endif
	if NOT ($game_mode = practice)
		if (<from_in_game> = 0)
			Change \{came_to_practice_from = main_menu}
		endif
	endif
	GameMode_UpdateNumPlayers \{num_players = 1}
	Menu_Music_Off
	Change \{current_speedfactor = 1.0}
	CreateScreenElement {
		parent = root_window
		type = DescInterface
		id = SongSectionDesc
		desc = 'select_song_section_desc'
		tags = {monitor_spawned = 0 from_in_game = <from_in_game>}
		z_priority = 1
	}
	if SongSectionDesc :Desc_ResolveAlias \{name = alias_diamondBling
			param = diamondBling_id}
		<diamondBling_id> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 100 maxwidth = 200 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if SongSectionDesc :Desc_ResolveAlias \{name = alias_diamondBling2
			param = diamondbling_id2}
		<diamondbling_id2> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 100 maxwidth = 300 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	Change \{song_section_preview_ready = 0}
	SongSectionDesc :Obj_SpawnScript \{ui_select_song_section_wait_for_preview}
	focus2_script = ui_select_song_section_preview
	spawnsongpreview = 0
	if SongSectionDesc :Desc_ResolveAlias \{name = alias_Menu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SE_SetProps {
			allow_wrap = false
			exclusive_device = ($primary_controller)
			event_handlers = [
				{pad_up ui_select_song_section_up}
				{pad_down ui_select_song_section_down}
				{pad_up ui_select_song_section_play_sound params = {up}}
				{pad_down ui_select_song_section_play_sound params = {down}}
				{pad_back <pad_back_script>}
			]
			tags = {
				start_index = -1
				end_index = -1
				max_entries = 0
				menu_idx = -1
			}
		}
		CreateScreenElement {
			parent = current_menu
			type = DescInterface
			desc = 'select_song_section_item_desc'
			autoSizeDims = false
			dims = (600.0, 40.0)
			section_text = qs(0xe1f4baaf)
			section_rgba = $default_section_rgba
			event_handlers = [
				{focus ui_select_song_section_focus_item}
				{focus <focus2_script>}
				{unfocus ui_select_song_section_unfocus_item}
				{pad_choose ui_select_song_section_choose_item params = {from_in_game = <from_in_game>}}
			]
			tags = {playfullsong index = 0 focus_index = 0 strikeout_alpha = 0 default_rgba = $default_section_rgba}
		}
		get_song_section_array
		GetArraySize <song_section_array>
		marker_array_size = <array_size>
		GetFirstPlayer
		GetPlayerInfo <player> part
		if (<marker_array_size> > 0)
			i = 1
			focus_idx = 1
			begin
			ShortenUIString {
				ui_string = ((<song_section_array> [(<i> - 1)]).marker)
				max_len = 50
			}
			if (<short_ui_string> != qs(0x00167369))
				<section_rgba> = $default_section_rgba
				if (<part> = vocals)
					if LocalizedStringEquals a = <short_ui_string> b = $vocal_marker_freeform
						<section_rgba> = $vocal_marker_freeform_rgba
					endif
				endif
				if (<short_ui_string> = qs(0x03ac90f0))
					short_ui_string = qs(0x4db2ad32)
					section_rgba = [64 64 255 255]
				endif
				CreateScreenElement {
					parent = current_menu
					type = DescInterface
					desc = 'select_song_section_item_desc'
					autoSizeDims = false
					dims = (600.0, 40.0)
					section_text = <short_ui_string>
					section_rgba = <section_rgba>
					event_handlers = [
						{focus ui_select_song_section_focus_item}
						{focus <focus2_script>}
						{unfocus ui_select_song_section_unfocus_item}
						{pad_choose ui_select_song_section_choose_item params = {from_in_game = <from_in_game>}}
					]
					tags = {
						index = <i>
						focus_index = <focus_idx>
						default_rgba = <section_rgba>
					}
				}
				focus_idx = (<focus_idx> + 1)
			endif
			i = (<i> + 1)
			repeat <marker_array_size>
		endif
		current_menu :SetTags max_entries = <focus_idx>
	endif
	if GotParam \{selected_index}
		GetScreenElementChildren \{id = current_menu}
		GetArraySize <children>
		ratio = (<selected_index> / (<marker_array_size> - 1.0))
		scroll_pos = ((358.0, -194.0) + ((0.0, 184.0) * <ratio>))
		SongSectionDesc :SE_SetProps Scroll_Thumb_pos = <scroll_pos> time = <time>
	endif
	SongSectionDesc :Obj_SpawnScript \{ui_select_song_section_preview
		params = {
			index = 0
			nowait
		}}
	menu_finish <menu_finish_params>
	current_menu :SetTags \{lead_in = 0}
	current_menu :SetTags \{lead_out = 0}
	ui_select_song_section_setup_helpers
endscript

script ui_select_song_section_setup_helpers 
	SongSectionDesc :GetTags
	current_menu :GetTags
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 1011}
	GameMode_GetType
	if (<type> != career)
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 1011}
	endif
endscript

script ui_select_song_section_up 
	Menu_GetSelectedIndex
	GetSingleTag \{menu_idx}
	SetTags menu_idx = <selected_index>
endscript

script ui_select_song_section_down 
	Menu_GetSelectedIndex
	GetSingleTag \{menu_idx}
	SetTags menu_idx = <selected_index>
endscript

script ui_select_song_section_play_sound 
	current_menu :GetTags
	if GotParam \{up}
		if ($g_sss_highlighted_index > <start_index> && $g_sss_highlighted_index - 1 >= 0)
			Change g_sss_highlighted_index = ($g_sss_highlighted_index - 1)
			generic_menu_up_or_down_sound \{up}
		endif
	else
		if ($g_sss_highlighted_index + 1 < <max_entries>)
			Change g_sss_highlighted_index = ($g_sss_highlighted_index + 1)
			generic_menu_up_or_down_sound \{down}
		endif
	endif
endscript

script ui_destroy_select_song_section 
	spawnscriptnow \{destroy_practice_songpreview_spawned
		params = {
			unloadsong
		}}
	DestroyScreenElement \{id = SongSectionDesc}
	SetSoundBussParams {Vocals_Balance = {vol = ($default_BussSet.Vocals_Balance.vol)}}
	SetSoundBussParams {Drums_Balance = {vol = ($default_BussSet.Drums_Balance.vol)}}
	SetSoundBussParams {Guitar_Balance = {vol = ($default_BussSet.Guitar_Balance.vol)}}
	SetSoundBussParams {Bass_Balance = {vol = ($default_BussSet.Bass_Balance.vol)}}
	SetSoundBussParams {RhythmGTR_Balance = {vol = ($default_BussSet.RhythmGTR_Balance.vol)}}
	SetSoundBussParams {Crowd_Balance = {vol = ($default_BussSet.Crowd_Balance.vol)}}
	SetSoundBussParams {CrowdSingalong_Balance = {vol = ($default_BussSet.CrowdSingalong_Balance.vol)}}
	SetSoundBussParams {Band_Balance = {vol = ($default_BussSet.Band_Balance.vol)}}
	clean_up_user_control_helpers
endscript

script ui_deinit_select_song_section 
endscript

script ui_select_song_section_focus_item \{time = 0.1}
	current_menu :GetTags
	GetTags
	my_strikeout_texture = <strikeout_texture>
	my_strikeout_alpha = <strikeout_alpha>
	highlight_alpha = 1.0
	strikeout_alpha = 0
	GetScreenElementChildren \{id = current_menu}
	GetArraySize <children>
	children_array_size = <array_size>
	current_menu :Menu_GetSelectedIndex
	if (<menu_idx> > <selected_index>)
		if SongSectionDesc :Desc_ResolveAlias \{name = alias_Dropdown_Arrow_Up}
			<resolved_id> :Obj_SpawnScript generic_barrel_menu_do_arrow_pulse
		endif
	elseif (<menu_idx> < <selected_index>)
		if SongSectionDesc :Desc_ResolveAlias \{name = alias_Dropdown_Arrow_Down}
			<resolved_id> :Obj_SpawnScript generic_barrel_menu_do_arrow_pulse
		endif
	endif
	if NOT (<start_index> = -1)
		i = <start_index>
		begin
		if ResolveScreenElementID id = {current_menu child = <i>}
			<resolved_id> :GetSingleTag strikeout_texture
			<resolved_id> :GetSingleTag strikeout_alpha
			<resolved_id> :GetSingleTag default_rgba
			if ((<i> >= <start_index>) && (<i> <= <focus_index>))
				if (<i> = <start_index>)
					<resolved_id> :SE_SetProps {
						section_rgba = $default_section_focus_rgba
						highlight_rgba = [255 , 255 , 255 , 220]
						highlight_alpha = <highlight_alpha>
						strikeout_texture = <strikeout_texture>
						strikeout_alpha = <strikeout_alpha>
					}
				elseif NOT (<i> = <focus_index>)
					<resolved_id> :SE_SetProps {
						section_rgba = $default_section_focus_rgba
						highlight_rgba = [255 255 255 160]
						highlight_alpha = <highlight_alpha>
						strikeout_texture = <strikeout_texture>
						strikeout_alpha = <strikeout_alpha>
					}
				endif
			else
				<resolved_id> :SE_SetProps {
					section_rgba = <default_rgba>
					highlight_rgba = [255 255 255 220]
					highlight_alpha = 0.0
					strikeout_texture = <strikeout_texture>
					strikeout_alpha = <strikeout_alpha>
				}
			endif
		endif
		i = (<i> + 1)
		repeat <children_array_size>
	endif
	if (<children_array_size> > 1)
		ratio = (<focus_index> / (<children_array_size> - 1.0))
	else
		ratio = 0
	endif
	scroll_pos = ((358.0, -194.0) + ((0.0, 184.0) * <ratio>))
	SongSectionDesc :SE_SetProps Scroll_Thumb_pos = <scroll_pos> time = <time>
	SE_SetProps {
		section_rgba = $default_section_focus_rgba
		highlight_rgba = [255 , 255 , 255 , 220]
		highlight_alpha = <highlight_alpha>
		strikeout_texture = <my_strikeout_texture>
		strikeout_alpha = <my_strikeout_alpha>
		time = 0.1
	}
	Obj_GetID
	ExtendCRCWithString checksum = <objID> string = '_particle'
	<objID> :Obj_SpawnScript create_ui_highlight_particles params = {id = <ExtendedChecksum> Pos = (600.0, 0.0) z = 2012}
endscript

script ui_select_song_section_unfocus_item 
	GetSingleTag \{default_rgba}
	SE_SetProps section_rgba = <default_rgba> highlight_alpha = 0.0 time = 0.1
	Obj_GetID
	ExtendCRCWithString checksum = <objID> string = '_particle'
	Destroy2DParticleSystem id = <ExtendedChecksum> kill_when_empty
endscript

script ui_select_song_section_choose_item 
	SE_SetProps \{block_events}
	current_menu :GetTags
	GetTags
	if GotParam \{playfullsong}
		current_menu :SetTags \{start_index = 0}
		current_menu :SetTags \{lead_in = 0}
		current_menu :SetTags \{lead_out = 0}
		current_menu :Obj_SpawnScript ui_select_song_section_set_times params = {playfullsong from_in_game = <from_in_game>}
		return
	endif
	if (<start_index> = -1)
		generic_menu_up_or_down_sound
		current_menu :SetTags start_index = <focus_index>
		Change practice_start_index = <focus_index>
		current_menu :SetTags start_index = <focus_index>
	else
		current_menu :SetTags start_index = (<start_index> - 1)
		current_menu :SetTags end_index = <index>
		current_menu :Obj_SpawnScript ui_select_song_section_set_times params = {from_in_game = <from_in_game>}
	endif
	SongSectionDesc :SE_SetProps \{message_text = qs(0x3da2472b)}
	GetScreenElementChildren \{id = current_menu}
	GetArraySize <children>
	SongSectionDesc :SE_SetProps \{practice_head2_text = qs(0x3da2472b)}
	i = 0
	begin
	if (<i> >= <focus_index>)
		break
	endif
	curr_item = (<children> [<i>])
	<curr_item> :SE_SetProps not_focusable
	i = (<i> + 1)
	repeat <array_size>
	ui_select_song_section_setup_helpers
	SE_SetProps \{unblock_events}
endscript

script ui_select_song_section_back 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	SE_SetProps \{block_events}
	current_menu :GetTags
	SongSectionDesc :GetTags
	if ui_event_exists_in_stack \{name = 'song_breakdown'}
		from_in_game = 0
	endif
	if (<start_index> = -1)
		if (<from_in_game> = 1)
			GameMode_GetType
			if (<type> != career)
				SE_SetProps \{block_events}
				generic_menu_pad_choose_sound
				if NOT ui_event_exists_in_stack \{name = 'select_practice_difficulty'}
					create_loading_screen
				endif
				SongUnload
				destroy_practice_songpreview_spawned
				if ui_event_exists_in_stack \{name = 'select_practice_difficulty'}
					generic_event_back \{state = UIstate_select_practice_difficulty}
				else
					GameMode_GetType
					if (<type> = practice)
						practice_restart_song
					else
						Change \{gameplay_restart_song = 1}
						generic_event_back \{state = uistate_gameplay}
					endif
				endif
			endif
		else
			generic_menu_pad_back_sound
			SongUnload
			SongAudioPlayerDeInit
			destroy_practice_songpreview_spawned
			generic_event_back \{nosound}
		endif
	else
		SongUnload
		SongAudioPlayerDeInit
		generic_menu_up_or_down_sound
		Change \{practice_start_index = -1}
		Change \{practice_end_index = -1}
		generic_event_refresh
	endif
	SE_SetProps \{unblock_events}
endscript

script return_to_quickplay_from_practice 
	reset_practice_mode
	Change \{gameplay_restart_song = 1}
	create_venue_loading_screen movie_params = ($LevelZones.$current_level)
	generic_event_back \{state = uistate_gameplay}
endscript

script ui_select_song_section_set_times \{state = UIstate_practice_select_speed}
	SE_SetProps \{block_events}
	GetTags
	kill_practice_scripts
	GetFirstPlayer
	practice_kill_gem_scroller player = <player>
	get_song_section_array
	GetArraySize <song_section_array>
	if (<array_size> > 0)
		Change practice_start_time = ((<song_section_array> [<start_index>]).time)
		Change practice_start_index = <start_index>
		if ((GotParam playfullsong) || (<end_index> >= <array_size>))
			GetFirstPlayer
			GetPlayerInfo <player> difficulty
			GMan_SongTool_GetCurrentSong
			setup_gemarrays song_name = <current_song> difficulty = <difficulty> player = 1
			SongFileManager func = get_song_end_time song_name = <current_song>
			Change practice_end_time = <total_end_time>
			Change practice_end_index = <array_size>
		else
			Change practice_end_time = ((<song_section_array> [<end_index>]).time - 1)
			Change practice_end_index = <end_index>
		endif
		ResetNonGrayMarkers
		Change practice_start_time = ($practice_start_time - <lead_in>)
		Change practice_end_time = ($practice_end_time + <lead_out>)
	else
		Change \{practice_start_time = 0}
		Change \{practice_end_time = 0}
		Change \{practice_start_index = 0}
		Change \{practice_end_index = 0}
	endif
	SongUnload
	generic_menu_pad_choose_sound
	destroy_practice_songpreview_spawned
	GetFirstPlayer
	GetPlayerInfo <player> part
	if (<part> = vocals)
		ui_event \{event = menu_change
			state = UIstate_practice_select_looping}
	else
		ui_event event = menu_change state = <state>
	endif
endscript

script ui_select_song_section_wait_for_preview 
	Change \{song_section_preview_ready = 0}
	if ScriptIsRunning \{practice_songpreview_monitor}
		unpausespawnedscript \{practice_songpreview_monitor}
		begin
		if ($practice_songpreview_changing = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		killspawnedscript \{name = practice_songpreview_monitor}
		killspawnedscript \{name = practice_songpreview_fadeinandrepeat}
		if NOT ($current_practice_songpreview = None)
			end_song
			SongUnload
			Change \{current_practice_songpreview = None}
		endif
	endif
	Change \{song_section_preview_ready = 1}
endscript

script ui_select_song_section_preview 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if NOT GotParam \{nowait}
		wait \{0.5
			seconds}
	endif
	if IsObjectScript
		GetTags
	endif
	begin
	if ($song_section_preview_ready = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	get_song_section_array
	GetArraySize <song_section_array>
	if (<array_size> > 0)
		if (<index> > 0)
			<index> = (<index> - 1)
			end_index = (<index> + 1)
			if (<end_index> >= <array_size>)
				RemoveParameter \{end_index}
			endif
		endif
		start_time = ((<song_section_array> [<index>]).time)
		GMan_SongTool_GetCurrentSong
		if NOT GotParam \{end_index}
			GetFirstPlayer
			GetPlayerInfo <player> difficulty
			setup_gemarrays song_name = <current_song> difficulty = <difficulty> player = 1
			SongFileManager func = get_song_end_time song_name = <current_song>
			end_time = <total_end_time>
		else
			end_time = ((<song_section_array> [<end_index>]).time + 750)
		endif
		Change target_practice_songpreview = <current_song>
		Change target_practice_songpreview_starttime = <start_time>
		Change target_practice_songpreview_endtime = <end_time>
	endif
	SongSectionDesc :GetTags
	if (<monitor_spawned> = 0)
		Change \{force_practice_songpreview_restart = 1}
		SpawnScript \{practice_songpreview_monitor}
		SongSectionDesc :SetTags \{monitor_spawned = 1}
	endif
endscript
practice_start_index = 0
practice_end_index = 0
target_practice_songpreview = None
target_practice_songpreview_starttime = 0
target_practice_songpreview_endtime = 0
force_practice_songpreview_restart = 0
practice_songpreview_changing = 0
current_practice_songpreview = None
current_practice_songpreview_starttime = 0
current_practice_songpreview_endtime = 0

script GetMarkerArraySize 
	marker_size = 0
	marker_index = 0
	if GlobalExists name = <array> type = array
		GetArraySize $<array>
	else
		GetArraySize <array>
	endif
	if (<array_size> > 0)
		begin
		if GlobalExists name = <array> type = array
			marker = ($<array> [<marker_index>].marker)
		else
			marker = (<array> [<marker_index>].marker)
		endif
		if (<marker> != qs(0x00167369))
			marker_size = (<marker_size> + 1)
		endif
		marker_index = (<marker_index> + 1)
		repeat <array_size>
	endif
	return array_size = <marker_size>
endscript
in_destroy_choose_practice_section_menu = 0

script practice_songpreview_monitor 
	SetScriptCannotPause
	playing_song = 0
	begin
	skip_wait = 0
	if NOT ($current_practice_songpreview = $target_practice_songpreview &&
			$current_practice_songpreview_starttime = $target_practice_songpreview_starttime &&
			$force_practice_songpreview_restart = 0)
		song = ($target_practice_songpreview)
		starttime = ($target_practice_songpreview_starttime)
		endtime = ($target_practice_songpreview_endtime)
		killspawnedscript \{name = practice_songpreview_fadeinandrepeat}
		if (<playing_song> = 1)
			SetSoundBussParams {Vocals_Balance = {vol = (($default_BussSet.Vocals_Balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {Drums_Balance = {vol = (($default_BussSet.Drums_Balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {Guitar_Balance = {vol = (($default_BussSet.Guitar_Balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {Bass_Balance = {vol = (($default_BussSet.Bass_Balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {RhythmGTR_Balance = {vol = (($default_BussSet.RhythmGTR_Balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {Crowd_Balance = {vol = (($default_BussSet.Crowd_Balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {CrowdSingalong_Balance = {vol = (($default_BussSet.CrowdSingalong_Balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {Band_Balance = {vol = (($default_BussSet.Band_Balance.vol) - 100)} time = 0.5}
			wait \{0.5
				second}
		else
			SetSoundBussParams {Vocals_Balance = {vol = (($default_BussSet.Vocals_Balance.vol) - 100)} time = 0}
			SetSoundBussParams {Drums_Balance = {vol = (($default_BussSet.Drums_Balance.vol) - 100)} time = 0}
			SetSoundBussParams {Guitar_Balance = {vol = (($default_BussSet.Guitar_Balance.vol) - 100)} time = 0}
			SetSoundBussParams {Bass_Balance = {vol = (($default_BussSet.Bass_Balance.vol) - 100)} time = 0}
			SetSoundBussParams {RhythmGTR_Balance = {vol = (($default_BussSet.RhythmGTR_Balance.vol) - 100)} time = 0}
			SetSoundBussParams {Crowd_Balance = {vol = (($default_BussSet.Crowd_Balance.vol) - 100)} time = 0}
			SetSoundBussParams {CrowdSingalong_Balance = {vol = (($default_BussSet.CrowdSingalong_Balance.vol) - 100)} time = 0}
			SetSoundBussParams {Band_Balance = {vol = (($default_BussSet.Band_Balance.vol) - 100)} time = 0}
		endif
		Change \{practice_songpreview_changing = 1}
		end_song
		playing_song = 0
		if ($shutdown_game_for_signin_change_flag = 0)
			DeInitSongAudioSystem
			InitSongAudioSystem
			preload_song song_name = <song> starttime = <starttime> fadeintime = 1.0
			Change current_practice_songpreview = <song>
			Change \{force_practice_songpreview_restart = 0}
			Change current_practice_songpreview_starttime = <starttime>
			Change current_practice_songpreview_endtime = <endtime>
			Change \{practice_songpreview_changing = 0}
			if ($current_practice_songpreview = $target_practice_songpreview &&
					$current_practice_songpreview_starttime = $target_practice_songpreview_starttime &&
					$force_practice_songpreview_restart = 0)
				SetSoundBussParams {Vocals_Balance = {vol = (($default_BussSet.Vocals_Balance.vol) - 7)} time = 0.5}
				SetSoundBussParams {Drums_Balance = {vol = (($default_BussSet.Drums_Balance.vol) - 7)} time = 0.5}
				SetSoundBussParams {Guitar_Balance = {vol = (($default_BussSet.Guitar_Balance.vol) - 7)} time = 0.5}
				SetSoundBussParams {Bass_Balance = {vol = (($default_BussSet.Bass_Balance.vol) - 7)} time = 0.5}
				SetSoundBussParams {RhythmGTR_Balance = {vol = (($default_BussSet.RhythmGTR_Balance.vol) - 7)} time = 0.5}
				SetSoundBussParams {Crowd_Balance = {vol = (($default_BussSet.Crowd_Balance.vol) - 100)} time = 0.5}
				SetSoundBussParams {CrowdSingalong_Balance = {vol = (($default_BussSet.CrowdSingalong_Balance.vol) - 100)} time = 0.5}
				SetSoundBussParams {Band_Balance = {vol = (($default_BussSet.Band_Balance.vol) - 7)} time = 0.5}
				begin_song
				playing_song = 1
				if IsObjectScript
					Obj_SpawnScript \{practice_songpreview_fadeinandrepeat}
				else
					spawnscriptnow \{practice_songpreview_fadeinandrepeat}
				endif
			else
				skip_wait = 1
			endif
		endif
	endif
	if (<skip_wait> = 0)
		wait \{1
			gameframe}
	endif
	repeat
endscript

script practice_songpreview_fadeinandrepeat 
	wait_time = 0
	begin
	current_wait_time = (($target_practice_songpreview_endtime - $target_practice_songpreview_starttime) / 1000.0)
	if (<wait_time> > <current_wait_time>)
		break
	endif
	wait \{0.5
		seconds}
	wait_time = (<wait_time> + 0.5)
	repeat
	Change \{force_practice_songpreview_restart = 1}
endscript

script destroy_practice_songpreview_spawned 
	SetScriptCannotPause
	if GotParam \{unloadsong}
		SongUnload
	endif
	killspawnedscript \{name = ui_select_song_section_preview}
	if ScriptIsRunning \{practice_songpreview_monitor}
		unpausespawnedscript \{practice_songpreview_monitor}
		begin
		if ($practice_songpreview_changing = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		killspawnedscript \{name = practice_songpreview_monitor}
		killspawnedscript \{name = practice_songpreview_fadeinandrepeat}
		if NOT ($current_practice_songpreview = None)
			end_song
			Change \{current_practice_songpreview = None}
		endif
	endif
endscript
