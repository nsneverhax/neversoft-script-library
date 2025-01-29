og_tunnel_fallingaction_c = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (-1.001, -1.001)
		Color = [
			255
			255
			255
			249
		]
		angle = 1.0472
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
		length = 0.5
		Color = [
			0
			0
			117
			255
		]
		BlendMode = blend
		thickness = 30.0
		angle = 1.5707
		angularvel = 0.0872665
		controls = [
			{
				Type = frequency
				response = alphamodulation
				colorscale = 50.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = -20.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				responsefunc = sintime
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		length = 0.5
		Color = [
			0
			0
			117
			255
		]
		BlendMode = blend
		thickness = 25.0
		angle = 1.5707
		angularvel = 0.10472
		controls = [
			{
				Type = frequency
				response = bluemodulation
				colorscale = 50.0
				spectrumband = 20
			}
			{
				Type = frequency
				response = alphamodulation
				colorscale = -20.0
				spectrumband = 20
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				responsefunc = sintime
				spectrumband = 20
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		length = 0.5
		Color = [
			0
			0
			117
			255
		]
		BlendMode = blend
		thickness = 20.0
		angle = 1.5707
		angularvel = 0.122173004
		controls = [
			{
				Type = frequency
				response = alphamodulation
				colorscale = 50.0
				spectrumband = 30
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = -20.0
				spectrumband = 30
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				responsefunc = sintime
				spectrumband = 30
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.2, 0.0)
		length = 0.5
		Color = [
			0
			0
			117
			255
		]
		BlendMode = blend
		thickness = 15.0
		angle = 1.5707
		angularvel = 0.139626
		controls = [
			{
				Type = frequency
				response = alphamodulation
				colorscale = 50.0
				spectrumband = 40
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = -20.0
				spectrumband = 40
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				responsefunc = sintime
				spectrumband = 40
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		length = 0.5
		Color = [
			0
			0
			117
			255
		]
		BlendMode = blend
		thickness = 10.0
		angle = 1.5707
		angularvel = 0.15708001
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 50.0
				spectrumband = 50
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = -20.0
				spectrumband = 50
			}
			{
				Type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				responsefunc = sintime
				spectrumband = 50
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		length = 0.5
		Color = [
			0
			0
			117
			255
		]
		BlendMode = blend
		thickness = 5.0
		angle = 1.5707
		angularvel = 0.17453298
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 50.0
				spectrumband = 30
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = -20.0
				spectrumband = 30
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (-1.1, -1.1)
		Color = [
			237
			26
			255
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
