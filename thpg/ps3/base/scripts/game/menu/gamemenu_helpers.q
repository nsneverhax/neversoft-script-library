default_font_colors = [
	[
		200
		200
		200
		255
	]
	[
		180
		80
		80
		255
	]
	[
		80
		120
		180
		255
	]
	[
		80
		180
		120
		255
	]
	[
		180
		140
		60
		255
	]
	[
		200
		100
		40
		255
	]
	[
		140
		100
		180
		255
	]
	[
		0
		180
		180
		255
	]
	[
		0
		0
		0
		255
	]
	[
		40
		40
		40
		255
	]
	[
		90
		90
		90
		255
	]
	[
		140
		140
		140
		255
	]
	[
		166
		146
		126
		210
	]
]
bedroom_select_skater = came_from_career_game
lens_flare_visible_before_pause = 1
is_changing_levels = 0
ui_show_debug_menus = 0

script handle_pause_continue 
	root_window :gettags
	if gotparam \{pause_controller}
		if NOT (<pause_controller> = <device_num>)
			return
		endif
	endif
	unpause_game_and_destroy_pause_menu
endscript

script pause_game_and_create_pause_menu 
	ve_remove_blackout
	do_actual_pause <...>
	ui_change_state \{state = uistate_pausemenu}
endscript

script do_actual_pause debug_mode = false
	printf "--- do_actual_pause"
	if NOT cd
		dumpprogresslog
	endif
	crib_kill_bink
	if (<debug_mode> = false)
		if compositeobjectexists cap_camera
			cap_finish from_pausing
		endif
	endif
	if NOT innetgame
		printf "-------------------- PAUSING GAME ----------------------"
		pausegame
		unpausespawnedscript igc_temporarily_disable_rendering_with_wait
	endif
	if screenelementexists id = root_window
		setscreenelementprops id = root_window tags = {menu_state = on}
	endif
	if screenelementexists id = net_view_goals_searching
		destroyscreenelement id = net_view_goals_searching
	endif
	if innetgame
		if NOT isobserving
			if objectexists id = skater
				skater :netdisableplayerinput
			endif
		endif
		enableactuators 0
	endif
	if insplitscreengame
		enableactuators 0
		getskaterid skater = 0
		<objid> :vibrate off
		getskaterid skater = 1
		<objid> :vibrate off
	endif
	change viewer_buttons_enabled = 0
endscript

script unpause_game_and_destroy_pause_menu 
	printf "--- unpause_game_and_destroy_pause_menu"
	do_actual_unpause <...>
	printf "unpause_game_and_destroy_pause_menu 1"
	ui_change_state state = uistate_gameplay
	printf "unpause_game_and_destroy_pause_menu 2"
endscript

script do_actual_unpause 
	printf "--- do_actual_unpause"
	clearviewerobject
	debounce x time = 0.3
	debounce triangle time = 0.3
	debounce circle time = 0.3
	debounce square time = 0.3
	pause_menu_gradient off
	change inside_pause = 0
	change no_focus_sound = 1
	if innetgame
		if NOT isobserving
			if objectexists id = skater
				skater :netenableplayerinput
			endif
		endif
		enableactuators 1
	endif
	if insplitscreengame
		enableactuators 1
	endif
	if NOT innetgame
		printf '-------------------- UNPAUSING GAME ----------------------'
		unpausegame
	endif
	pausestream 0
	pausemusic 0
	if NOT innetgame
		if NOT gamemodeequals is_horse
			unpauseskaters
		endif
	endif
	if gman_getactivatedgoalid
		gman_toggleallgoaltriggers hide = 1
	endif
	if screenelementexists id = root_window
		setscreenelementprops id = root_window tags = {menu_state = off}
	endif
	if screenelementexists id = pause_map_container
		destroyscreenelement id = pause_map_container
	endif
	if screenelementexists id = pausemenu_icon_movie
		destroyscreenelement id = pausemenu_icon_movie
	endif
	change viewer_buttons_enabled = 1
endscript

