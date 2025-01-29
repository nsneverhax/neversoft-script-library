
script ui_create_fan_video 
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = current_menu
		Type = descinterface
		desc = 'rewards'
		rewards_image_placeholder_texture = 0x27c695f3
		exclusive_device = <exclusive_device>
		message_text = qs(0x3a710ee5)
		title_text = qs(0xcc3650c0)
		event_handlers = [
			{pad_choose ui_fan_video_continue}
		]
	}
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
	if 0x8658e568
		destroy_loading_screen
	endif
endscript

script ui_create_fan_video_spawned 
	killallmovies
	Wait \{10
		gameframes}
	begin
	if NOT ScriptIsRunning \{set_bink_heap_state}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Wait \{1
		gameframe}
	set_bink_heap_state \{state = big}
	Wait \{1
		gameframe}
	if current_menu :desc_resolvealias \{Name = alias_movie_parent}
		CreateScreenElement {
			Type = movieelement
			parent = <resolved_id>
			id = reward_movie
			dims = (280.0, 280.0)
			just = [center center]
			pos_anchor = [center center]
			Pos = (3.0, 0.0)
			textureSlot = 1
			TexturePri = 1000
			no_hold
			movie = 'Fanshrine'
			z_priority = 10000
			sound_volume_percent = 0.0
		}
	endif
endscript

script ui_destroy_fan_video 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = current_menu}
	SpawnScriptNow \{ui_destroy_bonus_videos_spawned}
endscript

script ui_fan_video_continue 
	if ScreenElementExists \{id = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	progression_set_fan_complete
	ui_win_song_career_continue
endscript
