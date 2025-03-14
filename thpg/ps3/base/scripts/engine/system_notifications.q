paused_for_hardware = 0
sysnotify_wait_in_progress = 0
xenon_device_checked = -1
ps3_device_checked = -1
sysnotify_game_already_paused = 0
sysnotify_paused_screen_elements = [
	current_menu_anchor
	signout_warning
	dialog_box_anchor
	link_lost_dialog_anchor
	quit_dialog_anchor
	keyboard_anchor
	controller_unplugged_dialog_anchor
	slow_and_wait_input_event
	goal_photo_cam_handle
]

script sysnotify_wait_until_safe 
	ve_handle_sysnotify
	begin
	<should_wait> = 0
	if systemuidelayed
		<should_wait> = 1
		printf "WAITING FOR SYSTEM UI"
	endif
	if istrue $is_changing_levels
		<should_wait> = 1
		printf "WAITING FOR ISCHANGINGLEVELS"
	endif
	if istrue $igc_playing
		<should_wait> = 1
		printf "WAITING FOR IGC"
	endif
	if ($goal_zone_loading = 1)
		<should_wait> = 1
		printf "WAITING FOR GOAL ZONE LOAD"
	endif
	if NOT cutscenefinished name = cutscene
		<should_wait> = 1
		printf "WAITING FOR CUTSCENE"
	endif
	if screenelementexists id = screenfader
		if NOT istrue $ui_game_area_unlocked_active
			printf "WAITING FOR SCREENFADER"
		endif
	endif
	if ve_is_recording
		<should_wait> = 1
		printf "WAITING FOR VE RECORDING"
	endif
	if ve_is_playing
		<should_wait> = 1
		printf "WAITING FOR VE PLAYBACK"
	endif
	if gman_canretrylastgoal
		gman_getlastretryablegoalid
		if gman_goalexists goal = <last_retryable_goal_id>
			if GMan_GoalIsRetrying goal = <last_retryable_goal_id>
				<should_wait> = 1
				printf "WAITING FOR GOAL RETRY"
			endif
		endif
	endif
	if NOT infrontend
		if ($goal_playing_presentation = 0)
			if ViewportUsedByMovieCamera viewport = 0
				<in_menu> = 0
				if screenelementexists id = root_window
					if root_window :getsingletag menu_state
						if checksumequals a = <menu_state> b = on
							<in_menu> = 1
						endif
					endif
				endif
				if gman_getactivatedgoalid
					if checksumequals a = <activated_goal_id> b = m_r2_show1
						<in_menu> = 1
					endif
				endif
				if NOT istrue <in_menu>
					<should_wait> = 1
					printf "WAITING FOR CAMERA"
				endif
			endif
		endif
	endif
	if scriptisrunning game_intro_initial_cam
		<should_wait> = 1
	endif
	if (<should_wait> = 1)
		change sysnotify_wait_in_progress = 1
		wait 0.1 seconds
	else
		change sysnotify_wait_in_progress = 0
		return
	endif
	repeat
endscript

script sysnotify_handle_pause_eject 
	create_dialog_box \{anchor_id = dialog_box_anchor_sysnotify_eject
		vmenu_id = dialog_box_vmenu_sysnotify_eject
		container_id = dialog_box_container_sysnotify_eject
		graytint_id = bg_graytint_eject
		title = "Disc Ejected"
		text = "Please reinsert"
		bg_gray_tint_rgba = [
			20
			20
			20
			255
		]
		z_priority = 20000
		no_animate
		no_pad_start
		no_helper_text}
	sysnotify_handle_pause <...>
endscript

script sysnotify_handle_pause_controller 
	if screenelementexists id = mainmenu_anchor
		return
	endif
	sysnotify_wait_until_safe
	if isxenon
		<title> = "XBOX 360 CONTROLLER DISCONNECTED"
	else
		get_connect_second_sixaxis_controller_title
	endif
	create_dialog_box {
		anchor_id = dialog_box_anchor_sysnotify_controller
		vmenu_id = dialog_box_vmenu_sysnotify_controller
		container_id = dialog_box_container_sysnotify_controller
		graytint_id = bg_graytint_controller
		title = <title>
		text = "Please reconnect"
		bg_gray_tint_rgba = [20 20 20 255]
		z_priority = 10000
		no_animate
		no_pad_start
		no_helper_text
		vmenu_width = 800
	}
	sysnotify_handle_pause <...>
