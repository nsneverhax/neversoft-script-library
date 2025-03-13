training_drums_hit = [
	0
	0
	0
	0
	0
]
total_drums_hit = 0
total_drums_complete = 0
drum_notes_hit = 0
drum_notes_missed = 0
training_kick_drum_hit = 0
training_drum_basic_tutorial_script = [
	{
		call = training_drum_basic_tutorial_startup
	}
	{
		time = 1000
		call = training_drum_basic_tutorial_show_title
	}
	{
		lesson = 1
		call = drum_training_1_1_show_lesson_header
	}
	{
		call = drum_training_1_1_show_holding_sticks_image
	}
	{
		call = drum_training_1_1_complete_message
	}
	{
		lesson = 2
		call = drum_training_1_2_show_lesson_header
	}
	{
		call = drum_training_1_2_show_drum_image
	}
	{
		call = drum_training_1_2_add_play_each_note_task
	}
	{
		call = drum_training_1_2_complete_message
	}
	{
		lesson = 3
		call = drum_training_1_3_show_lesson_header
	}
	{
		call = drum_training_1_3_show_highway
	}
	{
		call = drum_training_1_3_show_items_on_highway
	}
	{
		call = drum_training_1_3_add_play_each_note_task
	}
	{
		call = drum_training_1_3_complete_message
	}
	{
		lesson = 4
		call = drum_training_1_4_show_lesson_header
	}
	{
		call = drum_training_1_4_show_highway
	}
	{
		call = drum_training_1_4_show_items_on_highway
	}
	{
		call = drum_training_1_4_add_play_each_note_task
	}
	{
		call = drum_training_1_4_complete_message
	}
	{
		lesson = 5
		call = drum_training_1_5_show_lesson_header
	}
	{
		call = drum_training_1_5_show_drum_image
	}
	{
		call = drum_training_1_5_add_play_each_note_task
	}
	{
		call = drum_training_1_5_complete_message
	}
	{
		lesson = 6
		call = drum_training_1_6_show_lesson_header
	}
	{
		call = drum_training_1_6_show_highway
	}
	{
		call = drum_training_1_6_add_play_each_note_task
	}
	{
		call = drum_training_1_6_point_out_freeform_section
	}
	{
		call = drum_training_1_6_complete_message
	}
	{
		lesson = 7
		call = drum_training_1_7_show_lesson_header
	}
	{
		call = drum_training_1_7_show_highway
	}
	{
		call = drum_training_1_7_show_rock_meter
	}
	{
		call = drum_training_1_7_point_out_score
	}
	{
		call = drum_training_1_7_complete_message
	}
	{
		lesson = 8
		call = drum_training_1_8_show_lesson_header
	}
	{
		call = drum_training_1_8_show_highway
	}
	{
		call = drum_training_1_8_show_items_on_highway
	}
	{
		call = drum_training_1_8_add_play_each_note_task
	}
	{
		call = drum_training_1_8_complete_message
	}
	{
		call = drum_training_basic_tutorial_end
	}
]

