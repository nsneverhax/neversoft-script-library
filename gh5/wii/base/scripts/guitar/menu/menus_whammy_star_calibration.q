g_spc_check_pow_bool = 1
g_spc_whammy_is_popup = 0
g_spc_sp_is_popup = 0
SHOULD_WE_PLAY_WHAMMY_SOUND = 1

script create_whammy_bar_calibration_menu \{controller = 0
		popup = 0}
	ScriptAssert \{'create_whammy_bar_calibration_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_whammy_bar_calibration_menu 
	ScriptAssert \{'destroy_whammy_bar_calibration_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script create_star_power_trigger_calibration_menu \{controller = 0
		popup = 0}
	disable_pause
	CreateScreenElement \{id = spc_container
		Type = ContainerElement
		parent = root_window
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if (<popup>)
		<z> = 100
	else
		controller = ($last_start_pressed_device)
		<z> = -4
	endif
	if NOT (<popup>)
		create_menu_backdrop \{texture = Options_Calibrate_Starpower_Posterwall}
	else
		displaySprite \{parent = spc_container
			tex = Options_Calibrate_Starpower_Posterwall
			Pos = (0.0, 0.0)
			dims = (1280.0, 720.0)
			z = 107}
	endif
	displaySprite {
		parent = spc_container
		tex = Options_Calibrate_Starpower_BG
		Pos = (326.0, 0.0)
		dims = (512.0, 512.0)
		rot_angle = -2
		z = <z>
	}
	displaySprite {
		id = spc_rotating_bg_lines
		parent = spc_container
		tex = Options_Calibrate_Starpower_BG2
		Pos = (578.0, 156.0)
		dims = (640.0, 640.0)
		just = [center center]
		rot_angle = 25
		z = (<z> + 1)
	}
	displaySprite {
		id = spc_rotating_bg_planes
		parent = spc_container
		tex = Options_Calibrate_Starpower_BG3
		Pos = (568.0, 114.0)
		dims = (512.0, 384.0)
		just = [center center]
		rot_angle = 20
		z = (<z> + 2)
	}
	if English
		starpower_pow_tex = Options_Calibrate_Starpower_Pow
	elseif French
		starpower_pow_tex = options_calibrate_starpower_pow_fr
	elseif Spanish
		starpower_pow_tex = options_calibrate_starpower_pow_sp
	elseif German
		starpower_pow_tex = options_calibrate_starpower_pow_de
	elseif Italian
		starpower_pow_tex = options_calibrate_starpower_pow_fr
	endif
	displaySprite {
		id = spc_pow
		parent = spc_container
		tex = <starpower_pow_tex>
		Pos = (0.0, 0.0)
		Scale = 1.0
		relative_scale
		z = (<z> + 3)
	}
	SetScreenElementProps id = <id> Hide
	button_color = qs(0x21d9c24c)
	formatText TextName = element_text qs(0xe2b75621) a = <button_color>
	CreateScreenElement {
		Type = TextBlockElement
		id = current_menu
		parent = spc_container
		font = fontgrid_text_a1
		Pos = (608.0, 520.0)
		just = [center top]
		internal_just = [left top]
		line_spacing = 0.85
		dims = (940.0, 300.0)
		Scale = (0.5, 0.65000004)
		rgba = [225 200 120 255]
		text = <element_text>
		event_handlers = [
			{pad_choose menu_star_power_trigger_enter_position params = {controller = <controller>}}
			{pad_back generic_event_back}
		]
		z_priority = (<z> + 6.1)
		rot_angle = -2
	}
	SpawnScriptNow menu_star_power_trigger_pow_check params = {controller = <controller>}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 110}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 110}
endscript

script destroy_star_power_trigger_calibration_menu 
	destroy_menu \{menu_id = spc_container}
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = menu_star_power_trigger_pow_check}
	destroy_menu_backdrop
endscript

