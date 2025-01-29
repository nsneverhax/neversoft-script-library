goal_infos_pakless = [
	{
		Name = 'm_ghtest'
		goal_type = testing
		data = {
		}
		constants = {
			start_zone = z_test
			has_pak = FALSE
		}
		checkpoints = [
			{
				Name = 'chk1'
				tools = [
					{
						Name = 'timer'
						Type = Timer
						start_time = 5
						end_time = 0
						fail_on_expire
					}
				]
			}
		]
	}
]
