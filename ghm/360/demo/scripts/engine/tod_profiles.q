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
			saturation = 0.8132
			thickness = 15.614799
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
			farblurend = 5.5
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
			farblurend = 5.13
		}
		{
			name = godray
			scefname = godray
			type = godray
			on = 1
			colormodulate = [
				1.0
				1.0
				1.0
				3.0
			]
			depthmodulate = 0.0
			steps = 33.690998
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
			farblurend = 2.5
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
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.0
			farblurend = 4.0
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
			strength = 1.0
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
			strength = 0.5
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.0
			farblurend = 4.0
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
			strength = 1.0
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 3.0
			farblurend = 13.0
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
			fullscreen = 1
			materialfilter = 1
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
			saturation = 0.0732
			thickness = 20.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.209
			contrast = 1.1208
			hue = 1.0
			saturation = 0.014599999
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
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
			brightness = 1.0
			contrast = 0.8716
			hue = 1.0
			saturation = 0.5
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
			intensity = 0.13549998
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
			thickness = 20.0
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
			saturation = 0.7838
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
			saturation = 1.0
			thickness = 20.0
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
			saturation = 0.0
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
			intensity = 0.2015
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
			contrast = 1.1064
			hue = 1.0
			saturation = 0.3
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
			brightness = 1.0
			contrast = 1.0768001
			hue = 1.0
			saturation = 0.5
			red_mix_r = 1.0328
			red_mix_g = 0.09520001
			red_mix_b = 0.0
			green_mix_r = 0.0072000003
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
			intensity = 0.1429
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
			saturation = 0.54940003
			thickness = 5.1762
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.209
			contrast = 1.1208
			hue = 1.0
			saturation = 0.3
			red_mix_r = 1.0
			red_mix_g = -0.066
			red_mix_b = -0.0804
			green_mix_r = 0.0
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
			name = vignette
			scefname = vignette
			type = vignette
			on = 0
			aspectcorrection = 0
			inner_radius = 0.5
			outer_radius = 1.1868001
			color = [
				0.0
				0.0
				0.0
				0.0
			]
			alpha = 0.718
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
				0.137255
				0.137255
				0.12549001
				0.07913701
			]
			intervala = 0.05
			intervalb = 0.06
			xtiling = 1.2820001
			ytiling = 0.806
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
metal_sepia_tod_manager = {
	screen_fx = [
		{
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
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
			brightness = 1.1355
			contrast = 0.94519997
			hue = 1.0
			saturation = 0.25
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
			intensity = 0.1575
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
				0.04
				0.04
				0.03
				0.028777
			]
			intervala = 0.05
			intervalb = 0.06
			xtiling = 1.57
			ytiling = 1.0
			rotationa = 20.0
			rotationb = 60.0
			texture = 'tex\\SFX\\Streaks.dds'
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
				0.576471
				0.576471
				0.576471
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
			brightness = 1.1539999
			contrast = 1.0184
			hue = 1.0
			saturation = 0.5
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
			on = 1
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
			intensity = 0.13549998
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
				0.266667
				0.266667
				0.266667
				0.0
			]
			colormodulate = [
				0.458824
				0.458824
				0.458824
				3.000001
			]
			saturation = 0.4102
			thickness = 20.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.3554999
			contrast = 1.0036
			hue = 1.0
			saturation = 0.37
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
			intensity = 0.1575
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
				0.04
				0.04
				0.03
				0.064748
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
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
			subtract = [
				0.32549003
				0.32549003
				0.32549003
				0.0
			]
			colormodulate = [
				0.403922
				0.403922
				0.403922
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
			brightness = 1.172
			contrast = 1.0768001
			hue = 1.0
			saturation = 0.15
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
				0.086330995
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
			name = bloom__simplified_
			scefname = bloom__simplified_
			type = bloom2
			on = 1
			fullscreen = 1
			materialfilter = 1
			subtract = [
				0.294118
				0.294118
				0.294118
				0.0
			]
			colormodulate = [
				0.23921601
				0.23921601
				0.23921601
				3.000001
			]
			saturation = 0.58599997
			thickness = 19.164
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 1.3299999
			contrast = 1.25
			hue = 1.0
			saturation = 0.03
			red_mix_r = 1.0
			red_mix_g = 0.0
			red_mix_b = 0.0
			green_mix_r = 0.0
			green_mix_g = 1.0
			green_mix_b = 0.0
			blue_mix_r = 0.0
			blue_mix_g = 0.0
			blue_mix_b = 1.0916001
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
			intensity = 0.22340001
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
				0.027451
				0.027451
				0.027451
				1.0
			]
			blotchcolor = [
				0.0
				0.0
				0.0
				0.115108006
			]
			intervala = 0.0732
			intervalb = 0.0806
			xtiling = 1.722
			ytiling = 1.209
			rotationa = 0.0
			rotationb = 0.0
			texture = 'tex\\SFX\\Grungy.dds'
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
				0.65490204
				0.65490204
				0.65490204
				1.0
			]
			saturation = 1.0
			thickness = 20.0
			equation = eq0
		}
		{
			name = brightness___saturation
			scefname = brightness___saturation
			type = bright_sat
			on = 1
			brightness = 0.9
			contrast = 0.94519997
			hue = 1.0
			saturation = 0.0
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
			intensity = 0.2015
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
metal_bw_streaks_tod_manager = {
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
