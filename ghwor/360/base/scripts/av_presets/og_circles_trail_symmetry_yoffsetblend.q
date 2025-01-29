og_circles_trail_symmetry_yoffsetblend = [
	{
		Type = blendprev
		offset = (0.0, -0.02)
		Scale = (-0.95, 1.01)
		Color = [
			255
			255
			255
			216
		]
		BlendMode = add
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
		Type = blendprev
		offset = (0.0, 0.0)
		Color = [
			255
			255
			255
			12
		]
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
		Pos = (0.5, 0.25, 0.0)
		radius = 0.3
		Color = [
			255
			124
			97
			25
		]
		BlendMode = blend_alphadiffuse
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
			207
		]
		BlendMode = add
		thickness = 2.0
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 0.1
				spectrumband = 0
			}
		]
	}
	{
		Type = circle
		Pos = (0.45000002, 0.25, 0.0)
		radius = 0.35000002
		Color = [
			114
			105
			255
			51
		]
		BlendMode = add
		thickness = 50.0
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 0.1
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.8, 0.0)
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
			}
		]
	}
]
