menu_mp_select_mode_font = text_a4

script create_mp_select_mode_menu 
	Change \{rich_presence_context = presence_main_menu}
	if (($is_network_game) = 1)
		Title_text = "create match"
		title_pos = (585.0, 115.0)
		left_flourish_offset = (-187.0, -9.0)
		right_flourish_offset = (-210.0, -28.0)
	else
		Title_text = "multiplayer"
		title_pos = (600.0, 115.0)
		left_flourish_offset = (-170.0, -10.0)
		right_flourish_offset = (-193.0, -29.5)
	endif
	if (($player1_status.bot_play = 1) || ($is_network_game))
		exclusive_mp_controllers = ($primary_controller)
	else
		exclusive_mp_controllers = [0 , 0]
		SetArrayElement ArrayName = exclusive_mp_controllers Index = 0 NewValue = ($player1_device)
		SetArrayElement ArrayName = exclusive_mp_controllers Index = 1 NewValue = ($player2_device)
	endif
	new_menu {
		scrollid = scrolling_mp_select_mode_menu
		vmenuid = vmenu_mp_select_mode_menu
		Menu_pos = (360.0, 470.0)
		exclusive_device = <exclusive_mp_controllers>
		internal_just = [LEFT Center]
		no_focus = 1
	}
	SetScreenElementProps \{Id = vmenu_mp_select_mode_menu
		Rot_Angle = -3}
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
	if ((($is_network_game) = 1) && (($match_type) = Player))
		Scale = 0.7
	else
		Scale = 0.85
	endif
	text_params = {
		Type = TextElement
		PARENT = vmenu_mp_select_mode_menu
		font = ($menu_mp_select_mode_font)
		Scale = <Scale>
		rgba = ($menu_unfocus_color)
		Rot_Angle = -7
	}
	create_menu_backdrop \{texture = Multiplayer_2p_BG}
	Z = 1
	g_rot_angle = -3
	CreateScreenElement \{Type = ContainerElement
		Id = mpsm_container
		PARENT = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = mpsm_container
		texture = Multiplayer_2p_LP
		Id = record
		just = [Center Center]
		Pos = (850.0, 340.0)
		Dims = (540.0, 540.0)
		z_priority = (<Z> + 0.1)
	}
	SpawnScriptNow \{menu_select_multiplayer_mode_record_rotate}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = mpsm_container
		texture = Multiplayer_2p_Jacket_02
		just = [Center Center]
		Pos = (600.0, 360.0)
		Rot_Angle = <g_rot_angle>
		Dims = (600.0, 600.0)
		z_priority = (<Z> + 0.2)
	}
	blood_splat_dims = (164.0, 164.0)
	CreateScreenElement {
		Type = SpriteElement
		PARENT = mpsm_container
		texture = Multiplayer_2p_Hilite_01
		Id = blood_splat_01
		just = [Center Center]
		Pos = (3040.0, 3060.0)
		z_priority = (<Z> + 2)
		rgba = [20 180 20 0]
		just = [0 0.7]
		Dims = <blood_splat_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = mpsm_container
		texture = Multiplayer_2p_Hilite_02
		Id = blood_splat_02
		just = [Center Center]
		Pos = (3040.0, 3060.0)
		z_priority = (<Z> + 2)
		rgba = [20 180 20 0]
		just = [0.25 0.4]
		Dims = <blood_splat_dims>
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = mpsm_container
		font = ($menu_mp_select_mode_font)
		Text = <Title_text>
		Id = multiplayer_text
		rgba = [220 220 220 250]
		Pos = <title_pos>
		Scale = (1.5, 1.3)
		font_spacing = 2
		Rot_Angle = <g_rot_angle>
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = mpsm_container
		font = ($menu_mp_select_mode_font)
		Text = "CHOOSE MODE"
		rgba = [100 100 100 250]
		Pos = (600.0, 165.0)
		Scale = (0.8, 0.8)
		font_spacing = 2
		Rot_Angle = <g_rot_angle>
	}
	fastscreenelementpos \{Id = multiplayer_text
		absolute}
	GetScreenElementDims \{Id = multiplayer_text}
	mp_text_center = (<ScreenELementPos> + (0.0, 0.5) * <Height>)
	flourish_dims = ((64.0, 32.0) * 1.3)
	<left_flourish_offset> = ((-0.5, 0.0) * <width> + (0.0, -5.0))
	CreateScreenElement {
		Type = SpriteElement
		PARENT = mpsm_container
		texture = Multiplayer_2p_Flourish
		Pos = (<mp_text_center> + <left_flourish_offset>)
		Rot_Angle = <g_rot_angle>
		Dims = <flourish_dims>
		z_priority = (<Z> + 3)
		rgba = [220 220 220 250]
		just = [RIGHT Center]
		flip_v
	}
	<right_flourish_offset> = ((0.5, 0.0) * <width> + (0.0, -20.0))
	CreateScreenElement {
		Type = SpriteElement
		PARENT = mpsm_container
		texture = Multiplayer_2p_Flourish
		Pos = (<mp_text_center> + <right_flourish_offset>)
		Rot_Angle = <g_rot_angle>
		Dims = <flourish_dims>
		z_priority = (<Z> + 3)
		rgba = [220 220 220 250]
		just = [LEFT Center]
	}
	CreateScreenElement {
		<text_params>
		Id = sm_faceofftext_id
		Text = "FACE-OFF"
		event_handlers = [
			{Focus menu_select_multiplayer_mode_focus}
			{unfocus menu_select_multiplayer_mode_unfocus}
			{pad_choose mp_select_mode_menu_select_mode Params = {mode = p2_faceoff}}
		]
	}
	CreateScreenElement {
		<text_params>
		Text = "PRO FACE-OFF"
		event_handlers = [
			{Focus menu_select_multiplayer_mode_focus}
			{unfocus menu_select_multiplayer_mode_unfocus}
			{pad_choose mp_select_mode_menu_select_mode Params = {mode = p2_pro_faceoff}}
		]
	}
	CreateScreenElement {
		<text_params>
		Text = "BATTLE"
		event_handlers = [
			{Focus menu_select_multiplayer_mode_focus}
			{unfocus menu_select_multiplayer_mode_unfocus}
			{pad_choose mp_select_mode_menu_select_mode Params = {mode = p2_battle}}
		]
	}
	if ((($is_network_game) = 1) && (($match_type) = Player))
		CreateScreenElement {
			<text_params>
			Text = "CO-OP"
			event_handlers = [
				{Focus menu_select_multiplayer_mode_focus}
				{unfocus menu_select_multiplayer_mode_unfocus}
				{pad_choose mp_select_mode_menu_select_mode Params = {mode = p2_coop}}
			]
		}
	endif
	add_user_control_helper \{Text = "SELECT"
		button = Green}
	add_user_control_helper \{Text = "BACK"
		button = RED}
	add_user_control_helper \{Text = "UP/DOWN"
		button = Strumbar}
	LaunchEvent \{Type = Focus
		Target = vmenu_mp_select_mode_menu}
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
		Target = vmenu_mp_select_mode_menu}
	Change game_mode = <mode>
	if (($is_network_game) = 1)
		ui_flow_manager_respond_to_action \{action = select_game_mode}
		if ScreenElementExists \{Id = vmenu_mp_select_mode_menu}
			LaunchEvent \{Type = Focus
				Target = vmenu_mp_select_mode_menu}
		endif
	else
		ui_flow_manager_respond_to_action \{action = select_faceoff
			create_params = {
				Player = 2
			}}
		if ScreenElementExists \{Id = vmenu_mp_select_mode_menu}
			LaunchEvent \{Type = Focus
				Target = vmenu_mp_select_mode_menu}
		endif
	endif
