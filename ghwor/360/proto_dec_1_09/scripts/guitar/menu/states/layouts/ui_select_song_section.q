g_sss_highlighted_index = 0
default_section_rgba = [
	100
	100
	100
	255
]
default_section_focus_rgba = [
	216
	181
	117
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
		UnPauseGame
	endif
	if NOT ($game_mode = practice)
		if (<from_in_game> = 0)
			Change \{came_to_practice_from = main_menu}
		endif
	endif
	audio_ui_menu_music_off
	end_practice_song_slomo
	CreateScreenElement {
		parent = root_window
		Type = descinterface
		id = songsectiondesc
		desc = 'select_song_section_desc'
		tags = {monitor_spawned = 0 from_in_game = <from_in_game>}
		z_priority = 10000
	}
	Change \{song_section_preview_ready = 0}
	songsectiondesc :obj_spawnscript \{ui_select_song_section_wait_for_preview}
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
				{pad_back <pad_back_script>}
			]
			tags = {
				start_index = -1
				end_index = -1
				max_entries = 0
			}
		}
		CreateScreenElement {
			parent = current_menu
			Type = descinterface
			desc = 'select_song_section_item_desc'
			autosizedims = FALSE
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
		marker_array_size = <array_Size>
		getfirstplayer
		getplayerinfo <Player> part
		if (<marker_array_size> > 0)
			i = 1
			focus_idx = 1
			begin
			shortenuistring {
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
					Type = descinterface
					desc = 'select_song_section_item_desc'
					autosizedims = FALSE
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
		songsectiondesc :se_setprops scroll_thumb_pos = <scroll_pos> time = <time>
	endif
	songsectiondesc :obj_spawnscript \{ui_select_song_section_preview
		params = {
			index = 0
			noWait
		}}
	menu_finish <menu_finish_params>
	current_menu :SetTags \{lead_in = 0}
	current_menu :SetTags \{lead_out = 0}
	ui_select_song_section_setup_helpers
endscript

script ui_select_song_section_setup_helpers 
	songsectiondesc :GetTags
	current_menu :GetTags
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green}
	gamemode_gettype
	if (<Type> != career)
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red}
	endif
endscript

script ui_select_song_section_play_sound 
	current_menu :GetTags
	if GotParam \{up}
		if ($g_sss_highlighted_index - 1 >= 0)
			Change g_sss_highlighted_index = ($g_sss_highlighted_index - 1)
			ui_sfx \{menustate = Generic
				uitype = scrollup}
		endif
	else
		if ($g_sss_highlighted_index + 1 < <max_entries>)
			Change g_sss_highlighted_index = ($g_sss_highlighted_index + 1)
			ui_sfx \{menustate = Generic
				uitype = scrolldown}
		endif
	endif
endscript

script ui_destroy_select_song_section 
	SpawnScriptNow \{destroy_practice_songpreview_spawned
		params = {
			unloadsong
		}}
	DestroyScreenElement \{id = songsectiondesc}
	setsoundbussparams {vocals_balance = {vol = ($default_BussSet.vocals_balance.vol)}}
	setsoundbussparams {drums_balance = {vol = ($default_BussSet.drums_balance.vol)}}
	setsoundbussparams {Guitar_Balance = {vol = ($default_BussSet.Guitar_Balance.vol)}}
	setsoundbussparams {bass_balance = {vol = ($default_BussSet.bass_balance.vol)}}
	setsoundbussparams {rhythmgtr_balance = {vol = ($default_BussSet.rhythmgtr_balance.vol)}}
	setsoundbussparams {crowd_balance = {vol = ($default_BussSet.crowd_balance.vol)}}
	setsoundbussparams {crowdsingalong_balance = {vol = ($default_BussSet.crowdsingalong_balance.vol)}}
	setsoundbussparams {band_Balance = {vol = ($default_BussSet.band_Balance.vol)}}
	clean_up_user_control_helpers
endscript

script ui_deinit_select_song_section 
endscript

