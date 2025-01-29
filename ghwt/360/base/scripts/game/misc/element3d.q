
script element3d_add_components 
	if GotParam \{skeletonname}
		PushMemProfile \{'Element3d Skeletons'}
		CreateComponentFromStructure component = Skeleton <...> Skeleton = <skeletonname>
		PopMemProfile
	endif
	if GotParam \{AnimName}
		CreateComponentFromStructure component = Model LightGroup = None max_scene_lights = 0 <...> Scale = 1
		CreateComponentFromStructure \{component = AnimTree}
	else
		CreateComponentFromStructure component = Model <...> Scale = 1 LightGroup = None
	endif
endscript

script element3d_init_model 
	if GotParam \{AnimName}
		if GotParam \{blackout_model}
			SetLightAmbientColor \{r = 0
				g = 0
				b = 0}
			SetLightDiffuseColor \{index = 0
				r = 0
				g = 0
				b = 0}
			SetLightDiffuseColor \{index = 1
				r = 0
				g = 0
				b = 0}
			SetLightAmbientColor \{r = 0
				g = 0
				b = 0}
			SetLightDiffuseColor \{index = 0
				r = 0
				g = 0
				b = 0}
			SetLightDiffuseColor \{index = 1
				r = 0
				g = 0
				b = 0}
		else
			SetLightAmbientColor \{r = 128
				g = 128
				b = 128}
			SetLightDiffuseColor \{index = 0
				r = 110
				g = 125
				b = 155}
			SetLightDiffuseColor \{index = 1
				r = 10
				g = 3
				b = 5}
		endif
		Obj_ForceUpdate
	endif
endscript
