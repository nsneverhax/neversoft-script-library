menu_mp_select_mode_font = text_a4
coop_dlc_active = 0
current_selected_item = sm_faceofftext_id

script create_mp_select_mode_menu 
	Change \{coop_dlc_active = 0}
	Change \{rich_presence_context = presence_main_menu}
	if (($is_network_game) = 1)
		title_text = "create match"
		title_pos = (585.0, 115.0)
		left_flourish_offset = (-187.0, -9.0)
		right_flourish_offset = (-210.0, -28.0)
	else
		title_text = "multiplayer"
		title_pos = (600.0, 115.0)
		left_flourish_offset = (-170.0, -10.0)
		right_flourish_offset = (-193.0, -29.5)
	endif
	if (($player1_status.bot_play = 1) || ($is_network_game))
		exclusive_mp_controllers = ($primary_controller)
	else
		exclusive_mp_controllers = [0 , 0]
		SetArrayElement ArrayName = exclusive_mp_controllers index = 0 NewValue = ($player1_device)
		SetArrayElement ArrayName = exclusive_mp_controllers index = 1 NewValue = ($player2_device)
	endif
	new_menu {
		scrollid = scrolling_mp_select_mode_menu
		vmenuid = vmenu_mp_select_mode_menu
		menu_pos = (360.0, 470.0)
		exclusive_device = <exclusive_mp_controllers>
		internal_just = [left center]
		no_focus = 1
	}
	SetScreenElementProps \{id = vmenu_mp_select_mode_menu
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
	if ((($is_network_game) = 1) && (($match_type) = Player))
		Scale = 0.7
	elseif ($is_network_game = 0)
		Scale = 0.7
	else
		Scale = 0.85
	endif
	text_params = {
		Type = TextElement
		parent = vmenu_mp_select_mode_menu
		font = ($menu_mp_select_mode_font)
		Scale = <Scale>
		rgba = ($menu_unfocus_color)
		rot_angle = -7
	}
	create_menu_backdrop \{texture = Multiplayer_2p_BG}
	z = 1
	g_rot_angle = -3
	CreateScreenElement \{Type = ContainerElement
		id = mpsm_container
		parent = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = SpriteElement
		parent = mpsm_container
		texture = Multiplayer_2p_LP
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
		texture = Multiplayer_2p_Jacket_02
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
		texture = Multiplayer_2p_Hilite_01
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
		texture = Multiplayer_2p_Hilite_02
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
		text = "CHOOSE MODE"
		rgba = [100 100 100 250]
		Pos = (600.0, 165.0)
		Scale = (0.8, 0.8)
		font_spacing = 2
		rot_angle = <g_rot_angle>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = mpsm_container
		texture = Options_Calibrate_Paper
		just = [center center]
		Pos = (200.0, 360.0)
		rot_angle = <g_rot_angle>
		dims = (305.0, 444.0)
		z_priority = (<z> + 0.1)
	}
	displaySprite {
		parent = mpsm_container
		tex = tape_H_02
		Pos = (110.0, 115.0)
		dims = (132.0, 64.0)
		z_priority = (<z> + 0.15)
		rot_angle = (<g_rot_angle> + 10)
	}
	displaySprite {
		parent = mpsm_container
		tex = tape_H_02
		rgba = [0 0 0 128]
		Pos = (112.0, 117.0)
		dims = (132.0, 64.0)
		z_priority = (<z> + 0.125)
		rot_angle = (<g_rot_angle> + 10)
	}
	CreateScreenElement {
		Type = TextElement
		parent = mpsm_container
		font = ($menu_mp_select_mode_font)
		text = "FACE-OFF"
		just = [left top]
		rgba = [60 45 30 250]
		Pos = (52.0, 182.0)
		Scale = (0.7, 0.7)
		rot_angle = <g_rot_angle>
		z_priority = (<z> + 0.2)
	}
	CreateScreenElement {
		Type = TextElement
		parent = mpsm_container
		font = ($menu_mp_select_mode_font)
		text = "Alternating play on"
		just = [left top]
		rgba = [50 50 50 250]
		Pos = (67.0, 220.0)
		Scale = (0.5, 0.5)
		rot_angle = <g_rot_angle>
		z_priority = (<z> + 0.2)
	}
	CreateScreenElement {
		Type = TextElement
		parent = mpsm_container
		font = ($menu_mp_select_mode_font)
		text = "the same note chart"
		just = [left top]
		rgba = [50 50 50 250]
		Pos = (67.0, 242.0)
		Scale = (0.5, 0.5)
		rot_angle = <g_rot_angle>
		z_priority = (<z> + 0.2)
	}
	CreateScreenElement {
		Type = TextElement
		parent = mpsm_container
		font = ($menu_mp_select_mode_font)
		text = "PRO FACE-OFF"
		just = [left top]
		rgba = [60 45 30 250]
		Pos = (60.0, 302.0)
		Scale = (0.7, 0.7)
		rot_angle = (<g_rot_angle> -1)
		z_priority = (<z> + 0.2)
	}
	CreateScreenElement {
		Type = TextElement
		parent = mpsm_container
		font = ($menu_mp_select_mode_font)
		text = "Play on the same note"
		just = [left top]
		rgba = [50 50 50 250]
		Pos = (75.0, 340.0)
		Scale = (0.5, 0.5)
		rot_angle = <g_rot_angle>
		z_priority = (<z> + 0.2)
	}
	CreateScreenElement {
		Type = TextElement
		parent = mpsm_container
		font = ($menu_mp_select_mode_font)
		text = "chart at the same"
		just = [left top]
		rgba = [50 50 50 250]
		Pos = (75.0, 362.0)
		Scale = (0.5, 0.5)
		rot_angle = <g_rot_angle>
		z_priority = (<z> + 0.2)
	}
	CreateScreenElement {
		Type = TextElement
		parent = mpsm_container
		font = ($menu_mp_select_mode_font)
		text = "difficulty"
		just = [left top]
		rgba = [50 50 50 250]
		Pos = (75.0, 384.0)
		Scale = (0.5, 0.5)
		rot_angle = <g_rot_angle>
		z_priority = (<z> + 0.2)
	}
	CreateScreenElement {
		Type = TextElement
		parent = mpsm_container
		font = ($menu_mp_select_mode_font)
		text = "CO-OP"
		just = [left top]
		rgba = [60 45 30 250]
		Pos = (68.0, 422.0)
		Scale = (0.7, 0.7)
		rot_angle = (<g_rot_angle> + 1)
		z_priority = (<z> + 0.2)
	}
	CreateScreenElement {
		Type = TextElement
		parent = mpsm_container
		font = ($menu_mp_select_mode_font)
		text = "Work together to"
		just = [left top]
		rgba = [50 50 50 250]
		Pos = (83.0, 460.0)
		Scale = (0.5, 0.5)
		rot_angle = <g_rot_angle>
		z_priority = (<z> + 0.2)
	}
	CreateScreenElement {
		Type = TextElement
		parent = mpsm_container
		font = ($menu_mp_select_mode_font)
		text = "complete each song"
		just = [left top]
		rgba = [50 50 50 250]
		Pos = (83.0, 482.0)
		Scale = (0.5, 0.5)
		rot_angle = <g_rot_angle>
		z_priority = (<z> + 0.2)
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
		texture = Multiplayer_2p_Flourish
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
		texture = Multiplayer_2p_Flourish
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
		text = "FACE-OFF"
		event_handlers = [
			{focus menu_select_multiplayer_mode_focus}
			{unfocus menu_select_multiplayer_mode_unfocus}
			{pad_choose mp_select_mode_menu_select_mode params = {mode = p2_faceoff}}
		]
	}
	CreateScreenElement {
		<text_params>
		text = "PRO FACE-OFF"
		id = pro_faceofftext_id
		event_handlers = [
			{focus menu_select_multiplayer_mode_focus}
			{unfocus menu_select_multiplayer_mode_unfocus}
			{pad_choose mp_select_mode_menu_select_mode params = {mode = p2_pro_faceoff}}
		]
	}
	if ((($is_network_game) = 1) && (($match_type) = Player))
		CreateScreenElement {
			<text_params>
			text = "CO-OP"
			id = co_op_text_id
			event_handlers = [
				{focus menu_select_multiplayer_mode_focus}
				{unfocus menu_select_multiplayer_mode_unfocus}
				{pad_choose mp_select_mode_menu_select_mode params = {mode = p2_coop}}
			]
		}
	endif
	if (($is_network_game) = 0)
		CreateScreenElement {
			<text_params>
			text = "CO-OP"
			id = co_op_text_id
			event_handlers = [
				{focus menu_select_multiplayer_mode_focus}
				{unfocus menu_select_multiplayer_mode_unfocus}
				{pad_choose mp_select_mode_menu_select_mode params = {mode = p2_faceoff set_coop_dlc}}
			]
		}
	endif
	add_user_control_helper \{text = "SELECT"
		button = green}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar}
	LaunchEvent \{Type = focus
		target = vmenu_mp_select_mode_menu}
	SpawnScriptNow \{mp_select_watch_timer}
