
script element3d_add_components 
	if gotparam \{skeletonname}
		pushmemprofile \{'Element3d Skeletons'}
		createcomponentfromstructure component = skeleton <...> skeleton = <skeletonname>
		popmemprofile
	endif
	if gotparam \{animname}
		createcomponentfromstructure component = model lightgroup = none max_scene_lights = 0 <...> scale = 1
		createcomponentfromstructure \{component = animtree}
	else
		createcomponentfromstructure component = model <...> scale = 1 lightgroup = none
	endif
endscript

script element3d_init_model 
	if gotparam \{animname}
		if gotparam \{blackout_model}
			setlightambientcolor \{r = 0
				g = 0
				b = 0}
			setlightdiffusecolor \{index = 0
				r = 0
				g = 0
				b = 0}
			setlightdiffusecolor \{index = 1
				r = 0
				g = 0
				b = 0}
			setlightambientcolor \{r = 0
				g = 0
				b = 0}
			setlightdiffusecolor \{index = 0
				r = 0
				g = 0
				b = 0}
			setlightdiffusecolor \{index = 1
				r = 0
				g = 0
				b = 0}
		else
			setlightambientcolor \{r = 128
				g = 128
				b = 128}
			setlightdiffusecolor \{index = 0
				r = 110
				g = 125
				b = 155}
			setlightdiffusecolor \{index = 1
				r = 10
				g = 3
				b = 5}
		endif
		obj_forceupdate
	endif
endscript
