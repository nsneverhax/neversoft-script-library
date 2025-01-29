jam_tutorial_status = inactive

script jam_force_kill_tutorial \{status = section_done}
	if ($jam_tutorial_status = Active)
		Change \{jam_tutorial_status = skipping}
		KillSpawnedScript \{id = jam_tutorial_spawns}
		jam_tutorial_segment_cleanup
		jam_tutorial_skipping_message
		Change jam_tutorial_status = <status>
	endif
endscript

script jam_tutorial_skipping_message 
	if ScreenElementExists \{id = jam_band_container}
		<parent> = jam_band_container
	elseif ScreenElementExists \{id = jam_studio_element}
		<parent> = jam_studio_element
	else
		return
	endif
	<text> = qs(0xec174fc2)
	<Pos> = (955.0, 465.0)
	CreateScreenElement {
		id = tut_skip_text_container
		Type = ContainerElement
		parent = <parent>
		z_priority = 80
	}
	CreateScreenElement {
		id = tut_skip_text_glow
		rgba = [0 0 0 150]
		Type = SpriteElement
		parent = tut_skip_text_container
		texture = mixer_glow_64
		Pos = <Pos>
		dims = (450.0, 90.0)
		just = [center center]
		z_priority = 78
	}
	CreateScreenElement {
		id = tut_skip_text_shadow
		Type = TextElement
		parent = tut_skip_text_container
		font = fontgrid_title_a1
		text = <text>
		Scale = 1
		Pos = (<Pos> + (2.0, 2.0))
		just = [center center]
		rgba = [0 0 0 255]
		z_priority = 79
	}
	CreateScreenElement {
		id = tut_skip_text
		Type = TextElement
		parent = tut_skip_text_container
		font = fontgrid_title_a1
		text = <text>
		Scale = 1
		Pos = <Pos>
		just = [center center]
		rgba = [200 200 200 255]
		z_priority = 80
	}
	if ScreenElementExists \{id = tut_skip_text}
		tut_skip_text :se_setprops \{alpha = 0}
		tut_skip_text_shadow :se_setprops \{alpha = 0}
		tut_skip_text_glow :se_setprops \{alpha = 0}
	endif
	if ScreenElementExists \{id = tut_skip_text}
		tut_skip_text :se_setprops \{alpha = 1
			time = 0.1}
		tut_skip_text_shadow :se_setprops \{alpha = 1
			time = 0.1}
		tut_skip_text_glow :se_setprops \{alpha = 1
			time = 0.1}
		tut_skip_text :se_waitprops
	endif
	Wait \{0.5
		Seconds}
	if ScreenElementExists \{id = tut_skip_text}
		tut_skip_text :se_setprops \{alpha = 0
			time = 0.1}
		tut_skip_text_shadow :se_setprops \{alpha = 0
			time = 0.1}
		tut_skip_text_glow :se_setprops \{alpha = 0
			time = 0.1}
		tut_skip_text :se_waitprops
	endif
	if ScreenElementExists \{id = tut_skip_text_container}
		DestroyScreenElement \{id = tut_skip_text_container}
	endif
endscript

script jam_play_tutorial_topic 
	Change \{game_mode = practice}
	if IsGuitarController \{controller = $primary_controller}
		setplayerinfo \{1
			part = guitar}
	elseif isdrumcontroller \{controller = $primary_controller}
		setplayerinfo \{1
			part = drum}
	elseif isrbdrum \{controller = $primary_controller}
		setplayerinfo \{1
			part = drum}
	endif
	if (<ghmix_tut> = 0)
		generic_event_choose \{state = uistate_jam_band
			data = {
				editing = 0
				tutorial = 1
				song = None
			}}
		<quit_button> = start
	else
		if (<ghmix_tut> = 1)
			<song_name> = 'StudioExample1'
		elseif (<ghmix_tut> = 2)
			<song_name> = 'StudioExample2'
		endif
		clearcustomsong
		jam_recording_create_editable_arrays
		loadjam file_name = <song_name>
		Change jam_selected_song = <song_name>
		Change \{jam_current_bpm = 120}
		generic_event_choose no_sound state = uistate_recording data = {editing = 1 back_to_jam_band = 0 current_instrument = 0 Player = ($jam_current_recording_player)}
		<quit_button> = select
	endif
	if (<ghmix_tut> > 0)
		tutorial_create_and_hide_headers \{Type = ghmix}
	else
		tutorial_create_and_hide_headers
	endif
	tutorial_create_narrator_icons
	Wait \{0.5
		Seconds}
	jam_camera_wait
	begin
	if ScreenElementExists \{id = jam_band_container}
		break
	endif
	if ScreenElementExists \{id = jam_studio_element}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if (<ghmix_tut> = 0)
		jam_band_container :SetTags \{disable_simple_rec = 1
			role = rhythm
			disable_inst_select = 1
			allow_easy_backout = 0}
		safe_hide \{id = jam_band_highway_playline}
	endif
	<tutorial_topic> = ($jam_tutorial_menu_topics [<index>])
	GetArraySize (<tutorial_topic>.sections)
	<count> = 0
	<topic_completed> = 0
	<skipped> = 0
	begin
	if ($jam_tutorial_status = inactive)
		SpawnScriptNow id = jam_tutorial_spawns (<tutorial_topic>.sections [<count>])
		Change \{jam_tutorial_status = Active}
	elseif ($jam_tutorial_status = force_exit)
		<topic_completed> = 1
		<force_exit> = 1
	elseif ($jam_tutorial_status = section_done)
		Change \{jam_tutorial_status = inactive}
		<count> = (<count> + 1)
		if (<count> >= <array_Size>)
			<topic_completed> = 1
		endif
	endif
	if ControllerMake <quit_button> ($primary_controller)
		<skipped> = 1
		jam_force_kill_tutorial
	endif
	if (<topic_completed> = 1)
		if ScreenElementExists \{id = jam_band_container}
			jam_band_container :SetTags \{disable_simple_rec = 0
				allow_easy_backout = 1}
			tutorial_destroy_narrator_icons
		endif
		jam_tutorial_segment_cleanup
		tutorial_destroy_lesson_and_task_headers
		destroy_jam_band_menu
		KillSpawnedScript \{id = jam_tutorial_spawns}
		setplayerinfo \{1
			part = guitar}
		if (<skipped> = 0)
			ui_memcard_autosave \{event = menu_back
				state = uistate_jam_tutorials}
			tutorial_check_for_all_lessons_finished
		else
			generic_event_back \{state = uistate_jam_tutorials}
		endif
		Change \{jam_tutorial_status = inactive}
		StartRendering
		break
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script jam_tutorial_intro 
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 3}
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0xfc20da78)}
	Wait \{0.5
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_QuickStart_01_BAS'}
	Wait \{5
		Seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	Wait \{9.25
		Seconds}
	tutorial_change_header_type \{Type = studio}
	jam_tutorial_show_narrator
	jam_tutorial_instrument_select_menu
	tutorial_play_sound \{Sound = 'Tut_RS_QuickStart_02_BAS'}
	Wait \{1
		Second}
	jam_tutorial_add_arrow \{instrument = rhythm
		life = 1}
	Wait \{0.75
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	jam_tutorial_add_arrow \{instrument = bass
		life = 1}
	Wait \{0.75
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	Wait \{1.25
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = melody}
	jam_tutorial_add_arrow \{instrument = melody
		life = 1}
	Wait \{0.75
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = drums}
	jam_tutorial_add_arrow \{instrument = drums
		life = 1}
	Wait \{2
		Seconds}
	jam_destroy_select_instrument_menu \{Player = 1}
	Wait \{0.5
		Seconds}
	jam_tutorial_select_role_challenge
	tutorial_wait_for_sound \{Sound = 'Tut_RS_QuickStart_02_BAS'}
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_intro_noise 
	tutorial_change_header_type \{Type = standard}
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x382aa88b)}
	Wait \{0.5
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_QuickStart_03_BAS'}
	Wait \{5
		Seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0xe6383d2a)}
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xfb84d7c5)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0x0b74657a)}
	tutorial_set_task_header_body \{text = qs(0x2211061e)}
	jam_tutorial_make_noise_challenge \{notes_required = 15}
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_intro_recording 
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x581ec86b)}
	Wait \{0.5
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_QuickStart_05_BAS'}
	Wait \{5
		Seconds}
	tutorial_destroy_title
	Wait \{1
		Seconds}
	tutorial_change_header_type \{Type = standard}
	tutorial_show_narrator \{narrator = 'bassist'}
	jam_tutorial_record_jam_challenge
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x19b96b38)}
	Wait \{0.5
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_QuickStart_07_BAS'}
	Wait \{5
		Seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	Wait \{1
		Seconds}
	tutorial_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x01ed9193)}
	jam_tutorial_rewind_challenge \{next = playback}
	Wait \{1
		gameframe}
	tutorial_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0xf9410501)}
	jam_tutorial_playback_challenge
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_22_BAS'}
	tutorial_play_sound \{Sound = 'Tut_RS_QuickStart_08_BAS'}
	Wait \{5
		Seconds}
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{tutorials
			params = {
				rs_introduction_lesson = complete
			}}
	endif
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_select_role_challenge 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	if IsGuitarController \{controller = $primary_controller}
		tutorial_set_lesson_header_text \{number = qs(0x22ee76e7)
			text = qs(0x342e0864)}
		tutorial_add_lesson_body_text \{number = 1
			text = qs(0x7a3ec2cc)}
		tutorial_add_lesson_body_text \{number = 2
			text = qs(0x76fae40f)}
		tutorial_set_task_header_body \{text = qs(0x77aa06a6)}
		tutorial_show_narrator \{narrator = 'bassist'}
		Wait \{0.15
			Seconds}
		tutorial_show_lesson_header
		tutorial_show_task_header
		jam_tutorial_instrument_select_menu \{selectable}
		Block \{Type = jam_tutorial_instrument_selected}
		jam_band_container :SetTags \{disable_inst_select = 1}
		switch (<event_data>.select_instrument)
			case 0
			<role> = rhythm
			case 1
			<role> = lead
			case 2
			<role> = bass
			case 3
			<role> = drums
			case 4
			<role> = melody
		endswitch
		jam_tutorial_role_selected role = <role>
	elseif isdrumcontroller \{controller = $primary_controller}
		jam_band_container :SetTags \{role = drums}
	else
		ScriptAssert \{'Guitar or Drum controller is required to complete the tutorials!'}
	endif
endscript

script jam_tutorial_role_selected 
	jam_band_container :SetTags {role = <role>}
	jam_tutorial_destroy_instrument_ui
	tutorial_wait_for_sound \{Sound = 'Tut_RS_QuickStart_02_BAS'}
	tutorial_hide_lesson_header
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
endscript

script jam_tutorial_make_noise_challenge \{notes_required = 15}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_QuickStart_03_BAS'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Melody_03_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	tutorial_show_task_header
	<num_sounds> = 0
	tutorial_display_notes_hit notes_hit = <num_sounds> notes_required = <notes_required>
	begin
	Block \{anytypes = [
			jam_tutorial_lead_strum
			jam_tutorial_bass_strum
			jam_tutorial_rhythm_strum
			jam_tutorial_drum_hit
			jam_tutorial_melody_hit
		]}
	<num_sounds> = (<num_sounds> + 1)
	tutorial_display_notes_hit notes_hit = <num_sounds> notes_required = <notes_required>
	if (<num_sounds> = <notes_required>)
		Wait \{1
			Seconds}
		break
	endif
	Wait \{1
		gameframes}
	repeat
	tutorial_play_sound \{Sound = 'Tut_RS_QuickStart_04_BAS'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_QuickStart_04_BAS'}
	tutorial_hide_lesson_header
	tutorial_hide_narrator
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_record_jam_challenge 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui
	tutorial_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xc4b9f64c)}
	jam_tutorial_recording_challenge \{notes_required = 20
		time_limit = 25}
	tutorial_play_sound \{Sound = 'Tut_RS_QuickStart_06_BAS'}
	tutorial_hide_lesson_header
	tutorial_hide_narrator
	jam_tutorial_destroy_instrument_ui
	jam_tutorial_lesson_complete
endscript

