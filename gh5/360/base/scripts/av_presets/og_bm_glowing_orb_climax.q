og_bm_glowing_orb_climax = [
	{
		Type = sprite
		Pos = (0.5, 0.5)
		Scale = (1.0, 1.0)
		width = 0.25
		height = 0.1
		Color = [
			61
			58
			42
			255
		]
		material = og_mat_flare_add
		BlendMode = add
		angle = 0
		angularvel = -2.0944
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.25
				responsefunc = sintime
				timerate = 2.0
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.5
				responsefunc = costime
				timerate = 2.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.258
		Color = [
			81
			76
			24
			255
		]
		BlendMode = brighten
		thickness = 10.0
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		length = 0.025
		InnerRadius = 0.25
		outerradius = 0.5
		Color = [
			123
			115
			87
			255
		]
		material = og_mat_flare_add
		BlendMode = blend
		thickness = 100.0
		angularvel = 1.7453301
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 13
		radius = 0.25
		radius2 = 1.0
		Color = [
			0
			255
			18
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 0.872665
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			28
			23
			15
			255
		]
		material = og_mat_sphere_sub
		BlendMode = blend
		angle = 0
		angularvel = 0.17453298
		controls = [
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = -0.52
		height = -0.52
		Color = [
			30
			40
			22
			63
		]
		material = og_mat_sphere_b_add
		BlendMode = blend
		angle = 0
		angularvel = -0.349066
		controls = [
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.51
		height = 0.51
		Color = [
			40
			34
			34
			127
		]
		material = og_mat_sphere_add
		BlendMode = blend
		angle = 0
		angularvel = 0.523599
		controls = [
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.55
		height = 0.55
		Color = [
			101
			61
			0
			31
		]
		material = og_mat_sphere_blend
		BlendMode = blend
		angle = 0
		angularvel = 0.523599
		controls = [
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (0.75, 0.75)
		width = 0.4
		height = 0.5
		Color = [
			73
			73
			73
			0
		]
		material = og_mat_bm_01_blend
		BlendMode = blend
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = alphamodulation
				scalemod = 2.0
				responsefunc = sintime
				timerate = 0.25
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.25
			}
			{
				Type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.25
			}
		]
	}
	{
		Type = sprite
		Pos = (0.35000002, 0.45000002)
		Scale = (0.5, 0.5)
		width = 0.55
		height = 0.5
		Color = [
			64
			64
			63
			0
		]
		material = og_mat_bm_02_blend
		BlendMode = blend
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = alphamodulation
				scalemod = 0.8
				responsefunc = sintime
				timeoffset = 1.5707
				timerate = 0.25
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.35000002
				responsefunc = sintime
				timeoffset = 1.5707
				timerate = 0.25
			}
			{
				Type = constant
				response = scalex
				scalemod = 0.35000002
				responsefunc = sintime
				timeoffset = 1.5707
				timerate = 0.25
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.35000002)
		Scale = (0.5, 0.5)
		width = 0.55
		height = 0.5
		Color = [
			44
			44
			44
			0
		]
		material = og_mat_bm_03
		BlendMode = blend
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = alphamodulation
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 3.1399999
				timerate = 0.25
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 3.1399999
				timerate = 0.25
			}
			{
				Type = constant
				response = scalex
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 3.1399999
				timerate = 0.25
			}
		]
	}
	{
		Type = sprite
		Pos = (0.4, 0.35000002)
		Scale = (0.5, 0.5)
		width = 0.35000002
		height = 0.5
		Color = [
			64
			51
			24
			0
		]
		material = og_mat_bm_04
		BlendMode = blend
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = alphamodulation
				scalemod = 0.25
				responsefunc = sintime
				timeoffset = 4.7121
				timerate = 0.25
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = sintime
				timeoffset = 4.7121
				timerate = 0.25
			}
			{
				Type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = sintime
				timeoffset = 4.7121
				timerate = 0.25
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -10.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -20.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 10.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -20.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 10.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 20.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -10.0
				spectrumband = 10
			}
		]
	}
	{
		Type = circle
		Pos = (-0.5, 0.5, 0.0)
		radius = 0.001
		Color = [
			255
			245
			182
			255
		]
		BlendMode = brighten
		thickness = 3.0
		controls = [
			{
				Type = frequency_history
				response = deform
				scalemod = 300.0
				spectrumband = 2
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 4.0
		height = 0.5
		Color = [
			178
			90
			255
			9
		]
		material = og_mat_flare_add
		BlendMode = blend
		angle = 0
		angularvel = 0
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 0.95)
		Color = [
			246
			244
			244
			247
		]
		angle = 0.0
		angularvel = 0
		BlendMode = blend
		controls = [
		]
	}
]
