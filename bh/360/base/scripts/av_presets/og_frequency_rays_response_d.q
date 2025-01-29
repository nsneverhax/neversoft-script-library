OG_Frequency_Rays_Response_D = [
	{
		type = blendPrev
		offset = (0.0, 0.001)
		scale = (-0.98999995, 0.98999995)
		Color = [
			218
			218
			218
			186
		]
		angle = 0.0
		angularVel = 0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = hueModulation
				scaleMod = 0.2
				spectrumBand = 5
			}
			{
				type = rockmeterstatus
				response = alphaModulation
				scaleMod = 0.5015
				player = 1
			}
			{
				type = notestreak
				response = alphaModulation
				scaleMod = 0.3
				player = 1
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 0.15
				player = 1
			}
			{
				type = starpowerstate
				response = greenModulation
				scaleMod = 0.15
				player = 1
			}
			{
				type = whammybarposition
				response = scaleXY
				scaleMod = -0.1
				player = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.35000002, 0.0)
		radius = 0.001
		Color = [
			163
			203
			222
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 500.0
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.4, 0.0)
		length = 0.5
		Color = [
			255
			246
			161
			0
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 10.0
				spectrumBand = 10
			}
			{
				type = multiplierstatus
				response = alphaModulation
				scaleMod = 1
				player = 1
			}
			{
				type = whammybarposition
				response = lengthScale
				scaleMod = -0.4
				player = 1
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.4, 0.0)
		length = 0.5
		Color = [
			173
			255
			117
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 30.0
				spectrumBand = 10
			}
			{
				type = rockmeterstatus
				response = alphaModulation
				scaleMod = 0.1
				player = 1
			}
			{
				type = whammybarposition
				response = lengthScale
				scaleMod = -0.4
				player = 1
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.4, 0.0)
		length = 0.5
		Color = [
			255
			99
			17
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 20.0
				spectrumBand = 10
			}
			{
				type = whammybarposition
				response = lengthScale
				scaleMod = -0.4
				player = 1
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.4, 0.0)
		length = 0.5
		Color = [
			57
			20
			20
			255
		]
		BlendMode = blend
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 50.0
				spectrumBand = 10
			}
			{
				type = starpoweramount
				response = alphaModulation
				scaleMod = 0.1
				player = 1
			}
			{
				type = whammybarposition
				response = lengthScale
				scaleMod = -0.4
				player = 1
			}
			{
				type = frequency
				response = redModulation
				scaleMod = 0.1
				spectrumBand = 10
			}
			{
				type = frequency
				response = greenModulation
				scaleMod = 0.1
				spectrumBand = 4
			}
			{
				type = frequency
				response = blueModulation
				scaleMod = 0.1
				spectrumBand = 8
			}
		]
	}
	{
		type = nStar2
		Pos = (0.25, 0.4, 0.0)
		nPoints = 19
		radius = 0.1
		radius2 = 1.0
		Color = [
			128
			128
			128
			255
		]
		BlendMode = subtract
		thickness = 5.0
		angle = 0
		angularVel = 0.523599
		controls = [
		]
	}
	{
		type = nStar2
		Pos = (0.25, 0.4, 0.0)
		nPoints = 19
		radius = 0.001
		radius2 = 0.5
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularVel = 1.7453301
		controls = [
		]
	}
	{
		type = circle
		Pos = (0.25, 0.4, 0.0)
		radius = 0.001
		Color = [
			255
			147
			117
			58
		]
		BlendMode = blend
		thickness = 20.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.2
				responseFunc = cosTime
				player = 1
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				responseFunc = cosTime
				player = 1
				fade = 1.0
			}
		]
	}
]
