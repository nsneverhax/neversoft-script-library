human_torso_degrees_neg = -50
human_torso_degrees_pos = 50

script RegisterAnims_Human_Move 
	default_human_move_dir_motion_params = {
		rotate_type = strafe
		orient_type = body
		extract_vertical_motion = false
		pause_linear_movement = false
		pause_rotational_movement = false
	}
	default_human_move_stopped_shuffle_params = {
		orient_type = body
		extract_vertical_motion = false
		pause_linear_movement = false
		pause_rotational_movement = false
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Stopped_None
		play_mode = loop
		type = single
		set =
		{
			orient_type = body
			anim_id = Move_Ground_Idle
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Stopped_Shuffle_Neg_1
		play_mode = once
		type = motion_extract_single
		set =
		{
			<default_human_move_stopped_shuffle_params>
			anim_id = Move_Ground_Idle_Shuffle_Neg_1
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Stopped_Shuffle_Pos_1
		play_mode = once
		type = motion_extract_single
		set =
		{
			<default_human_move_stopped_shuffle_params>
			anim_id = Move_Ground_Idle_Shuffle_Pos_1
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Stopped_Shuffle_Neg_2
		play_mode = once
		type = motion_extract_single
		set =
		{
			<default_human_move_stopped_shuffle_params>
			anim_id = Move_Ground_Idle_Shuffle_Neg_2
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Stopped_Shuffle_Pos_2
		play_mode = once
		type = motion_extract_single
		set =
		{
			<default_human_move_stopped_shuffle_params>
			anim_id = Move_Ground_Idle_Shuffle_Pos_2
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Stopped_Shuffle_Neg_3
		play_mode = once
		type = motion_extract_single
		set =
		{
			<default_human_move_stopped_shuffle_params>
			anim_id = Move_Ground_Idle_Shuffle_Neg_3
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Stopped_Shuffle_Pos_3
		play_mode = once
		type = motion_extract_single
		set =
		{
			<default_human_move_stopped_shuffle_params>
			anim_id = Move_Ground_Idle_Shuffle_Pos_3
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Stopped
		play_mode = loop
		type = shuffle
		set =
		{
			shuffle_blend_in_dur = 0.2
			shuffle_blend_out_dur = 0.2
			idle_anim_set = Human_Move_Ground_Stopped_None
			neg_anim_sets =
			[
				Human_Move_Ground_Stopped_Shuffle_Neg_1
				Human_Move_Ground_Stopped_Shuffle_Neg_2
				Human_Move_Ground_Stopped_Shuffle_Neg_3
			]
			pos_anim_sets =
			[
				Human_Move_Ground_Stopped_Shuffle_Pos_1
				Human_Move_Ground_Stopped_Shuffle_Pos_2
				Human_Move_Ground_Stopped_Shuffle_Pos_3
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Walk
		play_mode = loop
		type = motion_extract_dir
		set =
		{
			<default_human_move_dir_motion_params>
			anims =
			[
				{hor_anim_id = Move_Ground_Walk_F}
				{hor_anim_id = Move_Ground_Walk_FR}
				{hor_anim_id = Move_Ground_Walk_BR}
				{hor_anim_id = Move_Ground_Walk_B}
				{hor_anim_id = Move_Ground_Walk_BL}
				{hor_anim_id = Move_Ground_Walk_FL}
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Walk_Start
		play_mode = once
		type = motion_extract_dir
		set =
		{
			<default_human_move_dir_motion_params>
			anims =
			[
				{hor_anim_id = Move_Ground_Walk_Start_F}
				{hor_anim_id = Move_Ground_Walk_Start_FR}
				{hor_anim_id = Move_Ground_Walk_Start_BR}
				{hor_anim_id = Move_Ground_Walk_Start_B}
				{hor_anim_id = Move_Ground_Walk_Start_BL}
				{hor_anim_id = Move_Ground_Walk_Start_FL}
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Walk_StopL
		play_mode = once
		type = motion_extract_dir
		set =
		{
			<default_human_move_dir_motion_params>
			anims =
			[
				{hor_anim_id = Move_Ground_Walk_StopL_F}
				{hor_anim_id = Move_Ground_Walk_StopL_FR}
				{hor_anim_id = Move_Ground_Walk_StopL_BR}
				{hor_anim_id = Move_Ground_Walk_StopL_B}
				{hor_anim_id = Move_Ground_Walk_StopL_BL}
				{hor_anim_id = Move_Ground_Walk_StopL_FL}
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Walk_StopR
		play_mode = once
		type = motion_extract_dir
		set =
		{
			<default_human_move_dir_motion_params>
			anims =
			[
				{hor_anim_id = Move_Ground_Walk_StopR_F}
				{hor_anim_id = Move_Ground_Walk_StopR_FR}
				{hor_anim_id = Move_Ground_Walk_StopR_BR}
				{hor_anim_id = Move_Ground_Walk_StopR_B}
				{hor_anim_id = Move_Ground_Walk_StopR_BL}
				{hor_anim_id = Move_Ground_Walk_StopR_FL}
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Run
		play_mode = loop
		type = motion_extract_dir
		set =
		{
			<default_human_move_dir_motion_params>
			anims =
			[
				{hor_anim_id = Move_Ground_Run_F}
				{hor_anim_id = Move_Ground_Run_FR}
				{hor_anim_id = Move_Ground_Run_BR}
				{hor_anim_id = Move_Ground_Run_B}
				{hor_anim_id = Move_Ground_Run_BL}
				{hor_anim_id = Move_Ground_Run_FL}
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Run_Start
		play_mode = once
		type = motion_extract_dir
		set =
		{
			<default_human_move_dir_motion_params>
			anims =
			[
				{hor_anim_id = Move_Ground_Run_Start_F}
				{hor_anim_id = Move_Ground_Run_Start_FR}
				{hor_anim_id = Move_Ground_Run_Start_BR}
				{hor_anim_id = Move_Ground_Run_Start_B}
				{hor_anim_id = Move_Ground_Run_Start_BL}
				{hor_anim_id = Move_Ground_Run_Start_FL}
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Run_StopL
		play_mode = once
		type = motion_extract_dir
		set =
		{
			<default_human_move_dir_motion_params>
			anims =
			[
				{hor_anim_id = Move_Ground_Run_StopL_F}
				{hor_anim_id = Move_Ground_Run_StopL_FR}
				{hor_anim_id = Move_Ground_Run_StopL_BR}
				{hor_anim_id = Move_Ground_Run_StopL_B}
				{hor_anim_id = Move_Ground_Run_StopL_BL}
				{hor_anim_id = Move_Ground_Run_StopL_FL}
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground_Run_StopR
		play_mode = once
		type = motion_extract_dir
		set =
		{
			<default_human_move_dir_motion_params>
			anims =
			[
				{hor_anim_id = Move_Ground_Run_StopR_F}
				{hor_anim_id = Move_Ground_Run_StopR_FR}
				{hor_anim_id = Move_Ground_Run_StopR_BR}
				{hor_anim_id = Move_Ground_Run_StopR_B}
				{hor_anim_id = Move_Ground_Run_StopR_BL}
				{hor_anim_id = Move_Ground_Run_StopR_FL}
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move_Ground
		type = move_state
		set =
		{
			anims =
			[
				{move_state = stopped anim_set_id = Human_Move_Ground_Stopped}
				{move_state = walking anim_set_id = Human_Move_Ground_Walk}
				{move_state = starting_walk anim_set_id = Human_Move_Ground_Walk_Start}
				{move_state = stopping_walk_l anim_set_id = Human_Move_Ground_Walk_StopL}
				{move_state = stopping_walk_r anim_set_id = Human_Move_Ground_Walk_StopR}
				{move_state = running anim_set_id = Human_Move_Ground_Run}
				{move_state = starting_run anim_set_id = Human_Move_Ground_Run_Start}
				{move_state = stopping_run_l anim_set_id = Human_Move_Ground_Run_StopL}
				{move_state = stopping_run_r anim_set_id = Human_Move_Ground_Run_StopR}
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move_Skateboard_Moving_Pos
		play_mode = loop
		type = single
		set = {orient_type = move
			anim_id = Move_Skateboard_LeanBack}}
	RegisterAnimSet {
		name = Human_Move_Skateboard_Moving_Neg
		play_mode = loop
		type = single
		set = {orient_type = move
			anim_id = Move_Skateboard_LeanIn}}
	RegisterAnimSet {
		name = Human_Move_Skateboard_Moving_None
		play_mode = loop
		type = single
		set =
		{
			orient_type = move
			anim_id = Move_Skateboard_Idle_Stand
		}
	}
	RegisterAnimSet {
		name = Human_Move_Skateboard_Moving
		type = rot_speed_associate
		set = {rot_speed = Rot_Speed_Skateboard_Lean
			anims = [
				{rot_speed_type = none , anim_set_id = Human_Move_Skateboard_Moving_None}
				{rot_speed_type = pos , anim_set_id = Human_Move_Skateboard_Moving_Pos}
				{rot_speed_type = neg , anim_set_id = Human_Move_Skateboard_Moving_Neg}
			]}
	}
	RegisterAnimSet {
		name = Human_Move_Skateboard_Stopped_Pos
		play_mode = loop
		type = single
		set = {orient_type = move
			anim_id = Move_Skateboard_Shuffle_Pos}}
	RegisterAnimSet {
		name = Human_Move_Skateboard_Stopped_Neg
		play_mode = loop
		type = single
		set = {orient_type = move
			anim_id = Move_Skateboard_Shuffle_Neg}}
	RegisterAnimSet {
		name = Human_Move_Skateboard_Stopped_None
		play_mode = loop
		type = single
		set =
		{
			orient_type = move
			anim_id = Move_Skateboard_Stopped
		}
	}
	RegisterAnimSet {
		name = Human_Move_Skateboard_Stopped
		type = rot_speed_associate
		set = {rot_speed = Rot_Speed_Skateboard_Shuffle
			anims = [
				{rot_speed_type = none , anim_set_id = Human_Move_Skateboard_Stopped_None}
				{rot_speed_type = pos , anim_set_id = Human_Move_Skateboard_Stopped_Pos}
				{rot_speed_type = neg , anim_set_id = Human_Move_Skateboard_Stopped_Neg}
			]}
	}
	RegisterAnimSet {
		name = Human_Move_Skateboard
		type = speed_association
		set =
		{
			child_blend_dur = $skateboard_speed_blend_dur
			anims =
			[
				{speed_type = stop anim_set_id = Human_Move_Skateboard_Stopped}
				{speed_type = walk_slow anim_set_id = Human_Move_Skateboard_Moving}
				{speed_type = walk_fast anim_set_id = Human_Move_Skateboard_Moving}
				{speed_type = run_slow anim_set_id = Human_Move_Skateboard_Moving}
				{speed_type = run_fast anim_set_id = Human_Move_Skateboard_Moving}
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move
		type = vehicle_association
		set =
		{
			anims =
			[
				{vehicle_type = none anim_set_id = Human_Move_Ground}
				{vehicle_type = skateboard anim_set_id = Human_Move_Skateboard}
			]
		}
	}
endscript