endscript

script sysnotify_handle_pause_console 
	if isps3
		if screenelementexists id = ps3_console_greyed_ui
			destroyscreenelement id = ps3_console_greyed_ui
		endif
		createscreenelement {
			type = spriteelement
			texture = white2
			rgba = [0 0 0 240]
			alpha = 1.0
			just = [center center]
			dims = (1280.0, 720.0)
			pos = (640.0, 360.0)
			parent = root_window
			z_priority = 9999
			id = ps3_console_greyed_ui
		}
	endif
	sysnotify_handle_pause <...>
endscript

script sysnotify_handle_pause 
	printf "----------------------"
	printf "sysnotify_handle_pause"
	printf "----------------------"
	if ps3
		PlayListPause pause = 1
	endif
	if ($paused_for_hardware = 1)
		return
	endif
	killsubtitledmovie
	sysnotify_wait_until_safe
	change paused_for_hardware = 1
	change sysnotify_game_already_paused = 1
	if gameispaused
		return
	endif
	if infrontend
		return
	endif
	getarraysize $sysnotify_paused_screen_elements
	<i> = 0
	begin
	if screenelementexists id = ($sysnotify_paused_screen_elements [<i>])
		return
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	pauseallsounds pause = 1 preservepausestates
	if NOT ps3
		PlayListPause pause = 1
	endif
	change viewer_buttons_enabled = 0
	change sysnotify_game_already_paused = 0
	do_actual_pause
	unpausespawnedscript igc_temporarily_disable_rendering_with_wait
endscript

script sysnotify_handle_unpause_eject 
	dialog_box_exit anchor_id = dialog_box_anchor_sysnotify_eject ignore_helper_text
	if screenelementexists id = ui_mainmenu_wait_anchor
		launchevent type = focus target = ui_mainmenu_wait_anchor
	endif
	sysnotify_handle_unpause <...>
	if screenelementexists id = keyboard_anchor
		launchevent type = focus target = keyboard_anchor
	elseif screenelementexists id = mod_vmenu
		launchevent type = focus target = mod_vmenu
	elseif screenelementexists id = rankings_vmenu
		launchevent type = focus target = rankings_vmenu
	elseif screenelementexists id = videophone_vmenu
		launchevent type = focus target = videophone_vmenu
	elseif screenelementexists id = player_list_menu
		launchevent type = focus target = player_list_menu
	endif
endscript

script sysnotify_handle_unpause_controller 
	dialog_box_exit anchor_id = dialog_box_anchor_sysnotify_controller ignore_helper_text
	if screenelementexists id = ui_mainmenu_wait_anchor
		launchevent type = focus target = ui_mainmenu_wait_anchor
	endif
	sysnotify_handle_unpause <...>
	if screenelementexists id = keyboard_anchor
		launchevent type = focus target = keyboard_anchor
	elseif screenelementexists id = mod_vmenu
		launchevent type = focus target = mod_vmenu
	elseif screenelementexists id = rankings_vmenu
		launchevent type = focus target = rankings_vmenu
	elseif screenelementexists id = videophone_vmenu
		launchevent type = focus target = videophone_vmenu
	elseif screenelementexists id = player_list_menu
		launchevent type = focus target = player_list_menu
	endif
endscript

script sysnotify_handle_unpause_console 
	sysnotify_handle_unpause <...>
endscript

script sysnotify_remove_ps3_blackout 
	if isps3
		if screenelementexists \{id = ps3_console_greyed_ui}
			destroyscreenelement \{id = ps3_console_greyed_ui}
		endif
	endif
endscript

script sysnotify_handle_unpause 
	printf "------------------------"
	printf "sysnotify_handle_unpause"
	printf "------------------------"
	sysnotify_remove_ps3_blackout
	if shouldgamebepausedduetosysnotification
		return
	endif
	if ps3
		PlayListPause pause = 0
	endif
	sysnotify_wait_until_safe
	change paused_for_hardware = 0
	unpausespawnedscript sysnotify_handle_signin_change
	if infrontend
		broadcastevent type = profile_status_confirmed
		unpausemusicandstreams
		return
	endif
	if NOT innetgame
		if NOT gameispaused
			return
		endif
	endif
	getarraysize $sysnotify_paused_screen_elements
	<i> = 0
	begin
	if screenelementexists id = ($sysnotify_paused_screen_elements [<i>])
		return
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if ($sysnotify_game_already_paused = 0)
		pauseallsounds pause = 0 preservepausestates
		if NOT ps3
			PlayListPause pause = 0
		endif
		do_actual_unpause
		if IsInCrib
			printf 'DT33806 - TVs turn off when guide button is used'
			spawnscriptlater crib_update_av
		endif
	endif
	change sysnotify_game_already_paused = 0
