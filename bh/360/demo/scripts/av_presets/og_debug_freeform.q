og_debug_freeform = [
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
		blendmode = add
		thickness = 3.0
		angle = 0.0
		angularvel = 0.0
		controls = [
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
		thickness = 5.0
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
	{
		type = blendprev
		offset = (0.001, 0.0)
		scale = (1.0, 0.9)
		color = [
			166
			104
			244
			204
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
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
				scalemod = 400.0
				spectrumband = 10
			}
		]
	}
]
