JOW_Viz_ChipLines = [
	{
		type = blendPrev
		offset = (0.0, -0.03)
		scale = (0.7, 1.5)
		Color = [
			255
			255
			255
			254
		]
		angle = 0.0
		angularVel = 0.0
		BlendMode = blend
		controls = [
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		length = 1.0
		Color = [
			38
			38
			38
			255
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = hueModulation
				scaleMod = 0.04
				responseFunc = sinTime
				timeRate = 0.17453298
			}
		]
	}
	{
		type = line
		Pos = (0.5, 1.0, 0.0)
		length = 1.0
		Color = [
			38
			38
			38
			255
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = hueModulation
				scaleMod = 0.04
				responseFunc = sinTime
				timeRate = 0.17453298
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.4, 0.0)
		length = -0.5
		Color = [
			77
			148
			255
			255
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 150.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.3
				player = 1
				gemColor = green
				fade = 0.5
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.6
				player = 1
				gemColor = red
				fade = 0.5
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.455
				player = 1
				gemColor = yellow
				fade = 0.5
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.53
				player = 1
				gemColor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.4, 0.0)
		length = -0.5
		Color = [
			77
			148
			255
			255
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -150.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.3
				player = 1
				gemColor = green
				fade = 0.5
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.6
				player = 1
				gemColor = red
				fade = 0.5
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.455
				player = 1
				gemColor = yellow
				fade = 0.5
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.53
				player = 1
				gemColor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.4, 0.0)
		length = 0.5
		Color = [
			77
			148
			255
			255
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 150.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.3
				player = 1
				gemColor = green
				fade = 0.5
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.6
				player = 1
				gemColor = red
				fade = 0.5
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.455
				player = 1
				gemColor = yellow
				fade = 0.5
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.53
				player = 1
				gemColor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.4, 0.0)
		length = 0.5
		Color = [
			77
			148
			255
			255
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -150.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.3
				player = 1
				gemColor = green
				fade = 0.5
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.6
				player = 1
				gemColor = red
				fade = 0.5
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.455
				player = 1
				gemColor = yellow
				fade = 0.5
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.53
				player = 1
				gemColor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = -1.0
		Color = [
			252
			255
			255
			255
		]
		BlendMode = blend
		thickness = 0.5
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.2
				player = 2
				gemColor = green
				fade = 0.2
			}
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = 250.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = saturationModulation
				scaleMod = 0.5
				player = 2
				fade = 0.2
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.5
				player = 2
				gemColor = red
				fade = 0.2
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.35000002
				player = 2
				gemColor = yellow
				fade = 0.2
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.43
				player = 2
				gemColor = orange
				fade = 0.2
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = -1.0
		Color = [
			252
			255
			255
			255
		]
		BlendMode = blend
		thickness = 0.5
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.2
				player = 2
				gemColor = green
				fade = 0.2
			}
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = -250.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = saturationModulation
				scaleMod = 0.5
				player = 2
				fade = 0.2
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.5
				player = 2
				gemColor = red
				fade = 0.2
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.35000002
				player = 2
				gemColor = yellow
				fade = 0.2
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.43
				player = 2
				gemColor = orange
				fade = 0.2
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 1.8, 0.0)
		nPoints = 5
		radius = 0.8
		radius2 = 0.6
		Color = [
			94
			94
			94
			0
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0.628319
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 3
				fade = 0.5
			}
			{
				type = noteHit
				response = redModulation
				scaleMod = 0.3
				player = 3
				fade = 0.5
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 1.8, 0.0)
		nPoints = 5
		radius = 0.8
		radius2 = 0.55
		Color = [
			94
			94
			94
			0
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0.628319
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 4
				fade = 0.5
			}
			{
				type = noteHit
				response = greenModulation
				scaleMod = 0.3
				player = 4
				fade = 0.5
			}
		]
	}
]
