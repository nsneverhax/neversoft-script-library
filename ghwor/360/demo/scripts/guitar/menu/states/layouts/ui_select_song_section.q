g_sss_highlighted_index = 0
default_section_rgba = gh6_gold
default_section_focus_rgba = white
song_section_preview_ready = 1

script ui_create_select_song_section \{from_in_game = 0}
	change \{g_sss_highlighted_index = 0}
	gamemode_gettype
	create_mainmenu_bg
	hide_band
	hide_crowd_models
	if gotparam \{data}
		if structurecontains structure = <data> from_in_game
			from_in_game = (<data>.from_in_game)
		endif
	endif
	pad_back_script = ui_select_song_section_back
	disable_pause
	if (<from_in_game> = 1)
		startrendering
	else
		unpausegame
	endif
	if NOT ($game_mode = practice)
		if (<from_in_game> = 0)
			change \{came_to_practice_from = main_menu}
		endif
	endif
	audio_ui_menu_music_off
	end_practice_song_slomo
	createscreenelement {
		parent = root_window
		type = descinterface
		id = songsectiondesc
		desc = 'select_song_section_desc'
		tags = {monitor_spawned = 0 from_in_game = <from_in_game>}
		z_priority = 10000
	}
	change \{song_section_preview_ready = 0}
	songsectiondesc :obj_spawnscript \{ui_select_song_section_wait_for_preview}
	focus2_script = ui_select_song_section_preview
	spawnsongpreview = 0
	if songsectiondesc :desc_resolvealias \{name = alias_menu}
		assignalias id = <resolved_id> alias = current_menu
		current_menu :se_setprops {
			allow_wrap = false
			exclusive_device = ($primary_controller)
			event_handlers = [
				{pad_up ui_select_song_section_play_sound params = {up}}
				{pad_down ui_select_song_section_play_sound params = {down}}
				{pad_back <pad_back_script>}
			]
			tags = {
				start_index = -1
				end_index = -1
				min_index = 0
				max_entries = 0
			}
		}
		createscreenelement {
			parent = current_menu
			type = descinterface
			desc = 'select_song_section_item_desc'
			autosizedims = false
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
		getarraysize <song_section_array>
		marker_array_size = <array_size>
		getfirstplayer
		getplayerinfo <player> part
		if (<marker_array_size> > 0)
			i = 1
			focus_idx = 1
			begin
			shortenuistring {
				ui_string = ((<song_section_array> [(<i> - 1)]).marker)
				max_len = 50
			}
			if (<short_ui_string> != qs(0x00167369) &&
					<short_ui_string> != qs(0xed5ba677))
				<section_rgba> = $default_section_rgba
				if (<part> = vocals)
					if localizedstringequals a = <short_ui_string> b = $vocal_marker_freeform
						<section_rgba> = $vocal_marker_freeform_rgba
					endif
				endif
				if (<short_ui_string> = qs(0x03ac90f0))
					short_ui_string = qs(0x4db2ad32)
					section_rgba = [64 64 255 255]
				endif
				createscreenelement {
					parent = current_menu
					type = descinterface
					desc = 'select_song_section_item_desc'
					autosizedims = false
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
		current_menu :settags max_entries = <focus_idx>
	endif
	songsectiondesc :obj_spawnscript \{ui_select_song_section_preview
		params = {
			index = 0
			nowait
		}}
	menu_finish <menu_finish_params>
	current_menu :settags \{lead_in = 0}
	current_menu :settags \{lead_out = 0}
	songsectiondesc :desc_resolvealias \{name = alias_generic_scrollbar_wgt}
	generic_scrollbar_wgt_initialize id = <resolved_id>
	generic_scrollbar_wgt_set_resolution id = <resolved_id> num_elements = (<marker_array_size> + 1)
	ui_select_song_section_setup_helpers
endscript

script ui_select_song_section_setup_helpers 
	songsectiondesc :gettags
	current_menu :gettags
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	gamemode_gettype
	if (<type> != career)
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
endscript

script ui_select_song_section_play_sound 
	current_menu :gettags
	if (<start_index> = -1)
		<start_index> = 0
	endif
	if gotparam \{up}
		if ($g_sss_highlighted_index - 1 >= <start_index>)
			ui_sfx \{menustate = generic
				uitype = scrollup}
		endif
	else
		if ($g_sss_highlighted_index + 1 < <max_entries>)
			ui_sfx \{menustate = generic
				uitype = scrolldown}
		endif
	endif
endscript

script ui_destroy_select_song_section 
	destroy_mainmenu_bg
	spawnscriptnow \{destroy_practice_songpreview_spawned
		params = {
			unloadsong
		}}
	destroyscreenelement \{id = songsectiondesc}
	setsoundbussparams {vocals_balance = {vol = ($default_bussset.vocals_balance.vol)}}
	setsoundbussparams {drums_balance = {vol = ($default_bussset.drums_balance.vol)}}
	setsoundbussparams {guitar_balance = {vol = ($default_bussset.guitar_balance.vol)}}
	setsoundbussparams {bass_balance = {vol = ($default_bussset.bass_balance.vol)}}
	setsoundbussparams {rhythmgtr_balance = {vol = ($default_bussset.rhythmgtr_balance.vol)}}
	setsoundbussparams {crowd_balance = {vol = ($default_bussset.crowd_balance.vol)}}
	setsoundbussparams {crowdsingalong_balance = {vol = ($default_bussset.crowdsingalong_balance.vol)}}
	setsoundbussparams {band_balance = {vol = ($default_bussset.band_balance.vol)}}
	clean_up_user_control_helpers
endscript

script ui_deinit_select_song_section 
endscript

script ui_select_song_section_focus_item \{time = 0.1}
	current_menu :gettags
	gettags
	change g_sss_highlighted_index = <focus_index>
	my_strikeout_texture = <strikeout_texture>
	my_strikeout_alpha = <strikeout_alpha>
	light_bar_alpha = 1.0
	strikeout_alpha = 0
	getscreenelementchildren \{id = current_menu}
	getarraysize <children>
	children_array_size = <array_size>
	if NOT (<start_index> = -1)
		i = <start_index>
		begin
		if resolvescreenelementid id = {current_menu child = <i>}
			<resolved_id> :getsingletag strikeout_texture
			<resolved_id> :getsingletag strikeout_alpha
			<resolved_id> :getsingletag default_rgba
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
	songsectiondesc :desc_resolvealias \{name = alias_generic_scrollbar_wgt}
	generic_scrollbar_wgt_update_thumb_pos id = <resolved_id> index = <focus_index>
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
	getsingletag \{default_rgba}
	se_setprops section_rgba = <default_rgba> light_bar_alpha = 0.0 time = 0.1
endscript

script ui_select_song_section_choose_item 
	se_setprops \{block_events}
	current_menu :gettags
	gettags
	if gotparam \{playfullsong}
		current_menu :settags \{start_index = 0}
		current_menu :settags \{lead_in = 0}
		current_menu :settags \{lead_out = 0}
		current_menu :obj_spawnscript ui_select_song_section_set_times params = {playfullsong from_in_game = <from_in_game>}
		return
	endif
	if (<start_index> = -1)
		ui_sfx \{menustate = setlist
			uitype = scrollup}
		current_menu :settags start_index = <focus_index>
		change practice_start_index = <focus_index>
		current_menu :settags start_index = <focus_index>
	else
		current_menu :settags start_index = (<start_index> - 1)
		current_menu :settags end_index = <index>
		current_menu :obj_spawnscript ui_select_song_section_set_times params = {from_in_game = <from_in_game>}
	endif
	songsectiondesc :se_setprops \{message_text = qs(0x3da2472b)}
	getscreenelementchildren \{id = current_menu}
	getarraysize <children>
	songsectiondesc :se_setprops \{practice_head2_text = qs(0x3da2472b)}
	i = 0
	begin
	if (<i> >= <focus_index>)
		break
	endif
	curr_item = (<children> [<i>])
	<curr_item> :se_setprops not_focusable
	i = (<i> + 1)
	repeat <array_size>
	ui_select_song_section_setup_helpers
	se_setprops \{unblock_events}
endscript

script ui_select_song_section_back 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	se_setprops \{block_events}
	current_menu :gettags
	songsectiondesc :gettags
	if ui_event_exists_in_stack \{name = 'song_breakdown'}
		from_in_game = 0
	endif
	if (<start_index> = -1)
		if (<from_in_game> = 1)
			gamemode_gettype
			if (<type> != career)
				se_setprops \{block_events}
				ui_sfx \{menustate = generic
					uitype = back}
				if NOT ui_event_exists_in_stack \{name = 'select_practice_difficulty'}
					create_loading_screen
				endif
				sap_unload \{nowait}
				destroy_practice_songpreview_spawned
				if ui_event_exists_in_stack \{name = 'select_practice_difficulty'}
					generic_event_back \{state = uistate_select_practice_difficulty}
				else
					gamemode_gettype
					if (<type> = practice)
						practice_restart_song
					else
						change \{gameplay_restart_song = 1}
						generic_event_back \{state = uistate_gameplay}
					endif
				endif
			endif
		else
			ui_sfx \{menustate = generic
				uitype = back}
			sap_unload \{nowait}
			sap_deinit \{nowait}
			destroy_practice_songpreview_spawned
			generic_event_back \{nosound}
		endif
	else
		sap_unload \{nowait}
		sap_deinit \{nowait}
		ui_sfx \{menustate = setlist
			uitype = scrollup}
		change \{practice_start_index = -1}
		change \{practice_end_index = -1}
		generic_event_refresh
	endif
	se_setprops \{unblock_events}
endscript

script return_to_quickplay_from_practice 
	ui_sfx \{menustate = generic
		uitype = select}
	reset_practice_mode
	shut_down_practice_mode
	change \{gameplay_restart_song = 1}
	create_venue_loading_screen movie_params = ($levelzones.$current_level)
	generic_event_back \{state = uistate_gameplay}
endscript

script ui_select_song_section_set_times \{state = uistate_practice_select_speed}
	se_setprops \{block_events}
	gettags
	kill_practice_scripts
	getfirstplayer
	practice_kill_gem_scroller player = <player>
	get_song_section_array
	getarraysize <song_section_array>
	if (<array_size> > 0)
		change practice_start_time = ((<song_section_array> [<start_index>]).time)
		change practice_start_index = <start_index>
		if ((gotparam playfullsong) || (<end_index> >= <array_size>))
			getfirstplayer
			getplayerinfo <player> difficulty
			playlist_getcurrentsong
			setup_gemarrays song_name = <current_song> difficulty = <difficulty> player = 1
			songfilemanager func = get_song_end_time song_name = <current_song>
			change practice_end_time = <total_end_time>
			change practice_end_index = <array_size>
		else
			change practice_end_time = ((<song_section_array> [<end_index>]).time - 1)
			change practice_end_index = <end_index>
		endif
		change practice_start_time = ($practice_start_time - <lead_in>)
		change practice_end_time = ($practice_end_time + <lead_out>)
	else
		change \{practice_start_time = 0}
		change \{practice_end_time = 0}
		change \{practice_start_index = 0}
		change \{practice_end_index = 0}
	endif
	sap_unload \{nowait}
	sap_deinit \{nowait}
	ui_sfx \{menustate = generic
		uitype = select}
	destroy_practice_songpreview_spawned
	getfirstplayer
	getplayerinfo <player> part
	if (<part> = vocals)
		ui_event \{event = menu_change
			state = uistate_practice_select_looping}
	else
		ui_event event = menu_change state = <state>
	endif
endscript

script ui_select_song_section_wait_for_preview 
	change \{song_section_preview_ready = 0}
	shutdown_practice_songpreview_monitor
	change \{song_section_preview_ready = 1}
endscript

script ui_select_song_section_preview 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	if NOT gotparam \{nowait}
		wait \{0.5
			seconds}
	endif
	if isobjectscript
		gettags
	endif
	begin
	if ($song_section_preview_ready = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	get_song_section_array
	getarraysize <song_section_array>
	if (<array_size> > 0)
		if (<index> > 0)
			<index> = (<index> - 1)
			end_index = (<index> + 1)
			if (<end_index> >= <array_size>)
				removeparameter \{end_index}
			endif
		endif
		start_time = ((<song_section_array> [<index>]).time)
		playlist_getcurrentsong
		if NOT gotparam \{end_index}
			getfirstplayer
			getplayerinfo <player> difficulty
			setup_gemarrays song_name = <current_song> difficulty = <difficulty> player = 1
			songfilemanager func = get_song_end_time song_name = <current_song>
			end_time = <total_end_time>
		else
			end_time = ((<song_section_array> [<end_index>]).time + 750)
		endif
		change target_practice_songpreview = <current_song>
		change target_practice_songpreview_starttime = <start_time>
		change target_practice_songpreview_endtime = <end_time>
	endif
	songsectiondesc :gettags
	if (<monitor_spawned> = 0)
		change \{force_practice_songpreview_restart = 1}
		spawnscript \{practice_songpreview_monitor}
		songsectiondesc :settags \{monitor_spawned = 1}
	endif
endscript
practice_start_index = 0
practice_end_index = 0
target_practice_songpreview = none
target_practice_songpreview_starttime = 0
target_practice_songpreview_endtime = 0
force_practice_songpreview_restart = 0
practice_songpreview_changing = 0
current_practice_songpreview = none
current_practice_songpreview_starttime = 0

script getmarkerarraysize 
	marker_size = 0
	marker_index = 0
	if globalexists name = <array> type = array
		getarraysize $<array>
	else
		getarraysize <array>
	endif
	if (<array_size> > 0)
		begin
		if globalexists name = <array> type = array
			marker = ($<array> [<marker_index>].marker)
		else
			marker = (<array> [<marker_index>].marker)
		endif
		if (<marker> != qs(0x00167369) &&
				<marker> != qs(0xed5ba677))
			marker_size = (<marker_size> + 1)
		endif
		marker_index = (<marker_index> + 1)
		repeat <array_size>
	endif
	return array_size = <marker_size>
endscript
in_destroy_choose_practice_section_menu = 0
practice_songpreview_playing_song = 0
g_practice_songpreview_monitor_shutdown_flag = 0

script shutdown_practice_songpreview_monitor 
	change \{g_practice_songpreview_monitor_shutdown_flag = 1}
endscript

script wait_for_practice_songpreview_monitor_to_exit 
	begin
	if NOT scriptisrunning \{practice_songpreview_monitor}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script practice_songpreview_monitor 
	setscriptcannotpause
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change \{practice_songpreview_playing_song = 0}
	change \{g_practice_songpreview_monitor_shutdown_flag = 0}
	sap_deinit \{nowait}
	sap_init mode = ($game_mode) speed = ($current_speedfactor) nowait
	begin
	new_song = ($current_practice_songpreview != $target_practice_songpreview)
	new_seektime = ($current_practice_songpreview_starttime != $target_practice_songpreview_starttime)
	if (<new_song> && $practice_songpreview_changing = 0)
		song = ($target_practice_songpreview)
		killspawnedscript \{name = practice_songpreview_fadeinandrepeat}
		change \{practice_songpreview_changing = 1}
		if ($practice_songpreview_playing_song = 1)
			fade_time = 0.5
		else
			fade_time = 0.0
		endif
		sap_setmastervolume vol = -100 time = <fade_time>
		wait <fade_time> second
		if ($g_practice_songpreview_monitor_shutdown_flag = 1)
			change \{g_practice_songpreview_monitor_shutdown_flag = 0}
			break
		endif
		if NOT ($current_practice_songpreview = $target_practice_songpreview)
			change \{practice_songpreview_playing_song = 0}
			sap_stop \{nowait}
			sap_unload \{nowait}
			if ($shutdown_game_for_signin_change_flag = 0)
				getsongaudioinfo song_name = <song>
				get_song_encryption_type song_name = <song>
				if sap_load filename = <song_stream_name> slot = <slot> vol = <song_volume> encryption_type = <encryption_type>
					if ($g_practice_songpreview_monitor_shutdown_flag = 1)
						change \{g_practice_songpreview_monitor_shutdown_flag = 0}
						break
					endif
					if (<song_command_success> = 1)
						change \{practice_songpreview_changing = 0}
						change current_practice_songpreview = <song>
					endif
					if NOT (<new_seektime>)
						sap_setmastervolume \{vol = -100}
						sap_setmastervolume \{vol = 0
							time = 0.5}
						sap_unpause
					endif
				endif
			endif
		endif
	elseif ((<new_seektime> || $force_practice_songpreview_restart = 1)
			&& $practice_songpreview_changing = 0)
		change \{practice_songpreview_changing = 1}
		killspawnedscript \{name = practice_songpreview_fadeinandrepeat}
		if ($practice_songpreview_playing_song = 1)
			fade_time = 0.5
		else
			fade_time = 0.0
		endif
		sap_setmastervolume vol = -100 time = <fade_time>
		wait <fade_time> second
		if ($g_practice_songpreview_monitor_shutdown_flag = 1)
			change \{g_practice_songpreview_monitor_shutdown_flag = 0}
			break
		endif
		sap_pause
		if sap_seek time = ($target_practice_songpreview_starttime)
			if ($g_practice_songpreview_monitor_shutdown_flag = 1)
				change \{g_practice_songpreview_monitor_shutdown_flag = 0}
				break
			endif
			if (<song_command_success> = 1)
				sap_setmastervolume \{vol = -100}
				sap_setmastervolume \{vol = 0
					time = 0.5}
				change \{practice_songpreview_playing_song = 1}
				spawnscriptnow \{practice_songpreview_fadeinandrepeat}
				change current_practice_songpreview_starttime = ($target_practice_songpreview_starttime)
				change \{practice_songpreview_changing = 0}
				change \{force_practice_songpreview_restart = 0}
				sap_unpause
			endif
		endif
	else
		sap_getaudiolength
		song_length = <time>
		sap_getaudioposition
		timeplus = (<time> + 460)
		if ((<time> + 460) > <song_length>)
			sap_pause
		endif
	endif
	wait \{1
		gameframe}
	if ($g_practice_songpreview_monitor_shutdown_flag = 1)
		change \{g_practice_songpreview_monitor_shutdown_flag = 0}
		break
	endif
	repeat
	killspawnedscript \{name = practice_songpreview_fadeinandrepeat}
	change \{practice_songpreview_changing = 0}
	change \{current_practice_songpreview = none}
	change \{target_practice_songpreview = none2}
	change \{practice_songpreview_playing_song = 0}
	sap_stop \{nowait}
	sap_unload \{nowait}
	sap_deinit \{nowait}
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
	change \{force_practice_songpreview_restart = 1}
endscript

script destroy_practice_songpreview_spawned 
	setscriptcannotpause
	killspawnedscript \{name = ui_select_song_section_preview}
	shutdown_practice_songpreview_monitor
	wait_for_practice_songpreview_monitor_to_exit
endscript
