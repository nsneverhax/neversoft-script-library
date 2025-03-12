g_training_green_note_pos = (435.0, 403.0)
g_training_guitar_note_offset = 63
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
		call = training_1_1_intro_vo
	}
	{
		call = training_1_1_show_character_holding
	}
	{
		call = training_1_1_holding_vo
	}
	{
		call = training_1_1_show_lesson_header
	}
	{
		call = training_1_1_begin_guitar_orientation
	}
	{
		call = training_1_1_holding_complete
	}
	{
		lesson = 2
		call = training_1_2_show_guitar
	}
	{
		call = training_1_2_show_guitar_vo
	}
	{
		call = training_1_2_show_fret_placement
	}
	{
		call = training_1_2_show_fret_vo
	}
	{
		call = training_1_2_show_strum
	}
	{
		call = training_1_2_show_strum_vo
	}
	{
		call = training_1_2_show_lesson_header
	}
	{
		call = training_1_2_zoom_guitar_vo
	}
	{
		call = training_1_2_zoom_guitar
	}
	{
		call = training_1_2_wait_for_tuning_complete
	}
	{
		call = training_1_2_tuning_complete_message
	}
	{
		lesson = 3
		call = training_1_3_start_gem_scroller
	}
	{
		call = training_1_3_show_lesson
	}
	{
		call = training_1_3_wait_for_hit_notes
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
		call = training_1_3_wait_for_hit_notes
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
		call = training_1_3_wait_for_hit_notes
	}
	{
		call = training_1_5_show_complete_message
	}
	{
		lesson = 6
		call = training_1_6_start_gem_scroller
	}
	{
		call = training_1_6_show_lesson
	}
	{
		call = training_1_3_wait_for_hit_notes
	}
	{
		call = training_1_6_show_complete_message
	}
	{
		lesson = 7
		call = training_1_7_start_gem_scroller
	}
	{
		call = training_1_7_show_lesson
	}
	{
		call = training_1_7_wait_for_hit_notes
	}
	{
		call = training_1_7_show_complete_message
	}
	{
		lesson = 8
		call = training_1_8_show_hud
	}
	{
		call = training_1_8_hide_hud
	}
	{
		rel_time = 1000
		call = training_1_8_complete
	}
	{
		call = training_basic_tutorial_1_end
	}
]

script training_basic_tutorial_startup 
	training_init_session
	launchevent \{type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_basic_tutorial_show_title 
	change \{g_training_lessons_completed = 0}
	training_show_title \{title = qs(0x0a7d8bf8)}
	begin
	if ($transitions_locked = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	training_play_sound \{sound = 'Tut_Gtr_HoldGuitar_01_GTR'
		wait}
	training_destroy_title
endscript

script training_1_1_intro_vo 
endscript

script training_1_1_show_character_holding 
	<guitar_tex> = tutorial_guitar
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = guitar_sprite
		just = [center center]
		texture = <guitar_tex>
		pos = (630.0, 400.0)
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 4
	}
endscript

script training_1_1_holding_vo 
	training_show_narrator \{narrator = 'guitarist'}
endscript

script training_1_1_show_lesson_header 
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0xa0f2bfc8)}
	training_add_lesson_body_text \{number = 1
		text = qs(0x6e6885b6)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x7d904637)}
	training_set_task_header_body \{text = qs(0x7615d220)}
	training_show_lesson_header
	training_show_task_header
	training_play_sound \{sound = 'Tut_Gtr_HoldGuitar_02_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_HoldGuitar_03_GTR'
		wait}
endscript
g_training_verifying_orientation_done = 0

