g_spc_check_pow_bool = 1
g_spc_whammy_is_popup = 0
g_spc_sp_is_popup = 0
SHOULD_WE_PLAY_WHAMMY_SOUND = 1

script create_whammy_bar_calibration_menu \{controller = 0
		Popup = 0}
	kill_start_key_binding
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = wbc_container
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	if (<Popup>)
		Change \{g_spc_whammy_is_popup = 1}
		controller = ($last_start_pressed_device)
		<Z> = 100
	else
		Change \{g_spc_whammy_is_popup = 0}
		<Z> = 2
	endif
	if NOT (<Popup>)
		create_menu_backdrop \{texture = Venue_BG}
		CreateScreenElement \{Type = SpriteElement
			PARENT = wbc_container
			Id = wbc_light_overlay
			texture = Venue_Overlay
			Pos = (640.0, 360.0)
			Dims = (1280.0, 720.0)
			just = [
				Center
				Center
			]
			z_priority = 99}
	endif
	displaySprite {
		Id = wbc_poster_1
		PARENT = wbc_container
		tex = Options_Whammy_Poster_1
		Pos = (286.0, 15.0)
		Dims = (896.0, 896.0)
		Rot_Angle = -2
		Z = <Z>
	}
	displaySprite {
		Id = wbc_poster_2
		PARENT = wbc_container
		tex = Options_Whammy_Poster_2
		Pos = (286.0, 15.0)
		Dims = (896.0, 896.0)
		Rot_Angle = -2
		Z = (<Z> - 1)
	}
	if NOT (<Popup>)
		displaySprite {
			PARENT = wbc_container
			tex = Toprockers_Tape_1
			Pos = (1010.0, 450.0)
			Dims = (192.0, 92.0)
			Z = (<Z> + 1)
			flip_v
			Rot_Angle = 90
		}
		displaySprite {
			PARENT = wbc_container
			tex = Toprockers_Tape_2
			Pos = (350.0, 200.0)
			Z = (<Z> + 1)
			Rot_Angle = 90
			Dims = (192.0, 92.0)
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
	<text_1> = "Press  the  whammy  bar  completely  down, and  gently  allow  it  to  return  to  its  resting  position."
	button_color = "Green"
	GetEnterButtonAssignment
	if (<assignment> = CIRCLE)
		button_color = "Red"
	endif
	FormatText TextName = text_2 "Press  the  %a  Button  to  calibrate  using  this  position." A = <button_color>
	<text_3> = "Repeat  the  process  until  you  see  the  \\c1''Resting  position  calibrated'' \\c0message  every  time  you  return  the  whammy  bar  to  its  resting  position."
	CreateScreenElement {
		Type = TextBlockElement
		font = text_a3
		Pos = <text_block_1_pos>
		PARENT = wbc_container
		Text = <text_1>
		rgba = [0 0 0 255]
		z_priority = (<Z> + 1)
		Dims = <text_block_1_dims>
		just = [Center Top]
		internal_just = [LEFT Top]
		Scale = <text_block_scale>
		internal_scale = <text_block_type_scale>
		Rot_Angle = -2
		line_spacing = 0.8
	}
	CreateScreenElement {
		Type = TextBlockElement
		font = text_a3
		Pos = <text_block_2_pos>
		PARENT = wbc_container
		Text = <text_2>
		rgba = [220 220 220 255]
		z_priority = (<Z> + 1)
		Dims = <text_block_2_dims>
		just = [Center Top]
		internal_just = [LEFT Top]
		Scale = <text_block_scale>
		internal_scale = <text_block_type_scale>
		Rot_Angle = -3
		line_spacing = 0.8
	}
	CreateScreenElement {
		Type = TextBlockElement
		font = text_a3
		Pos = <text_block_3_pos>
		PARENT = wbc_container
		Text = <text_3>
		rgba = [0 0 0 255]
		z_priority = (<Z> + 1)
		Dims = <text_block_3_dims>
		just = [Center Top]
		internal_just = [LEFT Top]
		Scale = <text_block_scale>
		internal_scale = <text_block_type_scale>
		Rot_Angle = -2
		line_spacing = 0.8
	}
	CreateScreenElement {
		Type = TextElement
		font = text_a5
		Pos = (760.0, 315.0)
		PARENT = wbc_container
		Text = "Calibrate"
		rgba = [220 220 220 255]
		z_priority = (<Z> + 1)
		just = [Center Top]
		Scale = 1.6
		Rot_Angle = -4
	}
	CreateScreenElement {
		Type = TextElement
		font = text_a5
		Pos = (800.0, 365.0)
		PARENT = wbc_container
		Text = "Whammy"
		rgba = [220 220 220 255]
		z_priority = (<Z> + 1)
		just = [Center Top]
		Scale = 1.6
		Rot_Angle = -4
	}
	CreateScreenElement {
		Type = TextBlockElement
		font = text_a3
		rgba = [140 235 170 255]
		Pos = (810.0, 408.0)
		Text = "RESTING POSITION CALIBRATED"
		just = [Center Top]
		internal_just = [Center Center]
		Dims = (400.0, 200.0)
		Scale = 0.6
		line_spacing = 0.8
		PARENT = wbc_container
		z_priority = (<Z> + 2)
		Rot_Angle = -4
		Id = resting_message
		font_spacing = 50
		space_spacing = 20
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{pad_choose menu_whammy_bar_calibration_enter_sample}
			{pad_back ui_flow_manager_respond_to_action Params = {action = go_back}}
		]
		exclusive_device = <controller>
	}
	LaunchEvent \{Type = Focus
		Target = resting_message}
	SpawnScriptNow menu_whammy_bar_update_resting_message Params = {controller = <controller>}
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper Text = "SELECT" button = Green Z = (<Z> + 100)
	add_user_control_helper Text = "BACK" button = RED Z = (<Z> + 100)
