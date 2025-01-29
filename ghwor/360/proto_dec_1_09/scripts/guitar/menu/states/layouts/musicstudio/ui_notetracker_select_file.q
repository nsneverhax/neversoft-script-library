
script 0x747af45f 
endscript

script 0x17deface 
endscript

script 0x0213aa33 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = jam_song_select_container}
	make_generic_menu \{title = qs(0x43a4b9a6)
		pad_back_script = menu_jam_song_select_back
		vmenu_id = create_my_song_menu
		dims = (400.0, 600.0)
		tags = {
			debug_me
		}
		scrolling}
	StartWildcardSearch \{wildcard = 'notetracker\\*.mp3'}
	index = 0
	begin
	if NOT GetWildcardFile
		break
	endif
	setplayerinfo \{1
		jam_instrument = 0}
	add_generic_menu_icon_item {
		text = <FileName>
		choose_state = uistate_musicstudio_notetracker
		choose_state_data = {back_to_jam_band = 0 current_instrument = 0 Player = ($jam_current_recording_player) FileName = <filename_nl>}
		additional_focus_script = menu_jam_create_song_focus
		additional_unfocus_script = menu_jam_create_song_unfocus
	}
	<index> = (<index> + 1)
	repeat
	EndWildcardSearch
	Change \{0x8dbcd060 = 1}
	if NOT ScriptIsRunning \{0x6e556f71}
		spawnscript \{0x6e556f71}
	endif
	Change \{jam_current_recording_player = 1}
endscript

script 0x65f0726b 
	Change \{0x8dbcd060 = 0}
	if ScreenElementExists \{id = jam_song_select_container}
		DestroyScreenElement \{id = jam_song_select_container}
	endif
	destroy_generic_menu
	destroy_jam_song_select_popup
endscript
0x8dbcd060 = 0

script 0x6e556f71 
	add_generic_menu_text_item \{text = qs(0x695bf56c)
		additional_focus_script = menu_jam_create_song_focus
		additional_unfocus_script = menu_jam_create_song_unfocus}
	printf \{qs(0x2c7f49b5)}
	NetSessionFunc \{func = cdn_init}
	Wait \{1
		Second}
	printf \{qs(0x07521a76)}
	authoringinit
	Wait \{1
		Second}
	0x4aa9658e
	first = 0
	begin
	0xcfd43754
	if (<failed> = 1)
		DestroyScreenElement id = <item_container_id>
		if ($0x8dbcd060 = 1)
			add_generic_menu_text_item \{text = qs(0x359da6a5)
				additional_focus_script = menu_jam_create_song_focus
				additional_unfocus_script = menu_jam_create_song_unfocus}
		endif
		return
	endif
	if (<finished> = 1)
		return
	endif
	if ($0x8dbcd060 = 1 && <ready> = 1)
		if (<first> = 0)
			DestroyScreenElement id = <item_container_id>
			add_generic_menu_text_item \{text = qs(0x23d3ba92)
				heading}
			first = 1
		endif
		filename_nl = <FileName>
		0xff58e205 string = <FileName>
		add_generic_menu_icon_item {
			text = <utf16string>
			choose_state = uistate_musicstudio_notetracker
			choose_state_data = {back_to_jam_band = 0 current_instrument = 0 Player = ($jam_current_recording_player) FileName = <filename_nl> usecdn = 1}
			additional_focus_script = menu_jam_create_song_focus
			additional_unfocus_script = menu_jam_create_song_unfocus
		}
	else
		Wait \{1
			gameframe}
	endif
	repeat
	printf \{qs(0x57adc52f)}
endscript
