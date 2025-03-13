tb_global_falling_action = [
	{
		type = blendprev
		offset = (0.0, 0.001)
		scale = (0.98999995, 1.015)
		color = [
			255
			255
			255
			254
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		length = 1.0
		color = [
			235
			186
			51
			229
		]
		thickness = 12.0
		controls = [
			{
				type = constant
				response = redmodulation
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.0349066
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		length = 1.0
		color = [
			235
			186
			51
			229
		]
		thickness = 12.0
		controls = [
			{
				type = constant
				response = redmodulation
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.0349066
			}
		]
	}
	{
		type = line
		pos = (0.0, 1.0, 0.0)
		length = 2.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 8.0
		angularvel = 25.0
	}
	{
		type = line
		pos = (1.0, 1.0, 0.0)
		length = 2.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 8.0
		angularvel = -25.0
	}
	{
		type = hypotrochoid
		pos = (0.4, 0.1, 0.0)
		length = 0.25
		innerradius = 0.05
		outerradius = 0.35000002
		color = [
			255
			88
			0
			255
		]
		material = og_mat_flare_add
		thickness = 90.0
		angularvel = 1.7453301
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.4
				responsefunc = costime
				timerate = 10.471999
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.2, 0.0)
		scale = (0.75, 0.75)
		length = 0.25
		innerradius = 0.15
		outerradius = 0.45000002
		color = [
			255
			88
			0
			255
		]
		material = og_mat_flare_add
		thickness = 90.0
		angularvel = -1.7453301
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.4
				responsefunc = costime
				timerate = 10.471999
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.6, 0.1, 0.0)
		scale = (0.5, 0.5)
		length = 0.25
		innerradius = 0.05
		outerradius = 0.25
		color = [
			255
			88
			0
			255
		]
		material = og_mat_flare_add
		thickness = 90.0
		angularvel = -1.7453301
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.4
				responsefunc = costime
				timerate = 10.471999
			}
		]
	}
]
