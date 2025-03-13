
script ui_create_example_ui_stack_object 
	exampleuistack_getvalues
	exampleuistack_getresult
	printf \{qs(0xcfd285eb)}
	printf qs(0xbc5ab2ce) s = <a>
	printf qs(0xcbc4603e) s = <b>
	printf qs(0xe23a280d) s = <result>
	uistack_createboundscreenelement \{parent = root_window
		id = test_ui_element
		type = descinterface
		desc = 'example_ui_stack_object'
		title_text = qs(0x501f4726)
		event_handlers = [
			{
				pad_btn_top
				example_ui_stack_object_up
			}
			{
				pad_btn_left
				example_ui_stack_object_down
			}
			{
				pad_l1
				example_ui_stack_object_l1
			}
			{
				pad_choose
				ui_event
				params = {
					event = menu_change
					data = {
						state = uistate_test_ui_state_a
					}
				}
			}
			{
				pad_back
				ui_event
				params = {
					event = menu_back
				}
			}
		]}
	obj_getid
	attachcomponentobserver {
		input = {
			object = <objid>
			source = exampleuistack_a
		}
		output = {
			type = seinttostring
			desc_id = <id>
			property = a_data_text
		}
	}
	attachcomponentobserver {
		input = {
			object = <objid>
			source = exampleuistack_b
		}
		output = {
			type = seinttostring
			desc_id = <id>
			property = b_data_text
		}
	}
	attachcomponentobserver {
		input = {
			object = <objid>
			source = exampleuistack_result
		}
		output = {
			type = seinttostring
			desc_id = <id>
			property = result_data_text
		}
	}
	attachcomponentobserver {
		input = {
			object = <objid>
			source = exampleuistack_int_time
		}
		output = {
			type = seinttostring
			desc_id = <id>
			property = time_data_text
		}
	}
	attachcomponentobserver {
		input = {
			object = <objid>
			source = exampleuistack_time
		}
		output = {
			type = descpropertyfloat
			desc_id = <id>
			property = fast_hand_rot_angle
			value_range = [0.0 6.0]
			range = [0.0 360.0]
			wrap = true
		}
	}
	attachcomponentobserver {
		input = {
			object = <objid>
			source = exampleuistack_time
		}
		output = {
			type = descpropertyfloat
			desc_id = <id>
			property = slow_hand_rot_angle
			value_range = [0.0 60.0]
			range = [0.0 360.0]
			wrap = true
		}
	}
	assignalias id = <id> alias = current_menu
	wait \{1
		second}
	test_ui_element :obj_spawnscriptnow \{test_ui_element_modulate_color}
	uistack_spawnboundscriptnow \{example_ui_stack_object_spawned_and_cleaned_up_on_destruction}
	obj_killspawnedscript \{name = example_ui_stack_object_spawned_and_cleaned_up_on_deinit}
	obj_spawnscriptnow \{example_ui_stack_object_spawned_and_cleaned_up_on_deinit}
	add_user_control_helper \{text = qs(0x3d573b17)
		button = green}
	add_user_control_helper \{text = qs(0x9d57d378)
		button = red}
	add_user_control_helper \{text = qs(0x65621062)
		button = blue}
	add_user_control_helper \{text = qs(0x4e4f43a1)
		button = yellow}
	add_user_control_helper \{text = qs(0x9ba8b05b)
		button = lb}
endscript

script test_ui_element_modulate_color 
	desc_resolvealias \{name = alias_title}
	begin
	<resolved_id> :se_setprops rgba = blue_md time = 1
	wait \{1
		seconds}
	<resolved_id> :se_setprops rgba = green_dk time = 1
	wait \{1
		seconds}
	repeat
endscript

script example_ui_stack_object_spawned_and_cleaned_up_on_destruction 
	begin
	printf \{qs(0xc534dc1f)}
	wait \{3
		seconds}
	repeat
endscript

script example_ui_stack_object_spawned_and_cleaned_up_on_deinit 
	begin
	printf \{qs(0x98e2ee2a)}
	wait \{3
		seconds}
	repeat
endscript

script ui_destroy_example_ui_stack_object 
	clean_up_user_control_helpers
endscript

script example_ui_stack_object_up 
	se_getstackobjectid
	<stack_obj_id> :exampleuistack_getvalues
	<stack_obj_id> :exampleuistack_setvalues a = (<a> + 1) b = <b>
endscript

script example_ui_stack_object_down 
	se_getstackobjectid
	<stack_obj_id> :exampleuistack_getvalues
	<stack_obj_id> :exampleuistack_setvalues a = <a> b = (<b> + 1)
endscript

script example_ui_stack_object_l1 
	if screenelementexists \{id = test_element_created_in_pad_event}
		destroyscreenelement \{id = test_element_created_in_pad_event}
	endif
	se_getstackobjectid
	<stack_obj_id> :uistack_createboundscreenelement {
		parent = root_window
		id = test_element_created_in_pad_event
		type = spriteelement
		pos = (200.0, 300.0)
		dims = (200.0, 200.0)
		rgba = red_dk
	}
	<id> :obj_spawnscript test_element_created_in_pad_event_logic
endscript

script test_element_created_in_pad_event_logic 
	wait \{0.3
		second}
	se_setprops \{alpha = 0
		time = 2}
	wait \{2
		seconds}
	obj_getid
	destroyscreenelement id = <objid>
endscript

script ui_create_test_ui_state_a 
	uistack_createboundscreenelement \{parent = root_window
		id = test_ui_element
		type = textblockelement
		dims = (300.0, 100.0)
		pos = (400.0, 300.0)
		tags = {
			debug_me
		}
		text = qs(0x55346d42)
		font = fontgrid_text_a1
		event_handlers = [
			{
				pad_choose
				ui_event
				params = {
					event = menu_change
					data = {
						state = uistate_test_ui_state_b
						init_variable = special
					}
				}
			}
			{
				pad_back
				ui_event
				params = {
					event = menu_back
				}
			}
		]}
	assignalias id = <id> alias = current_menu
	add_user_control_helper \{text = qs(0x3d573b17)
		button = green}
	add_user_control_helper \{text = qs(0x9d57d378)
		button = red}
endscript

script ui_destroy_test_ui_state_a 
	clean_up_user_control_helpers
endscript

script ui_create_test_ui_state_b 
	uistack_createboundscreenelement \{parent = root_window
		id = test_ui_element
		type = textblockelement
		dims = (300.0, 100.0)
		pos = (400.0, 300.0)
		tags = {
			debug_me
		}
		text = qs(0x7e193e81)
		font = fontgrid_text_a1
		event_handlers = [
			{
				pad_back
				ui_event
				params = {
					event = menu_back
				}
			}
		]}
	assignalias id = <id> alias = current_menu
	add_user_control_helper \{text = qs(0x9d57d378)
		button = red}
endscript

script ui_destroy_test_ui_state_b 
	destroyscreenelement \{id = test_ui_element}
	clean_up_user_control_helpers
endscript
