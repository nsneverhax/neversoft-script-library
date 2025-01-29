g_sss_highlighted_index = 0
default_section_rgba = [
	64
	64
	64
	255
]
default_section_focus_rgba = gh5_blue_xdk

script ui_init_select_song_section 
	0xfd22d1e7 \{num = 1}
	Change menu_flow_locked = ($menu_flow_locked + 1)
	disable_pause
	UnPauseGame
	if NOT ($game_mode = practice)
		if GotParam \{from_in_game}
			Change \{practice_enabled = 1}
			Change came_to_practice_from = ($game_mode)
			if NOT ($current_progression_flag = None)
				Change came_to_practice_from_progression = ($current_progression_flag)
			endif
			getplayerinfo \{1
				character_id}
			if NOT (<character_id> = emptyguy)
				Change came_to_practice_character_id = <character_id>
				setplayerinfo \{1
					character_id = emptyguy}
			endif
			Change \{game_mode = practice}
			destroy_loading_screen
			StartRendering
		else
			Change \{came_to_practice_from = main_menu}
		endif
	endif
	Change \{current_num_players = 1}
	gamemode_updatenumplayers \{num_players = 1}
	destroy_loading_screen
	menu_music_off
endscript

script ui_create_select_song_section 
	Change \{current_speedfactor = 1.0}
	if ScriptIsRunning \{destroy_practice_songpreview_spawned}
		KillSpawnedScript \{Name = destroy_practice_songpreview_spawned}
	endif
	0xce69e479
	load_songqpak song_name = ($current_song) async = 0
	CreateScreenElement \{parent = root_window
		Type = descinterface
		id = songsectiondesc
		desc = 'setlist_b_practice_sessions_desc'}
	focus2_script = ui_select_song_section_preview
	spawnsongpreview = 0
	if songsectiondesc :desc_resolvealias \{Name = alias_menu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops {
			allow_wrap = FALSE
			exclusive_device = ($primary_controller)
			event_handlers = [
				{pad_up ui_select_song_section_play_sound params = {up}}
				{pad_down ui_select_song_section_play_sound params = {down}}
				{pad_back ui_select_song_section_back}
			]
			tags = {
				start_index = -1
				end_index = -1
			}
		}
		CreateScreenElement {
			parent = current_menu
			Type = descinterface
			desc = 'setlist_b_practice_sessions_item_desc'
			autosizedims = FALSE
			dims = (760.0, 42.0)
			section_text = qs(0xe1f4baaf)
			section_rgba = $default_section_rgba
			event_handlers = [
				{focus ui_select_song_section_focus_item}
				{focus <focus2_script>}
				{unfocus ui_select_song_section_unfocus_item}
				{pad_choose ui_select_song_section_choose_item}
			]
			tags = {playfullsong index = 0 strikeout_alpha = 0 default_rgba = $default_section_rgba}
		}
		if (<spawnsongpreview> = 1)
			<id> :obj_spawnscript ui_select_song_section_preview
		endif
		get_song_section_array
		GetArraySize <song_section_array>
		marker_array_size = <array_Size>
		getplayerinfo \{1
			part}
		if (<marker_array_size> > 0)
			i = 1
			0x50a3e63c = 1
			begin
			shortenuistring {
				ui_string = ((<song_section_array> [(<i> - 1)]).marker)
				max_len = 50
			}
			if (<short_ui_string> != qs(0x03ac90f0))
				GetRandomValue \{a = 1
					b = 2
					Name = rand_int
					integer}
				formatText checksumName = strikeout_texture 'strike_0%d' d = <rand_int>
				strikeout_alpha = 0
				<section_rgba> = $default_section_rgba
				CreateScreenElement {
					parent = current_menu
					Type = descinterface
					desc = 'setlist_b_practice_sessions_item_desc'
					autosizedims = FALSE
					dims = (760.0, 42.0)
					section_text = <short_ui_string>
					section_rgba = <section_rgba>
					event_handlers = [
						{focus ui_select_song_section_focus_item}
						{focus <focus2_script>}
						{unfocus ui_select_song_section_unfocus_item}
						{pad_choose ui_select_song_section_choose_item}
					]
					strikeout_texture = <strikeout_texture>
					strikeout_alpha = <strikeout_alpha>
					tags = {
						index = <0x50a3e63c>
						strikeout_texture = <strikeout_texture>
						strikeout_alpha = <strikeout_alpha>
						default_rgba = <section_rgba>
					}
				}
				0x50a3e63c = (<0x50a3e63c> + 1)
			endif
			i = (<i> + 1)
			repeat <marker_array_size>
		endif
	endif
	if GotParam \{selected_index}
		GetScreenElementChildren \{id = current_menu}
		GetArraySize <children>
		ratio = (<selected_index> / (<marker_array_size> - 1.0))
		scroll_pos = ((358.0, -174.0) + ((0.0, 184.0) * <ratio>))
		songsectiondesc :se_setprops scroll_thumb_pos = <scroll_pos> time = <time>
	endif
	ui_select_song_section_preview \{index = 0
		noWait}
	menu_finish
	current_menu :SetTags \{lead_in = 0}
	current_menu :SetTags \{lead_out = 0}
	SpawnScriptNow \{0x720e0033}
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script 0x720e0033 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	Wait \{20
		gameframes}
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_select_song_section_play_sound 
	get_song_section_array
	GetArraySize <song_section_array>
	if GotParam \{up}
		Change g_sss_highlighted_index = ($g_sss_highlighted_index - 1)
		if ($g_sss_highlighted_index < 0)
			Change \{g_sss_highlighted_index = 0}
		else
			generic_menu_up_or_down_sound \{up}
		endif
	else
		Change g_sss_highlighted_index = ($g_sss_highlighted_index + 1)
		if ($g_sss_highlighted_index > <array_Size>)
			Change g_sss_highlighted_index = ($g_sss_highlighted_index - 1)
		else
			generic_menu_up_or_down_sound \{down}
		endif
	endif
endscript

script ui_destroy_select_song_section 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	Change \{0xe6376e68 = 0}
	DestroyScreenElement \{id = songsectiondesc}
	setsoundbussparams {leadvox_balance = {vol = ($default_BussSet.leadvox_balance.vol)}}
	setsoundbussparams {drums_balance = {vol = ($default_BussSet.drums_balance.vol)}}
	setsoundbussparams {leadgtr_balance = {vol = ($default_BussSet.leadgtr_balance.vol)}}
	setsoundbussparams {bass_balance = {vol = ($default_BussSet.bass_balance.vol)}}
	setsoundbussparams {rhythmgtr_balance = {vol = ($default_BussSet.rhythmgtr_balance.vol)}}
	setsoundbussparams {crowd_balance = {vol = ($default_BussSet.crowd_balance.vol)}}
	setsoundbussparams {crowdsingalong_balance = {vol = ($default_BussSet.crowdsingalong_balance.vol)}}
	setsoundbussparams {band_Balance = {vol = ($default_BussSet.band_Balance.vol)}}
	clean_up_user_control_helpers
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_deinit_select_song_section 
	0x88e84c31
	Change menu_flow_locked = ($menu_flow_locked + 1)
	SpawnScriptNow \{end_practice_song}
	unload_songqpak
	Change menu_flow_locked = ($menu_flow_locked - 1)
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
	children_array_size = <array_Size>
	if NOT (<start_index> = -1)
		i = <start_index>
		begin
		if ResolveScreenElementID id = {current_menu child = <i>}
			<resolved_id> :GetSingleTag strikeout_texture
			<resolved_id> :GetSingleTag strikeout_alpha
			<resolved_id> :GetSingleTag default_rgba
			if ((<i> >= <start_index>) && (<i> <= <index>))

				if (<i> = <start_index>)
					<resolved_id> :se_setprops {
						section_rgba = $default_section_focus_rgba
						highlight_rgba = [255 , 255 , 255 , 220]
						highlight_alpha = <highlight_alpha>
						strikeout_texture = <strikeout_texture>
						strikeout_alpha = <strikeout_alpha>
					}
				elseif NOT (<i> = <index>)

					<resolved_id> :se_setprops {
						section_rgba = $default_section_focus_rgba
						highlight_rgba = [255 255 255 160]
						highlight_alpha = <highlight_alpha>
						strikeout_texture = <strikeout_texture>
						strikeout_alpha = <strikeout_alpha>
					}
				endif
			else
				<resolved_id> :se_setprops {
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
	if (<children_array_size> > 1.0)
		ratio = (<index> / (<children_array_size> - 1.0))
	else
		ratio = 0
	endif
	scroll_pos = ((358.0, -174.0) + ((0.0, 184.0) * <ratio>))
	songsectiondesc :se_setprops scroll_thumb_pos = <scroll_pos> time = <time>
	se_setprops {
		section_rgba = $default_section_focus_rgba
		highlight_rgba = [255 , 255 , 255 , 220]
		highlight_alpha = <highlight_alpha>
		strikeout_texture = <my_strikeout_texture>
		strikeout_alpha = <my_strikeout_alpha>
		time = 0.1
	}
endscript

script ui_select_song_section_unfocus_item 
	GetSingleTag \{default_rgba}
	se_setprops section_rgba = <default_rgba> highlight_alpha = 0.0 time = 0.1
endscript

script ui_select_song_section_choose_item 
	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	current_menu :GetTags
	GetTags
	if GotParam \{playfullsong}
		current_menu :SetTags \{start_index = 0}
		current_menu :SetTags \{lead_in = 0}
		current_menu :SetTags \{lead_out = 0}
		params = {playfullsong}
		current_menu :obj_spawnscript ui_select_song_section_set_times params = {<params>}
		return
	endif
	if (<start_index> = -1)
		generic_menu_up_or_down_sound
		current_menu :SetTags start_index = <index>
	else
		current_menu :SetTags start_index = (<start_index> - 1)
		current_menu :SetTags end_index = <index>
		current_menu :obj_spawnscript \{ui_select_song_section_set_times}
	endif
	songsectiondesc :se_setprops \{message_text = qs(0x3da2472b)}
	GetScreenElementChildren \{id = current_menu}
	GetArraySize <children>
	i = 0
	begin
	if (<i> >= <index>)
		break
	endif
	curr_item = (<children> [<i>])
	<curr_item> :se_setprops not_focusable
	i = (<i> + 1)
	repeat <array_Size>
endscript

script ui_select_song_section_back 
	current_menu :GetTags
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	if ($practice_songpreview_changing = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	songunload
	begin
	GetContentFolderState
	if (<contentfolderstate> = free)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if (<start_index> = -1)
		if ($came_to_practice_from != main_menu)
			generic_menu_pad_back_sound
			if ($came_to_practice_from = p1_quickplay)
				return_to_quickplay_from_practice
			else
				ui_win_song_continue_next_menu \{for_practice = 1}
			endif
		else
			if ui_event_exists_in_stack \{Name = 'practice_select_difficulty'}
				create_loading_screen
				Wait \{3
					gameframes}
			endif
			generic_event_back
		endif
	else
		generic_menu_up_or_down_sound
		Change \{practice_start_index = -1}
		Change \{practice_end_index = -1}
		generic_event_refresh
	endif
endscript

script return_to_quickplay_from_practice 
	create_loading_screen
	Change \{practice_enabled = 0}
	Change game_mode = ($came_to_practice_from)
	if NOT ($came_to_practice_from_progression = None)
		Change current_progression_flag = ($came_to_practice_from_progression)
	endif
	if NOT ($came_to_practice_character_id = emptyguy)
		setplayerinfo 1 character_id = ($came_to_practice_character_id)
	endif
	Change \{gameplay_restart_song = 1}
	destroy_band
	ui_event_wait_for_safe
	ui_event_block \{event = menu_back
		data = {
			state = Uistate_gameplay
		}}
	if ui_event_exists_in_stack \{Name = 'practice_warning'}
		ui_event_block \{event = menu_back
			data = {
				state = uistate_practice_warning
			}}
		ui_event_block \{event = menu_back
			data = {
				state = Uistate_gameplay
			}}
	endif
	generic_event_replace state = uistate_play_song no_sound data = {selected_level = ($practice_return_venue) can_change_level = 0}
endscript

script ui_select_song_section_set_times \{state = uistate_practice_select_speed}
	se_setprops \{block_events}
	GetTags
	get_song_section_array
	GetArraySize <song_section_array>
	if (<array_Size> > 0)
		Change practice_start_time = ((<song_section_array> [<start_index>]).time)
		Change practice_start_index = <start_index>
		if ((GotParam playfullsong) || (<end_index> >= <array_Size>))
			setup_gemarrays song_name = ($current_song) difficulty = ($player1_status.difficulty) player_status = player1_status
			get_song_end_time song = ($current_song) for_practice = 1
			Change practice_end_time = <total_end_time>
			Change practice_end_index = <array_Size>
		else
			Change practice_end_time = ((<song_section_array> [<end_index>]).time - 1)
			Change practice_end_index = <end_index>
		endif
		if GotParam \{playfullsong}
			resetnongraymarkers
		else
			resetnongraymarkers
		endif
		Change practice_start_time = ($practice_start_time - <lead_in>)
		Change practice_end_time = ($practice_end_time + <lead_out>)
	else
		Change \{practice_start_time = 0}
		Change \{practice_end_time = 0}
		Change \{practice_start_index = 0}
		Change \{practice_end_index = 0}
	endif
	getplayerinfo \{1
		part}
	if (<part> = vocals)
		<state> = uistate_play_song
	endif
	generic_event_choose state = <state>
endscript

script ui_select_song_section_preview \{extras = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if NOT ($0x4026c71d = 1)
		Change \{force_practice_songpreview_restart = 1}
		Change \{0x4026c71d = 1}
	endif
	if NOT GotParam \{noWait}
		Wait \{0.5
			Seconds}
	endif
	if IsObjectScript
		GetTags
	endif
	get_song_end_time song = ($current_song) for_practice = 1
	Change target_practice_songpreview = ($current_song)
	Change \{target_practice_songpreview_starttime = 0}
	Change target_practice_songpreview_endtime = <total_end_time>
	Change \{0x4026c71d = 0}
	get_song_section_array
	GetArraySize <song_section_array>
	if (<array_Size> > 0)
		if (<index> > 0)
			<index> = (<index> - 1)
			end_index = (<index> + 1)
			if (<end_index> >= <array_Size>)
				RemoveParameter \{end_index}
			endif
		endif
		start_time = ((<song_section_array> [<index>]).time)
		if NOT GotParam \{end_index}
			setup_gemarrays song_name = ($current_song) difficulty = ($player1_status.difficulty) player_status = player1_status
			end_time = <total_end_time>
		else
			end_time = ((<song_section_array> [<end_index>]).time + 750)
		endif
		if (<extras> = 1)
			end_time = <total_end_time>
		endif
		Change target_practice_songpreview = ($current_song)
		Change target_practice_songpreview_starttime = <start_time>
		Change target_practice_songpreview_endtime = <end_time>
	endif
	if NOT IsObjectScript
		Change \{force_practice_songpreview_restart = 1}
		spawnscript practice_songpreview_monitor params = {extras = <extras>}
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
0x4026c71d = 0
in_destroy_choose_practice_section_menu = 0
0xe6376e68 = 1

script practice_songpreview_monitor 
	setscriptcannotpause
	Change \{0xe6376e68 = 1}
	setsoundbussparams {leadvox_balance = {vol = (($default_BussSet.leadvox_balance.vol) - 9)} time = 1}
	setsoundbussparams {drums_balance = {vol = (($default_BussSet.drums_balance.vol) - 9)} time = 1}
	setsoundbussparams {leadgtr_balance = {vol = (($default_BussSet.leadgtr_balance.vol) - 9)} time = 1}
	setsoundbussparams {bass_balance = {vol = (($default_BussSet.bass_balance.vol) - 9)} time = 1}
	setsoundbussparams {rhythmgtr_balance = {vol = (($default_BussSet.rhythmgtr_balance.vol) - 9)} time = 1}
	setsoundbussparams {crowd_balance = {vol = (($default_BussSet.crowd_balance.vol) - 100)} time = 1}
	setsoundbussparams {crowdsingalong_balance = {vol = (($default_BussSet.crowdsingalong_balance.vol) - 100)} time = 1}
	setsoundbussparams {band_Balance = {vol = (($default_BussSet.band_Balance.vol) - 9)} time = 1}
	playing_song = 0
	begin
	skip_wait = 0
	if NOT ($current_practice_songpreview = $target_practice_songpreview &&
			$current_practice_songpreview_starttime = $target_practice_songpreview_starttime &&
			$force_practice_songpreview_restart = 0)
		song = ($target_practice_songpreview)
		starttime = ($target_practice_songpreview_starttime)
		endtime = ($target_practice_songpreview_endtime)
		KillSpawnedScript \{Name = practice_songpreview_fadeinandrepeat}
		0xdcc8a36f time = <starttime> 0xa5522a7f = FALSE
		<starttime> = <adjustedtime>
		Change target_practice_songpreview_starttime = <adjustedtime>
		Change \{practice_songpreview_changing = 1}
		end_song
		playing_song = 0
		if ($shutdown_game_for_signin_change_flag = 0 &&
				$0x4026c71d = 0 &&
				$0xe6376e68 = 1)
			songunload
			preload_song song_name = <song> starttime = <starttime>
			Change current_practice_songpreview = <song>
			Change \{force_practice_songpreview_restart = 0}
			Change current_practice_songpreview_starttime = <starttime>
			Change current_practice_songpreview_endtime = <endtime>
			Change \{practice_songpreview_changing = 0}
			if ($current_practice_songpreview = $target_practice_songpreview &&
					$current_practice_songpreview_starttime = $target_practice_songpreview_starttime &&
					$force_practice_songpreview_restart = 0 &&
					$0xe6376e68 = 1)
				begin_song
				playing_song = 1
				SpawnScriptNow \{practice_songpreview_fadeinandrepeat}
			else
				skip_wait = 1
			endif
		endif
	endif
	if ($0xe6376e68 = 0)
		break
	endif
	if (<skip_wait> = 0)
		WaitOneGameFrame
	endif
	repeat
	KillSpawnedScript \{Name = practice_songpreview_fadeinandrepeat}
	if (<playing_song> = 1)
		end_song
	endif
	songunload
endscript

script practice_songpreview_fadeinandrepeat 
	current_time = $target_practice_songpreview_starttime
	end_time = $target_practice_songpreview_endtime
	begin
	Wait \{0.1
		Seconds}
	current_time = (<current_time> + 100)
	if (<current_time> >= <end_time>)
		break
	endif
	repeat
	Change \{force_practice_songpreview_restart = 1}
endscript

script destroy_practice_songpreview_spawned 
	setscriptcannotpause
	unpausespawnedscript \{practice_songpreview_monitor}
	Change \{0x4026c71d = 0}
	begin
	if ($practice_songpreview_changing = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	KillSpawnedScript \{Name = practice_songpreview_monitor}
	KillSpawnedScript \{Name = practice_songpreview_fadeinandrepeat}
	if NOT ($current_practice_songpreview = None)
		end_song
	endif
endscript