script training_drum_basic_tutorial_startup 
	printf \{qs(0x3684767d)}
	training_init_session
	launchevent \{type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_drum_basic_tutorial_show_title 
	change \{g_training_lessons_completed = 0}
	printf \{qs(0x09d4a8ac)}
	training_show_title \{title = qs(0x71d9ad3c)}
	begin
	if ($transitions_locked = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	wait \{3
		seconds}
	training_destroy_title
endscript

script drum_training_1_1_show_lesson_header 
	printf \{qs(0xf9af5ba1)}
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x2b55e6e2)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_1_create_sticks 
	printf \{qs(0xaf6fe1d7)}
	createscreenelement \{parent = training_container
		type = spriteelement
		id = stick_sprite_up
		just = [
			center
			center
		]
		texture = tutorial_drum_hand_up
		pos = (630.0, 460.0)
		scale = (0.75, 0.75)
		z_priority = 4}
	safe_hide id = <id>
	createscreenelement \{parent = training_container
		type = spriteelement
		id = stick_sprite_down
		just = [
			center
			center
		]
		texture = tutorial_drum_hand_down
		pos = (630.0, 460.0)
		scale = (0.75, 0.75)
		z_priority = 4}
	safe_hide id = <id>
	createscreenelement \{parent = training_container
		type = spriteelement
		id = two_hand_stick_sprite
		just = [
			center
			center
		]
		texture = tutorial_drum_2hands
		pos = (630.0, 460.0)
		scale = (1.0, 1.0)
		z_priority = 4}
endscript

script drum_training_1_1_animate_sticks 
	printf \{qs(0x337a8c56)}
	safe_hide \{id = two_hand_stick_sprite}
	begin
	safe_hide \{id = stick_sprite_down}
	safe_show \{id = stick_sprite_up}
	wait \{1
		seconds}
	safe_hide \{id = stick_sprite_up}
	safe_show \{id = stick_sprite_down}
	play_drum_sample \{pad = snare
		velocity = 70}
	wait \{1
		seconds}
	repeat 6
	safe_hide \{id = stick_sprite_down}
	safe_show \{id = stick_sprite_up}
endscript

script drum_training_1_1_show_holding_sticks_image 
	printf \{qs(0x8c6cd4b0)}
	spawnscriptnow \{drum_training_1_1_create_sticks
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_HoldSticks_01_DRM'
		wait}
	training_hide_narrator
	spawnscriptnow \{drum_training_1_1_animate_sticks
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_HoldSticks_02_DRM'
		wait}
	training_play_sound \{sound = 'Tut_Dru_HoldSticks_03_DRM'
		wait}
	training_hide_narrator
	safe_destroy \{id = two_hand_stick_sprite}
	safe_destroy \{id = stick_sprite_up}
	safe_destroy \{id = stick_sprite_down}
endscript

script drum_training_1_1_complete_message 
	printf \{qs(0x399f3831)}
	training_generic_lesson_complete
endscript

script drum_training_1_2_show_lesson_header 
	printf \{qs(0xd313eb29)}
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x5de762e5)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_2_create_drum_hit_sprites 
	printf \{qs(0xbe281a74)}
	createscreenelement \{parent = drumkit_sprite
		type = spriteelement
		id = drum_hit_0
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			0
			107
			51
			255
		]
		pos = (335.0, 173.0)
		scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
	createscreenelement \{parent = drumkit_sprite
		type = spriteelement
		id = drum_hit_1
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			0
			160
			198
			255
		]
		pos = (253.0, 159.0)
		scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
	createscreenelement \{parent = drumkit_sprite
		type = spriteelement
		id = drum_hit_2
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			255
			191
			0
			255
		]
		pos = (198.0, 108.0)
		scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
	createscreenelement \{parent = drumkit_sprite
		type = spriteelement
		id = drum_hit_3
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			191
			0
			0
			255
		]
		pos = (152.0, 175.0)
		scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
	createscreenelement \{parent = drumkit_sprite
		type = spriteelement
		id = drum_hit_4
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			1
			83
			83
			255
		]
		pos = (344.0, 89.0)
		scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
endscript

script drum_training_1_2_wait_for_drum_test_complete 
	printf \{qs(0x24776d4d)}
	training_show_task_header
	change \{training_drums_hit = [
			0
			0
			0
			0
			0
		]}
	change \{total_drums_hit = 0}
	change \{total_drums_complete = 0}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	getplatform
	if (<platform> = xenon)
		event_handlers = [
			{pad_btn_bottom training_hit_drum params = {index = 0}}
			{pad_btn_left training_hit_drum params = {index = 1}}
			{pad_btn_top training_hit_drum params = {index = 2}}
			{pad_btn_right training_hit_drum params = {index = 3}}
			{pad_r1 training_hit_drum params = {index = 4}}
			{pad_start show_training_pause_screen}
		]
	elseif (<platform> = ps3)
		event_handlers = [
			{pad_btn_bottom training_hit_drum params = {index = 0}}
			{pad_btn_top training_hit_drum params = {index = 1}}
			{pad_btn_left training_hit_drum params = {index = 2}}
			{pad_btn_right training_hit_drum params = {index = 3}}
			{pad_r1 training_hit_drum params = {index = 4}}
			{pad_start show_training_pause_screen}
		]
	else
		scriptassert \{qs(0x34a7da06)}
	endif
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
	setmenuautorepeattimes \{(0.3, 0.05)}
endscript

