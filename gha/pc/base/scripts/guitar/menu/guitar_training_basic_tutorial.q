training_basic_tutorial_script = [
	{
		call = training_basic_tutorial_startup
	}
	{
		time = 1000
		call = training_basic_tutorial_show_title
	}
	{
		lesson = 1
		call = training_1_1_show_guitar
	}
	{
		call = training_1_1_start_guitar_vo
	}
	{
		rel_time = 4500
		call = training_1_1_show_fret_placement
	}
	{
		rel_time = 10000
		call = training_1_1_show_strum
	}
	{
		rel_time = 8000
		call = training_1_1_show_lesson_header
	}
	{
		call = training_1_1_zoom_guitar
	}
	{
		call = training_1_1_wait_for_tuning_complete
	}
	{
		call = training_1_1_tuning_complete_message
	}
	{
		lesson = 2
		call = training_1_2_start_gem_scroller
	}
	{
		call = training_1_2_show_lesson
	}
	{
		call = training_1_2_wait_for_hit_notes
	}
	{
		call = training_1_2_show_complete_message
	}
	{
		lesson = 3
		call = training_1_3_start_gem_scroller
	}
	{
		call = training_1_3_show_lesson
	}
	{
		call = training_1_2_wait_for_hit_notes
	}
	{
		call = training_1_3_show_complete_message
	}
	{
		lesson = 4
		call = training_1_4_start_gem_scroller
	}
	{
		call = training_1_4_show_lesson
	}
	{
		call = training_1_2_wait_for_hit_notes
	}
	{
		call = training_1_4_show_complete_message
	}
	{
		lesson = 5
		call = training_1_5_start_gem_scroller
	}
	{
		call = training_1_5_show_lesson
	}
	{
		call = training_1_2_wait_for_hit_notes
	}
	{
		call = training_1_5_show_complete_message
	}
	{
		lesson = 6
		call = training_1_6_show_hud
	}
	{
		call = training_1_6_hide_hud
	}
	{
		rel_time = 1000
		call = training_1_6_complete
	}
	{
		call = training_basic_tutorial_1_end
	}
]

script training_basic_tutorial_startup 
	training_init_session
	launchevent \{type = unfocus
		target = root_window}
	training_create_narrator_icons
endscript

script training_create_narrator_icons 
	createscreenelement \{parent = training_container
		type = spriteelement
		id = god_icon
		just = [
			center
			center
		]
		texture = training_narrator_god
		pos = (280.0, 140.0)
		rot_angle = 0
		rgba = [
			255
			255
			255
			255
		]
		scale = (1.4, 1.4)
		z_priority = 5}
	createscreenelement \{parent = training_container
		type = spriteelement
		id = lou_icon
		just = [
			center
			center
		]
		texture = training_narrator_lou
		pos = (280.0, 140.0)
		rot_angle = 0
		rgba = [
			255
			255
			255
			255
		]
		scale = (1.4, 1.4)
		z_priority = 5}
	safe_hide \{id = god_icon}
	safe_hide \{id = lou_icon}
endscript

script training_destroy_narrator_icons 
	safe_destroy \{id = god_icon}
	safe_destroy \{id = lou_icon}
endscript

script training_basic_tutorial_show_title 
	training_show_title \{title = "Guitar Hero Basics Tutorial"}
	begin
	if ($transitions_locked = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	safe_show \{id = god_icon}
	training_play_sound \{sound = 'Tutorial_1_Intro_01_God'
		wait}
	training_destroy_title
endscript

script training_1_1_show_guitar 
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
		scale = (0.4, 0.4)
		z_priority = 4}
	training_create_strum_sprites
	hide_strum_fingers
	safe_show \{id = strum_middle_sprite}
endscript

script training_1_1_start_guitar_vo 
	training_play_sound \{sound = 'Tutorial_1_Intro_02_God'
		wait}
endscript

