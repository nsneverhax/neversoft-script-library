og_energy_vortex_b = [
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
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.01
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 1.0
				player = 1
				fade = 0.5
			}
			{
				type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (0.0, 0.0)
		width = 0.5
		height = 0.5
		color = [
			255
			180
			180
			255
		]
		material = og_mat_sphere_bright
		angle = 0
		angularvel = 1.7453301
		controls = [
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
				response = scalexy
				scalemod = 1.0
				player = 1
				fade = 0.5
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
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.1
				spectrumband = 1
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
			130
			86
			46
			255
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = -0.54105204
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			202
			193
			235
			139
		]
		material = og_mat_sphere_b_sub
		angle = 0
		angularvel = 0.523599
		controls = [
			{
				type = frequency
				response = scalexy
				scalemod = -0.5
				spectrumband = 10
			}
		]
	}
]
