JOW_Jam_4P_ElectricTunnel = [
	{
		type = blendPrev
		offset = (0.0, 0.007)
		scale = (0.95, 0.92999995)
		Color = [
			217
			217
			217
			254
		]
		angle = 0.0
		angularVel = 0.0
		BlendMode = blend
		controls = [
			{
				type = frequency
				response = scaleX
				scaleMod = -0.04
				spectrumBand = 0
			}
		]
	}
	{
		type = nStar2
		Pos = (0.45000002, 0.4, 0.0)
		nPoints = 4
		radius = 0.049
		radius2 = 0.07
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
		thickness = 3.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				response = greenModulation
				scaleMod = -0.8
				player = 2
				fade = 0.1
			}
			{
				type = noteHit
				response = blueModulation
				scaleMod = -0.8
				player = 2
				fade = 0.1
			}
			{
				type = frequency
				response = angularVelMod
				scaleMod = 0.0
				spectrumBand = 0
			}
			{
				type = beatOn
				response = radiusScale
				scaleMod = 0.04
				fade = 0.1
			}
		]
	}
	{
		type = nStar2
		Pos = (0.55, 0.4, 0.0)
		nPoints = 4
		radius = 0.049
		radius2 = 0.07
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
		thickness = 3.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				response = greenModulation
				scaleMod = -0.8
				player = 2
				fade = 0.1
			}
			{
				type = noteHit
				response = blueModulation
				scaleMod = -0.8
				player = 2
				fade = 0.1
			}
			{
				type = frequency
				response = angularVelMod
				scaleMod = 0.0
				spectrumBand = 0
			}
			{
				type = beatOn
				response = radiusScale
				scaleMod = 0.04
				fade = 0.1
			}
		]
	}
	{
		type = line
		Pos = (0.48000002, 0.5, 0.0)
		length = 1.0
		Color = [
			115
			255
			62
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 1.5708001
		angularVel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 200.0
			}
		]
	}
	{
		type = line
		Pos = (0.52, 0.5, 0.0)
		length = 1.0
		Color = [
			115
			255
			62
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = -200.0
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			115
			255
			62
			255
		]
		BlendMode = brighten
		thickness = 4.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 3
				fade = 0.2
			}
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 4
				fade = 0.2
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.1
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularVel = 0.43633202
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 2
				fade = 0.1
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			115
			255
			62
			255
		]
		BlendMode = brighten
		thickness = 4.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 3
				fade = 0.2
			}
			{
				type = frequency
				response = deform
				scaleMod = -200.0
				spectrumBand = 0
			}
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 4
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.38000003)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		Color = [
			128
			28
			25
			0
		]
		material = JOW_Mat_Star01_Add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.33
				player = 1
				gemColor = green
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.63
				player = 1
				gemColor = blue
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.09
				player = 1
				gemColor = orange
				fade = 0.1
			}
		]
	}
]