script jam_tutorial_lead 
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 3}
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0xe421d3c9)}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_LeadBass_01_BAS'}
	tutorial_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{instrument = lead}
	Wait \{1
		Second}
	jam_tutorial_add_arrow \{instrument = lead}
	Wait \{2
		Seconds}
	Wait \{1
		Second}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	tutorial_play_sound \{Sound = 'Tut_RS_LeadBass_02_BAS'}
	Wait \{0.25
		Second}
	jam_tutorial_add_arrow \{instrument = bass}
	Wait \{9.75
		Seconds}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_LeadBass_03_BAS'}
	Wait \{2
		Seconds}
	jam_tutorial_display_instrument_icons \{icons = [
			lead
			bass
			rhythm
		]}
	Wait \{3.5
		Seconds}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_LeadBass_03_BAS'}
	jam_tutorial_destroy_instrument_icons
	tutorial_hide_narrator
	jam_destroy_select_instrument_menu \{Player = 1}
	jam_tutorial_segment_cleanup
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_open_strum 
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x2ae3acdf)}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_OpenStrum_01_BAS'}
	tutorial_destroy_title
	jam_tutorial_show_narrator \{offset}
	Wait \{1.5
		Second}
	jam_tutorial_instrument_select_menu \{instrument = rhythm}
	Wait \{1.5
		Second}
	jam_tutorial_add_arrow \{instrument = rhythm
		life = 1}
	Wait \{0.75
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	Wait \{0.75
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	jam_tutorial_add_arrow \{instrument = bass
		life = 1}
	Wait \{2.5
		Seconds}
	jam_destroy_select_instrument_menu \{Player = 1}
	tutorial_show_narrator \{narrator = 'bassist'}
	Wait \{1
		Second}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = lead}
	tutorial_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x952447a6)}
	jam_tutorial_anim \{anim = open_strum}
	tutorial_play_sound \{Sound = 'Tut_RS_OpenStrum_02_BAS'}
	Wait \{2
		Seconds}
	jam_tutorial_add_arrow \{Pos = (900.0, 325.0)
		life = 2
		Scale = 0.5}
	Wait \{1
		Seconds}
	jam_tutorial_add_arrow \{Pos = (600.0, 325.0)
		life = 2
		Scale = 0.5}
	jam_tutorial_open_strum_challenge
	tutorial_play_sound \{Sound = 'Tut_RS_OpenStrum_03_BAS'}
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_open_strum_challenge 
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x0046eee6)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0x97d68442)}
	tutorial_set_task_header_body \{text = qs(0x47efbaf5)}
	<strums_required> = 5
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_OpenStrum_02_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	tutorial_show_task_header
	<num_open_strums> = 0
	<warned> = 0
	tutorial_display_notes_hit notes_hit = <num_open_strums> notes_required = <strums_required>
	begin
	Block \{Type = jam_tutorial_lead_strum}
	if (<event_data>.hold_pattern = 1048576)
		<num_open_strums> = (<num_open_strums> + 1)
		tutorial_display_notes_hit notes_hit = <num_open_strums> notes_required = <strums_required>
		if (<num_open_strums> = <strums_required>)
			Wait \{1
				Second}
			jam_tutorial_destroy_anim
			break
		endif
	elseif (<warned> = 0)
		tutorial_play_sound \{Sound = 'Tut_Gtr_OpenNotes_11_BAS'}
		<warned> = 1
	endif
	Wait \{1
		gameframes}
	repeat
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_open_strum_anim 
	jam_tutorial_create_ghost_player
	begin
	Wait \{0.25
		Seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum_dn}
	Wait \{0.5
		Seconds}
	safe_hide \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	Wait \{0.25
		Seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum_up}
	Wait \{0.5
		Seconds}
	safe_hide \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	repeat
endscript

script jam_tutorial_play_scale 
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0xe3dcd6ac)}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Scale_01_BAS'}
	tutorial_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{Player = 1
		instrument = lead}
	Wait \{12
		Seconds}
	tutorial_play_sound \{Sound = 'Tut_RS_Scale_02_BAS'}
	jam_tutorial_anim \{anim = play_scale_single}
	Wait \{2
		Seconds}
	jam_destroy_select_instrument_menu \{Player = 1}
	tutorial_show_narrator \{narrator = 'bassist'}
	Wait \{1
		Second}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = bass}
	Wait \{7
		Second}
	jam_tutorial_anim \{anim = play_scale}
	tutorial_play_sound \{Sound = 'Tut_RS_Scale_03_BAS'}
	Wait \{2
		Second}
	jam_tutorial_add_arrow \{Pos = (430.0, 330.0)
		life = 3
		Scale = 0.5
		rot = 90}
	Wait \{3
		Second}
	jam_tutorial_add_arrow \{Pos = (420.0, 325.0)
		life = 3
		Scale = 0.5
		rot = 0}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Scale_03_BAS'}
	Wait \{0.5
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Scale_04_BAS'}
	Wait \{2
		Second}
	tutorial_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x3b61c1ed)}
	jam_tutorial_play_scale_challenge
	tutorial_play_sound \{Sound = 'Tut_RS_Scale_05_BAS'}
	Wait \{2
		Second}
	tutorial_hide_narrator
	jam_tutorial_destroy_anim
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_play_scale_challenge 
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xce2f58d1)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0xf2985d32)}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0x3b22506f)}
	tutorial_set_task_header_body \{text = qs(0x9340de03)}
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Scale_04_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	tutorial_show_task_header
	jam_tutorial_show_scale
	<array> = [
		1048576
		1
		16
		256
		4096
		65536
	]
	GetArraySize <array>
	<notes_required> = (<array_Size>)
	tutorial_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	begin
	Block \{Type = jam_tutorial_bass_strum}
	GetArraySize <array>
	<i> = 0
	begin
	if (<array> [<i>] = <event_data>.hold_pattern)
		RemoveArrayElement array = <array> index = (<i>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	GetArraySize <array>
	num_notes = (<notes_required> - <array_Size>)
	tutorial_display_notes_hit notes_hit = <num_notes> notes_required = <notes_required>
	if (<array_Size> = 0)
		Wait \{1
			Second}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_play_scale_anim \{anim = NULL}
	jam_tutorial_create_ghost_player
	jam_tutorial_create_ghost_g_r_y_gr_gry
	<i> = 0
	if (<anim> = single)
		frets = [
			jam_tut_fret_hand_bg
			jam_tut_fret_hand_br
			jam_tut_fret_hand_by
		]
	else
		frets = [
			jam_tut_fret_hand_bg
			jam_tut_fret_hand_bgr
			jam_tut_fret_hand_bgry
		]
	endif
	begin
	Wait \{0.25
		Seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show id = (<frets> [<i>])
	Wait \{0.5
		Seconds}
	safe_hide \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	safe_hide id = (<frets> [<i>])
	safe_show \{id = jam_tut_fret_hand_bott_none}
	Wait \{0.25
		Seconds}
	jam_tutorial_advance_index array = <frets> i = <i>
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show id = (<frets> [<i>])
	Wait \{0.5
		Seconds}
	safe_hide \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	safe_hide id = (<frets> [<i>])
	safe_show \{id = jam_tut_fret_hand_bott_none}
	jam_tutorial_advance_index array = <frets> i = <i>
	repeat
endscript

script jam_tutorial_tilt 
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x0d5279a7)}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Octave_01_BAS'}
	Wait \{3
		Seconds}
	tutorial_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{Player = 1
		instrument = lead}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Octave_01_BAS'}
	Wait \{0.5
		Seconds}
	tutorial_play_sound \{Sound = 'Tut_RS_Octave_02_BAS'}
	Wait \{0.75
		Seconds}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	Wait \{0.75
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	jam_tutorial_add_arrow \{instrument = bass
		life = 1}
	Wait \{0.75
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = melody}
	jam_tutorial_add_arrow \{instrument = melody
		life = 1}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Octave_02_BAS'}
	jam_destroy_select_instrument_menu \{Player = 1}
	Wait \{1
		Second}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_narrator
	jam_tutorial_show_instrument_ui \{instrument = lead}
	jam_tutorial_anim \{anim = tilt}
	tutorial_play_sound \{Sound = 'Tut_RS_Octave_03_BAS'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Octave_03_BAS'}
	jam_tutorial_add_arrow \{Pos = (250.0, 300.0)
		life = 5
		Scale = 0.5}
	tutorial_play_sound \{Sound = 'Tut_RS_Octave_04_BAS'}
	Wait \{5
		Seconds}
	tutorial_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xe16ce176)}
	jam_tutorial_destroy_anim
	jam_tutorial_tilt_challenge
	tutorial_play_sound \{Sound = 'Tut_RS_Octave_05_BAS'}
	Wait \{4
		Seconds}
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{tutorials
			params = {
				rs_lead_and_bass_lesson = complete
			}}
	endif
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_tilt_challenge 
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x697c524c)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0x5507c5e0)}
	tutorial_set_task_header_body \{text = qs(0x3e7f2c4f)}
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Octave_04_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	tutorial_show_task_header
	<notes_required> = 3
	<high_notes_hit> = 0
	<low_notes_hit> = 0
	<final_instructions_shown> = 0
	tutorial_display_notes_hit notes_hit = (<high_notes_hit> + <low_notes_hit>) notes_required = (<notes_required> * 2)
	begin
	Block \{Type = jam_tutorial_lead_strum}
	if (<event_data>.tilt = 1)
		if (<high_notes_hit> < <notes_required>)
			<high_notes_hit> = (<high_notes_hit> + 1)
		endif
	else
		if (<low_notes_hit> < <notes_required>)
			<low_notes_hit> = (<low_notes_hit> + 1)
		endif
	endif
	tutorial_display_notes_hit notes_hit = (<high_notes_hit> + <low_notes_hit>) notes_required = (<notes_required> * 2)
	if ((<high_notes_hit> >= <notes_required>) && (<low_notes_hit> >= <notes_required>))
		tutorial_display_notes_hit notes_hit = <notes_required> notes_required = <notes_required>
		Wait \{1
			Second}
		break
	endif
	if ((<high_notes_hit> = <notes_required>) && (<final_instructions_shown> = 0))
		<final_instructions_shown> = 1
		tutorial_add_lesson_body_text \{number = 3
			text = qs(0x54c8e7bd)}
	elseif ((<low_notes_hit> = <notes_required>) && (<final_instructions_shown> = 0))
		<final_instructions_shown> = 1
		tutorial_add_lesson_body_text \{number = 3
			text = qs(0x058b6c6d)}
	endif
	Wait \{1
		gameframe}
	repeat
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_tilt_anim 
	jam_tutorial_create_tiltable_guitar
	<tilt_angle> = 50
	<tilt_state> = 0
	begin
	if (<tilt_state> = 0)
		<tilt_state> = 1
		jam_tut_ghost_container :se_setprops rot_angle = <tilt_angle> time = 0.75
		jam_tut_ghost_container :se_waitprops
	else
		<tilt_state> = 0
		jam_tut_ghost_container :se_setprops \{rot_angle = 0
			time = 0.75}
		jam_tut_ghost_container :se_waitprops
	endif
	Wait \{2
		Seconds}
	repeat
endscript

