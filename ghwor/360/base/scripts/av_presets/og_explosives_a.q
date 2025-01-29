og_explosives_a = [
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
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		width = 0.3
		height = 0.3
		Color = [
			44
			31
			57
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
			128
			96
			235
			204
		]
		material = og_mat_sphere_b_sub
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
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.0
		radius2 = 1.0
		Color = [
			125
			207
			255
			161
		]
		thickness = 4.0
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
]
