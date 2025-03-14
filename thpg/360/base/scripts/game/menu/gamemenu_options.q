default_user_difficulty = 1
default_user_axis_inversion = 1
player_desired_camera_mode = 3

script create_real_cheats_menu back_script = create_options_menu back_params = {}
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if insplitscreengame
		goalmanager_hidepoints
	endif
	if NOT innetgame
		count = 0
		getarraysize $Cheat_Menu_Array
		i = 0
		begin
		addparams ($Cheat_Menu_Array [<i>])
		if gotparam unlock_flag
			if getglobalflag flag = <unlock_flag>
				count = (<count> + 1)
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
		if (<count> >= 8)
			make_cas_menu {
				id = cheats_menu
				title = "CHEATS"
				pausemenu
				width = 550
				pad_back_script = <back_script>
				pad_back_params = <back_params>
				scrolling
			}
		else
			make_cas_menu {
				id = cheats_menu
				title = "CHEATS"
				pausemenu
				width = 550
				pad_back_script = <back_script>
				pad_back_params = <back_params>
			}
		endif
	else
		make_cas_menu {
			id = cheats_menu
			title = "ADVANCED"
			pausemenu
			width = 550
			pad_back_script = <back_script>
			pad_back_params = <back_params>
		}
	endif
	if NOT innetgame
		foreachin $Cheat_Menu_Array do = cheat_menu_add_toggle
	else
		if ishost
			add_cas_menu_flag_item {
				text = "REVERTS"
				flag = $flag_g_expert_mode_no_reverts
				toggle_script = toggle_cheat
				toggle_params = {cheat_flag = flag_g_expert_mode_no_reverts}
				reverse
			}
			add_cas_menu_flag_item {
				text = "WALKING"
				flag = $flag_g_expert_mode_no_walking
				toggle_script = toggle_cheat
				toggle_params = {cheat_flag = flag_g_expert_mode_no_walking}
				reverse
			}
			add_cas_menu_flag_item {
				text = "MANUALS"
				flag = $flag_g_expert_mode_no_manuals
				toggle_script = toggle_cheat
				toggle_params = {cheat_flag = flag_g_expert_mode_no_manuals}
				reverse
			}
			add_cas_menu_flag_item {
				text = "BAL. METERS"
				flag = $no_g_display_balance
				toggle_script = toggle_cheat
				toggle_params = {cheat_flag = no_g_display_balance}
				reverse
			}
		endif
	endif
	add_cas_menu_item text = "DONE" pad_choose_script = <back_script> pad_choose_params = <back_params>
	cas_menu_finish
endscript

script cheat_menu_add_toggle 
	if gotparam \{unlock_flag}
		if NOT getglobalflag flag = <unlock_flag>
			return
		endif
	endif
	add_cas_menu_flag_item text = <text> flag = <flag>
endscript
CONTROLOPTIONS_vibration = 0
CONTROLOPTIONS_camera_invert_x = 0
CONTROLOPTIONS_camera_invert_y = 0
CONTROLOPTIONS_skater_speed = 0
CONTROLOPTIONS_camera_mode = 0
CONTROLOPTIONS_autokick = 0
CONTROLOPTIONS_street_tech = 0
CONTROLOPTIONS_tilt_balance = 0
CONTROLOPTIONS_tilt_steering = 0
CONTROLOPTIONS_tilt_senstivity = 0
CONTROLOPTIONS_no_reverts = 0
CONTROLOPTIONS_no_manuals = 0
CONTROLOPTIONS_no_walking = 0
CONTROLOPTIONS_was_checked = 0
CONTROLOPTIONS_player_num = 0

