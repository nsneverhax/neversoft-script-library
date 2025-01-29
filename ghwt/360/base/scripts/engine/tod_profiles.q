Default_TOD_Manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			MaterialFilter = 1
			subtract = [
				0.2
				0.2
				0.2
				1.0
			]
			colormodulate = [
				5.0
				5.0
				5.0
				15.0
			]
			Saturation = 1.0
			thickness = 40.0
			equation = eq2
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
				1.0
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
				-23.0
				5.2
				-36.0
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
DOF_Off_TOD_Manager = {
	screen_FX = [
		{
			Name = depth_of_field__simplified_
			scefName = depth_of_field__simplified_
			Type = dof3
			On = 1
			Strength = 0.0
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
			nearblurend = 0.0
			farblurbegin = 2.015
			farblurend = 3.6599998
		}
		{
			Name = Vignette
			scefName = Vignette
			Type = Vignette
			On = 1
			inner_radius = 0.674
			Outer_Radius = 1.3188
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
			nearblurend = 0.0
			farblurbegin = 1.5
			farblurend = 4.5
		}
		{
			Name = zoom_blur
			scefName = zoom_blur
			Type = blur
			On = 1
			amount = 0.75
			focus_center_inner = 0.5
			focus_center_outer = 0.5
			scale_inner = 0.5
			scale_outer = 0.5
			angle_inner = 0.0
			angle_outer = 0.0
			inner_color = [
				0.0
				0.0
				0.0
				0.0
			]
			outer_color = [
				0.0
				0.0
				0.0
				0.0
			]
		}
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
			nearblurend = 0.0
			farblurbegin = 50.0
			farblurend = 100.0
		}
	]
}
