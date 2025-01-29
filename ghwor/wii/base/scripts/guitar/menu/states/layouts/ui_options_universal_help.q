
script ui_create_options_universal_help 
	<help_tag_checksum> = universal_help_display
	get_savegame_from_controller controller = ($primary_controller)
	GetGlobalTags user_options savegame = <savegame> param = <help_tag_checksum>
	uistack_createboundscreenelement {
		parent = root_window
		id = options_help_menu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{pad_back options_universal_help_back}
		]
		exclusive_device = ($primary_controller)
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0x971751d9)
	}
	mainmenu_setup_physics_elements \{screen_id = options_help_menu_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = options_help_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = options_help_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = options_help_menu_id
		}}
	<normal_icon> = Options_Controller_X
	<always_on_icon> = Options_Controller_X
	<always_off_icon> = Options_Controller_X
	<index_to_focus> = 0
	switch (<...>.<help_tag_checksum>)
		case Normal
		<normal_icon> = Options_Controller_Check
		<index_to_focus> = 0
		case always_on
		<always_on_icon> = Options_Controller_Check
		<index_to_focus> = 1
		case always_off
		<always_off_icon> = Options_Controller_Check
		<index_to_focus> = 2
		default
		ScriptAssert \{'Invalid universal help global display tag option'}
	endswitch
	mainmenu_setup_option {
		choose_script = ui_options_universal_help_choose
		choose_params = {
			value = Normal
			current_help_tag = (<...>.<help_tag_checksum>)
			savegame = <savegame>
			help_tag_checksum = <help_tag_checksum>
		}
		back_script = options_universal_help_back
		menu_item_text = qs(0xe968d30b)
		screen_id = options_help_menu_id
		icon = <normal_icon>
	}
	mainmenu_setup_option {
		choose_script = ui_options_universal_help_choose
		choose_params = {
			value = always_on
			current_help_tag = (<...>.<help_tag_checksum>)
			savegame = <savegame>
			help_tag_checksum = <help_tag_checksum>
		}
		back_script = options_universal_help_back
		menu_item_text = qs(0x99ee3fb2)
		screen_id = options_help_menu_id
		icon = <always_on_icon>
	}
	mainmenu_setup_option {
		choose_script = ui_options_universal_help_choose
		choose_params = {
			value = always_off
			current_help_tag = (<...>.<help_tag_checksum>)
			savegame = <savegame>
			help_tag_checksum = <help_tag_checksum>
		}
		back_script = options_universal_help_back
		menu_item_text = qs(0x0302b885)
		screen_id = options_help_menu_id
		icon = <always_off_icon>
	}
	ui_options_set_settings
	main_menu_finalize
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_options_universal_help 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = options_help_menu_id}
		DestroyScreenElement \{id = options_help_menu_id}
	endif
endscript

script ui_options_universal_help_choose \{value = !q1768515945
		current_help_tag = !q1768515945
		savegame = !i1768515945
		help_tag_checksum = !q1768515945}
	if (<current_help_tag> != <value>)
		AddParam structure_name = universal_help_tag Name = <help_tag_checksum> value = <value>
		SetGlobalTags user_options savegame = <savegame> params = <universal_help_tag>
		ui_memcard_autosave \{event = menu_back
			state = uistate_options_universal_help}
	endif
endscript

script options_universal_help_back 
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back
endscript