script control_options_check_globals 
	change CONTROLOPTIONS_player_num = (<controller_number> - 1)
	if VibrationIsOn <player>
		change CONTROLOPTIONS_vibration = 1
	else
		change CONTROLOPTIONS_vibration = 0
	endif
	if (($CONTROLOPTIONS_player_num) = 0)
		<skatercam> = skatercam0
	else
		<skatercam> = skatercam1
	endif
	if compositeobjectexists <skatercam>
		if <skatercam> :islookaroundxinverted
			change CONTROLOPTIONS_camera_invert_x = 1
		else
			change CONTROLOPTIONS_camera_invert_x = 0
		endif
		if <skatercam> :islookaroundyinverted
			change CONTROLOPTIONS_camera_invert_y = 1
		else
			change CONTROLOPTIONS_camera_invert_y = 0
		endif
	endif
	change CONTROLOPTIONS_skater_speed = ($test_current_skater_speed)
	<skatercam> :sc_getmode
	change CONTROLOPTIONS_camera_mode = <mode>
	if AutokickIsOn ($CONTROLOPTIONS_player_num)
		change CONTROLOPTIONS_autokick = 1
	else
		change CONTROLOPTIONS_autokick = 0
	endif
	if getglobalflag flag = $cheat_sim_mode
		change CONTROLOPTIONS_street_tech = 1
	else
		change CONTROLOPTIONS_street_tech = 0
	endif
	if isps3
		TiltControlGetParams ($CONTROLOPTIONS_player_num)
		if checksumequals a = (<tilt_params>.motionbalanceactive) b = true
			change CONTROLOPTIONS_tilt_balance = 1
		else
			change CONTROLOPTIONS_tilt_balance = 0
		endif
		if checksumequals a = (<tilt_params>.motionsteeringactive) b = true
			change CONTROLOPTIONS_tilt_steering = 1
		else
			change CONTROLOPTIONS_tilt_steering = 0
		endif
		change CONTROLOPTIONS_tilt_senstivity = (<tilt_params>.motionsensitivity)
	endif
	if getglobalflag flag = $FLAG_EXPERT_MODE_NO_REVERTS
		change CONTROLOPTIONS_no_reverts = 1
	else
		change CONTROLOPTIONS_no_reverts = 0
	endif
	if getglobalflag flag = $FLAG_EXPERT_MODE_NO_MANUALS
		change CONTROLOPTIONS_no_manuals = 1
	else
		change CONTROLOPTIONS_no_manuals = 0
	endif
	if getglobalflag flag = $FLAG_EXPERT_MODE_NO_WALKING
		change CONTROLOPTIONS_no_walking = 1
	else
		change CONTROLOPTIONS_no_walking = 0
	endif
	change CONTROLOPTIONS_was_checked = 1
endscript

script control_options_reset_globals 
	change CONTROLOPTIONS_vibration = 0
	change CONTROLOPTIONS_camera_invert_x = 0
	change CONTROLOPTIONS_camera_invert_y = 0
	change CONTROLOPTIONS_skater_speed = 0
	change CONTROLOPTIONS_camera_mode = 0
	change CONTROLOPTIONS_autokick = 0
	change CONTROLOPTIONS_street_tech = 0
	change CONTROLOPTIONS_tilt_balance = 0
	change CONTROLOPTIONS_tilt_steering = 0
	change CONTROLOPTIONS_tilt_senstivity = 0
	change CONTROLOPTIONS_no_reverts = 0
	change CONTROLOPTIONS_no_manuals = 0
	change CONTROLOPTIONS_no_walking = 0
	change CONTROLOPTIONS_was_checked = 0
endscript

script control_options_has_changed 
	if VibrationIsOn ($CONTROLOPTIONS_player_num)
		if (($CONTROLOPTIONS_vibration) = 0)
			return true
		endif
	else
		if (($CONTROLOPTIONS_vibration) = 1)
			return true
		endif
	endif
	if (($CONTROLOPTIONS_player_num) = 0)
		<skatercam> = skatercam0
	else
		<skatercam> = skatercam1
	endif
	if compositeobjectexists <skatercam>
		if <skatercam> :islookaroundxinverted
			if (($CONTROLOPTIONS_camera_invert_x) = 0)
				return true
			endif
		else
			if (($CONTROLOPTIONS_camera_invert_x) = 1)
				return true
			endif
		endif
		if <skatercam> :islookaroundyinverted
			if (($CONTROLOPTIONS_camera_invert_y) = 0)
				return true
			endif
		else
			if (($CONTROLOPTIONS_camera_invert_y) = 1)
				return true
			endif
		endif
	endif
	if NOT (($CONTROLOPTIONS_skater_speed) = ($test_current_skater_speed))
		return true
	endif
	<skatercam> :sc_getmode
	if NOT (($CONTROLOPTIONS_camera_mode) = <mode>)
		return true
	endif
	if AutokickIsOn ($CONTROLOPTIONS_player_num)
		if (($CONTROLOPTIONS_autokick) = 0)
			return true
		endif
	else
		if (($CONTROLOPTIONS_autokick) = 1)
			return true
		endif
	endif
	if getglobalflag flag = $cheat_sim_mode
		if (($CONTROLOPTIONS_street_tech) = 0)
			return true
		endif
	else
		if (($CONTROLOPTIONS_street_tech) = 1)
			return true
		endif
	endif
	if isps3
		TiltControlGetParams ($CONTROLOPTIONS_player_num)
		if checksumequals a = (<tilt_params>.motionbalanceactive) b = true
			if (($CONTROLOPTIONS_tilt_balance) = 0)
				return true
			endif
		else
			if (($CONTROLOPTIONS_tilt_balance) = 1)
				return true
			endif
		endif
		if checksumequals a = (<tilt_params>.motionsteeringactive) b = true
			if (($CONTROLOPTIONS_tilt_steering) = 0)
				return true
			endif
		else
			if (($CONTROLOPTIONS_tilt_steering) = 1)
				return true
			endif
		endif
		if NOT (($CONTROLOPTIONS_tilt_senstivity) = (<tilt_params>.motionsensitivity))
			return true
		endif
	endif
	if getglobalflag flag = $FLAG_EXPERT_MODE_NO_REVERTS
		if (($CONTROLOPTIONS_no_reverts) = 0)
			return true
		endif
	else
		if (($CONTROLOPTIONS_no_reverts) = 1)
			return true
		endif
	endif
	if getglobalflag flag = $FLAG_EXPERT_MODE_NO_MANUALS
		if (($CONTROLOPTIONS_no_manuals) = 0)
			return true
		endif
	else
		if (($CONTROLOPTIONS_no_manuals) = 1)
			return true
		endif
	endif
	if getglobalflag flag = $FLAG_EXPERT_MODE_NO_WALKING
		if (($CONTROLOPTIONS_no_walking) = 0)
			return true
		endif
	else
		if (($CONTROLOPTIONS_no_walking) = 1)
			return true
		endif
	endif
	return false
