og_frequency_burst_wave_b = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.97999996, 0.97999996)
		color = [
			254
			252
			251
			242
		]
		angle = 0.00174533
		angularvel = 0
		blendmode = blend
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.001
				responsefunc = sintime
				timerate = 1.0472
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.05
		color = [
			50
			57
			84
			255
		]
		blendmode = add
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 400.0
				spectrumband = 0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.1
		color = [
			143
			137
			120
			108
		]
		blendmode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.001
		color = [
			34
			17
			39
			75
		]
		blendmode = add
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 15.708
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.1
		color = [
			26
			21
			0
			22
		]
		blendmode = add
		thickness = 30.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 0
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.1
		radius2 = 0.5
		color = [
			143
			143
			143
			45
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 17.453299
	}
]
