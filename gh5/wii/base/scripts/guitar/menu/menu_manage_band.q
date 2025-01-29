manage_band_menu_font = fontgrid_text_a1

script menu_manage_band_rename_band 
	generic_event_choose \{state = uistate_band_name_enter
		data = {
			from_options = 1
		}}
endscript

script menu_manage_band_delete_band 
	ScriptAssert \{'menu_manage_band_delete_band: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_manage_band_edit_logo_focus 
	SpawnScriptNow \{task_menu_default_anim_in
		params = {
			base_name = 'options_manage_band_logo'
		}}
endscript

script menu_manage_band_edit_logo_unfocus 
	SpawnScriptNow \{task_menu_default_anim_in
		params = {
			base_name = 'character_hub'
		}}
endscript