endscript

script control_options_restore_globals 
	if control_options_has_changed
		if VibrationIsOn ($CONTROLOPTIONS_player_num)
			if (($CONTROLOPTIONS_vibration) = 0)
				VibrationOff ($CONTROLOPTIONS_player_num)
			endif
		else
			if (($CONTROLOPTIONS_vibration) = 1)
				vibrationon ($CONTROLOPTIONS_player_num)
			endif
		endif
		if (($CONTROLOPTIONS_player_num) = 0)
			<skatercam> = skatercam0
		else
			<skatercam> = skatercam1
		endif
		if compositeobjectexists <skatercam>
			if <skatercam> :islookaroundxinverted
				if (($CONTROLOPTIONS_camera_invert_x) = 0)
					<skatercam> :lookaroundsetinvertx on = 0
				endif
			else
				if (($CONTROLOPTIONS_camera_invert_x) = 1)
					<skatercam> :lookaroundsetinvertx on = 1
				endif
			endif
			if <skatercam> :islookaroundyinverted
				if (($CONTROLOPTIONS_camera_invert_y) = 0)
					<skatercam> :lookaroundsetinverty on = 0
				endif
			else
				if (($CONTROLOPTIONS_camera_invert_y) = 1)
					<skatercam> :lookaroundsetinverty on = 1
				endif
			endif
		endif
		if NOT (($CONTROLOPTIONS_skater_speed) = ($test_current_skater_speed))
			change test_current_skater_speed = ($CONTROLOPTIONS_skater_speed)
		endif
		<skatercam> :sc_getmode
		if NOT (($CONTROLOPTIONS_camera_mode) = <mode>)
			<skatercam> :sc_setmode mode = <mode>
		endif
		if AutokickIsOn ($CONTROLOPTIONS_player_num)
			if (($CONTROLOPTIONS_autokick) = 0)
				AutokickOff ($CONTROLOPTIONS_player_num)
			endif
		else
			if (($CONTROLOPTIONS_autokick) = 1)
				autokickon ($CONTROLOPTIONS_player_num)
			endif
		endif
		if getglobalflag flag = $cheat_sim_mode
			if (($CONTROLOPTIONS_street_tech) = 0)
				unsetglobalflag flag = $cheat_sim_mode
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
				unsetglobalflag flag = $NO_DISPLAY_COMPASS
				unsetglobalflag flag = $no_display_trickstring
				unsetglobalflag flag = $NO_DISPLAY_BALANCE
				unsetglobalflag flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
				unsetglobalflag flag = $no_display_net_scores
			endif
		else
			if (($CONTROLOPTIONS_street_tech) = 1)
				setglobalflag flag = $cheat_sim_mode
				setglobalflag flag = $no_display_hud
				panel_hide_score_in_goal
				if insplitscreengame
					setscreenelementprops id = splitscreen_total_score_container hide
					setscreenelementprops id = (splitscreen_total_score_container + 1) hide
				endif
				setglobalflag flag = $NO_DISPLAY_COMPASS
				setglobalflag flag = $no_display_trickstring
				setglobalflag flag = $NO_DISPLAY_BALANCE
				setglobalflag flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
				setglobalflag flag = $no_display_net_scores
			endif
		endif
		if isps3
			TiltControlGetParams ($CONTROLOPTIONS_player_num)
			if checksumequals a = (<tilt_params>.motionbalanceactive) b = true
				if (($CONTROLOPTIONS_tilt_balance) = 0)
					addparam name = motionbalanceactive value = false
					TiltControlSetParams <...>
				endif
			else
				if (($CONTROLOPTIONS_tilt_balance) = 1)
					addparam name = motionbalanceactive value = true
					TiltControlSetParams <...>
				endif
			endif
			if checksumequals a = (<tilt_params>.motionsteeringactive) b = true
				if (($CONTROLOPTIONS_tilt_steering) = 0)
					addparam name = motionsteeringactive value = false
					TiltControlSetParams <...>
				endif
			else
				if (($CONTROLOPTIONS_tilt_steering) = 1)
					addparam name = motionsteeringactive value = true
					TiltControlSetParams <...>
				endif
			endif
			if NOT (($CONTROLOPTIONS_tilt_senstivity) = (<tilt_params>.motionsensitivity))
				TiltControlSetParams ($CONTROLOPTIONS_player_num) motionsensitivity = ($CONTROLOPTIONS_tilt_senstivity)
			endif
		endif
		if getglobalflag flag = $FLAG_EXPERT_MODE_NO_REVERTS
			if (($CONTROLOPTIONS_no_reverts) = 0)
				unsetglobalflag flag = $FLAG_EXPERT_MODE_NO_REVERTS
			endif
		else
			if (($CONTROLOPTIONS_no_reverts) = 1)
				setglobalflag flag = $FLAG_EXPERT_MODE_NO_REVERTS
			endif
		endif
		if getglobalflag flag = $FLAG_EXPERT_MODE_NO_MANUALS
			if (($CONTROLOPTIONS_no_manuals) = 0)
				unsetglobalflag flag = $FLAG_EXPERT_MODE_NO_MANUALS
			endif
		else
			if (($CONTROLOPTIONS_no_manuals) = 1)
				setglobalflag flag = $FLAG_EXPERT_MODE_NO_MANUALS
			endif
		endif
		if getglobalflag flag = $FLAG_EXPERT_MODE_NO_WALKING
			if (($CONTROLOPTIONS_no_walking) = 0)
				unsetglobalflag flag = $FLAG_EXPERT_MODE_NO_WALKING
			endif
		else
			if (($CONTROLOPTIONS_no_walking) = 1)
				setglobalflag flag = $FLAG_EXPERT_MODE_NO_WALKING
			endif
		endif
	endif
