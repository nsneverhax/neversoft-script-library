og_lhc_rising_a = [
	{
		Type = blendprev
		offset = (-0.0004, -0.0006)
		Scale = (0.99499995, 0.99499995)
		Color = [
			255
			253
			251
			244
		]
		angle = 0.0021816602
		angularvel = 0
		BlendMode = add
	}
	{
		Type = sprite
		Pos = (0.5, 0.5)
		Scale = (1.0, 1.0)
		width = 0.125
		height = 0.3
		Color = [
			103
			108
			149
			255
		]
		material = og_mat_flare_add
		BlendMode = add
		angle = 0
		angularvel = 6.28319
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.3
				responsefunc = sintime
				timerate = 20.0
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.6
				responsefunc = costime
				timerate = 20.0
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				Type = constant
				response = scalex
				scalemod = 0.5
				responsefunc = sintime
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		length = 0.0125
		InnerRadius = 0.25
		outerradius = 0.48000002
		Color = [
			123
			115
			87
			255
		]
		material = og_mat_flare_add
		BlendMode = blend
		thickness = 150.0
		angularvel = 17.453299
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 13
		radius = 0.0
		radius2 = 1.0
		Color = [
			15
			15
			15
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0.872665
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.6
		height = 0.6
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
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.3
		Color = [
			81
			48
			24
			255
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		length = 0.0125
		InnerRadius = 0.25
		outerradius = 0.48000002
		Color = [
			123
			115
			87
			255
		]
		material = og_mat_flare_add
		BlendMode = blend
		thickness = 140.0
		angularvel = -17.453299
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		Color = [
			112
			112
			112
			0
		]
		material = og_mat_flare_add
		BlendMode = blend
		angle = 0
		angularvel = 0.523599
		controls = [
			{
				Type = beaton
				response = alphamodulation
				scalemod = 10.0
				fade = 0.1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.2
		Color = [
			202
			120
			60
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 18.849602
		controls = [
			{
				Type = beaton
				response = radiusscale
				scalemod = 0.1
				fade = 0.1
			}
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 10
			}
		]
	}
]
