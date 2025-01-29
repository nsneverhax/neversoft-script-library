OG_Laser_Tunnel = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.97999996, 0.97999996)
		Color = [
			248
			255
			254
			255
		]
		angle = 0.000872665
		angularVel = 0
		BlendMode = add
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_Rays_A
		angle = 0
		angularVel = 18.849602
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_Rays_B
		angle = 0
		angularVel = -8.90118
		controls = [
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 5
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
		angularVel = 174.533
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			255
			255
			255
			3
		]
		material = OG_Mat_LenzFlare_Add
		angle = 0
		angularVel = 0.872665
		controls = [
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 0.065
				fade = 0.1
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 5
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
		angularVel = 0.872665
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 0.17453298
			}
		]
	}
]
