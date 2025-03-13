
script ui_create_select_venue 
	spawnscriptnow ui_create_select_venue_spawned params = {<...>}
endscript

script ui_create_select_venue_spawned 
	removeparameter \{base_name}
	if gotparam \{from_gig_board}
		get_gigposter_camera_name \{num = 0}
		change target_menu_camera = <gigposter_camera>
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
	getarraysize \{$levelzonearray}
	level_zone_array_size = <array_size>
	index = 0
	begin
	get_levelzonearray_checksum index = <index>
	if NOT structurecontains structure = ($levelzones.<level_checksum>) debug_only
		get_progression_globals ($current_progression_flag)
		formattext {
			checksumname = venue_checksum
			'%s_%i'
			s = ($levelzones.<level_checksum>.name)
			i = ($instrument_list.($<tier_global>.part).text_nl)
			addtostringlookup = true
		}
		getglobaltags <venue_checksum> param = unlocked
		printf 'venue_checksum = %v .. unlocked = %u' v = <venue_checksum> u = <unlocked>
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
				text = ($levelzones.<level_checksum>.title)
				pad_choose_script = venue_select_play_song
				pad_choose_params = {<...> selected_level = <level_checksum>}
			}
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	menu_finish
	launchevent \{type = focus
		target = current_menu}
endscript

script ui_destroy_select_venue 
	generic_ui_destroy
endscript

script venue_select_play_song 
	printscriptinfo \{qs(0xfcf32067)}
	stoprendering
	destroy_menu \{menu_id = gigboardvenueselectinterface}
	soundevent \{event = song_affirmation}
	generic_event_choose no_sound state = uistate_play_song data = {<...>}
endscript
