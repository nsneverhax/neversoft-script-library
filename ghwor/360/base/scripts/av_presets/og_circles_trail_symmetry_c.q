og_circles_trail_symmetry_c = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (-0.98999995, 1.1)
		Color = [
			255
			255
			255
			254
		]
		BlendMode = add
		controls = [
			{
				Type = beaton
				response = alphamodulation
				scalemod = 0.1
				fade = 0.25
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
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 250.0
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
				scalemod = 0.25
				spectrumband = 15
			}
		]
	}
	{
		Type = circle
		Pos = (0.25, 0.5, 0.0)
		radius = 0.1
		Color = [
			187
			121
			0
			127
		]
		BlendMode = brighten
		thickness = 20.0
		controls = [
			{
				Type = notehit
				response = redmodulation
				scalemod = 0.8
				Player = 1
				gemcolor = red
				fade = 1.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.25, 0.0)
		radius = 0.3
		Color = [
			255
			124
			97
			25
		]
		material = og_mat_flare_add
		thickness = 15.0
		controls = [
			{
				Type = frequency
				response = alphamodulation
				scalemod = 0.2
				spectrumband = 10
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
				scalemod = 250.0
			}
		]
	}
]