endscript

script ui_controloptions_exit 
	if control_options_has_changed
		create_dialog_box {
			title = "Confirm Changes?"
			text = "Would you like to apply the changes you have made?"
			pos = (320.0, 240.0)
			just = [center center]
			pad_back_script = dialog_box_exit
			buttons = [
				{font = text_a1 text = "YES" pad_choose_script = ui_controloptions_choose pad_choose_params = {<...>}}
				{font = text_a1 text = "NO" pad_choose_script = ui_controloptions_choose pad_choose_params = {<...> discard}}
				{font = text_a1 text = "CANCEL" pad_choose_script = dialog_box_exit}
			]
			no_helper_text
		}
	else
		ui_controloptions_choose <...>
	endif
endscript

script ui_controloptions_choose 
	if gotparam \{discard}
		control_options_restore_globals
	endif
	control_options_reset_globals
	ui_change_state \{state = UIstate_pauseoptions}
endscript

script create_controller_config_menu pad_back_script = ui_controloptions_exit
	if (($CONTROLOPTIONS_was_checked) = 0)
		control_options_check_globals <...>
	endif
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	helper_text = {helper_text_elements = [{text = "\\m1 BACK"}
			{text = "\\m0 ACCEPT"}
		]
	}
	if isps3
		<scrolling> = {scrolling}
	endif
	make_cas_menu {
		menu_id = menu_control
		vmenu_id = vmenu_control
		title = "CONTROL SETUP"
		pausemenu
		width = 550
		highlight_add = (50.0, 0.0)
		<scrolling>
	}
	if infrontend
		change joystick_pushed = 0
		setscreenelementprops {
			id = vmenu_control
		}
	endif
	vibration_text = "VIBRATION"
	if gotparam from_options
		<from_options> = from_options
	endif
	setscreenelementprops {
		id = vmenu_control
		event_handlers = [
			{pad_back generic_menu_pad_back params = {callback = <pad_back_script> from_options = <from_options> <pad_back_params>}}
		]
	}
	pad_left_2 = null_script
	pad_right_2 = null_script
	<player> = (<controller_number> - 1)
	if VibrationIsOn <player>
		vibration_value = on
	else
		vibration_value = off
	endif
	if AutokickIsOn <player>
		autokick_value = on
	else
		autokick_value = off
	endif
	if SpinTapsAreOn <player>
		spintaps_value = on
	else
		spintaps_value = off
	endif
	if (<player> = 0)
		<skatercam> = skatercam0
	else
		<skatercam> = skatercam1
	endif
	if compositeobjectexists <skatercam>
		<show_camera_options> = 1
		if <skatercam> :islookaroundxinverted
			invert_camera_x_value = on
		else
			invert_camera_x_value = off
		endif
		if <skatercam> :islookaroundyinverted
			invert_camera_y_value = on
		else
			invert_camera_y_value = off
		endif
	else
		<show_camera_options> = 0
	endif
	if isps3
		TiltControlGetParams <player>
		if checksumequals a = (<tilt_params>.motionbalanceactive) b = true
			<tilt_value> = on
		else
			<tilt_value> = off
		endif
		add_cas_menu_item {
			id = menu_tilt1
			text = "TILT BALANCE"
			toggle = <tilt_value>
			toggle_script = control_change_values
			toggle_params = {tilt tilt_field = motionbalanceactive controller_number = <controller_number>}
		}
		if checksumequals a = (<tilt_params>.motionsteeringactive) b = true
			<tilt_value> = on
		else
			<tilt_value> = off
		endif
		add_cas_menu_item {
			id = menu_tilt2
			text = "TILT STEERING"
			toggle = <tilt_value>
			toggle_script = control_change_values
			toggle_params = {tilt tilt_field = motionsteeringactive controller_number = <controller_number>}
		}
		add_cas_menu_item {
			id = menu_tilt4
			text = "TILT SENSITIVITY:"
			extra_text = ""
			option_arrows
			option_arrows_callback = menu_adjust_tilt_sensitivity
		}
		menu_adjust_tilt_sensitivity
	else
		add_cas_menu_item {
			id = menu_vibration
			text = <vibration_text>
			toggle = <vibration_value>
			toggle_script = control_change_values
			toggle_params = {vibration controller_number = <controller_number>}
		}
	endif
	if (<show_camera_options> = 1)
		add_cas_menu_item {
			id = menu_invert_camera_x_axis
			text = "INVERT X-AXIS"
			toggle = <invert_camera_x_value>
			toggle_script = control_change_values
			toggle_params = {invertcamerax controller_number = <controller_number>}
		}
		add_cas_menu_item {
			id = menu_invert_camera_y_axis
			text = "INVERT Y-AXIS"
			toggle = <invert_camera_y_value>
			toggle_script = control_change_values
			toggle_params = {invertcameray controller_number = <controller_number>}
		}
	endif
	draw_expertoptions = 0
	if (<draw_expertoptions> = 1)
		if ((innetgame) && (getglobalflag flag = $flag_g_expert_mode_no_reverts))
			flag = not_focusable
		else
			flag = ""
		endif
		add_cas_menu_flag_item {
			id = menu_reverts
			flag = $FLAG_EXPERT_MODE_NO_REVERTS
			text = "NO REVERTS"
			<flag>
		}
		if ((innetgame) && (getglobalflag flag = $flag_g_expert_mode_no_manuals))
			flag = not_focusable
		else
			flag = ""
		endif
		add_cas_menu_flag_item {
			id = menu_manuals
			flag = $FLAG_EXPERT_MODE_NO_MANUALS
			text = "NO MANUALS"
			<flag>
		}
		if ((innetgame) && (getglobalflag flag = $flag_g_expert_mode_no_walking))
			flag = not_focusable
		else
			flag = ""
		endif
		add_cas_menu_flag_item {
			id = menu_walking
			flag = $FLAG_EXPERT_MODE_NO_WALKING
			text = "NO WALKING"
			<flag>
		}
	endif
	if NOT infrontend
		if gamemodeequals is_career is_singlesession
			formattext textname = skater_speed "%d" d = $test_current_skater_speed
			add_cas_menu_item {
				id = menu_skater_speed
				text = "SKATER SPEED"
				extra_text = <skater_speed>
				option_arrows
				option_arrows_callback = menu_alter_skater_speed
			}
		endif
	endif
	if NOT infrontend
		if NOT insplitscreengame
			formattext textname = skater_speed "%d" d = $test_current_skater_speed
			get_camera_mode_text
			add_cas_menu_item {
				id = menu_skater_camera_mode
				text = "CAMERA MODE"
				extra_text = <camera_text>
				option_arrows
				option_arrows_callback = menu_alter_camera_mode
			}
		endif
	endif
	if checksumequals a = $allow_auto_kick b = true
		<kick_value> = on
	else
		<kick_value> = off
	endif
	add_cas_menu_item {
		id = menu_auto_kick
		text = "AUTO KICK"
		toggle = <kick_value>
		toggle_script = control_change_values
		toggle_params = {kick controller_number = <controller_number>}
	}
	if getglobalflag flag = $cheat_sim_mode
		<sim_value> = on
	else
		<sim_value> = off
	endif
	add_cas_menu_item {
		id = menu_sim_mode
		text = "sim mode"
		toggle = <sim_value>
		toggle_script = menu_toggle_sim_mode
	}
	if gotparam from_options
		add_cas_menu_item {
			text = "DONE"
			id = menu_done
			pad_choose_script = generic_menu_pad_choose
			pad_choose_params = {
				callback = <pad_back_script>
				<pad_back_params>
				from_options = <from_options>
			}
		}
	else
		add_cas_menu_item {
			text = "DONE"
			id = menu_done
			pad_choose_script = generic_menu_pad_choose
			pad_choose_params = {
				callback = <pad_back_script>
				<pad_back_params>
				from_options = <from_options>
			}
		}
	endif
	cas_menu_finish helper_text = <helper_text>
