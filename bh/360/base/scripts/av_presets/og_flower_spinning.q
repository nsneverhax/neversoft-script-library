OG_Flower_Spinning = [
	{
		type = sprite
		Pos = (0.5, 0.1)
		scale = (1.0, 1.0)
		width = 0.125
		height = 0.125
		Color = [
			75
			17
			70
			255
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = offsetY
				scaleMod = 0.5
				responseFunc = sinTime
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.001)
		scale = (1.001, 1.001)
		Color = [
			253
			252
			255
			255
		]
		angle = -0.0349066
		angularVel = 0
		BlendMode = blend
	}
	{
		type = sprite
		Pos = (0.5, 0.1)
		scale = (1.0, 1.0)
		width = 0.125
		height = 0.125
		Color = [
			99
			47
			47
			255
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = offsetY
				scaleMod = 0.5
				responseFunc = sinTime
				timeOffset = 3.1399999
			}
		]
	}
]
