
script ui_create_options_manage_band_font 
	make_generic_menu {
		parent = <container_id>
		vmenu_id = create_options_manage_band_font_vmenu
		title = qs(0x1521f36e)
	}
	get_current_band_info
	getglobaltags <band_info>
	if NOT gotparam \{font}
		font = fontgrid_text_a6
	endif
	getarraysize ($car_font_list)
	i = 0
	begin
	formattext checksumname = current_font '%j' j = ((($car_font_list) [<i>]).font)
	if (<font> = <current_font>)
		selected_index = <i>
	endif
	add_generic_menu_icon_item {
		text = ((($car_font_list) [<i>]).frontend_desc)
		icon = ((($car_font_list) [<i>]).icon)
		pad_choose_script = manage_band_set_font
		pad_choose_params = {font = ((($car_font_list) [<i>]).font)}
		additional_focus_script = change_demo_font_on_focus
		additional_focus_params = {font = ((($car_font_list) [<i>]).font)}
	}
	i = (<i> + 1)
	repeat <array_size>
	clean_up_user_control_helpers
	menu_finish \{car_helper_text_cancel
		no_rotate_zoom_text}
	launchevent type = focus target = create_options_manage_band_font_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_options_manage_band_font 
	destroy_generic_menu
endscript

script ui_init_options_manage_band_font 
	bandlogoobject :obj_applyscaling \{scale = 0.0}
	name = qs(0x03ac90f0)
	get_current_band_info
	getglobaltags <band_info>
	if NOT gotparam \{font}
		font = fontgrid_text_a6
	endif
	createscreenelement {
		parent = root_window
		type = textblockelement
		id = demo_band_font
		text = <name>
		font = <font>
		rgba = [75 75 75 255]
		dims = (450.0, 100.0)
		pos = (775.0, 350.0)
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
	}
endscript

script ui_deinit_options_manage_band_font 
	bandlogoobject :obj_applyscaling \{scale = 1.0}
	destroyscreenelement \{id = demo_band_font}
endscript

script manage_band_set_font 
	get_current_band_info
	formattext checksumname = font '%j' j = <font>
	setglobaltags <band_info> params = {font = <font>}
	generic_event_back
endscript

script change_demo_font_on_focus 
	formattext checksumname = font '%j' j = <font>
	demo_band_font :se_setprops font = <font>
endscript

script debug_dump_current_band_font 
	fontgrid_text_a6
	getglobaltags <band_info> param = font
	printstruct <...>
endscript
