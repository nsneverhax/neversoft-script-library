
script ui_create_tutorial_gameplay 
	if GotParam \{gameplay_complete}
		tutorial_system_get_page {
			tutorial_header = ($current_tutorial_header)
			tutorial_id = ($current_tutorial_id)
			lesson_id = ($current_tutorial_lesson)
			page_id = ($current_tutorial_page)
		}
		tutorial_gameplay_section_complete page_struct = <page_struct>
	endif
	if NOT GotParam \{return_from_gameplay}
		tutorial_system_create_description page_struct = <page_struct>
		Change \{disable_crowd = 1}
		<desc_id> :Obj_SpawnScriptNow ui_create_tutorial_gameplay_spawned params = {<...>}
	endif
endscript

script ui_create_tutorial_gameplay_spawned 
	tutorial_system_start_gameplay song = (<page_struct>.song) part = <part>
endscript

script tutorial_gameplay_section_complete 
	RequireParams \{[
			page_struct
		]
		all}
	tutorial_system_disable_pause
	tutorial_system_destroy_description
	if ScreenElementExists \{id = tutorial_main}
		tutorial_main :se_setprops \{tutorial_instructions_text = qs(0x03ac90f0)}
		LaunchEvent \{Type = unfocus
			target = tutorial_main}
	endif
	make_generic_menu \{vmenu_id = lesson_complete_vmenu
		desc = 'generic_tutorial_popup'
		z_priority = 50
		pad_back_script = nullscript}
	generic_menu :se_setprops \{challenge_instrument_alpha = 0.0}
	generic_menu :se_setprops \{title_text = qs(0x5f444985)}
	generic_menu :se_setprops \{description_text = qs(0x73683e7d)}
	add_generic_tutorial_menu_text_item {
		text = qs(0x494b4d7f)
		pad_choose_script = tutorial_gameplay_continue_next_page
		pad_choose_params = {page_struct = <page_struct>}
	}
	add_generic_tutorial_menu_text_item {
		text = qs(0xd1eb701c)
		pad_choose_script = tutorial_gameplay_replay_page
		pad_choose_params = {page_struct = <page_struct>}
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		all_buttons}
	LaunchEvent \{Type = focus
		target = lesson_complete_vmenu}
endscript

script tutorial_gameplay_continue_next_page 
	RequireParams \{[
			page_struct
		]
		all}
	generic_menu_pad_choose_sound
	tutorial_system_page_complete page_struct = <page_struct>
	clean_up_user_control_helpers
	destroy_generic_menu
endscript

script tutorial_gameplay_replay_page 
	RequireParams \{[
			page_struct
		]
		all}
	generic_menu_pad_choose_sound
	tutorial_system_page_complete page_struct = <page_struct> retry_page
	clean_up_user_control_helpers
	destroy_generic_menu
endscript

script ui_destroy_tutorial_gameplay 
endscript

script ui_init_tutorial_gameplay 
	tutorial_system_disable_pause
endscript

script ui_deinit_tutorial_gameplay 
	Change \{disable_crowd = 0}
	destroy_generic_menu
	tutorial_system_disable_pause
	tutorial_system_destroy_description
endscript
