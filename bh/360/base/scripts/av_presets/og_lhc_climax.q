OG_LHC_Climax = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.94, 0.94)
		Color = [
			242
			249
			255
			253
		]
		angle = 0.17453298
		angularVel = 0.0
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.4, 0.5, 0.0)
		length = 0.1
		Color = [
			165
			160
			249
			255
		]
		BlendMode = blend
		thickness = 10.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = lengthScale
				scaleMod = 0.2
				responseFunc = sinTime
				timeOffset = 1.5708001
				timeRate = 6.28319
			}
			{
				type = constant
				response = angleMod
				scaleMod = 0.8
				responseFunc = sinTime
				timeRate = 3.1415896
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.1
				responseFunc = sinTime
				timeRate = 1.0472
			}
		]
	}
	{
		type = line
		Pos = (0.6, 0.5, 0.0)
		length = 0.1
		Color = [
			165
			160
			249
			255
		]
		BlendMode = blend
		thickness = 10.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = lengthScale
				scaleMod = 0.2
				responseFunc = sinTime
				timeOffset = 1.5708001
				timeRate = 6.28319
			}
			{
				type = constant
				response = angleMod
				scaleMod = 0.8
				responseFunc = sinTime
				timeRate = 3.1415896
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.1
				responseFunc = sinTime
				timeOffset = 3.1415896
				timeRate = 1.0472
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 5.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.1
				responseFunc = sinTime
				timeOffset = 3.1415896
				timeRate = 0.872665
			}
			{
				type = frequency
				response = deform
				scaleMod = 1000.0
				spectrumBand = 10
			}
		]
	}
]
