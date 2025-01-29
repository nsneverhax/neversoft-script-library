Default_TOD_Manager = {
	screen_FX = [
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
				1.0
			]
			colormodulate = [
				0.890196
				0.890196
				0.890196
				1.0
			]
			Saturation = 0.8132
			thickness = 15.614799
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.0
			Contrast = 1.0
			Hue = 1.0
			Saturation = 0.6
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 0
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.0
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
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
dof_noblur_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.0
			nearblurend = 0.0
			farblurbegin = 50.0
			farblurend = 100.0
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
dof_carblur_tod_manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.55
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.5
			farblurend = 7.5
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
			Strength = 0.9
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 0.75
			farblurend = 1.125
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
			Strength = 0.7
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.25
			farblurend = 7.5
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
			Strength = 0.7
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.25
			farblurend = 5.0
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
			Strength = 0.75
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 0.91499996
			farblurend = 1.3499999
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
			Strength = 0.625
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 2.5
			farblurend = 4.0
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
			Strength = 0.85
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.5
			farblurend = 2.5
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
			Strength = 0.85
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.5
			farblurend = 2.5
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
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 0.85
			Contrast = 0.9
			Hue = 1.0
			Saturation = 0.85
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0
		}
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
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.97999996
			Color = [
				0.1
				0.1
				0.1
				0.1
			]
			uv = [
				8.0
				6.0
				0.0
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
remove_metallicafx_tod_manager = {
	screen_FX = [
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
			thickness = 17.9119
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.0
			Contrast = 1.0
			Hue = 1.0
			Saturation = 1.0
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0
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
			Intensity = 0.09
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
new_default_tod_manager = {
	screen_FX = [
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.0
			Contrast = 1.0
			Hue = 1.0
			Saturation = 1.0
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0
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
			Intensity = 0.09
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
metal_bw_contrast_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				1.0
			]
			colormodulate = [
				0.741176
				0.741176
				0.741176
				1.0
			]
			Saturation = 0.0732
			thickness = 20.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.4104999
			Contrast = 1.1208
			Hue = 1.0
			Saturation = 0.014599999
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.01
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
			Intensity = 0.1
			Color = [
				0.39607802
				0.39607802
				0.39607802
				1.0
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
metal_fisheye_tod_manager = {
	screen_FX = [
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
			thickness = 6.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.0
			Contrast = 1.1647999
			Hue = 1.0
			Saturation = 0.6228
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0
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
			Name = fisheye
			scefName = fisheye
			Type = fisheye
			On = 1
			warp_x = 1.0
			warp_y = 1.0
			aperture_start = 0.5
			aperture_end = 1.0
			aperture_x = 1.0
			aperture_y = 1.0
			scale_x = 1.0
			scale_y = 1.0
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.13549998
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
	]
}
metal_vignette_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.317647
				0.317647
				0.317647
				1.0
			]
			colormodulate = [
				0.91372603
				0.91372603
				0.91372603
				1.0
			]
			Saturation = 1.5824
			thickness = 13.8763
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.0
			Contrast = 0.8716
			Hue = 1.0
			Saturation = 0.30760002
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.2820001
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 1
			aspectcorrection = 0
			inner_radius = 0.5714
			Outer_Radius = 1.0547999
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.718
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.13549998
			Color = [
				0.47451
				0.47451
				0.47451
				1.0
			]
			uv = [
				7.0
				5.0
				0.0
				1.0
			]
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
gh4_oldfx_tod_manager = {
	screen_FX = [
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
			thickness = 6.0
			equation = eq0
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
default_withcontrast_tod_manager = {
	screen_FX = [
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
			thickness = 10.6045
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.0
			Contrast = 1.2
			Hue = 1.0
			Saturation = 0.7
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0
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
			Intensity = 0.09
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
metal_desatbloom_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.20784299
				0.20784299
				0.20784299
				1.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			Saturation = 2.0
			thickness = 19.164
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.0
			Contrast = 1.1064
			Hue = 1.0
			Saturation = 0.4616
			red_mix_r = 1.1208
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = -0.0072000003
			blue_mix_r = 0.022
			blue_mix_g = 0.0
			blue_mix_b = 0.98919994
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
			Intensity = 0.2125
			Color = [
				0.5
				0.5
				0.5
				0.5
			]
			uv = [
				7.0
				5.0
				0.0
				1.0
			]
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
metal_desattint_blue_tod_manager = {
	screen_FX = [
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
				0.921569
				0.921569
				0.921569
				1.0
			]
			Saturation = 1.0
			thickness = 6.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.0
			Contrast = 1.0
			Hue = 1.0
			Saturation = 0.0512
			red_mix_r = 1.0916001
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.124400005
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.2672
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
			Name = godray
			scefName = godray
			Type = godray
			On = 1
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
			Intensity = 0.16479999
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
metal_bloomsat_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.0
				0.0
				0.0
				1.0
			]
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			Saturation = 2.0
			thickness = 20.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.0
			Contrast = 1.0
			Hue = 1.0
			Saturation = 0.7472
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 0
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.0
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.0696
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
metal_bw_grainy_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				0.65490204
				0.65490204
				0.65490204
				1.0
			]
			Saturation = 1.0
			thickness = 20.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.3735
			Contrast = 0.94519997
			Hue = 1.0
			Saturation = 0.0
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0804
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0475999
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
			Intensity = 0.2015
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
metal_bluetint_tod_manager = {
	screen_FX = [
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
				0.32941204
				0.32941204
				0.32941204
				1.0
			]
			Saturation = 1.0
			thickness = 6.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.0
			Contrast = 1.0623999
			Hue = 1.0
			Saturation = 0.36640003
			red_mix_r = 0.93039995
			red_mix_g = 0.0
			red_mix_b = 0.0512
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.036799997
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.502
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 0
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.0
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.109900005
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
metal_inkblotch_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.152941
				0.152941
				0.152941
				1.0
			]
			colormodulate = [
				0.819608
				0.819608
				0.819608
				1.0
			]
			Saturation = 1.7142
			thickness = 14.5717
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.0
			Contrast = 1.0768001
			Hue = 1.0
			Saturation = 0.5348
			red_mix_r = 1.3551999
			red_mix_g = 0.09520001
			red_mix_b = 0.0512
			green_mix_r = 0.066
			green_mix_g = 0.9596
			green_mix_b = 0.0
			blue_mix_r = 0.09520001
			blue_mix_g = 0.0
			blue_mix_b = 0.9744
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 0
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.0
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.21980001
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
			Name = ink_blotch
			scefName = ink_blotch
			Type = inkblotch
			On = 1
			scratchcolor = [
				0.015686
				0.015686
				0.015686
				1.0
			]
			blotchcolor = [
				0.015686
				0.015686
				0.015686
				0.092
			]
			intervala = 0.06
			intervalb = 0.09
			xtiling = 1.941
			ytiling = 1.172
			rotationa = 20.0
			rotationb = 60.0
			texture = 'unknown'
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
metal_turqpink_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.23137301
				0.23137301
				0.23137301
				1.0
			]
			colormodulate = [
				0.35294104
				0.35294104
				0.35294104
				1.0
			]
			Saturation = 0.8864
			thickness = 6.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 0.89750004
			Contrast = 1.1356
			Hue = 1.0
			Saturation = 0.32960004
			red_mix_r = 1.5896
			red_mix_g = 0.2416
			red_mix_b = 0.124400005
			green_mix_r = 0.0072000003
			green_mix_g = 1.2088001
			green_mix_b = 0.35880002
			blue_mix_r = -0.2272
			blue_mix_g = 0.18320002
			blue_mix_b = 1.6632
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 0
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.0
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.17220001
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
			Name = ink_blotch
			scefName = ink_blotch
			Type = inkblotch
			On = 1
			scratchcolor = [
				0.015686
				0.015686
				0.015686
				1.0
			]
			blotchcolor = [
				0.05098
				0.05098
				0.05098
				0.07913701
			]
			intervala = 0.036599997
			intervalb = 0.0732
			xtiling = 1.612
			ytiling = 1.0
			rotationa = 20.0
			rotationb = 60.0
			texture = 'unknown'
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
metal_forest_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				0.28627503
				0.28627503
				0.28627503
				1.0
			]
			Saturation = 1.2673999
			thickness = 6.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 0.91599995
			Contrast = 1.1064
			Hue = 1.0
			Saturation = 0.21980001
			red_mix_r = 1.0328
			red_mix_g = 0.09520001
			red_mix_b = 0.0
			green_mix_r = 0.0072000003
			green_mix_g = 1.3992
			green_mix_b = 0.0
			blue_mix_r = -0.022
			blue_mix_g = 0.036799997
			blue_mix_b = 1.0036
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 0
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.0
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.1319
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
			Name = ink_blotch
			scefName = ink_blotch
			Type = inkblotch
			On = 1
			scratchcolor = [
				0.015686
				0.015686
				0.015686
				1.0
			]
			blotchcolor = [
				0.04
				0.04
				0.03
				0.086330995
			]
			intervala = 0.05
			intervalb = 0.06
			xtiling = 1.245
			ytiling = 0.806
			rotationa = 20.0
			rotationb = 60.0
			texture = 'unknown'
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
metal_yellow_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				0.611765
				0.611765
				0.611765
				1.0
			]
			Saturation = 1.2234
			thickness = 6.776
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.227
			Contrast = 1.0328
			Hue = 1.0
			Saturation = 0.21240002
			red_mix_r = 1.0
			red_mix_g = -0.066
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 0.4616
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 0
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.0
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.13549998
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
metal_sepia_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				0.5960779
				0.5960779
				0.5960779
				3.0
			]
			Saturation = 0.24180001
			thickness = 5.1762
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.3735
			Contrast = 0.94519997
			Hue = 1.0
			Saturation = 0.088
			red_mix_r = 1.0036
			red_mix_g = 0.0072000003
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 0.784
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 0.696
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 1
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.1868001
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5276
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.1575
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
metal_hotblue_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				0.576471
				0.576471
				0.576471
				1.0
			]
			Saturation = 1.0
			thickness = 6.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.1539999
			Contrast = 1.0184
			Hue = 1.0
			Saturation = 0.2784
			red_mix_r = 0.6372
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = -0.2712
			green_mix_g = 1.0916001
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.6043999
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
			Name = godray
			scefName = godray
			Type = godray
			On = 1
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 0
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.0
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.13549998
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
metal_careerintro_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.27451003
				0.27451003
				0.27451003
				1.0
			]
			colormodulate = [
				0.71764696
				0.71764696
				0.71764696
				1.0
			]
			Saturation = 1.3845999
			thickness = 6.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 0.93399996
			Contrast = 1.0
			Hue = 1.0
			Saturation = 0.48360002
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0
		}
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.52750003
			nearblurbegin = 0.0
			nearblurend = 0.806
			farblurbegin = 24.724998
			farblurend = 56.039997
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 1
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.0
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.38080004
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.1612
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
			Name = ink_blotch
			scefName = ink_blotch
			Type = inkblotch
			On = 1
			scratchcolor = [
				0.007843
				0.007843
				0.007843
				1.0
			]
			blotchcolor = [
				0.027451
				0.027451
				0.027451
				0.043165
			]
			intervala = 0.009
			intervalb = 0.0139999995
			xtiling = 1.8499999
			ytiling = 1.25
			rotationa = 20.0
			rotationb = 60.0
			texture = 'unknown'
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
metal_careerintro_02_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.27451003
				0.27451003
				0.27451003
				1.0
			]
			colormodulate = [
				0.71764696
				0.71764696
				0.71764696
				1.0
			]
			Saturation = 1.3845999
			thickness = 6.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 0.93399996
			Contrast = 1.0
			Hue = 1.0
			Saturation = 0.48360002
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0
		}
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 1
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.0
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.38080004
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.1612
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
			Name = ink_blotch
			scefName = ink_blotch
			Type = inkblotch
			On = 1
			scratchcolor = [
				0.007843
				0.007843
				0.007843
				1.0
			]
			blotchcolor = [
				0.027451
				0.027451
				0.027451
				0.043165
			]
			intervala = 0.009
			intervalb = 0.0139999995
			xtiling = 1.8499999
			ytiling = 1.25
			rotationa = 20.0
			rotationb = 60.0
			texture = 'unknown'
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
metal_careerintro_cut1_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.27451003
				0.27451003
				0.27451003
				1.0
			]
			colormodulate = [
				0.71764696
				0.71764696
				0.71764696
				1.0
			]
			Saturation = 1.3845999
			thickness = 6.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.0
			Contrast = 1.0
			Hue = 1.0
			Saturation = 0.48360002
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0
		}
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 1.978
			farblurbegin = 16.300001
			farblurend = 63.0
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 1
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.0
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.38080004
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.25
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
			Name = ink_blotch
			scefName = ink_blotch
			Type = inkblotch
			On = 1
			scratchcolor = [
				0.007843
				0.007843
				0.007843
				1.0
			]
			blotchcolor = [
				0.027451
				0.027451
				0.027451
				0.043165
			]
			intervala = 0.009
			intervalb = 0.0139999995
			xtiling = 1.8499999
			ytiling = 1.25
			rotationa = 20.0
			rotationb = 60.0
			texture = 'unknown'
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
metal_desatred_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				0.568627
				0.568627
				0.568627
				3.000001
			]
			Saturation = 0.0
			thickness = 20.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.3554999
			Contrast = 1.0036
			Hue = 1.0
			Saturation = 0.036599997
			red_mix_r = 1.0184
			red_mix_g = -0.18320002
			red_mix_b = -0.18320002
			green_mix_r = -0.09520001
			green_mix_g = 0.90119994
			green_mix_b = -0.124400005
			blue_mix_r = 0.036799997
			blue_mix_g = -0.0804
			blue_mix_b = 0.90119994
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 0
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.0
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.1575
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
			Name = ink_blotch
			scefName = ink_blotch
			Type = inkblotch
			On = 1
			scratchcolor = [
				0.015
				0.015
				0.015
				1.0
			]
			blotchcolor = [
				0.04
				0.04
				0.03
				0.1
			]
			intervala = 0.05
			intervalb = 0.06
			xtiling = 1.57
			ytiling = 1.0
			rotationa = 20.0
			rotationb = 60.0
			texture = 'unknown'
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
metal_green_tod_manager = {
	screen_FX = [
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
			thickness = 6.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.4
			Contrast = 1.0
			Hue = 1.0
			Saturation = 0.6154
			red_mix_r = 0.9
			red_mix_g = 0.0512
			red_mix_b = -0.0512
			green_mix_r = -0.15
			green_mix_g = 0.8864
			green_mix_b = 0.0512
			blue_mix_r = -0.15
			blue_mix_g = 0.5788
			blue_mix_b = 0.98919994
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 0
			aspectcorrection = 0
			inner_radius = 0.5
			Outer_Radius = 1.0
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.1795
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
			Name = ink_blotch
			scefName = ink_blotch
			Type = inkblotch
			On = 1
			scratchcolor = [
				0.015
				0.015
				0.015
				1.0
			]
			blotchcolor = [
				0.04
				0.04
				0.03
				0.064748
			]
			intervala = 0.05
			intervalb = 0.06
			xtiling = 1.758
			ytiling = 1.0
			rotationa = 20.0
			rotationb = 60.0
			texture = 'unknown'
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
metal_bw_inkblotch_tod_manager = {
	screen_FX = [
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			fullscreen = 1
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				0.0
			]
			colormodulate = [
				0.46666703
				0.46666703
				0.46666703
				3.0
			]
			Saturation = 1.4945999
			thickness = 6.0
			equation = eq0
		}
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			Brightness = 1.1539999
			Contrast = 1.0475999
			Hue = 1.0
			Saturation = 0.09520001
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0
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
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 1
			aspectcorrection = 0
			inner_radius = 0.54940003
			Outer_Radius = 1.1575999
			Color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.2636
		}
		{
			Name = noise_lite
			scefName = noise_lite
			Type = noise2
			On = 1
			Intensity = 0.1978
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
			Name = ink_blotch
			scefName = ink_blotch
			Type = inkblotch
			On = 1
			scratchcolor = [
				0.015686
				0.015686
				0.015686
				1.0
			]
			blotchcolor = [
				0.015686
				0.015686
				0.011765
				0.115108006
			]
			intervala = 0.044
			intervalb = 0.09520001
			xtiling = 1.4649999
			ytiling = 0.842
			rotationa = 0.0
			rotationb = 0.0
			texture = 'tex\\SFX\\Streaks.dds'
		}
		{
			Name = uberscreenfx
			scefName = uberscreenfx
			Type = uberscreenfx
		}
	]
}
