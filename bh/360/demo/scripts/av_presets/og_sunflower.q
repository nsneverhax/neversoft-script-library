og_sunflower = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.95, 0.95)
		color = [
			255
			255
			255
			242
		]
		angle = -0.00436332
		angularvel = 0
		blendmode = add
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.05
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
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
		scale = (0.1, 0.1)
		width = 0.5
		height = 0.5
		color = [
			17
			11
			0
			255
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = -0.523599
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
			{
				type = notehit
				response = scalex
				scalemod = 1.0
				responsefunc = sintime
				player = 1
				fade = 1.0
			}
			{
				type = notehit
				response = scaley
				scalemod = 1.0
				responsefunc = sintime
				player = 1
				fade = 1.0
			}
			{
				type = beaton
				response = scalex
				scalemod = 0.5
				fade = 0.1
			}
			{
				type = beaton
				response = scaley
				scalemod = 0.5
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
			13
			12
			12
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = -0.2
				spectrumband = 1
			}
		]
	}
]
