og_laser_tunnel = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.97999996, 0.97999996)
		color = [
			248
			255
			254
			255
		]
		angle = 0.000872665
		angularvel = 0
		blendmode = add
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		color = [
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
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		color = [
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
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.5
		color = [
			68
			68
			68
			22
		]
		blendmode = subtract
		thickness = 3.0
		angle = 0
		angularvel = 174.533
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
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
				type = beaton
				response = alphamodulation
				scalemod = 0.065
				fade = 0.1
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.5
		color = [
			255
			75
			75
			86
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.17453298
			}
		]
	}
]