script training_1_1_begin_guitar_orientation 
	change \{g_training_verifying_orientation_done = 0}
	training_1_1_query_orientation
	begin
	if ($g_training_verifying_orientation_done)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_1_1_query_orientation 
	if screenelementexists \{id = popup_warning_container}
		destroy_popup_warning_menu
	endif
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	create_popup_warning_menu \{title = qs(0xd8ca68a2)
		textblock = {
			text = qs(0xa2667718)
		}
		no_background
		options = [
			{
				func = training_1_1_verify_guitar_orientation
				func_params = {
					chose = left
				}
				text = qs(0xdbd2f35a)
			}
			{
				func = training_1_1_verify_guitar_orientation
				func_params = {
					chose = right
				}
				text = qs(0x056cca6c)
			}
		]}
endscript

script training_1_1_verify_guitar_orientation 
	destroy_popup_warning_menu
	if (<chose> = left)
		<lefthanded> = 0
	elseif (<chose> = right)
		<lefthanded> = 1
	endif
	change structurename = player1_status lefty_flip = <lefthanded>
	change structurename = player1_status lefthanded_gems = <lefthanded>
	change structurename = player1_status lefthanded_button_ups = <lefthanded>
	if (<chose> = right)
		training_play_sound \{sound = 'Tut_Gtr_HoldGuitar_08_GTR'}
		create_popup_warning_menu \{title = qs(0xd8ca68a2)
			textblock = {
				text = qs(0x26afd74c)
			}
			no_background
			options = [
				{
					func = training_1_1_start_holding_complete_vo
					text = qs(0x58e0a1fb)
				}
				{
					func = training_1_1_query_orientation
					text = qs(0xd2915c27)
				}
			]}
	else
		training_1_1_start_holding_complete_vo
	endif
endscript

script training_1_1_start_holding_complete_vo 
	if screenelementexists \{id = popup_warning_container}
		destroy_popup_warning_menu
	endif
	create_training_pause_handler
	training_play_sound \{sound = 'Tut_Gtr_HoldGuitar_09_GTR'
		wait}
	change \{g_training_verifying_orientation_done = 1}
endscript

script training_1_1_holding_complete 
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	soundevent \{event = tutorial_mode_finish_chord}
	safe_destroy \{id = guitar_sprite}
	training_hide_lesson_header
	training_hide_narrator \{narrator = 'guitarist'}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	wait \{7
		seconds
		ignoreslomo}
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	training_play_sound \{sound = 'Tut_Gtr_HoldGuitar_10_GTR'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_1_2_show_guitar 
	<guitar_tex> = tutorial_guitar
	create_training_pause_handler
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = guitar_sprite
		just = [center center]
		texture = <guitar_tex>
		pos = (630.0, 400.0)
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 4
	}
	training_create_strum_sprites
	hide_strum_fingers
	safe_show \{id = strum_middle_sprite}
endscript

script training_1_2_show_guitar_vo 
	training_show_narrator \{narrator = 'guitarist'}
	training_play_sound \{sound = 'Tut_Gtr_GuitarTune_01_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
endscript

script training_create_fret_finger_sprites 
	wrist_pos = (455.0, 362.0)
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = hand_wrist
		just = [center center]
		texture = tutorial_hand_wrist
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
		texture = tutorial_hand_button_none
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
		texture = tutorial_hand_button_g
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
		texture = tutorial_hand_button_r
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
		texture = tutorial_hand_button_y
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
		texture = tutorial_hand_button_gr
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
		texture = tutorial_hand_button_gry
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

script training_1_2_show_fret_placement 
	training_create_fret_finger_sprites
	pose_fret_fingers \{color = none}
	spawnscriptnow \{training_animate_fret_fingers
		id = training_spawned_script}
	training_add_arrow \{id = training_arrow
		life = 8.0
		pos = (410.0, 360.0)
		scale = 0.7}
endscript

script training_1_2_show_fret_vo 
	training_play_sound \{sound = 'Tut_Gtr_GuitarTune_02_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
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
	legacydoscreenelementmorph id = <id> alpha = 1
	legacydoscreenelementmorph id = <hand_id> alpha = 1
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
	strum_pos = (815.0, 406.0)
	<strum_tex> = tutorial_guitar_strum
	<strum_up_tex> = tutorial_guitar_strum_up
	<strum_dn_tex> = tutorial_guitar_strum_dn
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = strum_middle_sprite
		just = [center center]
		texture = <strum_tex>
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
		texture = <strum_up_tex>
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
		texture = <strum_dn_tex>
		pos = <strum_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.4, 0.4)
		z_priority = 5
	}
	hand_strum_pos = (<strum_pos> + (95.0, -35.0))
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = hand_strum_middle_sprite
		just = [center center]
		texture = tutorial_hand_strum
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
		texture = tutorial_hand_strum_dn
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
		texture = tutorial_hand_strum_up
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

