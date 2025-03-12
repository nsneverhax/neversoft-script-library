og_element_darksphere_b = [
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
		thickness = 50.0
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
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.9, 0.9)
		color = [
			255
			255
			255
			253
		]
		angle = 0
		angularvel = 0
		blendmode = blend
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
		material = og_mat_circle
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
			128
			96
			235
			255
		]
		material = og_mat_circle_sub
		angle = 0
		angularvel = 0.523599
		controls = [
			{
				type = frequency
				response = scalex
				scalemod = 30.0
				spectrumband = 10
			}
			{
				type = frequency
				response = scaley
				scalemod = 30.0
				spectrumband = 10
			}
		]
	}
]
