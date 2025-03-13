og_tunnel_neon = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		color = [
			255
			255
			255
			254
		]
		angularvel = 0
		blendmode = blend
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 0.99099994)
		color = [
			255
			255
			255
			9
		]
		angularvel = 0
		blendmode = add
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.25
		color = [
			51
			0
			0
			255
		]
		thickness = 1.0
		controls = [
			{
				type = frequency
				response = bluemodulation
				colorscale = 100.0
				spectrumband = 10
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.1
		color = [
			255
			58
			64
			25
		]
		thickness = 1.0
		controls = [
			{
				type = frequency
				response = alphamodulation
				colorscale = 1000.0
				spectrumband = 30
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			37
			37
			37
			127
		]
		thickness = 2.0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				colorscale = 255.0
				spectrumband = 10
			}
			{
				type = frequency
				response = greenmodulation
				colorscale = 200.0
				spectrumband = 11
			}
			{
				type = frequency
				response = bluemodulation
				colorscale = 100.0
				spectrumband = 12
			}
			{
				type = waveform
				response = deform
				deformscale = 50000.0
				responsefunc = exp
			}
		]
	}
]
