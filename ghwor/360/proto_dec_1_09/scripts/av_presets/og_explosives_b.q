og_explosives_b = [
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
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			40
			5
			0
			254
		]
		angle = 0.0
		angularvel = 6.28319
		BlendMode = subtract
	}
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
		angle = 0
		angularvel = 0
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
		angle = 0
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
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			171
			122
			60
			255
		]
		material = og_mat_sphere_add
		BlendMode = add
		angle = 0
		angularvel = -0.54105204
	}
	{
		Type = sprite
		Pos = (0.5, 0.5)
		Scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		Color = [
			128
			96
			235
			204
		]
		material = og_mat_sphere_b_sub
		BlendMode = add
		angle = 0
		angularvel = 0.523599
		controls = [
			{
				Type = beaton
				response = scalex
				scalemod = -1.0
				fade = 0.5
			}
			{
				Type = beaton
				response = scaley
				scalemod = 0.2
				fade = 0.5
			}
		]
	}
]
