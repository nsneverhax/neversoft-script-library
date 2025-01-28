training_basic_tutorial_script = [
	{
		call = training_basic_tutorial_startup
	}
	{
		Time = 1000
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
	LaunchEvent \{Type = unfocus
		Target = root_window}
	training_create_narrator_icons
endscript

script training_create_narrator_icons 
	CreateScreenElement \{PARENT = training_container
		Type = SpriteElement
		Id = god_icon
		just = [
			Center
			Center
		]
		texture = training_narrator_god
		Pos = (280.0, 140.0)
		Rot_Angle = 0
		rgba = [
			255
			255
			255
			255
		]
		Scale = (1.4, 1.4)
		z_priority = 5}
	CreateScreenElement \{PARENT = training_container
		Type = SpriteElement
		Id = lou_icon
		just = [
			Center
			Center
		]
		texture = training_narrator_lou
		Pos = (280.0, 140.0)
		Rot_Angle = 0
		rgba = [
			255
			255
			255
			255
		]
		Scale = (1.4, 1.4)
		z_priority = 5}
	safe_hide \{Id = god_icon}
	safe_hide \{Id = lou_icon}
endscript

script training_destroy_narrator_icons 
	Safe_Destroy \{Id = god_icon}
	Safe_Destroy \{Id = lou_icon}
endscript

script training_basic_tutorial_show_title 
	training_show_title \{Title = "Guitar Hero Basics Tutorial"}
	begin
	if ($transitions_locked = 0)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	create_training_pause_handler
	safe_show \{Id = god_icon}
	training_play_sound \{Sound = 'Tutorial_1_Intro_01_God'
		Wait}
	training_destroy_title
endscript

script training_1_1_show_guitar 
	CreateScreenElement \{PARENT = training_container
		Type = SpriteElement
		Id = guitar_sprite
		just = [
			Center
			Center
		]
		texture = training_guitar
		Pos = (630.0, 400.0)
		Rot_Angle = 0
		rgba = [
			255
			255
			255
			255
		]
		Scale = (0.4, 0.4)
		z_priority = 4}
	training_create_strum_sprites
	hide_strum_fingers
	safe_show \{Id = strum_middle_sprite}
endscript

script training_1_1_start_guitar_vo 
	training_play_sound \{Sound = 'Tutorial_1_Intro_02_God'
		Wait}
endscript

script training_create_fret_finger_sprites 
	wrist_pos = (455.0, 362.0)
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = hand_wrist
		just = [Center Center]
		texture = training_hand_wrist
		Pos = <wrist_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	hand_pos = (407.0, 430.0)
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = fret_none_sprite
		just = [Center Center]
		texture = training_hand_button_none
		Pos = <hand_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = fret_green_sprite
		just = [Center Center]
		texture = training_hand_button_g
		Pos = <hand_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = fret_red_sprite
		just = [Center Center]
		texture = training_hand_button_r
		Pos = <hand_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = fret_yellow_sprite
		just = [Center Center]
		texture = training_hand_button_y
		Pos = <hand_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = fret_green_red_sprite
		just = [Center Center]
		texture = training_hand_button_gr
		Pos = <hand_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = fret_green_red_yellow_sprite
		just = [Center Center]
		texture = training_hand_button_gry
		Pos = <hand_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
endscript

script training_destroy_fret_finger_sprites 
	Safe_Destroy \{Id = fret_none_sprite}
	Safe_Destroy \{Id = fret_green_sprite}
	Safe_Destroy \{Id = fret_red_sprite}
	Safe_Destroy \{Id = fret_yellow_sprite}
	Safe_Destroy \{Id = fret_green_red_sprite}
	Safe_Destroy \{Id = fret_green_red_yellow_sprite}
	Safe_Destroy \{Id = hand_wrist}
endscript

script training_1_1_show_fret_placement 
	training_create_fret_finger_sprites
	pose_fret_fingers \{Color = NONE}
	SpawnScriptNow \{training_animate_fret_fingers
		Id = training_spawned_script}
	training_add_arrow \{Id = training_arrow
		life = 8.0
		Pos = (410.0, 360.0)
		Scale = 0.7}
endscript

script training_animate_fret_fingers 
	Wait \{2
		Seconds
		IgnoreSlomo}
	begin
	pose_fret_fingers \{Color = Green}
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	pose_fret_fingers \{Color = RED}
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	pose_fret_fingers \{Color = Yellow}
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	pose_fret_fingers \{Color = RED}
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	repeat 2
	pose_fret_fingers \{Color = Green}
endscript

script pose_fret_fingers 
	hide_fret_fingers
	switch (<Color>)
		case NONE
		safe_show \{Id = fret_none_sprite}
		case Green
		safe_show \{Id = fret_green_sprite}
		case RED
		safe_show \{Id = fret_red_sprite}
		case Yellow
		safe_show \{Id = fret_yellow_sprite}
		case green_red
		safe_show \{Id = fret_green_red_sprite}
		case green_red_yellow
		safe_show \{Id = fret_green_red_yellow_sprite}
	endswitch
	safe_show \{Id = hand_wrist}
endscript

script hide_fret_fingers 
	safe_hide \{Id = fret_none_sprite}
	safe_hide \{Id = fret_green_sprite}
	safe_hide \{Id = fret_red_sprite}
	safe_hide \{Id = fret_yellow_sprite}
	safe_hide \{Id = fret_green_sprite}
	safe_hide \{Id = fret_green_red_sprite}
	safe_hide \{Id = fret_green_red_yellow_sprite}
	safe_hide \{Id = hand_wrist}
endscript

script training_animate_strum_fingers 
	pose_strum_fingers \{Pos = middle}
	Wait \{2
		Seconds
		IgnoreSlomo}
	begin
	pose_strum_fingers \{Pos = middle}
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	pose_strum_fingers \{Pos = UP}
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	pose_strum_fingers \{Pos = middle}
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	pose_strum_fingers \{Pos = DOWN}
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	repeat 2
	pose_strum_fingers \{Pos = middle}
endscript

script pose_strum_fingers 
	hide_strum_fingers
	switch (<Pos>)
		case middle
		Id = strum_middle_sprite
		hand_id = hand_strum_middle_sprite
		case UP
		Id = strum_up_sprite
		hand_id = hand_strum_down_sprite
		case DOWN
		Id = strum_down_sprite
		hand_id = hand_strum_up_sprite
	endswitch
	DoScreenElementMorph Id = <Id> Alpha = 1
	DoScreenElementMorph Id = <hand_id> Alpha = 1
endscript

script hide_strum_fingers 
	safe_hide \{Id = strum_middle_sprite}
	safe_hide \{Id = strum_up_sprite}
	safe_hide \{Id = strum_down_sprite}
	safe_hide \{Id = hand_strum_middle_sprite}
	safe_hide \{Id = hand_strum_up_sprite}
	safe_hide \{Id = hand_strum_down_sprite}
endscript

script training_create_strum_sprites 
	strum_pos = (850.0, 400.0)
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = strum_middle_sprite
		just = [Center Center]
		texture = training_guitar_strum
		Pos = <strum_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = strum_up_sprite
		just = [Center Center]
		texture = training_guitar_strum_up
		Pos = <strum_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = strum_down_sprite
		just = [Center Center]
		texture = training_guitar_strum_down
		Pos = <strum_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	hand_strum_pos = (945.0, 360.0)
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = hand_strum_middle_sprite
		just = [Center Center]
		texture = training_hand_strum
		Pos = <hand_strum_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 6
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = hand_strum_up_sprite
		just = [Center Center]
		texture = training_hand_strum_up
		Pos = <hand_strum_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 6
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = hand_strum_down_sprite
		just = [Center Center]
		texture = training_hand_strum_down
		Pos = <hand_strum_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 6
	}
endscript

script training_destory_strum_sprites 
	Safe_Destroy \{Id = strum_middle_sprite}
	Safe_Destroy \{Id = strum_up_sprite}
	Safe_Destroy \{Id = strum_down_sprite}
	Safe_Destroy \{Id = hand_strum_middle_sprite}
	Safe_Destroy \{Id = hand_strum_up_sprite}
	Safe_Destroy \{Id = hand_strum_down_sprite}
endscript

script training_1_1_show_strum 
	training_add_arrow \{Id = training_strum_arrow
		life = 7
		Pos = (850.0, 360.0)
		Scale = 0.7}
	SpawnScriptNow \{training_animate_strum_fingers
		Id = training_spawned_script}
endscript

script training_1_1_show_lesson_header 
	training_set_lesson_header_text \{Text = "LESSON 1: GUITAR TUNING"}
	training_set_lesson_header_body \{Text = "1. HOLD Fret Button to CHOOSE note\\n2. PRESS Strum Bar up or down to PLAY note"}
	training_set_task_header_body \{Text = "Play each note 3 times to continue"}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tutorial_1_Intro_03_god'
		Wait}