script enable_new_ui_system 
	mempushcontext \{aiheap}
	registerbehaviors_debug
	registerbehaviors_runscript
	registerbehaviors_runbehavior
	mempopcontext
	registeruibehaviors
endscript
ui_controller_which_paused = 0

script handle_start_pressed 
	unpausespawnedscript sysnotify_handle_unpause
	unpausespawnedscript sysnotify_handle_pause
	if NOT renderingenabled
		printf "handle_start_pressed: rendering not enabled, ending"
		return
	endif
	if NOT (($ve_zone_change_level_action) = none)
		printf "handle_start_pressed: $ve_zone_change_level_action is not none, ending"
		return
	endif
	if scriptisrunning goal_film_clip_action
		printf "handle_start_pressed: goal_film_clip_action is running, and we're saving... ending"
		return
	endif
	if istrue $paused_for_hardware
		printf "handle_start_pressed: $paused_for_hardware is true, ending"
		return
	endif
	if istrue $sysnotify_wait_in_progress
		printf "handle_start_pressed: $sysnotify_wait_in_progress is true, ending"
		return
	endif
	if ($is_changing_levels = 1)
		printf "handle_start_pressed: $is_changing_levels is true, ending"
		return
	endif
	if istrue $ingame_save_active
		printf "handle_start_pressed: $ingame_save_active is true, ending"
		return
	endif
	if infrontend
		printf "handle_start_pressed: InFrontEnd is true, ending"
		return
	endif
	if NOT gman_getactivatedgoalid
		if gman_hasactivegoals
			printf "handle_start_pressed: a goal is activating or deactivating, ending"
			return
		endif
	endif
	if ($goal_dialog_box_active = 1)
		printf "handle_start_pressed: goal_dialog_box_active is true"
		return
	endif
	if ($goal_film_showing_options = true)
		printf "handle_start_pressed: goal_film_showing_options is true"
		return
	endif
	if istrue $goal_arcade_activating_subgoal
		printf 'handle_start_pressed: goal_arcade_activating_subgoal is true'
		return
	endif
	goal_photo_fine_adjust_cleanup
	if objectexists id = skater
		if skater :export_isrecording
			printf "handle_start_pressed: Export_IsRecording is true, ending record"
			skater :RecordSkaterAnimStop forced
			if gman_getactivatedgoalid
				goal_film_stop_recording_from_pause
			else
				return
			endif
		endif
		if istrue $replay_currently_playing
			printf "handle_start_pressed: $replay_currently_playing is true, ending"
			return
		endif
	endif
	root_window :gettags
	change ui_controller_which_paused = <device_num>
	if checksumequals a = <menu_state> b = on
		if gotparam pause_controller
			if NOT (<pause_controller> = -1)
				if NOT (<device_num> = <pause_controller>)
					printf "handle_start_pressed: ( <device_num> = <pause_controller> ), ending"
					return
				endif
			endif
		endif
		do_actual_unpause
		broadcastevent type = event_unpause_game
		ui_change_state state = uistate_gameplay
		change inside_pause = 0
	endif
	if checksumequals a = <menu_state> b = off
		if NOT inmultiplayergame
			if NOT controllerboundtoskater controller = <device_num> skater = 0
				printf "handle_start_pressed: not ControllerBoundToSkater, ending"
				return
			endif
		else
			if insplitscreengame
				if NOT controllerboundtoskater controller = <device_num> skater = 0
					if NOT controllerboundtoskater controller = <device_num> skater = 1
						printf "handle_start_pressed: not ControllerBoundToSkater skater=1, ending"
						return
					endif
				endif
			endif
		endif
		if innetgame
			if NOT controllerboundtoskater controller = <device_num> skater = 0
				printf "handle_start_pressed: not ControllerBoundToSkater skater=0 netgame, ending"
				return
			endif
		endif
		settags pause_controller = <device_num>
		if NOT innetgame
			getskaterid
			if getskatercamanimparams skater = <objid>
				if (<allow_pause> = 0)
					printf "handle_start_pressed: ( <allow_pause> = 0 ), ending"
					return
				endif
			endif
		endif
		broadcastevent type = event_pause_game
		do_actual_pause
		set_pause_menu_allow_continue
		ui_change_state state = uistate_pausemenu
	endif