script ui_select_song_section_focus_item \{time = 0.1}
	current_menu :GetTags
	GetTags
	my_strikeout_texture = <strikeout_texture>
	my_strikeout_alpha = <strikeout_alpha>
	light_bar_alpha = 1.0
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
			if ((<i> >= <start_index>) && (<i> <= <focus_index>))
				if (<i> = <start_index>)
					<resolved_id> :se_setprops {
						section_rgba = $default_section_focus_rgba
						light_bar_rgba = [255 , 255 , 255 , 220]
						light_bar_alpha = <light_bar_alpha>
						strikeout_texture = <strikeout_texture>
						strikeout_alpha = <strikeout_alpha>
					}
				elseif NOT (<i> = <focus_index>)
					<resolved_id> :se_setprops {
						section_rgba = $default_section_focus_rgba
						light_bar_rgba = [255 255 255 80]
						light_bar_alpha = <light_bar_alpha>
						strikeout_texture = <strikeout_texture>
						strikeout_alpha = <strikeout_alpha>
					}
				endif
			else
				<resolved_id> :se_setprops {
					section_rgba = <default_rgba>
					light_bar_rgba = [255 255 255 220]
					light_bar_alpha = 0.0
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
	songsectiondesc :se_setprops scroll_thumb_pos = <scroll_pos> time = <time>
	se_setprops {
		section_rgba = $default_section_focus_rgba
		highlight_rgba = [255 , 255 , 255 , 220]
		light_bar_alpha = <light_bar_alpha>
		strikeout_texture = <my_strikeout_texture>
		strikeout_alpha = <my_strikeout_alpha>
		time = 0.1
	}
endscript

script ui_select_song_section_unfocus_item 
	GetSingleTag \{default_rgba}
	se_setprops section_rgba = <default_rgba> light_bar_alpha = 0.0 time = 0.1
endscript

script ui_select_song_section_choose_item 
	se_setprops \{block_events}
	current_menu :GetTags
	GetTags
	if GotParam \{playfullsong}
		current_menu :SetTags \{start_index = 0}
		current_menu :SetTags \{lead_in = 0}
		current_menu :SetTags \{lead_out = 0}
		current_menu :obj_spawnscript ui_select_song_section_set_times params = {playfullsong from_in_game = <from_in_game>}
		return
	endif
	if (<start_index> = -1)
		ui_sfx \{menustate = setlist
			uitype = scrollup}
		current_menu :SetTags start_index = <focus_index>
		Change practice_start_index = <focus_index>
		current_menu :SetTags start_index = <focus_index>
	else
		current_menu :SetTags start_index = (<start_index> - 1)
		current_menu :SetTags end_index = <index>
		current_menu :obj_spawnscript ui_select_song_section_set_times params = {from_in_game = <from_in_game>}
	endif
	songsectiondesc :se_setprops \{message_text = qs(0x3da2472b)}
	GetScreenElementChildren \{id = current_menu}
	GetArraySize <children>
	songsectiondesc :se_setprops \{practice_head2_text = qs(0x3da2472b)}
	i = 0
	begin
	if (<i> >= <focus_index>)
		break
	endif
	curr_item = (<children> [<i>])
	<curr_item> :se_setprops not_focusable
	i = (<i> + 1)
	repeat <array_Size>
	ui_select_song_section_setup_helpers
	se_setprops \{unblock_events}
endscript

script ui_select_song_section_back 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	se_setprops \{block_events}
	current_menu :GetTags
	songsectiondesc :GetTags
	if ui_event_exists_in_stack \{Name = 'song_breakdown'}
		from_in_game = 0
	endif
	if (<start_index> = -1)
		if (<from_in_game> = 1)
			gamemode_gettype
			if (<Type> != career)
				se_setprops \{block_events}
				ui_sfx \{menustate = Generic
					uitype = select}
				if NOT ui_event_exists_in_stack \{Name = 'select_practice_difficulty'}
					create_loading_screen
				endif
				sap_unload \{noWait}
				destroy_practice_songpreview_spawned
				if ui_event_exists_in_stack \{Name = 'select_practice_difficulty'}
					ui_sfx \{menustate = Generic
						uitype = back}
					generic_event_back \{state = uistate_select_practice_difficulty}
				else
					gamemode_gettype
					if (<Type> = practice)
						practice_restart_song
					else
						ui_sfx \{menustate = Generic
							uitype = select}
						Change \{gameplay_restart_song = 1}
						generic_event_back \{state = Uistate_gameplay}
					endif
				endif
			endif
		else
			ui_sfx \{menustate = Generic
				uitype = back}
			sap_unload \{noWait}
			sap_deinit \{noWait}
			destroy_practice_songpreview_spawned
			generic_event_back \{nosound}
		endif
	else
		sap_unload \{noWait}
		sap_deinit \{noWait}
		ui_sfx \{menustate = setlist
			uitype = scrollup}
		Change \{practice_start_index = -1}
		Change \{practice_end_index = -1}
		generic_event_refresh
	endif
	se_setprops \{unblock_events}
endscript

script return_to_quickplay_from_practice 
	ui_sfx \{menustate = Generic
		uitype = select}
	reset_practice_mode
	shut_down_practice_mode
	Change \{gameplay_restart_song = 1}
	create_venue_loading_screen movie_params = ($LevelZones.$current_level)
	generic_event_back \{state = Uistate_gameplay}
endscript

script ui_select_song_section_set_times \{state = uistate_practice_select_speed}
	se_setprops \{block_events}
	GetTags
	kill_practice_scripts
	getfirstplayer
	practice_kill_gem_scroller Player = <Player>
	get_song_section_array
	GetArraySize <song_section_array>
	if (<array_Size> > 0)
		Change practice_start_time = ((<song_section_array> [<start_index>]).time)
		Change practice_start_index = <start_index>
		if ((GotParam playfullsong) || (<end_index> >= <array_Size>))
			getfirstplayer
			getplayerinfo <Player> difficulty
			playlist_getcurrentsong
			setup_gemarrays song_name = <current_song> difficulty = <difficulty> Player = 1
			songfilemanager func = get_song_end_time song_name = <current_song>
			Change practice_end_time = <total_end_time>
			Change practice_end_index = <array_Size>
		else
			Change practice_end_time = ((<song_section_array> [<end_index>]).time - 1)
			Change practice_end_index = <end_index>
		endif
		Change practice_start_time = ($practice_start_time - <lead_in>)
		Change practice_end_time = ($practice_end_time + <lead_out>)
	else
		Change \{practice_start_time = 0}
		Change \{practice_end_time = 0}
		Change \{practice_start_index = 0}
		Change \{practice_end_index = 0}
	endif
	sap_unload \{noWait}
	sap_deinit \{noWait}
	ui_sfx \{menustate = Generic
		uitype = select}
	destroy_practice_songpreview_spawned
	getfirstplayer
	getplayerinfo <Player> part
	if (<part> = vocals)
		ui_event \{event = menu_change
			state = uistate_practice_select_looping}
	else
		ui_event event = menu_change state = <state>
	endif
endscript

script ui_select_song_section_wait_for_preview 
	Change \{song_section_preview_ready = 0}
	if ScriptIsRunning \{practice_songpreview_monitor}
		unpausespawnedscript \{practice_songpreview_monitor}
		KillSpawnedScript \{Name = practice_songpreview_monitor}
		KillSpawnedScript \{Name = practice_songpreview_fadeinandrepeat}
		sap_unload \{noWait}
		sap_deinit \{noWait}
	endif
	Change \{song_section_preview_ready = 1}
endscript

script ui_select_song_section_preview 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if NOT GotParam \{noWait}
		Wait \{0.5
			Seconds}
	endif
	if IsObjectScript
		GetTags
	endif
	begin
	if ($song_section_preview_ready = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
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
		playlist_getcurrentsong
		if NOT GotParam \{end_index}
			getfirstplayer
			getplayerinfo <Player> difficulty
			setup_gemarrays song_name = <current_song> difficulty = <difficulty> Player = 1
			songfilemanager func = get_song_end_time song_name = <current_song>
			end_time = <total_end_time>
		else
			end_time = ((<song_section_array> [<end_index>]).time + 750)
		endif
		Change target_practice_songpreview = <current_song>
		Change target_practice_songpreview_starttime = <start_time>
		Change target_practice_songpreview_endtime = <end_time>
	endif
	songsectiondesc :GetTags
	if (<monitor_spawned> = 0)
		Change \{force_practice_songpreview_restart = 1}
		spawnscript \{practice_songpreview_monitor}
		songsectiondesc :SetTags \{monitor_spawned = 1}
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

script getmarkerarraysize 
	marker_size = 0
	marker_index = 0
	if GlobalExists Name = <array> Type = array
		GetArraySize $<array>
	else
		GetArraySize <array>
	endif
	if (<array_Size> > 0)
		begin
		if GlobalExists Name = <array> Type = array
			marker = ($<array> [<marker_index>].marker)
		else
			marker = (<array> [<marker_index>].marker)
		endif
		if (<marker> != qs(0x00167369))
			marker_size = (<marker_size> + 1)
		endif
		marker_index = (<marker_index> + 1)
		repeat <array_Size>
	endif
	return array_Size = <marker_size>
endscript
in_destroy_choose_practice_section_menu = 0
practice_songpreview_playing_song = 0

script practice_songpreview_monitor 
	setscriptcannotpause
	Change \{practice_songpreview_playing_song = 0}
	begin
	new_song = ($current_practice_songpreview != $target_practice_songpreview)
	new_seektime = ($current_practice_songpreview_starttime != $target_practice_songpreview_starttime)
	if (<new_song> && $practice_songpreview_changing = 0)
		song = ($target_practice_songpreview)
		KillSpawnedScript \{Name = practice_songpreview_fadeinandrepeat}
		Change \{practice_songpreview_changing = 1}
		if ($practice_songpreview_playing_song = 1)
			fade_time = 0.5
		else
			fade_time = 0.0
		endif
		sap_setmastervolume vol = -100 time = <fade_time>
		Wait <fade_time> Second
		if NOT ($current_practice_songpreview = $target_practice_songpreview)
			Change \{practice_songpreview_playing_song = 0}
			sap_stop
			sap_unload \{noWait}
			if ($shutdown_game_for_signin_change_flag = 0)
				getsongaudioinfo song_name = <song>
				get_song_encryption_type song_name = <song>
				sap_init mode = ($game_mode) speed = ($current_speedfactor)
				sap_load FileName = <song_stream_name> slot = <slot> vol = <song_volume> encryption_type = <encryption_type> callback = 0x4a564fa9
				Change current_practice_songpreview = <song>
				Change \{force_practice_songpreview_restart = 0}
			endif
		endif
	elseif ((<new_seektime> || $force_practice_songpreview_restart = 1)
			&& $practice_songpreview_changing = 0)
		Change \{practice_songpreview_changing = 1}
		KillSpawnedScript \{Name = practice_songpreview_fadeinandrepeat}
		if ($practice_songpreview_playing_song = 1)
			fade_time = 0.5
		else
			fade_time = 0.0
		endif
		sap_setmastervolume vol = -100 time = <fade_time>
		Wait <fade_time> Second
		sap_pause
		sap_seek time = ($target_practice_songpreview_starttime) callback = 0xbb685523
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script 0x4a564fa9 
	printf \{qs(0xb0e3c30c)}
	Change \{practice_songpreview_changing = 0}
	if (<song_command_success> = 0)
		return \{FALSE}
	endif
endscript

script 0xbb685523 
	printf \{qs(0xbc194875)}
	if (<song_command_success> = 1)
		sap_setmastervolume \{vol = -100}
		sap_unpause
		sap_setmastervolume \{vol = 0
			time = 0.5}
		Change \{practice_songpreview_playing_song = 1}
		if IsObjectScript
			obj_spawnscript \{practice_songpreview_fadeinandrepeat}
		else
			SpawnScriptNow \{practice_songpreview_fadeinandrepeat}
		endif
		Change current_practice_songpreview_starttime = ($target_practice_songpreview_starttime)
		Change \{practice_songpreview_changing = 0}
		Change \{force_practice_songpreview_restart = 0}
	endif
endscript

script practice_songpreview_fadeinandrepeat 
	wait_time = 0
	begin
	current_wait_time = (($target_practice_songpreview_endtime - $target_practice_songpreview_starttime) / 1000.0)
	if (<wait_time> > <current_wait_time>)
		break
	endif
	Wait \{0.5
		Seconds}
	wait_time = (<wait_time> + 0.5)
	repeat
	Change \{force_practice_songpreview_restart = 1}
endscript

script destroy_practice_songpreview_spawned 
	setscriptcannotpause
	KillSpawnedScript \{Name = ui_select_song_section_preview}
	if ScriptIsRunning \{practice_songpreview_monitor}
		unpausespawnedscript \{practice_songpreview_monitor}
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
			sap_stop
			Change \{current_practice_songpreview = None}
		endif
	endif
	if GotParam \{unloadsong}
		sap_unload \{noWait}
	endif
	sap_deinit \{noWait}
endscript
