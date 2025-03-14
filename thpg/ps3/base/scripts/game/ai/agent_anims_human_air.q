
script RegisterAnims_Human_Air 
	RegisterAnimSet \{name = Human_Move_Air
		play_mode = once
		type = dir
		set = {
			rotate_type = strafe
			orient_type = body
			anims = [
				{
					hor_anim_id = Move_NoItem_Air_Stand_Hor
					pos_vrt_anim_id = Move_NoItem_Stand_Pos_Vrt
					neg_vrt_anim_id = Move_NoItem_Stand_Neg_Vrt
				}
			]
		}}
endscript