endscript

script sysnotify_reset_user_progress 
	killspawnedscript \{name = game_progress_process_status}
	killspawnedscript \{name = game_progress_process_post_goal_wait}
	reset_career_progress
	change \{attempted_xbox_autoload = 0}
	change \{no_load = 0}
	change \{xenon_device_checked = -1}
	change \{ui_cas_skater_selected = 0}
endscript
signin_change_happening = 0

script sysnotify_handle_signin_change 
	printf "------------------------------"
	printf "sysnotify_handle_signin_change"
	printf "------------------------------"
	if ($signin_change_happening = 1)
		printf "ALREADY BEING PROCESSED"
		return
	endif
	change signin_change_happening = 1
	sysnotify_wait_until_safe
	if ($ui_x360_sign_in_checked = 1)
		change ui_x360_sign_in_checked = 0
		change signin_change_happening = 0
		if NOT netsessionfunc func = xenonisguest
			return
		endif
	endif
	<notification_title> = "SIGN-IN CHANGE"
	<notification_description> = "Your gamer profile has changed. Returning you to the main menu."
	printstruct <...>
	switch <message>
		case live_connection_lost
		if infrontend
			if NOT xboxlive_menus_active
				change signin_change_happening = 0
				return
			endif
		else
			if NOT innetgame
				change signin_change_happening = 0
				return
			elseif screenelementexists id = link_lost_dialog_anchor
				change signin_change_happening = 0
				return
			elseif ($DONT_ALLOW_INPUT_IN_ONLINE = 1)
				change signin_change_happening = 0
				return
			endif
		endif
		<notification_title> = "CONNECTION LOST"
		<notification_description> = "Lost connection to Xbox LIVE.  Returning you to the main menu."
		case live_connection_gained
		if NOT infrontend
			if NOT innetgame
				xenon_singleplayer_session_init
				change signin_change_happening = 0
				return
			endif
		else
			change signin_change_happening = 0
			return
		endif
		case user_changed
		setbuttoneventmappings block_menu_input
		fadetoblack on alpha = 1 time = 0
		sysnotify_cleanup_ui
		sysnotify_reset_user_progress
		options_retrieve_from_user_profile
		setbuttoneventmappings unblock_menu_input
		default
		printf "- no response required"
		change signin_change_happening = 0
		return
	endswitch
	getcurrentlevel
	if NOT ($ui_in_mainmenu = 1)
		if ismovieplaying textureslot = 0
			pausemovie textureslot = 0
		endif
		if ismovieplaying textureslot = 1
			pausemovie textureslot = 1
		endif
		<i> = 0
		begin
		if controllerboundtoskater skater = 0 controller = <i>
			break
		endif
		<i> = (<i> + 1)
		if (<i> > 3)
			break
		endif
		repeat
		if (<i> > 3)
			GetLocalSkaterController
			<i> = (<controller>)
		endif
		enableactuators 0
		createplatformmessagebox {
			title = <notification_title>
			message = <notification_description>
			buttons = [
				"OK"
			]
			user = <i>
			active_button = 0
		}
		if ismovieplaying textureslot = 0
			resumemovie textureslot = 0
		endif
		if ismovieplaying textureslot = 1
			resumemovie textureslot = 1
		endif
	endif
	change ve_hard_load_zone = none
	killspawnedscript name = game_progress_process_status
	if (<level> = load_z_mainmenu)
		if NOT xboxlive_menus_active
			if ($memcard_using_new_save_system = 1)
				mc_waitasyncopsfinished
			endif
			dialog_box_exit
			sysnotify_cleanup_ui
			fadetoblack off time = 0 no_wait
			ui_change_state state = uistate_mainmenu
			change signin_change_happening = 0
			return
		endif
	endif
	if screenelementexists id = link_lost_dialog_anchor
		change signin_change_happening = 0
		fadetoblack off time = 0 no_wait
		return
	endif
	sysnotify_cleanup_misc
	if innetgame
		quit_network_game
	else
		level_select_change_level_quit level = $load_z_mainmenu
	endif
	change signin_change_happening = 0
