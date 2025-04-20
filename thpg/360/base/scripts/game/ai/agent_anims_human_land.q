
script RegisterAnims_Human_Land 
	RegisterAnimSet {
		name = Human_Move_NoItem_Land_Stand_Stop
		play_mode = once
		type = dir
		set =
		{
			rotate_type = strafe
			orient_type = body
			anims =
			[{hor_anim_id = Move_NoItem_Land_Stand_Stop_Hor
					pos_vrt_anim_id = Move_NoItem_Stand_Pos_Vrt
					neg_vrt_anim_id = Move_NoItem_Stand_Neg_Vrt}
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move_NoItem_Land_Stand_Run
		play_mode = once
		type = dir
		set =
		{
			rotate_type = strafe
			orient_type = body
			anims =
			[{hor_anim_id = Move_NoItem_Land_Stand_Run_Hor
					pos_vrt_anim_id = Move_NoItem_Stand_Pos_Vrt
					neg_vrt_anim_id = Move_NoItem_Stand_Neg_Vrt}
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move_NoItem_Land
		type = speed_association
		set =
		{
			child_blend_dur = 0.2
			anims =
			[
				{speed_type = stop , anim_set_id = Human_Move_NoItem_Land_Stand_Stop}
				{speed_type = walk_slow , anim_set_id = Human_Move_NoItem_Land_Stand_Run}
				{speed_type = walk_fast , anim_set_id = Human_Move_NoItem_Land_Stand_Run}
				{speed_type = run_slow , anim_set_id = Human_Move_NoItem_Land_Stand_Run}
				{speed_type = run_fast , anim_set_id = Human_Move_NoItem_Land_Stand_Run}
			]
		}
	}
	RegisterAnimSet {
		name = Human_Move_Land
		type = item_association
		set =
		{
			child_blend_dur = 0.2
			anims =
			[
				{item_type = none , anim_set_id = Human_Move_NoItem_Land}
				{item_type = fist , anim_set_id = Human_Move_NoItem_Land}
				{item_type = knife , anim_set_id = Human_Move_NoItem_Land}
			]
		}
	}
endscript
