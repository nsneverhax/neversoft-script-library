m_h3_bowlcomp_track_info = {
	track = m_h3
	lifestyle = hardcore
	start_node = m_h3_bowlcomp_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		zone_unlock = philly_fdr
		goal_points = {
			hardcore = 20
		}
		cash_reward = [
			100
			100
			100
		]
		crib_piece = CRIB_UNLOCK_H301
		crib_piece_movie = 'crib_hardcore_3_1'
		cas_parts = [
			{
				part = CAS_Accessory01
				desc_id = cas_shared_strapL
				name = "Leather Strap"
				flag = $CAS_UNLOCK_H301
				apply_it = 1
			}
			{
				part = cas_torso
				desc_id = CAS_reg_SHIRT_beater01
				name = "Shirtless"
				flag = $CAS_UNLOCK_H301
				apply_it = 1
			}
		]
	}
}
m_h3_wallrides_track_info = {
	track = m_h3
	lifestyle = hardcore
	start_node = m_h3_wallrides_goalped_pos
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
m_h3_secret1_track_info = {
	track = m_h3
	lifestyle = hardcore
	start_node = m_h3_secret1_goalped_pos
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
m_h3_secret2_track_info = {
	track = m_h3
	lifestyle = hardcore
	start_node = m_h3_secret2_goalped_pos
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
		crib_piece = CRIB_UNLOCK_H302
		crib_piece_movie = 'crib_hardcore_3_2'
		cas_parts = [
			{
				part = CAS_Brand_Neck
				desc_id = brand_neck_story
				name = "Bowlrider's Brand"
				flag = $CAS_UNLOCK_H302
				apply_it = 1
			}
			{
				part = cas_torso
				desc_id = CAS_reg_SHIRT_beater01
				name = "Shirtless"
				flag = $CAS_UNLOCK_H302
				apply_it = 1
			}
		]
		special = {
			trick = Trick_BoardslideHandDrag
			key_combo = SpGrind_D_L_Triangle
			index = 8
		}
	}
}
