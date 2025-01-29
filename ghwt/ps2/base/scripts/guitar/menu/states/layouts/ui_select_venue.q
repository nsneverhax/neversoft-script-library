
script ui_create_select_venue 
	SpawnScriptNow ui_create_select_venue_spawned params = {<...>}
endscript

script ui_create_select_venue_spawned 
	RemoveParameter \{base_name}
	if GotParam \{from_gig_board}
		get_gigposter_camera_name \{num = 0}
		Change target_menu_camera = <gigposter_camera>
		wait_for_camera_anim
	endif
	make_generic_menu \{title = qs(0x0a231c9f)
		pad_back_script = ui_event
		pad_back_params = {
			event = menu_back
			data = {
				ignore_camera
			}
		}
		extra_z = 42000
		scrolling}
	get_song_struct song = ($current_song)
	if StructureContains structure = <song_struct> Name = 0x59cb4f1c
		0x59cb4f1c = (<song_struct>.0x59cb4f1c)
		GetArraySize $<0x59cb4f1c>
	endif
	index = 0
	begin
	level_checksum = (($<0x59cb4f1c>) [<index>])
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		get_progression_globals ($current_progression_flag)
		formatText {
			checksumName = venue_checksum
			'%s_%i'
			s = ($LevelZones.<level_checksum>.Name)
			i = ($instrument_list.($<tier_global>.part).text_nl)
			AddToStringLookup = true
		}
		GetGlobalTags <venue_checksum> param = unlocked

		add_venue = 0
		if (<unlocked> = 1)
			add_venue = 1
		endif
		if ($cheat_unlockattballpark = 1)
			if (<level_checksum> = load_z_ballpark)
				add_venue = 1
			endif
		endif
		if (<add_venue> = 1)
			add_generic_menu_text_item {
				text = ($LevelZones.<level_checksum>.title)
				pad_choose_script = venue_select_play_song
				pad_choose_params = {<...> selected_level = <level_checksum>}
			}
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	menu_finish
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script ui_destroy_select_venue 
	generic_ui_destroy
endscript

script venue_select_play_song 

	StopRendering
	destroy_menu \{menu_id = gigboardvenueselectinterface}
	SoundEvent \{event = song_affirmation}
	generic_event_choose no_sound state = uistate_play_song data = {<...>}
endscript
