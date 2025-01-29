og_circles_trail_symmetry_d = [
	{
		Type = blendprev
		offset = (0.0, 0.01)
		Scale = (-0.95, 1.01)
		Color = [
			255
			255
			255
			247
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = add
		controls = [
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
				scalemod = 250.0
				responsefunc = log10
				spectrumband = 10
			}
			{
				Type = frequency
				response = greenmodulation
				scalemod = 0.9
				spectrumband = 20
			}
			{
				Type = frequency
				response = redmodulation
				scalemod = 0.9
				spectrumband = 10
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
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = redmodulation
				scalemod = 0.9
				Player = 1
				gemcolor = red
				fade = 1.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.25, 0.0)
		radius = 0.5
		Color = [
			255
			124
			97
			25
		]
		BlendMode = blend_alphadiffuse
		thickness = 15.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = alphamodulation
				scalemod = 0.1
				spectrumband = 10
			}
		]
	}
	{
		Type = circle
		Pos = (0.8, 0.5, 0.0)
		radius = 0.3
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
		BlendMode = blend
		thickness = 1.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 250.0
			}
		]
	}
]