endscript

script destroy_whammy_bar_calibration_menu 
	restore_start_key_binding
	KillSpawnedScript \{Name = menu_whammy_bar_update_resting_message}
	destroy_menu \{menu_id = wbc_container}
	clean_up_user_control_helpers
	if NOT ($g_spc_whammy_is_popup)
		destroy_menu_backdrop
	endif
endscript

script menu_whammy_bar_calibration_enter_sample 
	if GuitarGetAnalogueInfo controller = <device_num>
		if (<RightX> = 0)
			<RightX> = 0.0001
		elseif (<RightX> = 1)
			<RightX> = 0.9998999
		endif
		switch (<device_num>)
			case 0
			SetGlobalTags user_options Params = {resting_whammy_position_device_0 = <RightX>}
			case 1
			SetGlobalTags user_options Params = {resting_whammy_position_device_1 = <RightX>}
			case 2
			SetGlobalTags user_options Params = {resting_whammy_position_device_2 = <RightX>}
			case 3
			SetGlobalTags user_options Params = {resting_whammy_position_device_3 = <RightX>}
			case 4
			SetGlobalTags user_options Params = {resting_whammy_position_device_4 = <RightX>}
			case 5
			SetGlobalTags user_options Params = {resting_whammy_position_device_5 = <RightX>}
			case 6
			SetGlobalTags user_options Params = {resting_whammy_position_device_6 = <RightX>}
		endswitch
		if (<device_num> = $player1_status.controller)
			get_resting_whammy_position controller = <device_num>
			Change StructureName = player1_status resting_whammy_position = <resting_whammy_position>
		else
			if (<device_num> = $player2_status.controller)
				get_resting_whammy_position controller = <device_num>
				Change StructureName = player2_status resting_whammy_position = <resting_whammy_position>
			endif
		endif
	endif
endscript

script menu_whammy_bar_update_resting_message 
	begin
	if is_whammy_resting controller = <controller>
		if ($SHOULD_WE_PLAY_WHAMMY_SOUND = 0)
			SoundEvent \{Event = Whammy_Test_SFX}
			Change \{SHOULD_WE_PLAY_WHAMMY_SOUND = 1}
		endif
		SetScreenElementProps \{Id = resting_message
			UnHide}
		SetScreenElementProps \{Id = wbc_poster_1
			Alpha = 1}
	else
		Change \{SHOULD_WE_PLAY_WHAMMY_SOUND = 0}
		SetScreenElementProps \{Id = resting_message
			Hide}
		menu_whammy_bar_do_poster_morph controller = <controller>
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script menu_whammy_bar_do_poster_morph 
	if GuitarGetAnalogueInfo controller = <controller>
		if (<RightX> >= 0)
			SetScreenElementProps Id = wbc_poster_1 Alpha = ((1 - <RightX>) * 0.5)
		else
			SetScreenElementProps Id = wbc_poster_1 Alpha = ((0.5 * (<RightX> * -1)) + 0.5)
		endif
	endif
endscript

