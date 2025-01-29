JOW_Jam_4P_MusicStaff = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		Color = [
			224
			190
			153
			255
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = sprite
		Pos = (0.7, 0.3)
		scale = (1.0, 1.0)
		width = 0.6
		height = 1.2
		Color = [
			5
			24
			51
			51
		]
		material = JOW_Mat_TrebleCleff01_Add
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 0.1
				player = 4
				fade = 0.5
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		length = 1.0
		Color = [
			51
			51
			51
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 60.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = redModulation
				scaleMod = 0.7
				player = 1
				gemColor = red
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		Pos = (0.25, 0.8)
		scale = (1.0, 1.0)
		width = 0.6
		height = 1.2
		Color = [
			5
			24
			51
			51
		]
		material = JOW_Mat_TrebleCleff01_Add
		angle = -0.523599
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 0.1
				player = 4
				fade = 0.5
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		length = 1.0
		Color = [
			51
			51
			51
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 60.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = redModulation
				scaleMod = 0.7
				player = 1
				gemColor = yellow
				fade = 0.5
			}
			{
				type = noteHit
				response = greenModulation
				scaleMod = 0.7
				player = 1
				gemColor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		length = 1.0
		Color = [
			51
			51
			51
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 60.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = greenModulation
				scaleMod = 0.7
				player = 1
				gemColor = green
				fade = 0.5
			}
			{
				type = noteHit
				response = redModulation
				scaleMod = 0.25
				player = 1
				gemColor = green
				fade = 0.5
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.4, 0.0)
		length = 1.0
		Color = [
			51
			51
			51
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 60.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = blueModulation
				scaleMod = 0.7
				player = 1
				gemColor = blue
				fade = 0.5
			}
			{
				type = noteHit
				response = greenModulation
				scaleMod = 0.35000002
				player = 1
				gemColor = blue
				fade = 0.5
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		length = 1.0
		Color = [
			51
			51
			51
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 60.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = redModulation
				scaleMod = 0.7
				player = 1
				gemColor = orange
				fade = 0.5
			}
			{
				type = noteHit
				response = greenModulation
				scaleMod = 0.35000002
				player = 1
				gemColor = orange
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		Pos = (0.6, 0.35000002)
		scale = (1.0, 1.0)
		width = 0.06
		height = 0.120000005
		Color = [
			0
			0
			0
			255
		]
		material = JOW_Mat_MusicNote01_Brighten
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 0.6
				player = 2
				fade = 0.2
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.25
				responseFunc = sinTime
				timeOffset = 0.00061086507
				timeRate = 0.69813204
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.1
				responseFunc = cosTime
				timeOffset = 0.0296706
				timeRate = 1.2217301
			}
		]
	}
	{
		type = sprite
		Pos = (0.6, 0.35000002)
		scale = (1.0, 1.0)
		width = 0.06
		height = 0.120000005
		Color = [
			0
			0
			0
			255
		]
		material = JOW_Mat_MusicNote01_Brighten
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 0.6
				player = 2
				fade = 0.2
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.25
				responseFunc = sinTime
				timeOffset = 0.00820305
				timeRate = 0.837758
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.1
				responseFunc = cosTime
				timeOffset = 0.019198598
				timeRate = 1.0472
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.3, 0.0)
		nPoints = 5
		radius = 0.120000005
		radius2 = 0.138
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0.0
		angularVel = 0.2
		controls = [
			{
				type = frequency
				response = radius2Scale
				scaleMod = 0.2
				spectrumBand = 0
			}
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 3
				fade = 0.2
			}
		]
	}
	{
		type = nStar2
		Pos = (0.29299998, 0.515, 0.0)
		nPoints = 5
		radius = 0.120000005
		radius2 = 0.138
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularVel = -0.4
		controls = [
			{
				type = frequency
				response = radius2Scale
				scaleMod = 0.2
				spectrumBand = 0
			}
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 3
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		Pos = (0.15, 0.35000002)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.3
		Color = [
			95
			99
			102
			45
		]
		material = JOW_Mat_TrebleCleff01_Blend
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.03
				responseFunc = sinTime
				timeRate = 0.78539795
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.02
				responseFunc = cosTime
				timeRate = 0.78539795
			}
			{
				type = constant
				response = scaleXY
				scaleMod = 0.1
				responseFunc = cosTime
				timeRate = 0.523599
			}
			{
				type = constant
				response = brightnessModulation
				scaleMod = 0.2
				responseFunc = cosTime
				timeRate = 0.523599
			}
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 0.2
				player = 4
				fade = 0.5
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.5
				player = 4
				fade = 0.5
			}
		]
	}
	{
		type = nStar2
		Pos = (0.707, 0.515, 0.0)
		nPoints = 5
		radius = 0.120000005
		radius2 = 0.138
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularVel = -0.4
		controls = [
			{
				type = frequency
				response = radius2Scale
				scaleMod = 0.2
				spectrumBand = 0
			}
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 3
				fade = 0.2
			}
		]
	}
	{
		type = nStar2
		Pos = (0.085999995, 0.3, 0.0)
		nPoints = 5
		radius = 0.120000005
		radius2 = 0.138
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0.0
		angularVel = 0.2
		controls = [
			{
				type = frequency
				response = radius2Scale
				scaleMod = 0.2
				spectrumBand = 0
			}
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 3
				fade = 0.2
			}
		]
	}
	{
		type = nStar2
		Pos = (0.914, 0.3, 0.0)
		nPoints = 5
		radius = 0.120000005
		radius2 = 0.138
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0.0
		angularVel = 0.2
		controls = [
			{
				type = frequency
				response = radius2Scale
				scaleMod = 0.2
				spectrumBand = 0
			}
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 3
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		Pos = (0.6, 0.35000002)
		scale = (1.0, 1.0)
		width = 0.06
		height = 0.120000005
		Color = [
			0
			0
			0
			255
		]
		material = JOW_Mat_MusicNote01_Brighten
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 0.6
				player = 1
				fade = 0.2
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 0.78539795
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.1
				responseFunc = cosTime
				timeRate = 1.1344599
			}
		]
	}
]
