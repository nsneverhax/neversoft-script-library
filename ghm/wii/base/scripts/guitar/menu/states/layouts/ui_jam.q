
script ui_create_jam 
	Change \{respond_to_signin_changed = 1}
	SpawnScriptNow \{do_jam_loading}
	SpawnScriptNow create_jam_menu params = <...>
endscript

script 0x82cc8bde 
	0xca3b4a95
endscript

script ui_destroy_jam 
	destroy_jam_menu
endscript

script ui_init_jam 
endscript

script ui_deinit_jam 
	destroy_band
	destroy_bandname_viewport
	0xc1c4e84c \{mode = FrontEnd
		0xd607e2e6 = 1}
	Skate8_SFX_Backgrounds_New_Area \{immediate = 1
		BG_SFX_Area = frontend_menu_music}
	KillCamAnim \{Name = jam_view_cam}
	Change \{jam_view_cam_created = 0}
	Change \{bass_kit_mode = 0}
	jamsession_unload \{song_prefix = 'editable'}
	clearjamsession
	jam_clear_clipboards
	formatText \{checksumName = undo_clipboard_array
		'undo_clipboard'}
	if GlobalExists Name = <undo_clipboard_array> Type = array
		printf \{channel = jam_mode
			qs(0xfed3c437)}
		destroyscriptarray Name = <undo_clipboard_array>
	endif
	deinit_jam_audio
	Change \{cas_override_object = None}
endscript

script deinit_jam_audio 
	destroysoundbusseffects \{jammode_rhythmguitar = [
			all
		]
		jammode_leadguitar = [
			all
		]}
	StopSoundsByBuss \{guitar_jammode}
	StopSoundsByBuss \{drums_jammode}
	StopSoundsByBuss \{bass_jammode}
	StopSoundsByBuss \{jammode_vox}
	jam_deinit_reverb
	if NOT GotParam \{keep_drumkit}
		unloaddrumkitall
	endif
	unloadmelodykit
	unloadbasskit
endscript
