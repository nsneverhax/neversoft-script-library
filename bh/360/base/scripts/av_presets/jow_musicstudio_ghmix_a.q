JOW_MusicStudio_GHMix_A = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.1, 1.0)
		Color = [
			255
			255
			255
			254
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (0.05, 0.5, 0.0)
		length = 1.0
		Color = [
			174
			164
			131
			29
		]
		BlendMode = blend
		thickness = 7.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.04
				responseFunc = sinTime
				timeRate = 0.523599
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.04
				responseFunc = sinTime
				timeRate = 0.523599
			}
		]
	}
	{
		type = line
		Pos = (0.95, 0.5, 0.0)
		length = 1.0
		Color = [
			174
			164
			131
			29
		]
		BlendMode = blend
		thickness = 7.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.04
				responseFunc = sinTime
				timeRate = 0.523599
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.04
				responseFunc = sinTime
				timeRate = 0.523599
			}
		]
	}
	{
		type = nStar2
		Pos = (0.3, 0.3, 0.0)
		nPoints = 19
		radius = 0.15
		radius2 = 1.5
		Color = [
			0
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0.0698132
		controls = [
			{
				type = constant
				response = alphaModulation
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 0.872665
			}
			{
				type = constant
				response = hueModulation
				scaleMod = 0.1
				responseFunc = sinTime
				timeRate = 0.872665
			}
			{
				type = constant
				response = hueModulation
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 1.5708001
			}
		]
	}
	{
		type = nStar2
		Pos = (0.7, 0.7, 0.0)
		nPoints = 7
		radius = 0.15
		radius2 = 1.5
		Color = [
			87
			117
			117
			124
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0.0698132
		controls = [
			{
				type = constant
				response = alphaModulation
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 0.872665
			}
			{
				type = constant
				response = hueModulation
				scaleMod = 0.1
				responseFunc = sinTime
				timeRate = 0.872665
			}
		]
	}
]
