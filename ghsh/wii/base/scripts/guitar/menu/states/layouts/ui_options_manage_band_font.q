
script ui_create_options_manage_band_font 
	make_generic_menu {
		parent = <container_id>
		vmenu_id = create_options_manage_band_font_vmenu
		title = qs(0x1521f36e)
	}
	get_current_band_info
	GetGlobalTags <band_info>
	if NOT GotParam \{font}
		font = fontgrid_text_a3
	endif
	GetArraySize ($car_font_list)
	i = 0
	begin
	formatText checksumName = current_font '%j' j = ((($car_font_list) [<i>]).font)
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
	repeat <array_Size>
	clean_up_user_control_helpers
	menu_finish \{car_helper_text_cancel
		no_rotate_zoom_text}
	LaunchEvent Type = focus target = create_options_manage_band_font_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_options_manage_band_font 
	destroy_generic_menu
endscript

script ui_init_options_manage_band_font 
	bandlogoobject :Obj_ApplyScaling \{Scale = 0.0}
	Name = qs(0x03ac90f0)
	get_current_band_info
	GetGlobalTags <band_info>
	if NOT GotParam \{font}
		font = fontgrid_text_a3
	endif
	CreateScreenElement {
		parent = root_window
		Type = TextBlockElement
		id = demo_band_font
		text = <Name>
		font = <font>
		rgba = [75 75 75 255]
		dims = (450.0, 100.0)
		Pos = (775.0, 350.0)
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
	}
endscript

script ui_deinit_options_manage_band_font 
	bandlogoobject :Obj_ApplyScaling \{Scale = 1.0}
	DestroyScreenElement \{id = demo_band_font}
endscript

script manage_band_set_font 
	get_current_band_info
	formatText checksumName = font '%j' j = <font>
	SetGlobalTags <band_info> params = {font = <font>}
	generic_event_back
endscript

script change_demo_font_on_focus 
	formatText checksumName = font '%j' j = <font>
	demo_band_font :se_setprops font = <font>
endscript

script debug_dump_current_band_font 
	fontgrid_text_a3
	GetGlobalTags <band_info> param = font
	printstruct <...>
endscript
