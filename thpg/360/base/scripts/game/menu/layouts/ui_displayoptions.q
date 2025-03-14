DISPLAYOPTIONS_SE_Brightness = 0
DISPLAYOPTIONS_NO_DISPLAY_HUD = 0
DISPLAYOPTIONS_NO_DISPLAY_COMPASS = 0
DISPLAYOPTIONS_NO_DISPLAY_TRICKSTRING = 0
DISPLAYOPTIONS_NO_DISPLAY_BALANCE = 0
DISPLAYOPTIONS_NO_DISPLAY_CUTSCENE_SUBTITLES = 0
DISPLAYOPTIONS_NO_DISPLAY_NET_SCORES = 0
DISPLAYOPTIONS_was_checked = 0

script display_options_check_globals 
	change DISPLAYOPTIONS_SE_Brightness = ($se_brightness)
	if getglobalflag flag = $no_display_hud
		change DISPLAYOPTIONS_NO_DISPLAY_HUD = 1
	else
		change DISPLAYOPTIONS_NO_DISPLAY_HUD = 0
	endif
	if getglobalflag flag = $NO_DISPLAY_COMPASS
		change DISPLAYOPTIONS_NO_DISPLAY_COMPASS = 1
	else
		change DISPLAYOPTIONS_NO_DISPLAY_COMPASS = 0
	endif
	if getglobalflag flag = $no_display_trickstring
		change DISPLAYOPTIONS_NO_DISPLAY_TRICKSTRING = 1
	else
		change DISPLAYOPTIONS_NO_DISPLAY_TRICKSTRING = 0
	endif
	if getglobalflag flag = $NO_DISPLAY_BALANCE
		change DISPLAYOPTIONS_NO_DISPLAY_BALANCE = 1
	else
		change DISPLAYOPTIONS_NO_DISPLAY_BALANCE = 0
	endif
	if getglobalflag flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
		change DISPLAYOPTIONS_NO_DISPLAY_CUTSCENE_SUBTITLES = 1
	else
		change DISPLAYOPTIONS_NO_DISPLAY_CUTSCENE_SUBTITLES = 0
	endif
	if getglobalflag flag = $no_display_net_scores
		change DISPLAYOPTIONS_NO_DISPLAY_NET_SCORES = 1
	else
		change DISPLAYOPTIONS_NO_DISPLAY_NET_SCORES = 0
	endif
	change DISPLAYOPTIONS_was_checked = 1
endscript

script display_options_reset_globals 
	change \{DISPLAYOPTIONS_SE_Brightness = 0}
	change \{DISPLAYOPTIONS_NO_DISPLAY_HUD = 0}
	change \{DISPLAYOPTIONS_NO_DISPLAY_COMPASS = 0}
	change \{DISPLAYOPTIONS_NO_DISPLAY_TRICKSTRING = 0}
	change \{DISPLAYOPTIONS_NO_DISPLAY_BALANCE = 0}
	change \{DISPLAYOPTIONS_NO_DISPLAY_CUTSCENE_SUBTITLES = 0}
	change \{DISPLAYOPTIONS_NO_DISPLAY_NET_SCORES = 0}
	change \{DISPLAYOPTIONS_was_checked = 0}
endscript

