og_frequency_burst_wave = [
	{
		Type = blendprev
		offset = (0.001, 0.005)
		Scale = (0.98999995, 0.98999995)
		Color = [
			254
			247
			234
			255
		]
		angle = 0.00436332
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.5, 0.25, 0.0)
		radius = 0.001
		Color = [
			255
			255
			255
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.25, 0.0)
		radius = 0.05
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 450.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.55, 0.0)
		length = 1.0
		Color = [
			92
			0
			255
			255
		]
		BlendMode = subtract
		thickness = 1.0
		angle = 0
		angularvel = 15.708
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.25, 0.0)
		Scale = (1.0, 0.5)
		width = 0.5
		height = 0.5
		Color = [
			0
			0
			0
			0
		]
		material = og_mat_sphere_blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 450.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.55, 0.0)
		length = 0.05
		Color = [
			0
			7
			255
			255
		]
		BlendMode = brighten
		thickness = 5.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.55, 0.0)
		radius = 0.05
		Color = [
			255
			187
			0
			255
		]
		BlendMode = subtract
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
		]
	}
]
