OG_Frequency_Burst = [
	{
		type = blendPrev
		offset = (-0.0004, -0.0007)
		scale = (0.91999996, 0.95)
		Color = [
			254
			252
			255
			249
		]
		angle = 0.00174533
		angularVel = 0
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.001
		Color = [
			51
			51
			51
			82
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 250.0
				spectrumBand = 0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.525, 0.0)
		radius = 0.05
		Color = [
			255
			143
			143
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 4.71239
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 250.0
				spectrumBand = 0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.475, 0.0)
		radius = 0.05
		Color = [
			255
			143
			143
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 3.1415896
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 250.0
				spectrumBand = 0
			}
		]
	}
	{
		type = circle
		Pos = (0.525, 0.5, 0.0)
		radius = 0.05
		Color = [
			255
			143
			143
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 250.0
				spectrumBand = 0
			}
		]
	}
	{
		type = circle
		Pos = (0.475, 0.5, 0.0)
		radius = 0.05
		Color = [
			255
			143
			143
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 250.0
				spectrumBand = 0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.125
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 100.0
				spectrumBand = 0
			}
			{
				type = constant
				response = radiusScale
				scaleMod = 0.1
				responseFunc = sinTime
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			255
			255
			255
			14
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0
	}
]
