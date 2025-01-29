Default_TOD_Manager = {
	screen_FX = [
		{
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			On = 1
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
		{
			Name = motion_blur
			scefName = motion_blur
			Type = motionblur
			On = 1
			highresolution = 1
			samples = 9.0
			spacing = 5.0
			objectmotionblurmultiplier = 1.25
			cameramotionblurmultiplier = 1.25
			skinmotionblur = currentpos
			cameramotion = 1
			THRESHOLD = 0.0
			nearplane = 0.0
			shellsize = 0.01
			forwardextrusion = 0.0
			backwardextrusion = 1.0
			alpha = 1.0
			alphaclamp = 1.0
		}
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.294118
				0.294118
				0.294118
				1.0
			]
			colormodulate = [
				0.46666703
				0.46666703
				0.46666703
				0.5
			]
			Saturation = 1.0
		}
		{
			Name = godray
			scefName = godray
			Type = godray
			On = 0
			colormodulate = [
				1.0
				0.96078396
				0.870588
				6.0
			]
			depthmodulate = 0.5
			steps = 100.0
			Range = 1.0
			fadeout_begin = 90.0
			fadeout_end = 120.0
			skycolor = [
				0.078431
				0.062745
				0.05098
				1.0
			]
			lightposition = [
				0.0
				0.0
				-50.0
				1.0
			]
			cliplightposition = 0
			lightsource = object
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.08
			Color = [
				0.5
				0.5
				0.5
				0.5
			]
			uv = [
				8.0
				6.0
				0.0
				0.0
			]
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
lobby_viewport_tod_manager = {
	screen_FX = [
		{
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			On = 1
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
		{
			Name = motion_blur
			scefName = motion_blur
			Type = motionblur
			On = 1
			highresolution = 1
			samples = 9.0
			spacing = 5.0
			objectmotionblurmultiplier = 1.25
			cameramotionblurmultiplier = 1.25
			skinmotionblur = currentpos
			cameramotion = 1
			THRESHOLD = 0.0
			nearplane = 0.0
			shellsize = 0.01
			forwardextrusion = 0.0
			backwardextrusion = 1.0
			alpha = 1.0
			alphaclamp = 1.0
		}
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 1.4499999
			farblurbegin = 2.5
			farblurend = 10.0
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.294118
				0.294118
				0.294118
				1.0
			]
			colormodulate = [
				0.46666703
				0.46666703
				0.46666703
				0.5
			]
			Saturation = 1.0
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.08
			Color = [
				0.5
				0.5
				0.5
				0.5
			]
			uv = [
				8.0
				6.0
				0.0
				0.0
			]
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_pausemenublur_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.1
			nearblurend = 0.0
			farblurbegin = 0.1
			farblurend = 100.0
		}
	]
}
DOF_Off_TOD_Manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
	]
}
DOF_CloseUp01_TOD_Manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 8.0
			farblurend = 12.0
		}
	]
}
DOF_CloseUp02_TOD_Manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.0
			farblurend = 8.0
		}
	]
}
DOF_CloseUp03_TOD_Manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 1.026
			farblurbegin = 2.3799999
			farblurend = 1.1
		}
	]
}
dof_closeup04_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 7.0
			farblurbegin = 7.0
			farblurend = 8.0
		}
	]
}
DOF_Medium01_TOD_Manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.5
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 20.0
			farblurend = 30.0
		}
	]
}
DOF_Medium02_TOD_Manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.75
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 15.0
			farblurend = 30.0
		}
	]
}
dof_long01_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.8
			nearblurbegin = 0.0
			nearblurend = 20.0
			farblurbegin = 20.0
			farblurend = 50.0
		}
	]
}
dof_stage01_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.8
			nearblurbegin = 0.0
			nearblurend = 5.0
			farblurbegin = 5.0
			farblurend = 20.0
		}
	]
}
dof_uiblur_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.9
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 0.0
			farblurend = 4.0
		}
	]
}
dof_car_accl_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 0.6
			farblurend = 0.81
		}
	]
}
dof_car_main_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.5
			farblurend = 4.5
		}
	]
}
dof_car_selchar_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 2.5
			farblurend = 5.5
		}
	]
}
dof_car_selgender_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.0
			farblurend = 5.13
		}
		{
			Name = godray
			scefName = godray
			Type = godray
			On = 1
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			depthmodulate = 0.0
			steps = 33.690998
			Range = 1.0
			fadeout_begin = 90.0
			fadeout_end = 120.0
			skycolor = [
				0.0
				0.0
				0.5
				0.0
			]
			lightposition = [
				-23.0
				5.0
				-36.0
				1.0
			]
			cliplightposition = 0
			lightsource = object
		}
	]
}
dof_car_selecttorso_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.9
			farblurend = 2.5
		}
	]
}
dof_car_sel_instr_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.75
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 0.0
			farblurend = 14.29
		}
	]
}
dof_car_sel_glasses_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 2.0
			farblurend = 2.2
		}
	]
}
dof_car_sel_micstand_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.0
			farblurend = 4.0
		}
	]
}
dof_car_sel_microphone_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 0.55
			farblurend = 0.8
		}
	]
}
dof_car_sel_guitar_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.82
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.7
			farblurend = 3.0
		}
	]
}
dof_car_sel_guitar_hardware_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.9
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.0
			farblurend = 1.1
		}
	]
}
dof_car_sel_drums_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.5
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.0
			farblurend = 4.0
		}
	]
}
dof_car_sel_drumsticks_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.0
			farblurend = 3.0
		}
	]
}
dof_car_sel_tat_r_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.2
			farblurend = 1.4
		}
	]
}
dof_car_sel_tat_l_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.3
			farblurend = 1.4
		}
	]
}
dof_band_select_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.0
			farblurend = 13.0
		}
	]
}
gigroom_section01_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.7985
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.295
			farblurend = 3.6599998
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.08
			Color = [
				0.5
				0.5
				0.5
				0.5
			]
			uv = [
				8.0
				6.0
				0.0
				0.0
			]
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
gigroom_section02_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.4945
			nearblurbegin = 0.0
			nearblurend = 5.0540004
			farblurbegin = 3.48
			farblurend = 5.13
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.08
			Color = [
				0.5
				0.5
				0.5
				0.5
			]
			uv = [
				8.0
				6.0
				0.0
				0.0
			]
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
gigroom_section03_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.6703
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 2.015
			farblurend = 3.6599998
		}
		{
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 1
			aspectcorrection = 0
			inner_radius = 0.674
			Outer_Radius = 1.3188
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5128
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.08
			Color = [
				0.5
				0.5
				0.5
				0.5
			]
			uv = [
				8.0
				6.0
				0.0
				0.0
			]
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
gigroom_section04_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.5018
			nearblurbegin = 0.0
			nearblurend = 8.2059965
			farblurbegin = 3.115
			farblurend = 4.7599998
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.1
			Color = [
				0.5
				0.5
				0.5
				0.5
			]
			uv = [
				8.0
				6.0
				0.0
				0.0
			]
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
gigroom_section05_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.63740003
			nearblurbegin = 0.0
			nearblurend = 4.908
			farblurbegin = 2.93
			farblurend = 5.4900002
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.08
			Color = [
				0.5
				0.5
				0.5
				0.5
			]
			uv = [
				8.0
				6.0
				0.0
				0.0
			]
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_car_photo_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.5
			farblurend = 4.5
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			target = 0.25
			Brightness = 0.85
			Contrast = 0.9
			Hue = 1.0
			Saturation = 0.85
			Red_Mix = [
				1.0
				0.0
				0.0
				0.0
			]
			Green_Mix = [
				0.0
				1.0
				0.0
				0.0
			]
			Blue_Mix = [
				0.0
				0.0
				1.0
				0.0
			]
			on_p2 = 0
			target_p2 = 0.75
			brightness_p2 = 1.0
			contrast_p2 = 1.0
			hue_p2 = 1.0
			saturation_p2 = 1.0
			red_mix_p2 = [
				1.0
				0.0
				0.0
				0.0
			]
			green_mix_p2 = [
				0.0
				1.0
				0.0
				0.0
			]
			blue_mix_p2 = [
				0.0
				0.0
				1.0
				0.0
			]
		}
	]
}
credits_mindof_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.69229996
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 50.0
			farblurend = 100.0
		}
	]
}
dof_subway_audience_1_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.79489994
			nearblurbegin = 11.722
			nearblurend = 17.581999
			farblurbegin = 16.115
			farblurend = 56.78
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_subway_audience_2_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.78389996
			nearblurbegin = 5.128
			nearblurend = 17.581999
			farblurbegin = 12.455
			farblurend = 53.109997
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_subway_audience_3_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.79489994
			nearblurbegin = 10.184
			nearblurend = 13.7
			farblurbegin = 12.455
			farblurend = 48.35
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_orbit_1_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.9
			nearblurbegin = 2.8579998
			nearblurend = 15.238
			farblurbegin = 8.0599985
			farblurend = 27.110004
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_guitar_solo_1_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.84250003
			nearblurbegin = 0.294
			nearblurend = 0.66
			farblurbegin = 0.8
			farblurend = 1.1
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_guitar_solo_2_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.58599997
			farblurbegin = 0.8
			farblurend = 1.1
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_slight_near_1_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 2.564
			nearblurend = 5.0540004
			farblurbegin = 0.0
			farblurend = 25.640018
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_slight_near_2_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.8315
			nearblurbegin = 3.1499999
			nearblurend = 3.882
			farblurbegin = 0.0
			farblurend = 25.640018
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_slight_near_3_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.8
			nearblurend = 1.2
			farblurbegin = 2.9
			farblurend = 6.59
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_slight_near_4_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 3.956
			nearblurend = 4.25
			farblurbegin = 6.4100003
			farblurend = 11.719995
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_slight_near_5_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.98529994
			nearblurbegin = 2.564
			nearblurend = 2.6379998
			farblurbegin = 6.225
			farblurend = 35.16
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_slight_near_6_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 2.564
			nearblurend = 2.6379998
			farblurbegin = 5.68
			farblurend = 10.2599945
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_across_stage_1_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 7.326
			nearblurend = 9.743999
			farblurbegin = 10.6250105
			farblurend = 26.01
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_across_stage_2_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 6.886
			nearblurend = 7.8380003
			farblurbegin = 10.075
			farblurend = 26.01
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_venue_mid_1_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.64840007
			nearblurbegin = 11.868011
			nearblurend = 16.336
			farblurbegin = 11.719995
			farblurend = 44.32
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
dof_moment1_1_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.77659994
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.295
			farblurend = 13.1900015
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 0
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
bw_01_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.294118
				0.294118
				0.294118
				0.0
			]
			colormodulate = [
				0.21568601
				0.21568601
				0.21568601
				3.0
			]
			Saturation = 1.0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			target = 0.25
			Brightness = 1.0
			Contrast = 1.2528
			Hue = 1.0
			Saturation = 0.1612
			Red_Mix = [
				1.0
				0.0
				0.0
				0.0
			]
			Green_Mix = [
				0.0
				1.0
				0.0
				0.0
			]
			Blue_Mix = [
				0.0
				0.0
				1.0
				0.0
			]
			on_p2 = 0
			target_p2 = 0.75
			brightness_p2 = 1.0
			contrast_p2 = 1.0
			hue_p2 = 1.0
			saturation_p2 = 1.0
			red_mix_p2 = [
				1.0
				0.0
				0.0
				0.0
			]
			green_mix_p2 = [
				0.0
				1.0
				0.0
				0.0
			]
			blue_mix_p2 = [
				0.0
				0.0
				1.0
				0.0
			]
		}
		{
			Name = godray
			scefName = godray
			Type = godray
			On = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			Range = 1.0
			fadeout_begin = 90.0
			fadeout_end = 120.0
			skycolor = [
				0.0
				0.0
				0.5
				0.0
			]
			lightposition = [
				100.0
				100.0
				100.0
				1.0
			]
			cliplightposition = 1
			lightsource = sky
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.08
			Color = [
				0.5
				0.5
				0.5
				0.5
			]
			uv = [
				8.0
				6.0
				0.0
				0.0
			]
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