script create_star_power_trigger_calibration_menu \{controller = 0
		Popup = 0}
	kill_start_key_binding
	CreateScreenElement \{Id = spc_container
		Type = ContainerElement
		PARENT = root_window
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	if (<Popup>)
		<Z> = 100
		controller = ($last_start_pressed_device)
	else
		<Z> = -4
	endif
	if NOT (<Popup>)
		create_menu_backdrop \{texture = Options_Calibrate_Starpower_Posterwall}
	else
		displaySprite \{PARENT = spc_container
			tex = Options_Calibrate_Starpower_Posterwall
			Pos = (0.0, 0.0)
			Dims = (1280.0, 720.0)
			Z = 107}
	endif
	displaySprite {
		PARENT = spc_container
		tex = Options_Calibrate_Starpower_BG
		Pos = (326.0, 0.0)
		Dims = (512.0, 512.0)
		Rot_Angle = -2
		Z = <Z>
	}
	displaySprite {
		Id = spc_rotating_bg_lines
		PARENT = spc_container
		tex = Options_Calibrate_Starpower_BG2
		Pos = (578.0, 156.0)
		Dims = (640.0, 640.0)
		just = [Center Center]
		Rot_Angle = 25
		Z = (<Z> + 1)
	}
	displaySprite {
		Id = spc_rotating_bg_planes
		PARENT = spc_container
		tex = Options_Calibrate_Starpower_BG3
		Pos = (568.0, 114.0)
		Dims = (512.0, 384.0)
		just = [Center Center]
		Rot_Angle = 20
		Z = (<Z> + 2)
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
		Id = spc_pow
		PARENT = spc_container
		tex = <starpower_pow_tex>
		Pos = (0.0, 0.0)
		Scale = 1.0
		relative_scale
		Z = (<Z> + 3)
	}
	SetScreenElementProps Id = <Id> Hide
	button_color = "Green"
	GetEnterButtonAssignment
	if (<assignment> = CIRCLE)
		button_color = "Red"
	endif
	FormatText TextName = element_text "Raise the Guitar up to the point at which you would like Star Power to be triggered and press the %a Button to set this value." A = <button_color>
	CreateScreenElement {
		Type = TextBlockElement
		Id = star_calibration_text
		PARENT = spc_container
		font = text_a6
		Pos = (608.0, 520.0)
		just = [Center Top]
		internal_just = [LEFT Top]
		line_spacing = 0.85
		Dims = (940.0, 300.0)
		Scale = (0.5, 0.65000004)
		rgba = [225 200 120 255]
		Text = <element_text>
		event_handlers = [
			{pad_choose menu_star_power_trigger_enter_position Params = {controller = <controller>}}
			{pad_back ui_flow_manager_respond_to_action Params = {action = go_back}}
		]
		z_priority = (<Z> + 6.1)
		Rot_Angle = -2
	}
	LaunchEvent \{Type = Focus
		Target = star_calibration_text}
	SpawnScriptNow menu_star_power_trigger_pow_check Params = {controller = <controller>}
	add_user_control_helper \{Text = "SELECT"
		button = Green
		Z = 110}
	add_user_control_helper \{Text = "BACK"
		button = RED
		Z = 110}
endscript

script destroy_star_power_trigger_calibration_menu 
	restore_start_key_binding
	destroy_menu \{menu_id = spc_container}
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = menu_star_power_trigger_pow_check}
	destroy_menu_backdrop
endscript

