m_c3_photosession_track_info = {
	track = m_c3
	lifestyle = career
	start_node = m_c3_photosession_goalped_pos
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
	}
}
m_c3_photothemed_track_info = {
	track = m_c3
	lifestyle = career
	start_node = m_c3_photothemed_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		skill = ntm
		goal_points = {
			career = 15
		}
		cash_reward = [
			100
			100
			100
		]
		crib_piece = CRIB_UNLOCK_C301
		crib_piece_movie = 'crib_career_3_1'
		cas_parts = [
			{
				part = CAS_DECK_GRAPHIC
				desc_id = Decks_DGK_01
				name = "DGK Late Night"
				flag = $CAS_UNLOCK_C301
				apply_it = 1
			}
		]
	}
}
m_c3_epicphoto1_track_info = {
	track = m_c3
	lifestyle = career
	start_node = m_c3_epicphoto1_goalped_pos
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
	}
}
m_c3_epicphoto2_track_info = {
	track = m_c3
	lifestyle = career
	start_node = m_c3_epicphoto2_goalped_pos
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
m_c3_epicphoto3_track_info = {
	track = m_c3
	lifestyle = career
	start_node = m_c3_epicphoto3_goalped_pos
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
	}
}
m_c3_epicphoto4_track_info = {
	track = m_c3
	lifestyle = career
	start_node = m_c3_epicphoto4_goalped_pos
	ped_travel_method = Teleport
}
m_c3_finaloutro_track_info = {
	track = m_c3
	lifestyle = career
	start_node = m_c3_finaloutro_goalped_pos
	ped_travel_method = teleport_with_skater
	auto_start = 1
	goal_rewards = {
		goal_points = {
			career = 15
		}
		cash_reward = [
			100
			100
			100
		]
		crib_piece = CRIB_UNLOCK_C302
		crib_piece_movie = 'crib_career_3_2'
		cas_parts = [
			{
				part = CAS_Accessory03
				desc_id = CAS_ACC_LPnecklace
				name = "Love Park Necklace"
				flag = $CAS_UNLOCK_C302
				apply_it = 1
			}
		]
		special = {
			trick = Trick_NTMSpecial
			key_combo = SpMan_U_R_Triangle
			index = 5
		}
	}
}