endscript
sysnotify_allow_invite = 1

script sysnotify_handle_game_invite 
	printf "----------------------------"
	printf "sysnotify_handle_game_invite"
	printf "----------------------------"
	fadetoblack on alpha = 1 time = 0
	ve_panic_unload_ve no_hard_load_zone
	if ($signin_change_happening = 1)
		begin
		if ($signin_change_happening = 0)
			break
		endif
		fadetoblack off time = 0 no_wait
		wait 1 frame
		repeat
	endif
	begin
	if ($ui_mainmovies_playing_movie = 0)
		break
	endif
	fadetoblack off time = 0 no_wait
	wait 5 gameframes
	repeat
	if cd
		if ($ui_mainmenu_showed_legal = 0)
			change sysnotify_allow_invite = 0
		endif
		begin
		if ($sysnotify_allow_invite = 1)
			break
		endif
		fadetoblack off time = 0 no_wait
		wait 5 gameframes
		repeat
		begin
		if IsFileCacheFinished
			break
		endif
		wait 5 gameframes
		repeat
	endif
	spawnscript sysnotify_invite_go params = {<...>}
endscript

script sysnotify_invite_cancel 
	sysnotify_handle_unpause
	dialog_box_exit
endscript

script sysnotify_invite_go 
	printf 'sysnotify_invite_go'
	setbuttoneventmappings block_menu_input
	onexitrun sysnotify_invite_died_restore_menu_input
	fadetoblack off time = 0 no_wait
	if gotparam cross_game
		cross_game_invite_accepted <...>
	else
		sysnotify_wait_until_safe
		fadetoblack on alpha = 1 time = 0 z_priority = 3000
		sysnotify_cleanup_misc
		change milestone_screens_active = 0
		if gotparam is_inactive_controller
			if checksumequals a = <is_inactive_controller> b = true
				printf 'sysnotify_invite_go - reset progress for inactive controller'
				sysnotify_reset_user_progress
			endif
		endif
		if gotparam controllerid
			GetCurrentSkaterProfileIndex
			BindControllerToSkater skater_heap_index = <currentskaterprofileindex> controller = <controllerid>
			BindFrontEndToController front_end_pad = <currentskaterprofileindex> controller = <controllerid>
		endif
		onexitrun
		invite_accepted <...>
	endif
endscript

script sysnotify_invite_died_restore_menu_input 
	printf \{'WARNING: sysnotify_invite_died_restore_menu_input indicates the invite flow was killed!'}
	setbuttoneventmappings \{unblock_menu_input}
endscript
DONT_ALLOW_INPUT_IN_ONLINE = 0

script sysnotify_handle_connection_loss 
	printf "--------------------------------"
	printf "sysnotify_handle_connection_loss"
	printf "--------------------------------"
	change DONT_ALLOW_INPUT_IN_ONLINE = 1
	sysnotify_wait_until_safe
	cleanup_sessionfuncs
	change DONT_ALLOW_INPUT_IN_ONLINE = 0
	create_link_unplugged_dialog
endscript

script sysnotify_cleanup_misc 
	if screenelementexists id = root_window
		launchevent type = unfocus target = root_window
	endif
	sysnotify_cleanup_ui
	if infrontend
		killspawnedscript name = attract_mode_timer
		if screenelementexists id = cas_category_anchor
			destroyscreenelement id = cas_category_anchor
		endif
		if screenelementexists id = progress_anchor
			destroyscreenelement id = progress_anchor
		endif
	endif
	destroy_onscreen_keyboard
	if innetgame
		force_close_rankings dont_retry
		if localskaterexists
			skater :vibrate off
		endif
		if NOT isobserving
			exitsurveyormode
		endif
		dialog_box_exit anchor_id = link_lost_dialog_anchor
		dialog_box_exit anchor_id = quit_dialog_anchor
	endif
	if screenelementexists id = piece_menu_hmenu
		destroyscreenelement id = piece_menu_hmenu
	endif
	change ve_zone_change_level_action = none
	change ve_zone_change_level_action_params = {}
	change ve_rendering_cancelled = 1
	ve_exit_video_editor
	dialog_box_exit
	change main_menu_return_to_createamodes = 0
	change inside_pause = 0
	kill_start_key_binding
	mc_waitasyncopsfinished
	autosave_failed
	killspawnedscript name = main_menu_exit
	getcurrentlevel
	if (<level> = load_z_bedroom)
		if viewportexists id = z_bedroom_select_viewport
			z_bedroom_kill_select_bink
		endif
	endif