endscript

script controller_config_exit 
	killspawnedscript \{name = shake_projector}
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	if gotparam \{from_options}
		create_options_menu
	else
		if gotparam \{from_movies}
			create_gamemovies_menu
		else
			create_gamesettings_menu
		endif
	endif
endscript

script control_sync_controller_settings 
	VibrateController port = 0 actuator = 1 percent = 0
	VibrateController port = 1 actuator = 1 percent = 0
	if VibrationIsOn 0
		vibrationon 1
	else
		VibrationOff 1
	endif
	TiltControlGetParams 0
	TiltControlSetParams 1 <tilt_params>
	if ((compositeobjectexists skatercam0) && (compositeobjectexists skatercam1))
		if skatercam0 :islookaroundxinverted
			skatercam1 :lookaroundsetinvertx on = 1
		else
			skatercam1 :lookaroundsetinvertx on = 0
		endif
		if skatercam0 :islookaroundyinverted
			skatercam1 :lookaroundsetinverty on = 1
		else
			skatercam1 :lookaroundsetinverty on = 0
		endif
	endif
endscript

script control_change_values 
	player = (<controller_number> - 1)
	if gotparam vibration
		killspawnedscript name = control_menu_vibrate_controller
		VibrateController port = <player> actuator = 1 percent = 0
		if VibrationIsOn <player>
			VibrationOff <player>
		else
			vibrationon <player>
			spawnscriptlater control_menu_vibrate_controller params = <...>
		endif
	endif
	if gotparam tilt
		TiltControlGetParams <player>
		if checksumequals a = (<tilt_params>.<tilt_field>) b = true
			addparam name = <tilt_field> value = false
			TiltControlSetParams <...>
		else
			addparam name = <tilt_field> value = true
			TiltControlSetParams <...>
		endif
	endif
	if gotparam autokick
		if AutokickIsOn <player>
			AutokickOff <player>
		else
			autokickon <player>
		endif
	endif
	if gotparam kick
		if ($allow_auto_kick = true)
			change allow_auto_kick = false
		else
			change allow_auto_kick = true
		endif
	endif
	if gotparam spintaps
		if SpinTapsAreOn <player>
			SpinTapsOff <player>
		else
			spintapson <player>
		endif
	endif
	if (<player> = 0)
		<skatercam> = skatercam0
	else
		<skatercam> = skatercam1
	endif
	if compositeobjectexists <skatercam>
		if gotparam invertcamerax
			if <skatercam> :islookaroundxinverted
				<skatercam> :lookaroundsetinvertx on = 0
			else
				<skatercam> :lookaroundsetinvertx on = 1
			endif
		endif
		if gotparam invertcameray
			if <skatercam> :islookaroundyinverted
				<skatercam> :lookaroundsetinverty on = 0
			else
				<skatercam> :lookaroundsetinverty on = 1
			endif
		endif
	endif
	control_sync_controller_settings
	temporarilydisableinput time = 100
