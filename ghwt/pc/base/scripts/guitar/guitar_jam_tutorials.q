jam_tutorial_status = inactive

script jam_force_kill_tutorial \{status = section_done}
	if ($jam_tutorial_status = active)
		change \{jam_tutorial_status = skipping}
		killspawnedscript \{id = jam_tutorial_spawns}
		jam_tutorial_segment_cleanup
		jam_tutorial_skipping_message
		change jam_tutorial_status = <status>
	endif
endscript

script jam_tutorial_skipping_message 
	if screenelementexists \{id = jam_band_container}
		<parent> = jam_band_container
	elseif screenelementexists \{id = jam_studio_element}
		<parent> = jam_studio_element
	else
		return
	endif
	<text> = qs(0xec174fc2)
	<pos> = (955.0, 465.0)
	createscreenelement {
		id = tut_skip_text_container
		type = containerelement
		parent = <parent>
		z_priority = 80
	}
	createscreenelement {
		id = tut_skip_text_glow
		rgba = [0 0 0 150]
		type = spriteelement
		parent = tut_skip_text_container
		texture = mixer_glow_64
		pos = <pos>
		dims = (450.0, 90.0)
		just = [center center]
		z_priority = 78
	}
	createscreenelement {
		id = tut_skip_text_shadow
		type = textelement
		parent = tut_skip_text_container
		font = fontgrid_title_a1
		text = <text>
		scale = 1
		pos = (<pos> + (2.0, 2.0))
		just = [center center]
		rgba = [0 0 0 255]
		z_priority = 79
	}
	createscreenelement {
		id = tut_skip_text
		type = textelement
		parent = tut_skip_text_container
		font = fontgrid_title_a1
		text = <text>
		scale = 1
		pos = <pos>
		just = [center center]
		rgba = [200 200 200 255]
		z_priority = 80
	}
	if screenelementexists \{id = tut_skip_text}
		tut_skip_text :se_setprops \{alpha = 0}
		tut_skip_text_shadow :se_setprops \{alpha = 0}
		tut_skip_text_glow :se_setprops \{alpha = 0}
	endif
	if screenelementexists \{id = tut_skip_text}
		tut_skip_text :se_setprops \{alpha = 1
			time = 0.1}
		tut_skip_text_shadow :se_setprops \{alpha = 1
			time = 0.1}
		tut_skip_text_glow :se_setprops \{alpha = 1
			time = 0.1}
		tut_skip_text :se_waitprops
	endif
	wait \{0.5
		seconds}
	if screenelementexists \{id = tut_skip_text}
		tut_skip_text :se_setprops \{alpha = 0
			time = 0.1}
		tut_skip_text_shadow :se_setprops \{alpha = 0
			time = 0.1}
		tut_skip_text_glow :se_setprops \{alpha = 0
			time = 0.1}
		tut_skip_text :se_waitprops
	endif
	if screenelementexists \{id = tut_skip_text_container}
		destroyscreenelement \{id = tut_skip_text_container}
	endif
endscript

script jam_play_tutorial_topic 
	change \{game_mode = training}
	if iswinport
		if 0x1c708d82 \{controller = $primary_controller}
			switch ($jam_tutorial_menu_topics [<index>].lesson_tag)
				case rs_introduction_lesson
				case rs_lead_and_bass_lesson
				case rs_rhythm_lesson
				case rs_melody_lesson
				case rs_recording_lesson
				case rs_pro_guitar_lesson
				case rs_advanced_tools_lesson
				case rs_ghmix_editing_lesson
				case rs_ghmix_pro_techniques_tools_lesson
				change \{0xf9695deb = 1}
				setplayerinfo \{1
					part = guitar}
				case rs_drums_lesson
				change \{0xf9695deb = 3}
				setplayerinfo \{1
					part = drum}
			endswitch
		elseif isguitarcontroller \{controller = $primary_controller}
			setplayerinfo \{1
				part = guitar}
		elseif isdrumcontroller \{controller = $primary_controller}
			setplayerinfo \{1
				part = drum}
		elseif isrbdrum \{controller = $primary_controller}
			setplayerinfo \{1
				part = drum}
		endif
	else
		if isguitarcontroller \{controller = $primary_controller}
			setplayerinfo \{1
				part = guitar}
		elseif isdrumcontroller \{controller = $primary_controller}
			setplayerinfo \{1
				part = drum}
		elseif isrbdrum \{controller = $primary_controller}
			setplayerinfo \{1
				part = drum}
		endif
	endif
	if (<ghmix_tut> = 0)
		generic_event_choose \{state = uistate_jam_band
			data = {
				editing = 0
				tutorial = 1
				song = none
			}}
		<quit_button> = start
	else
		if (<ghmix_tut> = 1)
			<song_name> = 'StudioExample1'
		elseif (<ghmix_tut> = 2)
			<song_name> = 'StudioExample2'
		endif
		clearjamsession
		jam_recording_create_editable_arrays
		loadjam file_name = <song_name>
		change jam_selected_song = <song_name>
		generic_event_choose no_sound state = uistate_recording data = {editing = 1 back_to_jam_band = 0 current_instrument = 0 player = ($jam_current_recording_player)}
		<quit_button> = select
	endif
	if (<ghmix_tut> > 0)
		training_create_and_hide_headers \{type = ghmix}
	else
		training_create_and_hide_headers
	endif
	training_create_narrator_icons
	wait \{0.5
		seconds}
	jam_camera_wait
	begin
	if screenelementexists \{id = jam_band_container}
		break
	endif
	if screenelementexists \{id = jam_studio_element}
		break
	endif
	wait \{1
		gameframe}
	repeat
	if (<ghmix_tut> = 0)
		jam_band_container :settags \{disable_simple_rec = 1
			role = rhythm
			disable_inst_select = 1
			allow_easy_backout = 0}
		safe_hide \{id = jam_band_highway_playline}
	endif
	<tutorial_topic> = ($jam_tutorial_menu_topics [<index>])
	getarraysize (<tutorial_topic>.sections)
	<count> = 0
	<topic_completed> = 0
	<skipped> = 0
	begin
	if ($jam_tutorial_status = inactive)
		spawnscriptnow id = jam_tutorial_spawns (<tutorial_topic>.sections [<count>])
		change \{jam_tutorial_status = active}
	elseif ($jam_tutorial_status = force_exit)
		<topic_completed> = 1
		<force_exit> = 1
	elseif ($jam_tutorial_status = section_done)
		change \{jam_tutorial_status = inactive}
		<count> = (<count> + 1)
		if (<count> >= <array_size>)
			<topic_completed> = 1
		endif
	endif
	if controllermake <quit_button> ($primary_controller)
		<skipped> = 1
		jam_force_kill_tutorial
	endif
	if (<topic_completed> = 1)
		if screenelementexists \{id = jam_band_container}
			jam_band_container :settags \{disable_simple_rec = 0
				allow_easy_backout = 1}
			training_destroy_narrator_icons
		endif
		jam_tutorial_segment_cleanup
		training_destroy_lesson_and_task_headers
		destroy_jam_band_menu
		killspawnedscript \{id = jam_tutorial_spawns}
		setplayerinfo \{1
			part = guitar}
		if (<skipped> = 0)
			ui_memcard_autosave \{event = menu_back
				state = uistate_jam_tutorials}
			training_check_for_all_tutorials_finished
		else
			generic_event_back \{state = uistate_jam_tutorials}
		endif
		change \{jam_tutorial_status = inactive}
		startrendering
		break
	endif
	wait \{1
		gameframes}
	repeat
endscript

script jam_tutorial_intro 
	jam_band_container :settags \{challenges_complete = 0
		challenges_req = 3}
	wait \{1
		second}
	training_show_title \{title = qs(0xfc20da78)}
	wait \{0.5
		second}
	training_play_sound \{sound = 'Tut_RS_QuickStart_01_BAS'}
	wait \{5
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	wait \{9.25
		seconds}
	training_change_header_type \{type = studio}
	jam_tutorial_show_narrator
	jam_tutorial_instrument_select_menu
	training_play_sound \{sound = 'Tut_RS_QuickStart_02_BAS'}
	wait \{1
		second}
	jam_tutorial_add_arrow \{instrument = rhythm
		life = 1}
	wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	jam_tutorial_add_arrow \{instrument = bass
		life = 1}
	wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	wait \{1.25
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = melody}
	jam_tutorial_add_arrow \{instrument = melody
		life = 1}
	wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = drums}
	jam_tutorial_add_arrow \{instrument = drums
		life = 1}
	wait \{2
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	wait \{0.5
		seconds}
	jam_tutorial_select_role_challenge
	training_wait_for_sound \{sound = 'Tut_RS_QuickStart_02_BAS'}
	jam_tutorial_segment_cleanup
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :settags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_intro_noise 
	training_change_header_type \{type = standard}
	wait \{1
		second}
	training_show_title \{title = qs(0x382aa88b)}
	wait \{0.5
		second}
	training_play_sound \{sound = 'Tut_RS_QuickStart_03_BAS'}
	wait \{5
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0xe6383d2a)}
	training_add_lesson_body_text \{number = 1
		text = qs(0xfb84d7c5)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x0b74657a)}
	training_set_task_header_body \{text = qs(0x2211061e)}
	jam_tutorial_make_noise_challenge \{notes_required = 15}
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :settags {challenges_complete = <challenges_complete>}
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_intro_recording 
	wait \{1
		second}
	training_show_title \{title = qs(0x581ec86b)}
	wait \{0.5
		second}
	training_play_sound \{sound = 'Tut_RS_QuickStart_05_BAS'}
	wait \{5
		seconds}
	training_destroy_title
	wait \{1
		seconds}
	training_change_header_type \{type = standard}
	training_show_narrator \{narrator = 'bassist'}
	jam_tutorial_record_jam_challenge
	wait \{1
		second}
	training_show_title \{title = qs(0x19b96b38)}
	wait \{0.5
		second}
	training_play_sound \{sound = 'Tut_RS_QuickStart_07_BAS'}
	wait \{5
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	wait \{1
		seconds}
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x01ed9193)}
	jam_tutorial_rewind_challenge \{next = playback}
	wait \{1
		gameframe}
	training_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0xf9410501)}
	jam_tutorial_playback_challenge
	training_wait_for_sound \{sound = 'Tut_RS_Record_22_BAS'}
	training_play_sound \{sound = 'Tut_RS_QuickStart_08_BAS'}
	wait \{5
		seconds}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		setglobaltags \{training
			params = {
				rs_introduction_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_select_role_challenge 
	jam_band_container :settags \{instrument_controls = [
		]}
	if isguitarcontroller \{controller = $primary_controller}
		training_set_lesson_header_text \{number = qs(0x22ee76e7)
			text = qs(0x342e0864)}
		training_add_lesson_body_text \{number = 1
			text = qs(0x7a3ec2cc)}
		training_add_lesson_body_text \{number = 2
			text = qs(0x76fae40f)}
		training_set_task_header_body \{text = qs(0x77aa06a6)}
		training_show_narrator \{narrator = 'bassist'}
		wait \{0.15
			seconds}
		training_show_lesson_header
		training_show_task_header
		jam_tutorial_instrument_select_menu \{selectable}
		block \{type = jam_tutorial_instrument_selected}
		jam_band_container :settags \{disable_inst_select = 1}
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
		jam_band_container :settags \{role = drums}
	else
		if iswinport
			scriptassert \{'Guitar, Drum, or Keyboard controller is required to complete the tutorials!'}
		else
			scriptassert \{'Guitar or Drum controller is required to complete the tutorials!'}
		endif
	endif
endscript

script jam_tutorial_role_selected 
	jam_band_container :settags {role = <role>}
	jam_tutorial_destroy_instrument_ui
	training_wait_for_sound \{sound = 'Tut_RS_QuickStart_02_BAS'}
	training_hide_lesson_header
	training_hide_narrator
	jam_tutorial_lesson_complete
endscript

script jam_tutorial_make_noise_challenge \{notes_required = 15}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_QuickStart_03_BAS'}
	training_wait_for_sound \{sound = 'Tut_RS_Melody_03_BAS'}
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	<num_sounds> = 0
	training_display_notes_hit notes_hit = <num_sounds> notes_required = <notes_required>
	begin
	block \{anytypes = [
			jam_tutorial_lead_strum
			jam_tutorial_bass_strum
			jam_tutorial_rhythm_strum
			jam_tutorial_drum_hit
			jam_tutorial_melody_hit
		]}
	<num_sounds> = (<num_sounds> + 1)
	training_display_notes_hit notes_hit = <num_sounds> notes_required = <notes_required>
	if (<num_sounds> = <notes_required>)
		wait \{1
			seconds}
		break
	endif
	wait \{1
		gameframes}
	repeat
	training_play_sound \{sound = 'Tut_RS_QuickStart_04_BAS'}
	training_wait_for_sound \{sound = 'Tut_RS_QuickStart_04_BAS'}
	training_hide_lesson_header
	training_hide_narrator
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_record_jam_challenge 
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xc4b9f64c)}
	jam_tutorial_recording_challenge \{notes_required = 20
		time_limit = 25}
	training_play_sound \{sound = 'Tut_RS_QuickStart_06_BAS'}
	training_hide_lesson_header
	training_hide_narrator
	jam_tutorial_destroy_instrument_ui
	jam_tutorial_lesson_complete
