og_aurora_borealis = [
	{
		type = blendprev
		offset = (0.0, -0.001)
		scale = (0.99899995, 0.99899995)
		color = [
			127
			127
			0
			12
		]
		angle = 0.000872665
		angularvel = 0.0
		blendmode = diffuse
		controls = [
			{
				type = frequency
				response = redmodulation
				scalemod = 500.0
				spectrumband = 1
			}
			{
				type = frequency
				response = greenmodulation
				scalemod = 500.0
				spectrumband = 2
			}
			{
				type = frequency
				response = bluemodulation
				scalemod = 1000.0
				spectrumband = 3
			}
		]
	}
	{
		type = line
		pos = (0.6, 0.5, 0.0)
		length = 1.0
		color = [
			61
			160
			198
			31
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0.0
		angularvel = -0.872665
		controls = [
			{
				type = frequency_history
				response = deform
				scalemod = 3000.0
				spectrumband = 10
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.2, 0.0)
		scale = (1.0, 1.0)
		length = 0.05
		innerradius = 0.01
		outerradius = 0.05
		color = [
			255
			185
			141
			255
		]
		material = og_mat_flare_add
		thickness = 20.0
		angularvel = 174.533
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.2, 0.0)
		scale = (1.0, 1.0)
		length = 0.2
		innerradius = 0.01
		outerradius = 0.05
		color = [
			255
			119
			33
			255
		]
		material = og_mat_flare_add
		thickness = 20.0
		angularvel = 8.726729
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.2, 0.0)
		scale = (1.0, 1.0)
		length = 0.2
		innerradius = 0.1
		outerradius = 0.5
		color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_add
		thickness = 20.0
		angularvel = 8.726729
	}
	{
		type = line
		pos = (0.6, 0.98999995, 0.0)
		length = 1.0
		color = [
			0
			11
			28
			31
		]
		blendmode = subtract
		thickness = 10.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				type = frequency_history
				response = deform
				scalemod = 3000.0
				spectrumband = 10
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.001
		color = [
			154
			39
			255
			255
		]
		blendmode = multiply
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
]
