og_lhc_rising_eclipse_b = [
	{
		Type = blendprev
		offset = (-0.0004, -0.0006)
		Scale = (0.99499995, 0.99499995)
		Color = [
			255
			251
			253
			249
		]
		angle = 0
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = sprite
		Pos = (0.5, 0.5)
		Scale = (0.0, 0.0)
		width = 0.25
		height = 0.1
		Color = [
			53
			51
			37
			255
		]
		material = og_mat_flare_add
		BlendMode = add
		angle = 0.0
		angularvel = -2.0
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.2
				responsefunc = sintime
				timerate = 2.0
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.4
				responsefunc = costime
				timerate = 2.0
			}
			{
				Type = constant
				response = scaley
				scalemod = 2.0
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 0.5
			}
			{
				Type = constant
				response = scalex
				scalemod = 2.0
				responsefunc = sintime
				timerate = 0.5
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.25
		Color = [
			125
			124
			123
			255
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 13
		radius = 0.2
		radius2 = 0.21000001
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0.872665
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (0.8, 0.8)
		width = -0.52
		height = -0.52
		Color = [
			40
			40
			40
			63
		]
		material = og_mat_sphere_b_add
		BlendMode = blend
		angle = 0
		angularvel = -3.0194201
		controls = [
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (0.8, 0.8)
		width = 0.51
		height = 0.51
		Color = [
			40
			40
			40
			127
		]
		material = og_mat_sphere_add
		BlendMode = blend
		angle = 0
		angularvel = 4.76475
		controls = [
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.55
		height = 0.55
		Color = [
			57
			53
			53
			31
		]
		material = og_mat_sphere_blend
		BlendMode = blend
		angle = 0
		angularvel = 4.1364303
		controls = [
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			8
			8
			11
			255
		]
		material = og_mat_sphere_sub
		BlendMode = blend
		angle = 0
		angularvel = 1.51844
		controls = [
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		length = 0.1
		InnerRadius = 0.21000001
		outerradius = 0.1
		Color = [
			255
			238
			180
			255
		]
		material = og_mat_flare_add
		BlendMode = add
		thickness = 100.0
		angularvel = 87.266495
	}
]