endscript

script jam_tutorial_lead 
	jam_band_container :settags \{challenges_complete = 0
		challenges_req = 3}
	wait \{1
		second}
	training_show_title \{title = qs(0xe421d3c9)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_LeadBass_01_BAS'}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{instrument = lead}
	wait \{1
		second}
	jam_tutorial_add_arrow \{instrument = lead}
	wait \{2
		seconds}
	wait \{1
		second}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	training_play_sound \{sound = 'Tut_RS_LeadBass_02_BAS'}
	wait \{0.25
		second}
	jam_tutorial_add_arrow \{instrument = bass}
	wait \{9.75
		seconds}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_LeadBass_03_BAS'}
	wait \{2
		seconds}
	jam_tutorial_display_instrument_icons \{icons = [
			lead
			bass
			rhythm
		]}
	wait \{3.5
		seconds}
	training_wait_for_sound \{sound = 'Tut_RS_LeadBass_03_BAS'}
	jam_tutorial_destroy_instrument_icons
	training_hide_narrator
	jam_destroy_select_instrument_menu \{player = 1}
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_open_strum 
	wait \{1
		second}
	training_show_title \{title = qs(0x2ae3acdf)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_OpenStrum_01_BAS'}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	wait \{1.5
		second}
	jam_tutorial_instrument_select_menu \{instrument = rhythm}
	wait \{1.5
		second}
	jam_tutorial_add_arrow \{instrument = rhythm
		life = 1}
	wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	jam_tutorial_add_arrow \{instrument = bass
		life = 1}
	wait \{2.5
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	training_show_narrator \{narrator = 'bassist'}
	wait \{1
		second}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = lead}
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x952447a6)}
	jam_tutorial_anim \{anim = open_strum}
	training_play_sound \{sound = 'Tut_RS_OpenStrum_02_BAS'}
	wait \{2
		seconds}
	jam_tutorial_add_arrow \{pos = (900.0, 325.0)
		life = 2
		scale = 0.5}
	wait \{1
		seconds}
	jam_tutorial_add_arrow \{pos = (600.0, 325.0)
		life = 2
		scale = 0.5}
	jam_tutorial_open_strum_challenge
	training_play_sound \{sound = 'Tut_RS_OpenStrum_03_BAS'}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :settags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_open_strum_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs(0x0046eee6)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x97d68442)}
	training_set_task_header_body \{text = qs(0x47efbaf5)}
	<strums_required> = 5
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_OpenStrum_02_BAS'}
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	<num_open_strums> = 0
	<warned> = 0
	training_display_notes_hit notes_hit = <num_open_strums> notes_required = <strums_required>
	begin
	block \{type = jam_tutorial_lead_strum}
	if (<event_data>.hold_pattern = 1048576)
		<num_open_strums> = (<num_open_strums> + 1)
		training_display_notes_hit notes_hit = <num_open_strums> notes_required = <strums_required>
		if (<num_open_strums> = <strums_required>)
			wait \{1
				second}
			jam_tutorial_destroy_anim
			break
		endif
	elseif (<warned> = 0)
		training_play_sound \{sound = 'Tut_Gtr_OpenNotes_11_BAS'}
		<warned> = 1
	endif
	wait \{1
		gameframes}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_open_strum_anim 
	jam_tutorial_create_ghost_player
	begin
	wait \{0.25
		seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum_dn}
	wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	wait \{0.25
		seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum_up}
	wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	repeat
endscript

script jam_tutorial_play_scale 
	wait \{1
		second}
	training_show_title \{title = qs(0xe3dcd6ac)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Scale_01_BAS'}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = lead}
	wait \{12
		seconds}
	training_play_sound \{sound = 'Tut_RS_Scale_02_BAS'}
	jam_tutorial_anim \{anim = play_scale_single}
	wait \{2
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	training_show_narrator \{narrator = 'bassist'}
	wait \{1
		second}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = bass}
	wait \{7
		second}
	jam_tutorial_anim \{anim = play_scale}
	training_play_sound \{sound = 'Tut_RS_Scale_03_BAS'}
	wait \{2
		second}
	jam_tutorial_add_arrow \{pos = (430.0, 330.0)
		life = 3
		scale = 0.5
		rot = 90}
	wait \{3
		second}
	jam_tutorial_add_arrow \{pos = (420.0, 325.0)
		life = 3
		scale = 0.5
		rot = 0}
	training_wait_for_sound \{sound = 'Tut_RS_Scale_03_BAS'}
	wait \{0.5
		second}
	training_play_sound \{sound = 'Tut_RS_Scale_04_BAS'}
	wait \{2
		second}
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x3b61c1ed)}
	jam_tutorial_play_scale_challenge
	training_play_sound \{sound = 'Tut_RS_Scale_05_BAS'}
	wait \{2
		second}
	training_hide_narrator
	jam_tutorial_destroy_anim
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :settags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_play_scale_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs(0xce2f58d1)}
	training_add_lesson_body_text \{number = 2
		text = qs(0xf2985d32)}
	training_add_lesson_body_text \{number = 3
		text = qs(0x3b22506f)}
	training_set_task_header_body \{text = qs(0x9340de03)}
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_Scale_04_BAS'}
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	jam_tutorial_show_scale
	<array> = [
		1048576
		1
		16
		256
		4096
		65536
	]
	getarraysize <array>
	<notes_required> = (<array_size>)
	training_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	begin
	block \{type = jam_tutorial_bass_strum}
	getarraysize <array>
	<i> = 0
	begin
	if (<array> [<i>] = <event_data>.hold_pattern)
		removearrayelement array = <array> index = (<i>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	getarraysize <array>
	num_notes = (<notes_required> - <array_size>)
	training_display_notes_hit notes_hit = <num_notes> notes_required = <notes_required>
	if (<array_size> = 0)
		wait \{1
			second}
		break
	endif
	wait \{1
		gameframe}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_play_scale_anim \{anim = null}
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
	wait \{0.25
		seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show id = (<frets> [<i>])
	wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	safe_hide id = (<frets> [<i>])
	safe_show \{id = jam_tut_fret_hand_bott_none}
	wait \{0.25
		seconds}
	jam_tutorial_advance_index array = <frets> i = <i>
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show id = (<frets> [<i>])
	wait \{0.5
		seconds}
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
	wait \{1
		second}
	training_show_title \{title = qs(0x0d5279a7)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Octave_01_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = lead}
	training_wait_for_sound \{sound = 'Tut_RS_Octave_01_BAS'}
	wait \{0.5
		seconds}
	training_play_sound \{sound = 'Tut_RS_Octave_02_BAS'}
	wait \{0.75
		seconds}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	jam_tutorial_add_arrow \{instrument = bass
		life = 1}
	wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = melody}
	jam_tutorial_add_arrow \{instrument = melody
		life = 1}
	training_wait_for_sound \{sound = 'Tut_RS_Octave_02_BAS'}
	jam_destroy_select_instrument_menu \{player = 1}
	wait \{1
		second}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_narrator
	jam_tutorial_show_instrument_ui \{instrument = lead}
	jam_tutorial_anim \{anim = tilt}
	training_play_sound \{sound = 'Tut_RS_Octave_03_BAS'}
	training_wait_for_sound \{sound = 'Tut_RS_Octave_03_BAS'}
	jam_tutorial_add_arrow \{pos = (250.0, 300.0)
		life = 5
		scale = 0.5}
	training_play_sound \{sound = 'Tut_RS_Octave_04_BAS'}
	wait \{5
		seconds}
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xe16ce176)}
	jam_tutorial_destroy_anim
	jam_tutorial_tilt_challenge
	training_play_sound \{sound = 'Tut_RS_Octave_05_BAS'}
	wait \{4
		seconds}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		setglobaltags \{training
			params = {
				rs_lead_and_bass_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_tilt_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs(0x697c524c)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x5507c5e0)}
	training_set_task_header_body \{text = qs(0x3e7f2c4f)}
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_Octave_04_BAS'}
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	<notes_required> = 3
	<high_notes_hit> = 0
	<low_notes_hit> = 0
	<final_instructions_shown> = 0
	training_display_notes_hit notes_hit = (<high_notes_hit> + <low_notes_hit>) notes_required = (<notes_required> * 2)
	begin
	block \{type = jam_tutorial_lead_strum}
	if (<event_data>.tilt = 1)
		if (<high_notes_hit> < <notes_required>)
			<high_notes_hit> = (<high_notes_hit> + 1)
		endif
	else
		if (<low_notes_hit> < <notes_required>)
			<low_notes_hit> = (<low_notes_hit> + 1)
		endif
	endif
	training_display_notes_hit notes_hit = (<high_notes_hit> + <low_notes_hit>) notes_required = (<notes_required> * 2)
	if ((<high_notes_hit> >= <notes_required>) && (<low_notes_hit> >= <notes_required>))
		training_display_notes_hit notes_hit = <notes_required> notes_required = <notes_required>
		wait \{1
			second}
		break
	endif
	if ((<high_notes_hit> = <notes_required>) && (<final_instructions_shown> = 0))
		<final_instructions_shown> = 1
		training_add_lesson_body_text \{number = 3
			text = qs(0x54c8e7bd)}
	elseif ((<low_notes_hit> = <notes_required>) && (<final_instructions_shown> = 0))
		<final_instructions_shown> = 1
		training_add_lesson_body_text \{number = 3
			text = qs(0x058b6c6d)}
	endif
	wait \{1
		gameframe}
	repeat
	training_hide_lesson_header
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
	wait \{2
		seconds}
	repeat
endscript

