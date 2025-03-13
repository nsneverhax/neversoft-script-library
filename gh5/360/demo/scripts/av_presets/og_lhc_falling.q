og_lhc_falling = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			248
			255
			252
			254
		]
		angle = 0
		angularvel = 0
		blendmode = blend
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			255
			255
			255
			255
		]
		material = og_mat_dot_add
		blendmode = blend
		thickness = 10.0
		angularvel = 10
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.5
				responsefunc = sintime
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.1
		color = [
			117
			175
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 1.0472
		angularvel = -0.17453298
		controls = [
			{
				type = history
				historytype = frequency
				response = deform
				scalemod = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 3
		radius = 0.1
		radius2 = 0.1
		color = [
			20
			44
			53
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				type = constant
				response = radiusscale
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				type = constant
				response = radius2scale
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.523599
			}
		]
	}
]
