og_debug_deform = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.99899995, 0.99899995)
		Color = [
			249
			249
			249
			251
		]
		angle = 0.0
		angularvel = 0
		BlendMode = add
	}
	{
		Type = circle
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
				Type = frequency_history
				response = deform
				scalemod = 500.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 30.0
				spectrumband = 10
			}
		]
	}
	{
		Type = circle
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
				Type = frequency_history
				response = deform
				scalemod = 500.0
				spectrumband = 10
			}
		]
	}
]
