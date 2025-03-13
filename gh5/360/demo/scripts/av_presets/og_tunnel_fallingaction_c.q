og_tunnel_fallingaction_c = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (-1.001, -1.001)
		color = [
			255
			255
			255
			249
		]
		angle = 1.0472
		angularvel = 0.0
		blendmode = blend
		controls = [
			{
				type = meandbs
				response = alphamodulation
				colorscale = 0.1
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		length = 0.5
		color = [
			0
			0
			117
			255
		]
		blendmode = blend
		thickness = 30.0
		angle = 1.5707
		angularvel = 0.0872665
		controls = [
			{
				type = frequency
				response = alphamodulation
				colorscale = 50.0
				spectrumband = 10
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = -20.0
				spectrumband = 10
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				responsefunc = sintime
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		length = 0.5
		color = [
			0
			0
			117
			255
		]
		blendmode = blend
		thickness = 25.0
		angle = 1.5707
		angularvel = 0.10472
		controls = [
			{
				type = frequency
				response = bluemodulation
				colorscale = 50.0
				spectrumband = 20
			}
			{
				type = frequency
				response = alphamodulation
				colorscale = -20.0
				spectrumband = 20
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				responsefunc = sintime
				spectrumband = 20
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		length = 0.5
		color = [
			0
			0
			117
			255
		]
		blendmode = blend
		thickness = 20.0
		angle = 1.5707
		angularvel = 0.122173004
		controls = [
			{
				type = frequency
				response = alphamodulation
				colorscale = 50.0
				spectrumband = 30
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = -20.0
				spectrumband = 30
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				responsefunc = sintime
				spectrumband = 30
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.2, 0.0)
		length = 0.5
		color = [
			0
			0
			117
			255
		]
		blendmode = blend
		thickness = 15.0
		angle = 1.5707
		angularvel = 0.139626
		controls = [
			{
				type = frequency
				response = alphamodulation
				colorscale = 50.0
				spectrumband = 40
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = -20.0
				spectrumband = 40
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				responsefunc = sintime
				spectrumband = 40
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		length = 0.5
		color = [
			0
			0
			117
			255
		]
		blendmode = blend
		thickness = 10.0
		angle = 1.5707
		angularvel = 0.15708001
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = 50.0
				spectrumband = 50
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = -20.0
				spectrumband = 50
			}
			{
				type = frequency
				response = lengthscale
				lengthscalemod = 100.0
				responsefunc = sintime
				spectrumband = 50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		length = 0.5
		color = [
			0
			0
			117
			255
		]
		blendmode = blend
		thickness = 5.0
		angle = 1.5707
		angularvel = 0.17453298
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = 50.0
				spectrumband = 30
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = -20.0
				spectrumband = 30
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (-1.1, -1.1)
		color = [
			237
			26
			255
			12
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
		controls = [
			{
				type = beaton
				response = alphamodulation
				colorscale = 0.1
				fade = 0.5
			}
			{
				type = maxdbs
				response = alphamodulation
				colorscale = 0.1
			}
		]
	}
]
