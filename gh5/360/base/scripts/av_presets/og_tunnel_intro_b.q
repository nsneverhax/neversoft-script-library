og_tunnel_intro_b = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (-1.1, -1.01)
		Color = [
			255
			255
			255
			247
		]
		angle = 1.0472
		angularvel = 0.0174533
		BlendMode = blend
		controls = [
			{
				Type = meandbs
				response = alphamodulation
				colorscale = 0.1
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.05, 0.0)
		length = 0.01
		Color = [
			30
			64
			245
			255
		]
		BlendMode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = bluemodulation
				colorscale = -50.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = 110.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		length = 0.01
		Color = [
			245
			210
			12
			255
		]
		BlendMode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 20
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = 110.0
				spectrumband = 20
			}
			{
				Type = frequency
				response = redmodulation
				colorscale = -50.0
				spectrumband = 20
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		length = 0.01
		Color = [
			245
			210
			12
			255
		]
		BlendMode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = -50.0
				spectrumband = 30
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = 110.0
				spectrumband = 30
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 30
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.2, 0.0)
		length = 0.01
		Color = [
			245
			210
			12
			255
		]
		BlendMode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = -50.0
				spectrumband = 40
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = 110.0
				spectrumband = 40
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 40
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		length = 0.01
		Color = [
			245
			210
			12
			255
		]
		BlendMode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = -50.0
				spectrumband = 50
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = 110.0
				spectrumband = 50
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 50
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.3, 0.0)
		length = 0.01
		Color = [
			245
			210
			12
			255
		]
		BlendMode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = -50.0
				spectrumband = 60
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = 110.0
				spectrumband = 60
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 60
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			255
			95
			51
			12
		]
		angle = 0.0
		angularvel = 0
		BlendMode = add
		controls = [
			{
				Type = beaton
				response = alphamodulation
				colorscale = 0.1
				fade = 0.5
			}
			{
				Type = maxdbs
				response = alphamodulation
				colorscale = 0.1
			}
		]
	}
]
