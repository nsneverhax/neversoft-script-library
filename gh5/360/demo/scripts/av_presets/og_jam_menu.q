og_jam_menu = [
	{
		type = blendprev
		offset = (0.0, 0.01)
		scale = (1.0, 1.0)
		color = [
			136
			151
			161
			254
		]
		angle = 3.1415896
		angularvel = 0
		blendmode = blend
	}
	{
		type = sprite
		width = 0.2
		height = 3.0
		offset = (0.5, 0.75)
		scale = (1.0, 1.0)
		color = [
			79
			79
			79
			255
		]
		material = og_mat_flare
		blendmode = blend
		angle = 1.5533401
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = scaley
				scalemod = 0.125
				responsefunc = costime
			}
		]
	}
	{
		type = sprite
		width = 0.2
		height = 5.0
		offset = (0.25, 0.9)
		scale = (1.0, 1.0)
		color = [
			79
			79
			79
			255
		]
		material = og_mat_flare
		blendmode = blend
		angle = 1.58825
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = redmodulation
				scalemod = 0.1
				responsefunc = sintime
			}
			{
				type = constant
				response = scaley
				scalemod = 0.125
				responsefunc = costime
			}
		]
	}
	{
		type = sprite
		width = 0.2
		height = 4.0
		offset = (0.75, 0.6)
		scale = (1.0, 1.0)
		color = [
			79
			79
			79
			255
		]
		material = og_mat_flare
		blendmode = blend
		angle = 1.5708001
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = scaley
				scalemod = 0.125
				responsefunc = sintime
			}
			{
				type = constant
				response = redmodulation
				scalemod = 0.1
				responsefunc = sintime
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (3.0, 1.0)
		color = [
			255
			255
			255
			47
		]
		angle = 0.26179898
		angularvel = 0.0872665
		blendmode = subtract
	}
	{
		type = sprite
		width = 0.2
		height = 4.0
		offset = (0.25, 0.45000002)
		scale = (1.0, 1.0)
		color = [
			79
			79
			79
			255
		]
		material = og_mat_flare
		blendmode = blend
		angle = 1.5708001
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = scaley
				scalemod = 0.125
				responsefunc = costime
			}
		]
	}
	{
		type = sprite
		width = 0.4
		height = 6.0
		offset = (0.5, 0.2)
		scale = (1.0, 1.0)
		color = [
			79
			79
			79
			255
		]
		material = og_mat_flare
		blendmode = blend
		angle = 1.5708001
		angularvel = 0.0
		controls = [
		]
	}
	{
		type = sprite
		width = 1.0
		height = 0.1
		offset = (0.05, 0.5)
		scale = (1.0, 1.0)
		color = [
			79
			79
			79
			255
		]
		material = og_mat_flare
		blendmode = blend
		angle = 0.0
		angularvel = 0.0
		controls = [
		]
	}
]
