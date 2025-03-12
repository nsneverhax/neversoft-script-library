og_explosives_e = [
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 100.0
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
			46
			24
			24
			255
		]
		blendmode = add
		thickness = 5.0
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
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.9, 0.9)
		color = [
			246
			238
			255
			229
		]
		angle = 0.052359905
		angularvel = 0
		blendmode = blend
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (0.25, 1.0)
		width = 0.5
		height = 0.5
		color = [
			171
			122
			60
			255
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = -0.54105204
	}
	{
		type = sprite
		pos = (0.5, 0.5)
		scale = (0.1, 0.1)
		width = 1.0
		height = 1.0
		color = [
			237
			231
			255
			204
		]
		material = og_mat_sphere_b_sub
		angle = 0
		angularvel = 3.1415896
		controls = [
			{
				type = notehit
				response = scalex
				scalemod = -0.8
				responsefunc = sinlog10
				player = 1
				fade = 0.2
			}
			{
				type = notehit
				response = scaley
				scalemod = -0.2
				responsefunc = sinlog10
				player = 1
				fade = 0.2
			}
			{
				type = constant
				response = scalex
				scalemod = 0.5
				responsefunc = sintime
				timerate = 1.0472
			}
			{
				type = constant
				response = scaley
				scalemod = 0.5
				responsefunc = costime
				timerate = 1.0472
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			40
			5
			0
			254
		]
		angle = 0.0
		angularvel = 6.28319
		blendmode = subtract
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = -1.0
		radius2 = 0.1
		color = [
			46
			24
			24
			255
		]
		blendmode = add
		thickness = 5.0
		angle = 0
		angularvel = 1.0472
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