endscript

script training_1_1_zoom_guitar 
	Change \{training_notes_strummed = [
			0
			0
			0
			0
			0
		]}
	Change \{total_notes_strummed = 0}
	training_play_sound \{Sound = 'tutorial_1a_01_god'}
	KillSpawnedScript \{Name = training_animate_fret_fingers}
	KillSpawnedScript \{Name = training_animate_strum_fingers}
	hide_strum_fingers
	hide_fret_fingers
	if ScreenElementExists \{Id = guitar_sprite}
		guitar_sprite :DoMorph \{Scale = (1.0, 1.0)
			Pos = (1100.0, 400.0)
			Time = 0.75}
	endif
	SetMenuAutoRepeatTimes \{(60.0, 60.0)}
	SpawnScriptNow \{training_watch_buttons
		Id = training_spawned_script}
	training_wait_for_sound \{Sound = 'en_tutorial_1a_01_god'}
endscript

script training_1_1_wait_for_tuning_complete 
	training_show_task_header
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
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
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	Change \{LESSON_COMPLETE = 0}
	begin
	if ($LESSON_COMPLETE = 1)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	LaunchEvent \{Type = unfocus
		Target = menu_tutorial}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	KillSpawnedScript \{Name = training_watch_buttons}
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	Wait \{2
		Seconds
		IgnoreSlomo}
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
	GetHeldPattern controller = ($player1_status.controller) nobrokenstring
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
			SetArrayElement ArrayName = training_notes_strummed GlobalArray Index = <note_played> NewValue = ($training_notes_strummed [<note_played>] + 1)
			Change total_notes_strummed = ($total_notes_strummed + 1)
			training_hit_note note = <note_played>
			SpawnScriptNow GH_SFX_Training_Tuning_Strings Params = {note_played = <note_played> training_notes_strummed = ($training_notes_strummed [<note_played>])}
			if ($training_notes_strummed [<note_played>] = 3)
				FormatText ChecksumName = note_tuned 'note_tuned_%a' A = <note_played>
				Change total_notes_tuned = ($total_notes_tuned + 1)
				CreateScreenElement {
					PARENT = training_container
					Type = SpriteElement
					Id = <note_tuned>
					just = [Center Center]
					texture = training_guitar_button_tuned
					Pos = ((442.0, 396.0) + (1.0, 0.0) * (<note_played> * 67))
					Rot_Angle = 0
					rgba = [255 255 255 255]
					Scale = (0.36, 0.36)
					z_priority = 7
				}
				if (($total_notes_tuned = 1) || ($total_notes_tuned = 4))
					GetRandomValue \{Name = random_value
						A = 0
						B = 10}
					if (<random_value> < 5)
						training_play_sound \{Sound = 'Tutorial_God_Positive_01'}
					else
						training_play_sound \{Sound = 'Tutorial_God_Positive_02'}
					endif
				endif
			endif
			if ($total_notes_strummed >= 15)
				Change \{LESSON_COMPLETE = 1}
			endif
		endif
	endif
