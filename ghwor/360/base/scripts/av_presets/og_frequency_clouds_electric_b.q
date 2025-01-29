og_frequency_clouds_electric_b = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 0.98999995)
		Color = [
			253
			252
			249
			242
		]
		BlendMode = add
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			219
			161
			255
			255
		]
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			106
			149
			255
			255
		]
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -150.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			219
			161
			255
			255
		]
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -250.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			106
			149
			255
			255
		]
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 150.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			219
			161
			255
			255
		]
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -200.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			106
			149
			255
			255
		]
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			219
			161
			255
			255
		]
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
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			106
			149
			255
			255
		]
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.001
		Color = [
			255
			245
			182
			255
		]
		BlendMode = brighten
		controls = [
			{
				Type = frequency_history
				response = deform
				scalemod = 1000.0
				spectrumband = 2
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.005
		Color = [
			255
			246
			238
			255
		]
		BlendMode = brighten
		controls = [
			{
				Type = frequency_history
				response = deform
				scalemod = 1000.0
				spectrumband = 1
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (0.5, 0.5)
		width = 1.0
		height = 1.0
		Color = [
			162
			76
			251
			5
		]
		material = og_mat_sphere_add
		angularvel = 0.17453298
	}
]
