og_frequency_burst = [
	{
		type = blendprev
		offset = (-0.0004, -0.0007)
		scale = (0.91999996, 0.95)
		color = [
			254
			252
			255
			249
		]
		angle = 0.00174533
		blendmode = blend
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.001
		color = [
			51
			51
			51
			82
		]
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.525, 0.0)
		radius = 0.05
		color = [
			255
			143
			143
			255
		]
		blendmode = brighten
		angle = 4.71239
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.475, 0.0)
		radius = 0.05
		color = [
			255
			143
			143
			255
		]
		blendmode = brighten
		angle = 3.1415896
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
		]
	}
	{
		type = circle
		pos = (0.525, 0.5, 0.0)
		radius = 0.05
		color = [
			255
			143
			143
			255
		]
		blendmode = brighten
		angle = 1.5708001
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
		]
	}
	{
		type = circle
		pos = (0.475, 0.5, 0.0)
		radius = 0.05
		color = [
			255
			143
			143
			255
		]
		blendmode = brighten
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.125
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
			{
				type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		width = 0.5
		height = 0.5
		color = [
			255
			255
			255
			14
		]
		material = og_mat_flare_add
	}
]