endscript

script set_pause_menu_allow_continue 
	if gotparam \{off}
		root_window :settags \{no_exit_pause_menu = 1}
	else
		root_window :removetags \{tags = [
				no_exit_pause_menu
			]}
	endif
endscript

script set_custom_restart 
	if NOT skater :inair
		skater :setcustomrestart \{set}
	endif
endscript

script skip_to_custom_restart 
	skater :skiptocustomrestart
endscript

script set_sub_bg \{parent = current_menu_anchor
		pos = (326.0, 115.0)
		scale = (1.1700001, 1.1)
		just = [
			center
			top
		]}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = options_bg
		draw_behind_parent
		pos = <pos>
		scale = <scale>
		just = <just>
		rgba = [128 128 128 128]
		z_priority = 1
	}
endscript

script hide_everything 
	doscreenelementmorph \{id = root_window
		time = 0
		scale = 0}
endscript

script unhide_everything 
	doscreenelementmorph \{id = root_window
		time = 0
		scale = 1}
endscript

script hide_all_hud_sprites 
	dialog_box_exit no_pad_start <...>
	if screenelementexists id = console_message_vmenu
		doscreenelementmorph id = console_message_vmenu time = 0 scale = 0
	endif
	if screenelementexists id = first_time_goal_info
		destroyscreenelement id = first_time_goal_info
	endif
	if screenelementexists id = cutscene_camera_hud_anchor
		change camera_hud_is_hidden = 1
		doscreenelementmorph id = cutscene_camera_hud_anchor alpha = 0
	endif
	if screenelementexists id = the_time
		setscreenelementprops id = the_time hide
	endif
	if screenelementexists id = goal_viewport_parent
		setscreenelementprops id = goal_viewport_parent hide
	endif
	if NOT gotparam ignore_speech_boxes
		hide_speech_boxes
	endif
	if screenelementexists id = digital_timer_anchor
		setscreenelementprops id = digital_timer_anchor hide
	endif
	if screenelementexists id = lightning_container
		setscreenelementprops id = lightning_container hide
	endif
	if screenelementexists id = goal_debug_state_menu
		setscreenelementprops id = goal_debug_state_menu hide
	endif
	xboxlive_message_container_hide
	hide_panel_messages
	pause_balance_meter
	pause_run_timer
	hide_goal_panel_messages
	hide_3d_goal_arrow
	hide_landing_msg
	hide_console_window
	hide_net_scores
	pause_trick_text
	hide_death_msg
	hide_compass_anchor
	hide_panel_stuff
	ui_ragdoll_hide_elements
endscript

script hide_all_hud_items 
	hide_all_hud_sprites <...>
	maybehidelensflare
	if NOT infrontend
		if NOT inmultiplayergame
			change \{lens_flare_visible_before_pause = $doupdatelensflare}
			change \{doupdatelensflare = 0}
		endif
	endif
	kill_blur
endscript

script show_all_hud_sprites 
	xboxlive_message_container_show
	show_panel_messages
	unhide_3d_goal_arrow
	unhide_landing_msg
	unhide_death_msg
	unpause_trick_text
	if NOT innetgame
		unpause_trick_text
	endif
	unpause_balance_meter
	unpause_run_timer
	unhide_speech_boxes
	if screenelementexists id = cutscene_camera_hud_anchor
		if (camera_hud_is_hidden = 1)
			change camera_hud_is_hidden = 0
			doscreenelementmorph id = cutscene_camera_hud_anchor alpha = 1
		endif
	endif
	if screenelementexists id = lightning_container
		setscreenelementprops id = lightning_container unhide
	endif
	if screenelementexists id = the_time
		setscreenelementprops id = the_time unhide
	endif
	if screenelementexists id = goal_viewport_parent
		setscreenelementprops id = goal_viewport_parent unhide
	endif
	if screenelementexists id = digital_timer_anchor
		setscreenelementprops id = digital_timer_anchor unhide
	endif
	if screenelementexists id = goal_debug_state_menu
		setscreenelementprops id = goal_debug_state_menu unhide
	endif
	show_goal_panel_messages
	if objectexists id = console_message_vmenu
		doscreenelementmorph id = console_message_vmenu time = 0 scale = 1
	endif
	if ($hidehud = 1)
		printf "hiding"
		hide_root_window
	endif
	if getglobalflag flag = $no_display_hud
		goalmanager_hidepoints
	endif
	if NOT getglobalflag flag = $no_display_chatwindow
		unhide_console_window
	else
		hide_console_window
	endif
	if NOT getglobalflag flag = $no_display_net_scores
		unhide_net_scores
	else
		hide_net_scores
	endif
	show_compass_anchor
	show_panel_stuff
	ui_ragdoll_show_elements
