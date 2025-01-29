qp_section_accuracy_test_info = {
	Name = 'qp_section_accuracy_test'
	goal_type = quickplay_challenge
	constants = {
		target_value = Duration
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
			Name = 'main'
			tools = [
				{
					Name = 'section_watcher'
					Type = section_watcher
					enable_highway_glow
					section_marker_hit = qp_section_accuracy_test_section_marker_hit
				}
				{
					Name = 'miss_listener'
					Type = event_listener
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
	else
		printf \{channel = qp_challenge
			'Section is Invalid, now choosing to evaluate goal or ignore....'}
		gman_getdata goal = <goal_id> Name = valid_section_window_started
		if (<valid_section_window_started> = 1)
			printf \{channel = qp_challenge
				'Chose to evaluate goal....'}
			gman_getdata goal = <goal_id> Name = note_missed
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

script qp_section_accuracy_test_display_message_spawn 
	KillSpawnedScript \{Name = qp_section_accuracy_test_display_message}
	spawnscript qp_section_accuracy_test_display_message params = {<...>}
endscript

script qp_section_accuracy_test_display_message \{text = qs(0x7223952e)
		time = 3
		Pos = (640.0, 400.0)}
	if ScreenElementExists \{id = qptst_text_container}
		DestroyScreenElement \{id = qptst_text_container}
	endif
	CreateScreenElement \{id = qptst_text_container
		Type = ContainerElement
		parent = root_window}
	CreateScreenElement {
		id = qptst_text
		Type = TextElement
		parent = qptst_text_container
		font = debug
		text = <text>
		Scale = 1.5
		Pos = <Pos>
		just = [center center]
		rgba = [150 185 200 255]
		z_priority = 80
	}
	CreateScreenElement {
		id = qptst_text_shadow
		Type = TextElement
		parent = qptst_text_container
		font = debug
		text = <text>
		Scale = 1.5
		Pos = (<Pos> + (1.0, 1.0))
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
	Wait <time> Seconds
	qptst_text :se_setprops \{alpha = 0
		time = 0.1}
	qptst_text_shadow :se_setprops \{alpha = 0
		time = 0.1}
	qptst_text :se_waitprops
	if ScreenElementExists \{id = qptst_text_container}
		DestroyScreenElement \{id = qptst_text_container}
	endif
endscript
