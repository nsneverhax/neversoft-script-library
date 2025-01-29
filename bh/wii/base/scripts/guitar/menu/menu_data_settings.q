data_settings_menu_font = fontgrid_text_a1

script create_data_settings_menu 
	ScriptAssert \{'create_data_settings_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_data_settings_menu \{Destroy = 1}
	ScriptAssert \{'destroy_data_settings_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
data_settings_hilite_pos = {
	save = (630.0, 141.0)
	load = (630.0, 180.0)
	auto = (630.0, 225.0)
}

script menu_data_settings_choosedevice_focus 
	ScriptAssert \{'menu_data_settings_choosedevice_focus: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_data_settings_choosedevice_unfocus 
	ScriptAssert \{'menu_data_settings_choosedevice_unfocus: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_data_settings_overwrite_focus 
	ScriptAssert \{'menu_data_settings_overwrite_focus: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_data_settings_overwrite_unfocus 
	ScriptAssert \{'menu_data_settings_overwrite_unfocus: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_data_settings_cancel_focus 
	ScriptAssert \{'menu_data_settings_cancel_focus: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_data_settings_cancel_unfocus 
	ScriptAssert \{'menu_data_settings_cancel_unfocus: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_data_settings_savegame_focus 
	retail_menu_focus \{id = ds_savegame}
	if ScreenElementExists \{id = ds_savegame}
		ds_savegame :se_setprops \{no_shadow}
	endif
	if ScreenElementExists \{id = ds_hilite}
		ds_hilite :legacydomorph Pos = ($data_settings_hilite_pos.save) time = 0.05
	endif
endscript

script menu_data_settings_savegame_unfocus 
	retail_menu_unfocus \{id = ds_savegame}
	if ScreenElementExists \{id = ds_savegame}
		ds_savegame :se_setprops \{Shadow
			shadow_rgba = [
				175
				175
				150
				255
			]
			shadow_offs = (5.0, 5.0)}
	endif
endscript

script menu_data_settings_loadgame_focus 
	retail_menu_focus \{id = ds_loadgame}
	if ScreenElementExists \{id = ds_loadgame}
		ds_loadgame :se_setprops \{no_shadow}
	endif
	if ScreenElementExists \{id = ds_hilite}
		ds_hilite :legacydomorph Pos = ($data_settings_hilite_pos.load) time = 0.05
	endif
endscript

script menu_data_settings_loadgame_unfocus 
	retail_menu_unfocus \{id = ds_loadgame}
	if ScreenElementExists \{id = ds_loadgame}
		ds_loadgame :se_setprops \{Shadow
			shadow_rgba = [
				175
				175
				150
				255
			]
			shadow_offs = (5.0, 5.0)}
	endif
endscript

script menu_data_settings_autosave_focus 
	retail_menu_focus \{id = ds_autosave}
	if ScreenElementExists \{id = ds_autosave}
		ds_autosave :se_setprops \{no_shadow}
	endif
	if ScreenElementExists \{id = ds_hilite}
		ds_hilite :legacydomorph Pos = ($data_settings_hilite_pos.auto) time = 0.05
	endif
endscript

script menu_data_settings_autosave_unfocus 
	retail_menu_unfocus \{id = ds_autosave}
	if ScreenElementExists \{id = ds_autosave}
		ds_autosave :se_setprops \{Shadow
			shadow_rgba = [
				175
				175
				150
				255
			]
			shadow_offs = (5.0, 5.0)}
	endif
endscript

script menu_data_settings_select_save_game 
	ui_memcard_save \{event = menu_back}
endscript

script menu_data_settings_select_load_game 
	ui_memcard_load \{event = menu_back}
endscript

script menu_data_settings_toggle_autosave \{time = 0.075}
	memcard_check_for_existing_save
	if (<found> = 0)
		wii_memcard_check_for_space
		if (<nospace> = 1)
			open_insufficient_space_dialog \{fsblocks = 3}
			return
		elseif (<noinode> = 1)
			open_insufficient_inodes_dialog
			return
		endif
	endif
	if (<found> = 1)
		SetSaveFileName filetype = progress Name = ($memcard_file_types [$progressfiletypeindex].file_name)
		if issavecorrupt \{filetype = progress}
			open_corrupt_save_dialog
			return
		endif
	endif
	GetGlobalTags \{user_options}
	if (<autosave> = 1)
		SoundEvent \{event = Generic_Menu_Back_SFX}
		<autosave> = 0
		if ScreenElementExists \{id = ds_autosave_tex}
			ds_autosave_tex :legacydomorph alpha = 0 time = <time>
			SetScreenElementProps \{id = ds_autosave_tex
				texture = data_settings_xmark}
			ds_autosave_tex :legacydomorph alpha = 1 time = <time>
		endif
	else
		SoundEvent \{event = ui_sfx_select}
		<autosave> = 1
		if ScreenElementExists \{id = ds_autosave_tex}
			ds_autosave_tex :legacydomorph alpha = 0 time = <time>
			SetScreenElementProps \{id = ds_autosave_tex
				texture = data_settings_checkmark}
			ds_autosave_tex :legacydomorph alpha = 1 time = <time>
		endif
	endif
	SetGlobalTags user_options params = {autosave = <autosave>}
endscript
