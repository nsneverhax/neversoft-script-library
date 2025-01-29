tutorial_select_menu_font = text_a4
menu_tutorial_select_num_items = 3

script create_tutorial_select_menu 
	change rich_presence_context = presence_tutorial
	createscreenelement {
		parent = root_window
		id = ts_container
		type = containerelement
		pos = (0.0, 0.0)
	}
	create_generic_backdrop
	createscreenelement {
		parent = ts_container
		id = ts_controller
		type = textelement
		font = ($tutorial_select_menu_font)
		pos = (800.0, 75.0)
		text = "TUTORIALS"
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{pad_up 0x32f1790a}
			{pad_down 0xe69d643a}
			{pad_choose 0xeac03846}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
	}
	getglobaltags training
	if (<advanced_techniques_lesson> = unlocked)
		num_unlocked = 4
	elseif (<guitar_battle_lesson> = unlocked)
		num_unlocked = 3
	elseif (<star_power_lesson> = unlocked)
		num_unlocked = 2
	else
		num_unlocked = 1
	endif
	ts_controller :settags current_item = 1 0x479d2824 = ts_basic num_unlocked = <num_unlocked>
	launchevent type = focus target = ts_controller
	0x509bde0b = {parent = ts_container type = textelement font = ($tutorial_select_menu_font) rgba = ($menu_unfocus_color)}
	0x23ec8d46 = {parent = ts_container type = textelement font = ($tutorial_select_menu_font) rgba = [210 130 0 150]}
	pos = (800.0, 150.0)
	createscreenelement {
		<0x509bde0b>
		id = ts_basic
		text = "Basic lessons"
		pos = <pos>
	}
	pos = (800.0, 190.0)
	if (<star_power_lesson> = unlocked)
		0x34b4766f = <0x509bde0b>
	else
		0x34b4766f = <0x23ec8d46>
	endif
	createscreenelement {
		<0x34b4766f>
		id = ts_star
		text = "Star power"
		pos = <pos>
	}
	pos = (800.0, 230.0)
	if (<guitar_battle_lesson> = unlocked)
		0x9165d7d2 = <0x509bde0b>
	else
		0x9165d7d2 = <0x23ec8d46>
	endif
	createscreenelement {
		<0x9165d7d2>
		id = ts_battle
		text = "Guitar Battle"
		pos = <pos>
	}
	pos = (800.0, 270.0)
	if (<advanced_techniques_lesson> = unlocked)
		0x9165d7d2 = <0x509bde0b>
	else
		0x9165d7d2 = <0x23ec8d46>
	endif
	createscreenelement {
		<0x9165d7d2>
		id = ts_advanced
		text = "Advanced techniques"
		pos = <pos>
	}
	retail_menu_focus id = ts_basic
endscript

script destroy_tutorial_select_menu 
	destroy_menu \{menu_id = ts_container}
	destroy_generic_backdrop
endscript

script menu_tutorial_select_choose_basic 
	set_training_script \{name = training_basic_tutorial_script}
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script menu_tutorial_select_choose_star_power 
	set_training_script \{name = training_star_power_tutorial_script}
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script menu_tutorial_select_choose_battle 
	set_training_script \{name = training_battle_tutorial_script}
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script menu_tutorial_select_choose_advanced 
	set_training_script \{name = training_advanced_techniques_tutorial_script}
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script 0x32f1790a 
	generic_menu_up_or_down_sound \{up}
	ts_controller :gettags
	retail_menu_unfocus id = <0x479d2824>
	if (<current_item> = 1)
		<current_item> = <num_unlocked>
	else
		<current_item> = (<current_item> - 1)
	endif
	0xe9a3c682 current_item = (<current_item>)
	0x479d2824 = <item_id>
	retail_menu_focus id = <item_id>
	ts_controller :settags current_item = (<current_item>) 0x479d2824 = (<0x479d2824>)
endscript

script 0xe69d643a 
	generic_menu_up_or_down_sound \{down}
	ts_controller :gettags
	retail_menu_unfocus id = <0x479d2824>
	if (<current_item> = <num_unlocked>)
		<current_item> = 1
	else
		<current_item> = (<current_item> + 1)
	endif
	0xe9a3c682 current_item = (<current_item>)
	0x479d2824 = <item_id>
	retail_menu_focus id = <item_id>
	ts_controller :settags current_item = (<current_item>) 0x479d2824 = (<0x479d2824>)
endscript

script 0xeac03846 
	ts_controller :gettags
	switch (<current_item>)
		case 1
		menu_tutorial_select_choose_basic
		case 2
		menu_tutorial_select_choose_star_power
		case 3
		menu_tutorial_select_choose_battle
		case 4
		menu_tutorial_select_choose_advanced
		default
	endswitch
endscript

script 0xe9a3c682 
	switch (<current_item>)
		case 1
		return \{item_id = ts_basic}
		case 2
		return \{item_id = ts_star}
		case 3
		return \{item_id = ts_battle}
		case 4
		return \{item_id = ts_advanced}
	endswitch
endscript
