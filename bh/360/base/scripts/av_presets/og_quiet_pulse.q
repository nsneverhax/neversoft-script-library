OG_Quiet_Pulse = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.97999996, 0.97999996)
		Color = [
			249
			255
			255
			255
		]
		angle = 0.0174533
		angularVel = 0.0
		BlendMode = blend
		controls = [
			{
				type = constant
				response = hueModulation
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 0.523599
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.015
		Color = [
			128
			114
			97
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.05
				responseFunc = sinTime
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.025
				responseFunc = cosTime
			}
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = 100.0
				spectrumBand = 10
			}
			{
				type = constant
				response = brightnessModulation
				scaleMod = 0.8
				responseFunc = sinTime
				timeRate = 0.523599
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.258
		Color = [
			127
			127
			127
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 1.0646498
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.15
		Color = [
			117
			117
			117
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.5
				responseFunc = cosTime
				timeRate = 1.0472
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 6
		radius = 0.25
		radius2 = 0.5
		Color = [
			123
			123
			123
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 3.1415896
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.5
				responseFunc = sinTime
				timeOffset = 3.1415896
				timeRate = 2.0944
			}
			{
				type = constant
				response = radius2Scale
				scaleMod = 0.5
				responseFunc = cosTime
				timeRate = 2.0944
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.05
				responseFunc = sinTime
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.025
				responseFunc = cosTime
			}
		]
	}
]