endscript

script control_menu_vibrate_controller 
	if screenelementexists id = joystick_anchor
		spawnscriptlater shake_projector params = {id = joystick_anchor amplitude = 5 time = 0.05}
	endif
	if infrontend
		VibrateController port = <player> actuator = 1 percent = 70
		wait 250
		VibrateController port = <player> actuator = 1 percent = 0
		killspawnedscript name = shake_projector
	else
		index = 0
		begin
		if controllerboundtoskater controller = <index> skater = <player>
			VibrateController port = <index> actuator = 1 percent = 70 duration = 0.25 IgnorePause
			wait 250
			VibrateController port = <index> actuator = 1 percent = 0
			killspawnedscript name = shake_projector
			break
		endif
		index = (<index> + 1)
		repeat 4
	endif
	if screenelementexists id = joystick_anchor
		doscreenelementmorph id = joystick_anchor pos = (340.0, 30.0) time = 0.1
	endif
endscript
joystick_pushed = 0

script controller_config_focus 
	gettags
	text_color = [128 123 20 255]
	arrow_color = [128 128 128 240]
	main_theme_focus <...>
	setscreenelementprops {id = {<id> child = 4} rgba = <text_color>}
	setscreenelementprops {id = {<id> child = 5} rgba = <arrow_color>}
	setscreenelementprops {id = {<id> child = 6} rgba = <arrow_color>}
endscript

script controller_config_unfocus 
	gettags
	text_color = [128 128 128 240]
	main_theme_unfocus <...>
	setscreenelementprops {id = {<id> child = 4} rgba = <text_color>}
	setscreenelementprops {id = {<id> child = 5} rgba = [128 128 128 0]}
	setscreenelementprops {id = {<id> child = 6} rgba = [128 128 128 0]}
endscript

