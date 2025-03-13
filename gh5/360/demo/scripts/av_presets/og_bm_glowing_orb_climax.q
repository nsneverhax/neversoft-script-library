og_bm_glowing_orb_climax = [
	{
		type = sprite
		pos = (0.5, 0.5)
		scale = (1.0, 1.0)
		width = 0.25
		height = 0.1
		color = [
			61
			58
			42
			255
		]
		material = og_mat_flare_add
		blendmode = add
		angle = 0
		angularvel = -2.0944
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.25
				responsefunc = sintime
				timerate = 2.0
			}
			{
				type = constant
				response = offsety
				scalemod = 0.5
				responsefunc = costime
				timerate = 2.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.258
		color = [
			81
			76
			24
			255
		]
		blendmode = brighten
		thickness = 10.0
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		length = 0.025
		innerradius = 0.25
		outerradius = 0.5
		color = [
			123
			115
			87
			255
		]
		material = og_mat_flare_add
		blendmode = blend
		thickness = 100.0
		angularvel = 1.7453301
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 13
		radius = 0.25
		radius2 = 1.0
		color = [
			0
			255
			18
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 0.872665
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			28
			23
			15
			255
		]
		material = og_mat_sphere_sub
		blendmode = blend
		angle = 0
		angularvel = 0.17453298
		controls = [
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = -0.52
		height = -0.52
		color = [
			30
			40
			22
			63
		]
		material = og_mat_sphere_b_add
		blendmode = blend
		angle = 0
		angularvel = -0.349066
		controls = [
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.51
		height = 0.51
		color = [
			40
			34
			34
			127
		]
		material = og_mat_sphere_add
		blendmode = blend
		angle = 0
		angularvel = 0.523599
		controls = [
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.55
		height = 0.55
		color = [
			101
			61
			0
			31
		]
		material = og_mat_sphere_blend
		blendmode = blend
		angle = 0
		angularvel = 0.523599
		controls = [
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (0.75, 0.75)
		width = 0.4
		height = 0.5
		color = [
			73
			73
			73
			0
		]
		material = og_mat_bm_01_blend
		blendmode = blend
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = alphamodulation
				scalemod = 2.0
				responsefunc = sintime
				timerate = 0.25
			}
			{
				type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.25
			}
			{
				type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.25
			}
		]
	}
	{
		type = sprite
		pos = (0.35000002, 0.45000002)
		scale = (0.5, 0.5)
		width = 0.55
		height = 0.5
		color = [
			64
			64
			63
			0
		]
		material = og_mat_bm_02_blend
		blendmode = blend
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = alphamodulation
				scalemod = 0.8
				responsefunc = sintime
				timeoffset = 1.5707
				timerate = 0.25
			}
			{
				type = constant
				response = scaley
				scalemod = 0.35000002
				responsefunc = sintime
				timeoffset = 1.5707
				timerate = 0.25
			}
			{
				type = constant
				response = scalex
				scalemod = 0.35000002
				responsefunc = sintime
				timeoffset = 1.5707
				timerate = 0.25
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.35000002)
		scale = (0.5, 0.5)
		width = 0.55
		height = 0.5
		color = [
			44
			44
			44
			0
		]
		material = og_mat_bm_03
		blendmode = blend
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = alphamodulation
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 3.1399999
				timerate = 0.25
			}
			{
				type = constant
				response = scaley
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 3.1399999
				timerate = 0.25
			}
			{
				type = constant
				response = scalex
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 3.1399999
				timerate = 0.25
			}
		]
	}
	{
		type = sprite
		pos = (0.4, 0.35000002)
		scale = (0.5, 0.5)
		width = 0.35000002
		height = 0.5
		color = [
			64
			51
			24
			0
		]
		material = og_mat_bm_04
		blendmode = blend
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = alphamodulation
				scalemod = 0.25
				responsefunc = sintime
				timeoffset = 4.7121
				timerate = 0.25
			}
			{
				type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = sintime
				timeoffset = 4.7121
				timerate = 0.25
			}
			{
				type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = sintime
				timeoffset = 4.7121
				timerate = 0.25
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			106
			149
			255
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -10.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			219
			161
			255
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -20.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			106
			149
			255
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 10.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			219
			161
			255
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -20.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			106
			149
			255
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 10.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			219
			161
			255
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 20.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			106
			149
			255
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -10.0
				spectrumband = 10
			}
		]
	}
	{
		type = circle
		pos = (-0.5, 0.5, 0.0)
		radius = 0.001
		color = [
			255
			245
			182
			255
		]
		blendmode = brighten
		thickness = 3.0
		controls = [
			{
				type = frequency_history
				response = deform
				scalemod = 300.0
				spectrumband = 2
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 4.0
		height = 0.5
		color = [
			178
			90
			255
			9
		]
		material = og_mat_flare_add
		blendmode = blend
		angle = 0
		angularvel = 0
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.95)
		color = [
			246
			244
			244
			247
		]
		angle = 0.0
		angularvel = 0
		blendmode = blend
		controls = [
		]
	}
]
