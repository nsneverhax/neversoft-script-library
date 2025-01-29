OG_Frequency_Burst_Wave_B = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.97999996, 0.97999996)
		Color = [
			254
			252
			251
			242
		]
		angle = 0.00174533
		angularVel = 0
		BlendMode = blend
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.001
				responseFunc = sinTime
				timeRate = 1.0472
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.05
		Color = [
			50
			57
			84
			255
		]
		BlendMode = add
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 400.0
				spectrumBand = 0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			143
			137
			120
			108
		]
		BlendMode = add
		thickness = 5.0
		angle = 0
		angularVel = 0
		controls = [
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.001
		Color = [
			34
			17
			39
			75
		]
		BlendMode = add
		thickness = 2.0
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
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 3.0
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
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.1
		Color = [
			26
			21
			0
			22
		]
		BlendMode = add
		thickness = 30.0
		angle = 0
		angularVel = 0.872665
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
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 19
		radius = 0.1
		radius2 = 0.5
		Color = [
			143
			143
			143
			45
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 17.453299
	}
]