script training_hit_drum \{velocity = 127}
	printf \{qs(0xa3734e48)}
	formattext checksumname = drum_hit 'drum_hit_%i' i = <index>
	if ($training_drums_hit [<index>] < 4)
		setarrayelement arrayname = training_drums_hit globalarray index = <index> newvalue = ($training_drums_hit [<index>] + 1)
		change total_drums_hit = ($total_drums_hit + 1)
		<drum_hit> :se_setprops {
			scale = (0.0)
			alpha = 1.0
		}
		<drum_hit> :se_setprops {
			scale = (1.5)
			alpha = 0.0
			time = 0.25
		}
		getdrumhitvelocity \{player = 1}
		switch <drum_hit>
			case drum_hit_0
			printf \{qs(0xc660cf08)}
			play_drum_sample pad = tom2 velocity = <velocity>
			case drum_hit_1
			printf \{qs(0xdf7bfe49)}
			play_drum_sample pad = tom1 velocity = <velocity>
			case drum_hit_2
			printf \{qs(0xf456ad8a)}
			play_drum_sample pad = hihat velocity = <velocity>
			case drum_hit_3
			printf \{qs(0xed4d9ccb)}
			play_drum_sample pad = snare velocity = <velocity>
			case drum_hit_4
			printf \{qs(0xa20c0a0c)}
			play_drum_sample pad = cymbal velocity = <velocity>
		endswitch
		if ($training_drums_hit [<index>] = 4)
			change total_drums_complete = ($total_drums_complete + 1)
			getscreenelementposition id = <drum_hit>
			<checkmark_offset> = (50.0, 45.0)
			createscreenelement {
				parent = drumkit_sprite
				type = spriteelement
				just = [center center]
				texture = tutorial_checkmark
				pos = (<screenelementpos> + <checkmark_offset>)
				scale = (0.6, 0.6)
				z_priority = 7
			}
			if (($total_drums_complete = 1) || ($total_drums_complete = 3))
				getrandomvalue \{name = random_value
					a = 0
					b = 10}
				if (<random_value> < 5)
					training_play_sound \{sound = 'Tut_Dru_Positive_01_DRM'}
				else
					training_play_sound \{sound = 'Tut_Dru_Positive_02_DRM'}
				endif
			endif
		endif
		if ($total_drums_hit >= 20)
			change \{lesson_complete = 1}
		endif
	endif
endscript

script drum_training_1_2_show_drum_image 
	printf \{qs(0xb20cb3f6)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_DrumTest_01_DRM'
		wait}
	training_hide_narrator
	getplatform
	if (<platform> = xenon)
		<drum_kit_texture> = tutorial_drumkit
	elseif (<platform> = ps3)
		<drum_kit_texture> = tutorial_drumkit_ps3
	else
		scriptassert \{qs(0x34a7da06)}
	endif
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = drumkit_sprite
		just = [center center]
		texture = <drum_kit_texture>
		pos = (640.0, 490.0)
		scale = (0.9, 0.9)
		z_priority = 4
	}
	drum_training_1_2_create_drum_hit_sprites
endscript

script drum_training_1_2_add_play_each_note_task 
	printf \{qs(0x41deade0)}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0xb20e9844)}
	training_add_lesson_body_text \{number = qs(0x09c32524)
		text = qs(0x6cff1051)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_DrumTest_02_DRM'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Dru_DrumTest_03_DRM'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Dru_DrumTest_04_DRM'
		wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0xf96eea14)}
	training_show_task_header
	drum_training_1_2_wait_for_drum_test_complete
	training_hide_lesson_header
	wait \{0.25
		seconds
		ignoreslomo}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_DrumTest_05_DRM'
		wait}
	training_hide_narrator
	safe_destroy \{id = drumkit_sprite}
endscript

script drum_training_1_2_complete_message 
	printf \{qs(0x5d7f43cf)}
	training_generic_lesson_complete
endscript

script drum_training_1_3_show_lesson_header 
	printf \{qs(0x7c57796e)}
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xe882cc3f)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_3_show_highway 
	printf \{qs(0x90166274)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_OneHand_01_DRM'
		wait}
	training_hide_narrator
	setplayerinfo \{1
		four_lane_highway = 0}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_drum_onehand
		part = drum
		disable_hud
		no_score_update}
	killspawnedscript \{name = update_score_fast}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 drum_training_1_3_hit_note}
		{missed_notep1 drum_training_1_3_missed_note}
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

