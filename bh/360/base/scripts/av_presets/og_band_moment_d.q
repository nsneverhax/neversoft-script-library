OG_Band_Moment_D = [
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.5
		Color = [
			125
			124
			123
			255
		]
		BlendMode = brighten
		thickness = 5.0
		angle = 0
		angularVel = 0
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.38000003
		InnerRadius = 0.41
		outerRadius = 0.4
		Color = [
			255
			238
			180
			255
		]
		material = OG_Mat_Flare_Brighten
		thickness = 100.0
		angularVel = 174.533
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 13
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
		angularVel = 0.872665
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.5
				responseFunc = sinTime
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.99499995, 0.99499995)
		Color = [
			255
			251
			229
			253
		]
		angle = 0.0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 13
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
		angularVel = -0.872665
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.5
				responseFunc = sinTime
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (2.0, 2.0)
		width = 0.5
		height = 0.5
		Color = [
			105
			105
			105
			148
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0.872665
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.5, 1.0)
		width = 0.4
		height = 0.4
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_flare_sub
		angle = 0.052359905
		angularVel = 0.0
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.8, 1.5)
		width = 0.455
		height = 0.4
		Color = [
			72
			72
			72
			255
		]
		material = OG_Mat_Sphere_Sub
		angle = 0.0872665
		angularVel = 0.0
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (2.0, 2.0)
		width = -0.4
		height = -0.5
		Color = [
			55
			55
			55
			49
		]
		material = OG_Mat_Sphere_Add
		angle = 1.5708001
		angularVel = -3.1415896
	}
]
