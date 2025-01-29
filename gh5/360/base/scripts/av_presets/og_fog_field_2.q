og_fog_field_2 = [
	{
		Type = blendprev
		offset = (0.0, 0.01)
		Scale = (1.0, 1.0)
		Color = [
			136
			151
			161
			254
		]
		angle = 3.1415896
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (3.0, 1.0)
		Color = [
			255
			255
			255
			47
		]
		angle = 0.523599
		angularvel = 0.0
		BlendMode = subtract
	}
	{
		Type = sprite
		Pos = (0.45000002, 0.2)
		Scale = (1.0, 1.0)
		width = 0.2
		height = 3.0
		Color = [
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
				Type = constant
				response = scaley
				scalemod = 0.3
				responsefunc = sintime
			}
		]
	}
	{
		Type = sprite
		Pos = (0.25, 0.1)
		Scale = (1.0, 1.0)
		width = 0.2
		height = 5.0
		Color = [
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
				Type = constant
				response = scaley
				scalemod = 0.2
				responsefunc = costime
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.0
				responsefunc = sintime
			}
			{
				Type = constant
				response = redmodulation
				scalemod = 0.1
				responsefunc = sintime
			}
		]
	}
	{
		Type = sprite
		Pos = (0.35000002, 0.3)
		Scale = (1.0, 1.0)
		width = 0.2
		height = 4.0
		Color = [
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
				Type = constant
				response = scaley
				scalemod = 0.3
				responsefunc = sintime
			}
			{
				Type = constant
				response = redmodulation
				scalemod = 0.1
				responsefunc = sintime
			}
		]
	}
	{
		Type = sprite
		Pos = (0.65000004, 0.4)
		Scale = (1.0, 1.0)
		width = 0.2
		height = 4.0
		Color = [
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
				Type = constant
				response = scaley
				scalemod = 0.2
				responsefunc = costime
			}
		]
	}
	{
		Type = sprite
		Pos = (0.15, 0.5)
		Scale = (1.0, 1.0)
		width = 0.4
		height = 6.0
		Color = [
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
		Type = sprite
		Pos = (0.3, 0.7)
		Scale = (1.0, 1.0)
		width = 1.0
		height = 0.1
		Color = [
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
