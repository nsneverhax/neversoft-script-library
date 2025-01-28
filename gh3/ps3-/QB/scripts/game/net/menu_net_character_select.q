
script create_leaving_lobby_dialog \{menu_id = leaving_lobby_dialog_menu
		vmenu_id = leaving_lobby_dialog_vmenu
		pad_back_script = leaving_lobby_select_cancel
		pad_choose_script = leaving_lobby_select_yes
		Pos = (640.0, 520.0)
		Z = 110}
	if (($ui_flow_manager_state [0]) = online_pause_fs)
		clean_up_user_control_helpers
	endif
	if GotParam \{PARENT}
		PARENT = <PARENT>
	else
		PARENT = root_window
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		Id = warning_message_container
		Pos = (0.0, 0.0)
	}
	CreateScreenElement {
		Type = VScrollingMenu
		PARENT = warning_message_container
		Id = <menu_id>
		just = [Center Top]
		Dims = (500.0, 150.0)
		Pos = (640.0, 465.0)
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		Pos = (298.0, 0.0)
		just = [Center Top]
		internal_just = [Center Top]
		Dims = (500.0, 150.0)
		event_handlers = [
			{pad_back <pad_back_script>}
			{pad_up generic_menu_up_or_down_sound Params = {UP}}
			{pad_down generic_menu_up_or_down_sound Params = {DOWN}}
		]
	}
	go_to_net_warning_from_pause_menu
	<Menu_pos> = (575.0, 487.0)
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
	create_pause_menu_frame container_id = net_quit_warning PARENT = warning_message_container Z = <Z>
	displaySprite PARENT = warning_message_container tex = Dialog_Title_BG Scale = (1.7, 1.7) Z = (<Z> + 4) Pos = (640.0, 100.0) just = [RIGHT Top] flip_v
	displaySprite PARENT = warning_message_container tex = Dialog_Title_BG Scale = (1.7, 1.7) Z = (<Z> + 4) Pos = (640.0, 100.0) just = [LEFT Top]
	displaySprite PARENT = warning_message_container tex = Dialog_Frame_Joiner Pos = (480.0, 510.0) Rot_Angle = 5 Scale = (1.575, 1.5) Z = (<Z> + 5)
	displaySprite PARENT = warning_message_container tex = Dialog_Frame_Joiner Pos = (750.0, 514.0) flip_v Rot_Angle = -5 Scale = (1.575, 1.5) Z = (<Z> + 5)
	displaySprite PARENT = warning_message_container tex = Dialog_BG Pos = (480.0, 500.0) Scale = (1.25, 1.0) Z = (<Z> + 4) just = [LEFT botom]
	displaySprite PARENT = warning_message_container tex = Dialog_BG Pos = (480.0, 530.0) Scale = (1.25, 1.0) Z = (<Z> + 4) just = [LEFT Top] flip_h
	CreateScreenElement {
		Type = TextElement
		PARENT = warning_message_container
		font = fontgrid_title_gh3
		Scale = 1.3
		rgba = [223 223 223 250]
		Text = "WARNING"
		just = [Center Top]
		z_priority = (<Z> + 5)
		Pos = (640.0, 175.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = warning_message_container
		font = fontgrid_title_gh3
		Scale = 0.6
		rgba = [210 210 210 250]
		Text = "You are about to leave the current game. Are you sure you want to leave?"
		just = [Center Top]
		internal_just = [Center Top]
		z_priority = (<Z> + 5)
		Pos = (640.0, 310.0)
		Dims = (700.0, 320.0)
		line_spacing = 1.0
	}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = leaving_lobby_dialog_vmenu
		Dims = (100.0, 50.0)
		event_handlers = [
			{Focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose <pad_back_script>}
		]
	}
	container_id = <Id>
	CreateScreenElement {
		Type = TextElement
		PARENT = <container_id>
		local_id = Text
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($menu_unfocus_color)
		Text = "NO"
		just = [Center Top]
		z_priority = (<Z> + 5)
	}
	fit_text_into_menu_item Id = <Id> max_width = 240
	GetScreenElementDims Id = <Id>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		Alpha = 1.0
		just = [RIGHT Center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		z_priority = (<Z> + 6)
		Scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		Alpha = 1.0
		just = [LEFT Center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		z_priority = (<Z> + 6)
		Scale = (1.0, 1.0)
	}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = leaving_lobby_dialog_vmenu
		Dims = (100.0, 50.0)
		event_handlers = [
			{Focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose <pad_choose_script> Params = <pad_choose_params>}
		]
	}
	container_id = <Id>
	CreateScreenElement {
		Type = TextElement
		PARENT = <container_id>
		local_id = Text
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($menu_unfocus_color)
		Text = "YES"
		just = [Center Top]
		z_priority = (<Z> + 5)
	}
	fit_text_into_menu_item Id = <Id> max_width = 240
	GetScreenElementDims Id = <Id>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		just = [RIGHT Center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		Alpha = 0.0
		z_priority = (<Z> + 6)
		Scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		just = [LEFT Center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		Alpha = 0.0
		z_priority = (<Z> + 6)
		Scale = (1.0, 1.0)
	}
	if (($ui_flow_manager_state [0]) = online_pause_fs)
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
		add_user_control_helper Text = "SELECT" button = Green Z = (<Z> - 10)
		add_user_control_helper Text = "BACK" button = RED Z = (<Z> - 10)
		add_user_control_helper Text = "UP/DOWN" button = Strumbar Z = (<Z> - 10)
	endif
	leaving_lobby_dialog_focus
endscript

script net_warning_focus 
	Obj_GetID
	if ScreenElementExists Id = {<ObjID> child = Text}
		DoScreenElementMorph Id = {<ObjID> child = Text} rgba = ($menu_focus_color)
	endif
	if ScreenElementExists Id = {<ObjID> child = bookend_right}
		DoScreenElementMorph Id = {<ObjID> child = bookend_right} Alpha = 1.0 preserve_flip
	endif
	if ScreenElementExists Id = {<ObjID> child = bookend_left}
		DoScreenElementMorph Id = {<ObjID> child = bookend_left} Alpha = 1.0 preserve_flip
	endif
endscript

script net_warning_unfocus 
	Obj_GetID
	if ScreenElementExists Id = {<ObjID> child = Text}
		DoScreenElementMorph Id = {<ObjID> child = Text} rgba = ($menu_unfocus_color)
	endif
	if ScreenElementExists Id = {<ObjID> child = bookend_right}
		DoScreenElementMorph Id = {<ObjID> child = bookend_right} Alpha = 0.0 preserve_flip
	endif
	if ScreenElementExists Id = {<ObjID> child = bookend_left}
		DoScreenElementMorph Id = {<ObjID> child = bookend_left} Alpha = 0.0 preserve_flip
	endif
endscript

script net_cs_go_back 
	if (<Player> = 1)
		create_leaving_lobby_dialog \{Z = 300
			PARENT = Menu_Container}
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
	leaving_lobby_dialog_unfocus
	if ScreenElementExists \{Id = vmenu_character_select_p1}
		LaunchEvent \{Type = unfocus
			Target = vmenu_character_select_p1}
	endif
	destroy_leaving_lobby_dialog
	destroy_net_popup
	EndGameNetScriptPump
	KillSpawnedScript \{Name = net_hub_stream}
	destroy_ready_icons
	network_player_lobby_message \{Type = character_select
		action = deselect}
	cs_go_back \{Params = {
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
	if ScreenElementExists \{Id = warning_message_container}
		DestroyScreenElement \{Id = warning_message_container}
	endif
	if ScreenElementExists \{Id = leaving_lobby_dialog_menu}
		DestroyScreenElement \{Id = leaving_lobby_dialog_menu}
	endif
endscript

script leaving_lobby_dialog_focus 
	if ScreenElementExists \{Id = vmenu_character_select_p1}
		LaunchEvent \{Type = unfocus
			Target = vmenu_character_select_p1}
	endif
	if ScreenElementExists \{Id = leaving_lobby_dialog_vmenu}
		LaunchEvent \{Type = Focus
			Target = leaving_lobby_dialog_vmenu}
	endif
endscript

script leaving_lobby_dialog_unfocus 
	if ScreenElementExists \{Id = leaving_lobby_dialog_vmenu}
		LaunchEvent \{Type = unfocus
			Target = leaving_lobby_dialog_vmenu}
	endif
	if ScreenElementExists \{Id = vmenu_character_select_p1}
		LaunchEvent \{Type = Focus
			Target = vmenu_character_select_p1}
	endif
endscript

script go_to_net_warning_from_pause_menu 
	if ScreenElementExists \{Id = pause_menu_frame_container}
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
