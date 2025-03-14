m_c1_invite_track_info = {
	track = m_c1
	lifestyle = career
	start_node = m_c1_NTT_goalped_pos
	ped_travel_method = Teleport
}
m_c1_impress_track_info = {
	track = m_c1
	lifestyle = career
	start_node = m_c1_impress_goalped_pos
	ped_travel_method = Teleport
	track_ped_areas = [
		m_c1_impress_goalped_area
	]
	goal_rewards = {
		goal_points = {
			career = 10
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_c1_demo_track_info = {
	track = m_c1
	lifestyle = career
	start_node = m_c1_demo_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			career = 25
		}
		cash_reward = [
			100
			100
			100
		]
		crib_piece = CRIB_UNLOCK_C101
		crib_piece_movie = 'crib_career_1_1'
		cas_parts = [
			{
				part = CAS_Buckle
				desc_id = CAS_shared_ACC_dollarbuckle
				name = "$ Buckle"
				flag = $CAS_UNLOCK_C101
				apply_it = 1
			}
			{
				part = cas_torso
				desc_id = CAS_reg_SHIRT_beater01
				name = "Shirtless"
				flag = $CAS_UNLOCK_C101
				apply_it = 1
			}
		]
	}
}
m_c1_practice1_track_info = {
	track = m_c1
	lifestyle = career
	start_node = m_c1_practice1_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			career = 10
		}
		cash_reward = [
			100
			100
			100
		]
		zone_unlock = balt_dc_bridge
	}
}
m_c1_film1_track_info = {
	track = m_c1
	lifestyle = career
	start_node = m_c1_film1_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			career = 15
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_c1_film2_track_info = {
	track = m_c1
	lifestyle = career
	start_node = m_c1_film2_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			career = 15
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_c1_film3_track_info = {
	track = m_c1
	lifestyle = career
	start_node = m_c1_film3_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			career = 15
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_c1_finaloutro_track_info = {
	track = m_c1
	lifestyle = career
	start_node = m_c1_finaloutro_goalped_pos
	ped_travel_method = teleport_with_skater
	auto_start = 1
	goal_rewards = {
		crib_piece = CRIB_UNLOCK_C102
		crib_piece_movie = 'crib_career_1_2'
		cas_parts = [
			{
				part = CAS_Accessory01
				desc_id = CAS_shared_ACC_gradringL
				name = "Graduation Ring"
				flag = $CAS_UNLOCK_C102
				apply_it = 1
			}
		]
		special = {
			trick = Trick_NTTSpecial
			key_combo = SpAir_D_L_Circle
			index = 3
		}
	}
}