script training_create_fret_finger_sprites 
	wrist_pos = (455.0, 362.0)
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = hand_wrist
		just = [center center]
		texture = training_hand_wrist
		pos = <wrist_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 5
	}
	hand_pos = (407.0, 430.0)
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = fret_none_sprite
		just = [center center]
		texture = training_hand_button_none
		pos = <hand_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 5
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = fret_green_sprite
		just = [center center]
		texture = training_hand_button_g
		pos = <hand_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 5
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = fret_red_sprite
		just = [center center]
		texture = training_hand_button_r
		pos = <hand_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 5
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = fret_yellow_sprite
		just = [center center]
		texture = training_hand_button_y
		pos = <hand_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 5
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = fret_green_red_sprite
		just = [center center]
		texture = training_hand_button_gr
		pos = <hand_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 5
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = fret_green_red_yellow_sprite
		just = [center center]
		texture = training_hand_button_gry
		pos = <hand_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 5
	}
endscript

script training_destroy_fret_finger_sprites 
	safe_destroy \{id = fret_none_sprite}
	safe_destroy \{id = fret_green_sprite}
	safe_destroy \{id = fret_red_sprite}
	safe_destroy \{id = fret_yellow_sprite}
	safe_destroy \{id = fret_green_red_sprite}
	safe_destroy \{id = fret_green_red_yellow_sprite}
	safe_destroy \{id = hand_wrist}
endscript

script training_1_1_show_fret_placement 
	training_create_fret_finger_sprites
	pose_fret_fingers \{color = none}
	spawnscriptnow \{training_animate_fret_fingers
		id = training_spawned_script}
	training_add_arrow \{id = training_arrow
		life = 8.0
		pos = (410.0, 360.0)
		scale = 0.7}
endscript

script training_animate_fret_fingers 
	wait \{2
		seconds
		ignoreslomo}
	begin
	pose_fret_fingers \{color = green}
	wait \{0.5
		seconds
		ignoreslomo}
	pose_fret_fingers \{color = red}
	wait \{0.5
		seconds
		ignoreslomo}
	pose_fret_fingers \{color = yellow}
	wait \{0.5
		seconds
		ignoreslomo}
	pose_fret_fingers \{color = red}
	wait \{0.5
		seconds
		ignoreslomo}
	repeat 2
	pose_fret_fingers \{color = green}
endscript

script pose_fret_fingers 
	hide_fret_fingers
	switch (<color>)
		case none
		safe_show \{id = fret_none_sprite}
		case green
		safe_show \{id = fret_green_sprite}
		case red
		safe_show \{id = fret_red_sprite}
		case yellow
		safe_show \{id = fret_yellow_sprite}
		case green_red
		safe_show \{id = fret_green_red_sprite}
		case green_red_yellow
		safe_show \{id = fret_green_red_yellow_sprite}
	endswitch
	safe_show \{id = hand_wrist}
endscript

script hide_fret_fingers 
	safe_hide \{id = fret_none_sprite}
	safe_hide \{id = fret_green_sprite}
	safe_hide \{id = fret_red_sprite}
	safe_hide \{id = fret_yellow_sprite}
	safe_hide \{id = fret_green_sprite}
	safe_hide \{id = fret_green_red_sprite}
	safe_hide \{id = fret_green_red_yellow_sprite}
	safe_hide \{id = hand_wrist}
endscript

script training_animate_strum_fingers 
	pose_strum_fingers \{pos = middle}
	wait \{2
		seconds
		ignoreslomo}
	begin
	pose_strum_fingers \{pos = middle}
	wait \{0.5
		seconds
		ignoreslomo}
	pose_strum_fingers \{pos = up}
	wait \{0.5
		seconds
		ignoreslomo}
	pose_strum_fingers \{pos = middle}
	wait \{0.5
		seconds
		ignoreslomo}
	pose_strum_fingers \{pos = down}
	wait \{0.5
		seconds
		ignoreslomo}
	repeat 2
	pose_strum_fingers \{pos = middle}
endscript

script pose_strum_fingers 
	hide_strum_fingers
	switch (<pos>)
		case middle
		id = strum_middle_sprite
		hand_id = hand_strum_middle_sprite
		case up
		id = strum_up_sprite
		hand_id = hand_strum_down_sprite
		case down
		id = strum_down_sprite
		hand_id = hand_strum_up_sprite
	endswitch
	doscreenelementmorph id = <id> alpha = 1
	doscreenelementmorph id = <hand_id> alpha = 1
