og_element_flare_chaos = [
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.01
		radius2 = 1.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 1.0
				responsefunc = log2
				spectrumband = 1
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.1
		radius2 = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 3.0
		angle = 0
		angularvel = 2.0944
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 0.5
				responsefunc = log2
				spectrumband = 1
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 0.98999995)
		Color = [
			255
			253
			242
			247
		]
		angle = 0
		angularvel = 0
		BlendMode = add
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			128
			96
			235
			255
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = 2.0944
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			128
			96
			235
			255
		]
		material = og_mat_sphere_sub
		angle = 0
		angularvel = 0.27925304
		controls = [
			{
				Type = notehit
				response = greenmodulation
				scalemod = 0.1
				Player = 1
				gemcolor = green
				fade = 0.25
			}
			{
				Type = frequency
				response = scalexy
				scalemod = -0.1
				spectrumband = 10
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
			205
			170
			148
			194
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = -1.7453301
		controls = [
			{
				Type = notehit
				response = redmodulation
				scalemod = 0.125
				Player = 1
				gemcolor = red
				fade = 1.0
			}
			{
				Type = frequency
				response = scalexy
				scalemod = 0.1
				spectrumband = 10
			}
		]
	}
]
