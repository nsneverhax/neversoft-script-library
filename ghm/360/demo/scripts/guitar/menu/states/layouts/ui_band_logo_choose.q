
script ui_create_band_logo_choose 
	change \{rich_presence_context = presence_band_logo_edit_and_instrument_edit}
	pad_back_script = nullscript
	menu_create_script = make_generic_menu
	item_add_script = add_generic_menu_text_item
	if ui_event_exists_in_stack \{name = 'mainmenu'}
		pad_back_script = generic_event_back
	endif
	cam_name = 'options_manage_band_logo'
	<menu_create_script> {
		title = qs(0xf508391c)
		item_scale = 1.3
		pad_back_script = <pad_back_script>
	}
	<item_add_script> {
		text = qs(0x494b4d7f)
		pad_choose_script = band_logo_choose_continue
		pad_choose_params = {event_params = <event_params>}
	}
	get_savegame_from_controller controller = ($primary_controller)
	<item_add_script> {
		text = qs(0x65b8a528)
		choose_state = uistate_cap_main
		choose_state_data = {savegame = <savegame> text = qs(0x9a6bb96f) part = cas_band_logo cam_name = <cam_name> num_icons = 0}
	}
	<item_add_script> {
		text = qs(0xaad48d9e)
		pad_choose_script = randomize_band_logo
	}
	if NOT gotparam \{pad_back_script}
		menu_finish
	else
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
	endif
endscript

script ui_destroy_band_logo_choose 
	generic_ui_destroy
	destroy_generic_menu
endscript

script ui_init_band_logo_choose controller = ($primary_controller)
	init_band_logo controller = <controller>
	fadetoblack \{off
		alpha = 1.0
		time = 0.1
		z_priority = 100
		no_wait}
	spawnscriptnow \{task_menu_default_anim_in
		params = {
			base_name = 'options_manage_band_logo'
		}}
	bandlogoobject :obj_setposition \{position = (-33.45, -1.42, 21.9)}
	bandlogoobject :obj_setorientation \{dir = (0.0, 0.0, -1.0)}
	bandlogoobject :switchonatomic \{cas_band_logo}
	bandlogoobject :obj_applyscaling \{scale = 1.0}
	spawnscript \{randomize_band_logo}
endscript

script ui_deinit_band_logo_choose 
	change \{cas_override_object = none}
	bandlogoobject :switchoffatomic \{cas_band_logo}
	cas_free_resources \{no_bink
		no_loading_screen
		band_logo}
endscript

script randomize_band_logo 
	if gotparam \{name_logo}
		soundevent \{event = enter_band_name_caps}
	endif
	change \{save_data_dirty = 1}
	cas_random_band_logo
	setcasappearancecap part = cas_band_logo cap = <cap>
	cas_queue_block
	updatecasmodelcap \{part = cas_band_logo}
	change \{achievements_modified_logo = 0}
endscript

script band_logo_choose_continue 
	getcasappearancepart \{part = cas_band_logo}
	if gotparam \{cap}
		get_savegame_from_controller controller = <device_num>
		get_current_band_info
		setglobaltags savegame = <savegame> <band_info> params = {band_logo = <cap>}
	endif
	ui_memcard_autosave_replace event = menu_replace state = uistate_boot_download_scan data = {controller = <device_num>}
endscript

script current_band_has_band_logo controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	getglobaltags savegame = <savegame> <band_info>
	if gotparam \{band_logo}
		return \{true}
	else
		return \{false}
	endif
endscript

script current_band_has_band_name controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	getglobaltags savegame = <savegame> <band_info>
	if gotparam \{name}
		if (<name> = qs(0x03ac90f0))
			return \{false}
		else
			return \{true}
		endif
	else
		return \{false}
	endif
endscript

script current_band_save_created controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	getglobaltags savegame = <savegame> <band_info>
	if gotparam \{save_created}
		if (<save_created> = 0)
			return \{false}
		else
			return \{true}
		endif
	else
		return \{false}
	endif
endscript
