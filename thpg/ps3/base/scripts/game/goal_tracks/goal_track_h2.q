m_h2_boneless_track_info = {
	track = m_h2
	lifestyle = hardcore
	start_node = m_h2_boneless_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			hardcore = 10
		}
		cash_reward = [
			100
			100
			100
		]
		zone_unlock = philly_fdr
	}
}
m_h2_learncheck_track_info = {
	track = m_h2
	lifestyle = hardcore
	start_node = m_h2_learncheck_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		skill = checking
		goal_points = {
			hardcore = 10
		}
		cash_reward = [
			100
			100
			100
		]
	}
}
m_h2_takefdr_track_info = {
	track = m_h2
	lifestyle = hardcore
	start_node = m_h2_takefdr_goalped_pos
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
		crib_piece = CRIB_UNLOCK_H201
		crib_piece_movie = 'crib_hardcore_2_1'
		zone_unlock = philly_fdr
		cas_parts = [
			{
				part = CAS_Accessory03
				desc_id = CAS_ACC_scar01
				name = "Eye Scar"
				flag = $CAS_UNLOCK_H201
				apply_it = 1
			}
		]
	}
}
m_h2_clearbcity_track_info = {
	track = m_h2
	lifestyle = hardcore
	start_node = m_h2_clearbcity_goalped_pos
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
m_h2_clearmuseums_track_info = {
	track = m_h2
	lifestyle = hardcore
	start_node = m_h2_clearmuseums_goalped_pos
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
m_h2_bossbattle_track_info = {
	track = m_h2
	lifestyle = hardcore
	start_node = m_h2_bossbattle_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			hardcore = 25
		}
		cash_reward = [
			500
			500
			500
		]
		crib_piece = CRIB_UNLOCK_H202
		crib_piece_movie = 'crib_hardcore_2_2'
		cas_parts = [
			{
				part = CAS_Accessory01
				desc_id = CAS_shared_brassknucklesL
				name = "Cam's Brass Knuckles"
				flag = $CAS_UNLOCK_H202
				apply_it = 1
			}
		]
		special = {
			trick = Trick_MoshManual
			key_combo = SpMan_D_L_Triangle
			index = 7
		}
	}
}