script jam_tutorial_rhythm 
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 2}
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x1c2240c8)}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Rhythm_01_BAS'}
	tutorial_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{Player = 1
		instrument = rhythm}
	jam_tutorial_add_arrow \{instrument = rhythm}
	Wait \{5
		Seconds}
	jam_destroy_select_instrument_menu \{Player = 1}
	tutorial_hide_narrator
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x596dd695)}
	tutorial_play_sound \{Sound = 'Tut_RS_Rhythm_02_BAS'}
	Wait \{1
		Seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	jam_tutorial_anim \{anim = chord_2}
	Wait \{9
		Seconds}
	tutorial_play_sound \{Sound = 'Tut_RS_Rhythm_03_BAS'}
	Wait \{2
		Seconds}
	tutorial_show_narrator \{narrator = 'bassist'}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	tutorial_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x0546383c)}
	jam_tutorial_chord_challenge \{chords_required = 5
		chord_buttons = 2}
	tutorial_hide_narrator
	jam_tutorial_destroy_anim
	jam_tutorial_lesson_complete
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x27c54a39)}
	Wait \{1
		Seconds}
	tutorial_play_sound \{Sound = 'Tut_RS_Rhythm_04_BAS'}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	jam_tutorial_anim \{anim = chord_3}
	Wait \{1
		Seconds}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x7beea490)}
	jam_tutorial_chord_challenge \{chords_required = 4
		chord_buttons = 3}
	tutorial_hide_narrator
	jam_tutorial_destroy_anim
	tutorial_play_sound \{Sound = 'Tut_RS_Rhythm_05_BAS'}
	Wait \{0.5
		Seconds}
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_chord_challenge \{chords_required = 0}
	if (<chord_buttons> = 2)
		<array> = [
			17
			272
			4352
			69632
			257
			4112
			65792
		]
		<chord_text> = qs(0x501cb99e)
		<plural_chords_text> = qs(0x596dd695)
	elseif (<chord_buttons> = 3)
		<array> = [
			273
			4368
			69888
			4113
			4353
			65808
			69648
		]
		<chord_text> = qs(0xdc3bc508)
		<plural_chords_text> = qs(0x27c54a39)
	elseif (<chord_buttons> = 5)
		<array> = [
			17
			272
			4352
			69632
			257
			4112
			65792
			273
			4368
			69888
			4113
			4353
			65808
			69648
		]
		<chord_text> = qs(0x53f3eb1f)
		<plural_chords_text> = qs(0xfe904ca8)
		<chord_buttons> = qs(0x281d4608)
	endif
	formatText TextName = lesson_body_1 qs(0x6eebaa9f) n = <chord_buttons>
	formatText TextName = lesson_body_3 qs(0x8c03f394) n = <chord_buttons> c = <chord_text>
	formatText TextName = lesson_body_4 qs(0x3588b7b7) c = <chord_text>
	formatText TextName = task_header qs(0xe0318f23) r = <chords_required> c = <plural_chords_text>
	tutorial_add_lesson_body_text number = 1 text = <lesson_body_1>
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0x44753f1c)}
	tutorial_add_lesson_body_text number = 3 text = <lesson_body_3>
	tutorial_add_lesson_body_text number = 4 text = <lesson_body_4>
	tutorial_set_task_header_body text = <task_header>
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Rhythm_03_BAS'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Rhythm_04_BAS'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Effects_06_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	tutorial_show_task_header
	<chords_hit> = 0
	tutorial_display_notes_hit notes_hit = <chords_hit> notes_required = <chords_required>
	begin
	Block \{Type = jam_tutorial_rhythm_strum}
	GetArraySize <array>
	<i> = 0
	begin
	if (<array> [<i>] = <event_data>.hold_pattern)
		RemoveArrayElement array = <array> index = (<i>)
		<chords_hit> = (<chords_hit> + 1)
		tutorial_display_notes_hit notes_hit = <chords_hit> notes_required = <chords_required>
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	if (<chords_hit> = <chords_required>)
		Wait \{1
			Second}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_chord_anim 
	jam_tutorial_create_ghost_player
	<tut_ui_props> = {parent = jam_tut_anim_container Type = SpriteElement just = [center center] rgba = [255 255 255 255] Scale = (0.3, 0.3)}
	if (<num> = 2)
		DestroyScreenElement \{id = jam_tut_fret_hand_bott}
		CreateScreenElement {
			<tut_ui_props>
			id = jam_tut_fret_hand_bott
			texture = tutorial_hand_button_gr
			Pos = (580.0, 385.0)
			z_priority = 5
		}
	elseif (<num> = 3)
		DestroyScreenElement \{id = jam_tut_fret_hand_bott}
		CreateScreenElement {
			<tut_ui_props>
			id = jam_tut_fret_hand_bott
			texture = tutorial_hand_button_gry
			Pos = (580.0, 385.0)
			z_priority = 5
		}
	endif
	safe_hide \{id = jam_tut_fret_hand_bott}
	begin
	Wait \{0.25
		Seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show \{id = jam_tut_fret_hand_bott}
	jam_tut_fret_hand_bott :se_setprops \{Pos = (580.0, 385.0)}
	jam_tut_fret_hand_bott_none :se_setprops \{Pos = (580.0, 385.0)}
	jam_tut_fret_hand_top :se_setprops \{Pos = (610.0, 330.0)}
	Wait \{0.5
		Seconds}
	safe_hide \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	safe_hide \{id = jam_tut_fret_hand_bott}
	safe_show \{id = jam_tut_fret_hand_bott_none}
	jam_tut_fret_hand_bott :se_setprops \{Pos = (590.0, 385.0)}
	jam_tut_fret_hand_bott_none :se_setprops \{Pos = (590.0, 385.0)}
	jam_tut_fret_hand_top :se_setprops \{Pos = (620.0, 330.0)}
	Wait \{0.25
		Seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show \{id = jam_tut_fret_hand_bott}
	jam_tut_fret_hand_bott :se_setprops \{Pos = (600.0, 385.0)}
	jam_tut_fret_hand_bott_none :se_setprops \{Pos = (600.0, 385.0)}
	jam_tut_fret_hand_top :se_setprops \{Pos = (630.0, 330.0)}
	Wait \{0.5
		Seconds}
	safe_hide \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	safe_hide \{id = jam_tut_fret_hand_bott}
	safe_show \{id = jam_tut_fret_hand_bott_none}
	jam_tut_fret_hand_bott :se_setprops \{Pos = (590.0, 385.0)}
	jam_tut_fret_hand_bott_none :se_setprops \{Pos = (590.0, 385.0)}
	jam_tut_fret_hand_top :se_setprops \{Pos = (620.0, 330.0)}
	repeat
endscript

script jam_tutorial_effects 
	tutorial_change_header_type \{Type = studio}
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x9d27f0a8)}
	Wait \{1
		Second}
	<effects> = []
	<effect> = ($jam_current_instrument_effects [0])
	<effects> = (<effects> + <effect>)
	tutorial_play_sound \{Sound = 'Tut_RS_Effects_01_BAS'}
	Wait \{1
		Seconds}
	tutorial_destroy_title
	jam_tutorial_show_narrator
	jam_tutorial_instrument_select_menu \{Player = 1
		instrument = rhythm}
	Wait \{0.5
		Seconds}
	jam_tutorial_add_arrow \{instrument = rhythm
		time = 1}
	Wait \{0.5
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		time = 1}
	Wait \{0.5
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	jam_tutorial_add_arrow \{instrument = bass
		time = 1}
	Wait \{0.5
		Seconds}
	tutorial_play_sound \{Sound = 'Tut_RS_Effects_02_BAS'}
	Wait \{1
		Second}
	jam_destroy_select_instrument_menu \{Player = 1}
	Wait \{11
		Second}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	tutorial_play_sound \{Sound = 'Tut_RS_Effects_03_BAS'}
	Wait \{2
		Second}
	tutorial_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x98575584)}
	jam_tutorial_change_effect_challenge effects = <effects>
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Effects_04_BAS'
		Wait}
	Wait \{1
		Second}
	jam_tutorial_add_arrow \{Pos = (450.0, 490.0)
		life = 6
		Scale = 0.5
		rot = 90}
	tutorial_play_sound \{Sound = 'Tut_RS_Effects_05_BAS'
		Wait}
	Wait \{1
		Second}
	tutorial_hide_narrator
	tutorial_change_header_type \{Type = standard}
	jam_tutorial_show_narrator
	tutorial_play_sound \{Sound = 'Tut_RS_Effects_06_BAS'}
	tutorial_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x1463f44f)}
	jam_tutorial_chord_challenge \{chords_required = 10
		chord_buttons = 5}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Effects_07_BAS'}
	Wait \{2
		Second}
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{tutorials
			params = {
				rs_rhythm_lesson = complete
			}}
	endif
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_change_effect_challenge 
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x55b26523)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0x14252dbe)}
	tutorial_set_task_header_body \{text = qs(0xfb8e13c2)}
	tutorial_show_lesson_header
	tutorial_show_task_header
	jam_tutorial_effects_show_menu \{time = 2}
	begin
	Block \{Type = jam_tutorial_changed_effect}
	if NOT ArrayContains array = <effects> contains = (<event_data>.effect)
		<effects> = (<effects> + (<event_data>.effect))
		break
	else
		tutorial_play_sound \{Sound = 'Tut_RS_StepRec_04_BAS'}
		jam_tutorial_effects_show_menu \{time = 2}
	endif
	repeat
	tutorial_hide_lesson_header
	return effects = <effects>
endscript

script jam_tutorial_effects_show_menu \{time = 2}
	jam_band_pause \{select_player = 1
		player_cont = inst_player_cont_1
		event_cont = inst_cont_1
		forced_pause}
	LaunchEvent \{Type = unfocus
		target = vmenu_options_1}
	Wait <time> Seconds
	jam_band_pause_effects {
		player_cont = inst_player_cont_1
		player_pause = jam_band_pause_1
		scrolling_options = scrolling_options_1
		event_cont = inst_cont_1
		select_player = 1
		text_id = option_text_0_1
		option = 0
		vmenu_id = vmenu_options_1
		respawn_input = 1
		device_num = 0
		controller = ($primary_controller)
		device_num = ($primary_controller)
	}
endscript

script jam_tutorial_drums 
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 2}
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x8f494289)}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Drums_01_BAS'}
	Wait \{3
		Seconds}
	tutorial_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{Player = 1
		instrument = drums}
	jam_tutorial_add_arrow \{instrument = drums}
	Wait \{3
		Seconds}
	tutorial_play_sound \{Sound = 'Tut_RS_Drums_02_BAS'}
	Wait \{6
		Seconds}
	jam_destroy_select_instrument_menu \{Player = 1}
	tutorial_show_narrator \{narrator = 'bassist'}
	Wait \{5
		Seconds}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums
		drum_kit = 2}
	Wait \{1
		Seconds}
	tutorial_play_sound \{Sound = 'Tut_RS_Drums_03_BAS'}
	tutorial_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x1b2b08ac)}
	jam_tutorial_drum_solo_challenge
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_drum_solo_challenge 
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x0ea89302)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0xb222daab)}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0x3e14ea4a)}
	tutorial_set_task_header_body \{text = qs(0x02042962)}
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Drums_03_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	tutorial_show_task_header
	<num_beats> = 0
	<num_beats_required> = 25
	<max_time_between_beats> = 2
	begin
	tutorial_display_notes_hit notes_hit = <num_beats> notes_required = <num_beats_required>
	Block \{Type = jam_tutorial_drum_hit}
	if (<event_data>.hold_pattern = timed_out)
		tutorial_play_sound \{Sound = 'Tut_Vs_BattleTilt_16_BAS'
			Wait}
		tutorial_play_sound \{Sound = 'Tut_Vs_BattleTilt_04_BAS'}
		<num_beats> = 0
	else
		KillSpawnedScript \{Name = jam_tutorial_drum_solo_expire}
		SpawnScriptNow jam_tutorial_drum_solo_expire params = {time = <max_time_between_beats>}
		<num_beats> = (<num_beats> + 1)
		<num_beats_left> = (<num_beats_required> - <num_beats>)
		if (<num_beats_left> = 0)
			tutorial_display_notes_hit notes_hit = <num_beats> notes_required = <num_beats_required>
			tutorial_play_sound \{Sound = 'Tut_RS_Drums_04_BAS'}
			Wait \{1
				Second}
			break
		endif
	endif
	Wait \{1
		gameframes}
	repeat
	tutorial_hide_narrator
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_drum_solo_expire \{time = 2}
	Wait <time> Seconds
	broadcastevent \{Type = jam_tutorial_drum_hit
		data = {
			hold_pattern = timed_out
		}}
endscript

script jam_tutorial_drum_kits 
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x5d282f67)}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Drums_05_BAS'}
	Wait \{3
		Seconds}
	tutorial_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{Player = 1
		instrument = drums}
	Wait \{3
		Seconds}
	jam_destroy_select_instrument_menu \{Player = 1}
	tutorial_show_narrator \{narrator = 'bassist'}
	Wait \{0.5
		Second}
	<drum_kits> = []
	<drum_kits> = (<drum_kits> + ($jam_current_drum_kit))
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums
		drum_kit = 4}
	<drum_kits> = (<drum_kits> + ($jam_current_drum_kit))
	tutorial_play_sound \{Sound = 'Tut_RS_Drums_06_BAS'}
	tutorial_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x70e6d601)}
	jam_tutorial_drum_tune_challenge drum_kits = <drum_kits>
	jam_tutorial_lesson_complete
	tutorial_play_sound \{Sound = 'Tut_RS_Drums_08_BAS'}
	Wait \{3
		Seconds}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums}
	tutorial_change_header_type \{Type = studio}
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xcc938a45)}
	jam_tutorial_drum_kit_challenge drum_kits = <drum_kits>
	jam_tutorial_lesson_complete
	tutorial_change_header_type \{Type = standard}
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_play_sound \{Sound = 'Tut_RS_Drums_10_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums}
	tutorial_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x67288d5c)}
	jam_tutorial_drum_tune_challenge drum_kits = <drum_kits>
	jam_tutorial_lesson_complete
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_play_sound \{Sound = 'Tut_RS_Drums_12_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums}
	tutorial_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0xa186c18c)}
	jam_tutorial_drum_percussion_challenge
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Drums_12_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Drums_13_BAS'}
	tutorial_set_lesson_header_text \{number = qs(0x6dafe020)
		text = qs(0xbc0460b3)}
	jam_tutorial_drum_tune_challenge drum_kits = <drum_kits> req_percussion = 1
	tutorial_play_sound \{Sound = 'Tut_RS_Drums_14_BAS'}
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{tutorials
			params = {
				rs_drums_lesson = complete
			}}
	endif
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_drum_percussion_challenge 
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x2ac0bc12)}
	tutorial_set_task_header_body \{text = qs(0x85d3614e)}
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Drums_12_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	tutorial_show_task_header
	Block \{Type = jam_tutorial_percussion}
	tutorial_display_notes_hit \{notes_hit = 1
		notes_required = 1}
	tutorial_hide_lesson_header
