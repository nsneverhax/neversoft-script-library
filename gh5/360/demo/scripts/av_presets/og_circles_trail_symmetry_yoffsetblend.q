og_circles_trail_symmetry_yoffsetblend = [
	{
		type = blendprev
		offset = (0.0, -0.02)
		scale = (-0.95, 1.01)
		color = [
			255
			255
			255
			216
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
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			255
			255
			12
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
		pos = (0.5, 0.25, 0.0)
		radius = 0.3
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
				scalemod = 0.2
				spectrumband = 10
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
			207
		]
		blendmode = add
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.1
				spectrumband = 0
			}
		]
	}
	{
		type = circle
		pos = (0.45000002, 0.25, 0.0)
		radius = 0.35000002
		color = [
			114
			105
			255
			51
		]
		blendmode = add
		thickness = 50.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.1
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.8, 0.0)
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
			}
		]
	}
]
