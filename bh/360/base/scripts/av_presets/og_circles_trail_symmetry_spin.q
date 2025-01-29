OG_Circles_Trail_Symmetry_Spin = [
	{
		type = blendPrev
		offset = (0.0, -0.01)
		scale = (-0.95, 1.01)
		Color = [
			255
			255
			255
			229
		]
		angle = 0.0
		angularVel = 0.0872665
		BlendMode = add
		controls = [
			{
				type = beatOn
				response = angularVelMod
				scaleMod = 4.36332
				fade = 0.5
			}
		]
	}
	{
		type = circle
		Pos = (0.05, 0.25, 0.0)
		radius = 0.5
		Color = [
			31
			31
			63
			255
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 50.0
				responseFunc = log10
				spectrumBand = 10
			}
			{
				type = frequency
				response = greenModulation
				scaleMod = 0.5
				spectrumBand = 20
			}
			{
				type = frequency
				response = redModulation
				scaleMod = 0.5
				spectrumBand = 10
			}
			{
				type = frequency
				response = blueModulation
				scaleMod = 0.5
				spectrumBand = 15
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			255
			255
			255
			0
		]
		angle = 0.0
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.1
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.8, 0.5, 0.0)
		radius = 0.31
		Color = [
			114
			81
			52
			255
		]
		BlendMode = add
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 50.0
				responseFunc = log10
				spectrumBand = 10
			}
		]
	}
]