endscript

script show_all_hud_items 
	if screenelementexists \{id = ui_accolade_anchor}
		printf \{'Cannot show_all_hud_items, accolades on screen.'}
		return
	endif
	if skatercamanimfinished \{name = igc_custom_camera_name}
		show_all_hud_sprites <...>
	endif
	if NOT infrontend
		if NOT inmultiplayergame
			change \{doupdatelensflare = 1}
			unhidelensflare
		endif
	endif
endscript

script hide_speech_boxes 
	if screenelementexists id = speech_box_anchor
		setscreenelementprops id = speech_box_anchor block_events
		doscreenelementmorph id = speech_box_anchor scale = 0 relative_scale
	endif
	if screenelementexists id = goal_start_dialog
		setscreenelementprops id = goal_start_dialog block_events
		doscreenelementmorph id = goal_start_dialog scale = 0 relative_scale
	endif
	if screenelementexists id = ped_speech_dialog
		setscreenelementprops id = ped_speech_dialog block_events
		doscreenelementmorph id = ped_speech_dialog scale = 0 relative_scale
	endif
	if screenelementexists id = goal_retry_anchor
		setscreenelementprops id = goal_retry_anchor block_events
		doscreenelementmorph id = goal_retry_anchor scale = 0 relative_scale
	endif
	if screenelementexists id = ped_hint_dialog
		setscreenelementprops id = ped_hint_dialog block_events
		doscreenelementmorph id = ped_hint_dialog scale = 0 relative_scale
	endif
	if player1_panel_container :getsingletag grid_control_speech_box
		if screenelementexists id = <grid_control_speech_box>
			setscreenelementprops id = <grid_control_speech_box> block_events
			doscreenelementmorph id = <grid_control_speech_box> scale = 0 relative_scale
		endif
	endif
endscript

script unhide_speech_boxes 
	if screenelementexists id = speech_box_anchor
		setscreenelementprops id = speech_box_anchor unblock_events
		doscreenelementmorph id = speech_box_anchor scale = 1 relative_scale
	endif
	if screenelementexists id = goal_start_dialog
		setscreenelementprops id = goal_start_dialog unblock_events
		doscreenelementmorph id = goal_start_dialog scale = 1 relative_scale
	endif
	if screenelementexists id = ped_speech_dialog
		if objectexists id = root_window
			if root_window :getsingletag menu_state
				if NOT (<menu_state> = on)
					setscreenelementprops id = ped_speech_dialog unblock_events
					doscreenelementmorph id = ped_speech_dialog scale = 1 relative_scale
				endif
			endif
		endif
	endif
	if screenelementexists id = goal_retry_anchor
		setscreenelementprops id = goal_retry_anchor unblock_events
		doscreenelementmorph id = goal_retry_anchor scale = 1 relative_scale
	endif
	if screenelementexists id = ped_hint_dialog
		setscreenelementprops id = ped_hint_dialog block_events
		doscreenelementmorph id = ped_hint_dialog scale = 1 relative_scale
	endif
	if player1_panel_container :getsingletag grid_control_speech_box
		if screenelementexists id = <grid_control_speech_box>
			setscreenelementprops id = <grid_control_speech_box> unblock_events
			doscreenelementmorph id = <grid_control_speech_box> scale = 1 relative_scale
		endif
	endif
