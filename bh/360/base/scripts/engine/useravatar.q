avatar_scale_color = (0.9, 0.9, 0.9)
avatar_transition_color = (1.0, 1.0, 1.0)
avatar_dark_color = (1.0, 1.0, 1.0)
AvatarSkinBuilderTree = {
	type = Source
	anim = gh_rocker_avatar_tpose
}
AvatarSkinBuilderTree_Moving = {
	type = Cycle
	[
		{
			type = Source
			anim = gh3xp1_crowd_becki_bad1
		}
	]
}

script TestAvatar 
	if ObjectExists \{id = AvatarSkinBuilder}
		AvatarSkinBuilder :Die
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
			name = AvatarSkinBuilder
			skeletonName = GH_Rocker_Avatar_original
			Pos = (0.0, 0.0, 0.0)
			Orientation = (0.0, 0.0, 0.0)
		}}
	AvatarSkinBuilder :Anim_InitTree \{Tree = $AvatarSkinBuilderTree}
	AvatarSkinBuilder :anim_updatepose
	AvatarSkinBuilder :UnPause
endscript

script AnimateAvatar 
	if NOT ObjectExists \{id = AvatarSkinBuilder}
		return
	endif
	Drummer :hide
	AvatarSkinBuilder :Anim_UnInitTree
	AvatarSkinBuilder :Anim_InitTree \{Tree = $AvatarSkinBuilderTree_Moving}
endscript
