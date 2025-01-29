og_debug = [
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 150
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = waveform
				response = deform
				scalemod = 150
			}
		]
	}
	{
		Type = line
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
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = lengthscale
				scalemod = 0.9
				spectrumband = 1
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = jitterdeform
				scalemod = 150
			}
		]
	}
	{
		Type = line
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
		angularvel = 0
	}
]
