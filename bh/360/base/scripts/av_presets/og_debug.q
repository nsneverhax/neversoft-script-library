OG_Debug = [
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		length = 0.9
		Color = [
			50
			150
			250
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 150
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.8, 0.0)
		length = 0.9
		Color = [
			250
			244
			203
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 150
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
		thickness = 5.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = lengthScale
				scaleMod = 0.9
				spectrumBand = 1
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.9
		Color = [
			96
			50
			250
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = jitterDeform
				scaleMod = 150
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		length = 1.0
		Color = [
			66
			0
			0
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularVel = 0
	}
]
