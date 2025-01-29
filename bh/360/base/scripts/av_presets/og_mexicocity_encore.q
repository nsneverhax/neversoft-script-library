OG_Mexicocity_Encore = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.95, 0.95)
		Color = [
			222
			222
			222
			249
		]
		angle = 0
		angularVel = 0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = redModulation
				scaleMod = 0.5
				spectrumBand = 17
			}
			{
				type = frequency
				response = greenModulation
				scaleMod = 0.25
				spectrumBand = 20
			}
			{
				type = frequency
				response = blueModulation
				scaleMod = 0.5
				spectrumBand = 7
			}
		]
	}
	{
		type = nStar2
		Pos = (0.51, 0.45000002, 0.0)
		nPoints = 4
		radius = 0.0
		radius2 = 2.0
		Color = [
			31
			31
			31
			84
		]
		BlendMode = subtract
		thickness = 5.0
		angle = 0
		angularVel = 1.9198599
		controls = [
			{
				type = gamePaused
				response = alphaModulation
				scaleMod = -1.0
				fade = 1.0
			}
		]
	}
	{
		type = nStar2
		Pos = (0.51, 0.45000002, 0.0)
		nPoints = 4
		radius = 0.0
		radius2 = 2.0
		Color = [
			31
			31
			31
			84
		]
		BlendMode = subtract
		thickness = 5.0
		angle = 0
		angularVel = -1.65806
		controls = [
			{
				type = gamePaused
				response = alphaModulation
				scaleMod = -1.0
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			110
			110
			143
			127
		]
		material = OG_Mat_Mexicocity_Skull
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = redModulation
				scaleMod = 0.2
				spectrumBand = 10
			}
			{
				type = frequency
				response = greenModulation
				scaleMod = 0.2
				spectrumBand = 15
			}
			{
				type = frequency
				response = blueModulation
				scaleMod = 0.1
				spectrumBand = 5
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.05
				responseFunc = sinTime
				timeRate = 2.0944
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.1
				responseFunc = cosTime
				timeRate = 1.0472
			}
		]
	}
	{
		type = nStar2
		Pos = (0.51, 0.45000002, 0.0)
		nPoints = 4
		radius = 0.04
		radius2 = 2.0
		Color = [
			31
			31
			31
			255
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularVel = 1.7453301
		controls = [
			{
				type = gamePaused
				response = alphaModulation
				scaleMod = -1.0
				fade = 1.0
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.1
				responseFunc = cosTime
				timeRate = 1.0472
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.05
				responseFunc = sinTime
				timeRate = 2.0944
			}
		]
	}
	{
		type = nStar2
		Pos = (0.51, 0.45000002, 0.0)
		nPoints = 4
		radius = 0.04
		radius2 = 2.0
		Color = [
			31
			31
			31
			255
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularVel = -1.5708001
		controls = [
			{
				type = gamePaused
				response = alphaModulation
				scaleMod = -1.0
				fade = 1.0
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.05
				responseFunc = sinTime
				timeRate = 2.0944
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.1
				responseFunc = cosTime
				timeRate = 1.0472
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 2.0
		height = 2.0
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 0.1
				fade = 0.1
			}
		]
	}
]
