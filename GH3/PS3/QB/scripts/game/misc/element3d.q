
script element3d_add_components 
	if GotParam \{SkeletonName}
		PushMemProfile \{'Element3d Skeletons'}
		CreateComponentFromStructure Component = Skeleton <...> Skeleton = <SkeletonName>
		PopMemProfile
	endif
	if GotParam \{AnimName}
		CreateComponentFromStructure Component = Model LightGroup = NONE max_scene_lights = 0 <...> Scale = 1
		CreateComponentFromStructure \{Component = AnimTree}
	else
		CreateComponentFromStructure Component = Model <...> Scale = 1 LightGroup = NONE
	endif
endscript

script element3d_init_model 
	if GotParam \{AnimName}
		if GotParam \{blackout_model}
			SetLightAmbientColor \{R = 0
				G = 0
				B = 0}
			SetLightDiffuseColor \{Index = 0
				R = 0
				G = 0
				B = 0}
			SetLightDiffuseColor \{Index = 1
				R = 0
				G = 0
				B = 0}
			SetLightAmbientColor \{R = 0
				G = 0
				B = 0}
			SetLightDiffuseColor \{Index = 0
				R = 0
				G = 0
				B = 0}
			SetLightDiffuseColor \{Index = 1
				R = 0
				G = 0
				B = 0}
		else
			SetLightAmbientColor \{R = 128
				G = 128
				B = 128}
			SetLightDiffuseColor \{Index = 0
				R = 110
				G = 125
				B = 155}
			SetLightDiffuseColor \{Index = 1
				R = 10
				G = 3
				B = 5}
		endif
		Obj_ForceUpdate
	endif
endscript