script display_options_has_changed 
	if NOT (($DISPLAYOPTIONS_SE_Brightness) = ($se_brightness))
		return true
	endif
	if getglobalflag flag = $no_display_hud
		if (($DISPLAYOPTIONS_NO_DISPLAY_HUD) = 0)
			return true
		endif
	else
		if (($DISPLAYOPTIONS_NO_DISPLAY_HUD) = 1)
			return true
		endif
	endif
	if getglobalflag flag = $NO_DISPLAY_COMPASS
		if (($DISPLAYOPTIONS_NO_DISPLAY_COMPASS) = 0)
			return true
		endif
	else
		if (($DISPLAYOPTIONS_NO_DISPLAY_COMPASS) = 1)
			return true
		endif
	endif
	if getglobalflag flag = $no_display_trickstring
		if (($DISPLAYOPTIONS_NO_DISPLAY_TRICKSTRING) = 0)
			return true
		endif
	else
		if (($DISPLAYOPTIONS_NO_DISPLAY_TRICKSTRING) = 1)
			return true
		endif
	endif
	if getglobalflag flag = $NO_DISPLAY_BALANCE
		if (($DISPLAYOPTIONS_NO_DISPLAY_BALANCE) = 0)
			return true
		endif
	else
		if (($DISPLAYOPTIONS_NO_DISPLAY_BALANCE) = 1)
			return true
		endif
	endif
	if getglobalflag flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
		if (($DISPLAYOPTIONS_NO_DISPLAY_CUTSCENE_SUBTITLES) = 0)
			return true
		endif
	else
		if (($DISPLAYOPTIONS_NO_DISPLAY_CUTSCENE_SUBTITLES) = 1)
			return true
		endif
	endif
	if getglobalflag flag = $no_display_net_scores
		if (($DISPLAYOPTIONS_NO_DISPLAY_NET_SCORES) = 0)
			return true
		endif
	else
		if (($DISPLAYOPTIONS_NO_DISPLAY_NET_SCORES) = 1)
			return true
		endif
	endif
	return false
endscript

script display_options_restore_globals 
	if display_options_has_changed
		if NOT (($DISPLAYOPTIONS_SE_Brightness) = ($se_brightness))
			change se_brightness = ($DISPLAYOPTIONS_SE_Brightness)
			tod_proxim_update_lightfx
		endif
		if getglobalflag flag = $no_display_hud
			if (($DISPLAYOPTIONS_NO_DISPLAY_HUD) = 0)
				unsetglobalflag flag = $no_display_hud
				if gman_hasactivegoals
					gman_getactivatedgoalid
					if gman_goalexists goal = <activated_goal_id>
						if gman_goalisactive goal = <activated_goal_id>
							gman_getgoaltype goal = <activated_goal_id>
							switch <goal_type>
								case classic
								case comp
								case demo
								case elimiskate
								case getthere
								case turf
								panel_show_score_in_goal
								hud_switch_nollie
								default
								printf "not showing this omg!"
							endswitch
						endif
					endif
				endif
				if insplitscreengame
					setscreenelementprops id = splitscreen_total_score_container unhide
					setscreenelementprops id = (splitscreen_total_score_container + 1) unhide
				endif
			endif
		else
			if (($DISPLAYOPTIONS_NO_DISPLAY_HUD) = 1)
				setglobalflag flag = $no_display_hud
				panel_hide_score_in_goal
				if insplitscreengame
					setscreenelementprops id = splitscreen_total_score_container hide
					setscreenelementprops id = (splitscreen_total_score_container + 1) hide
				endif
			endif
		endif
		if getglobalflag flag = $NO_DISPLAY_COMPASS
			if (($DISPLAYOPTIONS_NO_DISPLAY_COMPASS) = 0)
				unsetglobalflag flag = $NO_DISPLAY_COMPASS
			endif
		else
			if (($DISPLAYOPTIONS_NO_DISPLAY_COMPASS) = 1)
				setglobalflag flag = $NO_DISPLAY_COMPASS
			endif
		endif
		if getglobalflag flag = $no_display_trickstring
			if (($DISPLAYOPTIONS_NO_DISPLAY_TRICKSTRING) = 0)
				unsetglobalflag flag = $no_display_trickstring
			endif
		else
			if (($DISPLAYOPTIONS_NO_DISPLAY_TRICKSTRING) = 1)
				setglobalflag flag = $no_display_trickstring
			endif
		endif
		if getglobalflag flag = $NO_DISPLAY_BALANCE
			if (($DISPLAYOPTIONS_NO_DISPLAY_BALANCE) = 0)
				unsetglobalflag flag = $NO_DISPLAY_BALANCE
			endif
		else
			if (($DISPLAYOPTIONS_NO_DISPLAY_BALANCE) = 1)
				setglobalflag flag = $NO_DISPLAY_BALANCE
			endif
		endif
		if getglobalflag flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
			if (($DISPLAYOPTIONS_NO_DISPLAY_CUTSCENE_SUBTITLES) = 0)
				unsetglobalflag flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
			endif
		else
			if (($DISPLAYOPTIONS_NO_DISPLAY_CUTSCENE_SUBTITLES) = 1)
				setglobalflag flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
			endif
		endif
		if getglobalflag flag = $no_display_net_scores
			if (($DISPLAYOPTIONS_NO_DISPLAY_NET_SCORES) = 0)
				unsetglobalflag flag = $no_display_net_scores
			endif
		else
			if (($DISPLAYOPTIONS_NO_DISPLAY_NET_SCORES) = 1)
				setglobalflag flag = $no_display_net_scores
			endif
		endif
	endif
	change DISPLAYOPTIONS_was_checked = 0
