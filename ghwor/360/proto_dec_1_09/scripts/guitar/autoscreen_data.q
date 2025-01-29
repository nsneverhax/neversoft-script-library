autoscreen_types = {
	got_star_power = {
		FileName = 'got_star_power'
		num_players = 4
		num_captures = 8
		condition = {
			Type = player_info_condition
			element = star_power_amount
			Logic = greater_than
			THRESHOLD = 0
			required_players = [
				3
			]
		}
	}
	used_star_power = {
		FileName = 'used_star_power'
		num_players = 4
		num_captures = 5
		condition = {
			Type = player_info_condition
			element = star_power_used
			Logic = equals
			THRESHOLD = 1
		}
	}
	band_failed = {
		FileName = 'band_failed'
		num_players = 2
		num_captures = 3
		disable_bots
		condition = {
			Type = custom_condition
			script_name = autoscreenshot_band_failed_condition
		}
	}
	ten_second_mark = {
		FileName = 'ten_second_mark'
		num_players = 1
		num_captures = 3
		condition = {
			Type = song_condition
			time = 10.0
		}
	}
}
