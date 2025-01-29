og_lhc_rising = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.99499995, 0.99499995)
		Color = [
			255
			255
			255
			255
		]
		angle = 0.00174533
		angularvel = 0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.8, 0.8)
		Color = [
			255
			255
			255
			42
		]
		angle = 0.523599
		angularvel = 0
		BlendMode = subtract
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.25
		Color = [
			81
			77
			74
			255
		]
		BlendMode = brighten
		thickness = 5.0
		angle = 0
		angularvel = 0
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = -0.52
		height = -0.52
		Color = [
			40
			40
			40
			63
		]
		material = og_mat_sphere_b_add
		angle = 0
		angularvel = -0.349066
		controls = [
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.51
		height = 0.51
		Color = [
			40
			40
			40
			127
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = 0.523599
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
			101
			61
			0
			31
		]
		material = og_mat_sphere_blend
		angle = 0
		angularvel = 0.523599
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
			28
			28
			28
			255
		]
		material = og_mat_sphere_sub
		angle = 0
		angularvel = 0.17453298
		controls = [
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.31
		Color = [
			128
			89
			89
			127
		]
		BlendMode = brighten
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = waveform
				response = deform
				scalemod = 200.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.25
		Color = [
			128
			89
			89
			25
		]
		BlendMode = blend
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = waveform
				response = deform
				scalemod = 50.0
			}
		]
	}
]