script jam_tutorial_rhythm 
	jam_band_container :settags \{challenges_complete = 0
		challenges_req = 2}
	wait \{1
		second}
	training_show_title \{title = qs(0x1c2240c8)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Rhythm_01_BAS'}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = rhythm}
	jam_tutorial_add_arrow \{instrument = rhythm}
	wait \{5
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	training_hide_narrator
	wait \{1
		second}
	training_show_title \{title = qs(0x596dd695)}
	training_play_sound \{sound = 'Tut_RS_Rhythm_02_BAS'}
	wait \{1
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	jam_tutorial_anim \{anim = chord_2}
	wait \{9
		seconds}
	training_play_sound \{sound = 'Tut_RS_Rhythm_03_BAS'}
	wait \{2
		seconds}
	training_show_narrator \{narrator = 'bassist'}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x0546383c)}
	jam_tutorial_chord_challenge \{chords_required = 5
		chord_buttons = 2}
	training_hide_narrator
	jam_tutorial_destroy_anim
	jam_tutorial_lesson_complete
	wait \{1
		second}
	training_show_title \{title = qs(0x27c54a39)}
	wait \{1
		seconds}
	training_play_sound \{sound = 'Tut_RS_Rhythm_04_BAS'}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	jam_tutorial_anim \{anim = chord_3}
	wait \{1
		seconds}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	training_show_narrator \{narrator = 'bassist'}
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x7beea490)}
	jam_tutorial_chord_challenge \{chords_required = 4
		chord_buttons = 3}
	training_hide_narrator
	jam_tutorial_destroy_anim
	training_play_sound \{sound = 'Tut_RS_Rhythm_05_BAS'}
	wait \{0.5
		seconds}
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :settags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
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
	formattext textname = lesson_body_1 qs(0x6eebaa9f) n = <chord_buttons>
	formattext textname = lesson_body_3 qs(0x8c03f394) n = <chord_buttons> c = <chord_text>
	formattext textname = lesson_body_4 qs(0x3588b7b7) c = <chord_text>
	formattext textname = task_header qs(0xe0318f23) r = <chords_required> c = <plural_chords_text>
	training_add_lesson_body_text number = 1 text = <lesson_body_1>
	training_add_lesson_body_text \{number = 2
		text = qs(0x44753f1c)}
	training_add_lesson_body_text number = 3 text = <lesson_body_3>
	training_add_lesson_body_text number = 4 text = <lesson_body_4>
	training_set_task_header_body text = <task_header>
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_Rhythm_03_BAS'}
	training_wait_for_sound \{sound = 'Tut_RS_Rhythm_04_BAS'}
	training_wait_for_sound \{sound = 'Tut_RS_Effects_06_BAS'}
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	<chords_hit> = 0
	training_display_notes_hit notes_hit = <chords_hit> notes_required = <chords_required>
	begin
	block \{type = jam_tutorial_rhythm_strum}
	getarraysize <array>
	<i> = 0
	begin
	if (<array> [<i>] = <event_data>.hold_pattern)
		removearrayelement array = <array> index = (<i>)
		<chords_hit> = (<chords_hit> + 1)
		training_display_notes_hit notes_hit = <chords_hit> notes_required = <chords_required>
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if (<chords_hit> = <chords_required>)
		wait \{1
			second}
		break
	endif
	wait \{1
		gameframe}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_chord_anim 
	jam_tutorial_create_ghost_player
	<tut_ui_props> = {parent = jam_tut_anim_container type = spriteelement just = [center center] rgba = [255 255 255 255] scale = (0.3, 0.3)}
	if (<num> = 2)
		destroyscreenelement \{id = jam_tut_fret_hand_bott}
		createscreenelement {
			<tut_ui_props>
			id = jam_tut_fret_hand_bott
			texture = tutorial_hand_button_gr
			pos = (580.0, 385.0)
			z_priority = 5
		}
	elseif (<num> = 3)
		destroyscreenelement \{id = jam_tut_fret_hand_bott}
		createscreenelement {
			<tut_ui_props>
			id = jam_tut_fret_hand_bott
			texture = tutorial_hand_button_gry
			pos = (580.0, 385.0)
			z_priority = 5
		}
	endif
	safe_hide \{id = jam_tut_fret_hand_bott}
	begin
	wait \{0.25
		seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show \{id = jam_tut_fret_hand_bott}
	jam_tut_fret_hand_bott :se_setprops \{pos = (580.0, 385.0)}
	jam_tut_fret_hand_bott_none :se_setprops \{pos = (580.0, 385.0)}
	jam_tut_fret_hand_top :se_setprops \{pos = (610.0, 330.0)}
	wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	safe_hide \{id = jam_tut_fret_hand_bott}
	safe_show \{id = jam_tut_fret_hand_bott_none}
	jam_tut_fret_hand_bott :se_setprops \{pos = (590.0, 385.0)}
	jam_tut_fret_hand_bott_none :se_setprops \{pos = (590.0, 385.0)}
	jam_tut_fret_hand_top :se_setprops \{pos = (620.0, 330.0)}
	wait \{0.25
		seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show \{id = jam_tut_fret_hand_bott}
	jam_tut_fret_hand_bott :se_setprops \{pos = (600.0, 385.0)}
	jam_tut_fret_hand_bott_none :se_setprops \{pos = (600.0, 385.0)}
	jam_tut_fret_hand_top :se_setprops \{pos = (630.0, 330.0)}
	wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	safe_hide \{id = jam_tut_fret_hand_bott}
	safe_show \{id = jam_tut_fret_hand_bott_none}
	jam_tut_fret_hand_bott :se_setprops \{pos = (590.0, 385.0)}
	jam_tut_fret_hand_bott_none :se_setprops \{pos = (590.0, 385.0)}
	jam_tut_fret_hand_top :se_setprops \{pos = (620.0, 330.0)}
	repeat
endscript

script jam_tutorial_effects 
	training_change_header_type \{type = studio}
	wait \{1
		second}
	training_show_title \{title = qs(0x9d27f0a8)}
	wait \{1
		second}
	<effects> = []
	<effect> = ($jam_current_instrument_effects [0])
	<effects> = (<effects> + <effect>)
	training_play_sound \{sound = 'Tut_RS_Effects_01_BAS'}
	wait \{1
		seconds}
	training_destroy_title
	jam_tutorial_show_narrator
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = rhythm}
	wait \{0.5
		seconds}
	jam_tutorial_add_arrow \{instrument = rhythm
		time = 1}
	wait \{0.5
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		time = 1}
	wait \{0.5
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	jam_tutorial_add_arrow \{instrument = bass
		time = 1}
	wait \{0.5
		seconds}
	training_play_sound \{sound = 'Tut_RS_Effects_02_BAS'}
	wait \{1
		second}
	jam_destroy_select_instrument_menu \{player = 1}
	wait \{11
		second}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	training_play_sound \{sound = 'Tut_RS_Effects_03_BAS'}
	wait \{2
		second}
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x98575584)}
	jam_tutorial_change_effect_challenge effects = <effects>
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Effects_04_BAS'
		wait}
	wait \{1
		second}
	jam_tutorial_add_arrow \{pos = (450.0, 490.0)
		life = 6
		scale = 0.5
		rot = 90}
	training_play_sound \{sound = 'Tut_RS_Effects_05_BAS'
		wait}
	wait \{1
		second}
	training_hide_narrator
	training_change_header_type \{type = standard}
	jam_tutorial_show_narrator
	training_play_sound \{sound = 'Tut_RS_Effects_06_BAS'}
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x1463f44f)}
	jam_tutorial_chord_challenge \{chords_required = 10
		chord_buttons = 5}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Effects_07_BAS'}
	wait \{2
		second}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		setglobaltags \{training
			params = {
				rs_rhythm_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_change_effect_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs(0x55b26523)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x14252dbe)}
	training_set_task_header_body \{text = qs(0xfb8e13c2)}
	training_show_lesson_header
	training_show_task_header
	jam_tutorial_effects_show_menu \{time = 2}
	begin
	block \{type = jam_tutorial_changed_effect}
	if NOT arraycontains array = <effects> contains = (<event_data>.effect)
		<effects> = (<effects> + (<event_data>.effect))
		break
	else
		training_play_sound \{sound = 'Tut_RS_StepRec_04_BAS'}
		jam_tutorial_effects_show_menu \{time = 2}
	endif
	repeat
	training_hide_lesson_header
	return effects = <effects>
endscript

script jam_tutorial_effects_show_menu \{time = 2}
	jam_band_pause \{select_player = 1
		player_cont = inst_player_cont_1
		event_cont = inst_cont_1
		forced_pause}
	launchevent \{type = unfocus
		target = vmenu_options_1}
	wait <time> seconds
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
	jam_band_container :settags \{challenges_complete = 0
		challenges_req = 2}
	wait \{1
		second}
	training_show_title \{title = qs(0x8f494289)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Drums_01_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = drums}
	jam_tutorial_add_arrow \{instrument = drums}
	wait \{3
		seconds}
	training_play_sound \{sound = 'Tut_RS_Drums_02_BAS'}
	wait \{6
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	training_show_narrator \{narrator = 'bassist'}
	wait \{5
		seconds}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums
		drum_kit = 2}
	wait \{1
		seconds}
	training_play_sound \{sound = 'Tut_RS_Drums_03_BAS'}
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x1b2b08ac)}
	jam_tutorial_drum_solo_challenge
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :settags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_drum_solo_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs(0x0ea89302)}
	training_add_lesson_body_text \{number = 2
		text = qs(0xb222daab)}
	training_add_lesson_body_text \{number = 3
		text = qs(0x3e14ea4a)}
	training_set_task_header_body \{text = qs(0x02042962)}
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_Drums_03_BAS'}
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	<num_beats> = 0
	<num_beats_required> = 25
	<max_time_between_beats> = 2
	begin
	training_display_notes_hit notes_hit = <num_beats> notes_required = <num_beats_required>
	block \{type = jam_tutorial_drum_hit}
	if (<event_data>.hold_pattern = timed_out)
		training_play_sound \{sound = 'Tut_Vs_BattleTilt_16_BAS'
			wait}
		training_play_sound \{sound = 'Tut_Vs_BattleTilt_04_BAS'}
		<num_beats> = 0
	else
		killspawnedscript \{name = jam_tutorial_drum_solo_expire}
		spawnscriptnow jam_tutorial_drum_solo_expire params = {time = <max_time_between_beats>}
		<num_beats> = (<num_beats> + 1)
		<num_beats_left> = (<num_beats_required> - <num_beats>)
		if (<num_beats_left> = 0)
			training_display_notes_hit notes_hit = <num_beats> notes_required = <num_beats_required>
			training_play_sound \{sound = 'Tut_RS_Drums_04_BAS'}
			wait \{1
				second}
			break
		endif
	endif
	wait \{1
		gameframes}
	repeat
	training_hide_narrator
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_drum_solo_expire \{time = 2}
	wait <time> seconds
	broadcastevent \{type = jam_tutorial_drum_hit
		data = {
			hold_pattern = timed_out
		}}
endscript

