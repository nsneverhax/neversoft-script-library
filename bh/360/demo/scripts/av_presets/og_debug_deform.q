og_debug_deform = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.99899995, 0.99899995)
		color = [
			249
			249
			249
			251
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
	}
	{
		type = circle
		pos = (0.25, 0.5, 0.0)
		radius = 0.125
		color = [
			73
			157
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		controls = [
			{
				type = frequency_history
				response = deform
				scalemod = 500.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.5
		color = [
			255
			174
			139
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 30.0
				spectrumband = 10
			}
		]
	}
	{
		type = circle
		pos = (0.75, 0.5, 0.0)
		radius = 0.125
		color = [
			83
			73
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		controls = [
			{
				type = frequency_history
				response = deform
				scalemod = 500.0
				spectrumband = 10
			}
		]
	}
]
