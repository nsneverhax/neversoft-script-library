
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
	char_select_physics_elements \{screen_id = character_selection_id}
	if character_selection :desc_resolvealias \{name = alias_character_selection_window
			param = character_selection_parent}
		menu_pos = (0.0, 0.0)
		make_generic_barrel_menu {
			centered = 1
			pos = <menu_pos>
			max_expansion = 5
			scale = 0.8
			pad_back_script = <pad_back_script>
			pad_back_params = <pad_back_params>
		}
		assignalias id = <vmenu_id> alias = current_menu
		if gotparam \{vmenu_alias}
			assignalias id = <vmenu_id> alias = <vmenu_alias>
		endif
	else
		scriptassert \{qs(0x6f360b4a)}
	endif
	if character_selection :desc_resolvealias \{name = alias_character_selection_window
			param = character_selection_window}
		setscreenelementprops id = <character_selection_window> allow_child_rotate = true
		assignalias id = <character_selection_window> alias = character_selection_bio_window
	else
		scriptassert \{qs(0x662db52a)}
	endif
endscript

script char_select_physics_elements 
	requireparams \{[
			screen_id
		]
		all}
	create_2d_spring_system \{desc_id = character_selection
		num_springs = 2
		stiffness = 50
		rest_length = 1}
	if character_selection :desc_resolvealias \{name = alias_skull_add_container
			param = skull_add_id}
		<skull_add_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'pdetrich'}
	endif
	if character_selection :desc_resolvealias \{name = alias_skull_add_container
			param = skull_add_id}
		<skull_add_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'pdetrich'}
	endif
	if character_selection :desc_resolvealias \{name = alias_car_title_banner
			param = anim2_id}
		<anim2_id> :obj_spawnscript ui_shakeytime params = {pos = (-286.0, 200.0)}
	else
		scriptassert \{'UI_art'}
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
		parent = character_selection_bio_window}
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
			dims = (64.0, 64.0)
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
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
			additional_focus_script = <additional_focus_script>
			additional_focus_params = <additional_focus_params>
			additional_unfocus_script = <additional_unfocus_script>
			additional_unfocus_params = <additional_unfocus_params>
			not_focusable
		}
	else
		add_generic_barrel_menu_text_item {
			text = <name>
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
			additional_focus_script = <additional_focus_script>
			additional_focus_params = <additional_focus_params>
			additional_unfocus_script = <additional_unfocus_script>
			additional_unfocus_params = <additional_unfocus_params>
		}
	endif
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
