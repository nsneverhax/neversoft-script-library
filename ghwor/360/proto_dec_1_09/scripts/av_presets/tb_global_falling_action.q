tb_global_falling_action = [
	{
		Type = blendprev
		offset = (0.0, 0.001)
		Scale = (0.98999995, 1.015)
		Color = [
			255
			255
			255
			254
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = blend
		controls = [
		]
	}
	{
		Type = line
		Pos = (0.5, 0.0, 0.0)
		length = 1.0
		Color = [
			235
			186
			51
			229
		]
		BlendMode = blend
		thickness = 12.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = redmodulation
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.0349066
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.0, 0.0)
		length = 1.0
		Color = [
			235
			186
			51
			229
		]
		BlendMode = blend
		thickness = 12.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = redmodulation
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.0349066
			}
		]
	}
	{
		Type = line
		Pos = (0.0, 1.0, 0.0)
		length = 2.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 8.0
		angle = 0.0
		angularvel = 25.0
		controls = [
		]
	}
	{
		Type = line
		Pos = (1.0, 1.0, 0.0)
		length = 2.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 8.0
		angle = 0.0
		angularvel = -25.0
		controls = [
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.4, 0.1, 0.0)
		Scale = (1.0, 1.0)
		length = 0.25
		InnerRadius = 0.05
		outerradius = 0.35000002
		Color = [
			255
			88
			0
			255
		]
		material = og_mat_flare_add
		thickness = 90.0
		angularvel = 1.7453301
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.4
				responsefunc = costime
				timerate = 10.471999
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.2, 0.0)
		Scale = (0.75, 0.75)
		length = 0.25
		InnerRadius = 0.15
		outerradius = 0.45000002
		Color = [
			255
			88
			0
			255
		]
		material = og_mat_flare_add
		thickness = 90.0
		angularvel = -1.7453301
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.4
				responsefunc = costime
				timerate = 10.471999
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.6, 0.1, 0.0)
		Scale = (0.5, 0.5)
		length = 0.25
		InnerRadius = 0.05
		outerradius = 0.25
		Color = [
			255
			88
			0
			255
		]
		material = og_mat_flare_add
		thickness = 90.0
		angularvel = -1.7453301
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.4
				responsefunc = costime
				timerate = 10.471999
			}
		]
	}
]
