og_debug_band = [
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = 0.0
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = frequency
				response = lengthscale
				scalemod = 1.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.5
		color = [
			255
			255
			255
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
				scalemod = -1000.0
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
			255
			255
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
				scalemod = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.0
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = frequency
				response = lengthscale
				scalemod = 1.0
				spectrumband = 0
			}
		]
	}
]
