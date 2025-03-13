
script ui_create_jam_ghtunes 
	change \{rich_presence_context = presence_ghtracks}
	spawnscriptnow create_jam_ghtunes_menu params = <...>
endscript

script ui_destroy_jam_ghtunes 
	killspawnedscript \{name = create_jam_ghtunes_menu}
	destroy_jam_ghtunes_menu
endscript

script ui_deinit_jam_ghtunes 
	change \{jam_ghtunes_last_search_text = qs(0x00000000)}
	stop_custom_song
	killspawnedscript \{name = song_preview_update_playbar}
	if screenelementexists \{id = ghtunes_terms_dialog_box}
		destroyscreenelement \{id = ghtunes_terms_dialog_box}
	endif
	if screenelementexists \{id = song_preview_element}
		destroyscreenelement \{id = song_preview_element}
	endif
	jamsession_unload \{song_prefix = 'editable'}
	clearcustomsong
endscript

script ui_return_jam_ghtunes 
	if (<old_base_name> = 'generic_dialog_box')
		set_focus_color \{color = white220}
		set_unfocus_color \{color = grey64}
		clean_up_user_control_helpers
		musicsudio_text_entry_helper_text_linear_flow
	endif
endscript
