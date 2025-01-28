training_advanced_techniques_tutorial_script = [
	{
		call = training_advanced_techniques_tutorial_startup
	}
	{
		lesson = 1
		call = training_4_1_show_title
	}
	{
		call = training_4_1_explain
	}
	{
		lesson = 2
		call = training_4_2_explain
	}
	{
		call = training_4_2_show_guitar
	}
	{
		call = training_4_2_zoom_guitar
	}
	{
		call = training_4_2_wait_for_hammeron_complete
	}
	{
		call = training_4_2_complete_message
	}
	{
		call = training_4_2_end
	}
	{
		lesson = 3
		call = training_4_3_start_gem_scroller
	}
	{
		call = training_4_3_explain
	}
	{
		call = training_4_3_wait_for_hammerons
	}
	{
		call = training_4_3_complete_message
	}
	{
		lesson = 4
		call = training_4_4_explain
	}
	{
		call = training_4_4_show_guitar
	}
	{
		call = training_4_4_zoom_guitar
	}
	{
		call = training_4_4_wait_for_pulloff_complete
	}
	{
		call = training_4_4_complete_message
	}
	{
		call = training_4_4_end
	}
	{
		lesson = 5
		call = training_4_5_start_gem_scroller
	}
	{
		call = training_4_5_explain
	}
	{
		call = training_4_5_wait_for_hammerons
	}
	{
		call = training_4_5_complete_message
	}
	{
		call = training_advanced_techniques_tutorial_1_end
	}
]

script training_advanced_techniques_tutorial_startup 
	training_init_session
	0xc1c4e84c \{mode = 0x9d072e7a}
	launchevent \{type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_4_1_show_title 
	training_create_narrator_icons
	training_show_title \{title = 'Hammer-On and Pull-Off Tutorial'}
	wait \{3
		seconds}
	training_destroy_title
endscript

script training_4_1_explain 
	training_set_lesson_header_text \{text = 'LESSON 1: STRING BASICS'}
	training_set_lesson_header_body \{text = ''}
	training_show_lesson_header
	safe_show \{id = god_icon}
	training_play_sound \{sound = 'Tutorial_4A_01_God'
		wait}
endscript

script training_4_2_explain 
	training_set_lesson_header_text \{text = 'LESSON 2: HAMMER-ON FINGERING'}
	training_set_lesson_header_body \{text = ''}
	training_show_lesson_header
	safe_show \{id = god_icon}
endscript

script training_4_2_show_guitar 
	createscreenelement \{parent = training_container
		type = spriteelement
		id = guitar_sprite
		just = [
			center
			center
		]
		texture = training_guitar
		pos = (630.0, 400.0)
		rot_angle = 0
		rgba = [
			255
			255
			255
			255
		]
		scale = (0.8, 0.8)
		z_priority = 4}
	training_create_fret_finger_sprites
	pose_fret_fingers \{color = none}
	training_create_strum_sprites
	pose_strum_fingers \{pos = middle}
	training_play_sound \{sound = 'Tutorial_4B_01_God'}
	wait \{20
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 6.15
		pos = (360.0, 360.0)
		scale = 0.7}
	training_add_arrow \{id = training_strum_arrow
		life = 4.0
		pos = (850.0, 360.0)
		scale = 0.7}
	pose_fret_fingers \{color = green}
	wait \{1.0
		seconds
		ignoreslomo}
	pose_strum_fingers \{pos = down}
	wait \{1.0
		seconds
		ignoreslomo}
	pose_strum_fingers \{pos = middle}
	wait \{4.2
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 5.0
		pos = (385.0, 360.0)
		scale = 0.7}
	pose_fret_fingers \{color = green_red}
	wait \{5
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 5.0
		pos = (420.0, 360.0)
		scale = 0.7}
	pose_fret_fingers \{color = green_red_yellow}
	training_wait_for_sound \{sound = 'Tutorial_4B_01_God'}
endscript

script training_4_2_zoom_guitar 
	training_set_lesson_header_body \{text = '1. Play Green normally (strum)\\n2. Hammer-on Red (no strum)\\n3. Hammer-on Yellow (no strum)'}
	training_show_lesson_header
	training_set_task_header_body \{text = 'Hit 3 hammer-on sequences to continue'}
	training_show_task_header
	hide_strum_fingers
	hide_fret_fingers
	if screenelementexists \{id = guitar_sprite}
		guitar_sprite :domorph \{scale = (2.0, 2.0)
			pos = (1100.0, 400.0)
			time = 0.75}
	endif
	training_play_sound \{sound = 'Tutorial_4B_02_God'}
	wait \{1
		seconds
		ignoreslomo}
	setmenuautorepeattimes \{(60.0, 60.0)}
endscript

script training_4_2_wait_for_hammeron_complete 
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_up training_hammeron_strummed_guitar}
		{pad_down training_hammeron_strummed_guitar}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	change \{lesson_complete = 0}
	change \{training_hammerons_played = 0}
	spawnscriptnow \{training_watch_buttons
		id = training_spawned_script}
	begin
	if ($lesson_complete = 1)
		break
	endif
	waitonegameframe
	repeat
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	killspawnedscript \{name = training_watch_buttons}
	hide_pressed_notes
	setmenuautorepeattimes \{(0.3, 0.05)}
	wait \{1
		seconds
		ignoreslomo}