script jam_tutorial_drum_kits 
	wait \{1
		second}
	training_show_title \{title = qs(0x5d282f67)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Drums_05_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = drums}
	wait \{3
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	training_show_narrator \{narrator = 'bassist'}
	wait \{0.5
		second}
	<drum_kits> = []
	<drum_kits> = (<drum_kits> + ($jam_current_drum_kit))
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums
		drum_kit = 4}
	<drum_kits> = (<drum_kits> + ($jam_current_drum_kit))
	training_play_sound \{sound = 'Tut_RS_Drums_06_BAS'}
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x70e6d601)}
	jam_tutorial_drum_tune_challenge drum_kits = <drum_kits>
	jam_tutorial_lesson_complete
	training_play_sound \{sound = 'Tut_RS_Drums_08_BAS'}
	wait \{3
		seconds}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums}
	training_change_header_type \{type = studio}
	training_show_narrator \{narrator = 'bassist'}
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xcc938a45)}
	jam_tutorial_drum_kit_challenge drum_kits = <drum_kits>
	jam_tutorial_lesson_complete
	training_change_header_type \{type = standard}
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_RS_Drums_10_BAS'}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums}
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x67288d5c)}
	jam_tutorial_drum_tune_challenge drum_kits = <drum_kits>
	jam_tutorial_lesson_complete
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_RS_Drums_12_BAS'}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums}
	training_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0xa186c18c)}
	jam_tutorial_drum_percussion_challenge
	training_wait_for_sound \{sound = 'Tut_RS_Drums_12_BAS'}
	jam_band_container :settags \{instrument_controls = [
		]}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Drums_13_BAS'}
	training_set_lesson_header_text \{number = qs(0x6dafe020)
		text = qs(0xbc0460b3)}
	jam_tutorial_drum_tune_challenge drum_kits = <drum_kits> req_percussion = 1
	training_play_sound \{sound = 'Tut_RS_Drums_14_BAS'}
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		setglobaltags \{training
			params = {
				rs_drums_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_drum_percussion_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs(0x2ac0bc12)}
	training_set_task_header_body \{text = qs(0x85d3614e)}
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_Drums_12_BAS'}
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	block \{type = jam_tutorial_percussion}
	training_display_notes_hit \{notes_hit = 1
		notes_required = 1}
	training_hide_lesson_header
endscript

script jam_tutorial_drum_tune_challenge \{req_percussion = 0}
	if isdrumcontroller \{controller = $primary_controller}
		training_add_lesson_body_text \{number = 1
			text = qs(0x0ea89302)}
		training_add_lesson_body_text \{number = 2
			text = qs(0x499296b4)}
		training_add_lesson_body_text \{number = 3
			text = qs(0xecd47435)}
	else
		training_add_lesson_body_text \{number = 1
			text = qs(0x4ae819f6)}
		training_add_lesson_body_text \{number = 2
			text = qs(0xd621af5f)}
		training_add_lesson_body_text \{number = 3
			text = qs(0x210ddd68)}
	endif
	if isrbdrum \{controller = $primary_controller}
		training_set_task_header_body \{text = qs(0x15093a0a)}
		<array> = [
			1048576
			65536
			4096
			256
			1
		]
	else
		training_set_task_header_body \{text = qs(0x69681fd1)}
		<array> = [
			1048576
			1
			16
			256
			4096
			65536
		]
	endif
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_Drums_06_BAS'}
	training_wait_for_sound \{sound = 'Tut_RS_Drums_10_BAS'}
	training_wait_for_sound \{sound = 'Tut_RS_Drums_13_BAS'}
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	jam_tutorial_show_drumpads
	getarraysize <array>
	<notes_required> = (<array_size>)
	training_display_notes_hit notes_hit = (<notes_required> - <array_size>) notes_required = <notes_required>
	begin
	block \{type = jam_tutorial_drum_hit}
	if (<req_percussion> <= $is_percussion_kit)
		getarraysize <array>
		<i> = 0
		begin
		if (<array> [<i>] = <event_data>.hold_pattern)
			removearrayelement array = <array> index = (<i>)
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		getarraysize <array>
		training_display_notes_hit notes_hit = (<notes_required> - <array_size>) notes_required = <notes_required>
		if (<array_size> = 0)
			Random (
				@ training_play_sound \{sound = 'Tut_RS_Drums_07_BAS'
					wait}
				@ training_play_sound \{sound = 'Tut_RS_Drums_11_BAS'
					wait}
				)
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
	training_hide_narrator
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_drum_kit_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs(0x3c05b881)}
	training_add_lesson_body_text \{number = 2
		text = qs(0xb108a594)}
	training_set_task_header_body \{text = qs(0x4cdd98bc)}
	training_show_lesson_header
	training_show_task_header
	begin
	jam_tutorial_drum_kit_show_menu \{time = 1}
	block \{type = jam_change_drum_kit}
	if NOT arraycontains array = <drum_kits> contains = (<event_data>.new_kit)
		<drum_kits> = (<drum_kits> + ($jam_current_drum_kit))
		training_display_notes_hit \{notes_hit = 1
			notes_required = 1}
		break
	else
		training_play_sound \{sound = 'Tut_RS_Drums_15_BAS'
			wait}
	endif
	repeat
	training_play_sound \{sound = 'Tut_RS_Drums_09_BAS'
		wait}
	wait \{1
		second}
	training_hide_narrator
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
	return drum_kits = <drum_kits>
endscript

script jam_tutorial_drum_kit_show_menu \{time = 5}
	jam_band_pause \{select_player = 1
		player_cont = inst_player_cont_1
		event_cont = inst_cont_1
		forced_pause}
	launchevent \{type = unfocus
		target = vmenu_options_1}
	wait <time> seconds
	resolvescreenelementid \{id = {
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
	wait \{1
		second}
	training_show_title \{title = qs(0x5ef17a99)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Melody_01_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	training_change_header_type \{type = studio}
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{sound = 'Tut_RS_Melody_01_BAS'}
	training_play_sound \{sound = 'Tut_RS_Melody_02_BAS'}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = melody}
	wait \{0.25
		seconds}
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x325952ac)}
	jam_tutorial_melody_select_challenge
	training_change_header_type \{type = standard}
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_RS_Melody_03_BAS'}
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x70573ee7)}
	jam_tutorial_melody_challenge
	if NOT iswinport
		training_play_sound \{sound = 'Tut_RS_Melody_04_BAS'}
		wait \{3.5
			seconds}
	endif
	training_hide_narrator
	jam_tutorial_lesson_complete
	setglobaltags \{training
		params = {
			rs_melody_lesson = complete
		}}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_melody_select_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs(0x0bef6be1)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x8dfb018d)}
	training_set_task_header_body \{text = qs(0x3c4de266)}
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_Melody_02_BAS'}
	training_show_task_header
	jam_tutorial_melody_type_show_menu \{time = 1}
	block \{type = jam_tutorial_changed_melody_kit}
	training_hide_narrator
	training_hide_lesson_header
endscript

script jam_tutorial_melody_type_show_menu \{time = 2}
	jam_band_pause \{select_player = 1
		player_cont = inst_player_cont_1
		event_cont = inst_cont_1
		forced_pause}
	launchevent \{type = unfocus
		target = vmenu_options_1}
	wait <time> seconds
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
	training_add_lesson_body_text \{number = 1
		text = qs(0x85c22c63)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x51458d57)}
	training_set_task_header_body \{text = qs(0xcf72ad85)}
	jam_tutorial_make_noise_challenge \{notes_required = 10}
endscript

script jam_tutorial_recording 
	if (iswinport)
		jam_band_container :settags \{challenges_complete = 0
			challenges_req = 1}
	else
		jam_band_container :settags \{challenges_complete = 0
			challenges_req = 2}
	endif
	wait \{1
		second}
	training_show_title \{title = qs(0x16680604)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Record_01_BAS'}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	wait \{1
		second}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = lead}
	jam_tutorial_add_arrow \{pos = (338.0, 520.0)
		life = 3
		scale = 0.75
		rot = 0}
	training_play_sound \{sound = 'Tut_RS_Record_02_BAS'}
	jam_tutorial_recording_anim
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0xea08f6e8)}
	jam_tutorial_recording_challenge \{notes_required = 15
		time_limit = 25}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_rewind
	jam_tutorial_playback
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_record_multi
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :settags {challenges_complete = <challenges_complete>}
	if (iswinport)
		if (<challenges_complete> = <challenges_req>)
			setglobaltags \{training
				params = {
					rs_recording_lesson = complete
				}}
		endif
	endif
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_recording_anim 
endscript

script jam_tutorial_recording_challenge 
	formattext textname = task_header qs(0xa79c69e9) r = <notes_required>
	training_add_lesson_body_text \{number = 1
		text = qs(0xa06ad694)}
	training_add_lesson_body_text \{number = 2
		text = qs(0xfb84d7c5)}
	training_set_task_header_body text = <task_header>
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_Record_02_BAS'}
	training_show_task_header
	training_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	jam_band_container :settags \{simplerec_controls = [
			record
			play
		]}
	jam_band_container :settags \{disable_simple_rec = 0
		end_time = 0}
	block \{type = jam_tutorial_record_start}
	jam_band_container :settags \{disable_simple_rec = 1}
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	<rec_limit> = (<time_limit> * 1000)
	jam_band_container :gettags
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
	appendsuffixtochecksum base = <gem_array> suffixstring = <suffix>
	notetrack_size = ($<appended_id>)
	<close> = 0
	begin
	notetrack_size_after = ($<appended_id>)
	if (<close> = 0)
		if ($jam_highway_play_time >= (<rec_limit> - 2000))
			<close> = 1
		endif
		if (((<notetrack_size_after> - <notetrack_size>) / 2) >= (<notes_required> -9))
			training_play_sound \{sound = 'Tut_RS_Record_18_BAS'}
			<close> = 1
		endif
	endif
	<notes_recorded> = ((<notetrack_size_after> - <notetrack_size>) / 2)
	training_display_notes_hit notes_hit = <notes_recorded> notes_required = <notes_required>
	if (<notes_recorded> >= <notes_required>)
		training_wait_for_sound \{sound = 'Tut_RS_Record_18_BAS'}
		training_play_sound \{sound = 'Tut_RS_AdvGtr_10_BAS'
			wait}
		break
	endif
	if ($jam_highway_play_time >= <rec_limit>)
		getplayerinfo \{1
			jam_instrument}
		jam_delete_range track = <jam_instrument> low_bound = 0 high_bound = ($jam_highway_song_length)
		change \{jam_highway_play_time = 0}
		change \{jam_band_playline_pos = (0.0, 0.0)}
		setscreenelementprops id = jam_band_highway_playline pos = ($jam_band_playline_pos)
		guitar_jam_simplerecops_command_stoprec \{select_player = 1}
		guitar_jam_simplerecops_command_stopplay \{select_player = 1}
		jam_band_container :settags \{disable_simple_rec = 1}
		jam_band_container :settags \{instrument_controls = [
			]}
		training_play_sound \{sound = 'Tut_RS_Record_17_BAS'
			wait}
		<close> = 0
		jam_band_container :settags \{disable_simple_rec = 0}
		block \{type = jam_tutorial_record_start}
		jam_band_container :settags \{disable_simple_rec = 1}
		jam_band_container :settags \{instrument_controls = [
				enabled
			]}
	endif
	wait \{1
		gameframe}
	repeat
	jam_band_container :settags \{disable_simple_rec = 0}
	training_add_lesson_body_text \{number = 3
		text = qs(0x1394d7f3)}
	jam_band_container :settags \{simplerec_controls = [
			play
		]}
	block \{type = jam_tutorial_record_end}
	jam_band_container :settags \{disable_simple_rec = 1}
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_rewind 
	training_show_narrator \{narrator = 'bassist'}
	jam_band_container :settags \{disable_simple_rec = 1}
	training_play_sound \{sound = 'Tut_RS_Record_04_BAS'
		wait}
	training_play_sound \{sound = 'Tut_RS_Record_05_BAS'}
	jam_tutorial_rewind_anim
	jam_tutorial_add_arrow \{pos = (250.0, 610.0)
		life = 4
		scale = 0.75
		rot = 90}
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x01ed9193)}
	jam_tutorial_rewind_challenge \{next = playback}
endscript

script jam_tutorial_rewind_anim 
endscript