script drum_training_1_3_hit_note 
	printf \{qs(0x42a02ff8)}
	change drum_notes_hit = ($drum_notes_hit + 1)
	if (($drum_notes_hit = 1) || ($drum_notes_hit = 4))
		Random (
			@ training_play_sound \{sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	training_display_notes_hit \{notes_hit = $drum_notes_hit}
endscript

script drum_training_1_3_missed_note 
	printf \{qs(0x4f97582f)}
	change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 3) || ($drum_notes_missed = 6))
		Random (
			@ training_play_sound \{sound = 'Tut_Dru_OneHand_07_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_OneHand_08_DRM'}
			)
	endif
endscript

script drum_training_1_3_wait_for_hit_notes 
	printf \{qs(0x0e22e6eb)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 8)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_3_show_items_on_highway 
	printf \{qs(0x6e6d4bf0)}
	wait \{3.6
		seconds}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_OneHand_02_DRM'
		wait}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0xbe25479c)}
	training_show_lesson_header
	training_play_sound \{sound = 'Tut_Dru_OneHand_03_DRM'
		wait}
	training_hide_narrator
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (735.0, 360.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (545.0, 360.0)
			scale = 0.7}
	endif
	wait \{0.5
		seconds
		ignoreslomo}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_OneHand_04_DRM'
		wait}
	training_hide_narrator
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (900.0, 635.0)
			scale = 0.7
			rot = 90}
	else
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (380.0, 635.0)
			scale = 0.7
			rot = -90}
	endif
	wait \{2
		seconds
		ignoreslomo}
endscript

script drum_training_1_3_add_play_each_note_task 
	printf \{qs(0xc5efb411)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_OneHand_05_DRM'
		wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x34724d03)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	change \{drum_notes_hit = 0}
	change \{drum_notes_missed = 0}
	training_destroy_all_arrows
	training_resume_gem_scroller
	drum_training_1_3_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_OneHand_06_DRM'
		wait}
	training_hide_narrator
endscript

script drum_training_1_3_complete_message 
	printf \{qs(0xc80f975a)}
	safe_destroy \{id = notes_hit_text}
	training_generic_lesson_complete
endscript

script drum_training_1_4_show_lesson_header 
	printf \{qs(0x866a8a39)}
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0xf401a3bd)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_4_hit_note 
	printf \{qs(0xa3e4896b)}
	change drum_notes_hit = ($drum_notes_hit + 1)
	if (($drum_notes_hit = 1) || ($drum_notes_hit = 4))
		Random (
			@ training_play_sound \{sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	training_display_notes_hit \{notes_hit = $drum_notes_hit}
endscript

script drum_training_1_4_missed_note 
	printf \{qs(0x97542309)}
	change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 3) || ($drum_notes_missed = 6))
		Random (
			@ training_play_sound \{sound = 'Tut_Dru_TwoHand_07_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_TwoHand_08_DRM'}
			)
	endif
endscript

script drum_training_1_4_wait_for_hit_notes 
	printf \{qs(0xf41f15bc)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 8)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_4_show_highway 
	printf \{qs(0x941f9127)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_TwoHands_01_DRM'
		wait}
	training_hide_narrator
	setplayerinfo \{1
		four_lane_highway = 0}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_drum_twohands
		part = drum
		disable_hud
		no_score_update}
	killspawnedscript \{name = update_score_fast}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{drum_multi_hitp1 drum_training_1_4_hit_note}
		{missed_notep1 drum_training_1_4_missed_note}
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

script drum_training_1_4_show_items_on_highway 
	printf \{qs(0xca608f48)}
	wait \{3.6
		seconds}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_TwoHands_02_DRM'
		wait}
	training_hide_narrator
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x3b014d52)}
	training_show_lesson_header
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 7.0
			pos = (735.0, 360.0)
			scale = 0.7}
		training_add_arrow \{id = training_arrow
			life = 7.0
			pos = (685.0, 360.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (545.0, 360.0)
			scale = 0.7}
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (595.0, 360.0)
			scale = 0.7}
	endif
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_TwoHands_03_DRM'
		wait}
	training_hide_narrator
endscript

script drum_training_1_4_add_play_each_note_task 
	printf \{qs(0xef9af544)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_TwoHands_04_DRM'
		wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x42f095cc)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	change \{drum_notes_hit = 0}
	change \{drum_notes_missed = 0}
	training_destroy_all_arrows
	training_resume_gem_scroller
	drum_training_1_4_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_TwoHands_06_DRM'
		wait}
	training_hide_narrator
endscript

script drum_training_1_4_complete_message 
	printf \{qs(0x94bfb433)}
	safe_destroy \{id = notes_hit_text}
	training_generic_lesson_complete
