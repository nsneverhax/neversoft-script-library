qp_trigger_spower_test_info = {
	Name = 'qp_trigger_spower_test'
	goal_type = quickplay_challenge
	constants = {
		target_value = Duration
		desc_txt = qs(0xc96c8800)
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
			2
		]
		valid_section_window_started = 0
		star_power_deployed_in_valid_window = 0
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
					Name = 'watcher'
					Type = var_watcher
					var_updated = qp_trigger_spower_test_watcher_update
					vars = [
						{
							Source = playerinfo
							var = star_power_used
							Type = int
						}
					]
				}
				{
					Name = 'section_watcher'
					Type = section_watcher
					enable_highway_glow
					section_marker_hit = qp_trigger_spower_test_section_marker_hit
				}
			]
		}
	]
}

script qp_trigger_spower_test_watcher_update 
	printf \{channel = qp_challenge
		qs(0x5ba92680)}
	if (<current_value> = 1)
		if challenge_qp_current_section_is_valid goal_id = <goal_id>
			printf \{channel = qp_challenge
				'Section is valid video moment is a go!'}
			qp_trigger_spower_test_display_message_spawn \{text = qs(0x96e386b2)
				time = 2}
			gman_setdata goal = <goal_id> params = {star_power_deployed_in_valid_window = 1}
			gman_setgrade goal = <goal_id> grade = 1
		else
			printf \{channel = qp_challenge
				'Section is invalid, trigger star power at another time...'}
		endif
	endif
endscript

script qp_trigger_spower_test_section_marker_hit 
	printf \{channel = qp_challenge
		qs(0x2d15cd30)}
	<started_section_length> = (<started_section_length> / 1000)
	if challenge_qp_current_section_is_valid goal_id = <goal_id>
		printf \{channel = qp_challenge
			'Section is valid Trigger Star Power!'}
		qp_trigger_spower_test_display_message_spawn text = qs(0x813d58a9) time = <started_section_length>
		gman_setdata goal = <goal_id> params = {valid_section_window_started = 1}
	else
		printf \{channel = qp_challenge
			'Section is Invalid, choosing to evaluate or ignore...'}
		gman_getdata goal = <goal_id> Name = valid_section_window_started
		if (<valid_section_window_started> = 1)
			printf \{channel = qp_challenge
				'Chose to evaluate...'}
			gman_getdata goal = <goal_id> Name = star_power_deployed_in_valid_window
			if (<star_power_deployed_in_valid_window> = 1)
				printf \{channel = qp_challenge
					'Video Trigger Successful! Play Video Moment!'}
				gman_setdata goal = <goal_id> params = {star_power_deployed_in_valid_window = 0}
			else
				printf \{channel = qp_challenge
					'Video Trigger Failed! Do not play Video Moment!'}
			endif
			gman_setdata goal = <goal_id> params = {valid_section_window_started = 0}
		else
			printf \{channel = qp_challenge
				'Chose to ignore. '}
		endif
	endif
	if (<callback_type> = custom)
		gman_getdata goal = <goal_id> Player = <assigned_player> Name = in_valid_section
		if (<in_valid_section> = 0)
			gman_setdata goal = <goal_id> Player = <assigned_player> params = {in_valid_section = 1}
		else
			gman_setdata goal = <goal_id> Player = <assigned_player> params = {in_valid_section = 0}
		endif
	endif
endscript

script qp_trigger_spower_test_display_message_spawn 
	KillSpawnedScript \{Name = qp_trigger_spower_test_display_message}
	spawnscript qp_trigger_spower_test_display_message params = {<...>}
endscript

script qp_trigger_spower_test_display_message \{text = qs(0x7223952e)
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
	if ScreenElementExists \{id = qptst_text_container}
		qptst_text :se_setprops \{alpha = 0
			time = 0.1}
		qptst_text_shadow :se_setprops \{alpha = 0
			time = 0.1}
		qptst_text :se_waitprops
	endif
	if ScreenElementExists \{id = qptst_text_container}
		DestroyScreenElement \{id = qptst_text_container}
	endif
endscript
