OG_LHC_Rising = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.99499995, 0.99499995)
		Color = [
			255
			255
			255
			255
		]
		angle = 0.00174533
		angularVel = 0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.8, 0.8)
		Color = [
			255
			255
			255
			42
		]
		angle = 0.523599
		angularVel = 0
		BlendMode = subtract
	}
	{
		type = circle
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
		angularVel = 0
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = -0.52
		height = -0.52
		Color = [
			40
			40
			40
			63
		]
		material = OG_Mat_Sphere_B_Add
		angle = 0
		angularVel = -0.349066
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.51
		height = 0.51
		Color = [
			40
			40
			40
			127
		]
		material = OG_Mat_Sphere_Add
		angle = 0
		angularVel = 0.523599
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.55
		height = 0.55
		Color = [
			101
			61
			0
			31
		]
		material = OG_Mat_Sphere_Blend
		angle = 0
		angularVel = 0.523599
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			28
			28
			28
			255
		]
		material = OG_Mat_Sphere_Sub
		angle = 0
		angularVel = 0.17453298
		controls = [
		]
	}
	{
		type = circle
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
		angularVel = 0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 200.0
			}
		]
	}
	{
		type = circle
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
		angularVel = 0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 50.0
			}
		]
	}
]
