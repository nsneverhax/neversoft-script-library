OG_Debug_Deform = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.99899995, 0.99899995)
		Color = [
			249
			249
			249
			251
		]
		angle = 0.0
		angularVel = 0
		BlendMode = add
	}
	{
		type = circle
		Pos = (0.25, 0.5, 0.0)
		radius = 0.125
		Color = [
			73
			157
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		controls = [
			{
				type = frequency_History
				response = deform
				scaleMod = 500.0
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.5
		Color = [
			255
			174
			139
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
		]
	}
	{
		type = circle
		Pos = (0.75, 0.5, 0.0)
		radius = 0.125
		Color = [
			83
			73
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		controls = [
			{
				type = frequency_History
				response = deform
				scaleMod = 500.0
				spectrumBand = 10
			}
		]
	}
]
