og_frequency_clouds_debug = [
	{
		type = blendprev
		offset = (0.0, 0.001)
		scale = (0.99649996, 0.98999995)
		color = [
			229
			229
			229
			255
		]
		angle = 0.0
		angularvel = 0
		blendmode = blend
		controls = [
			{
				type = frequency
				response = redmodulation
				scalemod = 0.1
				spectrumband = 1
			}
			{
				type = frequency
				response = greenmodulation
				scalemod = 0.1
				spectrumband = 5
			}
			{
				type = frequency
				response = bluemodulation
				scalemod = 0.1
				spectrumband = 8
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.4, 0.0)
		length = 0.5
		color = [
			219
			161
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				responsefunc = sintime
				timerate = 3.1415896
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.4, 0.0)
		length = 0.5
		color = [
			106
			149
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -100.0
				responsefunc = sintime
				timerate = 3.1415896
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.4, 0.0)
		length = 0.5
		color = [
			106
			149
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -200.0
				responsefunc = sintime
				timerate = 3.1415896
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.4, 0.0)
		length = 0.5
		color = [
			219
			161
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.1415896
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.4, 0.0)
		length = -0.5
		color = [
			219
			161
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.4, 0.0)
		length = -0.5
		color = [
			106
			149
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -100.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.4, 0.0)
		length = -0.5
		color = [
			106
			149
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -200.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.4, 0.0)
		length = -0.5
		color = [
			219
			161
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.4)
		scale = (3.0, 0.01)
		width = 1.0
		height = 1.0
		color = [
			178
			146
			0
			25
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = 3.1415896
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.1
				player = 1
				fade = 1.0
			}
			{
				type = beaton
				response = scaley
				scalemod = 0.2
				fade = 0.8
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.1
		color = [
			121
			200
			193
			198
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = history
				historytype = frequency
				response = deform
				scalemod = 1000.0
				spectrumband = 2
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.01
		color = [
			121
			200
			193
			124
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = history
				historytype = frequency
				response = deform
				scalemod = 1000.0
				spectrumband = 2
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.4, 0.0)
		scale = (1.0, 0.2)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_add
		thickness = 20
		angularvel = 1.0
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.4, 0.0)
		scale = (1.0, 0.2)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_add
		thickness = 20
		angularvel = -1.0
	}
]
