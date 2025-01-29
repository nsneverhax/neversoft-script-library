OG_LHC_Rising_B = [
	{
		type = blendPrev
		offset = (-0.0004, -0.0006)
		scale = (0.99499995, 0.99499995)
		Color = [
			255
			251
			253
			242
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = sprite
		Pos = (0.5, 0.5)
		scale = (1.0, 1.0)
		width = 0.25
		height = 0.1
		Color = [
			149
			143
			103
			255
		]
		material = OG_Mat_Flare_add
		BlendMode = add
		angle = 0.0
		angularVel = -6.28319
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.2
				responseFunc = sinTime
				timeRate = 6.29
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.4
				responseFunc = cosTime
				timeRate = 6.29
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 6.29
			}
			{
				type = constant
				response = scaleX
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 6.29
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.2
		Color = [
			125
			124
			123
			255
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularVel = 0
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.02
		InnerRadius = 0.205
		outerRadius = 0.4
		Color = [
			123
			115
			87
			255
		]
		material = OG_Mat_Flare_Brighten
		BlendMode = blend
		thickness = 500.0
		angularVel = 15708.0
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 13
		radius = 0.01
		radius2 = 1.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 5.0
		angle = 0
		angularVel = 0.872665
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (0.8, 0.8)
		width = -0.52
		height = -0.52
		Color = [
			40
			40
			40
			63
		]
		material = OG_Mat_Sphere_B_Add
		BlendMode = blend
		angle = 0
		angularVel = -3.0194201
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (0.8, 0.8)
		width = 0.51
		height = 0.51
		Color = [
			40
			40
			40
			127
		]
		material = OG_Mat_Sphere_Add
		BlendMode = blend
		angle = 0
		angularVel = 4.76475
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.3, 1.3)
		width = 0.55
		height = 0.55
		Color = [
			101
			61
			0
			31
		]
		material = OG_Mat_Sphere_Blend
		BlendMode = blend
		angle = 0
		angularVel = 4.1364303
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			8
			8
			11
			255
		]
		material = OG_Mat_Sphere_Sub
		BlendMode = blend
		angle = 0
		angularVel = 1.51844
		controls = [
		]
	}
]
