og_circles_trail_symmetry_d = [
	{
		type = blendprev
		offset = (0.0, 0.01)
		scale = (-0.95, 1.01)
		color = [
			255
			255
			255
			247
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = add
		controls = [
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
				scalemod = 250.0
				responsefunc = log10
				spectrumband = 10
			}
			{
				type = frequency
				response = greenmodulation
				scalemod = 0.9
				spectrumband = 20
			}
			{
				type = frequency
				response = redmodulation
				scalemod = 0.9
				spectrumband = 10
			}
		]
	}
	{
		type = circle
		pos = (0.25, 0.5, 0.0)
		radius = 0.1
		color = [
			187
			121
			0
			127
		]
		blendmode = brighten
		thickness = 20.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = redmodulation
				scalemod = 0.9
				player = 1
				gemcolor = red
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.25, 0.0)
		radius = 0.5
		color = [
			255
			124
			97
			25
		]
		blendmode = blend_alphadiffuse
		thickness = 15.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = alphamodulation
				scalemod = 0.1
				spectrumband = 10
			}
		]
	}
	{
		type = circle
		pos = (0.8, 0.5, 0.0)
		radius = 0.3
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
				scalemod = 250.0
			}
		]
	}
]
