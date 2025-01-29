qp_sustain_hits_info = {
	Name = 'qp_sustain_hits'
	goal_type = quickplay_challenge
	title_string = qs(0x51c30acb)
	constants = {
		song_complete = challenge_output_grade_marks
		target_value = songstat_sustain_time
		leaderboard_metric_string = qs(0x9d0b3408)
		desc_txt = qs(0xd539fbce)
	}
	data = {
		percent_targets = [
			0.2
			0.4
			0.8
		]
		calculated_targets = [
			-1
			-1
			-1
		]
		valid_sections = [
		]
	}
	player_data = {
		current_progress = 0
		section_base_value = 0
		previous_progress = 0
	}
	checkpoints = [
		{
			Name = 'main'
			tools = [
				{
					Name = 'listener'
					Type = event_listener
					callback_mode = any
					got_event = qp_sustain_hits_listener_gotevent
					events = [
						drumsustain_hitp1
						drumsustain_hitp2
						drumsustain_hitp3
						drumsustain_hitp4
					]
				}
				{
					Name = 'progress_watcher'
					Type = var_watcher
					var_updated = challenge_qp_evaluate_progress
					vars = [
						{
							Source = goalplayerdata
							var = current_progress
							Type = float
						}
					]
				}
				{
					Name = 'section_watcher'
					Type = section_watcher
				}
			]
		}
	]
}

script qp_sustain_hits_listener_gotevent 
	challenge_qp_calculate_current_progress goal_id = <goal_id> Player = <assigned_player> current_value = 1 var_type = incremental
	gman_setdata goal = <goal_id> Player = <assigned_player> params = {current_progress = <current_progress> previous_progress = <current_progress>}
endscript
