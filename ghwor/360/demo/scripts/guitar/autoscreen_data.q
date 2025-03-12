autoscreen_types = {
	got_star_power = {
		filename = 'got_star_power'
		num_players = 4
		num_captures = 8
		condition = {
			type = player_info_condition
			element = star_power_amount
			logic = greater_than
			threshold = 0
			required_players = [
				3
			]
		}
	}
	used_star_power = {
		filename = 'used_star_power'
		num_players = 4
		num_captures = 5
		condition = {
			type = player_info_condition
			element = star_power_used
			logic = equals
			threshold = 1
		}
	}
	band_failed = {
		filename = 'band_failed'
		num_players = 2
		num_captures = 3
		disable_bots
		condition = {
			type = custom_condition
			script_name = autoscreenshot_band_failed_condition
		}
	}
	ten_second_mark = {
		filename = 'ten_second_mark'
		num_players = 1
		num_captures = 3
		condition = {
			type = song_condition
			time = 10.0
		}
	}
}