endscript

script jam_tutorial_drum_tune_challenge \{req_percussion = 0}
	if isdrumcontroller \{controller = $primary_controller}
		tutorial_add_lesson_body_text \{number = 1
			text = qs(0x0ea89302)}
		tutorial_add_lesson_body_text \{number = 2
			text = qs(0x499296b4)}
		tutorial_add_lesson_body_text \{number = 3
			text = qs(0xecd47435)}
	else
		tutorial_add_lesson_body_text \{number = 1
			text = qs(0x4ae819f6)}
		tutorial_add_lesson_body_text \{number = 2
			text = qs(0xd621af5f)}
		tutorial_add_lesson_body_text \{number = 3
			text = qs(0x210ddd68)}
	endif
	if isrbdrum \{controller = $primary_controller}
		tutorial_set_task_header_body \{text = qs(0x15093a0a)}
		<array> = [
			1048576
			65536
			4096
			256
			1
		]
	else
		tutorial_set_task_header_body \{text = qs(0x69681fd1)}
		<array> = [
			1048576
			1
			16
			256
			4096
			65536
		]
	endif
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Drums_06_BAS'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Drums_10_BAS'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Drums_13_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	tutorial_show_task_header
	jam_tutorial_show_drumpads
	GetArraySize <array>
	<notes_required> = (<array_Size>)
	tutorial_display_notes_hit notes_hit = (<notes_required> - <array_Size>) notes_required = <notes_required>
	begin
	Block \{Type = jam_tutorial_drum_hit}
	if (<req_percussion> <= $is_percussion_kit)
		GetArraySize <array>
		<i> = 0
		begin
		if (<array> [<i>] = <event_data>.hold_pattern)
			RemoveArrayElement array = <array> index = (<i>)
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		GetArraySize <array>
		tutorial_display_notes_hit notes_hit = (<notes_required> - <array_Size>) notes_required = <notes_required>
		if (<array_Size> = 0)
			Random (
				@ tutorial_play_sound \{Sound = 'Tut_RS_Drums_07_BAS'
					Wait}
				@ tutorial_play_sound \{Sound = 'Tut_RS_Drums_11_BAS'
					Wait}
				)
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	tutorial_hide_narrator
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_drum_kit_challenge 
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x3c05b881)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0xb108a594)}
	tutorial_set_task_header_body \{text = qs(0x4cdd98bc)}
	tutorial_show_lesson_header
	tutorial_show_task_header
	begin
	jam_tutorial_drum_kit_show_menu \{time = 1}
	Block \{Type = jam_change_drum_kit}
	if NOT ArrayContains array = <drum_kits> contains = (<event_data>.new_kit)
		<drum_kits> = (<drum_kits> + ($jam_current_drum_kit))
		tutorial_display_notes_hit \{notes_hit = 1
			notes_required = 1}
		break
	else
		tutorial_play_sound \{Sound = 'Tut_RS_Drums_15_BAS'
			Wait}
	endif
	repeat
	tutorial_play_sound \{Sound = 'Tut_RS_Drums_09_BAS'
		Wait}
	Wait \{1
		Second}
	tutorial_hide_narrator
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
	return drum_kits = <drum_kits>
endscript

script jam_tutorial_drum_kit_show_menu \{time = 5}
	jam_band_pause \{select_player = 1
		player_cont = inst_player_cont_1
		event_cont = inst_cont_1
		forced_pause}
	LaunchEvent \{Type = unfocus
		target = vmenu_options_1}
	Wait <time> Seconds
	ResolveScreenElementID \{id = {
			drum_select_element_1
			child = {
				scroll_menu
				child = menu
			}
		}}
	jam_band_pause_submenu {
		submenu_name = 'drum_kit'
		submenu_title = qs(0xfbfde2d2)
		player_cont = inst_player_cont_1
		player_pause = jam_band_pause_1
		scrolling_options = scrolling_options_1
		event_cont = <resolved_id>
		select_player = 1
		text_id = option_text_3_1
		option = 3
		vmenu_id = vmenu_options_1
		options_array = ($pause_drum_kit_options)
		selectable_choices
		current_submenu_choice = ($jam_current_drum_kit)
	}
	menu_jam_band_add_control_helpers \{state = pause_submenu}
endscript

script jam_tutorial_show_drumpads 
endscript

script jam_tutorial_melody 
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x5ef17a99)}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Melody_01_BAS'}
	Wait \{3
		Seconds}
	tutorial_destroy_title
	tutorial_change_header_type \{Type = studio}
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Melody_01_BAS'}
	tutorial_play_sound \{Sound = 'Tut_RS_Melody_02_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = melody}
	Wait \{0.25
		Seconds}
	tutorial_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x325952ac)}
	jam_tutorial_melody_select_challenge
	tutorial_change_header_type \{Type = standard}
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_play_sound \{Sound = 'Tut_RS_Melody_03_BAS'}
	tutorial_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x70573ee7)}
	jam_tutorial_melody_challenge
	tutorial_play_sound \{Sound = 'Tut_RS_Melody_04_BAS'}
	Wait \{3.5
		Seconds}
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
	SetGlobalTags \{tutorials
		params = {
			rs_melody_lesson = complete
		}}
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_melody_select_challenge 
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x0bef6be1)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0x8dfb018d)}
	tutorial_set_task_header_body \{text = qs(0x3c4de266)}
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Melody_02_BAS'}
	tutorial_show_task_header
	jam_tutorial_melody_type_show_menu \{time = 1}
	Block \{Type = jam_tutorial_changed_melody_kit}
	tutorial_hide_narrator
	tutorial_hide_lesson_header
endscript

script jam_tutorial_melody_type_show_menu \{time = 2}
	jam_band_pause \{select_player = 1
		player_cont = inst_player_cont_1
		event_cont = inst_cont_1
		forced_pause}
	LaunchEvent \{Type = unfocus
		target = vmenu_options_1}
	Wait <time> Seconds
	jam_band_pause_melody_kit {
		player_cont = inst_player_cont_1
		player_pause = jam_band_pause_1
		scrolling_options = scrolling_options_1
		event_cont = inst_cont_1
		select_player = 1
		text_id = option_text_0_1
		option = 0
		vmenu_id = vmenu_options_1
		respawn_input = 1
		device_num = 0
		controller = ($primary_controller)
		device_num = ($primary_controller)
	}
	menu_jam_band_add_control_helpers \{state = pause_submenu}
endscript

script jam_tutorial_melody_challenge 
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x85c22c63)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0x51458d57)}
	tutorial_set_task_header_body \{text = qs(0xcf72ad85)}
	jam_tutorial_make_noise_challenge \{notes_required = 10}
endscript

script jam_tutorial_recording 
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 2}
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x16680604)}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Record_01_BAS'}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	Wait \{1
		Second}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = lead}
	jam_tutorial_add_arrow \{Pos = (338.0, 520.0)
		life = 3
		Scale = 0.75
		rot = 0}
	tutorial_play_sound \{Sound = 'Tut_RS_Record_02_BAS'}
	jam_tutorial_recording_anim
	tutorial_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0xea08f6e8)}
	jam_tutorial_recording_challenge \{notes_required = 15
		time_limit = 25}
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_rewind
	jam_tutorial_playback
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_record_multi
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_recording_anim 
endscript

script jam_tutorial_recording_challenge 
	formatText TextName = task_header qs(0xa79c69e9) r = <notes_required>
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xa06ad694)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0xfb84d7c5)}
	tutorial_set_task_header_body text = <task_header>
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_02_BAS'}
	tutorial_show_task_header
	tutorial_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	jam_band_container :SetTags \{simplerec_controls = [
			record
			Play
		]}
	jam_band_container :SetTags \{disable_simple_rec = 0
		end_time = 0}
	Block \{Type = jam_tutorial_record_start}
	jam_band_container :SetTags \{disable_simple_rec = 1}
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	<rec_limit> = (<time_limit> * 1000)
	jam_band_container :GetTags
	switch <role>
		case rhythm
		<track> = 0
		case lead
		<track> = 1
		case bass
		<track> = 2
		case drums
		<track> = 3
		case melody
		<track> = 4
	endswitch
	<gem_array> = ($jam_tracks [<track>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	<close> = 0
	begin
	notetrack_size_after = ($<appended_id>)
	if (<close> = 0)
		if ($jam_highway_play_time >= (<rec_limit> - 2000))
			<close> = 1
		endif
		if (((<notetrack_size_after> - <notetrack_size>) / 2) >= (<notes_required> -9))
			tutorial_play_sound \{Sound = 'Tut_RS_Record_18_BAS'}
			<close> = 1
		endif
	endif
	<notes_recorded> = ((<notetrack_size_after> - <notetrack_size>) / 2)
	tutorial_display_notes_hit notes_hit = <notes_recorded> notes_required = <notes_required>
	if (<notes_recorded> >= <notes_required>)
		tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_18_BAS'}
		tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_10_BAS'
			Wait}
		break
	endif
	if ($jam_highway_play_time >= <rec_limit>)
		getplayerinfo \{1
			jam_instrument}
		deletecustomnoterange track = ($jam_tracks [<jam_instrument>].id) low_bound = 0 high_bound = ($jam_highway_song_length) s
		Change \{jam_highway_play_time = 0}
		Change \{jam_band_playline_pos = (0.0, 0.0)}
		SetScreenElementProps id = jam_band_highway_playline Pos = ($jam_band_playline_pos)
		guitar_jam_simplerecops_command_stoprec \{select_player = 1}
		guitar_jam_simplerecops_command_stopplay \{select_player = 1}
		jam_band_container :SetTags \{disable_simple_rec = 1}
		jam_band_container :SetTags \{instrument_controls = [
			]}
		tutorial_play_sound \{Sound = 'Tut_RS_Record_17_BAS'
			Wait}
		<close> = 0
		jam_band_container :SetTags \{disable_simple_rec = 0}
		Block \{Type = jam_tutorial_record_start}
		jam_band_container :SetTags \{disable_simple_rec = 1}
		jam_band_container :SetTags \{instrument_controls = [
				Enabled
			]}
	endif
	Wait \{1
		gameframe}
	repeat
	jam_band_container :SetTags \{disable_simple_rec = 0}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0x1394d7f3)}
	jam_band_container :SetTags \{simplerec_controls = [
			Play
		]}
	Block \{Type = jam_tutorial_record_end}
	jam_band_container :SetTags \{disable_simple_rec = 1}
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_rewind 
	tutorial_show_narrator \{narrator = 'bassist'}
	jam_band_container :SetTags \{disable_simple_rec = 1}
	tutorial_play_sound \{Sound = 'Tut_RS_Record_04_BAS'
		Wait}
	tutorial_play_sound \{Sound = 'Tut_RS_Record_05_BAS'}
	jam_tutorial_rewind_anim
	jam_tutorial_add_arrow \{Pos = (250.0, 610.0)
		life = 4
		Scale = 0.75
		rot = 90}
	tutorial_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x01ed9193)}
	jam_tutorial_rewind_challenge \{next = playback}
endscript

script jam_tutorial_rewind_anim 
endscript

