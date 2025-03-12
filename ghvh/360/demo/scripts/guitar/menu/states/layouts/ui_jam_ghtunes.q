
script ui_create_jam_ghtunes 
	spawnscriptnow create_jam_ghtunes_menu params = <...>
endscript

script ui_destroy_jam_ghtunes 
	destroy_jam_ghtunes_menu
endscript

script ui_deinit_jam_ghtunes 
	change \{jam_ghtunes_last_search_text = qs(0x00000000)}
	killspawnedscript \{name = guitar_jam_playback_recording}
	killspawnedscript \{name = guitar_jam_drum_playback}
	killspawnedscript \{name = song_preview_update_playbar}
	if screenelementexists \{id = ghtunes_terms_dialog_box}
		destroyscreenelement \{id = ghtunes_terms_dialog_box}
	endif
	if screenelementexists \{id = song_preview_element}
		destroyscreenelement \{id = song_preview_element}
	endif
	jamsession_unload \{song_prefix = 'editable'}
	clearjamsession
endscript

script ui_return_jam_ghtunes 
	if (<old_base_name> = 'generic_alert_popup')
		set_focus_color \{rgba = [
				220
				220
				220
				255
			]}
		set_unfocus_color \{rgba = [
				64
				64
				64
				255
			]}
		clean_up_user_control_helpers
		ui_cas_text_entry_helper_text
	endif
endscript
