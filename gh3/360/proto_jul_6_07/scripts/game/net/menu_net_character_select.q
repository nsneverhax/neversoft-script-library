
script create_leaving_lobby_dialog {
		menu_id = leaving_lobby_dialog_menu
		vmenu_id = leaving_lobby_dialog_vmenu
		pad_back_script = leaving_lobby_select_cancel
		pos = (622.0, 520.0)
	}
	0x9d1ea0b3 = [
		{pad_back generic_menu_pad_back params = {callback = <pad_back_script>}}
	]
	new_menu scrollid = <menu_id> vmenuid = <vmenu_id> use_backdrop = (0) menu_pos = <pos> event_handlers = <0x9d1ea0b3>
	createscreenelement {
		type = containerelement
		parent = root_window
		id = 0xebb67a7c
		pos = (0.0, 0.0)
	}
	create_pause_menu_frame z = 49
	displaysprite parent = 0xebb67a7c tex = dialog_title_bg dims = (240.0, 200.0) z = 51 pos = (640.0, 450.0) just = [right top] flip_v
	displaysprite parent = 0xebb67a7c tex = dialog_title_bg dims = (240.0, 200.0) z = 51 pos = (640.0, 450.0) just = [left top]
	createscreenelement {
		type = textelement
		parent = 0xebb67a7c
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = [210 210 210 250]
		text = "WARNING"
		just = [center top]
		z_priority = 50.0
		pos = (640.0, 230.0)
	}
	createscreenelement {
		type = textblockelement
		parent = 0xebb67a7c
		font = text_a5
		scale = 0.75
		rgba = [210 210 210 250]
		text = "You are about to leave the current game. Are you sure you want to leave?"
		internal_just = [center top]
		z_priority = 49.0
		pos = (640.0, 475.0)
		dims = (500.0, 450.0)
	}
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		scale = 0.5
		rgba = [128 128 128 250]
		text = "NO"
		just = [center top]
		z_priority = 52.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose leaving_lobby_select_cancel}
		]
	}
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		scale = 0.5
		rgba = [128 128 128 250]
		text = "YES"
		just = [center top]
		z_priority = 52.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose leaving_lobby_select_yes}
		]
	}
	set_focus_color rgba = [255 255 255 250]
	set_unfocus_color rgba = [128 128 128 250]
	leaving_lobby_dialog_focus
endscript

script net_cs_go_back 
	create_leaving_lobby_dialog
endscript

script leaving_lobby_select_yes 
	leaving_lobby_dialog_unfocus
	destroy_pause_menu_frame
	if screenelementexists \{id = 0xebb67a7c}
		destroyscreenelement \{id = 0xebb67a7c}
	endif
	if screenelementexists \{id = leaving_lobby_dialog_menu}
		destroyscreenelement \{id = leaving_lobby_dialog_menu}
	endif
	network_player_lobby_message \{type = character_select
		action = deselect}
	cs_go_back \{params = {
			player = 1
		}}
endscript

script leaving_lobby_select_cancel 
	leaving_lobby_dialog_unfocus
	destroy_pause_menu_frame
	if screenelementexists \{id = 0xebb67a7c}
		destroyscreenelement \{id = 0xebb67a7c}
	endif
	if screenelementexists \{id = leaving_lobby_dialog_menu}
		destroyscreenelement \{id = leaving_lobby_dialog_menu}
	endif
endscript

script leaving_lobby_dialog_focus 
	launchevent \{type = unfocus
		target = vmenu_character_select_p1}
	launchevent \{type = focus
		target = leaving_lobby_dialog_vmenu}
endscript

script leaving_lobby_dialog_unfocus 
	launchevent \{type = unfocus
		target = leaving_lobby_dialog_vmenu}
	launchevent \{type = focus
		target = vmenu_character_select_p1}
endscript
