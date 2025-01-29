og_explosives_d = [
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.001
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 3.0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = -0.2
				Player = 1
				fade = 0.5
			}
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 10
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.1
		radius2 = 1.0
		Color = [
			46
			24
			24
			255
		]
		BlendMode = add
		thickness = 5.0
		angularvel = 0.872665
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 0.1
				responsefunc = log2
				spectrumband = 1
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.9, 0.9)
		Color = [
			246
			238
			255
			229
		]
		angle = 0.052359905
		BlendMode = blend
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		width = 0.5
		height = 0.5
		Color = [
			171
			122
			60
			255
		]
		material = og_mat_sphere_add
		angularvel = -0.54105204
	}
	{
		Type = sprite
		Pos = (0.5, 0.5)
		width = 1.0
		height = 1.0
		Color = [
			237
			231
			255
			204
		]
		material = og_mat_sphere_b_sub
		angularvel = 3.1415896
		controls = [
			{
				Type = notehit
				response = scalex
				scalemod = -0.8
				responsefunc = sinlog10
				Player = 1
				fade = 0.2
			}
			{
				Type = notehit
				response = scaley
				scalemod = -0.2
				responsefunc = sinlog10
				Player = 1
				fade = 0.2
			}
			{
				Type = constant
				response = scalex
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.523599
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.523599
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Color = [
			40
			5
			0
			254
		]
		angularvel = 6.28319
		BlendMode = subtract
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = -1.0
		radius2 = 0.1
		Color = [
			46
			24
			24
			255
		]
		BlendMode = add
		thickness = 5.0
		angularvel = 1.0472
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 0.1
				responsefunc = log2
				spectrumband = 1
			}
		]
	}
]
