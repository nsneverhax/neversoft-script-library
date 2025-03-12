og_fog_field_2 = [
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
		type = blendprev
		offset = (0.0, 0.0)
		scale = (3.0, 1.0)
		color = [
			255
			255
			255
			47
		]
		angle = 0.523599
		angularvel = 0.0
		blendmode = subtract
	}
	{
		type = sprite
		pos = (0.45000002, 0.2)
		scale = (1.0, 1.0)
		width = 0.2
		height = 3.0
		color = [
			79
			79
			79
			255
		]
		material = og_mat_flare_add
		angle = 1.5533401
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = scaley
				scalemod = 0.3
				responsefunc = sintime
			}
		]
	}
	{
		type = sprite
		pos = (0.25, 0.1)
		scale = (1.0, 1.0)
		width = 0.2
		height = 5.0
		color = [
			79
			79
			79
			255
		]
		material = og_mat_flare_add
		angle = 1.58825
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = scaley
				scalemod = 0.2
				responsefunc = costime
			}
			{
				type = constant
				response = offsety
				scalemod = 0.0
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
		type = sprite
		pos = (0.35000002, 0.3)
		scale = (1.0, 1.0)
		width = 0.2
		height = 4.0
		color = [
			79
			79
			79
			255
		]
		material = og_mat_flare_add
		angle = 1.5708001
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = scaley
				scalemod = 0.3
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
		type = sprite
		pos = (0.65000004, 0.4)
		scale = (1.0, 1.0)
		width = 0.2
		height = 4.0
		color = [
			79
			79
			79
			255
		]
		material = og_mat_flare_add
		angle = 1.5708001
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = scaley
				scalemod = 0.2
				responsefunc = costime
			}
		]
	}
	{
		type = sprite
		pos = (0.15, 0.5)
		scale = (1.0, 1.0)
		width = 0.4
		height = 6.0
		color = [
			79
			79
			79
			255
		]
		material = og_mat_flare_add
		angle = 1.5708001
		angularvel = 0.0
		controls = [
		]
	}
	{
		type = sprite
		pos = (0.3, 0.7)
		scale = (1.0, 1.0)
		width = 1.0
		height = 0.1
		color = [
			79
			79
			79
			255
		]
		material = og_mat_flare_add
		angle = 0.0
		angularvel = 0.0
		controls = [
		]
	}
]
