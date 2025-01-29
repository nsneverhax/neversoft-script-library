menu_mp_select_mode_font = fontgrid_text_a3
coop_dlc_active = 0
menu_mp_select_mode_is_friendly_faceoff = 0

script create_mp_select_mode_menu 
	Change \{coop_dlc_active = 0}
	Change \{menu_mp_select_mode_is_friendly_faceoff = 0}
	Change \{rich_presence_context = presence_menus}
	if (($is_network_game) = 1)
		title_text = qs(0x220fe81c)
		title_pos = (585.0, 115.0)
		left_flourish_offset = (-187.0, -9.0)
		right_flourish_offset = (-210.0, -28.0)
	else
		title_text = qs(0x1f671e32)
		title_pos = (600.0, 115.0)
		left_flourish_offset = (-170.0, -10.0)
		right_flourish_offset = (-193.0, -29.5)
	endif
	if (($player1_status.bot_play = 1) || ($is_network_game))
		exclusive_mp_controllers = ($primary_controller)
	else
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	new_menu {
		scrollid = scrolling_mp_select_mode_menu
		vmenuid = current_menu
		menu_pos = (360.0, 440.0)
		exclusive_device = <exclusive_mp_controllers>
		internal_just = [left center]
		no_focus = 1
	}
	SetScreenElementProps \{id = current_menu
		rot_angle = -3}
	set_focus_color \{rgba = [
			195
			50
			55
			250
		]}
	set_unfocus_color \{rgba = [
			0
			0
			0
			250
		]}
	Scale = 0.7
	text_params = {
		Type = TextElement
		parent = current_menu
		font = ($menu_mp_select_mode_font)
		Scale = <Scale>
		rgba = ($menu_unfocus_color)
		rot_angle = -7
	}
	create_menu_backdrop \{texture = mode_2p_bg}
	z = 1
	g_rot_angle = -3
	CreateScreenElement \{Type = ContainerElement
		id = mpsm_container
		parent = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = SpriteElement
		parent = mpsm_container
		texture = mode_2p_lp
		id = record
		just = [center center]
		Pos = (850.0, 340.0)
		dims = (540.0, 540.0)
		z_priority = (<z> + 0.1)
	}
	SpawnScriptNow \{menu_select_multiplayer_mode_record_rotate}
	CreateScreenElement {
		Type = SpriteElement
		parent = mpsm_container
		texture = mode_2p_lp_jacket02
		just = [center center]
		Pos = (600.0, 360.0)
		rot_angle = <g_rot_angle>
		dims = (600.0, 600.0)
		z_priority = (<z> + 0.2)
	}
	blood_splat_dims = (164.0, 164.0)
	CreateScreenElement {
		Type = SpriteElement
		parent = mpsm_container
		texture = mode_2p_highlight01
		id = blood_splat_01
		just = [center center]
		Pos = (3040.0, 3060.0)
		z_priority = (<z> + 2)
		rgba = [20 180 20 0]
		just = [0 0.7]
		dims = <blood_splat_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = mpsm_container
		texture = mode_2p_highlight02
		id = blood_splat_02
		just = [center center]
		Pos = (3040.0, 3060.0)
		z_priority = (<z> + 2)
		rgba = [20 180 20 0]
		just = [0.25 0.4]
		dims = <blood_splat_dims>
	}
	CreateScreenElement {
		Type = TextElement
		parent = mpsm_container
		font = ($menu_mp_select_mode_font)
		text = <title_text>
		id = multiplayer_text
		rgba = [220 220 220 250]
		Pos = <title_pos>
		Scale = (1.5, 1.3)
		font_spacing = 2
		rot_angle = <g_rot_angle>
	}
	CreateScreenElement {
		Type = TextElement
		parent = mpsm_container
		font = ($menu_mp_select_mode_font)
		text = qs(0x89bcc52d)
		rgba = [100 100 100 250]
		Pos = (600.0, 165.0)
		Scale = (0.8, 0.8)
		font_spacing = 2
		rot_angle = <g_rot_angle>
	}
	fastscreenelementpos \{id = multiplayer_text
		absolute}
	GetScreenElementDims \{id = multiplayer_text}
	mp_text_center = (<screenelementpos> + (0.0, 0.5) * <height>)
	flourish_dims = ((64.0, 32.0) * 1.3)
	<left_flourish_offset> = ((-0.5, 0.0) * <width> + (0.0, -5.0))
	CreateScreenElement {
		Type = SpriteElement
		parent = mpsm_container
		texture = mode_2p_flourish
		Pos = (<mp_text_center> + <left_flourish_offset>)
		rot_angle = <g_rot_angle>
		dims = <flourish_dims>
		z_priority = (<z> + 3)
		rgba = [220 220 220 250]
		just = [right center]
		flip_v
	}
	<right_flourish_offset> = ((0.5, 0.0) * <width> + (0.0, -20.0))
	CreateScreenElement {
		Type = SpriteElement
		parent = mpsm_container
		texture = mode_2p_flourish
		Pos = (<mp_text_center> + <right_flourish_offset>)
		rot_angle = <g_rot_angle>
		dims = <flourish_dims>
		z_priority = (<z> + 3)
		rgba = [220 220 220 250]
		just = [left center]
	}
	CreateScreenElement {
		<text_params>
		id = sm_faceofftext_id
		text = qs(0x0952b48b)
		event_handlers = [
			{focus menu_select_multiplayer_mode_focus}
			{unfocus menu_select_multiplayer_mode_unfocus}
			{pad_choose mp_select_mode_menu_select_mode params = {mode = p2_faceoff}}
		]
	}
	CreateScreenElement {
		<text_params>
		text = qs(0x46577877)
		event_handlers = [
			{focus menu_select_multiplayer_mode_focus}
			{unfocus menu_select_multiplayer_mode_unfocus}
			{pad_choose mp_select_mode_menu_select_mode params = {mode = p2_pro_faceoff friendly}}
		]
	}
	CreateScreenElement {
		<text_params>
		text = qs(0x33b59779)
		event_handlers = [
			{focus menu_select_multiplayer_mode_focus}
			{unfocus menu_select_multiplayer_mode_unfocus}
			{pad_choose mp_select_mode_menu_select_mode params = {mode = p2_battle}}
		]
	}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script destroy_mp_select_mode_menu 
	destroy_menu \{menu_id = scrolling_mp_select_mode_menu}
	destroy_menu_backdrop
	destroy_menu \{menu_id = mpsm_container}
	KillSpawnedScript \{Name = menu_select_multiplayer_mode_record_rotate}
	clean_up_user_control_helpers
