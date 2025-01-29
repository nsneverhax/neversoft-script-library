
script ui_create_jam_ghtunes 
	Change \{is_network_game = 1}
	SpawnScriptNow create_jam_ghtunes_menu params = <...>
endscript

script ui_destroy_jam_ghtunes 
	Change \{is_network_game = 0}
	destroy_popup_warning_menu
	KillSpawnedScript \{Name = create_song_preview_menu}
	KillSpawnedScript \{id = ghtunes_spawns}
	KillSpawnedScript \{Name = ghtunes_signin_check}
	KillSpawnedScript \{Name = ghtunes_animate_spinning_record}
	KillSpawnedScript \{Name = ghtunes_update_loading_text}
	KillSpawnedScript \{Name = ghtunes_animate_5stars}
	KillSpawnedScript \{Name = ghtunes_add_leaderboard_screen}
	KillSpawnedScript \{Name = ghtunes_create_genre_menu}
	KillSpawnedScript \{Name = ghtunes_string_search}
	KillSpawnedScript \{Name = ghtunes_create_alphasearch_menu}
	KillSpawnedScript \{Name = ghtunes_add_header}
	KillSpawnedScript \{Name = ghtunes_spam_lock}
	KillSpawnedScript \{Name = ghtunes_remove_header}
	KillSpawnedScript \{Name = ghtunes_add_watermark}
	KillSpawnedScript \{Name = ghtunes_remove_watermark}
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{Name = song_preview_update_playbar}
	destroy_jam_ghtunes_menu
endscript

script ui_init_jam_ghtunes 
	set_home_button_notallowed
endscript

script ui_deinit_jam_ghtunes 
	KillSpawnedScript \{Name = create_jam_ghtunes_menu}
	if IsLoggedIn
		0xd7b863a3
	endif
	destroy_popup_warning_menu
	Change \{jam_ghtunes_last_search_text = qs(0x00000000)}
	KillSpawnedScript \{Name = create_song_preview_menu}
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{Name = song_preview_update_playbar}
	KillSpawnedScript \{id = ghtunes_spawns}
	KillSpawnedScript \{Name = ghtunes_signin_check}
	KillSpawnedScript \{Name = ghtunes_animate_spinning_record}
	KillSpawnedScript \{Name = ghtunes_update_loading_text}
	KillSpawnedScript \{Name = ghtunes_animate_5stars}
	KillSpawnedScript \{Name = ghtunes_add_leaderboard_screen}
	KillSpawnedScript \{Name = ghtunes_create_genre_menu}
	KillSpawnedScript \{Name = ghtunes_string_search}
	KillSpawnedScript \{Name = ghtunes_create_alphasearch_menu}
	KillSpawnedScript \{Name = ghtunes_add_header}
	KillSpawnedScript \{Name = ghtunes_spam_lock}
	KillSpawnedScript \{Name = ghtunes_remove_header}
	KillSpawnedScript \{Name = ghtunes_add_watermark}
	KillSpawnedScript \{Name = ghtunes_remove_watermark}
	KillSpawnedScript \{Name = getjamusercontentstats_callback}
	KillSpawnedScript \{Name = getjamusercontentstats_failed_callback}
	KillSpawnedScript \{Name = getjamtopartiststats_callback}
	KillSpawnedScript \{Name = jamusercanupload_callback}
	KillSpawnedScript \{Name = jamusercanupload_callback_failed}
	KillSpawnedScript \{Name = jamupdatetermsofuse_callback}
	KillSpawnedScript \{Name = jamupdatetermsofuse_failed_callback}
	KillSpawnedScript \{Name = jamupdatesubmissionagreement_callback}
	KillSpawnedScript \{Name = jamupdatesubmissionagreement_failed_callback}
	if ScreenElementExists \{id = ghtunes_terms_dialog_box}
		DestroyScreenElement \{id = ghtunes_terms_dialog_box}
	endif
	if ScreenElementExists \{id = song_preview_element}
		DestroyScreenElement \{id = song_preview_element}
	endif
	jamsession_unload \{song_prefix = 'editable'}
	clearjamsession
	set_home_button_allowed
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
