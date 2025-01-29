og_tunnel_blackout_a = [
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
		angle = 2.0944
		angularvel = 0.0
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
			23
			26
			116
			255
		]
		BlendMode = blend
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 10.0
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
			23
			26
			116
			255
		]
		BlendMode = blend
		thickness = 5.0
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
				colorscale = 10.0
				spectrumband = 20
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		length = 0.01
		Color = [
			23
			26
			116
			255
		]
		BlendMode = blend
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 10.0
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
			23
			26
			116
			255
		]
		BlendMode = blend
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 10.0
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
			23
			26
			116
			255
		]
		BlendMode = blend
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 10.0
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
			116
			38
			26
			255
		]
		BlendMode = blend
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = greenmodulation
				colorscale = 10.0
				spectrumband = 60
			}
			{
				Type = frequency
				response = redmodulation
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
			51
			233
			255
			44
		]
		angle = 0.17453298
		angularvel = 1.7453301
		BlendMode = subtract
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