script training_1_2_show_strum 
	training_add_arrow \{id = training_strum_arrow
		life = 7
		pos = (850.0, 360.0)
		scale = 0.7}
	spawnscriptnow \{training_animate_strum_fingers
		id = training_spawned_script}
endscript

script training_1_2_show_strum_vo 
	training_play_sound \{sound = 'Tut_Gtr_GuitarTune_03_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
endscript

script training_1_2_show_lesson_header 
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x65d9a0c3)}
	training_add_lesson_body_text \{number = 1
		text = qs(0x04554c07)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x03d6a949)}
	training_set_task_header_body \{text = qs(0x8f5790ac)}
	training_show_lesson_header
endscript

script training_1_2_zoom_guitar_vo 
	training_play_sound \{sound = 'Tut_Gtr_GuitarTune_04_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
endscript

script training_1_2_zoom_guitar 
	change \{training_notes_strummed = [
			0
			0
			0
			0
			0
		]}
	change \{total_notes_strummed = 0}
	killspawnedscript \{name = training_animate_fret_fingers}
	killspawnedscript \{name = training_animate_strum_fingers}
	hide_strum_fingers
	hide_fret_fingers
	if screenelementexists \{id = guitar_sprite}
		guitar_sprite :se_setprops \{scale = (1.0, 1.0)
			pos = (1100.0, 400.0)
			time = 0.75}
	endif
	setmenuautorepeattimes \{(60.0, 60.0)}
	training_play_sound \{sound = 'Tut_Gtr_GuitarTune_05_GTR'
		wait}
	spawnscriptnow \{training_watch_buttons
		id = training_spawned_script}
endscript

script training_1_2_wait_for_tuning_complete 
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
	launchevent \{type = focus
		target = menu_tutorial}
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
	getheldpattern controller = ($player1_status.controller) player = 1 nobrokenstring
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
				<pos> = (($g_training_green_note_pos) + (1.0, 0.0) * (<note_played> * $g_training_guitar_note_offset))
				createscreenelement {
					parent = training_container
					type = spriteelement
					id = <note_tuned>
					just = [center center]
					texture = tutorial_checkmark
					pos = <pos>
					rgba = [255 255 255 255]
					scale = (0.5, 0.5)
					z_priority = 7
				}
				if (($total_notes_tuned = 1) || ($total_notes_tuned = 4))
					getrandomvalue \{name = random_value
						a = 0
						b = 10}
					training_play_positive \{who = guitarist}
				endif
			endif
			if ($total_notes_strummed >= 15)
				hide_pressed_notes
				change \{lesson_complete = 1}
			endif
		endif
	endif
endscript

script training_1_2_tuning_complete_message 
	training_play_sound \{sound = 'Tut_Gtr_GuitarTune_10_GTR'
		wait}
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
	training_hide_narrator \{narrator = 'guitarist'}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	wait \{7
		seconds
		ignoreslomo}
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_wait_for_gem_scroller_startup 
	begin
	getsongtime
	if gotparam \{disable_mic}
		change \{vocal_tut_mute = 1}
		vocals_mute_all_mics \{mute = true}
	endif
	if gotparam \{disable_star_power}
		change \{vocal_tut_no_star_power = 1}
	endif
	if (<songtime> > 0)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_1_3_start_gem_scroller 
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = tut_gtr_playnotes
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
	launchevent \{type = focus
		target = menu_tutorial}
	training_wait_for_gem_scroller_startup
endscript

script training_1_3_show_lesson 
	wait \{3.25
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xf912613c)}
	training_add_lesson_body_text \{number = 1
		text = qs(0x09a3e0ad)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x08959f93)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_play_sound \{sound = 'Tut_Gtr_PlayNotes_01_GTR'}
	wait \{3
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_PlayNotes_02_GTR'}
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (742.0, 370.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (525.0, 370.0)
			scale = 0.7}
	endif
	wait \{3.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_PlayNotes_03_GTR'}
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (886.0, 635.0)
			scale = 0.7
			rot = 90}
	else
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (380.0, 635.0)
			scale = 0.7
			rot = -90}
	endif
	wait \{3.5
		seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0xcc438487)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	wait \{1
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_PlayNotes_04_GTR'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_PlayNotes_05_GTR'
		wait}
	training_resume_gem_scroller