endscript

script training_1_1_tuning_complete_message 
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	SoundEvent \{Event = Tutorial_Mode_Finish_Chord}
	Safe_Destroy \{Id = guitar_sprite}
	training_destroy_fret_finger_sprites
	training_destroy_pressed_notes
	Safe_Destroy \{Id = strum_middle_sprite}
	Safe_Destroy \{Id = strum_up_sprite}
	Safe_Destroy \{Id = strum_down_sprite}
	training_destroy_hit_notes
	Safe_Destroy \{Id = note_tuned_0}
	Safe_Destroy \{Id = note_tuned_1}
	Safe_Destroy \{Id = note_tuned_2}
	Safe_Destroy \{Id = note_tuned_3}
	Safe_Destroy \{Id = note_tuned_4}
	training_hide_lesson_header
	training_hide_task_header
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [Center Center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	Wait \{2
		Seconds
		IgnoreSlomo}
	Safe_Destroy \{Id = tuning_complete_text}
endscript

script training_wait_for_gem_scroller_startup 
	begin
	GetSongTime
	Printf Channel = Tutorial "song time is %a " A = <songtime>
	if (<songtime> > 0)
		return
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script training_1_2_start_gem_scroller 
	destroy_band
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{Song = Tutorial_1B
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
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
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_wait_for_gem_scroller_startup
	training_set_lesson_header_text \{Text = "LESSON 2: PLAYING NOTES"}
	training_set_lesson_header_body \{Text = "1. As notes cross the line, play them on your guitar"}
	training_show_lesson_header
	safe_show \{Id = god_icon}
endscript

script training_1_2_show_lesson 
	Wait \{3.6
		Seconds
		IgnoreSlomo}
	training_pause_gem_scroller
	training_play_sound \{Sound = 'Tutorial_1B_01_God'}
	Wait \{7.1
		Seconds
		IgnoreSlomo}
	if training_are_notes_flipped
		training_add_arrow \{Id = training_arrow
			life = 7.0
			Pos = (742.0, 370.0)
			Scale = 0.7}
	else
		training_add_arrow \{Id = training_arrow
			life = 7.0
			Pos = (525.0, 370.0)
			Scale = 0.7}
	endif
	Wait \{7.5
		Seconds
		IgnoreSlomo}
	if training_are_notes_flipped
		training_add_arrow \{Id = training_arrow2
			life = 5
			Pos = (886.0, 635.0)
			Scale = 0.7
			rot = 90}
	else
		training_add_arrow \{Id = training_arrow2
			life = 5
			Pos = (380.0, 635.0)
			Scale = 0.7
			rot = -90}
	endif
	Wait \{6
		Seconds
		IgnoreSlomo}
	training_set_task_header_body \{Text = "Play 8 notes to continue"}
	training_show_task_header
	training_display_notes_hit \{NOTES_HIT = 0}
	Wait \{1
		Seconds
		IgnoreSlomo}
	training_play_sound \{Sound = 'Tutorial_1B_02_God'}
	Wait \{2
		Seconds
		IgnoreSlomo}
	training_resume_gem_scroller
endscript
NOTES_HIT = 0

script lesson1_hit_note 
	Change NOTES_HIT = ($NOTES_HIT + 1)
	if (($NOTES_HIT = 1) || ($NOTES_HIT = 4))
		GetRandomValue \{Name = random_value
			A = 0
			B = 10}
		if (<random_value> < 5)
			if GotParam \{use_lou}
				training_play_sound \{Sound = 'Tutorial_lou_Positive_01'}
			else
				training_play_sound \{Sound = 'Tutorial_God_Positive_01'}
			endif
		elseif (<random_value> < 10)
			if GotParam \{use_lou}
				training_play_sound \{Sound = 'Tutorial_lou_Positive_02'}
			else
				training_play_sound \{Sound = 'Tutorial_God_Positive_02'}
			endif
		endif
	endif
	training_display_notes_hit \{NOTES_HIT = $NOTES_HIT}
endscript
notes_missed = 0

script lesson1_missed_note 
	Change notes_missed = ($notes_missed + 1)
	if (($notes_missed = 3) || ($notes_missed = 6))
		if GotParam \{use_lou}
			training_play_negative \{who = Lou}
		else
			training_play_negative \{who = god}
		endif
	endif
endscript
long_notes_missed = 0

script lesson4_check_long_note 
	if (<FINISHED> = 1)
		Change NOTES_HIT = ($NOTES_HIT + 1)
		if NOT training_is_sound_playing \{Sound = 'Tutorial_1D_02_God'}
			if (($NOTES_HIT = 1) || ($NOTES_HIT = 4))
				training_play_positive \{who = god}
			endif
		endif
	else
		Change long_notes_missed = ($long_notes_missed + 1)
		if ($long_notes_missed = 2)
			training_play_sound \{Sound = 'Tutorial_1D_02_God'}
		endif
	endif
	if ($NOTES_HIT = 0)
		return
	endif
	training_display_notes_hit \{NOTES_HIT = $NOTES_HIT}
endscript

script training_1_2_wait_for_hit_notes 
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($NOTES_HIT >= 8)
		return
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script training_1_2_show_complete_message 
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	SoundEvent \{Event = Tutorial_Mode_Finish_Chord}
	Safe_Destroy \{Id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	training_destroy_gem_scroller
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [Center Center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	training_play_sound \{Sound = 'Tutorial_1B_03_God'
		Wait}
	Safe_Destroy \{Id = tuning_complete_text}
endscript

script training_1_3_start_gem_scroller 
	destroy_band
	Change \{LESSON_COMPLETE = 0}
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{Song = Tutorial_1C
		disable_hud
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
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
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_wait_for_gem_scroller_startup
	Change \{NOTES_HIT = 0}
	Change \{notes_missed = 0}
endscript

script training_1_3_show_lesson 
	Wait \{1
		Seconds
		IgnoreSlomo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{Text = "LESSON 3: DIFFERENT NOTES"}
	training_set_lesson_header_body \{Text = "1. Match the note colors to play different notes"}
	training_show_lesson_header
	safe_show \{Id = god_icon}
	training_play_sound \{Sound = 'Tutorial_1C_01_God'
		Wait}
	training_set_task_header_body \{Text = "Play some different notes, hit 8 to continue"}
	training_show_task_header
	Wait \{2
		Seconds
		IgnoreSlomo}
	training_resume_gem_scroller
endscript

script training_1_3_wait_for_lesson_complete 
	Change \{LESSON_COMPLETE = 0}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($LESSON_COMPLETE = 1)
		return
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script training_1_3_show_complete_message 
	Printf \{Channel = newdebug
		"training_1_3_show_complete_message"}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	Safe_Destroy \{Id = notes_hit_text}
	SoundEvent \{Event = Tutorial_Mode_Finish_Chord}
	training_hide_lesson_header
	training_hide_task_header
	training_destroy_gem_scroller
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [Center Center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	training_play_sound \{Sound = 'Tutorial_1C_02_God'
		Wait}
	Safe_Destroy \{Id = tuning_complete_text}
endscript

script training_1_4_start_gem_scroller 
	destroy_band
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{Song = Tutorial_1D
		disable_hud
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
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
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_set_lesson_header_text \{Text = "LESSON 4: LONG NOTES"}
	training_set_lesson_header_body \{Text = ""}
	training_show_lesson_header
	safe_show \{Id = god_icon}
	Change \{NOTES_HIT = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_1_4_show_lesson 
	Wait \{3.55
		Seconds
		ignoreslowmo}
	training_pause_gem_scroller
	training_set_lesson_header_body \{Text = "1. Hold fret buttons down\\n2. Strum\\n3. Keep fret down until the whole note has played"}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tutorial_1D_01_God'}
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	if training_are_notes_flipped
		training_add_arrow \{Id = training_arrow
			life = 18
			Pos = (725.0, 380.0)
			Scale = 0.7
			rot = -45}
	else
		training_add_arrow \{Id = training_arrow
			life = 18
			Pos = (545.0, 380.0)
			Scale = 0.7
			rot = 45}
	endif
	training_wait_for_sound \{Sound = 'Tutorial_1D_01_God'
		Wait}
	training_set_task_header_body \{Text = "Play 8 long notes to continue"}
	training_show_task_header
	training_display_notes_hit \{NOTES_HIT = 0}
	Wait \{2
		Seconds
		IgnoreSlomo}
	training_resume_gem_scroller
	Change \{long_notes_missed = 0}
endscript

script training_1_4_show_complete_message 
	if ScreenElementExists \{Id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	SoundEvent \{Event = Tutorial_Mode_Finish_Chord}
	Safe_Destroy \{Id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	training_destroy_gem_scroller
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [Center Center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	UnPauseGH3Sounds
	UnPauseGame
	training_play_sound \{Sound = 'Tutorial_1D_03_God'
		Wait}
	safe_hide \{Id = god_icon}
	Safe_Destroy \{Id = tuning_complete_text}
endscript

script training_1_5_start_gem_scroller 
	destroy_band
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{Song = Tutorial_1E
		disable_hud
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson1_hit_note Params = {use_lou}}
		{missed_notep1 lesson1_missed_note Params = {use_lou}}
		{song_wonp1 training_song_won}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_set_lesson_header_text \{Text = "LESSON 5: CHORDS"}
	training_set_lesson_header_body \{Text = ""}
	training_show_lesson_header
	safe_show \{Id = lou_icon}
	Change \{NOTES_HIT = 0}
	Change \{notes_missed = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_1_5_show_lesson 
	Wait \{3.5
		Seconds
		IgnoreSlomo}
	training_pause_gem_scroller
	training_set_lesson_header_body \{Text = "Two notes played at the same time"}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tutorial_1E_01_lou'}
	Wait \{6.65
		Seconds
		IgnoreSlomo}
	if training_are_notes_flipped
		training_add_arrow \{Id = training_arrow
			life = 8.4
			Pos = (710.0, 375.0)
			Scale = 0.7}
	else
		training_add_arrow \{Id = training_arrow
			life = 8.4
			Pos = (556.0, 375.0)
			Scale = 0.7}
	endif
	training_wait_for_sound \{Sound = 'Tutorial_1E_01_lou'}
	training_set_task_header_body \{Text = "Play 8 chords to continue"}
	training_show_task_header
	training_display_notes_hit \{NOTES_HIT = 0}
	Wait \{2
		Seconds
		IgnoreSlomo}
	training_resume_gem_scroller
endscript

script training_1_5_show_complete_message 
	if ScreenElementExists \{Id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	SoundEvent \{Event = Tutorial_Mode_Finish_Chord}
	Safe_Destroy \{Id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	training_destroy_gem_scroller
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [Center Center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	Wait \{3
		Seconds
		IgnoreSlomo}
	safe_hide \{Id = lou_icon}
	Safe_Destroy \{Id = tuning_complete_text}
endscript

script training_destroy_gem_scroller \{Delay = 0.5}
	PauseGame
	PauseGH3Sounds
	Wait <Delay> Seconds IgnoreSlomo
	KillCamAnim \{Name = ch_view_cam}
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	PlayIGCCam \{Id = cs_view_cam_id
		Name = ch_view_cam
		viewport = Bg_Viewport
		LockTo = World
		Pos = (-0.068807, 1.5990009, 5.7975965)
		Quat = (0.000506, 0.99942994, -0.017537998)
		FOV = 72.0
		Play_hold = 1
		interrupt_current}
	UnPauseGH3Sounds
	UnPauseGame
endscript

script training_1_6_show_hud 
	training_set_lesson_header_text \{Text = "LESSON 6: USER INTERFACE"}
	training_set_lesson_header_body \{Text = ""}
	training_show_lesson_header
	safe_show \{Id = god_icon}
	training_play_sound \{Sound = 'Tutorial_1F_01_god'}
	Wait \{6.0
		Seconds
		IgnoreSlomo}
	player_Text = 'p1'
	player_status = player1_status
	Player = 1
	Change \{StructureName = player1_status
		current_health = 1.0}
	SpawnScriptLater update_score_fast Params = {<...>} Id = training_spawned_script
	setup_hud <...>
	move_hud_to_default <...> Time = 0.5
	Wait \{1.5
		Seconds
		IgnoreSlomo}
	training_add_arrow \{Id = training_arrow2
		life = 6
		Pos = (880.0, 590.0)
		Scale = 0.7
		rot = -90}
	Wait \{8.0
		Seconds
		IgnoreSlomo}
	training_set_lesson_header_body \{Text = "Yellow = OK Performance"}
	Wait \{5.5
		Seconds
		IgnoreSlomo}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		Params = {
			health = 1.6
		}
		Id = training_spawned_script}
	training_set_lesson_header_body \{Text = "Yellow = OK Performance\\nGreen = Good Performance"}
	Wait \{5
		Seconds
		IgnoreSlomo}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		Params = {
			health = 0.4
		}
		Id = training_spawned_script}
	training_set_lesson_header_body \{Text = "Yellow = OK Performance\\nGreen = Good Performance\\nRed = Bad Performance"}
	Wait \{6.5
		Seconds
		IgnoreSlomo}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		Params = {
			health = 0.0
		}
		Id = training_spawned_script}
	training_set_lesson_header_body \{Text = "Yellow = OK Performance\\nGreen = Good Performance\\nRed = Bad Performance\\nBlinking Red = Danger!"}
	Wait \{6.5
		Seconds
		IgnoreSlomo}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		Params = {
			health = 1.0
		}
		Id = training_spawned_script}
	training_add_arrow \{Id = training_arrow2
		life = 10
		Pos = (285.0, 460.0)
		Scale = 0.7}
	training_set_lesson_header_body \{Text = "Yellow = OK Performance\\nGreen = Good Performance\\nRed = Bad Performance\\nBlinking Red = Danger!\\nPlay Notes = Score Points"}
	training_wait_for_sound \{Sound = 'Tutorial_1F_01_god'}
	safe_hide \{Id = god_icon}
endscript

script training_set_health 
	inc = 0.03
	begin
	current_health = ($player1_status.current_health)
	if (<current_health> < <health>)
		if ((<health> - <current_health>) < <inc>)
			Change StructureName = player1_status current_health = <health>
		else
			Change StructureName = player1_status current_health = (<current_health> + <inc>)
		endif
	else
		if ((<current_health> - <health>) < <inc>)
			Change StructureName = player1_status current_health = <health>
		else
			Change StructureName = player1_status current_health = (<current_health> - <inc>)
		endif
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script training_1_6_hide_hud 
	player_Text = 'p1'
	player_status = player1_status
	destroy_hud <...>
	KillSpawnedScript \{Name = update_score_fast}
	training_hide_lesson_header
endscript

script training_1_6_complete 
	SoundEvent \{Event = Tutorial_Mode_Finish_Chord}
	KillSpawnedScript \{Name = training_set_health}
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = lesson_title_text
		just = [Center Center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Basic Tutorial Complete!"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	training_play_sound \{Sound = 'Tutorial_1_outro'
		Wait}
	safe_hide \{Id = god_icon}
endscript

script training_basic_tutorial_1_end 
	training_kill_session
	KillSpawnedScript \{Name = training_watch_buttons}
	KillSpawnedScript \{Name = training_animate_fret_fingers}
	KillSpawnedScript \{Name = training_animate_strum_fingers}
	Safe_Destroy \{Id = training_container}
	Safe_Destroy \{Id = training_arrow}
	Safe_Destroy \{Id = training_strum_arrow}
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_narrator_icons
	SetScreenElementProps \{Id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		Replace_Handlers}
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	Change \{tutorial_disable_hud = 0}
	SetGlobalTags \{training
		Params = {
			basic_lesson = Complete
		}}
	training_check_for_all_tutorials_finished
	ui_flow_manager_respond_to_action \{action = complete_tutorial}
endscript

script create_pressed_note_sprites 
	CreateScreenElement \{PARENT = training_container
		Type = SpriteElement
		Id = green_pressed_sprite
		just = [
			Center
			Center
		]
		texture = training_guitar_button_down
		Pos = (441.0, 396.0)
		Rot_Angle = 0
		rgba = [
			0
			165
			130
			255
		]
		Scale = (0.36, 0.36)
		z_priority = 5}
	CreateScreenElement \{PARENT = training_container
		Type = SpriteElement
		Id = red_pressed_sprite
		just = [
			Center
			Center
		]
		texture = training_guitar_button_down
		Pos = (508.0, 396.0)
		Rot_Angle = 0
		rgba = [
			230
			80
			90
			255
		]
		Scale = (0.36, 0.36)
		z_priority = 5}
	CreateScreenElement \{PARENT = training_container
		Type = SpriteElement
		Id = yellow_pressed_sprite
		just = [
			Center
			Center
		]
		texture = training_guitar_button_down
		Pos = (575.0, 396.0)
		Rot_Angle = 0
		rgba = [
			220
			160
			25
			255
		]
		Scale = (0.36, 0.36)
		z_priority = 5}
	CreateScreenElement \{PARENT = training_container
		Type = SpriteElement
		Id = blue_pressed_sprite
		just = [
			Center
			Center
		]
		texture = training_guitar_button_down
		Pos = (642.0, 396.0)
		Rot_Angle = 0
		rgba = [
			0
			135
			210
			255
		]
		Scale = (0.36, 0.36)
		z_priority = 5}
	CreateScreenElement \{PARENT = training_container
		Type = SpriteElement
		Id = orange_pressed_sprite
		just = [
			Center
			Center
		]
		texture = training_guitar_button_down
		Pos = (709.0, 396.0)
		Rot_Angle = 0
		rgba = [
			215
			120
			40
			255
		]
		Scale = (0.36, 0.36)
		z_priority = 5}
	hide_pressed_notes
endscript

script hide_pressed_notes 
	safe_hide \{Id = green_pressed_sprite}
	safe_hide \{Id = red_pressed_sprite}
	safe_hide \{Id = yellow_pressed_sprite}
	safe_hide \{Id = orange_pressed_sprite}
	safe_hide \{Id = blue_pressed_sprite}
endscript

script training_destroy_pressed_notes 
	Safe_Destroy \{Id = green_pressed_sprite}
	Safe_Destroy \{Id = red_pressed_sprite}
	Safe_Destroy \{Id = yellow_pressed_sprite}
	Safe_Destroy \{Id = orange_pressed_sprite}
	Safe_Destroy \{Id = blue_pressed_sprite}
endscript

script training_destroy_hit_notes 
	Safe_Destroy \{Id = hit_green_sprite}
	Safe_Destroy \{Id = hit_yellow_sprite}
	Safe_Destroy \{Id = hit_red_sprite}
	Safe_Destroy \{Id = hit_orange_sprite}
	Safe_Destroy \{Id = hit_blue_sprite}
endscript

script show_pressed_note 
	switch (<note>)
		case 0
		safe_show \{Id = green_pressed_sprite}
		case 1
		safe_show \{Id = red_pressed_sprite}
		case 2
		safe_show \{Id = yellow_pressed_sprite}
		case 3
		safe_show \{Id = blue_pressed_sprite}
		case 4
		safe_show \{Id = orange_pressed_sprite}
	endswitch
endscript

script training_hit_note 
	switch (<note>)
		case 0
		Id = hit_green_sprite
		rgba = [0 165 130 255]
		case 1
		Id = hit_red_sprite
		rgba = [230 80 90 255]
		case 2
		Id = hit_yellow_sprite
		rgba = [220 160 25 255]
		case 3
		Id = hit_blue_sprite
		rgba = [0 135 210 255]
		case 4
		Id = hit_orange_sprite
		rgba = [215 120 40 255]
	endswitch
	if ScreenElementExists Id = <Id>
		DestroyScreenElement Id = <Id>
	endif
	Scale = (0.36, 0.36)
	Pos = ((442.0, 396.0) + (1.0, 0.0) * (<note> * 67))
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = <Id>
		just = [Center Center]
		texture = training_guitar_button_down
		Pos = <Pos>
		Rot_Angle = 0
		rgba = <rgba>
		Scale = <Scale>
		z_priority = 6
	}
	DoScreenElementMorph Id = <Id> Scale = (<Scale> * 1.8499999) Alpha = 0 Time = 0.25
endscript

script training_watch_buttons 
	create_pressed_note_sprites
	begin
	GetHeldPattern controller = ($player1_status.controller) nobrokenstring
	hide_pressed_notes
	check_button = 65536
	array_count = 0
	begin
	FormatText ChecksumName = new_arrow 'arrow_%a' A = <array_count>
	if ScreenElementExists Id = <new_arrow>
		DestroyScreenElement Id = <new_arrow>
	endif
	if (<hold_pattern> && <check_button>)
		show_pressed_note note = <array_count>
	else
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat 5
	Wait \{1
		GameFrame}
	repeat
endscript

script training_1_kill_spawned_scripts 
endscript
