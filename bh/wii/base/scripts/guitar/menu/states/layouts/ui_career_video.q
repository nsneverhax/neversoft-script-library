
script 0xb766bdcc 
	RequireParams \{[
			venue_checksum
			0xe1052062
			venue_index
		]
		all}
	CreateScreenElement \{Type = ContainerElement
		id = current_menu
		parent = root_window}
	current_menu :obj_spawnscript 0x08e37817 params = {venue_checksum = <venue_checksum> 0xe1052062 = <0xe1052062> venue_index = <venue_index>}
endscript

script 0xa596ac7e 
	DestroyScreenElement \{id = current_menu}
	fadetoblack \{OFF
		time = 0
		no_wait}
endscript

script 0x08e37817 
	RequireParams \{[
			venue_checksum
			0xe1052062
			venue_index
		]
		all}
	fadetoblack \{On
		alpha = 1.0
		time = 0
		z_priority = 200}
	PlayMovieAndWait movie = <0xe1052062> noblack
	ui_event_wait_for_safe
	get_savegame_from_controller controller = ($primary_controller)
	SetGlobalTags <venue_checksum> params = {0x6af5adbe = 1} savegame = <savegame> packtype = venuetags Progression = true
	formatText checksumName = video_checksum '%s' s = <0xe1052062>
	if globaltagexists <video_checksum> noassert = 1
		SetGlobalTags savegame = <savegame> <video_checksum> params = {unlocked = 1}
	endif
	create_screen_blackout \{alpha = 1.0
		z = 2000}
	ui_memcard_autosave_replace event = menu_replace state = uistate_career_gig_select data = {venue_index = <venue_index>}
endscript