endscript
record_angle_change = 1

script menu_select_multiplayer_mode_record_rotate 
	begin
	GetScreenElementProps \{Id = record}
	new_rot_angle = (<Rot_Angle> + ($record_angle_change))
	if (<new_rot_angle> > 360.0)
		<new_rot_angle> = (<new_rot_angle> - 360.0)
	elseif (<new_rot_angle> < (-360.0))
		<new_rot_angle> = (<new_rot_angle> + 360.0)
	endif
	SetScreenElementProps Id = record Rot_Angle = (<new_rot_angle>)
	Wait \{1
		GameFrames}
	repeat
endscript

script menu_select_multiplayer_mode_focus 
	retail_menu_focus
	Change record_angle_change = (-1 * ($record_angle_change))
	GetTags
	SetScreenElementProps Id = <Id> Scale = 1.05
	if (<Id> = sm_faceofftext_id)
		GetScreenElementDims Id = <Id>
		if (<width> > 260)
			SetScreenElementProps Id = <Id> Scale = 1
			fit_text_in_rectangle Id = <Id> Dims = (260.0, 50.0)
		endif
	endif
	menu_select_multiplayer_mode_attach_random_blood_splat Id = <Id>
endscript

script menu_select_multiplayer_mode_unfocus 
	retail_menu_unfocus
	GetTags
	if ((($is_network_game) = 1) && (($match_type) = Player))
		Scale = 0.7
	else
		Scale = 0.85
	endif
	SetScreenElementProps Id = <Id> Scale = <Scale>
	if (<Id> = sm_faceofftext_id)
		GetScreenElementDims Id = <Id>
		if (<width> > 260)
			SetScreenElementProps Id = <Id> Scale = 1
			fit_text_in_rectangle Id = <Id> Dims = (250.0, 44.0)
		endif
	endif
endscript

script menu_select_multiplayer_mode_attach_random_blood_splat 
	SetScreenElementProps \{Id = blood_splat_01
		rgba = [
			0
			0
			0
			0
		]}
	SetScreenElementProps \{Id = blood_splat_02
		rgba = [
			0
			0
			0
			0
		]}
	GetScreenElementPosition Id = <Id> absolute
	GetScreenElementDims Id = <Id>
	GetRandomValue \{A = 0
		B = 1
		Integer
		Name = Bottom}
	GetRandomValue \{A = 0
		B = 1
		Name = horiz_ratio}
	splat_placement = (<ScreenELementPos> + (0.0, -1.0) * 12 + (0.0, 1.0) * (<Bottom> * <Height>) + (1.0, 0.0) * (<width> * <horiz_ratio>))
	GetRandomValue \{A = 1
		B = 2
		Integer
		Name = random_splat}
	if (<Bottom> = 0)
		GetRandomValue \{A = -90
			B = 90
			Name = random_rot}
	else
		GetRandomValue \{A = 90
			B = 180
			Name = random_rot}
	endif
	FormatText ChecksumName = splat_id 'blood_splat_0%d' D = <random_splat>
	SetScreenElementProps Id = <splat_id> rgba = [100 100 100 100] Pos = <splat_placement> Rot_Angle = <random_rot>
endscript
