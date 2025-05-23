og_tunnel_tension_e = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (-1.1, -1.1)
		Color = [
			255
			255
			255
			245
		]
		angle = 1.0821
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
		length = 0.1
		Color = [
			0
			29
			0
			255
		]
		BlendMode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = bluemodulation
				colorscale = 150.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = greenmodulation
				colorscale = 50.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 10
			}
			{
				Type = frequency_history
				response = deform
				deformscale = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		length = 0.1
		Color = [
			0
			29
			0
			255
		]
		BlendMode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 150.0
				spectrumband = 20
			}
			{
				Type = frequency
				response = deform
				deformscale = 1000.0
				spectrumband = 20
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 20
			}
			{
				Type = frequency_history
				response = deform
				deformscale = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		length = 0.1
		Color = [
			0
			29
			0
			255
		]
		BlendMode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = bluemodulation
				colorscale = 150.0
				spectrumband = 30
			}
			{
				Type = frequency
				response = greenmodulation
				colorscale = 50.0
				spectrumband = 30
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 30
			}
			{
				Type = frequency_history
				response = deform
				deformscale = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.2, 0.0)
		length = 0.1
		Color = [
			0
			29
			0
			255
		]
		BlendMode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 150.0
				spectrumband = 40
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = 50.0
				spectrumband = 40
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 40
			}
			{
				Type = frequency_history
				response = deform
				deformscale = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		length = 0.1
		Color = [
			0
			29
			0
			255
		]
		BlendMode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = greenmodulation
				colorscale = 150.0
				spectrumband = 50
			}
			{
				Type = frequency
				response = greenmodulation
				colorscale = 50.0
				spectrumband = 50
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 50
			}
			{
				Type = frequency_history
				response = deform
				deformscale = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.3, 0.0)
		length = 0.1
		Color = [
			0
			29
			0
			255
		]
		BlendMode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 150.0
				spectrumband = 60
			}
			{
				Type = frequency
				response = redmodulation
				colorscale = 50.0
				spectrumband = 60
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				spectrumband = 60
			}
			{
				Type = frequency_history
				response = deform
				deformscale = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.01, 1.01)
		Color = [
			255
			0
			221
			11
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
