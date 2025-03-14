m_r2_climb_track_info = {
	track = m_r2
	lifestyle = rigger
	start_node = m_r2_climb_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		skill = climbing
		goal_points = {
			rigger = 15
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_r2_breakin_track_info = {
	track = m_r2
	lifestyle = rigger
	start_node = m_r2_breakin_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			rigger = 15
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_r2_skateoff_track_info = {
	track = m_r2
	lifestyle = rigger
	start_node = m_r2_skateoff_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			rigger = 20
		}
		cash_reward = [
			100
			100
			100
		]
		crib_piece = CRIB_UNLOCK_R201
		crib_piece_movie = 'crib_rigger_2_1'
		cas_parts = [
			{
				part = cas_hat
				desc_id = CAS_ACC_spacehelmet
				name = "Astronaut Helmet"
				flag = $CAS_UNLOCK_R201
				apply_it = 1
			}
		]
	}
}
m_r2_show1_track_info = {
	track = m_r2
	lifestyle = rigger
	start_node = m_r2_show1_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			rigger = 25
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_r2_show2_track_info = {
	track = m_r2
	lifestyle = rigger
	start_node = m_r2_show2_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			rigger = 25
		}
		cash_reward = [
			100
			100
			100
		]
		crib_piece = CRIB_UNLOCK_R202
		crib_piece_movie = 'crib_rigger_2_2'
		cas_parts = [
			{
				part = cas_torso
				desc_id = CAS_reg_vivalame
				name = "Viva La Me! Shirt"
				flag = $CAS_UNLOCK_R202
				apply_it = 1
			}
		]
		special = {
			trick = Trick_RocketBackflip
			key_combo = SpAir_D_U_Circle
			index = 10
		}
	}
}
