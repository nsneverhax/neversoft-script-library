avatar_scale_color = (0.9, 0.9, 0.9)
avatar_transition_color = (1.0, 1.0, 1.0)
avatar_dark_color = (1.0, 1.0, 1.0)
avatarskinbuildertree = {
	type = source
	anim = gh_rocker_avatar_tpose
}
avatarskinbuildertree_moving = {
	type = cycle
	[
		{
			type = source
			anim = gh3xp1_crowd_becki_bad1
		}
	]
}

script testavatar 
	if objectexists \{id = avatarskinbuilder}
		avatarskinbuilder :die
	endif
	createcompositeobject \{components = [
			{
				component = skeleton
			}
			{
				component = animtree
			}
			{
				component = setdisplaymatrix
			}
			{
				component = model
			}
		]
		params = {
			name = avatarskinbuilder
			skeletonname = `skeletons/gh_rocker_avatar_global.ske`
			pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		}}
	avatarskinbuilder :anim_inittree \{tree = $avatarskinbuildertree}
	avatarskinbuilder :anim_updatepose
	avatarskinbuilder :unpause
endscript

script killavatar 
	avatarskinbuilder :die
endscript

script animateavatar 
	if NOT objectexists \{id = avatarskinbuilder}
		return
	endif
	drummer :hide
	avatarskinbuilder :anim_uninittree
	avatarskinbuilder :anim_inittree \{tree = $avatarskinbuildertree_moving}
endscript
