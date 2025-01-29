og_jam_menu = [
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
		Type = sprite
		width = 0.2
		height = 3.0
		offset = (0.5, 0.75)
		Scale = (1.0, 1.0)
		Color = [
			79
			79
			79
			255
		]
		material = og_mat_flare
		BlendMode = blend
		angle = 1.5533401
		angularvel = 0.0
		controls = [
			{
				Type = constant
				response = scaley
				scalemod = 0.125
				responsefunc = costime
			}
		]
	}
	{
		Type = sprite
		width = 0.2
		height = 5.0
		offset = (0.25, 0.9)
		Scale = (1.0, 1.0)
		Color = [
			79
			79
			79
			255
		]
		material = og_mat_flare
		BlendMode = blend
		angle = 1.58825
		angularvel = 0.0
		controls = [
			{
				Type = constant
				response = redmodulation
				scalemod = 0.1
				responsefunc = sintime
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.125
				responsefunc = costime
			}
		]
	}
	{
		Type = sprite
		width = 0.2
		height = 4.0
		offset = (0.75, 0.6)
		Scale = (1.0, 1.0)
		Color = [
			79
			79
			79
			255
		]
		material = og_mat_flare
		BlendMode = blend
		angle = 1.5708001
		angularvel = 0.0
		controls = [
			{
				Type = constant
				response = scaley
				scalemod = 0.125
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
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (3.0, 1.0)
		Color = [
			255
			255
			255
			47
		]
		angle = 0.26179898
		angularvel = 0.0872665
		BlendMode = subtract
	}
	{
		Type = sprite
		width = 0.2
		height = 4.0
		offset = (0.25, 0.45000002)
		Scale = (1.0, 1.0)
		Color = [
			79
			79
			79
			255
		]
		material = og_mat_flare
		BlendMode = blend
		angle = 1.5708001
		angularvel = 0.0
		controls = [
			{
				Type = constant
				response = scaley
				scalemod = 0.125
				responsefunc = costime
			}
		]
	}
	{
		Type = sprite
		width = 0.4
		height = 6.0
		offset = (0.5, 0.2)
		Scale = (1.0, 1.0)
		Color = [
			79
			79
			79
			255
		]
		material = og_mat_flare
		BlendMode = blend
		angle = 1.5708001
		angularvel = 0.0
		controls = [
		]
	}
	{
		Type = sprite
		width = 1.0
		height = 0.1
		offset = (0.05, 0.5)
		Scale = (1.0, 1.0)
		Color = [
			79
			79
			79
			255
		]
		material = og_mat_flare
		BlendMode = blend
		angle = 0.0
		angularvel = 0.0
		controls = [
		]
	}
]