script create_split_menu callback_script = create_options_menu
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	make_cas_menu {
		title = "DISPLAY SETUP"
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = <callback_script>}
		pausemenu
	}
	add_cas_menu_item {
		text = "Horizontal Split"
		pad_choose_script = generic_menu_pad_choose
		pad_choose_params = {<...> callback = split_setup_horizontal}
	}
	add_cas_menu_item {
		text = "Vertical Split"
		pad_choose_script = generic_menu_pad_choose
		pad_choose_params = {<...> callback = split_setup_vertical}
	}
	goalmanager_hidepoints
	cas_menu_finish
endscript

script split_setup_horizontal 
	SetPreferencesFromUI \{prefs = splitscreen
		field = 'viewport_type'
		string = "Horizontal"
		checksum = viewport_type_horizontal}
	setscreenmode \{split_horizontal}
	skatercam0 :sc_resetmode
	skatercam1 :sc_resetmode
	ScreenElementSystemCleanup
	goalmanager_hidepoints
	if gotparam \{end_run}
		create_end_run_menu
	else
		pause_game_and_create_pause_menu
	endif
	UpdateScore
	setactivecamera \{id = skatercam0
		viewport = 0}
	setactivecamera \{id = skatercam1
		viewport = 1}
endscript

script split_setup_vertical 
	SetPreferencesFromUI \{prefs = splitscreen
		field = 'viewport_type'
		string = "Vertical"
		checksum = viewport_type_vertical}
	setscreenmode \{split_vertical}
	skatercam0 :sc_resetmode
	skatercam1 :sc_resetmode
	ScreenElementSystemCleanup
	goalmanager_hidepoints
	if gotparam \{end_run}
		create_end_run_menu
	else
		pause_game_and_create_pause_menu
	endif
	UpdateScore
	setactivecamera \{id = skatercam0
		viewport = 0}
	setactivecamera \{id = skatercam1
		viewport = 1}
endscript

script toggle_auto_brake_option 
	gettags
	GetPreferenceString pref_type = network auto_brake
	if (<ui_string> = "Off")
		text = "On"
		SetPreferencesFromUI prefs = network field = 'auto_brake' checksum = boolean_true string = "On"
		setscreenelementprops id = {<id> child = 0} text = "AUTO-BRAKE: On"
	else
		text = "Off"
		SetPreferencesFromUI prefs = network field = 'auto_brake' checksum = boolean_false string = "Off"
		setscreenelementprops id = {<id> child = 0} text = "AUTO-BRAKE: Off"
	endif
endscript

script menu_adjust_tilt_sensitivity 
	<player> = ($CONTROLOPTIONS_player_num)
	TiltControlGetParams <player>
	if gotparam left
		if ((<tilt_params>.motionsensitivity) > 1)
			TiltControlSetParams <player> motionsensitivity = ((<tilt_params>.motionsensitivity) - 1)
			soundevent event = Pause_Menu_Scroll_LEFT_SFX
		endif
	else
		if gotparam right
			if ((<tilt_params>.motionsensitivity) < 10)
				TiltControlSetParams <player> motionsensitivity = ((<tilt_params>.motionsensitivity) + 1)
				soundevent event = Pause_Menu_Scroll_RIGHT_SFX
			endif
		endif
	endif
	TiltControlGetParams <player>
	formattext textname = text_sensitivity "%i" i = (<tilt_params>.motionsensitivity)
	setscreenelementprops {
		id = {menu_tilt4 child = extra_text}
		text = <text_sensitivity>
	}
	left_alpha = unhide
	right_alpha = unhide
	if ((<tilt_params>.motionsensitivity) = 1)
		left_alpha = hide
	else
		if ((<tilt_params>.motionsensitivity) = 10)
			right_alpha = hide
		endif
	endif
	setscreenelementprops {
		id = {menu_tilt4 child = arrow_left}
		<left_alpha>
	}
	setscreenelementprops {
		id = {menu_tilt4 child = arrow_right}
		<right_alpha>
	}
endscript

script menu_adjust_brightness 
	left_rgba = 1
	right_rgba = 1
	if gotparam left
		if ($se_brightness > 0)
			change se_brightness = ($se_brightness -1)
			soundevent event = Pause_Menu_Scroll_LEFT_SFX
		endif
	else
		if gotparam right
			if ($se_brightness < 10)
				change se_brightness = ($se_brightness + 1)
				soundevent event = Pause_Menu_Scroll_RIGHT_SFX
			endif
		endif
	endif
	formattext textname = brightness "%i" i = $se_brightness
	setscreenelementprops {
		id = {menu_screen_brightness child = extra_text}
		text = <brightness>
	}
	tod_proxim_update_lightfx
	if ($se_brightness = 0)
		left_rgba = 0
	else
		if ($se_brightness = 10)
			right_rgba = 0
		endif
	endif
	setscreenelementprops {
		id = {menu_screen_brightness child = arrow_left}
		alpha = <left_rgba>
	}
	setscreenelementprops {
		id = {menu_screen_brightness child = arrow_right}
		alpha = <right_rgba>
	}