script jam_tutorial_rewind_challenge 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x56260e2f)}
	tutorial_set_task_header_body \{text = qs(0x0f3a6d03)}
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_QuickStart_07_BAS'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_05_BAS'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_11_BAS'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_13_BAS'}
	tutorial_show_task_header
	<end_time> = ($jam_highway_play_time)
	jam_band_container :SetTags {end_time = <end_time>}
	<wrong> = 0
	<close> = 0
	jam_band_container :SetTags \{simplerec_controls = [
			skip_back
		]}
	begin
	jam_band_container :SetTags \{disable_simple_rec = 0}
	if ($jam_highway_play_time <= 0)
		tutorial_display_notes_hit \{notes_hit = 1
			notes_required = 1}
		jam_band_container :SetTags \{disable_simple_rec = 1}
		break
	endif
	GetScreenElementProps \{id = jam_band_highway_playline}
	if NOT jam_tutorial_is_rewind_vo_playing
		if (($jam_highway_play_time > (<end_time> + 1500)) && (<wrong> = 0))
			tutorial_play_sound \{Sound = 'Tut_RS_Record_19_BAS'}
			<wrong> = 1
		elseif (($jam_highway_play_time < (<end_time> -1500)) && (<wrong> = 1))
			tutorial_play_sound \{Sound = 'Tut_RS_Record_20_BAS'}
			<wrong> = 0
		elseif (($jam_highway_play_time <= (<end_time> / 2)) && (<close> = 0))
			tutorial_play_sound \{Sound = 'Tut_RS_Record_21_BAS'}
			<close> = 1
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_19_BAS'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_20_BAS'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_21_BAS'}
	if (<next> = playback)
		tutorial_play_sound \{Sound = 'Tut_RS_Record_14_BAS'}
	elseif (<next> = record)
		tutorial_play_sound \{Sound = 'Tut_RS_Record_12_BAS'}
	endif
	Wait \{1
		Second}
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_is_rewind_vo_playing 
	if tutorial_is_sound_playing \{Sound = 'Tut_RS_Record_19_BAS'}
		return \{true}
	elseif tutorial_is_sound_playing \{Sound = 'Tut_RS_Record_20_BAS'}
		return \{true}
	elseif tutorial_is_sound_playing \{Sound = 'Tut_RS_Record_21_BAS'}
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script jam_tutorial_playback 
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_14_BAS'}
	tutorial_play_sound \{Sound = 'Tut_RS_Record_07_BAS'
		Wait}
	tutorial_play_sound \{Sound = 'Tut_RS_Record_08_BAS'}
	jam_tutorial_playback_anim
	tutorial_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xf9410501)}
	jam_tutorial_playback_challenge
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_22_BAS'}
	tutorial_play_sound \{Sound = 'Tut_RS_Record_09_BAS'}
	Wait \{4
		Second}
endscript

script jam_tutorial_playback_anim 
endscript

script jam_tutorial_playback_challenge 
	jam_tutorial_show_instrument_ui
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xefc41d33)}
	tutorial_set_task_header_body \{text = qs(0xc45e24bc)}
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_14_BAS'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_08_BAS'}
	tutorial_show_task_header
	jam_band_container :SetTags \{simplerec_controls = [
			Play
		]}
	jam_band_container :SetTags \{disable_simple_rec = 0}
	Block \{Type = jam_tutorial_play_start}
	jam_band_container :SetTags \{disable_simple_rec = 1}
	jam_band_container :GetTags
	begin
	if ($jam_highway_play_time >= <end_time>)
		jam_band_container :SetTags \{disable_simple_rec = 0}
		tutorial_add_lesson_body_text \{number = 1
			text = qs(0xaa664167)}
		tutorial_play_sound \{Sound = 'Tut_RS_Record_22_BAS'}
		tutorial_display_notes_hit \{notes_hit = 1
			notes_required = 1}
		Block \{Type = jam_tutorial_play_stop}
		jam_band_container :SetTags \{disable_simple_rec = 1}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_record_multi 
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_play_sound \{Sound = 'Tut_RS_Record_10_BAS'
		Wait}
	tutorial_play_sound \{Sound = 'Tut_RS_Record_11_BAS'}
	tutorial_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x486dbff1)}
	jam_tutorial_rewind_challenge \{next = record}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	tutorial_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0xf2fca4bd)}
	jam_tutorial_recording_challenge \{notes_required = 10
		time_limit = 25}
	jam_tutorial_lesson_complete
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	tutorial_play_sound \{Sound = 'Tut_RS_Record_13_BAS'}
	Wait \{3
		Seconds}
	tutorial_set_lesson_header_text \{number = qs(0x6dafe020)
		text = qs(0x095bdf15)}
	jam_tutorial_rewind_challenge \{next = playback}
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	tutorial_set_lesson_header_text \{number = qs(0x74b4d161)
		text = qs(0x47691bc2)}
	jam_tutorial_playback_challenge
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Record_22_BAS'}
	tutorial_play_sound \{Sound = 'Tut_RS_Record_15_BAS'
		Wait}
	Wait \{0.5
		Seconds}
	tutorial_play_sound \{Sound = 'Tut_RS_Record_16_BAS'
		Wait}
	tutorial_hide_narrator
endscript

script jam_tutorial_ghtunes 
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0xb30609f5)}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_GHTunes_01_BAS'}
	Wait \{2
		Seconds}
	tutorial_destroy_title
	safe_hide \{id = jam_menu_backdrop}
	safe_hide \{id = jam_band_highway_master}
	safe_hide \{id = jam_band_black_banner}
	CreateScreenElement \{parent = root_window
		id = ghtunes_element
		Type = descinterface
		desc = 'gh_tunes_share'
		rot_angle = 0
		loading_alpha = 0
		leaderboard_select_alpha = 1
		watermark_alpha = 0}
	ghtunes_element :se_setprops info_text = ($ghtunes_leaderboard [0].info_text)
	Wait \{1
		Seconds}
	jam_tutorial_add_arrow \{z = 1000
		Pos = (821.0, 489.0)
		life = 2
		Scale = 0.5
		rot = 90}
	Wait \{2
		Seconds}
	jam_tutorial_add_arrow \{z = 1000
		Pos = (735.0, 304.0)
		life = 2
		Scale = 0.5
		rot = 90}
	Wait \{2
		Seconds}
	jam_tutorial_add_arrow \{z = 1000
		Pos = (789.0, 349.0)
		life = 2
		Scale = 0.5
		rot = 90}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_GHTunes_01_BAS'}
	Wait \{1
		Seconds}
	tutorial_play_sound \{Sound = 'Tut_RS_GHTunes_02_BAS'}
	Wait \{4
		Seconds}
	jam_tutorial_add_arrow \{z = 1000
		Pos = (656.0, 579.0)
		life = 2
		Scale = 0.5
		rot = 90}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_GHTunes_02_BAS'}
	if ScreenElementExists \{id = ghtunes_element}
		DestroyScreenElement \{id = ghtunes_element}
	endif
	safe_show \{id = jam_menu_backdrop}
	safe_show \{id = jam_band_highway_master}
	safe_show \{id = jam_band_black_banner}
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0xc66dfb16)}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_GHTunes_03_BAS'}
	Wait \{3
		Seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_GHTunes_03_BAS'}
	Wait \{1
		Second}
	tutorial_hide_narrator
	tutorial_hide_lesson_header
	safe_hide \{id = jam_menu_backdrop}
	safe_hide \{id = jam_band_highway_master}
	safe_hide \{id = jam_band_black_banner}
	loadjam \{file_name = qs(0xe6561adf)}
	Change \{jam_selected_song = qs(0xe6561adf)}
	create_jam_song_select_popup
	LaunchEvent \{Type = unfocus
		target = dialog_box_vmenu}
	tutorial_play_sound \{Sound = 'Tut_RS_GHTunes_04_BAS'}
	Wait \{5
		Seconds}
	jam_tutorial_add_arrow \{z = 1000
		Pos = (850.0, 543.0)
		life = 2
		Scale = 0.5
		rot = 90}
	Wait \{2
		Seconds}
	destroy_dialog_box
	Wait \{0.5
		Seconds}
	create_faked_jam_publish_song_menu
	LaunchEvent \{Type = unfocus
		target = current_menu}
	jam_tutorial_add_arrow \{Pos = (481.0, 226.0)
		life = 2
		Scale = 0.5
		rot = 90}
	Wait \{3
		Seconds}
	jam_tutorial_add_arrow \{Pos = (481.0, 273.0)
		life = 2
		Scale = 0.5
		rot = 90}
	jam_tutorial_add_arrow \{Pos = (481.0, 307.0)
		life = 2
		Scale = 0.5
		rot = 90}
	Wait \{4
		Seconds}
	jam_tutorial_add_arrow \{Pos = (380.0, 436.0)
		life = 2
		Scale = 0.5
		rot = 90}
	Wait \{2
		Seconds}
	jam_tutorial_add_arrow \{Pos = (481.0, 577.0)
		life = 2
		Scale = 0.5
		rot = 90}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_GHTunes_04_BAS'}
	tutorial_hide_narrator
	destroy_generic_menu
	if ScreenElementExists \{id = jam_publish_song_container}
		DestroyScreenElement \{id = jam_publish_song_container}
	endif
	safe_show \{id = jam_menu_backdrop}
	safe_show \{id = jam_band_highway_master}
	safe_show \{id = jam_band_black_banner}
	jam_tutorial_lesson_complete
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{tutorials
			params = {
				rs_recording_lesson = complete
			}}
	endif
	Change \{jam_tutorial_status = section_done}
endscript

script create_faked_jam_publish_song_menu 
	printf \{qs(0x02387e94)}
	if ScreenElementExists \{id = jam_publish_song_container}
		DestroyScreenElement \{id = jam_publish_song_container}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = jam_publish_song_container}
	back_drop_color = [50 50 50 255]
	rot = 0
	header_x = 320
	header_y = 80
	header_foreground_color = <back_drop_color>
	header_background_color = [255 255 255 255]
	make_generic_menu \{title = qs(0x7ba7b302)
		vmenu_id = create_publish_song_menu}
	add_generic_menu_text_item \{text = qs(0xe6561adf)
		choose_state = uistate_jam_publish_text_entry
		choose_state_data = {
			choose_script = jam_name_choose_script
			text = qs(0xe6561adf)
			choose_params = {
				FileName = qs(0xe6561adf)
			}
		}}
	new_genre = -1
	formatText \{TextName = genre
		qs(0x99c0ce9f)
		s = qs(0xd0ef7f05)}
	add_generic_menu_text_item {
		text = <genre>
		choose_state = uistate_jam_publish_genre
		choose_state_data = {choose_script = jam_genre_choose_script}
	}
	formatText \{TextName = guitar_playback_text
		qs(0x3f30bfe2)}
	formatText \{TextName = bass_playback_text
		qs(0x0de6aeff)}
	add_generic_menu_text_item {
		text = <guitar_playback_text>
		choose_state = uistate_jam_publish_track_select
		choose_state_data = {choose_script = jam_track_select_choose_script guitar_num = 1 playback_track1 = <playback_track1> playback_track2 = <playback_track2>}
	}
	add_generic_menu_text_item {
		text = <bass_playback_text>
		choose_state = uistate_jam_publish_track_select
		choose_state_data = {choose_script = jam_track_select_choose_script guitar_num = 2 playback_track1 = <playback_track1> playback_track2 = <playback_track2>}
	}
	add_generic_menu_icon_item {
		icon = icon_jam_preview
		text = qs(0x23e0b711)
		pad_choose_script = jam_preview_song_choose_script
		pad_choose_params = {FileName = <newfilename>}
	}
	add_generic_menu_icon_item \{icon = icon_graphics
		text = qs(0x110cf5a6)
		pad_choose_script = jam_album_art_choose_script}
	add_generic_menu_icon_item {
		icon = icon_save
		text = qs(0x2e843138)
		pad_choose_script = jam_save_and_quit_choose_script
		pad_choose_params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	}
	add_generic_menu_icon_item {
		icon = icon_jam_upload
		text = qs(0xe50aaa19)
		pad_choose_script = jam_upload_song_choose_script
		pad_choose_params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	}
	add_generic_menu_icon_item {
		icon = icon_jam_upload
		text = qs(0xfde202a4)
		pad_choose_script = jam_delete_song_choose_script
		pad_choose_params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	}
	jam_publish_draw_album_cover
	LaunchEvent \{Type = focus
		target = current_menu}
	if ($jam_signin_upload = 1)
		Change \{jam_signin_upload = 0}
		SpawnScriptNow jam_upload_song_choose_script params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	endif
	StartRendering
endscript

