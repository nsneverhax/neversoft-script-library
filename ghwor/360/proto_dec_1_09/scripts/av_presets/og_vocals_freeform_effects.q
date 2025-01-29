og_vocals_freeform_effects = [
	{
		Type = blendprev
		offset = (-0.005, 0.0)
		Scale = (1.0, 1.1)
		Color = [
			202
			219
			244
			242
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
			219
			55
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = vocalsamplitude
				response = deform
				scalemod = 25.0
				responsefunc = sintime
				timerate = 13.9626
				Player = 1
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
				scalemod = 100.0
				spectrumband = 10
			}
		]
	}
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
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = vocalsamplitude
				response = deform
				scalemod = -25.0
				responsefunc = sintime
				timerate = 13.9626
				Player = 1
			}
		]
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
		thickness = 1.1
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
]
