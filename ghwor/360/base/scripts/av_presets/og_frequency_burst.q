og_frequency_burst = [
	{
		Type = blendprev
		offset = (-0.0004, -0.0007)
		Scale = (0.91999996, 0.95)
		Color = [
			254
			252
			255
			249
		]
		angle = 0.00174533
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.001
		Color = [
			51
			51
			51
			82
		]
		BlendMode = add
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
		Type = circle
		Pos = (0.5, 0.525, 0.0)
		radius = 0.05
		Color = [
			255
			143
			143
			255
		]
		BlendMode = brighten
		angle = 4.71239
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
		Type = circle
		Pos = (0.5, 0.475, 0.0)
		radius = 0.05
		Color = [
			255
			143
			143
			255
		]
		BlendMode = brighten
		angle = 3.1415896
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
		Type = circle
		Pos = (0.525, 0.5, 0.0)
		radius = 0.05
		Color = [
			255
			143
			143
			255
		]
		BlendMode = brighten
		angle = 1.5708001
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
		Type = circle
		Pos = (0.475, 0.5, 0.0)
		radius = 0.05
		Color = [
			255
			143
			143
			255
		]
		BlendMode = brighten
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
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.125
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
			{
				Type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		width = 0.5
		height = 0.5
		Color = [
			255
			255
			255
			14
		]
		material = og_mat_flare_add
	}
]