script jam_tutorial_sustains 
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 3}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0xba9f0f7e)}
	Wait \{1.5
		Second}
	tutorial_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{instrument = rhythm}
	Wait \{0.75
		Seconds}
	tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_01_BAS'}
	jam_tutorial_add_arrow \{instrument = rhythm
		life = 1}
	Wait \{0.5
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	Wait \{0.5
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	jam_tutorial_add_arrow \{instrument = bass
		life = 1}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_01_BAS'}
	Wait \{1
		Second}
	tutorial_show_narrator \{narrator = 'bassist'}
	jam_destroy_select_instrument_menu \{Player = 1}
	tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_02_BAS'}
	jam_tutorial_anim \{anim = sustains}
	Wait \{3
		Seconds}
	jam_tutorial_show_instrument_ui \{instrument = bass}
	tutorial_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0xa8057e3a)}
	jam_tutorial_sustains_challenge
	tutorial_hide_narrator
	jam_tutorial_destroy_anim
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_sustains_challenge 
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xf8b588d7)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0xf2985d32)}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0xed45c186)}
	tutorial_set_task_header_body \{text = qs(0x8e931ab4)}
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_02_BAS'}
	tutorial_show_task_header
	<num_sustains> = 0
	<num_sustains_required> = 5
	<min_length_sustain> = 2
	<current_sustain> = NULL
	tutorial_display_notes_hit notes_hit = <num_sustains> notes_required = <num_sustains_required>
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	begin
	Block \{Type = jam_tutorial_sustain}
	if ((<event_data>.sustain = completed) && (<current_sustain> = started))
		<current_sustain> = completed
		<num_sustains> = (<num_sustains> + 1)
		<num_sustains_left> = (<num_sustains_required> - <num_sustains>)
		tutorial_display_notes_hit notes_hit = <num_sustains> notes_required = <num_sustains_required>
		if (<num_sustains_left> = 0)
			tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_03_BAS'}
			Wait \{1
				Second}
			break
		endif
	else
		if (<event_data>.sustain = 1)
			SpawnScriptNow jam_tutorial_sustain_timer params = {time = <min_length_sustain>}
			<current_sustain> = started
		else
			if (<current_sustain> = started)
				jam_tutorial_destroy_instrument_ui
				KillSpawnedScript \{Name = jam_tutorial_sustain_timer}
				tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_13_BAS'
					Wait}
				jam_tutorial_show_instrument_ui \{instrument = bass}
			endif
		endif
	endif
	Wait \{1
		gameframes}
	repeat
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_sustain_timer 
	Wait <time> Seconds
	broadcastevent \{Type = jam_tutorial_sustain
		data = {
			sustain = completed
		}}
endscript

script jam_tutorial_sustains_anim 
	jam_tutorial_create_ghost_player
	jam_tutorial_create_ghost_g_r_y_gr_gry
	frets = [
		jam_tut_fret_hand_bg
		jam_tut_fret_hand_br
		jam_tut_fret_hand_by
	]
	<i> = 0
	begin
	Wait \{0.25
		Seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show id = (<frets> [<i>])
	Wait \{0.5
		Seconds}
	safe_hide \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	Wait \{3
		Seconds}
	safe_hide id = (<frets> [<i>])
	safe_show \{id = jam_tut_fret_hand_bott_none}
	Wait \{0.25
		Seconds}
	jam_tutorial_advance_index array = <frets> i = <i>
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show id = (<frets> [<i>])
	Wait \{0.5
		Seconds}
	safe_hide \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	Wait \{3
		Seconds}
	safe_hide id = (<frets> [<i>])
	safe_show \{id = jam_tut_fret_hand_bott_none}
	jam_tutorial_advance_index array = <frets> i = <i>
	repeat
endscript

script jam_tutorial_hos 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x9b4ec389)}
	Wait \{2
		Second}
	tutorial_destroy_title
	tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_04_BAS'}
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{Player = 1
		instrument = lead}
	Wait \{0.25
		Seconds}
	jam_tutorial_add_arrow \{instrument = lead
		time = 1}
	Wait \{0.75
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	jam_tutorial_add_arrow \{instrument = bass
		life = 1}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_04_BAS'}
	jam_destroy_select_instrument_menu \{Player = 1}
	tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_05_BAS'}
	jam_tutorial_anim \{anim = hopo}
	jam_tutorial_show_instrument_ui \{instrument = lead}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_05_BAS'}
	tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_06_BAS'}
	jam_tutorial_show_narrator
	tutorial_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x0f7779c1)}
	jam_tutorial_hopo_challenge
	jam_tutorial_destroy_anim
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_hopo_challenge 
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xf8b588d7)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0x59da698b)}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0x09c85d17)}
	tutorial_set_task_header_body \{text = qs(0xb0507429)}
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_06_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	tutorial_show_task_header
	<num_hopo> = 0
	<num_hopo_runs> = 0
	<num_hopo_runs_required> = 3
	<min_length_hopo_run> = 4
	<max_length_between_notes> = 2
	<num_hopo_runs_left> = (<num_hopo_runs_required>)
	<hopo_run> = incomplete
	tutorial_display_notes_hit notes_hit = <num_hopo_runs> notes_required = <num_hopo_runs_required>
	begin
	Block \{Type = jam_tutorial_lead_strum}
	switch (<event_data>.note_type)
		case timed_out
		if NOT (<hopo_run> = completed)
			<num_hopo> = 0
			<warning> = Random (@ 1 @ 2 @ 3 @ 4 @ 5 )
			if (<warning> = 1)
				jam_tutorial_destroy_instrument_ui
				tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_15_BAS'
					Wait}
				jam_tutorial_show_instrument_ui \{instrument = lead}
			endif
		endif
		case 0
		case 3
		KillSpawnedScript \{Name = jam_tutorial_hopo_timer}
		if (<num_hopo> > 0)
			<num_hopo> = 0
			if (<hopo_run> = incomplete)
				<warning> = Random (@ 1 @ 2 @ 3 @ 4 @ 5 )
				if (<warning> = 1)
					jam_tutorial_destroy_instrument_ui
					tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_14_BAS'
						Wait}
					jam_tutorial_show_instrument_ui \{instrument = lead}
				endif
			endif
		endif
		case 1
		case 2
		KillSpawnedScript \{Name = jam_tutorial_hopo_timer}
		<num_hopo> = (<num_hopo> + 1)
		<num_hopo_left> = (<min_length_hopo_run> - <num_hopo>)
		if (<num_hopo_left> = 0)
			<num_hopo_runs> = (<num_hopo_runs> + 1)
			<num_hopo_runs_left> = (<num_hopo_runs_required> - <num_hopo_runs>)
			<hopo_run> = completed
			tutorial_display_notes_hit notes_hit = <num_hopo_runs> notes_required = <num_hopo_runs_required>
			if (<num_hopo_runs_left> = 0)
				tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_07_BAS'}
				Wait \{1
					Second}
				break
			endif
		else
			SpawnScriptNow jam_tutorial_hopo_timer params = {time = <max_length_between_notes>}
			<hopo_run> = incomplete
		endif
	endswitch
	Wait \{1
		gameframes}
	repeat
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_hopo_timer \{time = 2}
	Wait <time> Seconds
	broadcastevent \{Type = jam_tutorial_lead_strum
		data = {
			note_type = timed_out
		}}
endscript

script jam_tutorial_hopo_anim 
	jam_tutorial_create_ghost_player
	jam_tutorial_create_ghost_g_r_y_gr_gry
	frets = [
		jam_tut_fret_hand_bott_none
		jam_tut_fret_hand_bg
		jam_tut_fret_hand_bgr
		jam_tut_fret_hand_bgry
		jam_tut_fret_hand_bgr
		jam_tut_fret_hand_bg
	]
	<i> = 0
	<strum_position> = neutral
	begin
	if NOT (<strum_position> = down)
		jam_tutorial_anim_strum \{position = down}
		<strum_position> = down
	else
		jam_tutorial_anim_strum \{position = up}
		<strum_position> = up
	endif
	safe_hide id = (<frets> [<i>])
	jam_tutorial_advance_index array = <frets> i = <i>
	safe_show id = (<frets> [<i>])
	Wait \{0.5
		Seconds}
	jam_tutorial_anim_strum \{position = neutral}
	<strum_position> = neutral
	begin
	safe_hide id = (<frets> [<i>])
	jam_tutorial_advance_index array = <frets> i = <i>
	safe_show id = (<frets> [<i>])
	Wait \{0.5
		Seconds}
	if (<frets> [<i>] = jam_tut_fret_hand_bott_none)
		break
	endif
	repeat
	repeat
endscript

script jam_tutorial_pms 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x8660155a)}
	Wait \{2
		Second}
	tutorial_destroy_title
	tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_08_BAS'}
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{Player = 1
		instrument = rhythm}
	Wait \{1
		Second}
	jam_tutorial_add_arrow \{instrument = rhythm
		life = 1}
	Wait \{0.75
		Seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	Wait \{3
		Seconds}
	jam_destroy_select_instrument_menu \{Player = 1}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_08_BAS'}
	Wait \{0.5
		Seconds}
	tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_09_BAS'}
	jam_tutorial_anim \{anim = pm}
	Wait \{5
		Seconds}
	jam_tutorial_show_narrator
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	tutorial_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x3ca5e425)}
	jam_tutorial_pm_challenge \{challenge = pm_notes}
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
	Wait \{1
		Second}
	jam_tutorial_show_narrator
	tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_11_BAS'}
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	tutorial_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x50bdae5b)}
	jam_tutorial_pm_challenge \{challenge = pm_chords}
	tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_12_BAS'
		Wait}
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{tutorials
			params = {
				rs_pro_guitar_lesson = complete
			}}
	endif
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_pm_challenge \{challenge = NULL}
	<num_pm> = 0
	<num_pm_required> = 5
	if (<challenge> = pm_notes)
		<array> = [
			1048576
			1
			16
			256
			4096
			65536
		]
		<task_header> = qs(0x1d5d60e1)
		<instructions_2> = qs(0x74f3b49a)
		<instructions_3> = qs(0x2a5092be)
	elseif (<challenge> = pm_chords)
		<array> = [
			17
			272
			4352
			69632
			257
			4112
			65792
			273
			4368
			69888
			4113
			4353
			65808
			69648
		]
		<task_header> = qs(0x807afe72)
		<instructions_2> = qs(0x8f5172a5)
		<instructions_3> = qs(0xd898efb2)
	else
		return
	endif
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x16ef05e7)}
	tutorial_add_lesson_body_text number = 2 text = <instructions_2>
	tutorial_add_lesson_body_text number = 3 text = <instructions_3>
	tutorial_set_task_header_body text = <task_header>
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_09_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	tutorial_show_task_header
	tutorial_display_notes_hit notes_hit = <num_pm> notes_required = <num_pm_required>
	begin
	Block \{Type = jam_tutorial_rhythm_strum}
	if ((<event_data>.chord_type) = 3)
		if ArrayContains array = <array> contains = (<event_data>.hold_pattern)
			<num_pm> = (<num_pm> + 1)
			<num_pm_left> = (<num_pm_required> - <num_pm>)
			tutorial_display_notes_hit notes_hit = <num_pm> notes_required = <num_pm_required>
			if (<num_pm_left> = 0)
				tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_10_BAS'
					Wait}
				Wait \{1
					Second}
				break
			endif
		endif
	endif
	Wait \{1
		gameframes}
	repeat
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_pm_anim 
endscript

