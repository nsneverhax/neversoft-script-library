og_lhc_rising_eclipse_b = [
	{
		type = blendprev
		offset = (-0.0004, -0.0006)
		scale = (0.99499995, 0.99499995)
		color = [
			255
			251
			253
			249
		]
		angle = 0
		angularvel = 0
		blendmode = blend
	}
	{
		type = sprite
		pos = (0.5, 0.5)
		scale = (0.0, 0.0)
		width = 0.25
		height = 0.1
		color = [
			53
			51
			37
			255
		]
		material = og_mat_flare_add
		blendmode = add
		angle = 0.0
		angularvel = -2.0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.2
				responsefunc = sintime
				timerate = 2.0
			}
			{
				type = constant
				response = offsety
				scalemod = 0.4
				responsefunc = costime
				timerate = 2.0
			}
			{
				type = constant
				response = scaley
				scalemod = 2.0
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 0.5
			}
			{
				type = constant
				response = scalex
				scalemod = 2.0
				responsefunc = sintime
				timerate = 0.5
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.25
		color = [
			125
			124
			123
			255
		]
		blendmode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 13
		radius = 0.2
		radius2 = 0.21000001
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
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (0.8, 0.8)
		width = -0.52
		height = -0.52
		color = [
			40
			40
			40
			63
		]
		material = og_mat_sphere_b_add
		blendmode = blend
		angle = 0
		angularvel = -3.0194201
		controls = [
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (0.8, 0.8)
		width = 0.51
		height = 0.51
		color = [
			40
			40
			40
			127
		]
		material = og_mat_sphere_add
		blendmode = blend
		angle = 0
		angularvel = 4.76475
		controls = [
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.55
		height = 0.55
		color = [
			57
			53
			53
			31
		]
		material = og_mat_sphere_blend
		blendmode = blend
		angle = 0
		angularvel = 4.1364303
		controls = [
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			8
			8
			11
			255
		]
		material = og_mat_sphere_sub
		blendmode = blend
		angle = 0
		angularvel = 1.51844
		controls = [
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.1
		innerradius = 0.21000001
		outerradius = 0.1
		color = [
			255
			238
			180
			255
		]
		material = og_mat_flare_add
		blendmode = add
		thickness = 100.0
		angularvel = 87.266495
	}
]
