default_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 0
			materialfilter = 1
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
			saturation = 2.0
			thickness = 9.5595
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.0
			contrast = 1.0
			hue = 1.0
			saturation = 0.6
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 0
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
dof_off_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
	]
}
dof_closeup01_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 8.0
			farblurend = 12.0
		}
	]
}
dof_closeup02_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.0
			farblurend = 8.0
		}
	]
}
dof_closeup03_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 1.026
			farblurbegin = 2.3799999
			farblurend = 1.1
		}
	]
}
dof_closeup04_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 7.0
			farblurbegin = 7.0
			farblurend = 8.0
		}
	]
}
dof_medium01_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.5
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 20.0
			farblurend = 30.0
		}
	]
}
dof_medium02_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.75
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 15.0
			farblurend = 30.0
		}
	]
}
dof_long01_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.8
			nearblurbegin = 0.0
			nearblurend = 20.0
			farblurbegin = 20.0
			farblurend = 50.0
		}
	]
}
dof_stage01_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.8
			nearblurbegin = 0.0
			nearblurend = 5.0
			farblurbegin = 5.0
			farblurend = 20.0
		}
	]
}
dof_uiblur_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.9
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 0.0
			farblurend = 4.0
		}
	]
}
dof_car_accl_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 0.6
			farblurend = 0.81
		}
	]
}
dof_car_main_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.5
			farblurend = 4.5
		}
	]
}
dof_car_selchar_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 2.5
			farblurend = 54.95
		}
	]
}
dof_car_selgender_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.0
			farblurend = 5.4900002
		}
	]
}
dof_car_selecttorso_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.9
			farblurend = 10.0
		}
	]
}
dof_car_sel_instr_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.75
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 0.0
			farblurend = 14.29
		}
	]
}
dof_car_sel_glasses_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 2.0
			farblurend = 2.2
		}
	]
}
dof_car_sel_micstand_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.85
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.0
			farblurend = 5.0
		}
	]
}
dof_car_sel_microphone_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.8791
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 0.55
			farblurend = 0.8
		}
	]
}
dof_car_sel_guitar_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.82
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.7
			farblurend = 3.0
		}
	]
}
dof_car_sel_guitar_hardware_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.9
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.0
			farblurend = 1.1
		}
	]
}
dof_car_sel_drums_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.7
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.0
			farblurend = 7.0
		}
	]
}
dof_car_sel_drumsticks_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.0
			farblurend = 3.0
		}
	]
}
dof_car_sel_tat_r_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.3
			farblurend = 1.6
		}
	]
}
dof_car_sel_tat_l_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.3
			farblurend = 1.6
		}
	]
}
dof_band_select_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.86450005
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 4.3950005
			farblurend = 22.710001
		}
	]
}
gigroom_section01_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.7985
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.295
			farblurend = 3.6599998
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.08
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
gigroom_section02_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.4945
			nearblurbegin = 0.0
			nearblurend = 5.0540004
			farblurbegin = 3.48
			farblurend = 5.13
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.08
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
gigroom_section03_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.6703
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 2.015
			farblurend = 3.6599998
		}
		{
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.674
			outer_radius = 1.3188
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5128
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.08
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
gigroom_section04_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.5018
			nearblurbegin = 0.0
			nearblurend = 8.2059965
			farblurbegin = 3.115
			farblurend = 4.7599998
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
gigroom_section05_tod_manager = {
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.63740003
			nearblurbegin = 0.0
			nearblurend = 4.908
			farblurbegin = 2.93
			farblurend = 5.4900002
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.08
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
dof_car_photo_tod_manager = {
	screen_fx = [
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.0
			contrast = 0.9
			hue = 1.0
			saturation = 0.85
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 1.5
			farblurend = 4.5
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.98999995
			color = [
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
	screen_fx = [
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.69229996
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 50.0
			farblurend = 100.0
		}
	]
}
remove_metallicafx_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 0
			materialfilter = 1
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
			saturation = 1.0
			thickness = 17.9119
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.0
			contrast = 1.0
			hue = 1.0
			saturation = 1.0
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.09
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
new_default_tod_manager = {
	screen_fx = [
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.0
			contrast = 1.0
			hue = 1.0
			saturation = 1.0
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.09
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_bw_contrast_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 0
			materialfilter = 1
			subtract = [
				0.2
				0.2
				0.2
				1.0
			]
			colormodulate = [
				0.65490204
				0.65490204
				0.65490204
				1.0
			]
			saturation = 0.0
			thickness = 20.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.3735
			contrast = 0.90119994
			hue = 1.0
			saturation = 0.0
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0512
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.1
		}
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1319
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_vignette_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
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
			saturation = 1.5824
			thickness = 13.8763
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.824
			contrast = 0.8716
			hue = 1.0
			saturation = 0.35900003
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = -0.2856
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.2820001
		}
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.84980005
			outer_radius = 1.172
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5276
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
gh4_oldfx_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 0
			materialfilter = 1
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
			saturation = 1.0
			thickness = 6.0
			equation = eq0
		}
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.08
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_desatbloom_tod_manager = {
	screen_fx = [
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.0
			contrast = 1.1064
			hue = 1.0
			saturation = 0.4616
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.58239996
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.2125
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_bloomsat_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 0
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
			saturation = 1.5
			thickness = 18.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.8
			contrast = 0.94519997
			hue = 1.0
			saturation = 0.71059996
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 0
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.0696
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_bw_grainy_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
			subtract = [
				0.11764701
				0.11764701
				0.11764701
				1.0
			]
			colormodulate = [
				0.28627503
				0.28627503
				0.28627503
				1.0
			]
			saturation = 0.0732
			thickness = 15.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.4
			contrast = 0.8132
			hue = 1.0
			saturation = 0.0
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = -0.2856
			green_mix_r = 0.09520001
			green_mix_g = 1.0
			green_mix_b = 0.0804
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0475999
		}
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.24920002
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.2
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_bluetint_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 0
			materialfilter = 1
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
			saturation = 1.0
			thickness = 6.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.9705
			contrast = 0.9596
			hue = 1.0
			saturation = 0.1318
			red_mix_r = 0.93039995
			red_mix_g = 0.0
			red_mix_b = 0.2416
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.036799997
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.502
		}
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 0
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.109900005
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_inkblotch_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 0
			materialfilter = 1
			subtract = [
				0.223529
				0.223529
				0.223529
				1.0
			]
			colormodulate = [
				0.73333293
				0.73333293
				0.73333293
				1.0
			]
			saturation = 1.6043999
			thickness = 10.6748
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.9525
			contrast = 1.1064
			hue = 1.0
			saturation = 0.5348
			red_mix_r = 1.2672
			red_mix_g = 0.09520001
			red_mix_b = 0.066
			green_mix_r = 0.18320002
			green_mix_g = 0.9596
			green_mix_b = 0.0
			blue_mix_r = 0.09520001
			blue_mix_g = 0.0
			blue_mix_b = 0.9744
		}
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 0
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.19049999
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
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
				0.064748
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_turqpink_tod_manager = {
	screen_fx = [
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.89750004
			contrast = 0.98919994
			hue = 1.0
			saturation = 0.35900003
			red_mix_r = 2.0
			red_mix_g = 0.21240002
			red_mix_b = 0.6668
			green_mix_r = 0.124400005
			green_mix_g = 1.2088001
			green_mix_b = 0.35880002
			blue_mix_r = -0.2272
			blue_mix_g = 0.18320002
			blue_mix_b = 1.6632
		}
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 0
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.17220001
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
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
				0.064748
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_forest_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
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
			saturation = 1.2673999
			thickness = 6.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.806
			contrast = 1.0768001
			hue = 1.0
			saturation = 0.5274
			red_mix_r = 1.0328
			red_mix_g = 0.09520001
			red_mix_b = 0.0512
			green_mix_r = -0.1684
			green_mix_g = 1.194
			green_mix_b = 0.0
			blue_mix_r = -0.022
			blue_mix_g = 0.036799997
			blue_mix_b = 1.0036
		}
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.18039201
				0.137255
				0.0
			]
			alpha = 0.5
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
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
				0.05036
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_yellow_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
			subtract = [
				0.282353
				0.282353
				0.282353
				0.0
			]
			colormodulate = [
				0.72549
				0.72549
				0.72549
				1.0
			]
			saturation = 0.2784
			thickness = 20.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.6225
			contrast = 1.0328
			hue = 0.9158
			saturation = 0.2784
			red_mix_r = 1.5752001
			red_mix_g = 0.7108
			red_mix_b = -0.4176
			green_mix_r = 0.7108
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 0.74
		}
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1612
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_sepia_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 0
			materialfilter = 1
			subtract = [
				0.32941204
				0.32941204
				0.32941204
				0.0
			]
			colormodulate = [
				0.43921602
				0.43921602
				0.43921602
				3.0
			]
			saturation = 0.15380001
			thickness = 5.1762
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.3735
			contrast = 0.94519997
			hue = 1.0
			saturation = 0.2858
			red_mix_r = 1.0623999
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.1868001
			color = [
				0.4
				0.16078399
				0.0
				0.0
			]
			alpha = 0.176
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1319
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_hotblue_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
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
			saturation = 1.2673999
			thickness = 6.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.806
			contrast = 1.0768001
			hue = 1.0
			saturation = 0.5274
			red_mix_r = 1.0328
			red_mix_g = 0.09520001
			red_mix_b = 0.0512
			green_mix_r = -0.1684
			green_mix_g = 1.194
			green_mix_b = 0.0
			blue_mix_r = -0.022
			blue_mix_g = 0.036799997
			blue_mix_b = 1.0036
		}
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.18039201
				0.137255
				0.0
			]
			alpha = 0.5
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
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
				0.05036
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_careerintro_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
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
			saturation = 1.3845999
			thickness = 6.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.93399996
			contrast = 1.0
			hue = 1.0
			saturation = 0.48360002
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.52750003
			nearblurbegin = 0.0
			nearblurend = 0.806
			farblurbegin = 24.724998
			farblurend = 56.039997
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.38080004
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1612
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
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
				0.03
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_careerintro_02_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
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
			saturation = 1.3845999
			thickness = 6.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.93399996
			contrast = 1.0
			hue = 1.0
			saturation = 0.48360002
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.38080004
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1612
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
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
				0.03
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_careerintro_cut1_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
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
			saturation = 1.3845999
			thickness = 6.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.0
			contrast = 1.0
			hue = 1.0
			saturation = 0.48360002
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 1.978
			farblurbegin = 16.300001
			farblurend = 63.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.38080004
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1758
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
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
				0.03
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_desatred_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
			subtract = [
				0.282353
				0.282353
				0.282353
				0.0
			]
			colormodulate = [
				0.72549
				0.72549
				0.72549
				1.0
			]
			saturation = 0.2784
			thickness = 20.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.7875
			contrast = 1.0328
			hue = 0.9158
			saturation = 0.2784
			red_mix_r = 1.5752001
			red_mix_g = 0.0804
			red_mix_b = -0.32960004
			green_mix_r = 0.34440002
			green_mix_g = 0.90119994
			green_mix_b = -0.124400005
			blue_mix_r = 0.036799997
			blue_mix_g = -0.0804
			blue_mix_b = 0.90119994
		}
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1612
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_green_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 0
			materialfilter = 1
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
			saturation = 1.0
			thickness = 6.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.0
			contrast = 1.0328
			hue = 1.0
			saturation = 0.5
			red_mix_r = 0.9
			red_mix_g = 0.0512
			red_mix_b = -0.0512
			green_mix_r = -0.15
			green_mix_g = 0.8864
			green_mix_b = 0.0512
			blue_mix_r = -0.15
			blue_mix_g = 0.564
			blue_mix_b = 0.98919994
		}
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 0
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.17220001
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
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
				0.0071940003
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_bw_inkblotch_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
			subtract = [
				0.38039201
				0.38039201
				0.38039201
				0.0
			]
			colormodulate = [
				0.360784
				0.360784
				0.360784
				3.000001
			]
			saturation = 1.4798
			thickness = 6.985
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.15
			contrast = 1.0768001
			hue = 1.0
			saturation = 0.3
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.54940003
			outer_radius = 1.1575999
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.2636
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1978
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
			scratchcolor = [
				0.011765
				0.011765
				0.011765
				1.0
			]
			blotchcolor = [
				0.015686
				0.015686
				0.011765
				0.07913701
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_noisydefault_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
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
			saturation = 1.3845999
			thickness = 6.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.0
			contrast = 1.0
			hue = 1.0
			saturation = 0.48360002
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 1.978
			farblurbegin = 16.300001
			farblurend = 63.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.2
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.14
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_inkblotch3_tod_manager = {
	screen_fx = [
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.91599995
			contrast = 1.0768001
			hue = 1.0
			saturation = 0.0
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = white_noise
			scefname = white_noise
			type = noise
			on = 1
			intensity = 1.0
			color = [
				0.5
				0.5
				0.5
				0.5
			]
			fogging = 1
			scale = 0.63
			mode = add
			jitterrate = 0.6
			jitteramount = 0.0
			maskintensity = 0.0
			maskscale = 1.0
			maskjitterrate = 0.0
			maskuvjitterrate = 0.0
		}
		{
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
			scratchcolor = [
				1.0
				1.0
				1.0
				1.0
			]
			blotchcolor = [
				0.007843
				0.007843
				0.0
				0.1
			]
			intervala = 0.0
			intervalb = 0.0
			xtiling = 0.0
			ytiling = 2.3809998
			rotationa = 357.33588
			rotationb = 251.85596
			texture = 'unknown'
		}
		{
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_satredstreaks_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
			subtract = [
				0.223529
				0.223529
				0.223529
				1.0
			]
			colormodulate = [
				0.73333293
				0.73333293
				0.73333293
				1.0
			]
			saturation = 1.3772
			thickness = 10.6748
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.9525
			contrast = 1.1064
			hue = 1.0
			saturation = 0.5348
			red_mix_r = 1.238
			red_mix_g = 0.09520001
			red_mix_b = 0.022
			green_mix_r = 0.066
			green_mix_g = 0.9596
			green_mix_b = 0.0
			blue_mix_r = 0.09520001
			blue_mix_g = 0.0
			blue_mix_b = 0.9744
		}
		{
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 0
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.19409999
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
			scratchcolor = [
				0.007843
				0.007843
				0.007843
				1.0
			]
			blotchcolor = [
				0.078431
				0.078431
				0.078431
				0.086330995
			]
			intervala = 0.06
			intervalb = 0.09
			xtiling = 2.0509999
			ytiling = 0.879
			rotationa = 0.0
			rotationb = 0.0
			texture = 'tex\\SFX\\Streaks.dds'
		}
		{
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_turqpinkstreaks_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
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
			saturation = 0.8864
			thickness = 6.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.89750004
			contrast = 1.1356
			hue = 1.0
			saturation = 0.32960004
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 0
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.17220001
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
			scratchcolor = [
				0.015686
				0.015686
				0.015686
				1.0
			]
			blotchcolor = [
				0.066667005
				0.066667005
				0.066667005
				0.07913701
			]
			intervala = 0.036599997
			intervalb = 0.0732
			xtiling = 1.612
			ytiling = 1.0
			rotationa = 0.0
			rotationb = 0.0
			texture = 'tex\\SFX\\Streaks.dds'
		}
		{
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_bw_splots_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
			subtract = [
				0.24313702
				0.24313702
				0.24313702
				0.0
			]
			colormodulate = [
				0.447059
				0.447059
				0.447059
				3.0
			]
			saturation = 1.099
			thickness = 6.0806
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.0
			contrast = 1.0768001
			hue = 1.0
			saturation = 0.044
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 0
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.0
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.5
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1758
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
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
				0.057554003
			]
			intervala = 0.05
			intervalb = 0.06
			xtiling = 1.8319999
			ytiling = 1.172
			rotationa = 20.0
			rotationb = 60.0
			texture = 'unknown'
		}
		{
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_desatsplots_01_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
			subtract = [
				0.38039201
				0.38039201
				0.38039201
				0.0
			]
			colormodulate = [
				0.360784
				0.360784
				0.360784
				3.000001
			]
			saturation = 0.32960004
			thickness = 6.985
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.15
			contrast = 1.1064
			hue = 1.0
			saturation = 0.3
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.54940003
			outer_radius = 1.1575999
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.2636
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.1978
			color = [
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
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
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
				0.064748
			]
			intervala = 0.044
			intervalb = 0.09520001
			xtiling = 2.0879998
			ytiling = 1.172
			rotationa = 0.0
			rotationb = 0.0
			texture = 'tex\\SFX\\InkBlotch.dds'
		}
		{
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_contrastyvignette_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
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
			saturation = 1.5824
			thickness = 13.8763
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.15
			contrast = 1.15
			hue = 1.0
			saturation = 0.27
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.7546
			outer_radius = 1.1428
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.55
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 1
			intensity = 0.14649999
			color = [
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
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_bw_grungy_tod_manager = {
	screen_fx = [
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.0074999
			contrast = -0.7984
			hue = 1.0
			saturation = 0.0
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 1
			aspectcorrection = 0
			inner_radius = 0.0
			outer_radius = 0.0732
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.92319995
		}
		{
			name = white_noise
			scefname = white_noise
			type = noise
			on = 1
			intensity = 1.0
			color = [
				0.5
				0.5
				0.5
				0.5
			]
			fogging = 1
			scale = 1.0
			mode = add
			jitterrate = 1.0
			jitteramount = 0.0
			maskintensity = 0.0
			maskscale = 1.0
			maskjitterrate = 0.0
			maskuvjitterrate = 0.0
		}
		{
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_bw_grainy2_tod_manager = {
	screen_fx = [
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.91599995
			contrast = 1.0768001
			hue = 1.0
			saturation = 0.1172
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 0
			aspectcorrection = 0
			inner_radius = 0.0
			outer_radius = 0.8936
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.77639997
		}
		{
			name = white_noise
			scefname = white_noise
			type = noise
			on = 1
			intensity = 1.0
			color = [
				0.5
				0.5
				0.5
				0.5
			]
			fogging = 1
			scale = 0.63
			mode = add
			jitterrate = 0.0
			jitteramount = 0.0
			maskintensity = 0.0
			maskscale = 1.0
			maskjitterrate = 0.0
			maskuvjitterrate = 0.0
		}
		{
			name = noise_lite
			scefname = noise_lite
			type = noise2
			on = 0
			intensity = 0.0
			color = [
				1.0
				1.0
				1.0
				0.5
			]
			uv = [
				0.97254896
				0.97254896
				0.97254896
				0.0
			]
		}
		{
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
			scratchcolor = [
				0.33333302
				0.33333302
				0.33333302
				1.0
			]
			blotchcolor = [
				0.007843
				0.007843
				0.0
				0.1
			]
			intervala = 0.0
			intervalb = 0.088
			xtiling = 0.0
			ytiling = 10.0
			rotationa = 360.0
			rotationb = 360.0
			texture = 'unknown'
		}
		{
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
metal_bw_streaks_tod_manager = {
	screen_fx = [
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.91599995
			contrast = 1.0768001
			hue = 1.0
			saturation = 0.337
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
			name = depth_of_field__simplified_
			scefname = depth_of_field__simplified_
			type = dof3
			on = 1
			strength = 0.0
			nearblurbegin = 0.0
			nearblurend = 2.0
			farblurbegin = 10.0
			farblurend = 20.0
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 0
			colormodulate = [
				1.0
				1.0
				1.0
				1.0
			]
			depthmodulate = 0.0
			steps = 100.0
			range = 1.0
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
			name = white_noise
			scefname = white_noise
			type = noise
			on = 1
			intensity = 0.4432
			color = [
				0.5
				0.5
				0.5
				0.5
			]
			fogging = 1
			scale = 0.63
			mode = add
			jitterrate = 0.6
			jitteramount = 0.0
			maskintensity = 0.0
			maskscale = 1.0
			maskjitterrate = 0.0
			maskuvjitterrate = 0.0
		}
		{
			name = ink_blotch
			scefname = ink_blotch
			type = inkblotch
			on = 1
			scratchcolor = [
				1.0
				1.0
				1.0
				1.0
			]
			blotchcolor = [
				0.007843
				0.007843
				0.0
				0.1
			]
			intervala = 0.0
			intervalb = 0.0
			xtiling = 0.256
			ytiling = 4.8350015
			rotationa = 357.33588
			rotationb = 251.85596
			texture = 'unknown'
		}
		{
			name = uberscreenfx
			scefname = uberscreenfx
			type = uberscreenfx
		}
	]
}
