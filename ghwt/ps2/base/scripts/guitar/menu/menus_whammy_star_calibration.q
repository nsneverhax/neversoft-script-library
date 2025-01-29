g_spc_check_pow_bool = 1
g_spc_whammy_is_popup = 0
g_spc_sp_is_popup = 0
SHOULD_WE_PLAY_WHAMMY_SOUND = 1

script create_whammy_bar_calibration_menu \{controller = 0
		popup = 0}
	disable_pause
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = wbc_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if (<popup>)
		Change \{g_spc_whammy_is_popup = 1}
		controller = ($last_start_pressed_device)
		<z> = 100
	else
		Change \{g_spc_whammy_is_popup = 0}
		controller = ($primary_controller)
		<z> = 2
	endif
	if NOT (<popup>)
		create_menu_backdrop \{texture = menu_venue_bg}
	endif
	displaySprite {
		id = wbc_poster_1
		parent = wbc_container
		tex = Options_Whammy_Poster_1
		Pos = (286.0, 15.0)
		dims = (896.0, 896.0)
		rot_angle = -2
		z = <z>
	}
	displaySprite {
		id = wbc_poster_2
		parent = wbc_container
		tex = Options_Whammy_Poster_2
		Pos = (286.0, 15.0)
		dims = (896.0, 896.0)
		rot_angle = -2
		z = (<z> - 1)
	}
	if NOT (<popup>)
		displaySprite {
			parent = wbc_container
			tex = tape_01
			Pos = (1010.0, 450.0)
			dims = (192.0, 92.0)
			z = (<z> + 1)
			flip_v
			rot_angle = 90
		}
		displaySprite {
			parent = wbc_container
			tex = tape_02
			Pos = (350.0, 200.0)
			z = (<z> + 1)
			rot_angle = 90
			dims = (192.0, 92.0)
			flip_v
			flip_h
		}
	endif
	text_block_scale = 0.65000004
	text_block_type_scale = 0.8
	text_block_1_pos = (630.0, 70.0)
	text_block_1_dims = (910.0, 200.0)
	text_block_2_pos = (650.0, 140.0)
	text_block_2_dims = (840.0, 100.0)
	text_block_3_pos = (750.0, 195.0)
	text_block_3_dims = (525.0, 300.0)
	<text_1> = qs(0x09382884)
	button_color = qs(0x21d9c24c)
	formatText TextName = text_2 qs(0xe69d5720) a = <button_color>
	<text_3> = qs(0x01da96f6)
	CreateScreenElement {
		Type = TextBlockElement
		font = fontgrid_text_a3
		Pos = <text_block_1_pos>
		parent = wbc_container
		text = <text_1>
		rgba = [0 0 0 255]
		z_priority = (<z> + 1)
		dims = <text_block_1_dims>
		just = [center top]
		internal_just = [left top]
		Scale = <text_block_scale>
		internal_scale = <text_block_type_scale>
		rot_angle = -2
		line_spacing = 0.8
	}
	CreateScreenElement {
		Type = TextBlockElement
		font = fontgrid_text_a3
		Pos = <text_block_2_pos>
		parent = wbc_container
		text = <text_2>
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		dims = <text_block_2_dims>
		just = [center top]
		internal_just = [left top]
		Scale = <text_block_scale>
		internal_scale = <text_block_type_scale>
		rot_angle = -3
		line_spacing = 0.8
	}
	CreateScreenElement {
		Type = TextBlockElement
		font = fontgrid_text_a3
		Pos = <text_block_3_pos>
		parent = wbc_container
		text = <text_3>
		rgba = [0 0 0 255]
		z_priority = (<z> + 1)
		dims = <text_block_3_dims>
		just = [center top]
		internal_just = [left top]
		Scale = <text_block_scale>
		internal_scale = <text_block_type_scale>
		rot_angle = -2
		line_spacing = 0.8
	}
	CreateScreenElement {
		Type = TextElement
		font = fontgrid_text_a6
		Pos = (760.0, 315.0)
		parent = wbc_container
		text = qs(0x480dff4d)
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		just = [center top]
		Scale = 1.6
		rot_angle = -4
	}
	CreateScreenElement {
		Type = TextElement
		font = fontgrid_text_a6
		Pos = (800.0, 365.0)
		parent = wbc_container
		text = qs(0x91639f57)
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		just = [center top]
		Scale = 1.6
		rot_angle = -4
	}
	CreateScreenElement {
		Type = TextBlockElement
		font = fontgrid_text_a3
		rgba = [140 235 170 255]
		Pos = (810.0, 408.0)
		text = qs(0x2b282c01)
		just = [center top]
		internal_just = [center center]
		dims = (400.0, 200.0)
		Scale = 0.6
		line_spacing = 0.8
		parent = wbc_container
		z_priority = (<z> + 2)
		rot_angle = -4
		id = current_menu
		font_spacing = 50
		space_spacing = 20
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{pad_choose menu_whammy_bar_calibration_enter_sample}
			{pad_back generic_event_back}
		]
		exclusive_device = <controller>
	}
	SpawnScriptNow menu_whammy_bar_update_current_menu params = {controller = <controller>}
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	add_user_control_helper text = qs(0xc18d5e76) button = green z = (<z> + 100) all_buttons
	add_user_control_helper text = qs(0xaf4d5dd2) button = red z = (<z> + 100)
