OG_Frequency_Burst_Wave = [
	{
		type = blendPrev
		offset = (0.001, 0.005)
		scale = (0.98999995, 0.98999995)
		Color = [
			254
			247
			234
			255
		]
		angle = 0.00436332
		angularVel = 0
		BlendMode = blend
	}
	{
		type = circle
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
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 500.0
				spectrumBand = 0
			}
		]
	}
	{
		type = circle
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
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 450.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
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
		angularVel = 15.708
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				spectrumBand = 0
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.25, 0.0)
		scale = (1.0, 0.5)
		width = 0.5
		height = 0.5
		Color = [
			0
			0
			0
			0
		]
		material = OG_Mat_Sphere_Blend
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 450.0
				spectrumBand = 10
			}
		]
	}
	{
		type = line
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
		angularVel = 0.872665
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				spectrumBand = 0
			}
		]
	}
	{
		type = circle
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
		angularVel = 0
		controls = [
		]
	}
]
