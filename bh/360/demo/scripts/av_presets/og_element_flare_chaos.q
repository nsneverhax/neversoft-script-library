og_element_flare_chaos = [
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.01
		radius2 = 1.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 1.0
				responsefunc = log2
				spectrumband = 1
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.1
		radius2 = 0.1
		color = [
			255
			255
			255
			255
		]
		blendmode = subtract
		thickness = 3.0
		angle = 0
		angularvel = 2.0944
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.5
				responsefunc = log2
				spectrumband = 1
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		color = [
			255
			253
			242
			247
		]
		angle = 0
		angularvel = 0
		blendmode = add
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			128
			96
			235
			255
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = 2.0944
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			128
			96
			235
			255
		]
		material = og_mat_sphere_sub
		angle = 0
		angularvel = 0.27925304
		controls = [
			{
				type = notehit
				response = greenmodulation
				scalemod = 0.1
				player = 1
				gemcolor = green
				fade = 0.25
			}
			{
				type = frequency
				response = scalexy
				scalemod = -0.1
				spectrumband = 10
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
			205
			170
			148
			194
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = -1.7453301
		controls = [
			{
				type = notehit
				response = redmodulation
				scalemod = 0.125
				player = 1
				gemcolor = red
				fade = 1.0
			}
			{
				type = frequency
				response = scalexy
				scalemod = 0.1
				spectrumband = 10
			}
		]
	}
]