endscript

script ui_displayoptions_exit 
	if display_options_has_changed
		create_dialog_box {
			title = "Confirm changes?"
			text = "Would you like to apply the changes you have made?"
			pos = (320.0, 240.0)
			just = [center center]
			pad_back_script = dialog_box_exit
			buttons = [
				{font = text_a1 text = "YES" pad_choose_script = ui_displayoptions_choose pad_choose_params = {<...>}}
				{font = text_a1 text = "NO" pad_choose_script = ui_displayoptions_choose pad_choose_params = {<...> discard}}
				{font = text_a1 text = "CANCEL" pad_choose_script = dialog_box_exit}
			]
			no_helper_text
		}
	else
		ui_displayoptions_choose <...>
	endif
endscript

script ui_displayoptions_choose 
	if gotparam \{discard}
		display_options_restore_globals
	endif
	display_options_reset_globals
	ui_change_state \{state = UIstate_pauseoptions}
endscript

script ui_create_displayoptions 
	printf "UI: ui_create_displayoptions"
	if ($DISPLAYOPTIONS_was_checked = 0)
		display_options_check_globals
	endif
	make_cas_menu {
		title = "DISPLAY OPTIONS"
		pad_back_script = ui_displayoptions_exit
		pausemenu
		width = 550
	}
	add_cas_menu_item {
		text = "calibrate brightness"
		pad_choose_script = ui_display_show_calibrate_bink
		pad_choose_params = {
			movie = 'calibration_screens' start_frame = 0 loop_start = 0 loop_end = 0
			text = "adjust your television's brightness until\\nthe darkest vertical bar disappears"
		}
	}
	add_cas_menu_item {
		text = "adjust color"
		pad_choose_script = ui_display_show_calibrate_bink
		pad_choose_params = {
			movie = 'calibration_screens' start_frame = 33 loop_start = 33 loop_end = 33
			text = "adjust your television's color settings"
		}
	}
	if NOT infrontend
		formattext textname = brightness "%i" i = $se_brightness
		add_cas_menu_item {
			id = menu_screen_brightness
			text = "BRIGHTNESS:"
			extra_text = <brightness>
			option_arrows
			option_arrows_callback = menu_adjust_brightness
		}
		menu_adjust_brightness
	endif
	if getglobalflag flag = $no_display_hud
		<toggle> = off
	else
		<toggle> = on
	endif
	add_cas_menu_item {
		text = "SCORE"
		toggle = <toggle>
		toggle_script = ui_display_hide_score
	}
	if gamemodeequals is_career
		add_cas_menu_flag_item {
			text = "COMPASS"
			flag = $NO_DISPLAY_COMPASS
			reverse
		}
	endif
	add_cas_menu_flag_item {
		text = "TRICK STRING"
		flag = $no_display_trickstring
		reverse
	}
	if innetgame
		if NOT getglobalflag flag = $no_g_display_balance
			add_cas_menu_flag_item {
				text = "BALANCE METER"
				flag = $NO_DISPLAY_BALANCE
				reverse
			}
		endif
	else
		add_cas_menu_flag_item {
			text = "BALANCE METER"
			flag = $NO_DISPLAY_BALANCE
			reverse
		}
	endif
	if NOT innetgame
		add_cas_menu_flag_item {
			text = "SUBTITLES"
			flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
			reverse
		}
	endif
	if innetgame
		add_cas_menu_flag_item {
			text = "NAMES/SCORES"
			flag = $no_display_net_scores
			reverse
		}
	endif
	add_cas_menu_item text = "DONE" pad_choose_script = ui_displayoptions_exit
	cas_menu_finish helper_text = {
		helper_text_elements = [
			{text = "\\m1 BACK"}
			{text = "\\m0 ACCEPT"}
		]
	}
