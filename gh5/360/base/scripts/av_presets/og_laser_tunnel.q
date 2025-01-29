og_laser_tunnel = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.97999996, 0.97999996)
		Color = [
			248
			255
			254
			255
		]
		angle = 0.000872665
		angularvel = 0
		BlendMode = add
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		Color = [
			255
			255
			255
			255
		]
		material = og_mat_rays_a
		angle = 0
		angularvel = 18.849602
		controls = [
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		Color = [
			255
			255
			255
			255
		]
		material = og_mat_rays_b
		angle = 0
		angularvel = -8.90118
		controls = [
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.5
		Color = [
			68
			68
			68
			22
		]
		BlendMode = subtract
		thickness = 3.0
		angle = 0
		angularvel = 174.533
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			255
			255
			255
			3
		]
		material = og_mat_lenzflare_add
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				Type = beaton
				response = alphamodulation
				scalemod = 0.065
				fade = 0.1
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.5
		Color = [
			255
			75
			75
			86
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.17453298
			}
		]
	}
]
