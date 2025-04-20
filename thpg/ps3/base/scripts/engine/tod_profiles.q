AgroKick_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 173.0
		sun_blue = 97.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			27
			51
			255
		]
		largeparticlesrgb = [
			187
			153
			137
		]
		phase = 1.05
		strength = 0.45000002
		atmosphere = ph_dome
		smallscale = 55
		largescale = 1
	}
	screen_fx = [
		{
			scefname = dof1_scef
			type = dof
			on = 1
			backdist = 0.1
			frontdist = 0
			strength = 0.3
			blurradius = 6
			blurresolution = half
		}
		{
			scefname = zoom1_scef
			type = blur
			on = 1
			amount = 0.2
			focus_center = [
				0.5
				0.5
			]
			scales = [
				0.95
				1.0
			]
			angles = [
				0
				0
			]
			inner_color = [
				255
				255
				255
			]
			inner_alpha = 72
			outer_color = [
				0
				0
				0
			]
			outer_alpha = 192
		}
	]
}
arcade_effect_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			27
			51
			255
		]
		largeparticlesrgb = [
			187
			153
			137
		]
		phase = 1.05
		strength = 0.45000002
		atmosphere = ph_dome
		smallscale = 55
		largescale = 1
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0
			strength = 0.5
			color = [
				174
				214
				255
				255
			]
		}
		{
			scefname = vivid
			type = bright_sat
			on = 1
			contrast = 1.12
			red_mix = [
				1.15
				0.03
				-0.1
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.11
			]
			brightness = 1
			saturation = 0.9
			hue = 1
		}
		{
			scefname = shade
			type = vignette
			on = 1
			inner_radius = 0.8
			outer_radius = 1.4
			alpha = 0.5
		}
		{
			scefname = name
			type = noise
			on = 1
			intensity = 0.05
			color = [
				225
				186
				174
			]
			scale = 0.5
			mode = add
			jitterrate = 0.2
			jitteramount = 0
			maskintensity = 0.05
			maskscale = 0.26
		}
	]
}
default_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 2.33
		strength = 1.49
		atmosphere = ph_dome
		smallscale = 70
		largescale = 16
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0.80300003
			strength = 0.297
			color = [
				150
				146
				131
				14
			]
		}
		{
			scefname = PM_BLOOM
			type = bloom
			on = 1
			bloom1 = 0
			bloom2 = 0.75
			autoluminancemod = 0
			materialfilter = 1
			distancemod = 0.0
			strength = [
				252
				254
				254
			]
			color = [
				160
				160
				160
			]
			falloff1 = 0.5
			falloff2 = 4
		}
		{
			scefname = intbloom
			type = bloom
			on = 1
			bloom1 = 0
			bloom2 = 1
			autoluminancemod = 1
			materialfilter = 0
			distancemod = 0.0
			strength = [
				180
				154
				226
			]
			color = [
				42
				42
				42
			]
			falloff1 = 0.61
			falloff2 = 1.1
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.05
			red_mix = [
				1.13
				0.03
				-0.1
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.14
			]
			brightness = 0.95
			saturation = 0.5
			hue = 1
		}
		{
			scefname = vignette
			type = vignette
			on = 1
			inner_radius = 0.8
			outer_radius = 1.3399999
			alpha = 0.54
		}
	]
}
Default_OLD_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 255.0
		sun_blue = 255.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 1.03
		strength = 0.4
		atmosphere = ph_dome
		smallscale = 70
		largescale = 1
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0
			strength = 0.409
			color = [
				174
				214
				255
				255
			]
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 0.98999995
			red_mix = [
				1.08
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 1
			saturation = 0.5
			hue = 1
		}
		{
			scefname = vignette
			type = vignette
			on = 1
			inner_radius = 0.8
			outer_radius = 1.3399999
			alpha = 0.54
		}
		{
			scefname = BS_BOOST
			type = bright_sat
			on = 1
			contrast = 1.14
			red_mix = [
				1.05
				0.0
				-0.05
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0.0
				0.0
				1.11
			]
			brightness = 1
			saturation = 1
			hue = 1
		}
	]
}
Default_OLD_02_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 225.0
		sun_blue = 200.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 1.03
		strength = 0.4
		atmosphere = ph_dome
		smallscale = 70
		largescale = 1
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0
			strength = 0.279
			color = [
				143
				143
				143
				255
			]
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.12
			red_mix = [
				1.15
				0.03
				-0.1
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.11
			]
			brightness = 1
			saturation = 0.5
			hue = 1
		}
		{
			scefname = vignette
			type = vignette
			on = 1
			inner_radius = 0.8
			outer_radius = 1.3399999
			alpha = 0.54
		}
	]
}
Default_Shadow_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 2.33
		strength = 1.49
		atmosphere = ph_dome
		smallscale = 70
		largescale = 16
	}
	screen_fx = [
		{
			scefname = dof
			type = dof
			on = 1
			backdist = 1
			frontdist = 0.99799997
			strength = 0.61
			blurradius = 2.05
			blurresolution = quarter
		}
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0.80300003
			strength = 0.297
			color = [
				150
				146
				131
				14
			]
		}
		{
			scefname = PM_BLOOM
			type = bloom
			on = 1
			bloom1 = 0
			bloom2 = 0.75
			autoluminancemod = 0
			materialfilter = 1
			distancemod = 0.0
			strength = [
				252
				254
				254
			]
			color = [
				160
				160
				160
			]
			falloff1 = 0.5
			falloff2 = 4
		}
		{
			scefname = intbloom
			type = bloom
			on = 1
			bloom1 = 0
			bloom2 = 1
			autoluminancemod = 1
			materialfilter = 0
			distancemod = 0.0
			strength = [
				180
				154
				226
			]
			color = [
				42
				42
				42
			]
			falloff1 = 0.61
			falloff2 = 1.1
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.12
			red_mix = [
				1.15
				0.03
				-0.1
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.14
			]
			brightness = 1
			saturation = 0.5
			hue = 1
		}
		{
			scefname = vignette
			type = vignette
			on = 1
			inner_radius = 0.8
			outer_radius = 1.3399999
			alpha = 0.54
		}
	]
}
DefaultFART_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 225.0
		sun_blue = 200.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 2.33
		strength = 1.49
		atmosphere = ph_dome
		smallscale = 70
		largescale = 16
	}
	screen_fx = [
		{
			scefname = dof
			type = dof
			on = 1
			backdist = 1
			frontdist = 0.99799997
			strength = 0.61
			blurradius = 2.05
			blurresolution = quarter
		}
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0
			strength = 0.297
			color = [
				150
				146
				131
				14
			]
		}
		{
			scefname = PM_BLOOM
			type = bloom
			on = 1
			bloom1 = 0
			bloom2 = 0.75
			autoluminancemod = 0
			materialfilter = 1
			distancemod = 0.0
			strength = [
				252
				254
				254
			]
			color = [
				160
				160
				160
			]
			falloff1 = 0.5
			falloff2 = 4
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.12
			red_mix = [
				1.15
				0.03
				-0.1
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.14
			]
			brightness = 0.8
			saturation = 0.5
			hue = 1
		}
		{
			scefname = vignette
			type = vignette
			on = 1
			inner_radius = 0.8
			outer_radius = 1.3399999
			alpha = 0.54
		}
	]
}
dt_Fall01_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 211.0
		sun_blue = 165.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 1.03
		strength = 0.4
		atmosphere = ph_dome
		smallscale = 70
		largescale = 1
	}
	screen_fx = [
		{
			scefname = blm1
			type = bloom
			on = 1
			bloom1 = 0.2
			bloom2 = 0.9
			autoluminancemod = 1
			materialfilter = 0
			distancemod = 0.0
			strength = [
				173
				150
				150
			]
			color = [
				150
				150
				150
			]
			falloff1 = 1
			falloff2 = 1
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.4599999
			red_mix = [
				1.08
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 1.02
			saturation = 0.5
			hue = 1
		}
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.92899996
			frontdist = 0
			strength = 0.29
			color = [
				228
				232
				255
				255
			]
		}
	]
}
dt_fall02_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 211.0
		sun_blue = 165.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 1.03
		strength = 0.4
		atmosphere = ph_dome
		smallscale = 70
		largescale = 1
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0
			strength = 0.331
			color = [
				31
				112
				255
				255
			]
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.42
			red_mix = [
				1.08
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 1.02
			saturation = 0.4
			hue = 1
		}
		{
			scefname = vignette
			type = blur
			on = 1
			amount = 0.2
			focus_center = [
				0.5
				0.5
			]
			scales = [
				1.5
				0.0
			]
			angles = [
				0
				31
			]
			inner_color = [
				0
				0
				0
			]
			inner_alpha = 0.001
			outer_color = [
				0
				0
				0
			]
			outer_alpha = 209
		}
		{
			scefname = BS_BOOST
			type = bright_sat
			on = 1
			contrast = 1.02
			red_mix = [
				1.15
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.08
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 1.26
			saturation = 1.04
			hue = 1
		}
	]
}
dt_Fall03_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 211.0
		sun_blue = 165.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 1.03
		strength = 0.4
		atmosphere = ph_dome
		smallscale = 70
		largescale = 1
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0
			strength = 0.409
			color = [
				174
				214
				255
				255
			]
		}
		{
			scefname = vignette
			type = blur
			on = 1
			amount = 0.2
			focus_center = [
				0.5
				0.5
			]
			scales = [
				1.5
				0.0
			]
			angles = [
				0
				31
			]
			inner_color = [
				0
				0
				0
			]
			inner_alpha = 0.001
			outer_color = [
				0
				0
				0
			]
			outer_alpha = 146
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.42
			red_mix = [
				1.08
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 0.95
			saturation = 0.5
			hue = 1
		}
		{
			scefname = BS_BOOST
			type = bright_sat
			on = 1
			contrast = 1.14
			red_mix = [
				1.09
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.02
			]
			brightness = 1.15
			saturation = 1
			hue = 1
		}
	]
}
dt_fall04_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 211.0
		sun_blue = 165.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 1.03
		strength = 0.4
		atmosphere = ph_dome
		smallscale = 70
		largescale = 1
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0
			strength = 0.409
			color = [
				174
				214
				255
				255
			]
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.1700001
			red_mix = [
				1.08
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 0.96999997
			saturation = 0.5
			hue = 1
		}
		{
			scefname = vignette
			type = blur
			on = 1
			amount = 0.2
			focus_center = [
				0.5
				0.5
			]
			scales = [
				1.5
				0.0
			]
			angles = [
				0
				31
			]
			inner_color = [
				0
				0
				0
			]
			inner_alpha = 0.001
			outer_color = [
				0
				0
				0
			]
			outer_alpha = 194
		}
		{
			scefname = BS_BOOST
			type = bright_sat
			on = 1
			contrast = 1.2
			red_mix = [
				1.09
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.02
			]
			brightness = 1.15
			saturation = 1
			hue = 1
		}
	]
}
dt_fall05_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 211.0
		sun_blue = 165.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 1.03
		strength = 0.4
		atmosphere = ph_dome
		smallscale = 70
		largescale = 1
	}
	screen_fx = [
		{
			scefname = vignette
			type = blur
			on = 1
			amount = 0.2
			focus_center = [
				0.5
				0.5
			]
			scales = [
				1.5
				0.0
			]
			angles = [
				0
				31
			]
			inner_color = [
				0
				0
				0
			]
			inner_alpha = 0.001
			outer_color = [
				0
				0
				0
			]
			outer_alpha = 174
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.42
			red_mix = [
				1.08
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 1.02
			saturation = 0.5
			hue = 1
		}
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0
			strength = 0.193
			color = [
				31
				182
				255
				255
			]
		}
		{
			scefname = BS_BOOST
			type = bright_sat
			on = 1
			contrast = 1.02
			red_mix = [
				1.15
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.08
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 1.04
			saturation = 1.04
			hue = 1
		}
	]
}
dt_fall06_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 211.0
		sun_blue = 165.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 1.03
		strength = 0.4
		atmosphere = ph_dome
		smallscale = 70
		largescale = 1
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0
			strength = 0.245
			color = [
				62
				186
				241
				241
			]
		}
		{
			scefname = vignette
			type = blur
			on = 1
			amount = 0.2
			focus_center = [
				0.5
				0.5
			]
			scales = [
				1.5
				0.0
			]
			angles = [
				0
				31
			]
			inner_color = [
				0
				0
				0
			]
			inner_alpha = 0.001
			outer_color = [
				0
				0
				0
			]
			outer_alpha = 157
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.42
			red_mix = [
				1.08
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 1.02
			saturation = 0.5
			hue = 1
		}
		{
			scefname = BS_BOOST
			type = bright_sat
			on = 1
			contrast = 1.12
			red_mix = [
				1.1700001
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.08
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 1.12
			saturation = 0.69
			hue = 1
		}
	]
}
dt_fall07_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 211.0
		sun_blue = 165.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 1.03
		strength = 0.4
		atmosphere = ph_dome
		smallscale = 70
		largescale = 1
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0
			strength = 0.409
			color = [
				174
				214
				255
				255
			]
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.1700001
			red_mix = [
				1.08
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 0.96999997
			saturation = 0.5
			hue = 1
		}
		{
			scefname = vignette
			type = blur
			on = 1
			amount = 0.2
			focus_center = [
				0.5
				0.5
			]
			scales = [
				1.5
				0.0
			]
			angles = [
				0
				31
			]
			inner_color = [
				0
				0
				0
			]
			inner_alpha = 0.001
			outer_color = [
				0
				0
				0
			]
			outer_alpha = 194
		}
		{
			scefname = BS_BOOST
			type = bright_sat
			on = 1
			contrast = 0.98999995
			red_mix = [
				1.09
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.02
			]
			brightness = 1.71
			saturation = 1
			hue = 1
		}
	]
}
dt_fall08_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 211.0
		sun_blue = 165.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 1.03
		strength = 0.4
		atmosphere = ph_dome
		smallscale = 70
		largescale = 1
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0
			strength = 0.409
			color = [
				174
				214
				255
				255
			]
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.1700001
			red_mix = [
				1.08
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 0.96999997
			saturation = 0.5
			hue = 1
		}
		{
			scefname = vignette
			type = blur
			on = 1
			amount = 0.2
			focus_center = [
				0.5
				0.5
			]
			scales = [
				1.5
				0.0
			]
			angles = [
				0
				31
			]
			inner_color = [
				0
				0
				0
			]
			inner_alpha = 0.001
			outer_color = [
				0
				0
				0
			]
			outer_alpha = 194
		}
		{
			scefname = BS_BOOST
			type = bright_sat
			on = 1
			contrast = 0.98999995
			red_mix = [
				1.09
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.02
			]
			brightness = 1.43
			saturation = 1
			hue = 1
		}
	]
}
FocusMode_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 158.0
		sun_green = 96.0
		sun_blue = 66.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			27
			51
			255
		]
		largeparticlesrgb = [
			187
			153
			137
		]
		phase = 1.05
		strength = 0.45000002
		atmosphere = ph_dome
		smallscale = 55
		largescale = 1
	}
	screen_fx = [
		{
			scefname = BS01
			type = bright_sat
			on = 1
			contrast = 1.1
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0.1
				1.0
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 1
			saturation = 0.5
			hue = 1
		}
		{
			scefname = ZB01
			type = blur
			on = 1
			amount = 1
			focus_center = [
				0.5
				0.5
			]
			scales = [
				0.0
				-1.7
			]
			angles = [
				0
				0
			]
			inner_color = [
				0
				0
				0
			]
			inner_alpha = 0
			outer_color = [
				255
				255
				255
			]
			outer_alpha = 100
		}
		{
			scefname = DOF01
			type = dof
			on = 1
			backdist = 0.07
			frontdist = 0
			strength = 1
			blurradius = 6
			blurresolution = half
		}
		{
			scefname = Bloom01
			type = bloom
			on = 1
			bloom1 = 0.6
			bloom2 = 0.86
			autoluminancemod = 0
			materialfilter = 1
			distancemod = 21.5
			strength = [
				206
				141
				125
			]
			color = [
				128
				128
				128
			]
			falloff1 = 1
			falloff2 = 1
		}
	]
}
Green_Menu_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			27
			51
			255
		]
		largeparticlesrgb = [
			187
			153
			137
		]
		phase = 1.05
		strength = 0.45000002
		atmosphere = ph_dome
		smallscale = 55
		largescale = 1
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.5
			frontdist = 0
			strength = 1
			color = [
				80
				180
				120
				0
			]
		}
		{
			scefname = GreenTint
			type = bright_sat
			on = 1
			contrast = 1.2
			red_mix = [
				0.1
				0.2
				0.1
			]
			green_mix = [
				0.1
				0.3
				0.2
			]
			blue_mix = [
				0.1
				0.35000002
				0.25
			]
			brightness = 1
			saturation = 0.8
			hue = 1
		}
	]
}
Launcher_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 173.0
		sun_blue = 97.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = s_default
		smallscale = 10
		largescale = 10
	}
	screen_fx = [
		{
			scefname = dof1_scef
			type = dof
			on = 1
			backdist = 0.1
			frontdist = 0
			strength = 0.5
			blurradius = 6
			blurresolution = half
		}
		{
			scefname = zoom1_scef
			type = blur
			on = 1
			amount = 0.2
			focus_center = [
				0.5
				0.5
			]
			scales = [
				0.8
				1.0
			]
			angles = [
				0
				0
			]
			inner_color = [
				255
				255
				255
			]
			inner_alpha = 96
			outer_color = [
				255
				56
				56
			]
			outer_alpha = 255
		}
	]
}
mocap_tw_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 173.0
		sun_blue = 97.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = ph_dome
		smallscale = 55
		largescale = 1
	}
	screen_fx = [
		{
			scefname = blm1
			type = bloom
			on = 1
			bloom1 = 0.21000001
			bloom2 = 1
			autoluminancemod = 1
			materialfilter = 0
			distancemod = 1.0
			strength = [
				110
				110
				110
			]
			color = [
				0
				0
				0
			]
			falloff1 = 1
			falloff2 = 1
		}
		{
			scefname = dof
			type = dof
			on = 1
			backdist = 0.04
			frontdist = 0
			strength = 1
			blurradius = 6
			blurresolution = half
		}
		{
			scefname = blm2
			type = bloom
			on = 1
			bloom1 = 0.3
			bloom2 = 0.8
			autoluminancemod = 0
			materialfilter = 0
			distancemod = 72.0
			strength = [
				64
				64
				64
			]
			color = [
				64
				64
				64
			]
			falloff1 = 1
			falloff2 = 1
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 2.1
			saturation = 1
			hue = 1
		}
		{
			scefname = fisheye
			type = blur
			on = 1
			amount = 1
			focus_center = [
				0.5
				0.5
			]
			scales = [
				0
				0
			]
			angles = [
				0
				0
			]
			inner_color = [
				0
				0
				0
			]
			inner_alpha = 0
			outer_color = [
				1
				1
				1
			]
			outer_alpha = 0
		}
	]
}
ms_Pause_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 173.0
		sun_blue = 97.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			0
			33
			255
		]
		largeparticlesrgb = [
			187
			153
			137
		]
		phase = 1.05
		strength = 0.45000002
		atmosphere = ph_dome
		smallscale = 55
		largescale = 0
	}
	screen_fx = [
		{
			scefname = blm1
			type = bloom
			on = 1
			bloom1 = 1
			bloom2 = 1
			autoluminancemod = 1
			materialfilter = 0
			distancemod = 20.07
			strength = [
				0
				0
				0
			]
			color = [
				0
				0
				24
			]
			falloff1 = 1
			falloff2 = 1
		}
		{
			scefname = BS1
			type = bright_sat
			on = 0
			contrast = 0.88
			red_mix = [
				1.2
				0.2
				0.2
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 1
			saturation = 0.88
			hue = 1
		}
		{
			scefname = fisheye
			type = blur
			on = 1
			amount = 0.67
			focus_center = [
				0.5
				0.5
			]
			scales = [
				8
				0
			]
			angles = [
				0
				0
			]
			inner_color = [
				0
				0
				0
			]
			inner_alpha = 56
			outer_color = [
				0
				20
				38
			]
			outer_alpha = 255
		}
		{
			scefname = fog
			type = fog
			on = 0
			foregroundonly = 0
			backdist = 1
			frontdist = 0
			strength = 0.72499996
			color = [
				204
				226
				255
				255
			]
		}
	]
}
NailTheTrick_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 158.0
		sun_green = 96.0
		sun_blue = 66.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			27
			51
			255
		]
		largeparticlesrgb = [
			187
			153
			137
		]
		phase = 1.05
		strength = 0.45000002
		atmosphere = ph_dome
		smallscale = 55
		largescale = 1
	}
	screen_fx = [
		{
			scefname = DOF01
			type = dof
			on = 1
			backdist = 0.07
			frontdist = 0
			strength = 1
			blurradius = 6
			blurresolution = half
		}
		{
			scefname = Bloom01
			type = bloom
			on = 1
			bloom1 = 0.6
			bloom2 = 0.86
			autoluminancemod = 0
			materialfilter = 0
			distancemod = 12.0
			strength = [
				125
				141
				206
			]
			color = [
				96
				96
				96
			]
			falloff1 = 1
			falloff2 = 1
		}
	]
}
NailTheTrick_M_CU_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			27
			51
			255
		]
		largeparticlesrgb = [
			187
			153
			137
		]
		phase = 1.05
		strength = 0.45000002
		atmosphere = ph_dome
		smallscale = 55
		largescale = 1
	}
	screen_fx = [
		{
			scefname = DOF01
			type = dof
			on = 1
			backdist = 0.07
			frontdist = 0
			strength = 0.33
			blurradius = 6
			blurresolution = half
		}
		{
			scefname = Bloom01
			type = bloom
			on = 1
			bloom1 = 0.1
			bloom2 = 0.2
			autoluminancemod = 0
			materialfilter = 0
			distancemod = 12.0
			strength = [
				125
				141
				206
			]
			color = [
				96
				96
				96
			]
			falloff1 = 1
			falloff2 = 1
		}
	]
}
name_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 2.33
		strength = 1.49
		atmosphere = ph_dome
		smallscale = 70
		largescale = 16
	}
	screen_fx = [
		{
			scefname = dof
			type = dof
			on = 1
			backdist = 1
			frontdist = 0.99799997
			strength = 0.61
			blurradius = 2.05
			blurresolution = quarter
		}
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0.80300003
			strength = 0.297
			color = [
				150
				146
				131
				14
			]
		}
		{
			scefname = PM_BLOOM
			type = bloom
			on = 1
			bloom1 = 0
			bloom2 = 0.75
			autoluminancemod = 0
			materialfilter = 1
			distancemod = 0.0
			strength = [
				252
				254
				254
			]
			color = [
				160
				160
				160
			]
			falloff1 = 0.5
			falloff2 = 4
		}
		{
			scefname = intbloom
			type = bloom
			on = 1
			bloom1 = 0
			bloom2 = 1
			autoluminancemod = 1
			materialfilter = 0
			distancemod = 0.0
			strength = [
				180
				154
				226
			]
			color = [
				42
				42
				42
			]
			falloff1 = 0.61
			falloff2 = 1.1
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.15
			red_mix = [
				1.15
				0.03
				-0.1
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.14
			]
			brightness = 0.89
			saturation = 0.5
			hue = 1
		}
		{
			scefname = vignette
			type = vignette
			on = 1
			inner_radius = 0.8
			outer_radius = 1.3399999
			alpha = 0.54
		}
	]
}
OMFGBBQ_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 2.33
		strength = 1.49
		atmosphere = ph_dome
		smallscale = 70
		largescale = 16
	}
	screen_fx = [
		{
			scefname = dof
			type = dof
			on = 0
			backdist = 1
			frontdist = 0.99799997
			strength = 0.61
			blurradius = 2.05
			blurresolution = quarter
		}
		{
			scefname = fog
			type = fog
			on = 0
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0.80300003
			strength = 0.297
			color = [
				150
				146
				131
				14
			]
		}
		{
			scefname = PM_BLOOM
			type = bloom
			on = 1
			bloom1 = 0
			bloom2 = 0.75
			autoluminancemod = 0
			materialfilter = 1
			distancemod = 0.0
			strength = [
				252
				254
				254
			]
			color = [
				160
				160
				160
			]
			falloff1 = 0.5
			falloff2 = 4
		}
		{
			scefname = pdof
			type = poisson_dof
			on = 0
			backdist = 1.0
			focaldist = 0.01
			frontdist = 0.0
			clampback = 0.1
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.06
			red_mix = [
				1.15
				0.03
				-0.1
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.14
			]
			brightness = 0.71
			saturation = 0.5
			hue = 1
		}
		{
			scefname = intbloom
			type = bloom
			on = 1
			bloom1 = 1
			bloom2 = 0
			autoluminancemod = 1
			materialfilter = 0
			distancemod = 0.0
			strength = [
				223
				223
				223
			]
			color = [
				0
				0
				0
			]
			falloff1 = 1
			falloff2 = 0
		}
		{
			scefname = vignette
			type = vignette
			on = 1
			inner_radius = 0.8
			outer_radius = 1.3399999
			alpha = 0.54
		}
		{
			scefname = name
			type = bloom
			on = 0
			bloom1 = 0
			bloom2 = 0.75
			autoluminancemod = 0
			materialfilter = 0
			distancemod = 100.0
			strength = [
				252
				254
				254
			]
			color = [
				160
				160
				160
			]
			falloff1 = 0.5
			falloff2 = 4
		}
	]
}
Orange_Menu_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			27
			51
			255
		]
		largeparticlesrgb = [
			187
			153
			137
		]
		phase = 1.05
		strength = 0.45000002
		atmosphere = ph_dome
		smallscale = 55
		largescale = 1
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.5
			frontdist = 0
			strength = 1
			color = [
				200
				100
				40
				0
			]
		}
		{
			scefname = GreenTint
			type = bright_sat
			on = 1
			contrast = 1.2
			red_mix = [
				0.32000002
				0.18
				0.08
			]
			green_mix = [
				0.3
				0.18
				0.08
			]
			blue_mix = [
				0.3
				0.18
				0.08
			]
			brightness = 1.3
			saturation = 0.8
			hue = 1
		}
	]
}
Rain_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 2.33
		strength = 1.49
		atmosphere = ph_dome
		smallscale = 70
		largescale = 16
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.271
			frontdist = 0.16399999
			strength = 0.36400002
			color = [
				51
				60
				87
				255
			]
		}
		{
			scefname = PM_BLOOM
			type = bloom
			on = 0
			bloom1 = 0
			bloom2 = 0.75
			autoluminancemod = 0
			materialfilter = 1
			distancemod = 0.0
			strength = [
				252
				254
				254
			]
			color = [
				160
				160
				160
			]
			falloff1 = 0.5
			falloff2 = 4
		}
		{
			scefname = intbloom
			type = bloom
			on = 0
			bloom1 = 0
			bloom2 = 1
			autoluminancemod = 1
			materialfilter = 0
			distancemod = 0.0
			strength = [
				152
				162
				228
			]
			color = [
				60
				60
				60
			]
			falloff1 = 0.61
			falloff2 = 1.1
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.01
			red_mix = [
				1.15
				0.03
				-0.1
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.14
			]
			brightness = 1.41
			saturation = 0.42000002
			hue = 1
		}
		{
			scefname = vignette
			type = vignette
			on = 1
			inner_radius = 0.8
			outer_radius = 1.3399999
			alpha = 0.7
		}
	]
}
RAIN2_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 2.33
		strength = 1.49
		atmosphere = ph_dome
		smallscale = 70
		largescale = 16
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.6470001
			frontdist = 0.16399999
			strength = 0.379
			color = [
				51
				60
				87
				14
			]
		}
		{
			scefname = PM_BLOOM
			type = bloom
			on = 1
			bloom1 = 0
			bloom2 = 0.75
			autoluminancemod = 0
			materialfilter = 1
			distancemod = 0.0
			strength = [
				252
				254
				254
			]
			color = [
				160
				160
				160
			]
			falloff1 = 0.5
			falloff2 = 4
		}
		{
			scefname = intbloom
			type = bloom
			on = 1
			bloom1 = 0
			bloom2 = 1
			autoluminancemod = 1
			materialfilter = 0
			distancemod = 0.0
			strength = [
				180
				154
				226
			]
			color = [
				42
				42
				42
			]
			falloff1 = 0.61
			falloff2 = 1.1
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.11
			red_mix = [
				1.15
				0.03
				-0.1
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.14
			]
			brightness = 0.86
			saturation = 0.54
			hue = 1
		}
		{
			scefname = vignette
			type = vignette
			on = 1
			inner_radius = 0.8
			outer_radius = 1.3399999
			alpha = 0.54
		}
	]
}
Red_Menu_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = ph_dome
		smallscale = 10
		largescale = 10
	}
	screen_fx = [
		{
			scefname = Red_Menu_Fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.5
			frontdist = 0
			strength = 1
			color = [
				200
				50
				50
				0
			]
		}
		{
			scefname = name
			type = bright_sat
			on = 1
			contrast = 1.2
			red_mix = [
				0.4
				0.1
				0.07
			]
			green_mix = [
				0.4
				0.1
				0.120000005
			]
			blue_mix = [
				0.16
				0.1
				0.05
			]
			brightness = 1.15
			saturation = 1
			hue = 1
		}
	]
}
RetinaBurn_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 173.0
		sun_blue = 97.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			27
			51
			255
		]
		largeparticlesrgb = [
			187
			153
			137
		]
		phase = 1.05
		strength = 0.45000002
		atmosphere = ph_dome
		smallscale = 55
		largescale = 1
	}
	screen_fx = [
		{
			scefname = bloom
			type = bloom
			on = 1
			bloom1 = 0
			bloom2 = 100
			autoluminancemod = 0
			materialfilter = 1
			distancemod = 0.0
			strength = [
				128
				0
				0
			]
			color = [
				0
				0
				0
			]
			falloff1 = 1
			falloff2 = 1
		}
	]
}
Rigger_Mode_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = ph_dome
		smallscale = 10
		largescale = 10
	}
	screen_fx = [
		{
			scefname = desaturate
			type = bright_sat
			on = 1
			contrast = 1
			red_mix = [
				1.05
				0.0
				0.0
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 1.1
			saturation = 0.3
			hue = 1
		}
		{
			scefname = depth
			type = dof
			on = 1
			backdist = 0.118
			frontdist = 0.016999999
			strength = 0.61
			blurradius = 2.05
			blurresolution = quarter
		}
		{
			scefname = vignette
			type = vignette
			on = 1
			inner_radius = 0.8
			outer_radius = 1.3499999
			alpha = 0.5
		}
	]
}
screenflash_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 173.0
		sun_blue = 97.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			27
			51
			255
		]
		largeparticlesrgb = [
			187
			153
			137
		]
		phase = 1.05
		strength = 0.45000002
		atmosphere = ph_dome
		smallscale = 55
		largescale = 1
	}
	screen_fx = [
		{
			scefname = dof
			type = dof
			on = 1
			backdist = 0.05
			frontdist = 0
			strength = 1
			blurradius = 6
			blurresolution = half
		}
		{
			scefname = bloom
			type = bloom
			on = 1
			bloom1 = 1
			bloom2 = 1
			autoluminancemod = 0
			materialfilter = 0
			distancemod = 0.0
			strength = [
				255
				255
				255
			]
			color = [
				0
				0
				0
			]
			falloff1 = 1
			falloff2 = 1
		}
	]
}
SkateCheck_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			27
			51
			255
		]
		largeparticlesrgb = [
			187
			153
			137
		]
		phase = 1.05
		strength = 0.45000002
		atmosphere = ph_dome
		smallscale = 55
		largescale = 1
	}
	screen_fx = [
		{
			scefname = BrightSat
			type = bright_sat
			on = 1
			contrast = 1.12
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0.1
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.02
			]
			brightness = 1
			saturation = 0.5
			hue = 1
		}
		{
			scefname = dof1_scef
			type = dof
			on = 1
			backdist = 0.1
			frontdist = 0
			strength = 0.6
			blurradius = 6
			blurresolution = half
		}
		{
			scefname = name
			type = blur
			on = 1
			amount = 0.3
			focus_center = [
				0.5
				0.5
			]
			scales = [
				0.97999996
				1.16
			]
			angles = [
				0
				0
			]
			inner_color = [
				255
				217
				217
			]
			inner_alpha = 24
			outer_color = [
				255
				0
				0
			]
			outer_alpha = 150
		}
		{
			scefname = vignette
			type = vignette
			on = 1
			inner_radius = 0.45000002
			outer_radius = 1.22
			alpha = 0.52
		}
	]
}
Sunset_Cutscene_tod_manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 211.0
		sun_blue = 165.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			20
			40
			70
		]
		largeparticlesrgb = [
			255
			242
			212
		]
		phase = 1.03
		strength = 0.4
		atmosphere = s_default
		smallscale = 70
		largescale = 1
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.98899996
			frontdist = 0
			strength = 0.409
			color = [
				174
				214
				255
				255
			]
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1.1700001
			red_mix = [
				1.08
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 0.96999997
			saturation = 0.5
			hue = 1
		}
		{
			scefname = vignette
			type = blur
			on = 1
			amount = 0.2
			focus_center = [
				0.5
				0.5
			]
			scales = [
				1.5
				0.0
			]
			angles = [
				0
				31
			]
			inner_color = [
				0
				0
				0
			]
			inner_alpha = 0.001
			outer_color = [
				0
				0
				0
			]
			outer_alpha = 194
		}
		{
			scefname = BS_BOOST
			type = bright_sat
			on = 1
			contrast = 1.2
			red_mix = [
				1.09
				0.02
				-0.05
			]
			green_mix = [
				0.0
				1.05
				0.0
			]
			blue_mix = [
				0.0
				0.0
				1.02
			]
			brightness = 1.15
			saturation = 1
			hue = 1
		}
	]
}
ve_blurry_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = ph_dome
		smallscale = 10
		largescale = 10
	}
	screen_fx = [
		{
			scefname = ve_blurry
			type = dof
			on = 1
			backdist = 0.03
			frontdist = 0.006
			strength = 1
			blurradius = 3.08
			blurresolution = quarter
		}
	]
}
ve_filmnoir_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = ph_dome
		smallscale = 10
		largescale = 10
	}
	screen_fx = [
		{
			scefname = ve_filmnoir
			type = bright_sat
			on = 1
			contrast = 1.4499999
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 3.57
			saturation = 0
			hue = 0
		}
	]
}
ve_greenhaze_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = ph_dome
		smallscale = 10
		largescale = 10
	}
	screen_fx = [
	]
}
ve_grit_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = ph_dome
		smallscale = 10
		largescale = 10
	}
	screen_fx = [
		{
			scefname = ve_grit
			type = noise
			on = 1
			intensity = 0.48000002
			color = [
				192
				192
				192
			]
			scale = 0.85
			mode = subsrcmulinvdst
			jitterrate = 0
			jitteramount = 0
			maskintensity = 0.61
			maskscale = 10
		}
	]
}
ve_intenselight_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = ph_dome
		smallscale = 10
		largescale = 10
	}
	screen_fx = [
		{
			scefname = ve_intenselight
			type = dof
			on = 1
			backdist = 0.009
			frontdist = 0.005
			strength = 1
			blurradius = 0.13
			blurresolution = half
		}
	]
}
ve_pinktrails_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = ph_dome
		smallscale = 10
		largescale = 10
	}
	screen_fx = [
		{
			scefname = ve_pinktrails
			type = fog
			on = 1
			foregroundonly = 1
			backdist = 0
			frontdist = 0.016999999
			strength = 0.96999997
			color = [
				255
				128
				192
				0
			]
		}
	]
}
ve_plasmagoo_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = ph_dome
		smallscale = 10
		largescale = 10
	}
	screen_fx = [
		{
			scefname = plasmagoo
			type = simple_bloom
			on = 1
			bloom1 = 0.85
			materialfilter = 0
			bloom2 = 0.0
			autoluminancemod = 0
			distancemod = 0.0
			strength = [
				146
				251
				4
			]
			color = [
				128
				255
				255
			]
			falloff1 = 1.9499999
			falloff2 = 0.0
		}
	]
}
ve_purpleglow_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = ph_dome
		smallscale = 10
		largescale = 10
	}
	screen_fx = [
		{
			scefname = ve_purpleglow
			type = bloom
			on = 1
			bloom1 = 1
			bloom2 = 1
			autoluminancemod = 1
			materialfilter = 0
			distancemod = 54.649998
			strength = [
				112
				70
				198
			]
			color = [
				255
				174
				94
			]
			falloff1 = 5
			falloff2 = 5
		}
	]
}
ve_starburst_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = ph_dome
		smallscale = 10
		largescale = 10
	}
	screen_fx = [
		{
			scefname = ve_starburst
			type = fisheye
			on = 1
			warp_x = 1.43
			warp_y = 1.43
			aperture_start = 0.06
			aperture_end = 0.90999997
			aperture_x = 1
			aperture_y = 1
			scale_x = 0.120000005
			scale_y = 0.120000005
		}
	]
}
video_menu_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			128
			128
			128
		]
		largeparticlesrgb = [
			128
			128
			128
		]
		phase = 0
		strength = 0
		atmosphere = ph_dome
		smallscale = 10
		largescale = 10
	}
	screen_fx = [
		{
			scefname = depth
			type = dof
			on = 1
			backdist = 0.36
			frontdist = 0.1
			strength = 1
			blurradius = 6
			blurresolution = half
		}
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.5
			frontdist = 0
			strength = 0.84800005
			color = [
				128
				64
				0
				0
			]
		}
		{
			scefname = tint
			type = bright_sat
			on = 1
			contrast = 1.1800001
			red_mix = [
				0.88
				0.5
				0.17
			]
			green_mix = [
				0.71
				0.88
				0.36
			]
			blue_mix = [
				0.17
				0.1
				0.57
			]
			brightness = 0.59
			saturation = 0.42000002
			hue = 1
		}
	]
}
Violet_Menu_tod_manager = {
	tod = {
		sun_on = 0
		sun_theta = 0.0
		sun_phi = 0.0
		sun_red = 0.0
		sun_green = 0.0
		sun_blue = 0.0
		lev_red = 0
		lev_green = 0
		lev_blue = 0
	}
	atmosphere = {
		smallparticlesrgb = [
			27
			51
			255
		]
		largeparticlesrgb = [
			187
			153
			137
		]
		phase = 1.05
		strength = 0.45000002
		atmosphere = ph_dome
		smallscale = 55
		largescale = 1
	}
	screen_fx = [
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 0
			backdist = 0.5
			frontdist = 0
			strength = 1
			color = [
				140
				100
				180
				0
			]
		}
		{
			scefname = GreenTint
			type = bright_sat
			on = 1
			contrast = 1.2
			red_mix = [
				0.32000002
				0.2
				0.3
			]
			green_mix = [
				0.2
				0.2
				0.32000002
			]
			blue_mix = [
				0.15
				0.15
				0.32000002
			]
			brightness = 1.15
			saturation = 0.8
			hue = 1
		}
	]
}
Zero_TOD_Manager = {
	tod = {
		sun_on = 1
		sun_theta = 330.0
		sun_phi = 45.0
		sun_red = 255.0
		sun_green = 173.0
		sun_blue = 97.0
		lev_red = 135
		lev_green = 130
		lev_blue = 125
	}
	atmosphere = {
		smallparticlesrgb = [
			27
			51
			255
		]
		largeparticlesrgb = [
			187
			153
			137
		]
		phase = 1.05
		strength = 0.45000002
		atmosphere = ph_dome
		smallscale = 55
		largescale = 1
	}
	screen_fx = [
		{
			scefname = blm1
			type = bloom
			on = 1
			bloom1 = 0
			bloom2 = 0
			autoluminancemod = 1
			materialfilter = 0
			distancemod = 1.0
			strength = [
				0
				0
				0
			]
			color = [
				0
				0
				0
			]
			falloff1 = 1
			falloff2 = 1
		}
		{
			scefname = BS1
			type = bright_sat
			on = 1
			contrast = 1
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
			brightness = 1
			saturation = 1
			hue = 1
		}
		{
			scefname = fisheye
			type = blur
			on = 1
			amount = 1
			focus_center = [
				0.5
				0.5
			]
			scales = [
				0
				0
			]
			angles = [
				0
				0
			]
			inner_color = [
				0
				0
				0
			]
			inner_alpha = 0
			outer_color = [
				1
				1
				1
			]
			outer_alpha = 0
		}
		{
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 1
			backdist = 0.506
			frontdist = 0
			strength = 0.39000002
			color = [
				158
				143
				128
				128
			]
		}
	]
}
