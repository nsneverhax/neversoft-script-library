OG_Debug_Freeform = [
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			219
			55
			255
		]
		BlendMode = add
		thickness = 3.0
		angle = 0.0
		angularVel = 0.0
		controls = [
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 5.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = jitterDeform
				scaleMod = 500.0
				spectrumBand = 10
			}
		]
	}
	{
		type = blendPrev
		offset = (0.001, 0.0)
		scale = (1.0, 0.9)
		Color = [
			166
			104
			244
			204
		]
		angle = 0.0
		angularVel = 0
		BlendMode = add
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = -1.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 5.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = jitterDeform
				scaleMod = 400.0
				spectrumBand = 10
			}
		]
	}
]