endscript

script kill_speech_boxes 
	if screenelementexists \{id = speech_box_anchor}
		destroyscreenelement \{id = speech_box_anchor}
	endif
	if screenelementexists \{id = goal_start_dialog}
		destroyscreenelement \{id = goal_start_dialog}
	endif
	if screenelementexists \{id = ped_speech_dialog}
		destroyscreenelement \{id = ped_speech_dialog}
	endif
	if screenelementexists \{id = goal_retry_anchor}
		destroyscreenelement \{id = goal_retry_anchor}
	endif
	if screenelementexists \{id = ped_hint_dialog}
		destroyscreenelement \{id = ped_hint_dialog}
	endif
endscript

script hide_landing_msg 
	if objectexists \{id = perfect}
		doscreenelementmorph \{id = perfect
			time = 0
			alpha = 0}
	endif
endscript

script unhide_landing_msg 
	if objectexists \{id = perfect}
		doscreenelementmorph \{id = perfect
			time = 0
			alpha = 0.5}
	endif
endscript

script hide_3d_goal_arrow 
	if screenelementexists \{id = designercreated_3darrowpointer}
		doscreenelementmorph \{id = designercreated_3darrowpointer
			pos = (320.0, -300.0)}
	endif
	if screenelementexists \{id = race_arrow}
		doscreenelementmorph \{id = race_arrow
			pos = (320.0, -300.0)}
	endif
	if screenelementexists \{id = ctf_arrow}
		doscreenelementmorph \{id = ctf_arrow
			pos = (320.0, -300.0)}
	endif
endscript

script unhide_3d_goal_arrow 
	if screenelementexists \{id = designercreated_3darrowpointer}
		doscreenelementmorph \{id = designercreated_3darrowpointer
			pos = (320.0, 70.0)}
	endif
	if screenelementexists \{id = race_arrow}
		doscreenelementmorph \{id = race_arrow
			pos = (320.0, 70.0)}
	endif
	if screenelementexists \{id = ctf_arrow}
		doscreenelementmorph \{id = ctf_arrow
			pos = (320.0, 70.0)}
	endif
endscript

script hide_net_scores 
	if objectexists id = net_score_1
		doscreenelementmorph id = net_score_1 time = 0 alpha = 0
	endif
	if objectexists id = net_score_2
		doscreenelementmorph id = net_score_2 time = 0 alpha = 0
	endif
	if objectexists id = net_score_3
		doscreenelementmorph id = net_score_3 time = 0 alpha = 0
	endif
	if objectexists id = net_score_4
		doscreenelementmorph id = net_score_4 time = 0 alpha = 0
	endif
	if objectexists id = net_score_5
		doscreenelementmorph id = net_score_5 time = 0 alpha = 0
	endif
	if objectexists id = net_score_6
		doscreenelementmorph id = net_score_6 time = 0 alpha = 0
	endif
	if objectexists id = net_score_7
		doscreenelementmorph id = net_score_7 time = 0 alpha = 0
	endif
	if objectexists id = net_score_8
		doscreenelementmorph id = net_score_8 time = 0 alpha = 0
	endif
endscript

script unhide_net_scores 
	if objectexists id = net_score_1
		doscreenelementmorph id = net_score_1 time = 0 alpha = 1
	endif
	if objectexists id = net_score_2
		doscreenelementmorph id = net_score_2 time = 0 alpha = 1
	endif
	if objectexists id = net_score_3
		doscreenelementmorph id = net_score_3 time = 0 alpha = 1
	endif
	if objectexists id = net_score_4
		doscreenelementmorph id = net_score_4 time = 0 alpha = 1
	endif
	if objectexists id = net_score_5
		doscreenelementmorph id = net_score_5 time = 0 alpha = 1
	endif
	if objectexists id = net_score_6
		doscreenelementmorph id = net_score_6 time = 0 alpha = 1
	endif
	if objectexists id = net_score_7
		doscreenelementmorph id = net_score_7 time = 0 alpha = 1
	endif
	if objectexists id = net_score_8
		doscreenelementmorph id = net_score_8 time = 0 alpha = 1
	endif
