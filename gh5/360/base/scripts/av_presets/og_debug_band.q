og_debug_band = [
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = 0.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = lengthscale
				scalemod = 1.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.5
		Color = [
			255
			255
			255
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
				scalemod = -1000.0
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
			255
			255
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
				scalemod = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = lengthscale
				scalemod = 1.0
				spectrumband = 0
			}
		]
	}
]