script jam_tutorial_rewind_challenge 
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui
	training_add_lesson_body_text \{number = 1
		text = qs(0x56260e2f)}
	training_set_task_header_body \{text = qs(0x0f3a6d03)}
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_QuickStart_07_BAS'}
	training_wait_for_sound \{sound = 'Tut_RS_Record_05_BAS'}
	training_wait_for_sound \{sound = 'Tut_RS_Record_11_BAS'}
	training_wait_for_sound \{sound = 'Tut_RS_Record_13_BAS'}
	training_show_task_header
	<end_time> = ($jam_highway_play_time)
	jam_band_container :settags {end_time = <end_time>}
	<wrong> = 0
	<close> = 0
	jam_band_container :settags \{simplerec_controls = [
			skip_back
		]}
	begin
	jam_band_container :settags \{disable_simple_rec = 0}
	if ($jam_highway_play_time <= 0)
		training_display_notes_hit \{notes_hit = 1
			notes_required = 1}
		jam_band_container :settags \{disable_simple_rec = 1}
		break
	endif
	getscreenelementprops \{id = jam_band_highway_playline}
	if NOT jam_tutorial_is_rewind_vo_playing
		if (($jam_highway_play_time > (<end_time> + 1500)) && (<wrong> = 0))
			training_play_sound \{sound = 'Tut_RS_Record_19_BAS'}
			<wrong> = 1
		elseif (($jam_highway_play_time < (<end_time> -1500)) && (<wrong> = 1))
			training_play_sound \{sound = 'Tut_RS_Record_20_BAS'}
			<wrong> = 0
		elseif (($jam_highway_play_time <= (<end_time> / 2)) && (<close> = 0))
			training_play_sound \{sound = 'Tut_RS_Record_21_BAS'}
			<close> = 1
		endif
	endif
	wait \{1
		gameframe}
	repeat
	training_wait_for_sound \{sound = 'Tut_RS_Record_19_BAS'}
	training_wait_for_sound \{sound = 'Tut_RS_Record_20_BAS'}
	training_wait_for_sound \{sound = 'Tut_RS_Record_21_BAS'}
	if (<next> = playback)
		training_play_sound \{sound = 'Tut_RS_Record_14_BAS'}
	elseif (<next> = record)
		training_play_sound \{sound = 'Tut_RS_Record_12_BAS'}
	endif
	wait \{1
		second}
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_is_rewind_vo_playing 
	if training_is_sound_playing \{sound = 'Tut_RS_Record_19_BAS'}
		return \{true}
	elseif training_is_sound_playing \{sound = 'Tut_RS_Record_20_BAS'}
		return \{true}
	elseif training_is_sound_playing \{sound = 'Tut_RS_Record_21_BAS'}
		return \{true}
	else
		return \{false}
	endif
endscript

script jam_tutorial_playback 
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{sound = 'Tut_RS_Record_14_BAS'}
	training_play_sound \{sound = 'Tut_RS_Record_07_BAS'
		wait}
	training_play_sound \{sound = 'Tut_RS_Record_08_BAS'}
	jam_tutorial_playback_anim
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xf9410501)}
	jam_tutorial_playback_challenge
	training_wait_for_sound \{sound = 'Tut_RS_Record_22_BAS'}
	training_play_sound \{sound = 'Tut_RS_Record_09_BAS'}
	wait \{4
		second}
endscript

script jam_tutorial_playback_anim 
endscript

script jam_tutorial_playback_challenge 
	jam_tutorial_show_instrument_ui
	training_add_lesson_body_text \{number = 1
		text = qs(0xefc41d33)}
	training_set_task_header_body \{text = qs(0xc45e24bc)}
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_Record_14_BAS'}
	training_wait_for_sound \{sound = 'Tut_RS_Record_08_BAS'}
	training_show_task_header
	jam_band_container :settags \{simplerec_controls = [
			play
		]}
	jam_band_container :settags \{disable_simple_rec = 0}
	block \{type = jam_tutorial_play_start}
	jam_band_container :settags \{disable_simple_rec = 1}
	jam_band_container :gettags
	begin
	if ($jam_highway_play_time >= <end_time>)
		jam_band_container :settags \{disable_simple_rec = 0}
		training_add_lesson_body_text \{number = 1
			text = qs(0xaa664167)}
		training_play_sound \{sound = 'Tut_RS_Record_22_BAS'}
		training_display_notes_hit \{notes_hit = 1
			notes_required = 1}
		block \{type = jam_tutorial_play_stop}
		jam_band_container :settags \{disable_simple_rec = 1}
		break
	endif
	wait \{1
		gameframe}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_record_multi 
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_RS_Record_10_BAS'
		wait}
	training_play_sound \{sound = 'Tut_RS_Record_11_BAS'}
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x486dbff1)}
	jam_tutorial_rewind_challenge \{next = record}
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	training_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0xf2fca4bd)}
	jam_tutorial_recording_challenge \{notes_required = 10
		time_limit = 25}
	jam_tutorial_lesson_complete
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	training_play_sound \{sound = 'Tut_RS_Record_13_BAS'}
	wait \{3
		seconds}
	training_set_lesson_header_text \{number = qs(0x6dafe020)
		text = qs(0x095bdf15)}
	jam_tutorial_rewind_challenge \{next = playback}
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	training_set_lesson_header_text \{number = qs(0x74b4d161)
		text = qs(0x47691bc2)}
	jam_tutorial_playback_challenge
	training_wait_for_sound \{sound = 'Tut_RS_Record_22_BAS'}
	training_play_sound \{sound = 'Tut_RS_Record_15_BAS'
		wait}
	wait \{0.5
		seconds}
	training_play_sound \{sound = 'Tut_RS_Record_16_BAS'
		wait}
	training_hide_narrator
endscript