endscript

script drum_training_1_5_show_lesson_header 
	printf \{qs(0x292e187e)}
	training_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0xdb9d08fe)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_5_create_kick_sprites 
	printf \{qs(0x2e2679f9)}
	createscreenelement \{parent = training_container
		type = spriteelement
		id = kick_foot_sprite_up
		just = [
			center
			center
		]
		texture = tutorial_kickpedal_foot
		pos = (630.0, 450.0)
		scale = (0.75, 0.75)
		z_priority = 4}
	safe_hide id = <id>
	createscreenelement \{parent = training_container
		type = spriteelement
		id = kick_sprite_up
		just = [
			center
			center
		]
		texture = tutorial_kickpedal_up
		pos = (630.0, 450.0)
		scale = (0.75, 0.75)
		z_priority = 4}
	safe_hide id = <id>
	createscreenelement \{parent = training_container
		type = spriteelement
		id = kick_foot_sprite_down
		just = [
			center
			center
		]
		texture = tutorial_kickpedal_foot
		pos = (630.0, 470.0)
		scale = (0.75, 0.75)
		z_priority = 4
		rot_angle = -10}
	createscreenelement \{parent = training_container
		type = spriteelement
		id = kick_sprite_down
		just = [
			center
			center
		]
		texture = tutorial_kickpedal_down
		pos = (630.0, 450.0)
		scale = (0.75, 0.75)
		z_priority = 4}
endscript

script drum_training_1_5_create_kick_with_no_foot_sprites 
	printf \{qs(0x6167cb00)}
	createscreenelement \{parent = training_container
		type = spriteelement
		id = kick_nofoot_sprite_down
		just = [
			center
			center
		]
		texture = tutorial_kickpedal_down
		pos = (630.0, 450.0)
		scale = (0.75, 0.75)
		z_priority = 4}
	safe_hide id = <id>
	createscreenelement \{parent = training_container
		type = spriteelement
		id = kick_nofoot_sprite_up
		just = [
			center
			center
		]
		texture = tutorial_kickpedal_up
		pos = (630.0, 450.0)
		scale = (0.75, 0.75)
		z_priority = 4}
endscript

script drum_training_1_5_animate_kicks 
	printf \{qs(0x897b336c)}
	wait \{1.5
		seconds}
	begin
	safe_hide \{id = kick_sprite_down}
	safe_hide \{id = kick_foot_sprite_down}
	safe_show \{id = kick_sprite_up}
	safe_show \{id = kick_foot_sprite_up}
	wait \{0.5
		seconds}
	safe_hide \{id = kick_sprite_up}
	safe_hide \{id = kick_foot_sprite_up}
	safe_show \{id = kick_sprite_down}
	safe_show \{id = kick_foot_sprite_down}
	wait \{0.5
		seconds}
	repeat 3
endscript

script drum_training_1_5_show_drum_image 
	printf \{qs(0x4d830474)}
	spawnscriptnow \{drum_training_1_5_create_kick_sprites
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_KickPedal_01_DRM'
		wait}
	wait \{0.5
		seconds}
	training_play_sound \{sound = 'Tut_Dru_KickPedal_02_DRM'
		wait}
	wait \{0.5
		seconds}
	training_play_sound \{sound = 'Tut_Dru_KickPedal_03_DRM'
		wait}
	wait \{0.5
		seconds}
	spawnscriptnow \{drum_training_1_5_animate_kicks
		id = training_spawned_script}
	training_play_sound \{sound = 'Tut_Dru_KickPedal_04_DRM'
		wait}
	training_hide_narrator
	killspawnedscript \{name = drum_training_1_5_animate_kicks}
	safe_hide \{id = kick_sprite_up}
	safe_hide \{id = kick_sprite_down}
	safe_hide \{id = kick_foot_sprite_down}
	safe_hide \{id = kick_foot_sprite_up}
endscript

script drum_training_1_5_create_kick_drum_hit_sprites 
	printf \{qs(0xea200db2)}
	createscreenelement \{parent = kick_nofoot_sprite_down
		type = spriteelement
		id = kick_drum_hit
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			80
			0
			80
			255
		]
		pos = (118.0, 333.0)
		scale = (2.0, 2.0)
		z_priority = 5
		alpha = 0.0}
endscript

