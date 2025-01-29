OG_Jam_1Player_ColorHorizon = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (-1.01, 0.95)
		Color = [
			225
			208
			249
			255
		]
		angle = 0.0349066
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
		controls = [
		]
	}
	{
		type = line
		Pos = (-0.1, 0.49, 0.0)
		length = 2.0
		Color = [
			255
			0
			0
			0
		]
		BlendMode = add
		thickness = 10.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = red
				fade = 1.0
			}
			{
				type = frequency
				response = deform
				scaleMod = -2000.0
				spectrumBand = 15
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.48000002, 0.0)
		length = 2.0
		Color = [
			141
			255
			0
			0
		]
		BlendMode = add
		thickness = 10.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = green
				fade = 1.0
			}
			{
				type = frequency
				response = deform
				scaleMod = -2000.0
				spectrumBand = 10
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (-0.9, 12.0)
		Color = [
			255
			200
			200
			1
		]
		angle = 1.5708001
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (-0.25, 0.5, 0.0)
		length = 2.0
		Color = [
			255
			255
			0
			0
		]
		BlendMode = add
		thickness = 10.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = yellow
				fade = 1.0
			}
			{
				type = frequency
				response = jitterDeform
				scaleMod = 2000.0
				spectrumBand = 20
			}
		]
	}
	{
		type = line
		Pos = (-0.3, 0.51, 0.0)
		length = 2.0
		Color = [
			0
			107
			255
			0
		]
		BlendMode = add
		thickness = 10.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = blue
				fade = 1.0
			}
			{
				type = frequency
				response = deform
				scaleMod = 2000.0
				spectrumBand = 25
			}
		]
	}
	{
		type = line
		Pos = (-0.5, 0.52, 0.0)
		length = 2.0
		Color = [
			255
			132
			0
			0
		]
		BlendMode = add
		thickness = 10.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 250.0
				player = 1
				gemColor = orange
				fade = 1.0
			}
			{
				type = frequency
				response = deform
				scaleMod = 2000.0
				spectrumBand = 30
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.0125
		Color = [
			255
			255
			255
			0
		]
		BlendMode = add
		thickness = 1.0
		controls = [
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scaleMod = 500.0
			}
		]
	}
]