endscript

script hide_strum_fingers 
	safe_hide \{id = strum_middle_sprite}
	safe_hide \{id = strum_up_sprite}
	safe_hide \{id = strum_down_sprite}
	safe_hide \{id = hand_strum_middle_sprite}
	safe_hide \{id = hand_strum_up_sprite}
	safe_hide \{id = hand_strum_down_sprite}
endscript

script training_create_strum_sprites 
	if iswinport
		strum_pos = (830.0, 398.0)
	else
		strum_pos = (850.0, 400.0)
	endif
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = strum_middle_sprite
		just = [center center]
		texture = training_guitar_strum
		pos = <strum_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 5
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = strum_up_sprite
		just = [center center]
		texture = training_guitar_strum_up
		pos = <strum_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 5
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = strum_down_sprite
		just = [center center]
		texture = training_guitar_strum_down
		pos = <strum_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 5
	}
	if iswinport
		hand_strum_pos = (925.0, 358.0)
	else
		hand_strum_pos = (945.0, 360.0)
	endif
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = hand_strum_middle_sprite
		just = [center center]
		texture = training_hand_strum
		pos = <hand_strum_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 6
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = hand_strum_up_sprite
		just = [center center]
		texture = training_hand_strum_up
		pos = <hand_strum_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 6
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = hand_strum_down_sprite
		just = [center center]
		texture = training_hand_strum_down
		pos = <hand_strum_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 6
	}
endscript

script training_destory_strum_sprites 
	safe_destroy \{id = strum_middle_sprite}
	safe_destroy \{id = strum_up_sprite}
	safe_destroy \{id = strum_down_sprite}
	safe_destroy \{id = hand_strum_middle_sprite}
	safe_destroy \{id = hand_strum_up_sprite}
	safe_destroy \{id = hand_strum_down_sprite}
endscript

