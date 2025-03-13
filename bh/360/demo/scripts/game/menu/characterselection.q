
script make_character_selection_menu {
		pad_back_sound = ui_menu_select_sfx
		pad_back_script = generic_event_back_block
		exclusive_device = ($primary_controller)
	}
	destroy_character_selection_menu
	createscreenelement {
		type = descinterface
		parent = root_window
		desc = 'character_selection'
		id = character_selection
		exclusive_device = <exclusive_device>
	}
	if character_selection :desc_resolvealias \{name = alias_generic_barrel_vmenu}
		<resolved_id> :se_setprops event_handlers = [
			{pad_back <pad_back_script> {<pad_back_params>}}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_up 0x0c5f870a params = {desc_id = character_selection up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_down 0x0c5f870a params = {desc_id = character_selection down}}
		]
		if gotparam \{vmenu_alias}
			assignalias id = <resolved_id> alias = <vmenu_alias>
		endif
	else
		scriptassert \{qs(0x6f360b4a)}
	endif
endscript

script destroy_character_selection_menu 
	destroy_generic_barrel_menu
	if screenelementexists \{id = character_selection}
		destroyscreenelement \{id = character_selection}
	endif
	cleanup_cas_menu_handlers
	clean_up_user_control_helpers
endscript

script add_character_selection_item \{pad_choose_sound = ui_menu_select_sfx
		parent = character_selection}
	random_rot_angle = RandomFloat (-7.0, 7.0)
	if gotparam \{price}
		formattext textname = price_text qs(0xe5814737) p = <price>
		show_price = 1
	endif
	if screenelementexists id = <parent>
		createscreenelement {
			type = descinterface
			parent = <parent>
			desc = 'character_selection_item'
			character_selection_item_bio_text = <bio>
		}
	else
		scriptassert \{qs(0x59e04136)}
	endif
	if gotparam \{additional_focus_params}
		<additional_focus_params> = {<additional_focus_params> id = <id>}
	endif
	if gotparam \{additional_unfocus_params}
		<additional_unfocus_params> = {<additional_unfocus_params> id = <id>}
	endif
	if gotparam \{not_focusable}
		add_generic_barrel_menu_text_item {
			text = <name>
			parent = current_menu
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
			additional_focus_script = <additional_focus_script>
			additional_focus_params = <additional_focus_params>
			additional_unfocus_script = <additional_unfocus_script>
			additional_unfocus_params = <additional_unfocus_params>
			menurow_just = [center center]
			menurow_internal_just = [center center]
			not_focusable
		}
	else
		add_generic_barrel_menu_text_item {
			text = <name>
			parent = current_menu
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
			additional_focus_script = <additional_focus_script>
			additional_focus_params = <additional_focus_params>
			additional_unfocus_script = <additional_unfocus_script>
			additional_unfocus_params = <additional_unfocus_params>
			menurow_just = [center center]
			menurow_internal_just = [center center]
		}
	endif
	<item_container_id> :se_setprops menurow_txt_item_dims = (450.0, 50.0)
	return item_container_id = <item_container_id> selection_item_id = <id>
endscript

script character_selection_focus 
	<id> :se_setprops character_selection_item_text_alpha = 1.0
	if gotparam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script character_selection_unfocus 
	<id> :se_setprops character_selection_item_text_alpha = 0.0
	if gotparam \{additional_unfocus_script}
		<additional_unfocus_script> <additional_unfocus_params>
	endif
endscript