endscript
notes_hit = 0

script lesson1_hit_note 
	change notes_hit = ($notes_hit + 1)
	if (($notes_hit = 1) || ($notes_hit = 4))
		RandomNoRepeat (
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_01_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_02_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_03_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_04_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_05_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_06_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_07_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_08_GTR'}
			)
	endif
	training_display_notes_hit \{notes_hit = $notes_hit}
endscript

script lesson1_7_hit_note 
	getheldpattern controller = ($player1_status.controller) nobrokenstring
	if (<hold_pattern> = 1048576)
		change notes_hit = ($notes_hit + 1)
		if (($notes_hit = 1) || ($notes_hit = 3))
			training_play_positive \{who = bassist}
		endif
	endif
	training_display_notes_hit \{notes_hit = $notes_hit
		notes_required = 4}
endscript
notes_missed = 0

script lesson1_missed_note 
	change notes_missed = ($notes_missed + 1)
	if (($notes_missed = 3) || ($notes_missed = 6))
		training_play_sound \{sound = 'Tut_Gtr_PlayNotes_10_GTR'}
	endif
endscript

script lesson1_7_missed_note 
	if ((<array_entry> = 0) || (<array_entry> = 2) || (<array_entry> = 3) || (<array_entry> = 10) || ((<array_entry> >= 12) && (<array_entry> <= 15)) || (<array_entry> >= 22))
		change notes_missed = ($notes_missed + 1)
		if (($notes_missed = 2) || ($notes_missed = 4))
			training_play_sound \{sound = 'Tut_Gtr_OpenNotes_11_BAS'}
		endif
	endif
endscript
long_notes_missed = 0

script lesson4_check_long_note 
	if (<finished> = 1)
		printf \{channel = training
			'GOT LONG NOTE HIT'}
		change notes_hit = ($notes_hit + 1)
		if (($notes_hit = 1) || ($notes_hit = 4))
			training_play_positive \{who = guitarist}
		endif
	else
		change long_notes_missed = ($long_notes_missed + 1)
		if ($long_notes_missed = 2)
			training_play_sound \{sound = 'Tut_Gtr_LongNotes_11_GTR'}
		endif
	endif
	if ($notes_hit = 0)
		return
	endif
	training_display_notes_hit \{notes_hit = $notes_hit}
endscript

script training_1_3_wait_for_hit_notes 
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

script training_1_3_show_complete_message 
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	wait \{0.75
		seconds
		ignoreslomo}
	safe_destroy \{id = notes_hit_text}
	training_hide_lesson_header
	training_hide_narrator \{narrator = 'guitarist'}
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_PlayNotes_13_GTR'}
	wait \{7
		seconds
		ignoreslomo}
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_1_4_start_gem_scroller 
	change \{lesson_complete = 0}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = tut_gtr_diffnotes
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
	launchevent \{type = focus
		target = menu_tutorial}
	training_wait_for_gem_scroller_startup
	change \{notes_hit = 0}
	change \{notes_missed = 0}