endscript

script hide_current_goal 
	goal_hud_hide
	if objectexists \{id = mp_goal_text}
		doscreenelementmorph \{id = mp_goal_text
			time = 0
			scale = 0}
	endif
endscript

script unhide_current_goal 
	goal_hud_show
	if objectexists \{id = mp_goal_text}
		doscreenelementmorph \{id = mp_goal_text
			time = 0
			scale = 0.83}
	endif
endscript

script hide_death_msg 
	if objectexists \{id = death_message}
		doscreenelementmorph \{id = death_message
			time = 0
			scale = 0}
	endif
endscript

script unhide_death_msg 
	if objectexists \{id = death_message}
		doscreenelementmorph \{id = death_message
			time = 0
			scale = 1}
	endif
endscript

script menu_quit_no 
	generic_menu_pad_back_sound
	dialog_box_exit
	pause_game_and_create_pause_menu
endscript

script change_gamemode_career 
	printf \{"********** CHANGING GAME MODE TO CAREER"}
	enablesun
	skate_unblock_pedlife
	setgametype \{career}
	setcurrentgametype
	careerfunc \{func = setappropriatenodeflags}
endscript

script change_gamemode_classic 
	printf \{"********** CHANGING GAME MODE TO CLASSIC"}
	enablesun
	setgametype \{classic}
	setcurrentgametype
	careerfunc \{func = setappropriatenodeflags}
endscript

script change_gamemode_coop 
	printf \{"********** CHANGING GAME MODE TO CO-OP"}
	enablesun
	setgametype \{coop}
	setcurrentgametype
	careerfunc \{func = setappropriatenodeflags}
endscript

script change_gamemode_net 
	printf \{"********** CHANGING GAME MODE TO NET!!!"}
	disablesun
	skate_block_pedlife
	setgametype \{net}
	setcurrentgametype
	careerfunc \{func = setappropriatenodeflags}
	kill_singleplayer_gameplay_cheats
endscript

script change_gamemode_singlesession 
	enablesun
	setgametype \{singlesession}
	setcurrentgametype
	careerfunc \{func = setappropriatenodeflags}
endscript

script change_gamemode_freeskate_2p 
	disablesun
	setgametype \{freeskate2p}
	setcurrentgametype
	careerfunc \{func = setappropriatenodeflags}
	kill_singleplayer_gameplay_cheats
endscript

script animate_in 
	setbuttoneventmappings \{block_menu_input}
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = entering
		}}
	launchevent type = focus target = <menu_id>
	domorph \{time = 0.05
		rot_angle = 3
		pos = (40.0, 0.0)
		alpha = 1}
	domorph \{time = 0.01
		rot_angle = 0
		pos = (10.0, 0.0)}
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = on
		}}
	if NOT gotparam \{dont_unblock}
		setbuttoneventmappings \{unblock_menu_input}
	endif
endscript

script menu_onscreen menu_id = current_menu_anchor
	domorph scale = 2 time = 0
	if gotparam pos
		domorph pos = <pos>
	endif
	setprops just = [center center]
	gettags
	if gotparam focus_child
		launchevent type = focus target = <menu_id> data = {child_id = <focus_child>}
	else
		launchevent type = focus target = <id>
	endif
	if NOT gotparam preserve_menu_state
		setscreenelementprops id = root_window tags = {menu_state = on}
	endif
endscript

script animate_out \{menu_id = current_menu_anchor}
	setbuttoneventmappings \{block_menu_input}
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = leaving
		}}
	gettags
	setprops \{just = [
			center
			center
		]}
	domorph \{time = 0
		scale = 1.0}
	domorph \{time = 0.3
		alpha = 0}
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = off
		}}
	setscreenelementlock \{id = root_window
		off}
	destroyscreenelement id = <menu_id>
	setbuttoneventmappings \{unblock_menu_input}
endscript

script menu_offscreen 
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = off
		}}
	setscreenelementlock \{id = root_window
		off}
	gettags
	launchevent type = unfocus target = <id>
	destroyscreenelement id = <id> recurse
