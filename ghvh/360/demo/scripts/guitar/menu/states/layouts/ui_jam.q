
script ui_create_jam 
	fadetoblack \{off
		time = 0}
	change \{respond_to_signin_changed = 1}
	spawnscriptnow \{do_jam_loading}
	spawnscriptnow create_jam_menu params = <...>
endscript

script ui_destroy_jam 
	destroy_jam_menu
endscript

script ui_init_jam 
endscript

script ui_deinit_jam 
	destroy_band
	destroy_bandname_viewport
	skate8_sfx_backgrounds_new_area \{immediate = 1
		bg_sfx_area = frontend_menu_music}
	killcamanim \{name = jam_view_cam}
	change \{jam_view_cam_created = 0}
	change \{signin_jam_mode = 0}
	change \{bass_kit_mode = 0}
	jamsession_unload \{song_prefix = 'editable'}
	jamsession_unload \{song_prefix = 'jamsession'}
	clearjamsession
	jam_clear_clipboards
	formattext \{checksumname = undo_clipboard_array
		'undo_clipboard'}
	if globalexists name = <undo_clipboard_array> type = array
		printf \{channel = jam_mode
			qs(0xfed3c437)}
		destroyscriptarray name = <undo_clipboard_array>
	endif
	deinit_jam_audio
	change \{cas_override_object = none}
endscript

script deinit_jam_audio 
	destroysoundbusseffects \{jammode_rhythmguitar = [
			all
		]
		jammode_leadguitar = [
			all
		]}
	stopsoundsbybuss \{guitar_jammode}
	stopsoundsbybuss \{drums_jammode}
	stopsoundsbybuss \{bass_jammode}
	stopsoundsbybuss \{jammode_vox}
	jam_deinit_reverb
	if NOT gotparam \{keep_drumkit}
		unloaddrumkitall
	endif
	unloadmelodykit
	unloadbasskit
endscript
