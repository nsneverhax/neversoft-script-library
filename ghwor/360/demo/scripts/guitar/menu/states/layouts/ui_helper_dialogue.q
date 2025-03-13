
script ui_create_helper_dialogue {
		choose_script = generic_event_back
		back_script = generic_event_back
		font = ($test_menu_font)
		font_rgba = [200 200 200 255]
		text_buffer = (30.0, 35.0)
		text_scale = 0.5
		image_buffer = (0.0, 0.0)
		image_portion = 0.5
		z_priority = 10000
	}
	if screenelementexists \{id = helper_root}
		destroyscreenelement \{id = helper_root}
	endif
	createscreenelement {
		type = containerelement
		id = helper_root
		parent = root_window
		event_handlers = [
			{pad_choose ui_sfx params = {menustate = generic uitype = select}}
			{pad_choose <back_script>}
		]
		just = [center , center]
		z_priority = <z_priority>
	}
	createscreenelement {
		type = descinterface
		parent = <id>
		desc = 'helper_box_bg'
		msg_text = <text>
	}
	clean_up_user_control_helpers
	add_user_control_helper controller = <state_device> text = qs(0x182f0173) button = green z = 100000
	if gotparam \{life}
		spawnscriptnow helper_dialogue_delayed_kill params = {life = <life>}
	endif
endscript

script ui_destroy_helper_dialogue 
	if screenelementexists \{id = helper_root}
		destroyscreenelement \{id = helper_root}
	endif
	if scriptisrunning \{helper_dialogue_delayed_kill}
		killspawnedscript \{name = helper_dialogue_delayed_kill}
	endif
endscript

script ui_init_helper_dialogue 
	change \{generic_menu_block_input = 1}
endscript

script ui_deinit_helper_dialogue 
	change \{generic_menu_block_input = 0}
endscript

script helper_dialogue_delayed_kill 
	wait <life> seconds
	generic_event_back
endscript