script jam_tutorial_ghtunes 
	wait \{1
		second}
	training_show_title \{title = qs(0xb30609f5)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_GHTunes_01_BAS'}
	wait \{2
		seconds}
	training_destroy_title
	safe_hide \{id = jam_menu_backdrop}
	safe_hide \{id = jam_band_highway_master}
	safe_hide \{id = jam_band_black_banner}
	createscreenelement \{parent = root_window
		id = ghtunes_element
		type = descinterface
		desc = 'gh_tunes_share'
		rot_angle = 0
		loading_alpha = 0
		leaderboard_select_alpha = 1
		watermark_alpha = 0}
	ghtunes_element :se_setprops info_text = ($ghtunes_leaderboard [0].info_text)
	wait \{1
		seconds}
	jam_tutorial_add_arrow \{z = 1000
		pos = (821.0, 489.0)
		life = 2
		scale = 0.5
		rot = 90}
	wait \{2
		seconds}
	jam_tutorial_add_arrow \{z = 1000
		pos = (735.0, 304.0)
		life = 2
		scale = 0.5
		rot = 90}
	wait \{2
		seconds}
	jam_tutorial_add_arrow \{z = 1000
		pos = (789.0, 349.0)
		life = 2
		scale = 0.5
		rot = 90}
	training_wait_for_sound \{sound = 'Tut_RS_GHTunes_01_BAS'}
	wait \{1
		seconds}
	training_play_sound \{sound = 'Tut_RS_GHTunes_02_BAS'}
	wait \{4
		seconds}
	jam_tutorial_add_arrow \{z = 1000
		pos = (656.0, 579.0)
		life = 2
		scale = 0.5
		rot = 90}
	training_wait_for_sound \{sound = 'Tut_RS_GHTunes_02_BAS'}
	if screenelementexists \{id = ghtunes_element}
		destroyscreenelement \{id = ghtunes_element}
	endif
	safe_show \{id = jam_menu_backdrop}
	safe_show \{id = jam_band_highway_master}
	safe_show \{id = jam_band_black_banner}
	wait \{1
		second}
	training_show_title \{title = qs(0xc66dfb16)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_GHTunes_03_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{sound = 'Tut_RS_GHTunes_03_BAS'}
	wait \{1
		second}
	training_hide_narrator
	training_hide_lesson_header
	safe_hide \{id = jam_menu_backdrop}
	safe_hide \{id = jam_band_highway_master}
	safe_hide \{id = jam_band_black_banner}
	loadjam \{file_name = qs(0xe6561adf)}
	change \{jam_selected_song = qs(0xe6561adf)}
	create_jam_song_select_popup
	launchevent \{type = unfocus
		target = pu_warning_vmenu}
	training_play_sound \{sound = 'Tut_RS_GHTunes_04_BAS'}
	wait \{5
		seconds}
	jam_tutorial_add_arrow \{z = 1000
		pos = (850.0, 543.0)
		life = 2
		scale = 0.5
		rot = 90}
	wait \{2
		seconds}
	destroy_popup_warning_menu
	wait \{0.5
		seconds}
	create_faked_jam_publish_song_menu
	launchevent \{type = unfocus
		target = current_menu}
	jam_tutorial_add_arrow \{pos = (481.0, 226.0)
		life = 2
		scale = 0.5
		rot = 90}
	wait \{3
		seconds}
	jam_tutorial_add_arrow \{pos = (481.0, 273.0)
		life = 2
		scale = 0.5
		rot = 90}
	jam_tutorial_add_arrow \{pos = (481.0, 307.0)
		life = 2
		scale = 0.5
		rot = 90}
	wait \{4
		seconds}
	jam_tutorial_add_arrow \{pos = (380.0, 436.0)
		life = 2
		scale = 0.5
		rot = 90}
	wait \{2
		seconds}
	jam_tutorial_add_arrow \{pos = (481.0, 577.0)
		life = 2
		scale = 0.5
		rot = 90}
	training_wait_for_sound \{sound = 'Tut_RS_GHTunes_04_BAS'}
	training_hide_narrator
	destroy_generic_menu
	if screenelementexists \{id = jam_publish_song_container}
		destroyscreenelement \{id = jam_publish_song_container}
	endif
	safe_show \{id = jam_menu_backdrop}
	safe_show \{id = jam_band_highway_master}
	safe_show \{id = jam_band_black_banner}
	jam_tutorial_lesson_complete
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		setglobaltags \{training
			params = {
				rs_recording_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script create_faked_jam_publish_song_menu 
	printf \{qs(0x02387e94)}
	if screenelementexists \{id = jam_publish_song_container}
		destroyscreenelement \{id = jam_publish_song_container}
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = jam_publish_song_container}
	back_drop_color = [50 50 50 255]
	rot = 0
	header_x = 320
	header_y = 80
	header_foreground_color = <back_drop_color>
	header_background_color = [255 255 255 255]
	if (iswinport)
		make_generic_menu \{title = qs(0xb5e46821)
			vmenu_id = create_publish_song_menu}
	else
		make_generic_menu \{title = qs(0x7ba7b302)
			vmenu_id = create_publish_song_menu}
	endif
	add_generic_menu_text_item \{text = qs(0xe6561adf)
		choose_state = uistate_jam_publish_text_entry
		choose_state_data = {
			choose_script = jam_name_choose_script
			text = qs(0xe6561adf)
			choose_params = {
				filename = qs(0xe6561adf)
			}
		}}
	new_genre = -1
	formattext \{textname = genre
		qs(0x99c0ce9f)
		s = qs(0xd0ef7f05)}
	add_generic_menu_text_item {
		text = <genre>
		choose_state = uistate_jam_publish_genre
		choose_state_data = {choose_script = jam_genre_choose_script}
	}
	formattext \{textname = guitar_playback_text
		qs(0x3f30bfe2)}
	formattext \{textname = bass_playback_text
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
		pad_choose_params = {filename = <newfilename>}
	}
	add_generic_menu_icon_item \{icon = icon_graphics
		text = qs(0x110cf5a6)
		pad_choose_script = jam_album_art_choose_script}
	add_generic_menu_icon_item {
		icon = icon_save
		text = qs(0x2e843138)
		pad_choose_script = jam_save_and_quit_choose_script
		pad_choose_params = {genre = <new_genre> filename = <filename> newfilename = <newfilename>}
	}
	add_generic_menu_icon_item {
		icon = icon_jam_upload
		text = qs(0xe50aaa19)
		pad_choose_script = jam_upload_song_choose_script
		pad_choose_params = {genre = <new_genre> filename = <filename> newfilename = <newfilename>}
	}
	add_generic_menu_icon_item {
		icon = icon_jam_upload
		text = qs(0xfde202a4)
		pad_choose_script = jam_delete_song_choose_script
		pad_choose_params = {genre = <new_genre> filename = <filename> newfilename = <newfilename>}
	}
	jam_publish_draw_album_cover
	launchevent \{type = focus
		target = current_menu}
	if ($jam_signin_upload = 1)
		change \{jam_signin_upload = 0}
		spawnscriptnow jam_upload_song_choose_script params = {genre = <new_genre> filename = <filename> newfilename = <newfilename>}
	endif
	startrendering
endscript

script jam_tutorial_sustains 
	jam_band_container :settags \{challenges_complete = 0
		challenges_req = 3}
	jam_band_container :settags \{instrument_controls = [
		]}
	wait \{1
		second}
	training_show_title \{title = qs(0xba9f0f7e)}
	wait \{1.5
		second}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{instrument = rhythm}
	wait \{0.75
		seconds}
	training_play_sound \{sound = 'Tut_RS_AdvGtr_01_BAS'}
	jam_tutorial_add_arrow \{instrument = rhythm
		life = 1}
	wait \{0.5
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	wait \{0.5
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	jam_tutorial_add_arrow \{instrument = bass
		life = 1}
	training_wait_for_sound \{sound = 'Tut_RS_AdvGtr_01_BAS'}
	wait \{1
		second}
	training_show_narrator \{narrator = 'bassist'}
	jam_destroy_select_instrument_menu \{player = 1}
	training_play_sound \{sound = 'Tut_RS_AdvGtr_02_BAS'}
	jam_tutorial_anim \{anim = sustains}
	wait \{3
		seconds}
	jam_tutorial_show_instrument_ui \{instrument = bass}
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0xa8057e3a)}
	jam_tutorial_sustains_challenge
	training_hide_narrator
	jam_tutorial_destroy_anim
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :settags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_sustains_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs(0xf8b588d7)}
	training_add_lesson_body_text \{number = 2
		text = qs(0xf2985d32)}
	training_add_lesson_body_text \{number = 3
		text = qs(0xed45c186)}
	training_set_task_header_body \{text = qs(0x8e931ab4)}
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_AdvGtr_02_BAS'}
	training_show_task_header
	<num_sustains> = 0
	<num_sustains_required> = 5
	<min_length_sustain> = 2
	<current_sustain> = null
	training_display_notes_hit notes_hit = <num_sustains> notes_required = <num_sustains_required>
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	begin
	block \{type = jam_tutorial_sustain}
	if ((<event_data>.sustain = completed) && (<current_sustain> = started))
		<current_sustain> = completed
		<num_sustains> = (<num_sustains> + 1)
		<num_sustains_left> = (<num_sustains_required> - <num_sustains>)
		training_display_notes_hit notes_hit = <num_sustains> notes_required = <num_sustains_required>
		if (<num_sustains_left> = 0)
			training_play_sound \{sound = 'Tut_RS_AdvGtr_03_BAS'}
			wait \{1
				second}
			break
		endif
	else
		if (<event_data>.sustain = 1)
			spawnscriptnow jam_tutorial_sustain_timer params = {time = <min_length_sustain>}
			<current_sustain> = started
		else
			if (<current_sustain> = started)
				jam_tutorial_destroy_instrument_ui
				killspawnedscript \{name = jam_tutorial_sustain_timer}
				training_play_sound \{sound = 'Tut_RS_AdvGtr_13_BAS'
					wait}
				jam_tutorial_show_instrument_ui \{instrument = bass}
			endif
		endif
	endif
	wait \{1
		gameframes}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_sustain_timer 
	wait <time> seconds
	broadcastevent \{type = jam_tutorial_sustain
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
	wait \{0.25
		seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show id = (<frets> [<i>])
	wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	wait \{3
		seconds}
	safe_hide id = (<frets> [<i>])
	safe_show \{id = jam_tut_fret_hand_bott_none}
	wait \{0.25
		seconds}
	jam_tutorial_advance_index array = <frets> i = <i>
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show id = (<frets> [<i>])
	wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	wait \{3
		seconds}
	safe_hide id = (<frets> [<i>])
	safe_show \{id = jam_tut_fret_hand_bott_none}
	jam_tutorial_advance_index array = <frets> i = <i>
	repeat
endscript

script jam_tutorial_hos 
	jam_band_container :settags \{instrument_controls = [
		]}
	wait \{1
		second}
	training_show_title \{title = qs(0x9b4ec389)}
	wait \{2
		second}
	training_destroy_title
	training_play_sound \{sound = 'Tut_RS_AdvGtr_04_BAS'}
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = lead}
	wait \{0.25
		seconds}
	jam_tutorial_add_arrow \{instrument = lead
		time = 1}
	wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = bass}
	jam_tutorial_add_arrow \{instrument = bass
		life = 1}
	training_wait_for_sound \{sound = 'Tut_RS_AdvGtr_04_BAS'}
	jam_destroy_select_instrument_menu \{player = 1}
	training_play_sound \{sound = 'Tut_RS_AdvGtr_05_BAS'}
	jam_tutorial_anim \{anim = hopo}
	jam_tutorial_show_instrument_ui \{instrument = lead}
	training_wait_for_sound \{sound = 'Tut_RS_AdvGtr_05_BAS'}
	training_play_sound \{sound = 'Tut_RS_AdvGtr_06_BAS'}
	jam_tutorial_show_narrator
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x0f7779c1)}
	jam_tutorial_hopo_challenge
	jam_tutorial_destroy_anim
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :settags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_hopo_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs(0xf8b588d7)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x59da698b)}
	training_add_lesson_body_text \{number = 3
		text = qs(0x09c85d17)}
	training_set_task_header_body \{text = qs(0xb0507429)}
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_AdvGtr_06_BAS'}
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	<num_hopo> = 0
	<num_hopo_runs> = 0
	<num_hopo_runs_required> = 3
	<min_length_hopo_run> = 4
	<max_length_between_notes> = 2
	<num_hopo_runs_left> = (<num_hopo_runs_required>)
	<hopo_run> = incomplete
	training_display_notes_hit notes_hit = <num_hopo_runs> notes_required = <num_hopo_runs_required>
	begin
	block \{type = jam_tutorial_lead_strum}
	switch (<event_data>.note_type)
		case timed_out
		if NOT (<hopo_run> = completed)
			<num_hopo> = 0
			<warning> = Random (@ 1 @ 2 @ 3 @ 4 @ 5 )
			if (<warning> = 1)
				jam_tutorial_destroy_instrument_ui
				training_play_sound \{sound = 'Tut_RS_AdvGtr_15_BAS'
					wait}
				jam_tutorial_show_instrument_ui \{instrument = lead}
			endif
		endif
		case 0
		case 3
		killspawnedscript \{name = jam_tutorial_hopo_timer}
		if (<num_hopo> > 0)
			<num_hopo> = 0
			if (<hopo_run> = incomplete)
				<warning> = Random (@ 1 @ 2 @ 3 @ 4 @ 5 )
				if (<warning> = 1)
					jam_tutorial_destroy_instrument_ui
					training_play_sound \{sound = 'Tut_RS_AdvGtr_14_BAS'
						wait}
					jam_tutorial_show_instrument_ui \{instrument = lead}
				endif
			endif
		endif
		case 1
		case 2
		killspawnedscript \{name = jam_tutorial_hopo_timer}
		<num_hopo> = (<num_hopo> + 1)
		<num_hopo_left> = (<min_length_hopo_run> - <num_hopo>)
		if (<num_hopo_left> = 0)
			<num_hopo_runs> = (<num_hopo_runs> + 1)
			<num_hopo_runs_left> = (<num_hopo_runs_required> - <num_hopo_runs>)
			<hopo_run> = completed
			training_display_notes_hit notes_hit = <num_hopo_runs> notes_required = <num_hopo_runs_required>
			if (<num_hopo_runs_left> = 0)
				training_play_sound \{sound = 'Tut_RS_AdvGtr_07_BAS'}
				wait \{1
					second}
				break
			endif
		else
			spawnscriptnow jam_tutorial_hopo_timer params = {time = <max_length_between_notes>}
			<hopo_run> = incomplete
		endif
	endswitch
	wait \{1
		gameframes}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_hopo_timer \{time = 2}
	wait <time> seconds
	broadcastevent \{type = jam_tutorial_lead_strum
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
	wait \{0.5
		seconds}
	jam_tutorial_anim_strum \{position = neutral}
	<strum_position> = neutral
	begin
	safe_hide id = (<frets> [<i>])
	jam_tutorial_advance_index array = <frets> i = <i>
	safe_show id = (<frets> [<i>])
	wait \{0.5
		seconds}
	if (<frets> [<i>] = jam_tut_fret_hand_bott_none)
		break
	endif
	repeat
	repeat
endscript

script jam_tutorial_pms 
	jam_band_container :settags \{instrument_controls = [
		]}
	wait \{1
		second}
	training_show_title \{title = qs(0x8660155a)}
	wait \{2
		second}
	training_destroy_title
	training_play_sound \{sound = 'Tut_RS_AdvGtr_08_BAS'}
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = rhythm}
	wait \{1
		second}
	jam_tutorial_add_arrow \{instrument = rhythm
		life = 1}
	wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	wait \{3
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	training_wait_for_sound \{sound = 'Tut_RS_AdvGtr_08_BAS'}
	wait \{0.5
		seconds}
	training_play_sound \{sound = 'Tut_RS_AdvGtr_09_BAS'}
	jam_tutorial_anim \{anim = pm}
	wait \{5
		seconds}
	jam_tutorial_show_narrator
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x3ca5e425)}
	jam_tutorial_pm_challenge \{challenge = pm_notes}
	training_hide_narrator
	jam_tutorial_lesson_complete
	wait \{1
		second}
	jam_tutorial_show_narrator
	training_play_sound \{sound = 'Tut_RS_AdvGtr_11_BAS'}
	jam_tutorial_show_instrument_ui \{instrument = rhythm}
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x50bdae5b)}
	jam_tutorial_pm_challenge \{challenge = pm_chords}
	training_play_sound \{sound = 'Tut_RS_AdvGtr_12_BAS'
		wait}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		setglobaltags \{training
			params = {
				rs_pro_guitar_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_pm_challenge \{challenge = null}
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
	training_add_lesson_body_text \{number = 1
		text = qs(0x16ef05e7)}
	training_add_lesson_body_text number = 2 text = <instructions_2>
	training_add_lesson_body_text number = 3 text = <instructions_3>
	training_set_task_header_body text = <task_header>
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_AdvGtr_09_BAS'}
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	training_display_notes_hit notes_hit = <num_pm> notes_required = <num_pm_required>
	begin
	block \{type = jam_tutorial_rhythm_strum}
	if ((<event_data>.chord_type) = 3)
		if arraycontains array = <array> contains = (<event_data>.hold_pattern)
			<num_pm> = (<num_pm> + 1)
			<num_pm_left> = (<num_pm_required> - <num_pm>)
			training_display_notes_hit notes_hit = <num_pm> notes_required = <num_pm_required>
			if (<num_pm_left> = 0)
				training_play_sound \{sound = 'Tut_RS_AdvGtr_10_BAS'
					wait}
				wait \{1
					second}
				break
			endif
		endif
	endif
	wait \{1
		gameframes}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_pm_anim 
endscript

script jam_tutorial_arpeggiator 
	jam_band_container :settags \{challenges_complete = 0
		challenges_req = 2}
	jam_band_container :settags \{instrument_controls = [
		]}
	wait \{1
		second}
	training_show_title \{title = qs(0x70e6a0e5)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Arpeg_01_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{sound = 'Tut_RS_Arpeg_01_BAS'}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Arpeg_02_BAS'}
	training_change_header_type \{type = studio}
	training_show_narrator \{narrator = 'bassist'}
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0xc2c93825)}
	jam_tutorial_arpeggiator_challenge
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Arpeg_03_BAS'
		wait}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :settags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_arpeggiator_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs(0xfd499e13)}
	training_add_lesson_body_text \{number = 2
		text = qs(0xcd9e7cec)}
	training_set_task_header_body \{text = qs(0x2198cd2e)}
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_Arpeg_02_BAS'}
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	jam_tutorial_show_instrument_ui \{instrument = melody
		machine = 1}
	<req_patterns> = 5
	<req_notes> = 10
	<patterns_completed> = []
	<notes_completed> = 0
	<current_pattern> = 16777216
	<current_type> = 9
	<final_instruction_added> = 0
	training_display_notes_hit notes_hit = 0 notes_required = <req_patterns>
	begin
	block \{type = jam_tutorial_melody_hit}
	if NOT arraycontains array = <patterns_completed> contains = ($jam_tut_arpeggiator_pattern)
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
			getarraysize <patterns_completed>
			training_display_notes_hit notes_hit = <array_size> notes_required = <req_patterns>
			if (<array_size> = <req_patterns>)
				training_play_sound \{sound = 'Tut_RS_Drums_04_BAS'}
				wait \{1
					second}
				break
			endif
		endif
	endif
	getarraysize <patterns_completed>
	if ((<array_size> = (<req_patterns> -1)) && (<final_instruction_added> = 0))
		<final_instruction_added> = 1
		training_add_lesson_body_text \{number = 3
			text = qs(0x1ebc3d2c)}
	endif
	wait \{1
		gameframe}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_drum_machine 
	wait \{1
		second}
	training_show_title \{title = qs(0x1002eb7f)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_DrumMach_01_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{sound = 'Tut_RS_DrumMach_01_BAS'}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_DrumMach_02_BAS'}
	training_change_header_type \{type = studio}
	training_show_narrator \{narrator = 'bassist'}
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0xad19d8d4)}
	jam_tutorial_drum_machine_challenge
	wait \{1
		second}
	jam_tutorial_drum_machine_percussion_challenge
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_DrumMach_03_BAS'
		wait}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_band_container :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		setglobaltags \{training
			params = {
				rs_advanced_tools_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_drum_machine_challenge 
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums
		machine = 1
		drum_kit = 7}
	training_add_lesson_body_text \{number = 1
		text = qs(0xf41364b1)}
	training_add_lesson_body_text \{number = 2
		text = qs(0xab6c672c)}
	training_add_lesson_body_text \{number = 3
		text = qs(0xb57cc0dd)}
	training_set_task_header_body \{text = qs(0x78d3d2fa)}
	training_show_lesson_header
	training_wait_for_sound \{sound = 'Tut_RS_DrumMach_02_BAS'}
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	jam_tutorial_drum_machine_loop_task
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_drum_machine_percussion_challenge 
	jam_band_container :settags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_ui \{instrument = drums
		machine = 1}
	training_add_lesson_body_text \{number = 1
		text = qs(0xfc0b920d)}
	training_show_lesson_header
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	block \{type = jam_tutorial_percussion}
	jam_band_container :settags \{instrument_controls = [
		]}
	training_add_lesson_body_text \{number = 2
		text = qs(0xf41364b1)}
	training_add_lesson_body_text \{number = 3
		text = qs(0xab6c672c)}
	training_set_task_header_body \{text = qs(0x78d3d2fa)}
	training_show_task_header
	jam_band_container :settags \{instrument_controls = [
			enabled
		]}
	jam_tutorial_drum_machine_loop_task \{req_percussion = 1}
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_ui
endscript

script jam_tutorial_drum_machine_loop_task \{req_patterns = 3
		req_notes = 20
		req_percussion = 0}
	<patterns_completed> = []
	<notes_completed> = 0
	<current_pattern> = 16777216
	<current_type> = 9
	training_display_notes_hit notes_hit = 0 notes_required = <req_patterns>
	begin
	block \{type = jam_tutorial_drum_hit}
	if (<req_percussion> <= $is_percussion_kit)
		if NOT arraycontains array = <patterns_completed> contains = ($jam_loop_current_pattern)
			if (<current_pattern> = $jam_loop_current_pattern)
				<notes_completed> = (<notes_completed> + 1)
			else
				<notes_completed> = 1
				<current_pattern> = $jam_loop_current_pattern
			endif
			if (<notes_completed> = <req_notes>)
				<notes_completed> = 0
				<patterns_completed> = (<patterns_completed> + $jam_loop_current_pattern)
				getarraysize <patterns_completed>
				training_display_notes_hit notes_hit = <array_size> notes_required = <req_patterns>
				if (<array_size> = <req_patterns>)
					Random (
						@ training_play_sound \{sound = 'Tut_RS_Drums_07_BAS'}
						@ training_play_sound \{sound = 'Tut_RS_Drums_11_BAS'}
						@ training_play_sound \{sound = 'Tut_RS_AdvGtr_07_BAS'}
						@ training_play_sound \{sound = 'Tut_RS_AdvGtr_10_BAS'}
						)
					wait \{1
						second}
					break
				endif
			endif
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script create_jam_tutorial_message \{time = 4}
	destroy_jam_tutorial_message
	if NOT screenelementexists \{id = jam_tut_text_window}
		createscreenelement \{type = windowelement
			parent = jam_band_container
			id = jam_tut_text_window
			just = [
				left
				top
			]
			pos = (230.0, 580.0)
			dims = (830.0, 65.0)}
	endif
	createscreenelement {
		type = textblockelement
		parent = jam_tut_text_window
		id = jam_tut_text
		font = fontgrid_text_a8
		just = [center center]
		internal_just = [center center]
		z_priority = 100
		rgba = [255 255 255 255]
		dims = (840.0, 50.0)
		pos = (800.0, 25.0)
		text = <text>
		scale = 1
		internal_scale = 0.8
		z_priority = 55
	}
	jam_tut_text :se_setprops \{pos = (410.0, 25.0)
		time = 0.3}
	jam_tut_text :se_waitprops
	if (<time> = -1)
		return
	endif
	wait <time> seconds
	destroy_jam_tutorial_message
endscript

script destroy_jam_tutorial_message 
	if NOT screenelementexists \{id = jam_tut_text}
		return
	endif
	jam_tut_text :se_setprops \{pos = (-100.0, 25.0)
		time = 0.3}
	jam_tut_text :se_waitprops
	destroyscreenelement \{id = jam_tut_text}
endscript

script display_tutorial_narrator \{narrator = null}
	switch <narrator>
		case lou
		<texture> = tutorial_narrator_drummer_0
		<pos> = (945.0, 130.0)
		case gor
		<texture> = tutorial_narrator_drummer_0
		<pos> = (520.0, 150.0)
		default
		<texture> = tutorial_narrator_drummer_0
		<pos> = (520.0, 150.0)
	endswitch
	createscreenelement {
		parent = jam_band_container
		type = spriteelement
		id = tut_narrator
		just = [center center]
		texture = <texture>
		pos = <pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (1.5, 1.5)
		z_priority = 4
	}
endscript

script jam_tutorial_instrument_select_menu \{player = 1
		instrument = null}
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
	formattext checksumname = player_cont 'inst_player_cont_%s' s = <player>
	if screenelementexists id = <player_cont>
		jam_destroy_player \{player = 1}
	endif
	if gotparam \{selectable}
		jam_band_container :settags \{disable_inst_select = 0}
	endif
	jam_create_player_container \{player = 1}
	if NOT gotparam \{selectable}
		<slots> = [0 1 2 3 4]
		getarraysize <slots>
		<i> = 0
		begin
		formattext checksumname = inst_select_text 'jam_%a_select_text_%b' a = (<slots> [<i>]) b = <player>
		if (<i> = <slot>)
			launchevent type = focus target = <inst_select_text>
			<inst_select_text> :se_setprops block_events
		else
			launchevent type = unfocus target = <inst_select_text>
			<inst_select_text> :se_setprops not_focusable
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	formattext checksumname = inst_select_element 'inst_select_element_%a' a = <player>
	if screenelementexists id = <inst_select_element>
		formattext checksumname = inst_select_text 'jam_%a_select_text_%b' a = <slot> b = <player>
		launchevent type = focus target = <inst_select_text>
	endif
endscript

script jam_tutorial_inst_menu_indicate \{player = 1
		instrument = null}
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
	getarraysize <slots>
	<i> = 0
	begin
	formattext checksumname = inst_select_text 'jam_%a_select_text_%b' a = (<slots> [<i>]) b = <player>
	if (<i> = <slot>)
		launchevent type = focus target = <inst_select_text>
		<inst_select_text> :se_setprops block_events
	else
		launchevent type = unfocus target = <inst_select_text>
		<inst_select_text> :se_setprops not_focusable
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script jam_tutorial_display_instrument_icons \{icons = [
			rhythm
			lead
			bass
			drum
		]}
	if screenelementexists \{id = jam_tut_icon_container}
		destroyscreenelement \{id = jam_tut_icon_container}
	endif
	createscreenelement \{type = containerelement
		id = jam_tut_icon_container
		parent = jam_band_container
		just = [
			left
			top
		]
		scale = (1.0, 1.0)
		z_priority = 4}
	<icon_params> = {parent = jam_tut_icon_container type = spriteelement just = [center center] scale = (2.0, 2.0) z_priority = 4}
	<pos> = (350.0, 275.0)
	if screenelementexists \{id = inst_player_cont_1}
		<pos> = (<pos> + (135.0, 0.0))
	endif
	getarraysize <icons>
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
	<icon_pos> = (<pos> + (<i> * (135.0, 0.0)))
	createscreenelement {
		<icon_params>
		id = <icon_id>
		texture = <texture>
		pos = <icon_pos>
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script jam_tutorial_destroy_instrument_icons 
	if screenelementexists \{id = jam_tut_icon_container}
		destroyscreenelement \{id = jam_tut_icon_container}
	endif
endscript

script jam_tutorial_anim \{anim = null}
	killspawnedscript \{id = jam_tut_anim}
	if screenelementexists \{id = jam_tut_anim_container}
		destroyscreenelement \{id = jam_tut_anim_container}
	endif
	createscreenelement \{type = containerelement
		id = jam_tut_anim_container
		parent = jam_band_container
		just = [
			left
			top
		]
		scale = (1.0, 1.0)
		z_priority = 6}
	switch <anim>
		case open_strum
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_open_strum_anim}
		case play_scale_single
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_play_scale_anim
			params = {
				anim = single
			}}
		case play_scale
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_play_scale_anim}
		case chord_2
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_chord_anim
			params = {
				num = 2
			}}
		case chord_3
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_chord_anim
			params = {
				num = 3
			}}
		case tilt
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_tilt_anim}
		case sustains
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_sustains_anim}
		case hopo
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_hopo_anim}
		case pm
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_pm_anim}
		case null
		case `default`
		scriptassert 'Jam Tutorial Anim set to %a' a = <anim>
	endswitch
