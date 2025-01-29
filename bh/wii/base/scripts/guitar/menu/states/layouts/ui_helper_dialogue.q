helper_on_exit_callback = dont_give_this_name_to_a_script

script ui_create_helper_dialogue {
		choose_script = generic_event_back
		back_script = generic_event_back
		font = ($test_menu_font)
		font_rgba = [200 200 200 255]
		text_buffer = (35.0, 75.0)
		text_scale = 0.5
		image_buffer = (0.0, 0.0)
		image_portion = 0.5
		z_priority = 10000
		on_exit_callback = dont_give_this_name_to_a_script
	}
	if ScreenElementExists \{id = helper_root}
		DestroyScreenElement \{id = helper_root}
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = helper_root
		parent = root_window
		event_handlers = [
			{pad_choose <back_script>}
		]
		just = [center , center]
		z_priority = <z_priority>
	}
	CreateScreenElement {
		Type = descinterface
		parent = <id>
		desc = 'helper_box_bg'
		msg_text = <text>
	}
	clean_up_user_control_helpers
	add_user_control_helper controller = <state_device> text = qs(0x182f0173) button = green z = 100000
	Change helper_on_exit_callback = <on_exit_callback>
	if GotParam \{life}
		SpawnScriptNow helper_dialogue_delayed_kill params = {life = <life>}
	endif
endscript

script ui_destroy_helper_dialogue 
	if ScriptExists ($helper_on_exit_callback)
		OnExitRun ($helper_on_exit_callback)
	endif
	if ScreenElementExists \{id = helper_root}
		DestroyScreenElement \{id = helper_root}
	endif
	if ScriptIsRunning \{helper_dialogue_delayed_kill}
		KillSpawnedScript \{Name = helper_dialogue_delayed_kill}
	endif
endscript

script helper_dialogue_delayed_kill 
	Wait <life> Seconds
	generic_event_back
endscript
