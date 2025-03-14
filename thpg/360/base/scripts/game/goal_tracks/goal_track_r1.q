m_r1_buildqp_track_info = {
	track = m_r1
	lifestyle = rigger
	start_node = m_r1_buildqp_goalped_pos
	ped_travel_method = teleport_with_skater
	auto_start = 1
	goal_rewards = {
		goal_points = {
			rigger = 15
		}
		cash_reward = [
			100
			100
			100
		]
		rigger_piece = rig_pieces_qps_and_rails
	}
}
m_r1_demo_track_info = {
	track = m_r1
	lifestyle = rigger
	start_node = m_r1_demo_goalped_pos
	ped_travel_method = Teleport
	track_ped_areas = [
		m_r1_demo_goalped_area
	]
	goal_rewards = {
		goal_points = {
			rigger = 25
		}
		cash_reward = [
			130
			130
			130
		]
		crib_piece = CRIB_UNLOCK_R101
		crib_piece_movie = 'crib_rigger_1_1'
		cas_parts = [
			{
				part = cas_legs
				desc_id = CAS_reg_pants04
				name = "Rigger Pants"
				flag = $CAS_UNLOCK_R101
				apply_it = 1
			}
		]
	}
}
m_r1_buildspine_track_info = {
	track = m_r1
	lifestyle = rigger
	start_node = m_r1_buildspine_goalped_pos
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
		rigger_piece = rig_pieces_spine_and_platform
	}
}
m_r1_showdown_track_info = {
	track = m_r1
	lifestyle = rigger
	start_node = m_r1_showdown_goalped_pos
	ped_travel_method = Teleport
	goal_rewards = {
		goal_points = {
			rigger = 35
		}
		cash_reward = [
			500
			500
			500
		]
		crib_piece = CRIB_UNLOCK_R102
		crib_piece_movie = 'crib_rigger_1_2'
		cas_parts = [
			{
				part = CAS_DECK_GRAPHIC
				desc_id = Built
				name = "Jeff King Deck"
				flag = $CAS_UNLOCK_R102
				apply_it = 1
			}
		]
		special = {
			trick = Trick_BoardslideBodyVarial
			key_combo = SpGrind_U_L_Triangle
			index = 9
		}
	}
}
m_r1_postvid_track_info = {
	track = m_r1
	lifestyle = rigger
	start_node = m_r1_postvid_goalped_pos
	ped_travel_method = Teleport
}
