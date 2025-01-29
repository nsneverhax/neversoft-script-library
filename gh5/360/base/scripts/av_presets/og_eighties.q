og_eighties = [
	{
		Type = blendprev
		offset = (0.01, 0.01)
		Scale = (1.01, 2.0)
		Color = [
			255
			255
			255
			242
		]
		angle = 0.0
		angularvel = 0.17453298
		BlendMode = add
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 1000.0
				responsefunc = log10
				spectrumband = 10
			}
		]
	}
	{
		Type = circle
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
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 1000.0
				responsefunc = log10
				spectrumband = 10
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			255
			248
			248
			127
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = blend
	}
]
