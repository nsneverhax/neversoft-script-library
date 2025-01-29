og_highway = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.99499995, 0.99499995)
		Color = [
			255
			250
			233
			249
		]
		angle = 0.0
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		length = 0.38000003
		InnerRadius = 0.41
		outerradius = 0.4
		Color = [
			255
			238
			180
			255
		]
		material = og_mat_flare_brighten
		BlendMode = blend
		thickness = 100.0
		angularvel = 174.533
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 13
		radius = 0.0
		radius2 = 0.41
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
				Type = constant
				response = radiusscale
				scalemod = 0.5
				responsefunc = sintime
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 13
		radius = 0.0
		radius2 = 0.41
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = -0.872665
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.5
				responsefunc = sintime
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (2.0, 2.0)
		width = 0.7
		height = 0.5
		Color = [
			105
			105
			105
			148
		]
		material = og_mat_flare_add
		BlendMode = blend
		angle = 0
		angularvel = 0.0
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.5, 1.0)
		width = 0.5
		height = 0.4
		Color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_sub
		BlendMode = blend
		angle = 0.052359905
		angularvel = 0.0
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.8, 1.5)
		width = 0.5
		height = 0.4
		Color = [
			72
			72
			72
			255
		]
		material = og_mat_sphere_sub
		BlendMode = blend
		angle = 0.0872665
		angularvel = 0.0
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (2.0, 2.0)
		width = -0.7
		height = -0.5
		Color = [
			55
			55
			55
			49
		]
		material = og_mat_sphere_add
		BlendMode = blend
		angle = 1.5708001
		angularvel = 0.0
	}
]