endscript

script mp_select_mode_menu_select_mode \{mode = p2_faceoff}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	if GotParam \{friendly}
		Change \{menu_mp_select_mode_is_friendly_faceoff = 1}
	endif
	Change \{band_mode_mode = None}
	Change game_mode = <mode>
	if GotParam \{set_coop_dlc}
		Change \{coop_dlc_active = 1}
	endif
	if (($is_network_game) = 1)
		ui_flow_manager_respond_to_action \{action = select_game_mode}
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = focus
				target = current_menu}
		endif
	else
		generic_event_choose \{state = uistate_character_hub}
	endif
endscript
record_angle_change = 1

script menu_select_multiplayer_mode_record_rotate 
	begin
	GetScreenElementProps \{id = record}
	new_rot_angle = (<rot_angle> + ($record_angle_change))
	if (<new_rot_angle> > 360.0)
		<new_rot_angle> = (<new_rot_angle> - 360.0)
	elseif (<new_rot_angle> < (-360.0))
		<new_rot_angle> = (<new_rot_angle> + 360.0)
	endif
	SetScreenElementProps id = record rot_angle = (<new_rot_angle>)
	Wait \{1
		gameframes}
	repeat
endscript

script menu_select_multiplayer_mode_focus 
	retail_menu_focus
	Change record_angle_change = (-1 * ($record_angle_change))
	GetTags
	Obj_GetID
	<id> = <objID>
	SetScreenElementProps id = <id> Scale = 1.05
	if (<id> = sm_faceofftext_id)
		GetScreenElementDims id = <id>
		if (<width> > 260)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> dims = (260.0, 50.0)
		endif
	endif
	menu_select_multiplayer_mode_attach_random_blood_splat id = <id>
endscript

script menu_select_multiplayer_mode_unfocus 
	retail_menu_unfocus
	GetTags
	Obj_GetID
	<id> = <objID>
	Scale = 0.7
	SetScreenElementProps id = <id> Scale = <Scale>
	if (<id> = sm_faceofftext_id)
		GetScreenElementDims id = <id>
		if (<width> > 260)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> dims = (250.0, 44.0)
		endif
	endif
endscript

script menu_select_multiplayer_mode_attach_random_blood_splat 
	SetScreenElementProps \{id = blood_splat_01
		rgba = [
			0
			0
			0
			0
		]}
	SetScreenElementProps \{id = blood_splat_02
		rgba = [
			0
			0
			0
			0
		]}
	GetScreenElementPosition id = <id> absolute
	GetScreenElementDims id = <id>
	GetRandomValue \{a = 0
		b = 1
		integer
		Name = bottom}
	GetRandomValue \{a = 0
		b = 1
		Name = horiz_ratio}
	splat_placement = (<screenelementpos> + (0.0, -1.0) * 12 + (0.0, 1.0) * (<bottom> * <height>) + (1.0, 0.0) * (<width> * <horiz_ratio>))
	GetRandomValue \{a = 1
		b = 2
		integer
		Name = random_splat}
	if (<bottom> = 0)
		GetRandomValue \{a = -90
			b = 90
			Name = random_rot}
	else
		GetRandomValue \{a = 90
			b = 180
			Name = random_rot}
	endif
	formatText checksumName = splat_id 'blood_splat_0%d' d = <random_splat>
	SetScreenElementProps id = <splat_id> rgba = [100 100 100 100] Pos = <splat_placement> rot_angle = <random_rot>
endscript
