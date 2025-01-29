og_circles_trail_symmetry_spin = [
	{
		Type = blendprev
		offset = (0.0, -0.01)
		Scale = (-0.95, 1.01)
		Color = [
			255
			255
			255
			229
		]
		angle = 0.0
		angularvel = 0.0872665
		BlendMode = add
		controls = [
			{
				Type = beaton
				response = angularvelmod
				scalemod = 4.36332
				fade = 0.5
			}
		]
	}
	{
		Type = circle
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
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 50.0
				responsefunc = log10
				spectrumband = 10
			}
			{
				Type = frequency
				response = greenmodulation
				scalemod = 0.5
				spectrumband = 20
			}
			{
				Type = frequency
				response = redmodulation
				scalemod = 0.5
				spectrumband = 10
			}
			{
				Type = frequency
				response = bluemodulation
				scalemod = 0.5
				spectrumband = 15
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			255
			255
			255
			0
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.1
				Player = 1
				fade = 1.0
			}
		]
	}
	{
		Type = circle
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
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 50.0
				responsefunc = log10
				spectrumband = 10
			}
		]
	}
]
