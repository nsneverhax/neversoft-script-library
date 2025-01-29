OG_Vocals_Freeform_Effects = [
	{
		type = blendPrev
		offset = (-0.005, 0.0)
		scale = (1.0, 1.1)
		Color = [
			202
			219
			244
			242
		]
		angle = 0.0
		angularVel = 0
		BlendMode = add
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			219
			55
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = vocalsamplitude
				response = deform
				scaleMod = 25.0
				responseFunc = sinTime
				timeRate = 13.9626
				player = 1
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = -1.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 5.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = jitterDeform
				scaleMod = 100.0
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			219
			55
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = vocalsamplitude
				response = deform
				scaleMod = -25.0
				responseFunc = sinTime
				timeRate = 13.9626
				player = 1
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
		thickness = 1.1
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = jitterDeform
				scaleMod = 500.0
				spectrumBand = 10
			}
		]
	}
]
