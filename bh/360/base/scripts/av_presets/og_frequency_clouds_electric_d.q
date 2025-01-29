OG_Frequency_Clouds_Electric_D = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.95, 0.95)
		Color = [
			251
			255
			235
			255
		]
		angle = 0.0
		angularVel = 0
		BlendMode = add
		controls = [
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
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
				scaleMod = 200.0
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			0
			0
			0
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
				scaleMod = -10.0
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
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
				scaleMod = -200.0
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			0
			0
			0
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
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
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
				scaleMod = -200.0
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			0
			0
			0
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
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
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
				scaleMod = 200.0
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			0
			0
			0
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
				scaleMod = -100.0
				spectrumBand = 10
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
			36
			8
			51
			25
		]
		material = OG_Mat_Sphere_Blend
		angle = 0
		angularVel = 1.7453301
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.05
		Color = [
			255
			245
			182
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency_History
				response = deform
				scaleMod = 200.0
				spectrumBand = 2
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = -0.1
		Color = [
			255
			110
			0
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency_History
				response = deform
				scaleMod = -200.0
				spectrumBand = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.001
		Color = [
			105
			105
			105
			25
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 1000.0
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
			74
			45
			84
			82
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = -1.3089999
	}
]
