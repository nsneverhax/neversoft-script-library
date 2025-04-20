CAP_Rail_Object_Settings = {
	state = {
		up_offset = 0.7
		forward_offset = 12
		camera_dist = 15
		force_to_ground = false
	}
}
CAP_Rail_Objects = {
	rails = [
		{
			name = Small_Rail
			name_string = "Small_Rail"
			model = 'Props\\RK_Small_Rail\\RK_Small_Rail'
			collision = 'Props\\RK_Small_Rail_coll\\RK_Small_Rail_coll'
			sounds = CAP_Sliding_Sounds_Metal
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Rail_Object_Settings
		}
		{
			name = Large_Rail
			name_string = "Large_Rail"
			model = 'Props\\RK_LARGE_Rail\\RK_LARGE_Rail'
			collision = 'Props\\RK_LARGE_Rail_coll\\RK_LARGE_Rail_coll'
			sounds = CAP_Sliding_Sounds_Metal
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Rail_Object_Settings
		}
		{
			name = Boost_Rail
			name_string = "Boost_Rail"
			model = 'Props\\RK_Boost_Rail\\RK_Boost_Rail'
			collision = 'Props\\RK_Boost_Rail_coll\\RK_Boost_Rail_coll'
			sounds = CAP_Sliding_Sounds_Metal
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Rail_Object_Settings
		}
		{
			name = Corner_Rail
			name_string = "Corner_Rail"
			model = 'Props\\RK_Corner_Rail\\RK_Corner_Rail'
			collision = 'Props\\RK_Corner_Rail_coll\\RK_Corner_Rail_coll'
			sounds = CAP_Sliding_Sounds_Metal
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Rail_Object_Settings
		}
		{
			name = UTurn_Rail
			name_string = "UTurn_Rail"
			model = 'Props\\RK_UTurn_Rail\\RK_UTurn_Rail'
			collision = 'Props\\RK_UTurn_Rail_coll\\RK_UTurn_Rail_coll'
			sounds = CAP_Sliding_Sounds_Metal
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Rail_Object_Settings
		}
	]
}
