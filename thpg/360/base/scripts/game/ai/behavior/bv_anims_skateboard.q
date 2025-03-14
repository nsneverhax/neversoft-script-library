
script RegisterBehaviors_Anims_Skateboard 
	registerstate \{name = Bv_Anims_Skateboard
		task = {
			name = Task_HumanAnims
			params = {
				human_anim_stage = lower
				anim_set_id = Skateboard_Move
				blend_in_dur = 0.4
				blend_out_dur = 0.4
			}
		}}
endscript
