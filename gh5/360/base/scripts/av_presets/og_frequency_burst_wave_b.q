og_frequency_burst_wave_b = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.97999996, 0.97999996)
		Color = [
			254
			252
			251
			242
		]
		angle = 0.00174533
		angularvel = 0
		BlendMode = blend
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.001
				responsefunc = sintime
				timerate = 1.0472
			}
		]
	}
	{
		Type = circle
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
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 400.0
				spectrumband = 0
			}
		]
	}
	{
		Type = circle
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
		angularvel = 0
		controls = [
		]
	}
	{
		Type = circle
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
	{
		Type = line
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
		angularvel = 15.708
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.872665
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 0
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 19
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
		angularvel = 17.453299
	}
]
