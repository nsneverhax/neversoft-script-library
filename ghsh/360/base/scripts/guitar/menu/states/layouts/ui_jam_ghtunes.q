
script ui_create_jam_ghtunes 
	SpawnScriptNow create_jam_ghtunes_menu params = <...>
endscript

script ui_destroy_jam_ghtunes 
	destroy_jam_ghtunes_menu
endscript

script ui_deinit_jam_ghtunes 
	Change \{jam_ghtunes_last_search_text = qs(0x00000000)}
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{Name = song_preview_update_playbar}
	if ScreenElementExists \{id = ghtunes_terms_dialog_box}
		DestroyScreenElement \{id = ghtunes_terms_dialog_box}
	endif
	if ScreenElementExists \{id = song_preview_element}
		DestroyScreenElement \{id = song_preview_element}
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
