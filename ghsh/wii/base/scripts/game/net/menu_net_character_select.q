
script create_leaving_lobby_dialog \{menu_id = leaving_lobby_dialog_menu
		vmenu_id = leaving_lobby_dialog_vmenu
		pad_back_script = leaving_lobby_select_cancel
		pad_choose_script = leaving_lobby_select_yes
		Pos = (640.0, 520.0)
		z = 110}
	if (($ui_flow_manager_state [0]) = online_pause_fs)
		clean_up_user_control_helpers
	endif
	if GotParam \{parent}
		parent = <parent>
	else
		parent = root_window
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = warning_message_container
		Pos = (0.0, 0.0)
	}
	CreateScreenElement {
		Type = VScrollingMenu
		parent = warning_message_container
		id = <menu_id>
		just = [center top]
		dims = (500.0, 150.0)
		Pos = (640.0, 465.0)
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		parent = <menu_id>
		id = <vmenu_id>
		Pos = (298.0, 0.0)
		just = [center top]
		internal_just = [center top]
		dims = (500.0, 150.0)
		event_handlers = [
			{pad_back <pad_back_script>}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	go_to_net_warning_from_pause_menu
	<menu_pos> = (575.0, 487.0)
	<bookend_r_pos> = (675.0, 533.0)
	<bookend_l_pos> = (540.0, 533.0)
	Change \{menu_focus_color = [
			180
			50
			50
			255
		]}
	Change \{menu_unfocus_color = [
			0
			0
			0
			255
		]}
	create_pause_menu_frame container_id = net_quit_warning z = <z>
	displaySprite parent = warning_message_container tex = Dialog_Title_BG Scale = (1.7, 1.7) z = (<z> + 4) Pos = (640.0, 100.0) just = [right top] flip_v
	displaySprite parent = warning_message_container tex = Dialog_Title_BG Scale = (1.7, 1.7) z = (<z> + 4) Pos = (640.0, 100.0) just = [left top]
	displaySprite parent = warning_message_container tex = Dialog_Frame_Joiner Pos = (480.0, 510.0) rot_angle = 5 Scale = (1.575, 1.5) z = (<z> + 5)
	displaySprite parent = warning_message_container tex = Dialog_Frame_Joiner Pos = (750.0, 514.0) flip_v rot_angle = -5 Scale = (1.575, 1.5) z = (<z> + 5)
	displaySprite parent = warning_message_container tex = Dialog_BG Pos = (480.0, 500.0) Scale = (2.5, 2.0) z = (<z> + 4) just = [left botom]
	displaySprite parent = warning_message_container tex = Dialog_BG Pos = (480.0, 530.0) Scale = (2.5, 2.0) z = (<z> + 4) just = [left top] flip_h
	title_pos = (640.0, 175.0)
	if (German)
		title_pos = (640.0, 165.0)
	endif
	if (French)
		title_pos = (640.0, 165.0)
	endif
	CreateScreenElement {
		Type = TextElement
		parent = warning_message_container
		font = fontgrid_title_a1
		Scale = 1.3
		rgba = [223 223 223 250]
		text = qs(0xaa163738)
		just = [center top]
		z_priority = (<z> + 5)
		Pos = <title_pos>
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	0xf18f2cf8 = (640.0, 310.0)
	if (German)
		0xf18f2cf8 = (640.0, 295.0)
	endif
	if (French)
		0xf18f2cf8 = (640.0, 295.0)
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = warning_message_container
		font = fontgrid_title_a1
		Scale = 1.0
		rgba = [210 210 210 250]
		text = qs(0x26ab5d06)
		just = [center top]
		internal_just = [center top]
		z_priority = (<z> + 5)
		Pos = <0xf18f2cf8>
		dims = (400.0, 320.0)
		line_spacing = 1.0
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = leaving_lobby_dialog_vmenu
		dims = (100.0, 40.0)
		event_handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose <pad_back_script>}
		]
	}
	container_id = <id>
	CreateScreenElement {
		Type = TextElement
		parent = <container_id>
		local_id = text
		font = fontgrid_title_a1
		Scale = 0.85
		rgba = ($menu_unfocus_color)
		text = qs(0xd2915c27)
		just = [center top]
		z_priority = (<z> + 5)
	}
	fit_text_into_menu_item id = <id> max_width = 240
	GetScreenElementDims id = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		local_id = bookend_left
		texture = dialog_menu_hilight
		alpha = 1.0
		just = [right center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		local_id = bookend_right
		texture = dialog_menu_hilight
		alpha = 1.0
		just = [left center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = leaving_lobby_dialog_vmenu
		dims = (100.0, 40.0)
		event_handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
		]
	}
	container_id = <id>
	CreateScreenElement {
		Type = TextElement
		parent = <container_id>
		local_id = text
		font = fontgrid_title_a1
		Scale = 0.85
		rgba = ($menu_unfocus_color)
		text = qs(0x58e0a1fb)
		just = [center top]
		z_priority = (<z> + 5)
	}
	fit_text_into_menu_item id = <id> max_width = 240
	GetScreenElementDims id = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		local_id = bookend_left
		texture = dialog_menu_hilight
		just = [right center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		alpha = 0.0
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		local_id = bookend_right
		texture = dialog_menu_hilight
		just = [left center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		alpha = 0.0
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
	}
	if (($ui_flow_manager_state [0]) = online_pause_fs)
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
		add_user_control_helper text = qs(0xc18d5e76) button = green z = (<z> - 10)
		add_user_control_helper text = qs(0xaf4d5dd2) button = red z = (<z> - 10)
	endif
	leaving_lobby_dialog_focus
endscript

script net_warning_focus 
	Obj_GetID
	if ScreenElementExists id = {<objID> child = text}
		legacydoscreenelementmorph id = {<objID> child = text} rgba = ($menu_focus_color)
	endif
	if ScreenElementExists id = {<objID> child = bookend_right}
		legacydoscreenelementmorph id = {<objID> child = bookend_right} alpha = 1.0 preserve_flip
	endif
	if ScreenElementExists id = {<objID> child = bookend_left}
		legacydoscreenelementmorph id = {<objID> child = bookend_left} alpha = 1.0 preserve_flip
	endif
endscript

script net_warning_unfocus 
	Obj_GetID
	if ScreenElementExists id = {<objID> child = text}
		legacydoscreenelementmorph id = {<objID> child = text} rgba = ($menu_unfocus_color)
	endif
	if ScreenElementExists id = {<objID> child = bookend_right}
		legacydoscreenelementmorph id = {<objID> child = bookend_right} alpha = 0.0 preserve_flip
	endif
	if ScreenElementExists id = {<objID> child = bookend_left}
		legacydoscreenelementmorph id = {<objID> child = bookend_left} alpha = 0.0 preserve_flip
	endif
endscript

script net_cs_go_back 
	if (<Player> = 1)
		if isngc
			0x5f508ae9
		else
			create_leaving_lobby_dialog \{z = 300}
		endif
	else
		drop_client_from_character_select
		if IsHost
			net_lobby_state_message \{current_state = character_hub
				action = request
				request_state = leaving_lobby}
		endif
	endif
endscript

script leaving_lobby_select_yes 
	if isngc
		destroy_generic_popup
	else
		leaving_lobby_dialog_unfocus
		destroy_leaving_lobby_dialog
		destroy_net_popup
	endif
	EndGameNetScriptPump
	KillSpawnedScript \{Name = net_hub_stream}
	destroy_ready_icons
	network_player_lobby_message \{Type = character_select
		action = deselect}
	cs_go_back \{params = {
			Player = 1
		}}
endscript

script leaving_lobby_select_cancel 
	leaving_lobby_dialog_unfocus
	destroy_leaving_lobby_dialog
endscript

script destroy_leaving_lobby_dialog 
	destroy_pause_menu_frame \{container_id = net_quit_warning}
	if (($ui_flow_manager_state [0]) = online_pause_fs)
		clean_up_user_control_helpers
	endif
	if ScreenElementExists \{id = warning_message_container}
		DestroyScreenElement \{id = warning_message_container}
	endif
	if ScreenElementExists \{id = leaving_lobby_dialog_menu}
		DestroyScreenElement \{id = leaving_lobby_dialog_menu}
	endif
endscript

script leaving_lobby_dialog_focus 
	if ScreenElementExists \{id = leaving_lobby_dialog_vmenu}
		LaunchEvent \{Type = focus
			target = leaving_lobby_dialog_vmenu}
	endif
endscript

script leaving_lobby_dialog_unfocus 
	if ScreenElementExists \{id = leaving_lobby_dialog_vmenu}
		LaunchEvent \{Type = unfocus
			target = leaving_lobby_dialog_vmenu}
	endif
endscript

script go_to_net_warning_from_pause_menu 
	if ScreenElementExists \{id = pause_menu_frame_container}
		destroy_pause_menu_frame \{container_id = net_quit_warning}
		destroy_menu \{menu_id = scrolling_pause}
		destroy_menu \{menu_id = pause_menu_frame_container}
		KillSpawnedScript \{Name = animate_bunny_flame}
	endif
endscript

script return_to_pause_menu_from_net_warning 
	destroy_leaving_lobby_dialog
	create_pause_menu
endscript

script pause_menu_really_quit_net_game 
	leaving_lobby_dialog_unfocus
	destroy_leaving_lobby_dialog
	ui_flow_manager_respond_to_action \{action = select_quit
		create_params = {
			Player = 1
		}}
endscript

script 0x5f508ae9 
	create_generic_popup \{title = qs(0xaa163738)
		message = qs(0x26ab5d06)
		yes_no_menu
		focus_no
		back_script = destroy_generic_popup
		yes_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				leaving_lobby_select_yes
			}
		]
		no_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				destroy_generic_popup
			}
		]}
endscript

script 0x35bb06c0 
	create_generic_popup \{title = qs(0xaa163738)
		message = qs(0x26ab5d06)
		yes_no_menu
		focus_no
		back_script = destroy_generic_popup
		yes_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				0x68de6eeb
			}
		]
		no_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				destroy_generic_popup
			}
		]
		z = 20000}
endscript

script 0x68de6eeb 
	destroy_generic_popup
	ui_flow_manager_respond_to_action \{action = select_quit
		create_params = {
			Player = 1
		}}
endscript
