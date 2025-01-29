freestyle_in_menus = FALSE

script freestyle_enter_menus 
	if ($freestyle_in_menus = FALSE)
		Change \{freestyle_in_menus = true}
		fadetoblack \{On
			time = 0
			alpha = 1.0
			z_priority = 9999999
			no_wait}
		setup_bg_viewport
		Change \{current_level = load_z_freestyle}
		Load_Venue
		freestyle_clear_used_miis
		freestyle_create_crowd
		freestyle_choose_next_camera_index \{camera_type = menu}
		freestyle_change_camera camera_type = menu camera_index = <chosen_index>
		UnPauseGame
		freestylegameunpause
		freestyle_init_lights
		freestyle_init_cameras
		SpawnScriptNow \{freestyle_menu_lightshow_update}
		SpawnScriptNow \{freestyle_menu_lightshow_trigger}
		Wait \{30
			frames}
		StopAllSounds
		SoundEvent \{event = freestyle_ambient_crowd}
		fadetoblack \{OFF
			time = 0
			no_wait}
	endif
endscript

script freestyle_leave_menus 
	if ($freestyle_in_menus = true)
		KillSpawnedScript \{Name = freestyle_enter_menus_spawned}
		KillSpawnedScript \{Name = freestyle_menu_lightshow_update}
		KillSpawnedScript \{Name = freestyle_menu_lightshow_trigger}
		freestyle_deinit_lights
		freestyle_deinit_cameras
		destroy_bg_viewport
		freestyle_destroy_crowd
		flushdeadobjects
		Change \{freestyle_in_menus = FALSE}
	endif
endscript

script freestyle_menu_lightshow_update 
	begin
	LightShow_Update
	Wait \{1
		Frame}
	repeat
endscript

script freestyle_menu_lightshow_trigger 
	begin
	freestyle_play_auto_lights \{new_color = true}
	Wait \{2
		Seconds}
	begin
	freestyle_play_auto_lights \{new_color = FALSE}
	Wait \{2
		Seconds}
	repeat 4
	repeat
endscript