script training_1_1_show_strum 
	if iswinport
		training_add_arrow \{id = training_strum_arrow
			life = 7
			pos = (830.0, 358.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_strum_arrow
			life = 7
			pos = (850.0, 360.0)
			scale = 0.7}
	endif
	spawnscriptnow \{training_animate_strum_fingers
		id = training_spawned_script}
endscript

script training_1_1_show_lesson_header 
	training_set_lesson_header_text \{text = "LESSON 1: GUITAR TUNING"}
	training_set_lesson_header_body \{text = "1. HOLD Fret Button to CHOOSE note\\n2. PRESS Strum Bar up or down to PLAY note"}
	training_set_task_header_body \{text = "Play each note 3 times to continue"}
	training_show_lesson_header
	training_play_sound \{sound = 'Tutorial_1_Intro_03_god'
		wait}
endscript

script training_1_1_zoom_guitar 
	change \{training_notes_strummed = [
			0
			0
			0
			0
			0
		]}
	change \{total_notes_strummed = 0}
	training_play_sound \{sound = 'tutorial_1a_01_god'}
	killspawnedscript \{name = training_animate_fret_fingers}
	killspawnedscript \{name = training_animate_strum_fingers}
	hide_strum_fingers
	hide_fret_fingers
	if screenelementexists \{id = guitar_sprite}
		guitar_sprite :domorph \{scale = (1.0, 1.0)
			pos = (1100.0, 400.0)
			time = 0.75}
	endif
	setmenuautorepeattimes \{(60.0, 60.0)}
	spawnscriptnow \{training_watch_buttons
		id = training_spawned_script}
	training_wait_for_sound \{sound = 'en_tutorial_1a_01_god'}
endscript

script training_1_1_wait_for_tuning_complete 
	training_show_task_header
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_up training_strummed_guitar}
		{pad_down training_strummed_guitar}
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
	begin
	if ($lesson_complete = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	launchevent \{type = unfocus
		target = menu_tutorial}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	killspawnedscript \{name = training_watch_buttons}
	setmenuautorepeattimes \{(0.3, 0.05)}
	wait \{2
		seconds
		ignoreslomo}
endscript
training_notes_strummed = [
	0
	0
	0
	0
	0
]
total_notes_strummed = 0
total_notes_tuned = 0

script training_strummed_guitar 
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
	if (<notes_played> = 1)
		if ($training_notes_strummed [<note_played>] < 3)
			setarrayelement arrayname = training_notes_strummed globalarray index = <note_played> newvalue = ($training_notes_strummed [<note_played>] + 1)
			change total_notes_strummed = ($total_notes_strummed + 1)
			training_hit_note note = <note_played>
			spawnscriptnow gh_sfx_training_tuning_strings params = {note_played = <note_played> training_notes_strummed = ($training_notes_strummed [<note_played>])}
			if ($training_notes_strummed [<note_played>] = 3)
				formattext checksumname = note_tuned 'note_tuned_%a' a = <note_played>
				change total_notes_tuned = ($total_notes_tuned + 1)
				createscreenelement {
					parent = training_container
					type = spriteelement
					id = <note_tuned>
					just = [center center]
					texture = training_guitar_button_tuned
					pos = ((442.0, 396.0) + (1.0, 0.0) * (<note_played> * 67))
					rot_angle = 0
					rgba = [255 255 255 255]
					scale = (0.36, 0.36)
					z_priority = 7
				}
				if (($total_notes_tuned = 1) || ($total_notes_tuned = 4))
					getrandomvalue \{name = random_value
						a = 0
						b = 10}
					if (<random_value> < 5)
						training_play_sound \{sound = 'Tutorial_God_Positive_01'}
					else
						training_play_sound \{sound = 'Tutorial_God_Positive_02'}
					endif
				endif
			endif
			if ($total_notes_strummed >= 15)
				change \{lesson_complete = 1}
			endif
		endif
	endif
endscript

script training_1_1_tuning_complete_message 
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	soundevent \{event = tutorial_mode_finish_chord}
	safe_destroy \{id = guitar_sprite}
	training_destroy_fret_finger_sprites
	training_destroy_pressed_notes
	safe_destroy \{id = strum_middle_sprite}
	safe_destroy \{id = strum_up_sprite}
	safe_destroy \{id = strum_down_sprite}
	training_destroy_hit_notes
	safe_destroy \{id = note_tuned_0}
	safe_destroy \{id = note_tuned_1}
	safe_destroy \{id = note_tuned_2}
	safe_destroy \{id = note_tuned_3}
	safe_destroy \{id = note_tuned_4}
	training_hide_lesson_header
	training_hide_task_header
	createscreenelement {
		type = textelement
		parent = training_container
		id = tuning_complete_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		scale = 1.0
		rgba = ($training_text_color)
	}
	wait \{2
		seconds
		ignoreslomo}
	safe_destroy \{id = tuning_complete_text}
endscript

script training_wait_for_gem_scroller_startup 
	begin
	getsongtime
	printf channel = tutorial "song time is %a " a = <songtime>
	if (<songtime> > 0)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_1_2_start_gem_scroller 
	destroy_band
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tutorial_1b
		no_score_update}
	killspawnedscript \{name = update_score_fast}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson1_hit_note}
		{missed_notep1 lesson1_missed_note}
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
	training_wait_for_gem_scroller_startup
	training_set_lesson_header_text \{text = "LESSON 2: PLAYING NOTES"}
	training_set_lesson_header_body \{text = "1. As notes cross the line, play them on your guitar"}
	training_show_lesson_header
	safe_show \{id = god_icon}
endscript