endscript

script ui_destroy_displayoptions 
	printf \{"UI: ui_destroy_displayoptions"}
	generic_ui_destroy
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if NOT ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
		endif
	endif
	if gamemodeequals \{is_career}
		if NOT getglobalflag \{flag = $NO_DISPLAY_COMPASS}
			CompassManager_Refresh
		endif
	endif
endscript

script ui_display_hide_score 
	if getglobalflag flag = $no_display_hud
		unsetglobalflag flag = $no_display_hud
		if gman_hasactivegoals
			gman_getactivatedgoalid
			if gman_goalexists goal = <activated_goal_id>
				if gman_goalisactive goal = <activated_goal_id>
					gman_getgoaltype goal = <activated_goal_id>
					switch <goal_type>
						case classic
						case comp
						case demo
						case elimiskate
						case getthere
						case turf
						panel_show_score_in_goal
						hud_switch_nollie
						default
						printf "not showing this omg!"
					endswitch
				endif
			endif
		endif
		if insplitscreengame
			setscreenelementprops id = splitscreen_total_score_container unhide
			setscreenelementprops id = (splitscreen_total_score_container + 1) unhide
		endif
	else
		setglobalflag flag = $no_display_hud
		panel_hide_score_in_goal
		if insplitscreengame
			setscreenelementprops id = splitscreen_total_score_container hide
			setscreenelementprops id = (splitscreen_total_score_container + 1) hide
		endif
	endif
endscript

script ui_display_show_calibrate_bink 
	setspawninstancelimits max = 1 management = ignore_spawn_request
	stoprendering
	kill_start_key_binding
	ui_destroy_displayoptions
	killallmovies
	if screenelementexists id = ui_display_show_movie
		destroyscreenelement id = ui_display_show_movie
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = ui_display_show_movie
		pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [
			{pad_back killallmovies}
		]
	}
	createscreenelement {
		type = movieelement
		parent = ui_display_show_movie
		pos = (0.0, 0.0)
		scale = (1280.0, 720.0)
		movie = <movie>
		textureslot = 0
		texturepri = 0
		start_frame = <start_frame>
		loop_start = <loop_start>
		loop_end = <loop_end>
		no_looping
		z_priority = 4000
	}
	create_helper_text {
		parent = ui_display_show_movie
		helper_text_elements = [{text = "\\m1 FINISH"}]
	}
	createscreenelement {
		type = textblockelement
		parent = ui_display_show_movie
		font = text_a1
		text = <text>
		scale = (0.9, 0.7)
		pos = (640.0, 580.0)
		just = [center center]
		rgba = [200 200 200 255]
		internal_just = [center center]
		dims = (960.0, 160.0)
		font_spacing = 2
		z_priority = 5000
	}
	launchevent target = ui_display_show_movie type = focus
	wait 2 gameframe
	startrendering
	begin
	if NOT ismovieplaying textureslot = 0
		break
	endif
	wait 1 gameframes
	repeat
	restore_start_key_binding
	ui_create_displayoptions
	generic_pause_exit_sound
	destroyscreenelement id = ui_display_show_movie
	if ismovieplaying textureslot = 0
		killmovie textureslot = 0
	endif
	if infrontend
		pause_menu_fmv_play
	endif
endscript
