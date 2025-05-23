
script create_boss_confirmation_screen 
	new_menu scrollid = bc_scroll vmenuid = bc_vmenu tile_sprite = 0 menu_pos = (605.0, 380.0)
	create_pause_menu_frame
	text_params = {parent = bc_vmenu type = textelement font = text_a4 rgba = ($menu_unfocus_color)}
	createscreenelement {
		parent = bc_scroll type = textelement font = text_a4 rgba = ($menu_unfocus_color)
		text = "PLAY BOSS BATTLE?"
		pos = {(35.0, -45.0) relative}
	}
	createscreenelement {
		<text_params>
		text = "YES"
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = choose_yes}}
		]
	}
	createscreenelement {
		<text_params>
		text = "NO"
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = choose_no}}
		]
	}
endscript

script destroy_boss_confirmation_screen 
	destroy_menu \{menu_id = bc_scroll}
	destroy_pause_menu_frame
endscript