script training_1_2_show_lesson 
	wait \{3.6
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_play_sound \{sound = 'Tutorial_1B_01_God'}
	wait \{7.1
		seconds
		ignoreslomo}
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 7.0
			pos = (742.0, 370.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 7.0
			pos = (525.0, 370.0)
			scale = 0.7}
	endif
	wait \{7.5
		seconds
		ignoreslomo}
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 5
			pos = (886.0, 635.0)
			scale = 0.7
			rot = 90}
	else
		training_add_arrow \{id = training_arrow2
			life = 5
			pos = (380.0, 635.0)
			scale = 0.7
			rot = -90}
	endif
	wait \{6
		seconds
		ignoreslomo}
	training_set_task_header_body \{text = "Play 8 notes to continue"}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	wait \{1
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tutorial_1B_02_God'}
	wait \{2
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript
notes_hit = 0

script lesson1_hit_note 
	change notes_hit = ($notes_hit + 1)
	if (($notes_hit = 1) || ($notes_hit = 4))
		getrandomvalue \{name = random_value
			a = 0
			b = 10}
		if (<random_value> < 5)
			if gotparam \{use_lou}
				training_play_sound \{sound = 'Tutorial_lou_Positive_01'}
			else
				training_play_sound \{sound = 'Tutorial_God_Positive_01'}
			endif
		elseif (<random_value> < 10)
			if gotparam \{use_lou}
				training_play_sound \{sound = 'Tutorial_lou_Positive_02'}
			else
				training_play_sound \{sound = 'Tutorial_God_Positive_02'}
			endif
		endif
	endif
	training_display_notes_hit \{notes_hit = $notes_hit}
endscript
notes_missed = 0

script lesson1_missed_note 
	change notes_missed = ($notes_missed + 1)
	if (($notes_missed = 3) || ($notes_missed = 6))
		if gotparam \{use_lou}
			training_play_negative \{who = lou}
		else
			training_play_negative \{who = god}
		endif
	endif
endscript
long_notes_missed = 0

script lesson4_check_long_note 
	if (<finished> = 1)
		change notes_hit = ($notes_hit + 1)
		if NOT training_is_sound_playing \{sound = 'Tutorial_1D_02_God'}
			if (($notes_hit = 1) || ($notes_hit = 4))
				training_play_positive \{who = god}
			endif
		endif
	else
		change long_notes_missed = ($long_notes_missed + 1)
		if ($long_notes_missed = 2)
			training_play_sound \{sound = 'Tutorial_1D_02_God'}
		endif
	endif
	if ($notes_hit = 0)
		return
	endif
	training_display_notes_hit \{notes_hit = $notes_hit}
endscript

script training_1_2_wait_for_hit_notes 
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($notes_hit >= 8)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_1_2_show_complete_message 
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	wait \{0.75
		seconds
		ignoreslomo}
	safe_destroy \{id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	createscreenelement {
		type = textelement
		parent = training_container
		id = tuning_complete_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		scale = 1.0
		rgba = ($training_text_color)
	}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tutorial_1B_03_God'
		wait}
	safe_destroy \{id = tuning_complete_text}
endscript

script training_1_3_start_gem_scroller 
	destroy_band
	change \{lesson_complete = 0}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tutorial_1c
		disable_hud
		no_score_update}
	killspawnedscript \{name = update_score_fast}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson1_hit_note}
		{missed_notep1 lesson1_missed_note}
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
	training_wait_for_gem_scroller_startup
	change \{notes_hit = 0}
	change \{notes_missed = 0}
endscript

