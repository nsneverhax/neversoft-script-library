skateboard_speed_blend_dur = 0.5

script RegisterAnims 
	RegisterAnimSets
	InitDefaultAnimProfiles
endscript

script RegisterAnimSets 
	RegisterAnims_Human_Air
	RegisterAnims_Human_Land
	RegisterAnims_Human_Move
	RegisterAnims_Human_Talk
	RegisterAnims_Skateboard
endscript

script RegisterAnims_Skateboard 
	RegisterAnimSet {
		name = Skateboard_Move_Moving_Pos
		play_mode = loop
		type = single
		set =
		{
			orient_type = move
			anim_id = Move_Ground_LeanBack
		}
	}
	RegisterAnimSet {
		name = Skateboard_Move_Moving_Neg
		play_mode = loop
		type = single
		set =
		{
			orient_type = move
			anim_id = Move_Ground_LeanIn
		}
	}
	RegisterAnimSet {
		name = Skateboard_Move_Moving_None
		play_mode = loop
		type = single
		set =
		{
			orient_type = move
			anim_id = Move_Ground_Idle
		}
	}
	RegisterAnimSet {
		name = Skateboard_Move_Moving
		type = rot_speed_associate
		set = {rot_speed = Rot_Speed_Ground_Lean
			anims = [
				{rot_speed_type = none , anim_set_id = Skateboard_Move_Moving_None}
				{rot_speed_type = pos , anim_set_id = Skateboard_Move_Moving_Pos}
				{rot_speed_type = neg , anim_set_id = Skateboard_Move_Moving_Neg}
			]}
	}
	RegisterAnimSet {
		name = Skateboard_Move_Stopped_Pos
		play_mode = loop
		type = single
		set =
		{
			orient_type = move
			anim_id = Move_Ground_Shuffle_Pos
		}
	}
	RegisterAnimSet {
		name = Skateboard_Move_Stopped_Neg
		play_mode = loop
		type = single
		set =
		{
			orient_type = move
			anim_id = Move_Ground_Shuffle_Neg
		}
	}
	RegisterAnimSet {
		name = Skateboard_Move_Stopped_None
		play_mode = loop
		type = single
		set =
		{
			orient_type = move
			anim_id = Move_Ground_Stopped
		}
	}
	RegisterAnimSet {
		name = Skateboard_Move_Stopped
		type = rot_speed_associate
		set = {rot_speed = Rot_Speed_Ground_Shuffle
			anims = [
				{rot_speed_type = none , anim_set_id = Skateboard_Move_Stopped_None}
				{rot_speed_type = pos , anim_set_id = Skateboard_Move_Stopped_Pos}
				{rot_speed_type = neg , anim_set_id = Skateboard_Move_Stopped_Neg}
			]}
	}
	RegisterAnimSet {
		name = Skateboard_Move
		type = speed_association
		set =
		{
			child_blend_dur = $skateboard_speed_blend_dur
			anims =
			[
				{speed_type = stop anim_set_id = Skateboard_Move_Stopped}
				{speed_type = walk_slow anim_set_id = Skateboard_Move_Moving}
				{speed_type = walk_fast anim_set_id = Skateboard_Move_Moving}
				{speed_type = run_slow anim_set_id = Skateboard_Move_Moving}
				{speed_type = run_fast anim_set_id = Skateboard_Move_Moving}
			]
		}
	}
endscript