script jam_tutorial_arpeggiator 
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 2}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x70e6a0e5)}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Arpeg_01_BAS'}
	Wait \{3
		Seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Arpeg_01_BAS'}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Arpeg_02_BAS'}
	tutorial_change_header_type \{Type = studio}
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0xc2c93825)}
	jam_tutorial_arpeggiator_challenge
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_Arpeg_03_BAS'
		Wait}
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_arpeggiator_challenge 
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xfd499e13)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0xcd9e7cec)}
	tutorial_set_task_header_body \{text = qs(0x2198cd2e)}
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Arpeg_02_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	tutorial_show_task_header
	jam_tutorial_show_instrument_ui \{instrument = melody
		machine = 1}
	<req_patterns> = 5
	<req_notes> = 10
	<patterns_completed> = []
	<notes_completed> = 0
	<current_pattern> = 16777216
	<current_type> = 9
	<final_instruction_added> = 0
	tutorial_display_notes_hit notes_hit = 0 notes_required = <req_patterns>
	begin
	Block \{Type = jam_tutorial_melody_hit}
	if NOT ArrayContains array = <patterns_completed> contains = ($jam_tut_arpeggiator_pattern)
		if (<current_pattern> = $jam_tut_arpeggiator_pattern)
			if (<final_instruction_added> = 1)
				<new_type> = ($jam_current_arpeggiator_type [4])
				if (<new_type> = 2)
					<notes_completed> = 0
				else
					if (<new_type> = <current_type>)
						<notes_completed> = (<notes_completed> + 1)
					else
						<notes_completed> = 1
						<current_type> = <new_type>
					endif
				endif
			else
				<notes_completed> = (<notes_completed> + 1)
			endif
		else
			<notes_completed> = 1
			<current_pattern> = $jam_tut_arpeggiator_pattern
		endif
		if (<notes_completed> = <req_notes>)
			<notes_completed> = 0
			<patterns_completed> = (<patterns_completed> + $jam_tut_arpeggiator_pattern)
			GetArraySize <patterns_completed>
			tutorial_display_notes_hit notes_hit = <array_Size> notes_required = <req_patterns>
			if (<array_Size> = <req_patterns>)
				tutorial_play_sound \{Sound = 'Tut_RS_Drums_04_BAS'}
				Wait \{1
					Second}
				break
			endif
		endif
	endif
	GetArraySize <patterns_completed>
	if ((<array_Size> = (<req_patterns> -1)) && (<final_instruction_added> = 0))
		<final_instruction_added> = 1
		tutorial_add_lesson_body_text \{number = 3
			text = qs(0x1ebc3d2c)}
	endif
	Wait \{1
		gameframe}
	repeat
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_drum_machine 
	Wait \{1
		Second}
	tutorial_show_title \{title = qs(0x1002eb7f)}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_DrumMach_01_BAS'}
	Wait \{3
		Seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_DrumMach_01_BAS'}
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_DrumMach_02_BAS'}
	tutorial_change_header_type \{Type = studio}
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0xad19d8d4)}
	jam_tutorial_drum_machine_challenge
	Wait \{1
		Second}
	jam_tutorial_drum_machine_percussion_challenge
	Wait \{1
		Second}
	tutorial_play_sound \{Sound = 'Tut_RS_DrumMach_03_BAS'
		Wait}
	tutorial_hide_narrator
	jam_tutorial_lesson_complete
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{tutorials
			params = {
				rs_advanced_tools_lesson = complete
			}}
	endif
	Change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_drum_machine_challenge 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums
		machine = 1
		drum_kit = 7}
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xf41364b1)}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0xab6c672c)}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0xb57cc0dd)}
	tutorial_set_task_header_body \{text = qs(0x78d3d2fa)}
	tutorial_show_lesson_header
	tutorial_wait_for_sound \{Sound = 'Tut_RS_DrumMach_02_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	tutorial_show_task_header
	jam_tutorial_drum_machine_loop_task
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_drum_machine_percussion_challenge 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums
		machine = 1}
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xfc0b920d)}
	tutorial_show_lesson_header
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	Block \{Type = jam_tutorial_percussion}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0xf41364b1)}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0xab6c672c)}
	tutorial_set_task_header_body \{text = qs(0x78d3d2fa)}
	tutorial_show_task_header
	jam_band_container :SetTags \{instrument_controls = [
			Enabled
		]}
	jam_tutorial_drum_machine_loop_task \{req_percussion = 1}
	tutorial_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_drum_machine_loop_task \{req_patterns = 3
		req_notes = 20
		req_percussion = 0}
	<patterns_completed> = []
	<notes_completed> = 0
	<current_pattern> = 16777216
	<current_type> = 9
	tutorial_display_notes_hit notes_hit = 0 notes_required = <req_patterns>
	begin
	Block \{Type = jam_tutorial_drum_hit}
	if (<req_percussion> <= $is_percussion_kit)
		if NOT ArrayContains array = <patterns_completed> contains = ($jam_loop_current_pattern)
			if (<current_pattern> = $jam_loop_current_pattern)
				<notes_completed> = (<notes_completed> + 1)
			else
				<notes_completed> = 1
				<current_pattern> = $jam_loop_current_pattern
			endif
			if (<notes_completed> = <req_notes>)
				<notes_completed> = 0
				<patterns_completed> = (<patterns_completed> + $jam_loop_current_pattern)
				GetArraySize <patterns_completed>
				tutorial_display_notes_hit notes_hit = <array_Size> notes_required = <req_patterns>
				if (<array_Size> = <req_patterns>)
					Random (
						@ tutorial_play_sound \{Sound = 'Tut_RS_Drums_07_BAS'}
						@ tutorial_play_sound \{Sound = 'Tut_RS_Drums_11_BAS'}
						@ tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_07_BAS'}
						@ tutorial_play_sound \{Sound = 'Tut_RS_AdvGtr_10_BAS'}
						)
					Wait \{1
						Second}
					break
				endif
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script create_jam_tutorial_message \{time = 4}
	destroy_jam_tutorial_message
	if NOT ScreenElementExists \{id = jam_tut_text_window}
		CreateScreenElement \{Type = WindowElement
			parent = jam_band_container
			id = jam_tut_text_window
			just = [
				left
				top
			]
			Pos = (230.0, 580.0)
			dims = (830.0, 65.0)}
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = jam_tut_text_window
		id = jam_tut_text
		font = fontgrid_text_a1
		just = [center center]
		internal_just = [center center]
		z_priority = 100
		rgba = [255 255 255 255]
		dims = (840.0, 50.0)
		Pos = (800.0, 25.0)
		text = <text>
		Scale = 1
		internal_scale = 0.8
		z_priority = 55
	}
	jam_tut_text :se_setprops \{Pos = (410.0, 25.0)
		time = 0.3}
	jam_tut_text :se_waitprops
	if (<time> = -1)
		return
	endif
	Wait <time> Seconds
	destroy_jam_tutorial_message
endscript

script destroy_jam_tutorial_message 
	if NOT ScreenElementExists \{id = jam_tut_text}
		return
	endif
	jam_tut_text :se_setprops \{Pos = (-100.0, 25.0)
		time = 0.3}
	jam_tut_text :se_waitprops
	DestroyScreenElement \{id = jam_tut_text}
endscript

script display_tutorial_narrator \{narrator = NULL}
	switch <narrator>
		case lou
		<texture> = tutorial_narrator_drummer_0
		<Pos> = (945.0, 130.0)
		case gor
		<texture> = tutorial_narrator_drummer_0
		<Pos> = (520.0, 150.0)
		default
		<texture> = tutorial_narrator_drummer_0
		<Pos> = (520.0, 150.0)
	endswitch
	CreateScreenElement {
		parent = jam_band_container
		Type = SpriteElement
		id = tut_narrator
		just = [center center]
		texture = <texture>
		Pos = <Pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (1.5, 1.5)
		z_priority = 4
	}
endscript

script jam_tutorial_instrument_select_menu \{Player = 1
		instrument = NULL}
	switch <instrument>
		case rhythm
		slot = 0
		case lead
		slot = 1
		case bass
		slot = 2
		case drums
		slot = 3
		default
		slot = 0
	endswitch
	formatText checksumName = player_cont 'inst_player_cont_%s' s = <Player>
	if ScreenElementExists id = <player_cont>
		jam_destroy_player \{Player = 1}
	endif
	if GotParam \{selectable}
		jam_band_container :SetTags \{disable_inst_select = 0}
	endif
	jam_create_player_container \{Player = 1}
	if NOT GotParam \{selectable}
		<slots> = [0 1 2 3 4]
		GetArraySize <slots>
		<i> = 0
		begin
		formatText checksumName = inst_select_text 'jam_%a_select_text_%b' a = (<slots> [<i>]) b = <Player>
		if (<i> = <slot>)
			LaunchEvent Type = focus target = <inst_select_text>
			<inst_select_text> :se_setprops block_events
		else
			LaunchEvent Type = unfocus target = <inst_select_text>
			<inst_select_text> :se_setprops not_focusable
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	formatText checksumName = inst_select_element 'inst_select_element_%a' a = <Player>
	if ScreenElementExists id = <inst_select_element>
		formatText checksumName = inst_select_text 'jam_%a_select_text_%b' a = <slot> b = <Player>
		LaunchEvent Type = focus target = <inst_select_text>
	endif
endscript

script jam_tutorial_inst_menu_indicate \{Player = 1
		instrument = NULL}
	switch <instrument>
		case rhythm
		slot = 0
		case lead
		slot = 1
		case bass
		slot = 2
		case drums
		slot = 3
		case melody
		slot = 4
		default
		slot = 0
	endswitch
	<slots> = [0 1 2 3 4]
	GetArraySize <slots>
	<i> = 0
	begin
	formatText checksumName = inst_select_text 'jam_%a_select_text_%b' a = (<slots> [<i>]) b = <Player>
	if (<i> = <slot>)
		LaunchEvent Type = focus target = <inst_select_text>
		<inst_select_text> :se_setprops block_events
	else
		LaunchEvent Type = unfocus target = <inst_select_text>
		<inst_select_text> :se_setprops not_focusable
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script jam_tutorial_display_instrument_icons \{icons = [
			rhythm
			lead
			bass
			drum
		]}
	if ScreenElementExists \{id = jam_tut_icon_container}
		DestroyScreenElement \{id = jam_tut_icon_container}
	endif
	CreateScreenElement \{Type = ContainerElement
		id = jam_tut_icon_container
		parent = jam_band_container
		just = [
			left
			top
		]
		Scale = (1.0, 1.0)
		z_priority = 4}
	<icon_params> = {parent = jam_tut_icon_container Type = SpriteElement just = [center center] Scale = (2.0, 2.0) z_priority = 4}
	<Pos> = (350.0, 275.0)
	if ScreenElementExists \{id = inst_player_cont_1}
		<Pos> = (<Pos> + (135.0, 0.0))
	endif
	GetArraySize <icons>
	<i> = 0
	begin
	<icon_type> = (<icons> [<i>])
	switch <icon_type>
		case rhythm
		<icon_id> = rhythm_icon
		<texture> = band_hud_guitar
		case lead
		<icon_id> = lead_icon
		<texture> = band_hud_guitar
		case bass
		<icon_id> = bass_icon
		<texture> = band_hud_bass
		case drum
		case drums
		<icon_id> = drum_icon
		<texture> = band_hud_drums
		default
		<icon_id> = rhythm_icon
		<texture> = band_hud_guitar
	endswitch
	<icon_pos> = (<Pos> + (<i> * (135.0, 0.0)))
	CreateScreenElement {
		<icon_params>
		id = <icon_id>
		texture = <texture>
		Pos = <icon_pos>
	}
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script jam_tutorial_destroy_instrument_icons 
	if ScreenElementExists \{id = jam_tut_icon_container}
		DestroyScreenElement \{id = jam_tut_icon_container}
	endif
endscript

script jam_tutorial_anim \{anim = NULL}
	KillSpawnedScript \{id = jam_tut_anim}
	if ScreenElementExists \{id = jam_tut_anim_container}
		DestroyScreenElement \{id = jam_tut_anim_container}
	endif
	CreateScreenElement \{Type = ContainerElement
		id = jam_tut_anim_container
		parent = jam_band_container
		just = [
			left
			top
		]
		Scale = (1.0, 1.0)
		z_priority = 6}
	switch <anim>
		case open_strum
		SpawnScriptNow \{id = jam_tut_anim
			jam_tutorial_open_strum_anim}
		case play_scale_single
		SpawnScriptNow \{id = jam_tut_anim
			jam_tutorial_play_scale_anim
			params = {
				anim = single
			}}
		case play_scale
		SpawnScriptNow \{id = jam_tut_anim
			jam_tutorial_play_scale_anim}
		case chord_2
		SpawnScriptNow \{id = jam_tut_anim
			jam_tutorial_chord_anim
			params = {
				num = 2
			}}
		case chord_3
		SpawnScriptNow \{id = jam_tut_anim
			jam_tutorial_chord_anim
			params = {
				num = 3
			}}
		case tilt
		SpawnScriptNow \{id = jam_tut_anim
			jam_tutorial_tilt_anim}
		case sustains
		SpawnScriptNow \{id = jam_tut_anim
			jam_tutorial_sustains_anim}
		case hopo
		SpawnScriptNow \{id = jam_tut_anim
			jam_tutorial_hopo_anim}
		case pm
		SpawnScriptNow \{id = jam_tut_anim
			jam_tutorial_pm_anim}
		case NULL
		case Default
		ScriptAssert 'Jam Tutorial Anim set to %a' a = <anim>
	endswitch
endscript

script jam_tutorial_create_ghost_player 
	if ScreenElementExists \{id = jam_tut_ghost_container}
		DestroyScreenElement \{id = jam_tut_ghost_container}
	endif
	<guitar_tex> = tutorial_guitar
	<guitar_strum> = tutorial_guitar_strum
	<guitar_strum_up> = tutorial_guitar_strum_up
	<guitar_strum_dn> = tutorial_guitar_strum_dn
	CreateScreenElement \{Type = ContainerElement
		id = jam_tut_ghost_container
		parent = jam_band_container
		just = [
			left
			top
		]
		Scale = (1.0, 1.0)
		z_priority = 6}
	<tut_ui_props> = {parent = jam_tut_ghost_container Type = SpriteElement just = [center center] rgba = [255 255 255 255] Scale = (0.3, 0.3)}
	CreateScreenElement {<tut_ui_props> id = jam_tut_guitar texture = <guitar_tex> Pos = (745.0, 360.0) z_priority = 4}
	CreateScreenElement {<tut_ui_props> id = jam_tut_hand texture = tutorial_hand_strum Pos = (925.0, 340.0) z_priority = 6}
	CreateScreenElement {<tut_ui_props> id = jam_tut_hand_dn texture = tutorial_hand_strum_dn Pos = (925.0, 340.0) z_priority = 6}
	safe_hide \{id = jam_tut_hand_dn}
	CreateScreenElement {<tut_ui_props> id = jam_tut_hand_up texture = tutorial_hand_strum_up Pos = (925.0, 340.0) z_priority = 6}
	safe_hide \{id = jam_tut_hand_up}
	CreateScreenElement {<tut_ui_props> id = jam_tut_strum texture = <guitar_strum> Pos = (880.0, 365.0) z_priority = 5}
	CreateScreenElement {<tut_ui_props> id = jam_tut_strum_up texture = <guitar_strum_up> Pos = (880.0, 365.0) z_priority = 5}
	safe_hide \{id = jam_tut_strum_up}
	CreateScreenElement {<tut_ui_props> id = jam_tut_strum_dn texture = <guitar_strum_dn> Pos = (880.0, 365.0) z_priority = 5}
	safe_hide \{id = jam_tut_strum_down}
	CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_top texture = tutorial_hand_wrist Pos = (605.0, 330.0) z_priority = 3}
	CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_bott_none texture = tutorial_hand_button_none Pos = (580.0, 385.0) z_priority = 5}
	jam_tut_ghost_container :SetTags \{strum_position = neutral}