endscript

script sysnotify_cleanup_ui 
	printf "--------------------------------"
	printf "sysnotify_cleanup_ui"
	printf "--------------------------------"
	killspawnedscript name = ui_mainmovies_wait_for_movie
	killspawnedscript name = ui_initial_interactive_screen
	killspawnedscript name = ui_attract_wait_for_movie
	killspawnedscript name = ui_mainmenu_wait_for_movie
	killspawnedscript name = attract_timer_wait
	killspawnedscript name = game_intro_initial_cam
	killspawnedscript name = ui_ticker_queue_next_item
	killspawnedscript name = slow_to_pause_checking_for_buttons
	killspawnedscript name = ui_show_accolade
	killspawnedscript name = ui_create_loadgame
	killspawnedscript name = launch_career_menu_load_game_sequence
	killspawnedscript name = launch_options_menu_load_game_sequence
	killspawnedscript name = ui_yourlife_goto_new_career
	killspawnedscript name = ui_yourlife_goto_new_career_okay
	killspawnedscript name = ui_yourlife_goto_new_career_do_save
	killskatercamanim name = game_intro_initial_igc_cam
	if screenelementexists id = ui_mainmovie_wait_anchor
		destroyscreenelement id = ui_mainmovie_wait_anchor
	endif
	hideloadingscreen
	killallmovies blocking
	if viewportexists id = z_mainmenu_bink_viewport
		pushassetcontext context = z_mainmenu
		destroyviewporttextureoverride id = z_mainmenu_bink_viewport
		destroyviewport id = z_mainmenu_bink_viewport
		popassetcontext
	endif
	if viewportexists id = thp8_shop_viewport
		pushassetcontext context = z_shops
		destroyviewporttextureoverride id = thp8_shop_viewport
		destroyviewport id = thp8_shop_viewport
		popassetcontext
	endif
	change pause_fmv_playing = 0
	change goal_presentation_hold_requests = 0
	ui_destroy_photo_viewer
	if screenelementexists id = sponsor_check_anchor
		destroyscreenelement id = sponsor_check_anchor
	endif
	unload_sponsor_logos_pak
	unloadpak 'pak/videophone/videophone.pak'
	killspawnedscript name = videophone_menu_wait_and_focus
	killspawnedscript name = videophone_priority_msg
	if screenelementexists id = videophone_root
		destroyscreenelement id = videophone_root
	endif
	if screenelementexists id = helper_text_anchor
		destroyscreenelement id = helper_text_anchor
	endif
	destroy_pause_back
	killskatercamanim name = ui_pausemenu_cam
	waitunloadpak 'pak/videophone/videophone.pak' block
	if screenelementexists id = progress_container
		destroyscreenelement id = progress_container
	endif
	unloadpak 'pak/ui_accolades/ui_accolades.pak'
	waitunloadpak
	killspawnedscript name = xenon_handle_first_input
	if screenelementexists id = edit_tricks_menu_parts_anchor
		destroyscreenelement id = edit_tricks_menu_parts_anchor
	endif
	if screenelementexists id = edit_tricks_sub_menu_anchor
		destroyscreenelement id = edit_tricks_sub_menu_anchor
	endif
	if screenelementexists id = choose_trick_menu_container
		destroyscreenelement id = choose_trick_menu_container
	endif
	if screenelementexists id = ui_mainmenu_wait_anchor
		destroyscreenelement id = ui_mainmenu_wait_anchor
	endif
	if screenelementexists id = select_skater_anchor
		destroyscreenelement id = select_skater_anchor
	endif
	if screenelementexists id = dialog_xbox_anchor
		destroyscreenelement id = dialog_xbox_anchor
	endif
	if screenelementexists id = slow_and_wait_input_event
		destroyscreenelement id = slow_and_wait_input_event
	endif
	if screenelementexists id = goal_container
		destroyscreenelement id = goal_container
	endif
	if screenelementexists id = goal_arcade_container
		destroyscreenelement id = goal_arcade_container
	endif
endscript
