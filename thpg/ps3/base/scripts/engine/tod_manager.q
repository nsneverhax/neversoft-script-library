default_light_group = outdoor

script tod_manager_apply_perm_light_settings 
	setshadowdirfromlight \{name = Z_WORLD_LFX_Sun}
	setshadowmapparams \{near = 6.0
		far = 80.0
		lispsmneardistance = 2.0
		lispsmfardistance = 16.0}
endscript

script tod_manager_create_perm_lights 
	createfromstructure {
		class = levellight
		createdatstart
		name = VCAmbient
		type = ambient
		global
		lightgroup = group4
		pos = (0.0, 0.0, 0.0)
		angles = (0.0, 0.0, 0.0)
		intensity = 1
		lightcolor = (1.0, 1.0, 1.0)
		attenstart = 5000.0
		attenend = 5000.0
	}
	createfromstructure {
		class = levellight
		createdatstart
		name = LSAmbient
		type = ambient
		global
		lightgroup = group5
		pos = (0.0, 0.0, 0.0)
		angles = (0.0, 0.0, 0.0)
		intensity = 1
		lightcolor = (1.0, 1.0, 1.0)
		attenstart = 5000.0
		attenend = 5000.0
	}
	createfromstructure {
		class = levellight
		createdatstart
		name = MasterFukinGRP1
		type = dir
		global
		shadow
		lightgroup = group1
		pos = (0.0, 1000.0, 0.0)
		angles = (0.0, 0.0, 0.0)
		intensity = 0.1
		lightcolor = (1.0, 1.0, 1.0)
		attenstart = 5000.0
		attenend = 5000.0
		shadowdensity = 1.0
		specularintensity = 0.1
	}
endscript
