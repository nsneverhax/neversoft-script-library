
script create_wuss_out_menu 
	Change \{boss_wuss_out = 0}
	player_device = ($last_start_pressed_device)
	warning_text = 'Man, is Joe Perry taking advantage of you? Do you need a hug? Maybe you should stick to playing bass. You wanna just pass him?  Maybe later you\'ll have what it takes to hang with a real guitar hero.'
	kill_start_key_binding
	CreateScreenElement {
		Type = TextBlockElement
		parent = root_window
		id = 0x993e4fa1
		text = <warning_text>
		font = text_a4
		Scale = (0.75, 0.7)
		just = [center center]
		dims = (630.0, 520.0)
		Pos = (650.0, 383.0)
		rgba = [210 130 0 255]
		z_priority = 5000
		Shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
	}
	create_popup_warning_menu {
		title = 'WUSS OUT?'
		textblock = {
			text = ' '
			dims = (880.0, 600.0)
			Pos = (640.0, 387.0)
			Scale = 0.58
		}
		player_device = <player_device>
		no_background
		menu_pos = (640.0, 470.0)
		dialog_dims = (600.0, 80.0)
		options = [
			{
				func = wuss_out_menu_continue
				text = 'CONTINUE'
			}
			{
				func = wuss_out_menu_wuss_out
				text = 'WUSS OUT'
			}
		]
	}
endscript

script destroy_wuss_out_menu 
	restore_start_key_binding
	destroy_menu \{menu_id = 0x993e4fa1}
	destroy_popup_warning_menu
endscript

script wuss_out_menu_continue 
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script wuss_out_menu_wuss_out 
	ui_flow_manager_respond_to_action \{action = wuss_out}
endscript
