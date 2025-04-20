m_c2_ntg_track_info = {
	track = m_c2
	lifestyle = career
	start_node = m_c2_ntg_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		skill = ntg
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
m_c2_localcomp_track_info = {
	track = m_c2
	lifestyle = career
	start_node = m_c2_localcomp_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			career = 20
		}
		cash_reward = [
			100
			100
			100
		]
		crib_piece = CRIB_UNLOCK_C201
		crib_piece_movie = 'crib_career_2_1'
		cas_parts = [
			{
				part = CAS_DECK_GRAPHIC
				desc_id = Dead_Sparrow01
				name = "Dead Sparrow"
				flag = $CAS_UNLOCK_C201
				apply_it = 1
			}
		]
	}
}
m_c2_compstreet_track_info = {
	track = m_c2
	lifestyle = career
	start_node = m_c2_compstreet_goalped_pos
	ped_travel_method = Teleport
	buddy_profile = $pro_sheckler
	goal_rewards = {
		goal_points = {
			career = 20
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_c2_compvert_track_info = {
	track = m_c2
	lifestyle = career
	start_node = m_c2_compvert_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			career = 20
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_c2_comppark_track_info = {
	track = m_c2
	lifestyle = career
	start_node = m_c2_comppark_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			career = 20
		}
		cash_reward = [
			500
			500
			500
		]
		crib_piece = CRIB_UNLOCK_C202
		crib_piece_movie = 'crib_career_2_2'
		cas_parts = [
			{
				part = cas_torso
				desc_id = CAS_reg_TSHIRT_killsparrow
				name = "Dead Sparrow Shirt"
				flag = $CAS_UNLOCK_C202
				apply_it = 1
			}
		]
		special = {
			trick = Trick_NailTheGrab
			key_combo = SpAir_L_R_Circle
			index = 4
		}
	}
}