endscript

script hide_root_window 
	setscreenelementprops \{id = root_window
		hide}
endscript

script unhide_root_window 
	setscreenelementprops \{id = root_window
		unhide}
endscript

script generic_menu_update_arrows menu_id = current_menu
	if NOT objectexists id = <up_arrow_id>
		return
	endif
	if NOT objectexists id = <down_arrow_id>
		return
	endif
	if <menu_id> :menu_selectedindexis first
		setscreenelementprops {
			id = <up_arrow_id>
			rgba = [128 128 128 0]
		}
	else
		setscreenelementprops {
			id = <up_arrow_id>
			rgba = [128 128 128 128]
		}
	endif
	if <menu_id> :menu_selectedindexis last
		setscreenelementprops {
			id = <down_arrow_id>
			rgba = [128 128 128 0]
		}
	else
		setscreenelementprops {
			id = <down_arrow_id>
			rgba = [128 128 128 128]
		}
	endif
endscript

script generic_menu_pad_back 
	printf \{"generic_menu_pad_back Parameters = "}
	generic_menu_pad_back_sound
	if gotparam \{callback}
		<callback> <...>
	endif
endscript

script generic_menu_pad_choose 
	if gotparam \{callback}
		<callback> <...>
	endif
endscript

script generic_menu_pad_back_sound 
	soundevent \{event = generic_menu_pad_back_sfx}
endscript

script generic_menu_pad_up_down_sound 
endscript

script generic_menu_pad_choose_sound 
	soundevent \{event = generic_menu_pad_choose_sfx}
endscript
disable_menu_sounds = 0

script generic_menu_up_or_down_sound \{menu_id = current_menu}
	if ($disable_menu_sounds = 0)
		if gotparam \{up}
			if gotparam \{scrolling}
				soundevent \{event = cas_menu_pad_up_sfx}
			else
				soundevent \{event = Generic_menu_pad_up_SFX}
			endif
		endif
		if gotparam \{down}
			if gotparam \{scrolling}
				soundevent \{event = cas_menu_pad_down_sfx}
			else
				soundevent \{event = Generic_menu_pad_down_SFX}
			endif
		endif
	endif
endscript

script generic_menu_scroll_sideways_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = generic_menu_pad_sideways_sfx}
	endif
endscript

script generic_scroll_sound 
	soundevent \{event = VE_category_toggle}
endscript

script generic_keyboard_sound 
endscript

script theme_menu_pad_choose_sound 
	soundevent \{event = generic_menu_pad_choose_sfx}
endscript

script generic_pause_exit_sound 
	soundevent \{event = generic_menu_pad_back_sfx}
endscript

script videophone_menu_up_or_down_sound \{menu_id = current_menu}
	if ($disable_menu_sounds = 0)
		if gotparam \{up}
			soundevent \{event = VP_menu_pad_SFX}
		endif
		if gotparam \{down}
			soundevent \{event = VP_menu_pad_SFX}
		endif
	endif
endscript

script videophone_pad_back_sound 
	soundevent \{event = vp_menu_pad_back_sfx}
endscript

script videophone_pad_choose_sound 
	soundevent \{event = vp_menu_pad_select_sfx}
endscript

script cas_menu_pad_choose_sound 
endscript

script cas_menu_up_or_down_sound \{menu_id = current_menu}
	if ($disable_menu_sounds = 0)
		if gotparam \{up}
			soundevent \{event = cas_menu_pad_up_sfx}
		endif
		if gotparam \{down}
			soundevent \{event = cas_menu_pad_down_sfx}
		endif
	endif
endscript

