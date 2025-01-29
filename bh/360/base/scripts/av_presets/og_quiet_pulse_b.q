OG_Quiet_Pulse_B = [
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
		angle = 0.00872665
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
			204
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
				scaleMod = 200.0
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
		radius = 0.1
		Color = [
			62
			62
			62
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
				scaleMod = 0.1
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
			62
			62
			62
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
				scaleMod = 0.1
				responseFunc = cosTime
				timeRate = 1.0472
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 6
		radius = 0.0
		radius2 = 0.2
		Color = [
			62
			62
			62
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 3.1415896
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
				type = constant
				response = radiusScale
				scaleMod = 0.1
				responseFunc = sinTime
				timeOffset = 3.1415896
				timeRate = 2.0944
			}
			{
				type = constant
				response = radius2Scale
				scaleMod = 0.1
				responseFunc = cosTime
				timeRate = 2.26893
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
			204
		]
		BlendMode = blend
		thickness = 1.0
		angle = 3.1415896
		angularVel = 0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.05
				responseFunc = cosTime
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.025
				responseFunc = sinTime
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
				responseFunc = cosTime
				timeRate = 0.523599
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.25
		height = 0.25
		Color = [
			255
			255
			255
			2
		]
		material = OG_Mat_Sphere_Add
		angle = 0
		angularVel = -3.1415896
		controls = [
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 0.5
				fade = 0.01
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Sphere_B_Sub
		angle = 0
		angularVel = 1.93732
		controls = [
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 0.2
				fade = 0.01
			}
		]
	}
]
