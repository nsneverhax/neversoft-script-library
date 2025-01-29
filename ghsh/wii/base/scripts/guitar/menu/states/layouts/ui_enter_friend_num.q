
script ui_create_enter_friend_num 
	make_generic_menu \{title = qs(0x65169255)
		use_all_controllers
		pad_back_script = nullscript}
	printstruct <...>
	CreateScreenElement \{Type = descinterface
		desc = 'generic_menu_name'
		parent = root_window
		id = 0x08e7fe22
		Pos = (20.0, 30.0)
		0x170052c5 = qs(0xc24790f4)}
	<id> :desc_resolvealias Name = alias_vmenu_entry
	AssignAlias id = <resolved_id> alias = current_menu
	text_entry_add_item {
		pad_choose_script = prompt_confirm_friend_num
		pad_choose_params = {offline = <offline>}
		pad_back_script = generic_event_back
		validity_message = qs(0x6b57c58a)
		font = fontgrid_text_a8
		dims = (300.0, 40.0)
		rgba = (($g_menu_colors).menu_title)
		numbers_only = 1
	}
	LaunchEvent \{Type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
	LaunchEvent \{Type = pad_choose}
	ui_enter_friend_num_helpers \{state = Base}
endscript

script ui_destroy_enter_friend_num 
	clean_up_user_control_helpers
	generic_ui_destroy
	if ScreenElementExists \{id = 0x08e7fe22}
		DestroyScreenElement \{id = 0x08e7fe22}
	endif
endscript

script ui_return_enter_friend_num 
	ui_enter_friend_num_helpers \{state = Base}
endscript

script ui_enter_friend_num_helpers 
	clean_up_user_control_helpers
	switch <state>
		case Base
		add_user_control_helper \{text = qs(0xb73cb78f)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0x2931d48b)
			button = yellow
			z = 100000}
		add_user_control_helper \{text = qs(0x1c2cd639)
			button = blue
			z = 100000}
		case popup
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
	endswitch
endscript

script prompt_confirm_friend_num 
	SetScreenElementProps {
		id = <text_entry>
		event_handlers = [
			{pad_choose initiate_text_entry params = {text_entry = <text_entry>}}
			{pad_start nullscript}
			{pad_back nullscript}
			{pad_up nullscript}
			{pad_down nullscript}
			{pad_option nullscript}
		]
		replace_handlers
	}
	LaunchEvent Type = unfocus target = <text_entry>
	LaunchEvent \{Type = focus
		target = current_menu}
	formatText TextName = confirm_message qs(0x964450f2) a = <text>
	if (<offline> = 1)
		<confirm_script> = add_friend_post_confirm_offline
	else
		<confirm_script> = add_friend_post_confirm
	endif
	create_generic_popup {
		title = qs(0x326e2d2f)
		yes_no_menu
		yes_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose <confirm_script> params = {text = <text> text_entry = <text_entry>}}
		]
		no_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose enter_friend_num_destroy params = {text_entry = <text_entry>}}
		]
		message = <confirm_message>
		back_script = enter_friend_num_destroy
		back_params = {text_entry = <text_entry>}
	}
	ui_enter_friend_num_helpers \{state = popup}
endscript

script add_friend_post_confirm 
	destroy_generic_popup
	addfriend friend_key = <text> offline = 0
	if (<error> = 0)
		printf qs(0x8b9ab338) i = <text>
		enable_network_wait_variable
		create_generic_popup \{title = qs(0x982360c4)
			loading_window
			message = qs(0xa63accfc)
			wait_variable = network_wait_var}
		enable_network_wait_variable
		updatefriendslist
		create_generic_popup \{title = qs(0x37f4c584)
			loading_window
			message = qs(0x8d5c436f)
			wait_variable = network_wait_var}
		generic_event_back
	else
		formatText checksumName = error_code 'wii_add_error%a' a = <error>
		printf qs(0x6e6da50a) j = <text>
		create_generic_popup {
			title = qs(0x79597197)
			ok_menu
			message = ($<error_code>)
			ok_eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose enter_friend_num_destroy params = {text_entry = <text_entry>}}
			]
			back_script = enter_friend_num_destroy
			back_params = {text_entry = <text_entry>}
		}
	endif
endscript

script add_friend_post_confirm_offline 
	destroy_generic_popup
	addfriend friend_key = <text> offline = 1
	if (<error> = 0)
		updatefriendslist
		generic_event_back
	else
		formatText checksumName = error_code 'wii_add_error%a' a = <error>
		printf qs(0x6e6da50a) j = <text>
		create_generic_popup {
			title = qs(0x79597197)
			ok_menu
			message = ($<error_code>)
			ok_eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose enter_friend_num_destroy params = {text_entry = <text_entry>}}
			]
			back_script = enter_friend_num_destroy
			back_params = {text_entry = <text_entry>}
		}
	endif
endscript

script enter_friend_num_destroy 
	destroy_generic_popup
	LaunchEvent Type = unfocus target = <text_entry>
	LaunchEvent \{Type = focus
		target = current_menu}
	initiate_text_entry text_entry = <text_entry>
	ui_enter_friend_num_helpers \{state = Base}
endscript