endscript

script training_1_4_show_lesson 
	wait \{3.2
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x289ed7da)}
	training_add_lesson_body_text \{number = 1
		text = qs(0xa9b65c41)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x08959f93)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_play_sound \{sound = 'Tut_Gtr_DiffNotes_01_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (886.0, 635.0)
			scale = 0.7
			rot = 90}
	else
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (380.0, 635.0)
			scale = 0.7
			rot = -90}
	endif
	training_play_sound \{sound = 'Tut_Gtr_DiffNotes_02_GTR'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_DiffNotes_03_GTR'
		wait}
	training_set_task_header_body \{text = qs(0x887251b3)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	wait \{2
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_1_4_wait_for_lesson_complete 
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

script training_1_4_show_complete_message 
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	wait \{0.75
		seconds
		ignoreslomo}
	safe_destroy \{id = notes_hit_text}
	training_hide_lesson_header
	training_hide_narrator \{narrator = 'guitarist'}
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	training_play_sound \{sound = 'Tut_Gtr_DiffNotes_11_GTR'}
	wait \{7
		seconds
		ignoreslomo}
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_1_5_start_gem_scroller 
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = tut_gtr_longnotes
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
	launchevent \{type = focus
		target = menu_tutorial}
	change \{notes_hit = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_1_5_show_lesson 
	wait \{3.25
		seconds
		ignoreslowmo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0xb222a034)}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_add_lesson_body_text \{number = 1
		text = qs(0xa9b65c41)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x08959f93)}
	training_add_lesson_body_text \{number = 3
		text = qs(0xfe03719e)}
	training_show_lesson_header
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 3
			pos = (725.0, 380.0)
			scale = 0.7
			rot = -45}
	else
		training_add_arrow \{id = training_arrow
			life = 3
			pos = (545.0, 380.0)
			scale = 0.7
			rot = 45}
	endif
	training_play_sound \{sound = 'Tut_Gtr_LongNotes_01_GTR'
		wait}
	wait \{0.75
		seconds
		ignoreslomo}
	training_wait_for_sound \{sound = 'Tut_Gtr_LongNotes_02GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_wait_for_sound \{sound = 'Tut_Gtr_LongNotes_03GTR'
		wait}
	training_set_task_header_body \{text = qs(0x129cbe4d)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	wait \{2
		seconds
		ignoreslomo}
	training_resume_gem_scroller
	change \{long_notes_missed = 0}
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
	training_hide_narrator \{narrator = 'guitarist'}
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	unpausegh3sounds
	unpausegame
	training_play_sound \{sound = 'Tut_Gtr_LongNotes_13_GTR'}
	wait \{7
		seconds
		ignoreslomo}
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_1_6_start_gem_scroller 
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = tut_gtr_chords
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
	launchevent \{type = focus
		target = menu_tutorial}
	change \{notes_hit = 0}
	change \{notes_missed = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_1_6_show_lesson 
	wait \{3.25
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{number = qs(0x6dafe020)
		text = qs(0x7aa1a384)}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_add_lesson_body_text \{number = 1
		text = qs(0xfbe5589b)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x319cb4d8)}
	training_show_lesson_header
	training_play_sound \{sound = 'Tut_Gtr_Chords_01_GTR'
		wait}
	wait \{0.5
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
	training_play_sound \{sound = 'Tut_Gtr_Chords_02_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_Chords_03_GTR'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	training_wait_for_sound \{sound = 'Tut_Gtr_Chords_04_GTR'
		wait}
	training_set_task_header_body \{text = qs(0xe80992e4)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	wait \{2
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_1_6_show_complete_message 
	if screenelementexists \{id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	wait \{0.75
		seconds
		ignoreslomo}
	safe_destroy \{id = notes_hit_text}
	training_hide_lesson_header
	training_hide_narrator \{narrator = 'guitarist'}
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	training_play_sound \{sound = 'Tut_Gtr_Chords_12_GTR'
		wait}
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_1_7_start_gem_scroller 
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = tut_bass_opennote
		disable_hud
		no_score_update
		part = bass}
	killspawnedscript \{name = update_score_fast}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson1_7_hit_note}
		{missed_notep1 lesson1_7_missed_note}
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
	launchevent \{type = focus
		target = menu_tutorial}
	training_wait_for_gem_scroller_startup
endscript

script training_1_7_show_lesson 
	wait \{3.25
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{number = qs(0x74b4d161)
		text = qs(0x8cb5ea91)}
	training_add_lesson_body_text \{number = 1
		text = qs(0x55dec492)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x19facf5d)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_Gtr_OpenNotes_01_BAS'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 5.0
		pos = (650.0, 400.0)
		scale = 0.7
		rot = 45}
	training_play_sound \{sound = 'Tut_Gtr_OpenNotes_02_BAS'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_OpenNotes_03_BAS'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_OpenNotes_04_BAS'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0x0324f029)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 4}
	wait \{1
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_OpenNotes_05_BAS'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_1_7_wait_for_hit_notes 
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($notes_hit >= 4)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_1_7_show_complete_message 
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	wait \{0.75
		seconds
		ignoreslomo}
	safe_destroy \{id = notes_hit_text}
	training_hide_lesson_header
	training_hide_narrator \{narrator = 'bassist'}
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_OpenNotes_13_BAS'}
	wait \{7
		seconds
		ignoreslomo}
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_1_8_start_gem_scroller 
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = tut_bass_opennote
		part = bass}
	killspawnedscript \{name = update_score_fast}
	training_wait_for_gem_scroller_startup
	wait \{0.5
		seconds
		ignorelsomo}
	training_pause_gem_scroller
endscript

script training_1_8_show_hud 
	training_1_8_start_gem_scroller
	training_set_lesson_header_text \{number = qs(0xf32ccdae)
		text = qs(0xd049d44d)}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_Gtr_UI_01_BAS'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	change \{current_num_players = 1}
	player_text = 'p1'
	player_status = player1_status
	player = 1
	change \{structurename = player1_status
		current_health = 1.0}
	spawnscriptlater update_score_fast params = {<...>} id = training_spawned_script
	change \{tutorial_disable_hud = 0}
	update_hud_layout
	debug_refresh_hud
	wait \{1.5
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow2
		life = 6
		pos = (300.0, 500.0)
		scale = 0.7
		rot = 45}
	training_play_sound \{sound = 'Tut_Gtr_UI_02_BAS'}
	wait \{2.0
		seconds
		ignoreslomo}
	training_add_lesson_body_text \{number = 1
		text = qs(0x8ab3f5ed)}
	wait \{3.5
		seconds
		ignoreslomo}
	killspawnedscript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 1.6
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 2
		text = qs(0x3b4b0d81)}
	training_play_sound \{sound = 'Tut_Gtr_UI_03_BAS'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	killspawnedscript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 0.4
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 3
		text = qs(0xec12d4ac)}
	training_play_sound \{sound = 'Tut_Gtr_UI_04_BAS'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	killspawnedscript \{name = training_set_health}
	training_start_hud_flashing_red
	training_add_lesson_body_text \{number = 4
		text = qs(0x19160b97)}
	training_play_sound \{sound = 'Tut_Gtr_UI_05_BAS'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_UI_06_BAS'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_stop_hud_flashing_red
	training_add_arrow \{id = training_arrow2
		life = 4
		pos = (1000.0, 500.0)
		scale = 0.7
		rot = -45}
	training_add_lesson_body_text \{number = 5
		text = qs(0xe9857154)}
	training_play_sound \{sound = 'Tut_Gtr_UI_07_BAS'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	training_hide_narrator \{narrator = 'bassist'}
endscript

script training_1_8_hide_hud 
	training_destroy_gem_scroller
	training_resume_gem_scroller
	player_text = 'p1'
	player_status = player1_status
	destroy_band_hud
	destroy_hud player_text = <player_text> player = 1
	killspawnedscript \{name = update_score_fast}
	training_hide_lesson_header
	training_hide_narrator \{narrator = 'bassist'}
endscript

script training_1_8_complete 
	killspawnedscript \{name = training_set_health}
	soundevent \{event = tutorial_mode_finish_chord}
	destroy_all_exploding_text
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0x8dffa09f)
			text_physics = 0
			placement = top
		}}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'complete_text'
			text = qs(0x232d1eaf)
			text_physics = 0
			placement = bottom
		}}
	training_play_sound \{sound = 'Tut_Gtr_UI_08_BAS'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_UI_09_BAS'
		wait}
	training_hide_narrator \{narrator = 'bassist'}
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_basic_tutorial_1_end 
	if ($g_training_lessons_completed = 8)
		setglobaltags \{training
			params = {
				basic_lesson = complete
			}}
	endif
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
	training_check_for_all_tutorials_finished
	decide_tutorial_back_destination
endscript

script create_pressed_note_sprites 
	<x_offset> = $g_training_guitar_note_offset
	<green_pos> = $g_training_green_note_pos
	<red_pos> = (<green_pos> + ((1.0, 0.0) * <x_offset>))
	<yellow_pos> = (<red_pos> + ((1.0, 0.0) * <x_offset>))
	<blue_pos> = (<yellow_pos> + ((1.0, 0.0) * <x_offset>))
	<orange_pos> = (<blue_pos> + ((1.0, 0.0) * <x_offset>))
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = green_pressed_sprite
		just = [center center]
		texture = tutorial_tune_button_hit_green
		pos = <green_pos>
		scale = 1.7
		z_priority = 5
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = red_pressed_sprite
		just = [center center]
		texture = tutorial_tune_button_hit_red
		pos = <red_pos>
		scale = 1.7
		z_priority = 5
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = yellow_pressed_sprite
		just = [center center]
		texture = tutorial_tune_button_hit_yellow
		pos = <yellow_pos>
		scale = 1.7
		z_priority = 5
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = blue_pressed_sprite
		just = [center center]
		texture = tutorial_tune_button_hit_blue
		pos = <blue_pos>
		scale = 1.7
		z_priority = 5
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = orange_pressed_sprite
		just = [center center]
		texture = tutorial_tune_button_hit_orange
		pos = <orange_pos>
		scale = 1.7
		z_priority = 5
	}
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
		<id> = hit_green_sprite
		<tex> = tutorial_tune_button_hit_green
		case 1
		<id> = hit_red_sprite
		<tex> = tutorial_tune_button_hit_red
		case 2
		<id> = hit_yellow_sprite
		<tex> = tutorial_tune_button_hit_yellow
		case 3
		<id> = hit_blue_sprite
		<tex> = tutorial_tune_button_hit_blue
		case 4
		<id> = hit_orange_sprite
		<tex> = tutorial_tune_button_hit_orange
	endswitch
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
	<pos> = (($g_training_green_note_pos) + (1.0, 0.0) * (<note> * $g_training_guitar_note_offset))
	<scale> = 1.7
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = <id>
		just = [center center]
		texture = <tex>
		pos = <pos>
		scale = <scale>
		z_priority = 6
	}
	<id> :se_setprops {
		scale = (<scale> * 2.0)
		alpha = 0
		time = 0.25
	}
endscript

script training_watch_buttons 
	create_pressed_note_sprites
	begin
	getheldpattern controller = ($player1_status.controller) player = 1 nobrokenstring
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