script menu_star_power_trigger_pow_check 
	begin
	if GuitarGetAnalogueInfo controller = <controller>
		<spc_v_dist> = <RightY>
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
		SetScreenElementProps Id = spc_rotating_bg_lines Rot_Angle = <line_rot>
		SetScreenElementProps Id = spc_rotating_bg_planes Rot_Angle = (<line_rot> - 5.0)
		get_star_power_position controller = <controller>
		<spc_pos_dev> = <star_power_position>
		Wait \{0.05
			Seconds}
		if (<spc_v_dist> <= <spc_pos_dev>)
			if ($g_spc_check_pow_bool = 1)
				SoundEvent \{Event = POW_SFX}
				<spc_pow_rand_x> = 0
				<spc_pow_rand_y> = 0
				<spc_pow_rand_scale> = 0
				<spc_pow_rand_rot> = 0
				GetRandomValue \{Name = spc_pow_rand_x
					Integer
					A = 380
					B = 470}
				GetRandomValue \{Name = spc_pow_rand_y
					Integer
					A = 50
					B = 80}
				GetRandomValue \{Name = spc_pow_rand_scale
					A = 0.6
					B = 1.0}
				GetRandomValue \{Name = spc_pow_rand_rot
					A = -3.0
					B = 3.0}
				SetScreenElementProps {
					Id = spc_pow
					UnHide
					Pos = (((1.0, 0.0) * <spc_pow_rand_x>) + ((0.0, 1.0) * <spc_pow_rand_y>))
					Rot_Angle = <spc_pow_rand_rot>
					Scale = <spc_pow_rand_scale>
					relative_scale
				}
				Change \{g_spc_check_pow_bool = 0}
			endif
		else
			SetScreenElementProps \{Id = spc_pow
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
		if (<RightY> > 0)
			<RightY> = 0
		endif
		switch (<device_num>)
			case 0
			SetGlobalTags user_options Params = {star_power_position_device_0 = <RightY>}
			SoundEvent \{Event = POW_SFX}
			case 1
			SetGlobalTags user_options Params = {star_power_position_device_1 = <RightY>}
			SoundEvent \{Event = POW_SFX}
			case 2
			SetGlobalTags user_options Params = {star_power_position_device_2 = <RightY>}
			SoundEvent \{Event = POW_SFX}
			case 3
			SetGlobalTags user_options Params = {star_power_position_device_3 = <RightY>}
			SoundEvent \{Event = POW_SFX}
		endswitch
		if (<device_num> = $player1_status.controller)
			get_star_power_position controller = <device_num>
			Change StructureName = player1_status star_tilt_threshold = <star_power_position>
		else
			if (<device_num> = $player2_status.controller)
				get_star_power_position controller = <device_num>
				Change StructureName = player2_status star_tilt_threshold = <star_power_position>
			endif
		endif
	endif
endscript

script create_guitar_diagnostic_menu 
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = gd_container
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	CreateScreenElement \{Type = SpriteElement
		PARENT = gd_container
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]
		Dims = (1280.0, 1024.0)
		rgba = [
			80
			80
			80
			255
		]
		z_priority = -1}
	font = text_a4
	text_params = {Type = TextElement PARENT = gd_container font = <font> just = [LEFT Top]}
	CreateScreenElement {
		<text_params>
		Id = Title_text
		Text = "Guitar info"
		Pos = (540.0, 100.0)
	}
	CreateScreenElement {
		<text_params>
		Id = leftx
		Text = "Left X "
		Pos = (580.0, 200.0)
	}
	CreateScreenElement {
		<text_params>
		Id = RightX
		Text = "Right X "
		Pos = (580.0, 240.0)
	}
	CreateScreenElement {
		<text_params>
		Id = Lefty
		Text = "Left Y "
		Pos = (580.0, 280.0)
	}
	CreateScreenElement {
		<text_params>
		Id = RightY
		Text = "Right Y "
		Pos = (580.0, 320.0)
	}
	CreateScreenElement {
		<text_params>
		Id = leftlength
		Text = "Left Length "
		Pos = (580.0, 360.0)
	}
	CreateScreenElement {
		<text_params>
		Id = rightlength
		Text = "Right Length "
		Pos = (580.0, 400.0)
	}
	CreateScreenElement {
		<text_params>
		Id = LeftTrigger
		Text = "Left Trigger "
		Pos = (580.0, 440.0)
	}
	CreateScreenElement {
		<text_params>
		Id = RightTrigger
		Text = "Right Trigger "
		Pos = (580.0, 480.0)
	}
	CreateScreenElement {
		<text_params>
		Id = VerticalDist
		Text = "Vertical Dist "
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
		FormatText TextName = leftxtext "Left X - %v" V = <leftx>
		FormatText TextName = rightxtext "Whammy position - %v" V = <RightX>
		FormatText TextName = leftytext "Left Y - %v" V = <Lefty>
		FormatText TextName = rightytext "Right Y - %v" V = <RightY>
		FormatText TextName = leftlengthtext "Left Length - %v" V = <leftlength>
		FormatText TextName = rightlengthtext "Right Length - %v" V = <rightlength>
		FormatText TextName = lefttriggertext "Left Trigger - %v" V = <LeftTrigger>
		FormatText TextName = righttriggertext "Right Trigger - %v" V = <RightTrigger>
		FormatText TextName = verticaldisttext "Vertical orientation - %v" V = <VerticalDist>
		SetScreenElementProps Id = leftx Text = <leftxtext>
		SetScreenElementProps Id = RightX Text = <rightxtext>
		SetScreenElementProps Id = Lefty Text = <leftytext>
		SetScreenElementProps Id = RightY Text = <rightytext>
		SetScreenElementProps Id = leftlength Text = <leftlengthtext>
		SetScreenElementProps Id = rightlength Text = <rightlengthtext>
		SetScreenElementProps Id = LeftTrigger Text = <lefttriggertext>
		SetScreenElementProps Id = RightTrigger Text = <righttriggertext>
		SetScreenElementProps Id = VerticalDist Text = <verticaldisttext>
	endif
	Wait \{1
		GameFrame}
	repeat
endscript
