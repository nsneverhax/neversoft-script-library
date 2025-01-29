og_circles_trail_symmetry = [
	{
		Type = blendprev
		offset = (0.01, 0.0)
		Scale = (-0.95, -1.1)
		Color = [
			255
			255
			255
			229
		]
		BlendMode = add
	}
	{
		Type = circle
		Pos = (0.75, 0.5, 0.0)
		radius = 0.5
		Color = [
			31
			31
			63
			255
		]
		BlendMode = add
		thickness = 3.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 10.0
				responsefunc = log10
				spectrumband = 10
			}
			{
				Type = frequency
				response = greenmodulation
				scalemod = 100.0
				spectrumband = 20
			}
			{
				Type = frequency
				response = redmodulation
				scalemod = 100.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = bluemodulation
				scalemod = 50.0
				spectrumband = 15
			}
		]
	}
	{
		Type = circle
		Pos = (0.25, 0.5, 0.0)
		radius = 0.1
		Color = [
			66
			84
			141
			127
		]
		BlendMode = diffuse
		thickness = 20.0
		controls = [
			{
				Type = notehit
				response = redmodulation
				scalemod = 1.0
				Player = 1
				gemcolor = red
				fade = 1.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.25
		Color = [
			207
			154
			143
			0
		]
		BlendMode = diffuse
		thickness = 15.0
		controls = [
			{
				Type = frequency
				response = alphamodulation
				scalemod = 20.0
				spectrumband = 10
			}
		]
	}
	{
		Type = circle
		Pos = (0.75, 0.5, 0.0)
		radius = 0.3
		Color = [
			114
			106
			98
			255
		]
		BlendMode = brighten
		thickness = 20.0
	}
	{
		Type = circle
		Pos = (0.125, 0.5, 0.0)
		radius = 0.05
		Color = [
			114
			105
			255
			255
		]
		BlendMode = add
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			130
			106
			255
			255
		]
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 50.0
				responsefunc = sinlog10
			}
		]
	}
]
