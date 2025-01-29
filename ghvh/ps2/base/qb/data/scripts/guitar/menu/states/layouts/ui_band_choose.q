
script ui_create_band_choose 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	if GotParam \{use_all_controllers}
		make_menu_frontend \{title = qs(0x1c3067d4)
			use_all_controllers
			Pos = (15.0, 40.0)}
	else
		make_menu_frontend \{title = qs(0x1c3067d4)
			Pos = (15.0, 40.0)}
	endif
	<loop_count> = ($num_career_bands)
	band_index = 1
	begin
	band_name = qs(0x1f0c041a)
	get_band_info band_index = <band_index>
	GetGlobalTags <band_info> param = Name
	if NOT (<Name> = qs(0x03ac90f0))
		<band_name> = <Name>
	endif
	add_menu_frontend_item {
		text = <band_name>
		pad_choose_script = menu_choose_band_make_selection
		pad_choose_params = {band_index = <band_index> from_options = <from_options> 0x91dab06d}
	}
	<band_index> = (<band_index> + 1)
	repeat <loop_count>
	menu_finish
	Change menu_flow_locked = ($menu_flow_locked - 1)
	destroy_loading_screen
endscript

script ui_destroy_band_choose 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	generic_ui_destroy
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript
