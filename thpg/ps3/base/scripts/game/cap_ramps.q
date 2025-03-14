CAP_Ramp_Object_Settings = {
	state = {
		up_offset = 0.0
		forward_offset = 12
		camera_dist = 15
		force_to_ground = true
	}
}
CAP_Ramp_Objects = {
	Ramps = [
		{
			name = Small_Kicker
			name_string = "Small_Kicker"
			model = 'Props\\RK_Small_Kicker\\RK_Small_Kicker'
			collision = 'Props\\RK_Small_Kicker_coll\\RK_Small_Kicker_coll'
			sounds = CAP_Sliding_Sounds_Wood
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Ramp_Object_Settings
		}
		{
			name = Large_Kicker
			name_string = "Large_Kicker"
			model = 'Props\\RK_Large_Kicker\\RK_Large_Kicker'
			collision = 'Props\\RK_Large_Kicker_coll\\RK_Large_Kicker_coll'
			sounds = CAP_Sliding_Sounds_Wood
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Ramp_Object_Settings
		}
		{
			name = Boost_Kicker
			name_string = "Boost_Kicker"
			model = 'Props\\RK_Boost_Kicker\\RK_Boost_Kicker'
			collision = 'Props\\RK_Boost_Kicker_coll\\RK_Boost_Kicker_coll'
			sounds = CAP_Sliding_Sounds_Wood
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Ramp_Object_Settings
		}
		{
			name = Funbox
			name_string = "Funbox"
			model = 'Props\\RK_Funbox_Kicker\\RK_Funbox_Kicker'
			collision = 'Props\\RK_Funbox_Kicker_coll\\RK_Funbox_Kicker_coll'
			sounds = CAP_Sliding_Sounds_Wood
			is_valid_script = cap_is_valid_rigger_piece_unlocked
			$CAP_Ramp_Object_Settings
		}
	]
}
