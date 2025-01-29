OG_Eighties = [
	{
		type = blendPrev
		offset = (0.01, 0.01)
		scale = (1.01, 2.0)
		Color = [
			255
			255
			255
			242
		]
		angle = 0.0
		angularVel = 0.17453298
		BlendMode = add
	}
	{
		type = line
		Pos = (0.5, 0.75, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = add
		thickness = 4.0
		angle = 0.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 1000.0
				responseFunc = log10
				spectrumBand = 10
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.25
		Color = [
			101
			75
			255
			255
		]
		BlendMode = add
		thickness = 10.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 1000.0
				responseFunc = log10
				spectrumBand = 10
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			255
			248
			248
			127
		]
		angle = 0.0
		angularVel = 0.0
		BlendMode = blend
	}
]