script training_1_3_show_lesson 
	wait \{1
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{text = "LESSON 3: DIFFERENT NOTES"}
	training_set_lesson_header_body \{text = "1. Match the note colors to play different notes"}
	training_show_lesson_header
	safe_show \{id = god_icon}
	training_play_sound \{sound = 'Tutorial_1C_01_God'
		wait}
	training_set_task_header_body \{text = "Play some different notes, hit 8 to continue"}
	training_show_task_header
	wait \{2
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_1_3_wait_for_lesson_complete 
	change \{lesson_complete = 0}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($lesson_complete = 1)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_1_3_show_complete_message 
	printf \{channel = newdebug
		"training_1_3_show_complete_message"}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	wait \{0.75
		seconds
		ignoreslomo}
	safe_destroy \{id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	createscreenelement {
		type = textelement
		parent = training_container
		id = tuning_complete_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		scale = 1.0
		rgba = ($training_text_color)
	}
	training_play_sound \{sound = 'Tutorial_1C_02_God'
		wait}
	safe_destroy \{id = tuning_complete_text}
endscript

script training_1_4_start_gem_scroller 
	destroy_band
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tutorial_1d
		disable_hud
		no_score_update}
	killspawnedscript \{name = update_score_fast}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
		{whammy_offp1 lesson4_check_long_note}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_set_lesson_header_text \{text = "LESSON 4: LONG NOTES"}
	training_set_lesson_header_body \{text = ""}
	training_show_lesson_header
	safe_show \{id = god_icon}
	change \{notes_hit = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_1_4_show_lesson 
	wait \{3.55
		seconds
		ignoreslowmo}
	training_pause_gem_scroller
	training_set_lesson_header_body \{text = "1. Hold fret buttons down\\n2. Strum\\n3. Keep fret down until the whole note has played"}
	training_show_lesson_header
	training_play_sound \{sound = 'Tutorial_1D_01_God'}
	wait \{0.75
		seconds
		ignoreslomo}
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 18
			pos = (725.0, 380.0)
			scale = 0.7
			rot = -45}
	else
		training_add_arrow \{id = training_arrow
			life = 18
			pos = (545.0, 380.0)
			scale = 0.7
			rot = 45}
	endif
	training_wait_for_sound \{sound = 'Tutorial_1D_01_God'
		wait}
	training_set_task_header_body \{text = "Play 8 long notes to continue"}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	wait \{2
		seconds
		ignoreslomo}
	training_resume_gem_scroller
	change \{long_notes_missed = 0}
endscript

script training_1_4_show_complete_message 
	if screenelementexists \{id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	wait \{0.75
		seconds
		ignoreslomo}
	safe_destroy \{id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	createscreenelement {
		type = textelement
		parent = training_container
		id = tuning_complete_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		scale = 1.0
		rgba = ($training_text_color)
	}
	unpausegh3sounds
	unpausegame
	training_play_sound \{sound = 'Tutorial_1D_03_God'
		wait}
	safe_hide \{id = god_icon}
	safe_destroy \{id = tuning_complete_text}
endscript

script training_1_5_start_gem_scroller 
	destroy_band
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tutorial_1e
		disable_hud
		no_score_update}
	killspawnedscript \{name = update_score_fast}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson1_hit_note params = {use_lou}}
		{missed_notep1 lesson1_missed_note params = {use_lou}}
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
	training_set_lesson_header_text \{text = "LESSON 5: CHORDS"}
	training_set_lesson_header_body \{text = ""}
	training_show_lesson_header
	safe_show \{id = lou_icon}
	change \{notes_hit = 0}
	change \{notes_missed = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_1_5_show_lesson 
	wait \{3.5
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_set_lesson_header_body \{text = "Two notes played at the same time"}
	training_show_lesson_header
	training_play_sound \{sound = 'Tutorial_1E_01_lou'}
	wait \{6.65
		seconds
		ignoreslomo}
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 8.4
			pos = (710.0, 375.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 8.4
			pos = (556.0, 375.0)
			scale = 0.7}
	endif
	training_wait_for_sound \{sound = 'Tutorial_1E_01_lou'}
	training_set_task_header_body \{text = "Play 8 chords to continue"}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	wait \{2
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_1_5_show_complete_message 
	if screenelementexists \{id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	wait \{0.75
		seconds
		ignoreslomo}
	safe_destroy \{id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	createscreenelement {
		type = textelement
		parent = training_container
		id = tuning_complete_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		scale = 1.0
		rgba = ($training_text_color)
	}
	wait \{3
		seconds
		ignoreslomo}
	safe_hide \{id = lou_icon}
	safe_destroy \{id = tuning_complete_text}
endscript

script training_destroy_gem_scroller \{delay = 0.5}
	training_pause_gem_scroller
	wait <delay> seconds ignoreslomo
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
	training_resume_gem_scroller
endscript

script training_1_6_show_hud 
	training_set_lesson_header_text \{text = "LESSON 6: USER INTERFACE"}
	training_set_lesson_header_body \{text = ""}
	training_show_lesson_header
	safe_show \{id = god_icon}
	training_play_sound \{sound = 'Tutorial_1F_01_god'}
	wait \{6.0
		seconds
		ignoreslomo}
	player_text = 'p1'
	player_status = player1_status
	player = 1
	change \{structurename = player1_status
		current_health = 1.0}
	spawnscriptlater update_score_fast params = {<...>} id = training_spawned_script
	setup_hud <...>
	move_hud_to_default <...> time = 0.5
	wait \{1.5
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow2
		life = 6
		pos = (880.0, 590.0)
		scale = 0.7
		rot = -90}
	wait \{8.0
		seconds
		ignoreslomo}
	training_set_lesson_header_body \{text = "Yellow = OK Performance"}
	wait \{5.5
		seconds
		ignoreslomo}
	killspawnedscript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 1.6
		}
		id = training_spawned_script}
	training_set_lesson_header_body \{text = "Yellow = OK Performance\\nGreen = Good Performance"}
	wait \{5
		seconds
		ignoreslomo}
	killspawnedscript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 0.4
		}
		id = training_spawned_script}
	training_set_lesson_header_body \{text = "Yellow = OK Performance\\nGreen = Good Performance\\nRed = Bad Performance"}
	wait \{6.5
		seconds
		ignoreslomo}
	killspawnedscript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 0.0
		}
		id = training_spawned_script}
	training_set_lesson_header_body \{text = "Yellow = OK Performance\\nGreen = Good Performance\\nRed = Bad Performance\\nBlinking Red = Danger!"}
	wait \{6.5
		seconds
		ignoreslomo}
	killspawnedscript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 1.0
		}
		id = training_spawned_script}
	training_add_arrow \{id = training_arrow2
		life = 10
		pos = (285.0, 460.0)
		scale = 0.7}
	training_set_lesson_header_body \{text = "Yellow = OK Performance\\nGreen = Good Performance\\nRed = Bad Performance\\nBlinking Red = Danger!\\nPlay Notes = Score Points"}
	training_wait_for_sound \{sound = 'Tutorial_1F_01_god'}
	safe_hide \{id = god_icon}