script menu_star_power_trigger_pow_check 
	begin
	if GuitarGetAnalogueInfo controller = <controller>
		<spc_v_dist> = <righty>
		if (<spc_v_dist> > 0)
			<spc_v_dist> = 0
		endif
		GetGlobalTags \{user_options}
		if playerinfo 1 controller = <controller>
			if (<lefty_flip_p1> = 1)
				<line_rot> = (25.0 -30.0 * ((<spc_v_dist>) * -1))
			else
				<line_rot> = (25.0 -30.0 * <spc_v_dist>)
			endif
		else
			if (<lefty_flip_p2> = 1)
				<line_rot> = (25.0 -30.0 * ((<spc_v_dist>) * -1))
			else
				<line_rot> = (25.0 -30.0 * <spc_v_dist>)
			endif
		endif
		SetScreenElementProps id = spc_rotating_bg_lines rot_angle = <line_rot>
		SetScreenElementProps id = spc_rotating_bg_planes rot_angle = (<line_rot> - 5.0)
		get_star_power_position controller = <controller>
		<spc_pos_dev> = <star_power_position>
		Wait \{0.05
			Seconds}
		if (<spc_v_dist> <= <spc_pos_dev>)
			if ($g_spc_check_pow_bool = 1)
				SoundEvent \{event = POW_SFX}
				<spc_pow_rand_x> = 0
				<spc_pow_rand_y> = 0
				<spc_pow_rand_scale> = 0
				<spc_pow_rand_rot> = 0
				GetRandomValue \{Name = spc_pow_rand_x
					integer
					a = 380
					b = 470}
				GetRandomValue \{Name = spc_pow_rand_y
					integer
					a = 50
					b = 80}
				GetRandomValue \{Name = spc_pow_rand_scale
					a = 0.6
					b = 1.0}
				GetRandomValue \{Name = spc_pow_rand_rot
					a = -3.0
					b = 3.0}
				SetScreenElementProps {
					id = spc_pow
					unhide
					Pos = (((1.0, 0.0) * <spc_pow_rand_x>) + ((0.0, 1.0) * <spc_pow_rand_y>))
					rot_angle = <spc_pow_rand_rot>
					Scale = <spc_pow_rand_scale>
					relative_scale
				}
				Change \{g_spc_check_pow_bool = 0}
			endif
		else
			SetScreenElementProps \{id = spc_pow
				Hide}
			Change \{g_spc_check_pow_bool = 1}
		endif
	else
		Wait \{0.05
			Seconds}
	endif
	repeat
endscript

script menu_star_power_trigger_enter_position 
	if GuitarGetAnalogueInfo controller = <device_num>
		if (<righty> > 0)
			<righty> = 0
		endif
		switch (<device_num>)
			case 0
			SetGlobalTags user_options params = {star_power_position_device_0 = <righty>}
			SoundEvent \{event = POW_SFX}
			case 1
			SetGlobalTags user_options params = {star_power_position_device_1 = <righty>}
			SoundEvent \{event = POW_SFX}
			case 2
			SetGlobalTags user_options params = {star_power_position_device_2 = <righty>}
			SoundEvent \{event = POW_SFX}
			case 3
			SetGlobalTags user_options params = {star_power_position_device_3 = <righty>}
			SoundEvent \{event = POW_SFX}
		endswitch
		getmaxlocalplayers
		get_star_power_position controller = <device_num>
		<Player> = 1
		begin
		getplayerinfo <Player> controller
		if (<device_num> = <controller>)
			setplayerinfo <Player> star_tilt_threshold = <star_power_position>
			break
		endif
		<Player> = (<Player> + 1)
		repeat <max_players>
	endif
endscript

script create_guitar_diagnostic_menu 
	ScriptAssert \{'create_guitar_diagnostic_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_guitar_diagnostic_menu 
	ScriptAssert \{'destroy_guitar_diagnostic_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script update_guitar_diagnostic_menu 
	begin
	if GuitarGetAnalogueInfo \{controller = 0}
		formatText TextName = leftxtext qs(0xad0cd7a6) v = <leftx>
		formatText TextName = rightxtext qs(0x5b126d2b) v = <rightx>
		formatText TextName = leftytext qs(0x36a99bc9) v = <lefty>
		formatText TextName = rightytext qs(0xad38a888) v = <righty>
		formatText TextName = leftlengthtext qs(0x567d1f56) v = <leftlength>
		formatText TextName = rightlengthtext qs(0x3e5c1976) v = <rightlength>
		formatText TextName = lefttriggertext qs(0xd75b7f01) v = <lefttrigger>
		formatText TextName = righttriggertext qs(0xabbc96b7) v = <righttrigger>
		formatText TextName = verticaldisttext qs(0x29130595) v = <verticaldist>
		SetScreenElementProps id = leftx text = <leftxtext>
		SetScreenElementProps id = rightx text = <rightxtext>
		SetScreenElementProps id = lefty text = <leftytext>
		SetScreenElementProps id = righty text = <rightytext>
		SetScreenElementProps id = leftlength text = <leftlengthtext>
		SetScreenElementProps id = rightlength text = <rightlengthtext>
		SetScreenElementProps id = lefttrigger text = <lefttriggertext>
		SetScreenElementProps id = righttrigger text = <righttriggertext>
		SetScreenElementProps id = verticaldist text = <verticaldisttext>
	endif
	Wait \{1
		gameframe}
	repeat
endscript
