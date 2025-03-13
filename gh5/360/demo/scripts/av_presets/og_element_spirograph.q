og_element_spirograph = [
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.3
		color = [
			255
			255
			255
			255
		]
		blendmode = subtract
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = -0.2
				player = 1
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			0
			8
			17
			255
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = redmodulation
				scalemod = 0.25
				player = 1
				fade = 0.5
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.01
				responsefunc = costime
			}
			{
				type = constant
				response = offsety
				scalemod = 0.01
				responsefunc = sintime
			}
			{
				type = notehit
				response = greenmodulation
				scalemod = 0.1
				player = 1
				fade = 0.1
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.1
		radius2 = 1.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.1
				responsefunc = log2
				spectrumband = 10
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.1
		radius2 = 1.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.1
				responsefunc = log2
				spectrumband = 1
			}
		]
	}
]
