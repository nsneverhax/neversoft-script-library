og_lhc_rising_b = [
	{
		type = blendprev
		offset = (-0.0004, -0.0006)
		scale = (0.99499995, 0.99499995)
		color = [
			255
			251
			253
			242
		]
		angle = 0
		angularvel = 0
		blendmode = blend
	}
	{
		type = sprite
		pos = (0.5, 0.5)
		scale = (1.0, 1.0)
		width = 0.25
		height = 0.1
		color = [
			149
			143
			103
			255
		]
		material = og_mat_flare_add
		blendmode = add
		angle = 0.0
		angularvel = -6.28319
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.2
				responsefunc = sintime
				timerate = 6.29
			}
			{
				type = constant
				response = offsety
				scalemod = 0.4
				responsefunc = costime
				timerate = 6.29
			}
			{
				type = constant
				response = scaley
				scalemod = 0.5
				responsefunc = sintime
				timerate = 6.29
			}
			{
				type = constant
				response = scalex
				scalemod = 0.5
				responsefunc = sintime
				timerate = 6.29
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.2
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
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.02
		innerradius = 0.205
		outerradius = 0.4
		color = [
			123
			115
			87
			255
		]
		material = og_mat_flare_brighten
		blendmode = blend
		thickness = 500.0
		angularvel = 15708.0
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 13
		radius = 0.01
		radius2 = 1.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 5.0
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
		scale = (1.3, 1.3)
		width = 0.55
		height = 0.55
		color = [
			101
			61
			0
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
]
