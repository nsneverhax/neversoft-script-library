og_highway = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.99499995, 0.99499995)
		color = [
			255
			250
			233
			249
		]
		angle = 0.0
		angularvel = 0
		blendmode = blend
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		length = 0.38000003
		innerradius = 0.41
		outerradius = 0.4
		color = [
			255
			238
			180
			255
		]
		material = og_mat_flare_brighten
		blendmode = blend
		thickness = 100.0
		angularvel = 174.533
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 13
		radius = 0.0
		radius2 = 0.41
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.5
				responsefunc = sintime
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 13
		radius = 0.0
		radius2 = 0.41
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = -0.872665
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.5
				responsefunc = sintime
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (2.0, 2.0)
		width = 0.7
		height = 0.5
		color = [
			105
			105
			105
			148
		]
		material = og_mat_flare_add
		blendmode = blend
		angle = 0
		angularvel = 0.0
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.5, 1.0)
		width = 0.5
		height = 0.4
		color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_sub
		blendmode = blend
		angle = 0.052359905
		angularvel = 0.0
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.8, 1.5)
		width = 0.5
		height = 0.4
		color = [
			72
			72
			72
			255
		]
		material = og_mat_sphere_sub
		blendmode = blend
		angle = 0.0872665
		angularvel = 0.0
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (2.0, 2.0)
		width = -0.7
		height = -0.5
		color = [
			55
			55
			55
			49
		]
		material = og_mat_sphere_add
		blendmode = blend
		angle = 1.5708001
		angularvel = 0.0
	}
]