script drum_training_1_5_wait_for_drum_test_complete 
	printf \{qs(0x0b5345f5)}
	training_show_task_header
	change \{training_kick_drum_hit = 0}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_l1 training_hit_kick_drum}
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
	setmenuautorepeattimes \{(0.3, 0.05)}
endscript

script training_hit_kick_drum \{velocity = 127}
	printf \{qs(0x2289393a)}
	change training_kick_drum_hit = ($training_kick_drum_hit + 1)
	safe_hide \{id = kick_nofoot_sprite_up}
	safe_show \{id = kick_nofoot_sprite_down}
	play_drum_sample pad = kick velocity = <velocity>
	kick_drum_hit :se_setprops {
		scale = (0.0)
		alpha = 1.0
	}
	kick_drum_hit :se_setprops {
		scale = (4.0)
		alpha = 0.0
		time = 0.25
	}
	if (($training_kick_drum_hit = 1) || ($training_kick_drum_hit = 3))
		Random (
			@ training_play_sound \{sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	wait \{0.5
		seconds}
	safe_show \{id = kick_nofoot_sprite_up}
	safe_hide \{id = kick_nofoot_sprite_down}
	if ($training_kick_drum_hit >= 4)
		change \{lesson_complete = 1}
	endif
endscript

script drum_training_1_5_add_play_each_note_task 
	printf \{qs(0x6babecb5)}
	spawnscriptnow \{drum_training_1_5_create_kick_with_no_foot_sprites
		id = training_spawned_script}
	spawnscriptnow \{drum_training_1_5_create_kick_drum_hit_sprites
		id = training_spawned_script}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x6cc22c8c)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_KickPedal_05_DRM'
		wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x93509ecb)}
	training_show_task_header
	drum_training_1_5_wait_for_drum_test_complete
	training_hide_lesson_header
	safe_hide \{id = kick_nofoot_sprite_up}
	safe_hide \{id = kick_nofoot_sprite_down}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_KickPedal_06_DRM'
		wait}
	training_hide_narrator
	safe_destroy \{id = kick_drum_hit}
endscript

script drum_training_1_5_complete_message 
	printf \{qs(0x01cf60a6)}
	training_generic_lesson_complete
endscript

script drum_training_1_6_show_lesson_header 
	printf \{qs(0x0392a8f6)}
	training_set_lesson_header_text \{number = qs(0x6dafe020)
		text = qs(0x58337f8c)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_6_show_highway 
	printf \{qs(0x97746b1d)}
	setplayerinfo \{1
		four_lane_highway = 0}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_drum_kick
		part = drum
		disable_hud
		no_score_update}
	killspawnedscript \{name = update_score_fast}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 drum_training_1_6_hit_note}
		{missed_notep1 drum_training_1_6_missed_note}
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

script drum_training_1_6_hit_note 
	printf \{qs(0x692affe7)}
	change drum_notes_hit = ($drum_notes_hit + 1)
	if (($drum_notes_hit = 1) || ($drum_notes_hit = 4))
		Random (
			@ training_play_sound \{sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	training_display_notes_hit \{notes_hit = $drum_notes_hit}
endscript

script drum_training_1_6_missed_note 
	printf \{qs(0x821e6866)}
	change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 3) || ($drum_notes_missed = 6))
		Random (
			@ training_play_sound \{sound = 'Tut_Dru_AddKick_05_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_AddKick_06_DRM'}
			)
	endif
endscript

script drum_training_1_6_wait_for_hit_notes 
	printf \{qs(0x71e73773)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 8)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_6_spawn_delayed_strike_line_arrow 
	printf \{qs(0x8561c906)}
	wait \{2.5
		seconds
		ignoreslomo}
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (900.0, 635.0)
			scale = 0.7
			rot = 90}
	else
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (380.0, 635.0)
			scale = 0.7
			rot = -90}
	endif
endscript