endscript

script destroy_mp_select_mode_menu 
	printf \{"destroy_mp_select_mode_menu: start"}
	destroy_menu \{menu_id = scrolling_mp_select_mode_menu}
	destroy_menu_backdrop
	destroy_menu \{menu_id = mpsm_container}
	KillSpawnedScript \{Name = menu_select_multiplayer_mode_record_rotate}
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = mp_select_watch_timer}
	printf \{"destroy_mp_select_mode_menu: end"}
endscript

script mp_select_watch_timer 
	SpawnScriptNow \{set_countdown_timer}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		printf \{"mp_select_watch_timer: countdown expired with id=%s"
			s = $current_selected_item}
		break
	endif
	Wait \{1
		Second}
	repeat
	if (mode = p2_pro_faceoff || mode = p2_faceoff)
		SpawnScriptNow \{mp_select_mode_menu_select_mode
			params = {
				mode = $current_selected_item
			}}
	else
		SpawnScriptNow \{mp_select_mode_menu_select_mode
			params = {
				mode = p2_faceoff
				set_coop_dlc
			}}
	endif
endscript

script mp_select_mode_menu_select_mode \{mode = p2_faceoff}
	printf "mp_select_mode_menu_select_mode: mode = %s" s = <mode>
	LaunchEvent \{Type = unfocus
		target = vmenu_mp_select_mode_menu}
	Change game_mode = <mode>
	GetGlobalTags \{arcade_audits}
	switch <mode>
		case p2_pro_faceoff
		<arcade_total_pro_faceoff_plays> = (<arcade_total_pro_faceoff_plays> + 2)
		case p2_faceoff
		if GotParam \{set_coop_dlc}
			<arcade_total_coop_plays> = (<arcade_total_coop_plays> + 2)
		else
			<arcade_total_faceoff_plays> = (<arcade_total_faceoff_plays> + 2)
		endif
		case p2_coop
		<arcade_total_coop_plays> = (<arcade_total_coop_plays> + 2)
	endswitch
	if GotParam \{set_coop_dlc}
		Change \{coop_dlc_active = 1}
	endif
	SetGlobalTags arcade_audits params = {
		arcade_total_faceoff_plays = <arcade_total_faceoff_plays>
		arcade_total_pro_faceoff_plays = <arcade_total_pro_faceoff_plays>
		arcade_total_coop_plays = <arcade_total_coop_plays>
	}
	if (($is_network_game) = 1)
		ui_flow_manager_respond_to_action \{action = select_game_mode}
		if ScreenElementExists \{id = vmenu_mp_select_mode_menu}
			LaunchEvent \{Type = focus
				target = vmenu_mp_select_mode_menu}
		endif
	else
		printf "mp_select_mode_menu_select_mode: game_mode now %s" s = <mode>
		if ScreenElementExists \{id = vmenu_mp_select_mode_menu}
			LaunchEvent \{Type = focus
				target = vmenu_mp_select_mode_menu}
		endif
		ui_flow_manager_respond_to_action \{action = select_faceoff
			create_params = {
				Player = 2
			}}
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
	SetScreenElementProps id = <id> Scale = 1.05
	if (<id> = sm_faceofftext_id)
		GetScreenElementDims id = <id>
		if (<width> > 260)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> dims = (260.0, 50.0)
		endif
	endif
	switch (<id>)
		case pro_faceofftext_id
		Change \{current_selected_item = p2_pro_faceoff}
		case battle_text_id
		Change \{current_selected_item = p2_battle}
		case co_op_text_id
		Change \{current_selected_item = p2_coop}
		case sm_faceofftext_id
		default
		Change \{current_selected_item = p2_faceoff}
	endswitch
	menu_select_multiplayer_mode_attach_random_blood_splat id = <id>
endscript

script menu_select_multiplayer_mode_unfocus 
	retail_menu_unfocus
	GetTags
	if ((($is_network_game) = 1) && (($match_type) = Player))
		Scale = 0.7
	else
		Scale = 0.85
	endif
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
