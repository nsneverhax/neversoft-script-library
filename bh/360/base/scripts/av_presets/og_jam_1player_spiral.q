OG_Jam_1Player_Spiral = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.1, 0.98999995)
		Color = [
			242
			220
			249
			247
		]
		angle = 0.0
		angularVel = 0.0174533
		BlendMode = add
		controls = [
		]
	}
	{
		type = line
		Pos = (0.35000002, 0.5, 0.0)
		length = 0.5
		Color = [
			255
			187
			187
			20
		]
		BlendMode = blend
		thickness = 1.0
		angle = 2.0944
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 250.0
				player = 1
				gemColor = red
				fade = 1.0
			}
			{
				type = frequency
				response = deform
				scaleMod = -1000.0
				spectrumBand = 1
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = 0.5
		Color = [
			220
			255
			177
			14
		]
		BlendMode = add
		thickness = 1.0
		angle = 2.26893
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 250.0
				player = 1
				gemColor = green
				fade = 1.0
			}
			{
				type = frequency_History
				response = deform
				scaleMod = -1000.0
				spectrumBand = 10
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.9, 0.98999995)
		Color = [
			255
			255
			255
			255
		]
		angle = 0.0872665
		angularVel = 0
		BlendMode = brighten
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = -0.5
		Color = [
			255
			255
			172
			12
		]
		BlendMode = blend
		thickness = 1.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 250.0
				player = 1
				gemColor = yellow
				fade = 1.0
			}
			{
				type = frequency
				response = jitterDeform
				scaleMod = 1000.0
				spectrumBand = 11
			}
		]
	}
	{
		type = line
		Pos = (0.65000004, 0.5, 0.0)
		length = 0.5
		Color = [
			198
			222
			255
			16
		]
		BlendMode = blend
		thickness = 1.0
		angle = 1.0472
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 250.0
				player = 1
				gemColor = blue
				fade = 1.0
			}
			{
				type = frequency
				response = deform
				scaleMod = 1000.0
				spectrumBand = 11
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			255
			222
			171
			14
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0.872665
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
				scaleMod = 1000.0
				spectrumBand = 11
			}
		]
	}
]