endscript

script training_hammeron_strummed_guitar 
	if ($lesson_complete = 1)
		return
	endif

	killspawnedscript \{name = training_watch_for_hammeron}
	spawnscriptnow \{training_watch_for_hammeron
		id = training_spawned_script}
endscript

script training_count_buttons_pressed 
	getheldpattern controller = ($player1_status.controller) nobrokenstring
	check_button = 65536
	array_count = 0
	note_played = 0
	notes_played = 0
	begin
	if (<hold_pattern> && <check_button>)
		note_played = <array_count>
		notes_played = (<notes_played> + 1)
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat 5
	return notes_played = <notes_played>
endscript
training_hammerons_played = 0
notes_played = 0

script training_watch_for_hammeron 

	training_clear_notes_pressed
	training_count_buttons_pressed
	if issoundeventplaying \{tutorial_string_2_hopo_free}
		0x5e591606
		soundevent \{event = tutorial_missed_hopo_free}
		soundevent \{event = stopnotes_02}
		soundevent \{event = stopnotes_03}
	elseif issoundeventplaying \{tutorial_string_3_hopo_free}
		0x5e591606
		soundevent \{event = tutorial_missed_hopo_free}
		soundevent \{event = stopnotes_03}
		soundevent \{event = stopnotes_02}
	endif
	if (<notes_played> != 1)
		if issoundeventplaying \{tutorial_string_1_strum_free}
			0x5e591606
			soundevent \{event = tutorial_missed_hopo_free}
			soundevent \{event = stopnotes_01}
			soundevent \{event = stopnotes_03}
			soundevent \{event = stopnotes_02}
		endif
		return
	endif
	getheldpattern controller = ($player1_status.controller) nobrokenstring
	check_button = 65536
	if (<hold_pattern> && <check_button>)
		training_press_note \{note = 0}
		training_hit_note \{note = 0}
		soundevent \{event = tutorial_string_1_strum_free}
		wait_time = 0
		begin
		getheldpattern controller = ($player1_status.controller) nobrokenstring
		check_button = 273
		if (<hold_pattern> && <check_button>)
			training_clear_notes_pressed

			0x5e591606
			soundevent \{event = tutorial_missed_hopo_free}
			soundevent \{event = stopnotes_01}
			return
		endif
		check_button = 4096
		if (<hold_pattern> && <check_button>)

			break
		endif
		wait_time = (<wait_time> + 1)
		if (<wait_time> >= 60)

			training_clear_notes_pressed
			0x5e591606
			soundevent \{event = tutorial_missed_hopo_free}
			soundevent \{event = stopnotes_01}
			return
		endif
		waitonegameframe
		repeat
		training_press_note \{note = 1}
		training_hit_note \{note = 1}
		0x5e591606
		soundevent \{event = tutorial_string_2_hopo_free}
		soundevent \{event = stopnotes_01}
		wait_time = 0
		begin
		getheldpattern controller = ($player1_status.controller) nobrokenstring
		check_button = 17
		if (<hold_pattern> && <check_button>)
			training_clear_notes_pressed

			0x5e591606
			soundevent \{event = tutorial_missed_hopo_free}
			soundevent \{event = stopnotes_02}
			return
		endif
		check_button = 256
		if (<hold_pattern> && <check_button>)
			break
		endif
		wait_time = (<wait_time> + 1)
		if (<wait_time> >= 60)
			training_clear_notes_pressed
			0x5e591606
			soundevent \{event = tutorial_missed_hopo_free}
			soundevent \{event = stopnotes_02}
			return
		endif
		waitonegameframe
		repeat
		0x5e591606
		soundevent \{event = tutorial_string_3_hopo_free}
		soundevent \{event = stopnotes_02}
		training_press_note \{note = 2}
		training_hit_note \{note = 0}
		training_hit_note \{note = 1}
		training_hit_note \{note = 2}
		change training_hammerons_played = ($training_hammerons_played + 1)
		if NOT ($training_hammerons_played = 3)
			RandomNoRepeat (
				@ training_play_sound \{sound = 'Tutorial_God_Positive_02'}
				@ training_play_sound \{sound = 'Tutorial_God_Positive_04'}
				@ training_play_sound \{sound = 'Tutorial_God_Positive_05'}
				@ training_play_sound \{sound = 'Tutorial_God_Positive_06'}
				@ training_play_sound \{sound = 'Tutorial_God_Positive_09'}
				)
		endif
		if ($training_hammerons_played >= 3)
			change \{lesson_complete = 1}
		endif
		wait \{2
			seconds
			ignoreslomo}
		training_clear_notes_pressed
	endif
