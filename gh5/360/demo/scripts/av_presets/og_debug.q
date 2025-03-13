og_debug = [
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		length = 0.9
		color = [
			50
			150
			250
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 150
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.8, 0.0)
		length = 0.9
		color = [
			250
			244
			203
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 150
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.0
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
		thickness = 5.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = lengthscale
				scalemod = 0.9
				spectrumband = 1
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.9
		color = [
			96
			50
			250
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = jitterdeform
				scalemod = 150
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		length = 1.0
		color = [
			66
			0
			0
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0
	}
]
