og_debug_freeform = [
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = History
				historytype = vocalsamplitude
				response = deform
				scalemod = 500.0
				spectrumband = 10
				responsefunc = sintime
				timerate = 30
			}
		]
	}
	{
		Type = blendprev
		offset = (0.001, 0.0)
		Scale = (1.0, 0.9)
		Color = [
			166
			104
			244
			204
		]
		angle = 0.0
		angularvel = 0
		BlendMode = add
	}
	{
		Type = line
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
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = jitterdeform
				scalemod = 500.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = jitterdeform
				scalemod = 400.0
				spectrumband = 10
			}
		]
	}
]
