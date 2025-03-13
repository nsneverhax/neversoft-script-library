og_vocals_freeform_effects = [
	{
		type = blendprev
		offset = (-0.005, 0.0)
		scale = (1.0, 1.1)
		color = [
			202
			219
			244
			242
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			219
			55
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = history
				historytype = vocalsamplitude
				response = deform
				scalemod = 25.0
				responsefunc = sintime
				timerate = 13.9626
				player = 1
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = -1.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = jitterdeform
				scalemod = 100.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			219
			55
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = history
				historytype = vocalsamplitude
				response = deform
				scalemod = -25.0
				responsefunc = sintime
				timerate = 13.9626
				player = 1
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
		thickness = 1.1
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = jitterdeform
				scalemod = 500.0
				spectrumband = 10
			}
		]
	}
]