endscript

script jam_tutorial_create_ghost_player 
	if screenelementexists \{id = jam_tut_ghost_container}
		destroyscreenelement \{id = jam_tut_ghost_container}
	endif
	<guitar_tex> = tutorial_guitar
	<guitar_strum> = tutorial_guitar_strum
	<guitar_strum_up> = tutorial_guitar_strum_up
	<guitar_strum_dn> = tutorial_guitar_strum_dn
	createscreenelement \{type = containerelement
		id = jam_tut_ghost_container
		parent = jam_band_container
		just = [
			left
			top
		]
		scale = (1.0, 1.0)
		z_priority = 6}
	<tut_ui_props> = {parent = jam_tut_ghost_container type = spriteelement just = [center center] rgba = [255 255 255 255] scale = (0.3, 0.3)}
	createscreenelement {<tut_ui_props> id = jam_tut_guitar texture = <guitar_tex> pos = (745.0, 360.0) z_priority = 4}
	createscreenelement {<tut_ui_props> id = jam_tut_hand texture = tutorial_hand_strum pos = (925.0, 340.0) z_priority = 6}
	createscreenelement {<tut_ui_props> id = jam_tut_hand_dn texture = tutorial_hand_strum_dn pos = (925.0, 340.0) z_priority = 6}
	safe_hide \{id = jam_tut_hand_dn}
	createscreenelement {<tut_ui_props> id = jam_tut_hand_up texture = tutorial_hand_strum_up pos = (925.0, 340.0) z_priority = 6}
	safe_hide \{id = jam_tut_hand_up}
	createscreenelement {<tut_ui_props> id = jam_tut_strum texture = <guitar_strum> pos = (880.0, 365.0) z_priority = 5}
	createscreenelement {<tut_ui_props> id = jam_tut_strum_up texture = <guitar_strum_up> pos = (880.0, 365.0) z_priority = 5}
	safe_hide \{id = jam_tut_strum_up}
	createscreenelement {<tut_ui_props> id = jam_tut_strum_dn texture = <guitar_strum_dn> pos = (880.0, 365.0) z_priority = 5}
	safe_hide \{id = jam_tut_strum_down}
	createscreenelement {<tut_ui_props> id = jam_tut_fret_hand_top texture = tutorial_hand_wrist pos = (605.0, 330.0) z_priority = 3}
	createscreenelement {<tut_ui_props> id = jam_tut_fret_hand_bott_none texture = tutorial_hand_button_none pos = (580.0, 385.0) z_priority = 5}
	jam_tut_ghost_container :settags \{strum_position = neutral}
