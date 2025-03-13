
script ui_create_fan_video 
	get_all_exclusive_devices
	createscreenelement {
		parent = root_window
		id = current_menu
		type = descinterface
		desc = 'rewards'
		rewards_image_placeholder_texture = black
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
	current_menu :obj_spawnscript \{ui_create_fan_video_spawned}
endscript

script ui_create_fan_video_spawned 
	killallmovies
	waitforallmoviestofinish
	begin
	if NOT scriptisrunning \{set_bink_heap_state}
		break
	endif
	wait \{1
		gameframe}
	repeat
	wait \{1
		gameframe}
	set_bink_heap_state \{state = big}
	wait \{1
		gameframe}
	if current_menu :desc_resolvealias \{name = alias_movie_parent}
		createscreenelement {
			type = movieelement
			parent = <resolved_id>
			id = reward_movie
			dims = (280.0, 280.0)
			just = [center center]
			pos_anchor = [center center]
			pos = (3.0, 0.0)
			textureslot = 1
			texturepri = 1000
			no_hold
			movie = 'Fanshrine'
			z_priority = 10000
			sound_volume_percent = 0.0
		}
	endif
endscript

script ui_destroy_fan_video 
	clean_up_user_control_helpers
	destroyscreenelement \{id = current_menu}
	spawnscriptnow \{ui_destroy_bonus_videos_spawned}
endscript

script ui_fan_video_continue 
	if screenelementexists \{id = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	progression_set_fan_complete
	ui_win_song_career_continue
endscript
