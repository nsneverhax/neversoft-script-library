OG_Highway = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.99499995, 0.99499995)
		Color = [
			255
			250
			233
			249
		]
		angle = 0.0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
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
		BlendMode = blend
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
		width = 0.7
		height = 0.5
		Color = [
			105
			105
			105
			148
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		angle = 0
		angularVel = 0.0
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.5, 1.0)
		width = 0.5
		height = 0.4
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_flare_sub
		BlendMode = blend
		angle = 0.052359905
		angularVel = 0.0
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.8, 1.5)
		width = 0.5
		height = 0.4
		Color = [
			72
			72
			72
			255
		]
		material = OG_Mat_Sphere_Sub
		BlendMode = blend
		angle = 0.0872665
		angularVel = 0.0
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (2.0, 2.0)
		width = -0.7
		height = -0.5
		Color = [
			55
			55
			55
			49
		]
		material = OG_Mat_Sphere_Add
		BlendMode = blend
		angle = 1.5708001
		angularVel = 0.0
	}
]