script drum_training_1_6_add_play_each_note_task 
	printf \{qs(0x3c89c0e7)}
	wait \{3.6
		seconds}
	training_pause_gem_scroller
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (780.0, 360.0)
			scale = 0.7
			rot = 90}
	else
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (500.0, 380.0)
			scale = 0.7
			rot = -90}
	endif
	spawnscriptnow \{drum_training_1_6_spawn_delayed_strike_line_arrow
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_KickSong_01_DRM'
		wait}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0xeedc0e5a)}
	training_show_lesson_header
	training_play_sound \{sound = 'Tut_Dru_KickSong_02_DRM'
		wait}
	training_hide_narrator
	training_destroy_all_arrows
	training_set_task_header_body \{text = qs(0x34724d03)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	change \{drum_notes_hit = 0}
	change \{drum_notes_missed = 0}
	training_resume_gem_scroller
	drum_training_1_6_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
endscript

script drum_training_1_6_spawn_freeform_highway 
	printf \{qs(0xaec3bfd2)}
	setplayerinfo \{1
		four_lane_highway = 0}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_drum_free
		part = drum
		disable_hud
		no_score_update}
	killspawnedscript \{name = update_score_fast}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{drumfill_hitp1 drum_training_1_6_b_hit_note}
		{missed_notep1 drum_training_1_6_b_missed_note}
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
	wait \{4.0
		seconds
		ignoreslomo}
	training_pause_gem_scroller
endscript

script drum_training_1_6_b_hit_note 
	printf \{qs(0xa8436376)}
	change drum_notes_hit = ($drum_notes_hit + 1)
	if (($drum_notes_hit = 12) || ($drum_notes_hit = 24))
		Random (
			@ training_play_sound \{sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	training_display_notes_hit \{notes_hit = $drum_notes_hit
		notes_required = 32}
endscript

script drum_training_1_6_b_missed_note 
	printf \{qs(0x9691236f)}
	change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 3) || ($drum_notes_missed = 6))
		Random (
			@ training_play_sound \{sound = 'Tut_Dru_AddKick_05_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_AddKick_06_DRM'}
			)
	endif
endscript

script drum_training_1_6_b_wait_for_hit_notes 
	printf \{qs(0x8989a1e3)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 32)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_6_point_out_freeform_section 
	printf \{qs(0x61fdea94)}
	spawnscriptnow \{drum_training_1_6_spawn_freeform_highway
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_Impro_01_DRM'
		wait}
	wait \{4
		seconds}
	training_add_arrow \{id = training_arrow2
		life = 3
		pos = (500.0, 375.0)
		scale = 0.7
		rot = -90}
	training_play_sound \{sound = 'Tut_Dru_Impro_02_DRM'
		wait}
	training_hide_narrator
	training_clear_lesson_body_text
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x09037c01)}
	training_show_lesson_header
	training_play_sound \{sound = 'Tut_Dru_TwoHands_05_DRM'
		wait}
	training_hide_narrator
	training_destroy_all_arrows
	training_set_task_header_body \{text = qs(0x4ce28461)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 32}
	change \{drum_notes_hit = 0}
	change \{drum_notes_missed = 0}
	training_resume_gem_scroller
	drum_training_1_6_b_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_KickSong_03_DRM'
		wait}
	training_hide_narrator
endscript

script drum_training_1_6_complete_message 
	printf \{qs(0x652f1b58)}
	training_generic_lesson_complete
endscript

script drum_training_1_7_show_lesson_header 
	printf \{qs(0xacd63ab1)}
	training_set_lesson_header_text \{number = qs(0x74b4d161)
		text = qs(0x9612e33c)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_7_show_highway 
	printf \{qs(0x96c19600)}
	setplayerinfo \{1
		four_lane_highway = 0}
	change \{tutorial_disable_hud = 0}
	training_start_gem_scroller \{song = tut_demo
		part = drum}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
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
	training_set_score \{score = 100805}
	training_wait_for_gem_scroller_startup
endscript

script drum_training_1_7_show_rock_meter 
	printf \{qs(0xd6817b2d)}
	wait \{3.6
		second}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_UI_01_DRM'
		wait}
	training_hide_narrator
	change \{current_num_players = 1}
	training_add_arrow \{id = training_arrow2
		life = 2
		pos = (375.0, 500.0)
		scale = 0.7
		rot = 90}
	training_add_lesson_body_text \{number = 1
		text = qs(0x8ab3f5ed)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_UI_02_DRM'
		wait}
	training_hide_narrator
	killspawnedscript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 1.6
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 2
		text = qs(0x3b4b0d81)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_UI_03_DRM'
		wait}
	training_hide_narrator
	killspawnedscript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 0.4
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 3
		text = qs(0xec12d4ac)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_UI_04_DRM'
		wait}
	training_hide_narrator
	training_start_hud_flashing_red
	training_add_lesson_body_text \{number = 4
		text = qs(0x19160b97)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_UI_05_DRM'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Dru_UI_06_DRM'
		wait}
	training_hide_narrator
	training_stop_hud_flashing_red
endscript