script reset_career_progress 
	printf 'reset_career_progress'
	careerfunc func = enableatomupdate params = {enable = false}
	killspawnedscript name = game_progress_process_status
	gman_deactivateallgoals
	if isxenon
		setup_sessionfuncs
	endif
	if NOT gotparam no_random_skater
		resettodefaultprofile name = custom_story
	endif
	set_skater_profile_name_from_gamertag
	careerfunc func = reset
	if objectexists id = skater
		skater :recordcomponent_resetcomponent
	endif
	gman_resetcareer
	UI_Clear_User_Goal_Waypoint
	careerfunc func = setappropriatenodeflags
	getarraysize $story_clear_global_flags
	if (<array_size> > 0)
		index = 0
		begin
		printf "clearing global flag %d" d = ($story_clear_global_flags [<index>])
		unsetglobalflag flag = ($story_clear_global_flags [<index>])
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	setsavefilename filetype = progress clear
	MC_ClearValidatedFolder
	selectcurrentskater name = custom_story
	change cas_skater_invalid = 1
	if NOT gotparam no_random_skater
		choose_random_skater
	endif
	SetSkaterProfileInfoByName name = custom_2p_1 params = {skater_loaded = 0}
	SetSkaterProfileInfoByName name = custom_2p_2 params = {skater_loaded = 0}
	careerfunc func = enableatomupdate params = {enable = true}
endscript

script set_skater_profile_name_from_gamertag 
	DEFAULT_SKATER_NAME = "Skater"
	netsessionfunc obj = match func = get_gamertag
	if NOT gotparam name
		printf 'set_skater_profile_name_from_gamertag failed'
		name = <DEFAULT_SKATER_NAME>
	endif
	FixupNameToBeFilenameFriendly name = <name>
	stringlength string = <name>
	if (<str_len> = 0)
		name = <DEFAULT_SKATER_NAME>
	endif
	SetSkaterProfileInfoByName name = custom_story params = {display_name = <name>}
endscript

script choose_random_skater 
	if ($use_random_default_appearance = 1)
		selectcurrentskater \{name = custom_story}
		cas_set_random_appearance
	endif
endscript

script generic_menu_animate_in menu = current_menu_anchor
	if NOT screenelementexists id = <menu>
		return
	endif
	if gotparam force
		<menu> :settags animate_me = 1
	else
		if NOT <menu> :getsingletag animate_me
			return
		endif
	endif
	if gotparam pos
		screenelementpos = <pos>
	else
		getscreenelementposition id = <menu>
	endif
	if NOT gotparam no_wait
		doscreenelementmorph id = <menu> alpha = 0
		wait 2 gameframes
		doscreenelementmorph id = <menu> alpha = 1
	endif
	doscreenelementmorph id = <menu> pos = (<screenelementpos> + (1280.0, 0.0)) time = 0 rot_angle = -90
	doscreenelementmorph id = <menu> pos = <screenelementpos> time = 0.15 rot_angle = 0
	if NOT gotparam no_wait
		wait 0.2 seconds
	endif
endscript

script generic_menu_animate_out menu = current_menu_anchor
	if NOT screenelementexists id = <menu>
		return
	endif
	if gotparam force
		<menu> :settags animate_me = 1
	endif
	if NOT <menu> :getsingletag animate_me
		return
	endif
	if gotparam pos
		screenelementpos = <pos>
	else
		getscreenelementposition id = <menu>
	endif
	doscreenelementmorph id = <menu> pos = (<screenelementpos> - (1280.0, 0.0)) time = 0.15
	if NOT gotparam no_wait
		wait 0.2 seconds
	endif
endscript

script generic_animate_out_last_menu 
	if objectexists \{id = current_menu}
		if current_menu :getsingletag \{animate_me}
			generic_menu_animate_out \{menu = current_menu}
			return
		endif
	endif
	if objectexists \{id = current_menu_anchor}
		if current_menu_anchor :getsingletag \{animate_me}
			generic_menu_animate_out
			return
		endif
	endif
	if objectexists \{id = sub_menu}
		if sub_menu :getsingletag \{animate_me}
			generic_menu_animate_out \{force
				menu = sub_menu
				pos = (320.0, 240.0)}
			return
		endif
	endif
endscript

script runscriptonscreenelement_script 
	runscriptonscreenelement <...>
endscript

script waitthenfocusscreenelement \{time = 0.5}
	obj_getid
	requireparams \{[
			objid
		]
		all}
	wait <time> seconds ignoreslomo
	launchevent type = focus target = <objid>
endscript