endscript

script options_retrieve_from_user_profile 
	if NOT isxenon
		return
	endif
	if NOT checkforsignin local
		return
	endif
	InitGameProfileSettings
	printf "-- profile settings --"
	if getgameprofilesetting gsid = 0
		if (<game_setting> = 1)
			printf "- vibration on"
			vibrationon 0
		else
			printf "- vibration off"
			VibrationOff 0
		endif
	endif
	if getgameprofilesetting gsid = 1
		printf "- user profile difficulty: %d" d = <game_setting>
		change default_user_difficulty = (<game_setting> -2)
	endif
	if getgameprofilesetting gsid = 3
		change default_user_axis_inversion = <game_setting>
		printf "- user profile axis inversion: %d" d = <game_setting>
		if compositeobjectexists skatercam0
			skatercam0 :lookaroundsetinverty on = <game_setting>
		endif
	endif
endscript

script InitGameProfileSettings 
	startgameprofilesettingsread
	begin
	if gameprofilesettingsfinished
		break
	else
		wait \{1
			gameframe}
	endif
	repeat
endscript
test_current_skater_speed = 10

script menu_reset_skater_speed_to_default 
	change \{test_current_skater_speed = 10}
endscript

script menu_alter_skater_speed 
	gettags
	<value> = ($test_current_skater_speed)
	if gotparam left
		if (<value> > 1)
			<value> = (<value> - 1)
			soundevent event = Pause_Menu_Scroll_LEFT_SFX
		endif
	else
		if gotparam right
			if (<value> < 10)
				<value> = (<value> + 1)
				soundevent event = Pause_Menu_Scroll_LEFT_SFX
			endif
		endif
	endif
	change test_current_skater_speed = <value>
	formattext textname = speed_text "%v" v = ($test_current_skater_speed)
	setscreenelementprops id = {menu_skater_speed child = extra_text} text = <speed_text>
	left_alpha = unhide
	right_alpha = unhide
	if (<value> = 1)
		left_alpha = hide
	else
		if (<value> = 10)
			right_alpha = hide
		endif
	endif
	setscreenelementprops {
		id = {menu_skater_speed child = arrow_left}
		<left_alpha>
	}
	setscreenelementprops {
		id = {menu_skater_speed child = arrow_right}
		<right_alpha>
	}
endscript

script get_camera_mode_text 
	skatercam0 :sc_getmode
	switch <mode>
		case 2
		text = "STANDARD"
		case 4
		text = "CLASSIC"
		default
		text = "DYNAMIC"
	endswitch
	return camera_text = <text>
endscript

script menu_alter_camera_mode 
	skatercam0 :sc_getmode
	if gotparam left
		if (<mode> > 2)
			<mode> = (<mode> -1)
		else
			<mode> = 4
		endif
	else
		if (<mode> < 4)
			<mode> = (<mode> + 1)
		else
			<mode> = 2
		endif
	endif
	skatercam0 :sc_setmode mode = <mode>
	change player_desired_camera_mode = <mode>
	get_camera_mode_text
	setscreenelementprops id = {menu_skater_camera_mode child = extra_text} text = <camera_text>
endscript

script menu_toggle_sim_mode 
	if getglobalflag flag = $cheat_sim_mode
		unsetglobalflag flag = $cheat_sim_mode
		printf "UnSetGlobalFlag flag=$CHEAT_SIM_MODE"
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
		unsetglobalflag flag = $NO_DISPLAY_COMPASS
		unsetglobalflag flag = $no_display_trickstring
		unsetglobalflag flag = $NO_DISPLAY_BALANCE
		unsetglobalflag flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
		unsetglobalflag flag = $no_display_net_scores
	else
		setglobalflag flag = $cheat_sim_mode
		printf "SetGlobalFlag flag=$CHEAT_SIM_MODE"
		setglobalflag flag = $no_display_hud
		panel_hide_score_in_goal
		if insplitscreengame
			setscreenelementprops id = splitscreen_total_score_container hide
			setscreenelementprops id = (splitscreen_total_score_container + 1) hide
		endif
		setglobalflag flag = $NO_DISPLAY_COMPASS
		setglobalflag flag = $no_display_trickstring
		setglobalflag flag = $NO_DISPLAY_BALANCE
		setglobalflag flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
		setglobalflag flag = $no_display_net_scores
		create_dialog_box {
			title = "WARNING"
			text = "Sim mode has increased gravity and removes HUD elements.  Use at own risk, may cause all goal to become real difficult!"
			pos = (320.0, 240.0)
			just = [center center]
			pad_back_script = dialog_box_exit
			buttons = [
				{font = text_a1 text = "Ok" pad_choose_script = dialog_box_exit}
			]
			vmenu_width = 600
			text_dims = (700.0, 0.0)
			no_helper_text
		}
	endif
endscript
