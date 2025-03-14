CAP_Vert_Object_Settings = {
	state = {
		up_offset = 0.0
		forward_offset = 12
		camera_dist = 15
		force_to_ground = true
	}
}
CAP_Vert_Objects = {
	verts = [
		{
			name = Small_Quarterpipe
			name_string = "Small_Quarterpipe"
			model = 'Props\\RK_Small_QP\\RK_Small_QP'
			collision = 'Props\\RK_Small_QP_coll\\RK_Small_QP_coll'
			sounds = CAP_Sliding_Sounds_Default
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Vert_Object_Settings
		}
		{
			name = Small_Quarterpipe_45
			name_string = "Small_Quarterpipe_45"
			model = 'Props\\qp_45_rig\\qp_45_rig'
			collision = 'Props\\qp_45_rig_coll\\qp_45_rig_coll'
			sounds = CAP_Sliding_Sounds_Default
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Vert_Object_Settings
		}
		{
			name = Small_Quarterpipe_90
			name_string = "Small_Quarterpipe_90"
			model = 'Props\\qp_90_01\\qp_90_01'
			collision = 'Props\\qp_90_coll\\qp_90_coll'
			sounds = CAP_Sliding_Sounds_Default
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Vert_Object_Settings
		}
		{
			name = Large_Quarterpipe
			name_string = "Large_Quarterpipe"
			model = 'Props\\RK_LARGE_QP\\RK_LARGE_QP'
			collision = 'Props\\RK_LARGE_QP_coll\\RK_LARGE_QP_coll'
			sounds = CAP_Sliding_Sounds_Default
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Vert_Object_Settings
		}
		{
			name = Boost_Quarterpipe
			name_string = "Boost_Quarterpipe"
			model = 'Props\\RK_Boost_QP\\RK_Boost_QP'
			collision = 'Props\\RK_Boost_QP_coll\\RK_Boost_QP_coll'
			sounds = CAP_Sliding_Sounds_Default
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Vert_Object_Settings
		}
		{
			name = spine
			name_string = "Spine"
			model = 'Props\\RK_Spine\\RK_Spine'
			collision = 'Props\\RK_Spine_coll\\RK_Spine_coll'
			sounds = CAP_Sliding_Sounds_Default
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Vert_Object_Settings
		}
	]
}