endscript

script training_set_health 
	inc = 0.03
	begin
	current_health = ($player1_status.current_health)
	if (<current_health> < <health>)
		if ((<health> - <current_health>) < <inc>)
			change structurename = player1_status current_health = <health>
		else
			change structurename = player1_status current_health = (<current_health> + <inc>)
		endif
	else
		if ((<current_health> - <health>) < <inc>)
			change structurename = player1_status current_health = <health>
		else
			change structurename = player1_status current_health = (<current_health> - <inc>)
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_1_6_hide_hud 
	player_text = 'p1'
	player_status = player1_status
	destroy_hud <...>
	killspawnedscript \{name = update_score_fast}
	training_hide_lesson_header
endscript

script training_1_6_complete 
	soundevent \{event = tutorial_mode_finish_chord}
	killspawnedscript \{name = training_set_health}
	createscreenelement {
		type = textelement
		parent = training_container
		id = lesson_title_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = "Basic Tutorial Complete!"
		scale = 1.0
		rgba = ($training_text_color)
	}
	training_play_sound \{sound = 'Tutorial_1_outro'
		wait}
	safe_hide \{id = god_icon}
endscript

script training_basic_tutorial_1_end 
	training_kill_session
	killspawnedscript \{name = training_watch_buttons}
	killspawnedscript \{name = training_animate_fret_fingers}
	killspawnedscript \{name = training_animate_strum_fingers}
	safe_destroy \{id = training_container}
	safe_destroy \{id = training_arrow}
	safe_destroy \{id = training_strum_arrow}
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
	setmenuautorepeattimes \{(0.3, 0.05)}
	change \{tutorial_disable_hud = 0}
	setglobaltags \{training
		params = {
			basic_lesson = complete
		}}
	training_check_for_all_tutorials_finished
	ui_flow_manager_respond_to_action \{action = complete_tutorial}
endscript