endscript

script training_press_note 
	formattext checksumname = note_tuned 'note_tuned_%a' a = <note>
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = <note_tuned>
		just = [center center]
		texture = training_guitar_button_tuned
		pos = ((442.0, 396.0) + (1.0, 0.0) * (<note> * 67))
		rot_angle = 0
		rgba = [255 255 255 255]
		dims = (92.159996, 46.08)
		z_priority = 7
	}
endscript

script training_clear_notes_pressed 

	safe_destroy \{id = note_tuned_0}
	safe_destroy \{id = note_tuned_1}
	safe_destroy \{id = note_tuned_2}
endscript

script training_4_2_complete_message 
	soundevent \{event = stopnotes_03}
	soundevent \{event = tutorial_mode_finish_chord}
	safe_destroy \{id = guitar_sprite}
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
	training_hide_lesson_header
	training_hide_task_header
	training_clear_notes_pressed
	training_destroy_pressed_notes
	createscreenelement {
		type = textelement
		parent = training_container
		id = lesson_title_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = 'Lesson Complete'
		scale = 1.0
		rgba = ($training_text_color)
	}
	training_play_sound \{sound = 'Tutorial_4B_03_God'
		wait}
	destroyscreenelement \{id = lesson_title_text}
endscript

script training_4_2_end 
	killspawnedscript \{name = training_watch_buttons}
	destroy_menu \{menu_id = menu_tutorial_4_2}
	training_destroy_pressed_notes
	safe_destroy \{id = guitar_sprite}
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
endscript

script training_4_3_start_gem_scroller 
	destroy_band
	training_set_lesson_header_text \{text = 'LESSON 3: HAMMER-ONS'}
	training_set_lesson_header_body \{text = '1.  Practice hammer-ons'}
	training_show_lesson_header
	safe_show \{id = god_icon}
	0xc1c4e84c \{mode = 0x73094f56}
	training_start_gem_scroller \{song = tutorial_4c}
	killspawnedscript \{name = update_score_fast}
	training_wait_for_gem_scroller_startup
