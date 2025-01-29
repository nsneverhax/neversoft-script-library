avatar_scale_color = (0.9, 0.9, 0.9)
avatar_transition_color = (1.0, 1.0, 1.0)
avatar_dark_color = (1.0, 1.0, 1.0)
avatarskinbuildertree = {
	Type = Source
	anim = gh_rocker_avatar_tpose
}
avatarskinbuildertree_moving = {
	Type = cycle
	[
		{
			Type = Source
			anim = gh3xp1_crowd_becki_bad1
		}
	]
}

script testavatar 
	if ObjectExists \{id = avatarskinbuilder}
		avatarskinbuilder :Die
	endif
	CreateCompositeObject \{components = [
			{
				component = Skeleton
			}
			{
				component = AnimTree
			}
			{
				component = SetDisplayMatrix
			}
			{
				component = Model
			}
		]
		params = {
			Name = avatarskinbuilder
			skeletonname = `skeletons/gh_rocker_avatar_global.ske`
			Pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		}}
	avatarskinbuilder :Anim_InitTree \{Tree = $avatarskinbuildertree}
	avatarskinbuilder :Anim_UpdatePose
	avatarskinbuilder :Unpause
endscript

script killavatar 
	avatarskinbuilder :Die
endscript

script animateavatar 
	if NOT ObjectExists \{id = avatarskinbuilder}
		return
	endif
	drummer :Hide
	avatarskinbuilder :Anim_UnInitTree
	avatarskinbuilder :Anim_InitTree \{Tree = $avatarskinbuildertree_moving}
endscript