script create_pressed_note_sprites 
	createscreenelement \{parent = training_container
		type = spriteelement
		id = green_pressed_sprite
		just = [
			center
			center
		]
		texture = training_guitar_button_down
		pos = (441.0, 396.0)
		rot_angle = 0
		rgba = [
			0
			165
			130
			255
		]
		scale = (0.36, 0.36)
		z_priority = 5}
	createscreenelement \{parent = training_container
		type = spriteelement
		id = red_pressed_sprite
		just = [
			center
			center
		]
		texture = training_guitar_button_down
		pos = (508.0, 396.0)
		rot_angle = 0
		rgba = [
			230
			80
			90
			255
		]
		scale = (0.36, 0.36)
		z_priority = 5}
	createscreenelement \{parent = training_container
		type = spriteelement
		id = yellow_pressed_sprite
		just = [
			center
			center
		]
		texture = training_guitar_button_down
		pos = (575.0, 396.0)
		rot_angle = 0
		rgba = [
			220
			160
			25
			255
		]
		scale = (0.36, 0.36)
		z_priority = 5}
	createscreenelement \{parent = training_container
		type = spriteelement
		id = blue_pressed_sprite
		just = [
			center
			center
		]
		texture = training_guitar_button_down
		pos = (642.0, 396.0)
		rot_angle = 0
		rgba = [
			0
			135
			210
			255
		]
		scale = (0.36, 0.36)
		z_priority = 5}
	createscreenelement \{parent = training_container
		type = spriteelement
		id = orange_pressed_sprite
		just = [
			center
			center
		]
		texture = training_guitar_button_down
		pos = (709.0, 396.0)
		rot_angle = 0
		rgba = [
			215
			120
			40
			255
		]
		scale = (0.36, 0.36)
		z_priority = 5}
	hide_pressed_notes
endscript

script hide_pressed_notes 
	safe_hide \{id = green_pressed_sprite}
	safe_hide \{id = red_pressed_sprite}
	safe_hide \{id = yellow_pressed_sprite}
	safe_hide \{id = orange_pressed_sprite}
	safe_hide \{id = blue_pressed_sprite}
endscript

script training_destroy_pressed_notes 
	safe_destroy \{id = green_pressed_sprite}
	safe_destroy \{id = red_pressed_sprite}
	safe_destroy \{id = yellow_pressed_sprite}
	safe_destroy \{id = orange_pressed_sprite}
	safe_destroy \{id = blue_pressed_sprite}
endscript

script training_destroy_hit_notes 
	safe_destroy \{id = hit_green_sprite}
	safe_destroy \{id = hit_yellow_sprite}
	safe_destroy \{id = hit_red_sprite}
	safe_destroy \{id = hit_orange_sprite}
	safe_destroy \{id = hit_blue_sprite}
endscript

script show_pressed_note 
	switch (<note>)
		case 0
		safe_show \{id = green_pressed_sprite}
		case 1
		safe_show \{id = red_pressed_sprite}
		case 2
		safe_show \{id = yellow_pressed_sprite}
		case 3
		safe_show \{id = blue_pressed_sprite}
		case 4
		safe_show \{id = orange_pressed_sprite}
	endswitch
endscript

script training_hit_note 
	switch (<note>)
		case 0
		id = hit_green_sprite
		rgba = [0 165 130 255]
		case 1
		id = hit_red_sprite
		rgba = [230 80 90 255]
		case 2
		id = hit_yellow_sprite
		rgba = [220 160 25 255]
		case 3
		id = hit_blue_sprite
		rgba = [0 135 210 255]
		case 4
		id = hit_orange_sprite
		rgba = [215 120 40 255]
	endswitch
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
	scale = (0.36, 0.36)
	pos = ((442.0, 396.0) + (1.0, 0.0) * (<note> * 67))
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = <id>
		just = [center center]
		texture = training_guitar_button_down
		pos = <pos>
		rot_angle = 0
		rgba = <rgba>
		scale = <scale>
		z_priority = 6
	}
	doscreenelementmorph id = <id> scale = (<scale> * 1.8499999) alpha = 0 time = 0.25
endscript

script training_watch_buttons 
	create_pressed_note_sprites
	begin
	getheldpattern controller = ($player1_status.controller) nobrokenstring
	hide_pressed_notes
	check_button = 65536
	array_count = 0
	begin
	formattext checksumname = new_arrow 'arrow_%a' a = <array_count>
	if screenelementexists id = <new_arrow>
		destroyscreenelement id = <new_arrow>
	endif
	if (<hold_pattern> && <check_button>)
		show_pressed_note note = <array_count>
	else
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat 5
	wait \{1
		gameframe}
	repeat
endscript

script training_1_kill_spawned_scripts 
endscript
