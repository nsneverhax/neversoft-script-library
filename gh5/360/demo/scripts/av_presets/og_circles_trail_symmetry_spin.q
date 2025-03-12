og_circles_trail_symmetry_spin = [
	{
		type = blendprev
		offset = (0.0, -0.01)
		scale = (-0.95, 1.01)
		color = [
			255
			255
			255
			229
		]
		angle = 0.0
		angularvel = 0.0872665
		blendmode = add
		controls = [
			{
				type = beaton
				response = angularvelmod
				scalemod = 4.36332
				fade = 0.5
			}
		]
	}
	{
		type = circle
		pos = (0.05, 0.25, 0.0)
		radius = 0.5
		color = [
			31
			31
			63
			255
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 50.0
				responsefunc = log10
				spectrumband = 10
			}
			{
				type = frequency
				response = greenmodulation
				scalemod = 0.5
				spectrumband = 20
			}
			{
				type = frequency
				response = redmodulation
				scalemod = 0.5
				spectrumband = 10
			}
			{
				type = frequency
				response = bluemodulation
				scalemod = 0.5
				spectrumband = 15
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			255
			255
			0
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.1
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.8, 0.5, 0.0)
		radius = 0.31
		color = [
			114
			81
			52
			255
		]
		blendmode = add
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 50.0
				responsefunc = log10
				spectrumband = 10
			}
		]
	}
]
