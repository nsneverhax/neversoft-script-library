OG_Subtract_Torn_Clouds = [
	{
		type = blendPrev
		offset = (0.0, -0.01)
		scale = (1.0, 1.0)
		Color = [
			255
			248
			242
			249
		]
		angle = 0.0
		angularVel = 0
		BlendMode = blend_AlphaDiffuse
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		Color = [
			216
			207
			255
			50
		]
		angle = 0.0
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0001, 0.3)
		scale = (4.0, 1.0)
		Color = [
			255
			255
			255
			84
		]
		angle = 0
		angularVel = 0
		BlendMode = subtract
	}
	{
		type = line
		Pos = (0.5, 0.88, 0.0)
		length = 0.95
		Color = [
			123
			189
			255
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
				scaleMod = 500.0
				spectrumBand = 0
			}
		]
	}
]
