og_circles_trail_symmetry = [
	{
		type = blendprev
		offset = (0.01, 0.0)
		scale = (-0.95, -1.1)
		color = [
			255
			255
			255
			229
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = add
		controls = [
		]
	}
	{
		type = circle
		pos = (0.75, 0.5, 0.0)
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
				scalemod = 10.0
				responsefunc = log10
				spectrumband = 10
			}
			{
				type = frequency
				response = greenmodulation
				scalemod = 100.0
				spectrumband = 20
			}
			{
				type = frequency
				response = redmodulation
				scalemod = 100.0
				spectrumband = 10
			}
			{
				type = frequency
				response = bluemodulation
				scalemod = 50.0
				spectrumband = 15
			}
		]
	}
	{
		type = circle
		pos = (0.25, 0.5, 0.0)
		radius = 0.1
		color = [
			66
			84
			141
			127
		]
		blendmode = diffuse
		thickness = 20.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = redmodulation
				scalemod = 1.0
				player = 1
				gemcolor = red
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.25
		color = [
			207
			154
			143
			0
		]
		blendmode = diffuse
		thickness = 15.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = alphamodulation
				scalemod = 20.0
				spectrumband = 10
			}
		]
	}
	{
		type = circle
		pos = (0.75, 0.5, 0.0)
		radius = 0.3
		color = [
			114
			106
			98
			255
		]
		blendmode = brighten
		thickness = 20.0
		angle = 0
		angularvel = 0
	}
	{
		type = circle
		pos = (0.125, 0.5, 0.0)
		radius = 0.05
		color = [
			114
			105
			255
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			130
			106
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 50.0
				responsefunc = sinlog10
			}
		]
	}
]
