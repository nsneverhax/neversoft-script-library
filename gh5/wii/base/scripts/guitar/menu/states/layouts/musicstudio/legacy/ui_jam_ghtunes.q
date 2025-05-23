
script ui_init_jam_ghtunes 
	set_home_button_notallowed
endscript

script ui_create_jam_ghtunes 
	set_home_button_notallowed
	SpawnScriptNow create_jam_ghtunes_menu params = <...>
endscript

script ui_destroy_jam_ghtunes 
	destroy_jam_ghtunes_menu
endscript

script ui_deinit_jam_ghtunes 
	set_home_button_allowed
	Change \{jam_ghtunes_last_search_text = qs(0x00000000)}
	stop_custom_song
	KillSpawnedScript \{Name = song_preview_update_playbar}
	if ScreenElementExists \{id = ghtunes_terms_dialog_box}
		DestroyScreenElement \{id = ghtunes_terms_dialog_box}
	endif
	if ScreenElementExists \{id = song_preview_element}
		DestroyScreenElement \{id = song_preview_element}
	endif
	Change \{jam_view_cam_created = 0}
	jamsession_unload \{song_prefix = 'editable'}
	clearcustomsong
endscript

script ui_return_jam_ghtunes 
	if (<old_base_name> = 'generic_dialog_box')
		set_focus_color \{Color = white220}
		set_unfocus_color \{Color = grey64}
		clean_up_user_control_helpers
		musicsudio_text_entry_helper_text_linear_flow
	endif
endscript
