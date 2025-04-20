m_h1_bigspines_track_info = {
	track = m_h1
	lifestyle = hardcore
	start_node = m_h1_bigspines_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			hardcore = 15
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_h1_epicdrop_track_info = {
	track = m_h1
	lifestyle = hardcore
	start_node = m_h1_epicdrop_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			hardcore = 25
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_h1_cribcut_track_info = {
	track = m_h1
	lifestyle = hardcore
	start_node = m_h1_cribcut_goalped_pos
	ped_travel_method = teleport_with_skater
	auto_start = 1
	goal_rewards = {
		crib_piece = CRIB_UNLOCK_H101
		crib_piece_movie = 'crib_hardcore_1_1'
		cas_parts = [
			{
				part = cas_torso
				desc_id = CAS_reg_7plyshirt
				name = "7Ply Cutt-Off"
				flag = $CAS_UNLOCK_H101
				apply_it = 1
			}
		]
	}
}
m_h1_boostpull_track_info = {
	track = m_h1
	lifestyle = hardcore
	start_node = m_h1_boostpull_goalped_pos
	ped_travel_method = Teleport
	track_ped_areas = [
		m_h1_boostpull_goalped_area
	]
	goal_rewards = {
		goal_points = {
			hardcore = 20
		}
		cash_reward = [
			100
			100
			100
		]
		skill = boost_pull
	}
}
m_h1_finalepic_track_info = {
	track = m_h1
	lifestyle = hardcore
	start_node = m_h1_finalepic_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			hardcore = 30
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_h1_finalepic_outro_track_info = {
	track = m_h1
	lifestyle = hardcore
	start_node = m_h1_finalepic_outro_goalped_pos
	ped_travel_method = teleport_with_skater
	auto_start = 1
	goal_rewards = {
		crib_piece = CRIB_UNLOCK_H102
		crib_piece_movie = 'crib_hardcore_1_2'
		cas_parts = [
			{
				part = CAS_Accessory02
				desc_id = CAS_ACC_cast02
				name = "Cast"
				flag = $CAS_UNLOCK_H102
				apply_it = 1
			}
		]
		special = {
			trick = Trick_NoComplyManual
			key_combo = SpMan_R_U_Triangle
			index = 6
		}
	}
}
m_h1_skitchboost_track_info = {
	track = m_h1
	lifestyle = hardcore
	start_node = m_h1_skitchboost_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		skill = skitch_boost_skill
	}
}
