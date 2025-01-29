OG_LHC_Wash = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		Color = [
			255
			247
			254
			254
		]
		angle = 0.0
		angularVel = 0
		BlendMode = blend
		controls = [
			{
				type = beatOn
				response = redModulation
				scaleMod = -0.5
				fade = 0.025
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.01
		Color = [
			255
			233
			174
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.2
				responseFunc = sinTime
				timeRate = 0.69813204
			}
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = 500.0
				spectrumBand = 10
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 8
		radius = 0.1
		radius2 = 0.5
		Color = [
			172
			255
			253
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0.872665
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 9
		radius = 0.1
		radius2 = 0.5
		Color = [
			172
			255
			253
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = -0.872665
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.01
		Color = [
			255
			233
			174
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.2
				responseFunc = sinTime
				timeOffset = 1.5708001
				timeRate = 0.69813204
			}
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = 500.0
				spectrumBand = 10
			}
			{
				type = constant
				response = angleMod
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 1.0472
			}
		]
	}
]
