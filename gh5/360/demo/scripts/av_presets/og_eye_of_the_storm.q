og_eye_of_the_storm = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		color = [
			227
			217
			230
			255
		]
		angle = 0
		angularvel = 0
		blendmode = add
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (0.1, 1.0)
		width = 0.5
		height = 0.5
		color = [
			8
			8
			9
			255
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = 2.0944
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (0.25, 0.5)
		width = 0.5
		height = 0.5
		color = [
			115
			113
			119
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
				scalemod = -0.5
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
			70
			58
			50
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
				scalemod = 1.0
				spectrumband = 0
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = -0.1
		radius2 = 1.0
		color = [
			82
			180
			49
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 2.0944
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = -0.5
				spectrumband = 4
			}
		]
	}
]
