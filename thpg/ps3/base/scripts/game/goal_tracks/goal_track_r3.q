m_r3_museums_track_info = {
	track = m_r3
	lifestyle = rigger
	start_node = m_r3_museums_goalped_pos
	ped_travel_method = Teleport
	buddy_profile = $pro_mullen
	goal_rewards = {
		skill = Wrench
		goal_points = {
			rigger = 10
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_r3_monuments_track_info = {
	track = m_r3
	lifestyle = rigger
	start_node = m_r3_monuments_goalped_pos
	ped_travel_method = Teleport
	buddy_profile = $Pro_Song
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
m_r3_harbor_track_info = {
	track = m_r3
	lifestyle = rigger
	start_node = m_r3_harbor_goalped_pos
	ped_travel_method = Teleport
	buddy_profile = $Pro_Torres
	goal_rewards = {
		goal_points = {
			rigger = 15
		}
		cash_reward = [
			100
			100
			100
		]
		crib_piece = CRIB_UNLOCK_R301
		crib_piece_movie = 'crib_rigger_3_1'
		cas_parts = [
			{
				part = cas_hat
				desc_id = CAS_shared_HAT_confed
				name = "Rigger Confederate Cap"
				flag = $CAS_UNLOCK_R301
				apply_it = 1
			}
		]
	}
}
m_r3_slums_track_info = {
	track = m_r3
	lifestyle = rigger
	start_node = m_r3_slums_goalped_pos
	ped_travel_method = Teleport
	buddy_profile = $pro_mullen
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
m_r3_love_track_info = {
	track = m_r3
	lifestyle = rigger
	start_node = m_r3_love_goalped_pos
	ped_travel_method = Teleport
	buddy_profile = $pro_mullen
	goal_rewards = {
		goal_points = {
			rigger = 20
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_r3_bell_track_info = {
	track = m_r3
	lifestyle = rigger
	start_node = m_r3_bell_goalped_pos
	ped_travel_method = Teleport
	buddy_profile = $pro_mullen
	goal_rewards = {
		goal_points = {
			rigger = 25
		}
		cash_reward = [
			100
			100
			100
		]
		crib_piece = CRIB_UNLOCK_R302
		crib_piece_movie = 'crib_rigger_3_2'
		cas_parts = [
			{
				part = CAS_Accessory04
				desc_id = CAS_ACC_Gloves01
				name = "Work Gloves"
				flag = $CAS_UNLOCK_R302
				apply_it = 1
			}
		]
		special = {
			trick = Trick_WaxTheRail
			key_combo = SpGrind_D_U_Triangle
			index = 11
		}
	}
}