script drum_training_1_7_point_out_score 
	printf \{qs(0xfa796782)}
	killspawnedscript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 1.0
		}
		id = training_spawned_script}
	training_add_arrow \{id = training_arrow2
		life = 2
		pos = (380.0, 580.0)
		scale = 0.7
		rot = 90}
	training_add_lesson_body_text \{number = 5
		text = qs(0xe9857154)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_UI_07_DRM'
		wait}
	training_hide_narrator
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_resume_gem_scroller
endscript

script drum_training_1_7_complete_message 
	printf \{qs(0xf05fcfcd)}
	training_generic_lesson_complete
endscript

script drum_training_1_8_show_lesson_header 
	printf \{qs(0x2c984819)}
	training_set_lesson_header_text \{number = qs(0xf32ccdae)
		text = qs(0xdd544c3f)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_8_show_highway 
	printf \{qs(0x9f678dbb)}
	setplayerinfo \{1
		four_lane_highway = 0}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_drum_break
		difficulty = medium
		part = drum
		disable_hud
		no_score_update}
	killspawnedscript \{name = update_score_fast}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notep1 drum_training_1_8_hit_note params = {<...>}}
		{missed_notep1 drum_training_1_8_missed_note}
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

script drum_training_1_8_hit_note 
	printf \{qs(0x70d2b480)}
	printstruct <...>
	if gotparam \{drum_accent}
		change drum_notes_hit = ($drum_notes_hit + 1)
		if (($drum_notes_hit = 1) || ($drum_notes_hit = 4))
			Random (
				@ training_play_sound \{sound = 'Tut_Dru_Positive_01_DRM'}
				@ training_play_sound \{sound = 'Tut_Dru_Positive_02_DRM'}
				@ training_play_sound \{sound = 'Tut_Dru_Positive_03_DRM'}
				@ training_play_sound \{sound = 'Tut_Dru_Positive_04_DRM'}
				@ training_play_sound \{sound = 'Tut_Dru_Positive_05_DRM'}
				@ training_play_sound \{sound = 'Tut_Dru_Positive_06_DRM'}
				@ training_play_sound \{sound = 'Tut_Dru_Positive_07_DRM'}
				@ training_play_sound \{sound = 'Tut_Dru_Positive_08_DRM'}
				)
		endif
		training_display_notes_hit \{notes_hit = $drum_notes_hit
			notes_required = 4}
	endif
endscript

script drum_training_1_8_missed_note 
	printf \{qs(0xe8e9986b)}
	change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 3) || ($drum_notes_missed = 6))
		Random (
			@ training_play_sound \{sound = 'Tut_Dru_Accents_05_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Accents_06_DRM'}
			)
	endif
endscript

script drum_training_1_8_wait_for_hit_notes 
	printf \{qs(0x5eedd79c)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 4)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_8_show_items_on_highway 
	printf \{qs(0xa699375f)}
	wait \{3.6
		seconds}
	training_pause_gem_scroller
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (735.0, 360.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (545.0, 360.0)
			scale = 0.7}
	endif
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_Accents_01_DRM'
		wait}
	training_play_sound \{sound = 'Tut_Dru_Accents_02_DRM'
		wait}
	training_hide_narrator
endscript

script drum_training_1_8_add_play_each_note_task 
	printf \{qs(0x6863424d)}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x858b2246)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_Accents_03_DRM'
		wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x5553a14e)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 4}
	training_destroy_all_arrows
	change \{drum_notes_hit = 0}
	change \{drum_notes_missed = 0}
	training_resume_gem_scroller
	drum_training_1_8_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{sound = 'Tut_Dru_Accents_04_DRM'
		wait}
	training_hide_narrator
endscript

script drum_training_1_8_complete_message 
	printf \{qs(0xdc4f5d8a)}
	training_destroy_title
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	soundevent \{event = tutorial_mode_finish_chord}
	training_hide_lesson_header
	training_destroy_gem_scroller
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0x6ae69bf8)
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
	wait \{7
		seconds
		ignoreslomo}
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script drum_training_basic_tutorial_end 
	printf \{qs(0x2d506a66)}
	if ($g_training_lessons_completed = 8)
		setglobaltags \{training
			params = {
				drum_basic_lesson = complete
			}}
	endif
	training_kill_session
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
	change \{tutorial_disable_hud = 0}
	training_check_for_all_tutorials_finished
	decide_tutorial_back_destination
endscript
