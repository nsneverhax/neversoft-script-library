manage_band_menu_font = fontgrid_text_a8

script menu_manage_band_rename_band 
	generic_event_choose \{state = uistate_band_name_enter
		data = {
			from_options = 1
		}}
endscript

script menu_manage_band_delete_band 
	generic_event_choose \{state = uistate_options_delete_band}
endscript

script menu_manage_band_edit_logo_focus 
	spawnscriptnow \{task_menu_default_anim_in
		params = {
			base_name = 'options_manage_band_logo'
		}}
endscript

script menu_manage_band_edit_logo_unfocus 
	spawnscriptnow \{task_menu_default_anim_in
		params = {
			base_name = 'character_hub'
		}}
endscript