endscript

script destroy_whammy_bar_calibration_menu 
	KillSpawnedScript \{Name = menu_whammy_bar_update_current_menu}
	destroy_menu \{menu_id = wbc_container}
	clean_up_user_control_helpers
	if NOT ($g_spc_whammy_is_popup)
		destroy_menu_backdrop
	endif
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
		font = fontgrid_text_a6
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
		z = 110
		all_buttons}
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
		if (<controller> = $player1_status.controller)
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
		getmaxplayers
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
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = gd_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = gd_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		dims = (1280.0, 1024.0)
		rgba = [
			80
			80
			80
			255
		]
		z_priority = -1}
	font = fontgrid_text_a8
	text_params = {Type = TextElement parent = gd_container font = <font> just = [left top]}
	CreateScreenElement {
		<text_params>
		id = title_text
		text = qs(0x9f1a8f75)
		Pos = (540.0, 100.0)
	}
	CreateScreenElement {
		<text_params>
		id = leftx
		text = qs(0x9d8b1678)
		Pos = (580.0, 200.0)
	}
	CreateScreenElement {
		<text_params>
		id = rightx
		text = qs(0x54477174)
		Pos = (580.0, 240.0)
	}
	CreateScreenElement {
		<text_params>
		id = lefty
		text = qs(0x2537711d)
		Pos = (580.0, 280.0)
	}
	CreateScreenElement {
		<text_params>
		id = righty
		text = qs(0xecfb1611)
		Pos = (580.0, 320.0)
	}
	CreateScreenElement {
		<text_params>
		id = leftlength
		text = qs(0x83712a88)
		Pos = (580.0, 360.0)
	}
	CreateScreenElement {
		<text_params>
		id = rightlength
		text = qs(0xd5c3ae4b)
		Pos = (580.0, 400.0)
	}
	CreateScreenElement {
		<text_params>
		id = lefttrigger
		text = qs(0x7018408b)
		Pos = (580.0, 440.0)
	}
	CreateScreenElement {
		<text_params>
		id = righttrigger
		text = qs(0x7a1ad58d)
		Pos = (580.0, 480.0)
	}
	CreateScreenElement {
		<text_params>
		id = verticaldist
		text = qs(0x141789d6)
		Pos = (580.0, 520.0)
	}
	SpawnScriptNow \{update_guitar_diagnostic_menu}
endscript

script destroy_guitar_diagnostic_menu 
	KillSpawnedScript \{Name = update_guitar_diagnostic_menu}
	destroy_menu \{menu_id = gd_container}
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

script create_guitar_sensors_calibration_menu \{controller = 0
		popup = 0}
	disable_pause
	if (<popup>)
		Change \{g_spc_whammy_is_popup = 1}
		<z> = 100
		controller = ($last_start_pressed_device)
	else
		controller = ($primary_controller)
		Change \{g_spc_whammy_is_popup = 0}
		<z> = 2
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = gsc_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if NOT (<popup>)
		create_menu_backdrop \{texture = menu_venue_bg}
	endif
	RunScriptOnScreenElement id = gsc_container menu_guitar_sensors_calibration_sequence params = {controller = <controller> z = <z>}
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	add_user_control_helper text = qs(0xc18d5e76) button = green z = (<z> + 100) all_buttons
	add_user_control_helper text = qs(0xaf4d5dd2) button = red z = (<z> + 100)
endscript

script menu_guitar_sensors_calibration_sequence 
	text_block_type_scale = 0.8
	button_color = qs(0x21d9c24c)
	<idles> = [
		{text = qs(0x4958e4ee) position = guitar_motion_neck_left_idle}
		{text = qs(0x9392923f) position = guitar_motion_neck_right_idle}
		{text = qs(0x3f055f02) position = guitar_motion_face_up_idle}
		{text = qs(0x49ff2789) position = guitar_motion_face_down_idle}
		{text = qs(0x4958e4ee) position = guitar_motion_neck_left_idle}
	]
	GetArraySize <idles>
	<i> = 0
	begin
	<Idle> = (<idles> [<i>])
	formatText TextName = calibrate_now_text qs(0x3b3c944d) a = <button_color> b = (<Idle>.text)
	CreateScreenElement {
		id = gsc_text
		Type = TextBlockElement
		font = fontgrid_text_a3
		Pos = (650.0, 140.0)
		parent = gsc_container
		text = <calibrate_now_text>
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		dims = (840.0, 100.0)
		just = [center top]
		internal_just = [left top]
		internal_scale = <text_block_type_scale>
		rot_angle = -3
		line_spacing = 0.8
		event_handlers = [
			{pad_choose menu_guitar_sensors_calibration_enter_sample params = <Idle>}
			{pad_back generic_event_back}
		]
		exclusive_device = <controller>
	}
	LaunchEvent Type = focus target = <id>
	WaitForEvent \{Type = guitar_sensor_calibration_done}
	SetScreenElementProps \{id = gsc_text
		event_handlers = [
			{
				pad_choose
				nullscript
			}
		]
		replace_handlers}
	Wait \{2
		Seconds}
	DestroyScreenElement \{id = gsc_text}
	<i> = (<i> + 1)
	repeat <array_Size>
	CreateScreenElement {
		id = gsc_text
		Type = TextBlockElement
		font = fontgrid_text_a3
		Pos = (650.0, 140.0)
		parent = gsc_container
		text = qs(0x77477a45)
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		dims = (840.0, 100.0)
		just = [center top]
		internal_just = [left top]
		internal_scale = <text_block_type_scale>
		rot_angle = -3
		line_spacing = 0.8
		event_handlers = [
			{pad_choose generic_event_back}
			{pad_back generic_event_back}
		]
		exclusive_device = <controller>
	}
	LaunchEvent Type = focus target = <id>
endscript

script destroy_guitar_sensors_calibration_menu 
	destroy_menu \{menu_id = gsc_container}
	clean_up_user_control_helpers
	if NOT ($g_spc_whammy_is_popup)
		destroy_menu_backdrop
	endif
endscript

script menu_guitar_sensors_calibration_enter_sample 
	if GuitarGetAnalogueInfo controller = <device_num>
		guitarmotion_calibrate {
			neck_left_idle = <righttrigger>
			neck_right_idle = <righttrigger>
			face_up_idle = <lefttrigger>
			face_down_idle = <lefttrigger>
		}
		switch <position>
			case guitar_motion_neck_left_idle
			AddParam Name = value value = <guitar_motion_neck_left_idle> Type = float
			<changeparams> = {guitar_motion_neck_left_idle = <guitar_motion_neck_left_idle>}
			case guitar_motion_neck_right_idle
			AddParam Name = value value = <guitar_motion_neck_right_idle> Type = float
			<changeparams> = {guitar_motion_neck_right_idle = <guitar_motion_neck_right_idle>}
			case guitar_motion_face_up_idle
			AddParam Name = value value = <guitar_motion_face_up_idle> Type = float
			<changeparams> = {guitar_motion_face_up_idle = <guitar_motion_face_up_idle>}
			case guitar_motion_face_down_idle
			AddParam Name = value value = <guitar_motion_face_down_idle> Type = float
			<changeparams> = {guitar_motion_face_down_idle = <guitar_motion_face_down_idle>}
		endswitch
		getmaxplayers
		<Player> = 1
		begin
		<player_status> = ($0x2994109a [<Player>])
		if (<device_num> = $<player_status>.controller)


			Change structurename = <player_status> <changeparams>
			SpawnScriptNow menu_guitar_sensors_calibration_gg params = {value = <value>}
			break
		endif
		<Player> = (<Player> + 1)
		repeat <max_players>
	endif
	LaunchEvent \{broadcast
		Type = guitar_sensor_calibration_done}
endscript

script menu_guitar_sensors_calibration_gg 
	formatText TextName = debug_text '%v' v = <value>
	formatText TextName = gg_text qs(0xfb90ad92) v = <value>
	CreateScreenElement {
		parent = gsc_container
		Type = TextBlockElement
		dims = (200.0, 100.0)
		font = fontgrid_text_a3
		rgba = [128 255 128 255]
		just = [center center]
		internal_just = [center center]
		Pos = (640.0, 360.0)
		z_priority = 1100
		text = <gg_text>
		Scale = 0.1
		rot_angle = 135
	}
	RunScriptOnScreenElement id = <id> menu_guitar_sensors_calibration_gg_anim
endscript

script menu_guitar_sensors_calibration_gg_anim 
	se_setprops \{Scale = 1.2
		rot_angle = 0
		time = 0.2}
	se_waitprops
	se_setprops \{Scale = 1.0
		time = 0.1}
	se_waitprops
	Wait \{2
		Seconds}
	Die
endscript
