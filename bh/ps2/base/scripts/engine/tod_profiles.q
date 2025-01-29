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
			Name = 0x3b6b455b
			scefName = 0x3b6b455b
			Type = DOF
			On = 1
			0xce7f13c7 = 0
			Strength = 1.0
			BackDist = 3.4
			0xfaeae6e3 = 3.4
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
ScreenFlash_tod_manager = {
	screen_FX = [
		{
			Name = brightness___saturation
			scefName = brightness___saturation
			Type = Bright_Sat
			On = 1
			target = 0.25
			Brightness = 0.85
			Contrast = 0.9
			Hue = 1.0
			Saturation = 0.0
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
			saturation_p2 = 0.0
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
0x299bc745 = {
	screen_FX = [
		{
			Name = 0x3b6b455b
			scefName = 0x3b6b455b
			Type = DOF
			On = 1
			0xce7f13c7 = 1
			Strength = 1.0
			0xce7f13c7 = 0
			BackDist = 2.0
			0xfaeae6e3 = 3.0
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
			Name = 0x3b6b455b
			scefName = 0x3b6b455b
			Type = DOF
			On = 1
			0xce7f13c7 = 0
			Strength = 1.0
			BackDist = 0.45000002
			0xfaeae6e3 = 0.45000002
		}
	]
}
0x0780edb9 = {
	screen_FX = [
		{
			Name = 0x3b6b455b
			scefName = 0x3b6b455b
			Type = DOF
			On = 1
			0xce7f13c7 = 0
			Strength = 1.0
			BackDist = 0.45000002
			0xfaeae6e3 = 0.45000002
		}
	]
}
dof_car_main_tod_manager = {
	screen_FX = [
		{
			Name = 0x3b6b455b
			scefName = 0x3b6b455b
			Type = DOF
			On = 1
			0xce7f13c7 = 0
			Strength = 1.0
			BackDist = 3.4
			0xfaeae6e3 = 3.4
		}
	]
}
0x9ac49d7e = {
	screen_FX = [
		{
			Name = 0x3b6b455b
			scefName = 0x3b6b455b
			Type = DOF
			On = 1
			0xce7f13c7 = 0
			0xec8ef82a = 1.0
			0x8ab611d5 = 0.65000004
			Strength = 1.0
			BackDist = 3.4
			0xfaeae6e3 = 3.4
		}
	]
}
dof_car_selchar_tod_manager = {
	screen_FX = [
		{
			Name = 0x3b6b455b
			scefName = 0x3b6b455b
			Type = DOF
			On = 1
			0xce7f13c7 = 0
			Strength = 1.0
			BackDist = 3.4
			0xfaeae6e3 = 3.4
		}
	]
}
dof_car_selgender_tod_manager = {
	screen_FX = [
		{
			Name = 0x3b6b455b
			scefName = 0x3b6b455b
			Type = DOF
			On = 1
			0xce7f13c7 = 0
			Strength = 1.0
			BackDist = 3.4
			0xfaeae6e3 = 3.4
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
			Name = 0x3b6b455b
			scefName = 0x3b6b455b
			Type = DOF
			On = 1
			0xce7f13c7 = 0
			Strength = 1.0
			BackDist = 3.4
			0xfaeae6e3 = 3.4
		}
	]
}
0x441307a6 = {
	screen_FX = [
		{
			Name = 0x3b6b455b
			scefName = 0x3b6b455b
			Type = DOF
			On = 1
			0xce7f13c7 = 0
			Strength = 1.0
			BackDist = 2.7
			0xfaeae6e3 = 1.4
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
			farblurbegin = 1.3
			farblurend = 1.6
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
			farblurend = 1.6
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
gigroom_section01_tod_manager = 0x24d8810d
gigroom_section02_tod_manager = 0x24d8810d
gigroom_section03_tod_manager = 0x24d8810d
gigroom_section04_tod_manager = 0x24d8810d
gigroom_section05_tod_manager = 0x24d8810d
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