endscript

script jam_tutorial_anim_strum \{position = null}
	jam_tut_ghost_container :gettags
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
	jam_tut_ghost_container :settags strum_position = <position>
endscript

script jam_tutorial_create_dpad 
	if screenelementexists \{id = tut_dpad}
		destroyscreenelement \{id = tut_dpad}
	endif
	createscreenelement \{parent = jam_band_container
		type = spriteelement
		id = tut_dpad
		just = [
			center
			center
		]
		texture = d_pad
		pos = (800.0, 200.0)
		scale = (1.5, 1.5)
		z_priority = 10}
endscript

script jam_tutorial_create_tiltable_guitar 
	if screenelementexists \{id = jam_tut_ghost_container}
		destroyscreenelement \{id = jam_tut_ghost_container}
	endif
	<guitar_tex> = tutorial_guitar
	<guitar_strum> = tutorial_guitar_strum
	<guitar_strum_up> = tutorial_guitar_strum_up
	<guitar_strum_dn> = tutorial_guitar_strum_dn
	createscreenelement \{type = containerelement
		id = jam_tut_ghost_container
		parent = jam_band_container
		just = [
			center
			center
		]
		pos = (845.0, 360.0)
		scale = (1.0, 1.0)
		z_priority = 6}
	<tut_ui_props> = {parent = jam_tut_ghost_container type = spriteelement just = [center center] rgba = [255 255 255 255] scale = (0.3, 0.3)}
	createscreenelement {<tut_ui_props> id = jam_tut_guitar texture = <guitar_tex> pos = (-100.0, 0.0) z_priority = 4}
	createscreenelement {<tut_ui_props> id = jam_tut_strum texture = <guitar_strum> pos = (37.5, 5.0) z_priority = 5}
endscript

script jam_tutorial_create_ghost_g_r_y_gr_gry 
	if screenelementexists \{id = jam_tut_ghost_container}
		<tut_ui_props> = {parent = jam_tut_ghost_container type = spriteelement just = [center center] rgba = [255 255 255 255] scale = (0.3, 0.3)}
		createscreenelement {<tut_ui_props> id = jam_tut_fret_hand_bg texture = tutorial_hand_button_g pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_bg}
		createscreenelement {<tut_ui_props> id = jam_tut_fret_hand_br texture = tutorial_hand_button_r pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_br}
		createscreenelement {<tut_ui_props> id = jam_tut_fret_hand_by texture = tutorial_hand_button_y pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_by}
		createscreenelement {<tut_ui_props> id = jam_tut_fret_hand_bgr texture = tutorial_hand_button_gr pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_bgr}
		createscreenelement {<tut_ui_props> id = jam_tut_fret_hand_bgry texture = tutorial_hand_button_gry pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_bgry}
	endif
endscript

script jam_tutorial_show_instrument_ui \{player = 1
		machine = 0
		drum_kit = -1}
	jam_destroy_player \{player = 1}
	wait \{1
		gameframe}
	if gotparam \{instrument}
		jam_band_container :settags {role = <instrument>}
	else
		jam_band_container :gettags
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
			change \{is_drum_machine = 1}
		else
			is_arpeggiator = [0 0 0 0 0 0]
			setarrayelement {
				arrayname = is_arpeggiator
				index = <jam_instrument>
				newvalue = 1
			}
			change is_arpeggiator = <is_arpeggiator>
		endif
	endif
	setplayerinfo 1 jam_instrument = <jam_instrument>
	createscreenelement \{type = containerelement
		parent = jam_band_container
		id = inst_player_cont_1
		pos = (330.0, 52.0)}
	jam_create_instrument \{select_player = 1
		player_cont = inst_player_cont_1}
	jam_create_player_info \{player = 1
		player_cont = inst_player_cont_1}
	menu_jam_band_add_control_helpers state = instrument_ui instrument = <jam_instrument>
	if ((<jam_instrument> = 3) && (<drum_kit> > -1))
		jam_tutorial_change_drum_kit player = 1 option_index = <drum_kit>
	endif
endscript

script jam_tutorial_destroy_instrument_ui \{player = 1}
	stopsound \{unique_id = $jam_input_current_lead
		fade_type = log_fast
		fade_time = 0.3}
	stopsound \{unique_id = $jam_input_current_bass
		fade_type = log_fast
		fade_time = 0.3}
	stopsound \{unique_id = $jam_input_current_chord
		fade_type = log_fast
		fade_time = 0.3}
	stopsound \{unique_id = $jam_input_current_melody
		fade_type = log_fast
		fade_time = 0.3}
	jam_destroy_player \{player = 1}
	menu_jam_band_add_control_helpers
endscript

script jam_tutorial_segment_cleanup 
	jam_tutorial_destroy_check_marks
	training_destroy_all_arrows
	if screenelementexists \{id = ghtunes_element}
		destroyscreenelement \{id = ghtunes_element}
	endif
	destroy_generic_menu
	if screenelementexists \{id = popupelement}
		<is_disconnect_warning> = false
		popupelement :getsingletag \{is_disconnect_warning}
		if (<is_disconnect_warning> = false)
			destroy_popup_warning_menu
		endif
	endif
	formattext checksumname = base_id 'jam_fretboard_base_%s' s = <player>
	if screenelementexists id = <base_id>
		<base_id> :se_setprops pos = (0.0, 480.0) time = 0.1
	endif
	jam_tutorial_destroy_anim
	killspawnedscript \{id = training_spawned_script}
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	jam_destroy_select_instrument_menu \{player = 1}
	jam_tutorial_destroy_instrument_ui \{player = 1}
	spawnscriptnow \{training_destroy_title}
	training_hide_narrator
	training_hide_lesson_header
	screen_elements = [
		jam_tut_text
		jam_tut_icon_container
		jam_tut_check_container
		jam_tut_anim_container
		tut_narrator
		jam_tut_ghost_container
		ghmix_tut_highlight
	]
	getarraysize <screen_elements>
	<i> = 0
	begin
	if screenelementexists id = (<screen_elements> [<i>])
		destroyscreenelement id = (<screen_elements> [<i>])
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	stopsoundsbybuss \{training_vo}
	if screenelementexists \{id = jam_studio_element}
		jam_studio_element :settags \{tool_controls = [
				force_exit
			]}
		jam_highway_move_beginning
	endif
endscript

script jam_tutorial_show_scale 
endscript

script jam_tutorial_init_check_marks 
	if screenelementexists \{id = jam_tut_check_container}
		destroyscreenelement \{id = jam_tut_check_container}
	endif
	createscreenelement \{type = containerelement
		id = jam_tut_check_container
		parent = jam_band_container
		just = [
			left
			top
		]
		scale = (1.0, 1.0)
		z_priority = 6}
	<check_mark_props> = {parent = jam_tut_check_container type = spriteelement just = [center center] rgba = [255 255 255 255] scale = (0.5, 0.5)}
	<icon_x_inc> = 50
	<num_check_marks> = 0
	block \{type = jam_update_check_marks}
	begin
	if (<event_data>.num_check_marks = <num_check_marks>)
		block \{type = jam_update_check_marks}
	else
		if (<event_data>.num_check_marks > <num_check_marks>)
			<num_check_marks> = (<num_check_marks> + 1)
			formattext checksumname = check_id 'check_%n' n = <num_check_marks>
			<icon_pos> = (((0.0, 1.0) * 140) + ((1.0, 0.0) * (600 + (<num_check_marks> * <icon_x_inc>))))
			createscreenelement {
				id = <check_id>
				<check_mark_props>
				texture = tutorial_checkmark
				pos = <icon_pos>
				z_priority = 6
			}
		else
			<num_check_marks> = (<num_check_marks> + 1)
			formattext checksumname = check_id 'check_%n' n = <num_check_marks>
			destroyscreenelement id = <check_id>
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script jam_tutorial_update_check_marks 
	if gotparam \{num_check_marks}
		broadcastevent type = jam_update_check_marks data = {num_check_marks = <num_check_marks>}
	endif
endscript

script jam_tutorial_destroy_check_marks 
	killspawnedscript \{name = jam_tutorial_init_check_marks}
	if screenelementexists \{id = jam_tut_check_container}
		destroyscreenelement \{id = jam_tut_check_container}
	endif
endscript

script jam_tutorial_advance_index \{array = [
			null
		]
		i = 0}
	getarraysize <array>
	<i> = (<i> + 1)
	if (<i> = <array_size>)
		<i> = 0
	endif
	return i = <i>
endscript

script jam_tutorial_add_arrow \{pos = (450.0, 175.0)
		life = 2
		scale = 0.5}
	if gotparam \{instrument}
		switch <instrument>
			case rhythm
			<pos> = (410.0, 155.0) <rot> = 90
			case lead
			<pos> = (410.0, 195.0) <rot> = 90
			case bass
			<pos> = (410.0, 235.0) <rot> = 90
			case drum
			case drums
			<pos> = (410.0, 275.0) <rot> = 90
			case melody
			<pos> = (410.0, 313.0) <rot> = 90
		endswitch
	endif
	training_add_arrow <...>
endscript

script jam_tutorial_lesson_complete 
	jam_recording_add_user_control_helpers
	soundevent \{event = tutorial_mode_finish_chord}
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
endscript

script jam_tutorial_destroy_anim 
	if screenelementexists \{id = jam_tut_anim_container}
		killspawnedscript \{id = jam_tut_anim}
		destroyscreenelement \{id = jam_tut_anim_container}
	endif
	if screenelementexists \{id = jam_tut_ghost_container}
		destroyscreenelement \{id = jam_tut_ghost_container}
	endif
endscript

script jam_tutorial_show_narrator 
	if gotparam \{offset}
		training_show_narrator \{narrator = 'bassist'
			new_pos = (1088.0, 182.0)
			hflip}
	else
		training_show_narrator \{narrator = 'bassist'}
	endif
endscript

script jam_tutorial_change_drum_kit \{player = 1
		option_index = 0}
	change jam_current_drum_kit = <option_index>
	setsonginfo \{drum_kit = $jam_current_drum_kit}
	loaddrumkitall drum_kit = ($drum_kits [<option_index>].string_id) percussion_kit = ($drum_kits [<option_index>].percussion_string_id) async = 0
	<respawn> = 0
	if ($jam_advanced_record = 0)
		formattext checksumname = player_info_element 'player_info_element_%a' a = <player>
		formattext textname = extra_info_text qs(0x4d4555da) s = (($pause_drum_kit_options) [<option_index>].name_text)
		<respawn> = 1
		if screenelementexists id = <player_info_element>
			<player_info_element> :se_setprops extra_info_text = <extra_info_text>
		endif
	endif
endscript
