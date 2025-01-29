og_subtract_torn_clouds = [
	{
		Type = blendprev
		offset = (0.0, -0.01)
		Scale = (1.0, 1.0)
		Color = [
			255
			248
			242
			249
		]
		angle = 0.0
		angularvel = 0
		BlendMode = blend_alphadiffuse
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (2.0, 2.0)
		Color = [
			216
			207
			255
			50
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0001, 0.3)
		Scale = (4.0, 1.0)
		Color = [
			255
			255
			255
			84
		]
		angle = 0
		angularvel = 0
		BlendMode = subtract
	}
	{
		Type = line
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
]
