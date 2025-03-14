
script Face_PlayRandomBailPose \{blendduration = 0.1}
	return
	anim = Random (@ sk8_face_bail_01_D
		@ sk8_face_bail_02_D
		@ sk8_face_bail_03_D
		@ sk8_face_bail_04_D
		@ sk8_face_bail_05_D
		)
	anim_command {
		target = face
		command = degenerateblend_addbranch
		params = {
			tree = $Face_PoseAnimBranch
			blendduration = <blendduration>
			params = {anim = <anim>}
		}
	}
endscript
Face_PoseAnimBranch = {
	type = source
	anim = anim
	id = face_source
}

script Face_ClearAnim \{blendduration = 0}
	if anim_animnodeexists \{id = face}
		anim_command {
			target = face
			command = degenerateblend_addbranch
			params = {
				tree = $blank_animbranch
				blendduration = <blendduration>
			}
		}
	endif
endscript

script Face_PlayLoopingIdleAnims \{blendduration = 0.1}
	Face_KillLoopingIdleAnims
	obj_spawnscriptlater Face_PlayLoopingIdleAnims2 params = {blendduration = <blendduration>}
endscript

script Face_PlayLoopingIdleAnims2 
	onexitrun \{Face_ClearAnim}
	begin
	anim = Random (
		@ sk8_face_idle_20_D )

	anim_command {
		target = face
		command = degenerateblend_addbranch
		params = {
			tree = $Face_IdleAnimBranch
			blendduration = <blendduration>
			params = {anim = <anim>}
		}
	}
	anim_command \{target = face_timer
		command = timer_wait}
	repeat
endscript
Face_IdleAnimBranch = {
	type = play
	id = face_timer
	anim = anim
	[
		{
			type = source
			anim = anim
			id = face_source
		}
	]
}

script Face_KillLoopingIdleAnims 
	obj_killspawnedscript \{name = Face_PlayLoopingIdleAnims2}
endscript
