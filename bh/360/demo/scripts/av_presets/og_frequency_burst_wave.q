og_frequency_burst_wave = [
	{
		type = blendprev
		offset = (0.001, 0.005)
		scale = (0.98999995, 0.98999995)
		color = [
			254
			247
			234
			255
		]
		angle = 0.00436332
		angularvel = 0
		blendmode = blend
	}
	{
		type = circle
		pos = (0.5, 0.25, 0.0)
		radius = 0.001
		color = [
			255
			255
			255
			255
		]
		blendmode = add
		thickness = 1.0
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
		type = circle
		pos = (0.5, 0.25, 0.0)
		radius = 0.05
		color = [
			255
			255
			255
			255
		]
		blendmode = subtract
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 450.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.55, 0.0)
		length = 1.0
		color = [
			92
			0
			255
			255
		]
		blendmode = subtract
		thickness = 1.0
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
		type = sprite
		pos = (0.5, 0.25, 0.0)
		scale = (1.0, 0.5)
		width = 0.5
		height = 0.5
		color = [
			0
			0
			0
			0
		]
		material = og_mat_sphere_blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 450.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.55, 0.0)
		length = 0.05
		color = [
			0
			7
			255
			255
		]
		blendmode = brighten
		thickness = 5.0
		angle = 0
		angularvel = 0.872665
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
		type = circle
		pos = (0.5, 0.55, 0.0)
		radius = 0.05
		color = [
			255
			187
			0
			255
		]
		blendmode = subtract
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
		]
	}
]