script RegisterAnims_Human_Talk 
	RegisterAnimSet {
		name = Human_Talk_Ground
		play_mode = once
		type = single
		set = {anim_id = Talk_Ground}
	}
	RegisterAnimSet {
		name = Human_Talk_Horse
		play_mode = once
		type = single
		set = {anim_id = Talk_Horse}
	}
	RegisterAnimSet {
		name = Human_Talk
		type = vehicle_association
		set = {anims = [
				{vehicle_type = none , anim_set_id = Human_Talk_Ground}
				{vehicle_type = horse , anim_set_id = Human_Talk_Horse}
				{vehicle_type = seat , anim_set_id = Human_Talk_Ground}
				{vehicle_type = fixed_item , anim_set_id = Human_Talk_Ground}
			]}
	}
	RegisterAnimSet {
		name = Human_Notice_Base
		play_mode = loop
		type = single
		set = {anim_id = talk}
	}
	RegisterAnimSet {
		name = Human_Notice
		type = torso
		set =
		{
			base_anim_set_id = Human_Notice_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
	RegisterAnimSet {
		name = Human_Cheer_Base
		play_mode = once
		type = single
		set = {anim_id = cheer}
	}
	RegisterAnimSet {
		name = Human_Cheer
		type = torso
		set =
		{
			base_anim_set_id = Human_Cheer_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
	RegisterAnimSet {
		name = Human_Cheer_Once_Base
		play_mode = once
		type = single
		set = {anim_id = cheer}
	}
	RegisterAnimSet {
		name = Human_Cheer_Once
		type = torso
		set =
		{
			base_anim_set_id = Human_Cheer_Once_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
	RegisterAnimSet {
		name = Human_Jeer_Once_Base
		play_mode = once
		type = single
		set = {anim_id = Jeer}
	}
	RegisterAnimSet {
		name = Human_Jeer_Once
		type = torso
		set =
		{
			base_anim_set_id = Human_Jeer_Once_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
	RegisterAnimSet {
		name = Human_Annoyed_Base
		play_mode = once
		type = motion_extract_single
		set = {
			orient_type = body
			extract_vertical_motion = false
			pause_linear_movement = false
			pause_rotational_movement = false
			anim_id = Annoyed
		}
	}
	RegisterAnimSet {
		name = Human_Annoyed
		type = torso
		set =
		{
			base_anim_set_id = Human_Annoyed_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
	RegisterAnimSet {
		name = Human_Attack_Success_Base
		play_mode = once
		type = single
		set = {anim_id = Attack_Success}
	}
	RegisterAnimSet {
		name = Human_Attack_Success
		type = torso
		set =
		{
			base_anim_set_id = Human_Attack_Success_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
	RegisterAnimSet {
		name = Human_Angry_Base
		play_mode = once
		type = single
		set = {anim_id = angry
			orient_type = body}
	}
	RegisterAnimSet {
		name = Human_Angry
		type = torso
		set =
		{
			base_anim_set_id = Human_Angry_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
	RegisterAnimSet {
		name = Human_Lost_Attack_Base
		play_mode = once
		type = single
		set = {anim_id = Lost_Attack
			orient_type = body}
	}
	RegisterAnimSet {
		name = Human_Lost_Attack
		type = torso
		set =
		{
			base_anim_set_id = Human_Lost_Attack_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
	RegisterAnimSet {
		name = Human_Attention_Far_Base
		play_mode = once
		type = single
		set = {anim_id = Get_Attention_Far
			orient_type = body}
	}
	RegisterAnimSet {
		name = Human_Attention_Far
		type = torso
		set =
		{
			base_anim_set_id = Human_Attention_Far_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
	RegisterAnimSet {
		name = Human_Attention_Close_Base
		play_mode = once
		type = single
		set = {anim_id = Get_Attention_Close
			orient_type = body}
	}
	RegisterAnimSet {
		name = Human_Attention_Close
		type = torso
		set =
		{
			base_anim_set_id = Human_Attention_Close_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
	RegisterAnimSet {
		name = Human_Attention_Idle_Base
		play_mode = once
		type = single
		set = {anim_id = Get_Attention_Idle
			orient_type = body}
	}
	RegisterAnimSet {
		name = Human_Attention_Idle
		type = torso
		set =
		{
			base_anim_set_id = Human_Attention_Idle_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
	RegisterAnimSet {
		name = Human_Impatient_Idle_Base
		play_mode = once
		type = single
		set = {anim_id = Impatient_Idle
			orient_type = body}
	}
	RegisterAnimSet {
		name = Human_Impatient_Idle
		type = torso
		set =
		{
			base_anim_set_id = Human_Impatient_Idle_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
	RegisterAnimSet {
		name = Human_Impatient_Talk_Base
		play_mode = once
		type = single
		set = {anim_id = Impatient_Talk
			orient_type = body}
	}
	RegisterAnimSet {
		name = Human_Impatient_Talk
		type = torso
		set =
		{
			base_anim_set_id = Human_Impatient_Talk_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
	RegisterAnimSet {
		name = Human_Get_Up_Base
		play_mode = once
		type = single
		set = {anim_id = Move_Ground_Idle
			orient_type = body}
	}
	RegisterAnimSet {
		name = Human_Get_Up
		type = torso
		set =
		{
			base_anim_set_id = Human_Get_Up_Base
			neg_rot_degrees = $human_torso_degrees_neg
			neg_rot_anim_id = Move_Ground_Idle_Torso_Neg
			pos_rot_degrees = $human_torso_degrees_pos
			pos_rot_anim_id = Move_Ground_Idle_Torso_Pos
		}
	}
endscript