endscript

script training_4_3_explain 
	wait \{1
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson4_hammeron_note}
		{song_wonp1 training_song_won}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_play_sound \{sound = 'Tutorial_4c_01_God'
		wait}
	training_set_task_header_body \{text = 'Hit 8 notes using the hammer-on technique'}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	wait \{1
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_4_3_wait_for_hammerons 
	change \{training_hammerons_played = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_hammerons_played >= 8)
		break
	endif
	waitonegameframe
	repeat
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	wait \{1
		seconds
		ignoreslomo}
endscript

script lesson4_hammeron_note 
	if (<hammer_strum> = 1)
		change training_hammerons_played = ($training_hammerons_played + 1)
		training_display_notes_hit \{notes_hit = $training_hammerons_played}
		if ($training_hammerons_played = 1)
			training_play_sound \{sound = 'Tutorial_God_Positive_07'}
		endif
	endif
endscript

script training_4_3_complete_message 
	if screenelementexists \{id = notes_hit_text}
		destroyscreenelement \{id = notes_hit_text}
	endif
	wait \{0.75
		seconds
		ignoreslomo}
	soundevent \{event = tutorial_mode_finish_chord}
	training_hide_lesson_header
	training_hide_task_header
	pausegame
	pausegh3sounds
	killcamanim \{name = ch_view_cam}
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	playigccam \{id = cs_view_cam_id
		name = ch_view_cam
		viewport = bg_viewport
		lockto = world
		pos = (-0.068807, 1.5990009, 5.7975965)
		quat = (0.000506, 0.99942994, -0.017537998)
		fov = 72.0
		play_hold = 1
		interrupt_current}
	createscreenelement {
		type = textelement
		parent = training_container
		id = lesson_title_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = 'Lesson Complete'
		scale = 1.0
		rgba = ($training_text_color)
	}
	unpausegame
	unpausegh3sounds
	training_play_sound \{sound = 'Tutorial_4B_03_God'
		wait}
	safe_hide \{id = god_icon}
	safe_destroy \{id = lesson_title_text}
endscript

script training_4_4_explain 
	0xc1c4e84c \{mode = 0x73094f56}
	training_set_lesson_header_text \{text = 'LESSON 4: PULL-OFF FINGERING'}
	training_set_lesson_header_body \{text = ''}
	training_show_lesson_header
	safe_show \{id = lou_icon}
endscript

script training_4_4_show_guitar 
	createscreenelement \{parent = training_container
		type = spriteelement
		id = guitar_sprite
		just = [
			center
			center
		]
		texture = training_guitar
		pos = (630.0, 400.0)
		rot_angle = 0
		rgba = [
			255
			255
			255
			255
		]
		scale = (0.8, 0.8)
		z_priority = 4}
	training_create_fret_finger_sprites
	pose_fret_fingers \{color = none}
	training_create_strum_sprites
	pose_strum_fingers \{pos = middle}
	training_play_sound \{sound = 'Tutorial_4d_01_Lou'}
	wait \{15
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 4.9500003
		pos = (420.0, 360.0)
		scale = 0.7}
	training_add_arrow \{id = training_strum_arrow
		life = 3.5
		pos = (850.0, 360.0)
		scale = 0.7}
	pose_fret_fingers \{color = yellow}
	wait \{1.0
		seconds
		ignoreslomo}
	pose_strum_fingers \{pos = down}
	wait \{1.0
		seconds
		ignoreslomo}
	pose_strum_fingers \{pos = middle}
	wait \{3
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 6.0
		pos = (385.0, 360.0)
		scale = 0.7}
	pose_fret_fingers \{color = red}
	wait \{6
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 4.0
		pos = (360.0, 360.0)
		scale = 0.7}
	pose_fret_fingers \{color = green}
	wait \{7
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 4.9500003
		pos = (420.0, 360.0)
		scale = 0.7}
	training_add_arrow \{id = training_strum_arrow
		life = 4.5
		pos = (850.0, 360.0)
		scale = 0.7}
	pose_fret_fingers \{color = green_red_yellow}
	wait \{3.0
		seconds
		ignoreslomo}
	pose_strum_fingers \{pos = down}
	wait \{1.0
		seconds
		ignoreslomo}
	pose_strum_fingers \{pos = middle}
	wait \{1
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 2.0
		pos = (385.0, 360.0)
		scale = 0.7}
	pose_fret_fingers \{color = green_red}
	wait \{2
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 3.0
		pos = (360.0, 360.0)
		scale = 0.7}
	pose_fret_fingers \{color = green}
	wait \{3
		seconds
		ignoreslomo}
	training_wait_for_sound \{sound = 'Tutorial_4d_01_Lou'}
endscript

script training_4_4_zoom_guitar 
	training_set_lesson_header_body \{text = '1. Play Yellow normally (strum)\\n2. Pull-off Red (no strum)\\n3. Pull-off Green (no strum)'}
	training_show_lesson_header
	training_set_task_header_body \{text = 'Hit 3 pull-off sequences to continue'}
	training_show_task_header
	hide_strum_fingers
	hide_fret_fingers
	if screenelementexists \{id = guitar_sprite}
		guitar_sprite :domorph \{scale = (2.0, 2.0)
			pos = (1100.0, 400.0)
			time = 0.75}
	endif
	wait \{1
		seconds
		ignoreslomo}
endscript
training_pulloffs_played = 0

script training_4_4_wait_for_pulloff_complete 
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif

	event_handlers = [
		{pad_up training_pulloff_strummed_guitar}
		{pad_down training_pulloff_strummed_guitar}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	change \{lesson_complete = 0}
	change \{training_pulloffs_played = 0}
	change \{notes_played = 0}
	setmenuautorepeattimes \{(60.0, 60.0)}
	spawnscriptnow \{training_watch_buttons
		id = training_spawned_script}
	begin
	if ($lesson_complete = 1)
		break
	endif
	waitonegameframe
	repeat
	launchevent \{type = unfocus
		target = menu_tutorial}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	killspawnedscript \{name = training_watch_buttons}
	hide_pressed_notes
	setmenuautorepeattimes \{(0.3, 0.05)}
	wait \{1
		seconds
		ignoreslomo}
	safe_destroy \{id = guitar_sprite}
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
endscript

script training_pulloff_strummed_guitar 
	if ($lesson_complete = 1)
		return
	endif
	killspawnedscript \{name = training_watch_for_pulloff}
	spawnscriptnow \{training_watch_for_pulloff
		id = training_spawned_script}
endscript

script training_watch_for_pulloff 

	training_clear_notes_pressed
	training_count_buttons_pressed
	if issoundeventplaying \{tutorial_string_2_hopo_free}
		0x5e591606
		soundevent \{event = tutorial_missed_hopo_free}
		soundevent \{event = stopnotes_05}
		soundevent \{event = stopnotes_06}
	elseif issoundeventplaying \{tutorial_string_3_hopo_free}
		0x5e591606
		soundevent \{event = tutorial_missed_hopo_free}
		soundevent \{event = stopnotes_06}
		soundevent \{event = stopnotes_05}
	endif
	if NOT training_wait_for_pulloff_color \{color = yellow
			immediate}
		if issoundeventplaying \{tutorial_string_3_strum_free}
			0x5e591606
			soundevent \{event = tutorial_missed_hopo_free}
			soundevent \{event = stopnotes_04}
			soundevent \{event = stopnotes_05}
			soundevent \{event = stopnotes_06}
		endif
		return
	endif
	training_press_note \{note = 2}
	training_hit_note \{note = 2}
	soundevent \{event = tutorial_string_3_strum_free}
	if NOT training_wait_for_pulloff_color \{color = yellow
			released}
		0x5e591606
		soundevent \{event = tutorial_missed_hopo_free}
		soundevent \{event = stopnotes_04}
		training_clear_notes_pressed
		return
	endif
	if NOT training_wait_for_pulloff_color \{color = red}
		0x5e591606
		soundevent \{event = tutorial_missed_hopo_free}
		soundevent \{event = stopnotes_04}
		training_clear_notes_pressed
		return
	endif
	training_press_note \{note = 1}
	training_hit_note \{note = 1}
	0x5e591606
	soundevent \{event = tutorial_string_2_hopo_free}
	soundevent \{event = stopnotes_04}
	if NOT training_wait_for_pulloff_color \{color = red
			released}
		0x5e591606
		soundevent \{event = tutorial_missed_hopo_free}
		soundevent \{event = stopnotes_05}
		training_clear_notes_pressed
		return
	endif
	if NOT training_wait_for_pulloff_color \{color = green}
		0x5e591606
		soundevent \{event = tutorial_missed_hopo_free}
		soundevent \{event = stopnotes_05}
		training_clear_notes_pressed
		return
	endif
	training_press_note \{note = 0}
	training_hit_note \{note = 0}
	training_hit_note \{note = 1}
	training_hit_note \{note = 2}
	0x5e591606
	soundevent \{event = tutorial_string_1_hopo_free}
	soundevent \{event = stopnotes_05}
	change training_pulloffs_played = ($training_pulloffs_played + 1)
	if NOT ($training_pulloffs_played = 3)
		RandomNoRepeat (
			@ training_play_sound \{sound = 'Tutorial_Lou_Positive_02'}
			@ training_play_sound \{sound = 'Tutorial_Lou_Positive_03'}
			@ training_play_sound \{sound = 'Tutorial_Lou_Positive_04'}
			@ training_play_sound \{sound = 'Tutorial_Lou_Positive_06'}
			@ training_play_sound \{sound = 'Tutorial_Lou_Positive_07'}
			)
	endif
	if ($training_pulloffs_played >= 3)
		change \{lesson_complete = 1}
	endif
	wait \{2
		seconds
		ignoreslomo}
	training_clear_notes_pressed
endscript

script training_wait_for_pulloff_color 
	switch (<color>)
		case yellow
		button_mask = 256
		maybe_dont_allow = 69632
		dont_allow_mask = 17
		case red
		button_mask = 4096
		maybe_dont_allow = 65536
		dont_allow_mask = 273
		case green
		button_mask = 65536
		maybe_dont_allow = 0
		dont_allow_mask = 4369
	endswitch
	if gotparam \{release}
		max_time = 30
	else
		max_time = 60
	endif
	wait_time = 0
	begin
	getheldpattern controller = ($player1_status.controller) nobrokenstring
	if (<hold_pattern> && <dont_allow_mask>)
		return \{false}
	endif
	if gotparam \{released}
		if NOT (<hold_pattern> && <button_mask>)
			break
		endif
	else
		if (<hold_pattern> && <button_mask>)
			break
		else
			if (<hold_pattern> && <maybe_dont_allow>)
				return \{false}
			endif
			if gotparam \{immediate}
				return \{false}
			endif
		endif
	endif
	wait_time = (<wait_time> + 1)
	if (<wait_time> >= <max_time>)
		return \{false}
	endif
	wait \{1
		gameframe}
	repeat
	return \{true}
endscript

script training_4_4_complete_message 
	soundevent \{event = tutorial_mode_finish_chord}
	soundevent \{event = stopnotes_06}
	safe_destroy \{id = guitar_sprite}
	training_hide_lesson_header
	training_hide_task_header
	training_clear_notes_pressed
	training_destroy_pressed_notes
	createscreenelement {
		type = textelement
		parent = training_container
		id = lesson_title_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = 'Lesson Complete'
		scale = 1.0
		rgba = ($training_text_color)
	}
	training_play_sound \{sound = 'Tutorial_4D_02_Lou'
		wait}
	destroyscreenelement \{id = lesson_title_text}
endscript

script training_4_4_end 
	killspawnedscript \{name = training_watch_buttons}
	safe_destroy \{id = guitar_sprite}
	training_destroy_pressed_notes
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
endscript

script training_4_5_start_gem_scroller 
	destroy_band
	training_set_lesson_header_text \{text = 'LESSON 5: PULL-OFFS'}
	training_set_lesson_header_body \{text = ''}
	training_show_lesson_header
	safe_show \{id = lou_icon}
	0xc1c4e84c \{mode = 0x9a6aea63}
	training_start_gem_scroller \{song = tutorial_4e}
	killspawnedscript \{name = update_score_fast}
	change \{training_pulloffs_played = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_4_5_explain 
	wait \{1
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_set_lesson_header_body \{text = '1. Practice pull-offs'}
	training_show_lesson_header
	training_set_task_header_body \{text = 'Hit 8 notes using pull-offs to continue'}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	training_play_sound \{sound = 'Tutorial_4e_01_Lou'
		wait}
	training_resume_gem_scroller
endscript

script training_4_5_wait_for_hammerons 
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson5_pulloff_note}
		{song_wonp1 training_song_won}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	change \{training_pulloffs_played = 0}
	change \{training_song_over = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_pulloffs_played >= 8)
		break
	endif
	waitonegameframe
	repeat
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	wait \{1
		seconds
		ignoreslomo}
endscript

script lesson5_pulloff_note 
	if (<hammer_strum> = 1)
		change training_pulloffs_played = ($training_pulloffs_played + 1)
		training_display_notes_hit \{notes_hit = $training_pulloffs_played}
		if ($training_pulloffs_played = 1)
			training_play_sound \{sound = 'Tutorial_Lou_Positive_05'}
		endif
	endif
endscript

script training_4_5_complete_message 
	if screenelementexists \{id = notes_hit_text}
		destroyscreenelement \{id = notes_hit_text}
	endif
	wait \{0.75
		seconds
		ignoreslomo}
	soundevent \{event = tutorial_mode_finish_chord}
	training_hide_lesson_header
	training_hide_task_header
	pausegame
	pausegh3sounds
	killcamanim \{name = ch_view_cam}
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	playigccam \{id = cs_view_cam_id
		name = ch_view_cam
		viewport = bg_viewport
		lockto = world
		pos = (-0.068807, 1.5990009, 5.7975965)
		quat = (0.000506, 0.99942994, -0.017537998)
		fov = 72.0
		play_hold = 1
		interrupt_current}
	createscreenelement {
		type = textelement
		parent = training_container
		id = lesson_title_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = 'Lesson Complete'
		scale = 1.0
		rgba = ($training_text_color)
	}
	unpausegh3sounds
	unpausegame
	training_play_sound \{sound = 'Tutorial_4e_02_Lou'
		wait}
	destroyscreenelement \{id = lesson_title_text}
	createscreenelement {
		type = textelement
		parent = training_container
		id = lesson_title_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = 'Advanced Techniques Tutorial Complete!'
		scale = 1.0
		rgba = ($training_text_color)
	}
	safe_hide \{id = lou_icon}
	training_play_sound \{sound = 'Tutorial_4_Outro'
		wait}
	destroyscreenelement \{id = lesson_title_text}
endscript
training_song_over = 0

script training_song_won 
	change \{training_song_over = 1}
	show_training_pause_screen \{songfailed}
endscript

script training_advanced_techniques_tutorial_1_end 
	training_kill_session
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_narrator_icons
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	setglobaltags \{training
		params = {
			advanced_techniques_lesson = complete
		}}
	training_check_for_all_tutorials_finished
	ui_flow_manager_respond_to_action \{action = complete_tutorial}
endscript

script training_check_for_all_tutorials_finished 
	getglobaltags \{training}
	if (<basic_lesson> != complete)
		return
	endif
	if (<star_power_lesson> != complete)
		return
	endif
	if (<guitar_battle_lesson> != complete)
		return
	endif
	if (<advanced_techniques_lesson> != complete)
		return
	endif
	writeachievements \{achievement = ready_to_rock}
endscript
