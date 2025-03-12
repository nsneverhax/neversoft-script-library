qp_section_accuracy_test_info = {
	name = 'qp_section_accuracy_test'
	goal_type = quickplay_challenge
	constants = {
		target_value = duration
		desc_txt = qs(0x5a9d7593)
	}
	data = {
		percent_targets = [
			1
			1
			1
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		valid_sections = [
			4
		]
		valid_section_window_started = 0
		note_missed = 0
	}
	player_data = {
		current_progress = 0
		section_base_value = 0
		previous_progress = 0
		longest_deployment = 0
		in_valid_section = 0
	}
	initial_data = {
		current_progress = 0
		longest_deployment = 0
	}
	checkpoints = [
		{
			name = 'main'
			tools = [
				{
					name = 'section_watcher'
					type = section_watcher
					enable_highway_glow
					section_marker_hit = qp_section_accuracy_test_section_marker_hit
				}
				{
					name = 'miss_listener'
					type = event_listener
					callback_mode = any
					got_event = qp_section_accuracy_test_event_listener_update
					events = [
						missed_notep1
						missed_notep2
						missed_notep3
						missed_notep4
					]
				}
			]
		}
	]
}

script qp_section_accuracy_test_event_listener_update 
	printf \{channel = qp_challenge
		qs(0x37e5d28e)}
	gman_getdata goal = <goal_id>
	if (<valid_section_window_started> = 1)
		if (<note_missed> = 0)
			printf \{channel = qp_challenge
				'Note has been missed in a valid section!'}
			gman_setdata goal = <goal_id> params = {note_missed = 1}
			qp_section_accuracy_test_display_message_spawn \{text = qs(0xb8c7f7ea)
				time = 1}
			soundevent \{event = bh2_video_challenge_bad}
		endif
	else
		printf \{channel = qp_challenge
			'Note has been missed in a non-valid section, ignoring...'}
	endif
endscript

script qp_section_accuracy_test_section_marker_hit 
	printf \{channel = qp_challenge
		qs(0x7ade6b9d)}
	<started_section_length> = (<started_section_length> / 1000)
	if challenge_qp_current_section_is_valid goal_id = <goal_id>
		printf \{channel = qp_challenge
			'Section is valid, so do not miss a note!'}
		gman_setdata goal = <goal_id> params = {valid_section_window_started = 1}
		qp_section_accuracy_test_display_message_spawn text = qs(0xc254e74e) time = <started_section_length>
		soundevent \{event = bh2_video_challenge_start}
	else
		printf \{channel = qp_challenge
			'Section is Invalid, now choosing to evaluate goal or ignore....'}
		gman_getdata goal = <goal_id> name = valid_section_window_started
		if (<valid_section_window_started> = 1)
			printf \{channel = qp_challenge
				'Chose to evaluate goal....'}
			gman_getdata goal = <goal_id> name = note_missed
			if (<note_missed> = 1)
				printf \{channel = qp_challenge
					'Goal failed!'}
			else
				printf \{channel = qp_challenge
					'Goal successful!'}
				gman_setgrade goal = <goal_id> grade = 1
			endif
			printf \{channel = qp_challenge
				'Resetting valid_section_window_started and note_missed ...'}
			gman_setdata goal = <goal_id> params = {valid_section_window_started = 0 note_missed = 0}
		else
			printf \{channel = qp_challenge
				'Chose to ignore....'}
		endif
	endif
endscript

script qp_section_accuracy_test_in_valid_section 
	gman_getdata goal = <goal_id> player = <assigned_player> name = in_valid_section
	if (<in_valid_section> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script qp_section_accuracy_test_display_message_spawn 
	killspawnedscript \{name = qp_section_accuracy_test_display_message}
	spawnscript qp_section_accuracy_test_display_message params = {<...>}
endscript

script qp_section_accuracy_test_display_message \{text = qs(0x7223952e)
		time = 3
		pos = (640.0, 400.0)}
	if screenelementexists \{id = qptst_text_container}
		destroyscreenelement \{id = qptst_text_container}
	endif
	createscreenelement \{id = qptst_text_container
		type = containerelement
		parent = root_window}
	createscreenelement {
		id = qptst_text
		type = textelement
		parent = qptst_text_container
		font = debug
		text = <text>
		scale = 1.5
		pos = <pos>
		just = [center center]
		rgba = [150 185 200 255]
		z_priority = 80
	}
	createscreenelement {
		id = qptst_text_shadow
		type = textelement
		parent = qptst_text_container
		font = debug
		text = <text>
		scale = 1.5
		pos = (<pos> + (1.0, 1.0))
		just = [center center]
		rgba = [0 0 0 255]
		z_priority = 79
	}
	qptst_text :se_setprops \{alpha = 0}
	qptst_text_shadow :se_setprops \{alpha = 0}
	qptst_text :se_setprops \{alpha = 1
		time = 0.1}
	qptst_text_shadow :se_setprops \{alpha = 1
		time = 0.1}
	qptst_text :se_waitprops
	wait <time> seconds
	qptst_text :se_setprops \{alpha = 0
		time = 0.1}
	qptst_text_shadow :se_setprops \{alpha = 0
		time = 0.1}
	qptst_text :se_waitprops
	if screenelementexists \{id = qptst_text_container}
		destroyscreenelement \{id = qptst_text_container}
	endif
endscript

script qp_section_accuracy_test_create_generic_backdrop_spawn 
	killspawnedscript \{name = qp_section_accuracy_test_create_generic_backdrop}
	spawnscript qp_section_accuracy_test_create_generic_backdrop params = {<...>}
endscript

script qp_section_accuracy_test_create_generic_backdrop 
	if NOT screenelementexists \{id = generic_backdrop_container}
		createscreenelement \{type = containerelement
			parent = root_window
			id = generic_backdrop_container
			pos = (0.0, 0.0)
			just = [
				left
				top
			]}
		createscreenelement \{type = spriteelement
			id = pause_backdrop
			parent = generic_backdrop_container
			texture = white
			rgba = [
				0
				0
				0
				230
			]
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = -1
			alpha = 1}
	endif
	wait <time> seconds
	if screenelementexists \{id = generic_backdrop_container}
		destroyscreenelement \{id = generic_backdrop_container}
	endif
endscript