endscript

script jam_tutorial_anim_strum \{position = NULL}
	jam_tut_ghost_container :GetTags
	switch <strum_position>
		case up
		safe_hide \{id = jam_tut_strum_up}
		safe_hide \{id = jam_tut_hand_up}
		case down
		safe_hide \{id = jam_tut_strum_dn}
		safe_hide \{id = jam_tut_hand_dn}
		case neutral
		default
		safe_hide \{id = jam_tut_strum}
		safe_hide \{id = jam_tut_hand}
	endswitch
	switch <position>
		case up
		safe_show \{id = jam_tut_strum_up}
		safe_show \{id = jam_tut_hand_up}
		case down
		safe_show \{id = jam_tut_strum_dn}
		safe_show \{id = jam_tut_hand_dn}
		case neutral
		default
		safe_show \{id = jam_tut_strum}
		safe_show \{id = jam_tut_hand}
	endswitch
	jam_tut_ghost_container :SetTags strum_position = <position>
endscript

script jam_tutorial_create_dpad 
	if ScreenElementExists \{id = tut_dpad}
		DestroyScreenElement \{id = tut_dpad}
	endif
	CreateScreenElement \{parent = jam_band_container
		Type = SpriteElement
		id = tut_dpad
		just = [
			center
			center
		]
		texture = d_pad
		Pos = (800.0, 200.0)
		Scale = (1.5, 1.5)
		z_priority = 10}
endscript

script jam_tutorial_create_tiltable_guitar 
	if ScreenElementExists \{id = jam_tut_ghost_container}
		DestroyScreenElement \{id = jam_tut_ghost_container}
	endif
	<guitar_tex> = tutorial_guitar
	<guitar_strum> = tutorial_guitar_strum
	<guitar_strum_up> = tutorial_guitar_strum_up
	<guitar_strum_dn> = tutorial_guitar_strum_dn
	CreateScreenElement \{Type = ContainerElement
		id = jam_tut_ghost_container
		parent = jam_band_container
		just = [
			center
			center
		]
		Pos = (845.0, 360.0)
		Scale = (1.0, 1.0)
		z_priority = 6}
	<tut_ui_props> = {parent = jam_tut_ghost_container Type = SpriteElement just = [center center] rgba = [255 255 255 255] Scale = (0.3, 0.3)}
	CreateScreenElement {<tut_ui_props> id = jam_tut_guitar texture = <guitar_tex> Pos = (-100.0, 0.0) z_priority = 4}
	CreateScreenElement {<tut_ui_props> id = jam_tut_strum texture = <guitar_strum> Pos = (37.5, 5.0) z_priority = 5}
endscript

script jam_tutorial_create_ghost_g_r_y_gr_gry 
	if ScreenElementExists \{id = jam_tut_ghost_container}
		<tut_ui_props> = {parent = jam_tut_ghost_container Type = SpriteElement just = [center center] rgba = [255 255 255 255] Scale = (0.3, 0.3)}
		CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_bg texture = tutorial_hand_button_g Pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_bg}
		CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_br texture = tutorial_hand_button_r Pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_br}
		CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_by texture = tutorial_hand_button_y Pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_by}
		CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_bgr texture = tutorial_hand_button_gr Pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_bgr}
		CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_bgry texture = tutorial_hand_button_gry Pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_bgry}
	endif
endscript

script jam_tutorial_show_instrument_ui \{Player = 1
		machine = 0
		drum_kit = -1}
	jam_destroy_player \{Player = 1}
	Wait \{1
		gameframe}
	if GotParam \{instrument}
		jam_band_container :SetTags {role = <instrument>}
	else
		jam_band_container :GetTags
		<instrument> = (<role>)
	endif
	<no_palm_perc> = 0
	switch <instrument>
		case rhythm
		<jam_instrument> = 0
		case lead
		<jam_instrument> = 1
		case bass
		<jam_instrument> = 2
		<no_palm_perc> = 1
		case drums
		<jam_instrument> = 3
		case melody
		<no_palm_perc> = 1
		<jam_instrument> = 4
	endswitch
	if (<machine> = 1)
		if (<jam_instrument> = 3)
			Change \{is_drum_machine = 1}
		else
			is_arpeggiator = [0 0 0 0 0 0]
			SetArrayElement {
				ArrayName = is_arpeggiator
				index = <jam_instrument>
				NewValue = 1
			}
			Change is_arpeggiator = <is_arpeggiator>
		endif
	endif
	setplayerinfo 1 jam_instrument = <jam_instrument>
	CreateScreenElement \{Type = ContainerElement
		parent = jam_band_container
		id = inst_player_cont_1
		Pos = (330.0, 52.0)}
	jam_create_instrument \{select_player = 1
		player_cont = inst_player_cont_1}
	jam_create_player_info \{Player = 1
		player_cont = inst_player_cont_1}
	menu_jam_band_add_control_helpers state = instrument_ui instrument = <jam_instrument>
	if ((<jam_instrument> = 3) && (<drum_kit> > -1))
		jam_tutorial_change_drum_kit Player = 1 option_index = <drum_kit>
	endif
endscript

script jam_tutorial_destroy_instrument_ui \{Player = 1}
	stopsound \{$jam_input_current_lead
		fade_type = log_fast
		fade_time = 0.3}
	stopsound \{$jam_input_current_bass
		fade_type = log_fast
		fade_time = 0.3}
	stopsound \{$jam_input_current_chord
		fade_type = log_fast
		fade_time = 0.3}
	stopsound \{$jam_input_current_melody
		fade_type = log_fast
		fade_time = 0.3}
	jam_destroy_player \{Player = 1}
	menu_jam_band_add_control_helpers
endscript

script jam_tutorial_segment_cleanup 
	jam_tutorial_destroy_check_marks
	tutorial_destroy_all_arrows
	if ScreenElementExists \{id = ghtunes_element}
		DestroyScreenElement \{id = ghtunes_element}
	endif
	destroy_generic_menu
	if ScreenElementExists \{id = dialog_box_desc_id}
		<is_disconnect_warning> = FALSE
		dialog_box_desc_id :GetSingleTag \{is_disconnect_warning}
		if (<is_disconnect_warning> = FALSE)
			destroy_dialog_box
		endif
	endif
	formatText checksumName = base_id 'jam_fretboard_base_%s' s = <Player>
	if ScreenElementExists id = <base_id>
		<base_id> :se_setprops Pos = (0.0, 480.0) time = 0.1
	endif
	jam_tutorial_destroy_anim
	KillSpawnedScript \{id = tutorial_spawned_script}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	jam_destroy_select_instrument_menu \{Player = 1}
	jam_tutorial_destroy_instrument_ui \{Player = 1}
	SpawnScriptNow \{tutorial_destroy_title}
	tutorial_hide_narrator
	tutorial_hide_lesson_header
	screen_elements = [
		jam_tut_text
		jam_tut_icon_container
		jam_tut_check_container
		jam_tut_anim_container
		tut_narrator
		jam_tut_ghost_container
		ghmix_tut_highlight
	]
	GetArraySize <screen_elements>
	<i> = 0
	begin
	if ScreenElementExists id = (<screen_elements> [<i>])
		DestroyScreenElement id = (<screen_elements> [<i>])
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	StopSoundsByBuss \{tutorial_vo}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetTags \{tool_controls = [
				force_exit
			]}
		jam_highway_move_beginning
	endif
endscript

script jam_tutorial_show_scale 
endscript

script jam_tutorial_init_check_marks 
	if ScreenElementExists \{id = jam_tut_check_container}
		DestroyScreenElement \{id = jam_tut_check_container}
	endif
	CreateScreenElement \{Type = ContainerElement
		id = jam_tut_check_container
		parent = jam_band_container
		just = [
			left
			top
		]
		Scale = (1.0, 1.0)
		z_priority = 6}
	<check_mark_props> = {parent = jam_tut_check_container Type = SpriteElement just = [center center] rgba = [255 255 255 255] Scale = (0.5, 0.5)}
	<icon_x_inc> = 50
	<num_check_marks> = 0
	Block \{Type = jam_update_check_marks}
	begin
	if (<event_data>.num_check_marks = <num_check_marks>)
		Block \{Type = jam_update_check_marks}
	else
		if (<event_data>.num_check_marks > <num_check_marks>)
			<num_check_marks> = (<num_check_marks> + 1)
			formatText checksumName = check_id 'check_%n' n = <num_check_marks>
			<icon_pos> = (((0.0, 1.0) * 140) + ((1.0, 0.0) * (600 + (<num_check_marks> * <icon_x_inc>))))
			CreateScreenElement {
				id = <check_id>
				<check_mark_props>
				texture = tutorial_checkmark
				Pos = <icon_pos>
				z_priority = 6
			}
		else
			<num_check_marks> = (<num_check_marks> + 1)
			formatText checksumName = check_id 'check_%n' n = <num_check_marks>
			DestroyScreenElement id = <check_id>
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_tutorial_update_check_marks 
	if GotParam \{num_check_marks}
		broadcastevent Type = jam_update_check_marks data = {num_check_marks = <num_check_marks>}
	endif
endscript

script jam_tutorial_destroy_check_marks 
	KillSpawnedScript \{Name = jam_tutorial_init_check_marks}
	if ScreenElementExists \{id = jam_tut_check_container}
		DestroyScreenElement \{id = jam_tut_check_container}
	endif
endscript

script jam_tutorial_advance_index \{array = [
			NULL
		]
		i = 0}
	GetArraySize <array>
	<i> = (<i> + 1)
	if (<i> = <array_Size>)
		<i> = 0
	endif
	return i = <i>
endscript

script jam_tutorial_add_arrow \{Pos = (450.0, 175.0)
		life = 2
		Scale = 0.5}
	if GotParam \{instrument}
		switch <instrument>
			case rhythm
			<Pos> = (410.0, 155.0)
			<rot> = 90
			case lead
			<Pos> = (410.0, 195.0)
			<rot> = 90
			case bass
			<Pos> = (410.0, 235.0)
			<rot> = 90
			case drum
			case drums
			<Pos> = (410.0, 275.0)
			<rot> = 90
			case melody
			<Pos> = (410.0, 313.0)
			<rot> = 90
		endswitch
	endif
	tutorial_add_arrow <...>
endscript

script jam_tutorial_lesson_complete 
	jam_recording_add_user_control_helpers
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	SpawnScriptNow \{create_exploding_text
		id = tutorial_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	Wait \{7
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
endscript

script jam_tutorial_destroy_anim 
	if ScreenElementExists \{id = jam_tut_anim_container}
		KillSpawnedScript \{id = jam_tut_anim}
		DestroyScreenElement \{id = jam_tut_anim_container}
	endif
	if ScreenElementExists \{id = jam_tut_ghost_container}
		DestroyScreenElement \{id = jam_tut_ghost_container}
	endif
endscript

script jam_tutorial_show_narrator 
	if GotParam \{offset}
		tutorial_show_narrator \{narrator = 'bassist'
			new_pos = (1088.0, 182.0)
			hflip}
	else
		tutorial_show_narrator \{narrator = 'bassist'}
	endif
endscript

script jam_tutorial_change_drum_kit \{Player = 1
		option_index = 0}
	Change jam_current_drum_kit = <option_index>
	setsonginfo \{drum_kit = $jam_current_drum_kit}
	script_assert \{qs(0x1ea08306)}
	<respawn> = 0
	if ($jam_advanced_record = 0)
		formatText checksumName = player_info_element 'player_info_element_%a' a = <Player>
		formatText TextName = extra_info_text qs(0x4d4555da) s = (($pause_drum_kit_options) [<option_index>].name_text)
		<respawn> = 1
		if ScreenElementExists id = <player_info_element>
			<player_info_element> :se_setprops extra_info_text = <extra_info_text>
		endif
	endif
endscript
