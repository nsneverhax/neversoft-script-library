tb_global_ripples_1 = [
	{
		type = sprite
		pos = (0.5, -0.095000006)
		scale = (1.0, 2.0)
		width = 1.0
		height = -0.5
		color = [
			8
			68
			64
			255
		]
		material = tb_mat_gradient
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.17627801
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.89)
		scale = (1.0, 2.0)
		width = 1.0
		height = 0.5
		color = [
			8
			68
			64
			255
		]
		material = tb_mat_gradient
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.17627801
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		color = [
			255
			255
			255
			254
		]
		angle = 0
		angularvel = 0
		blendmode = blend
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.01
		color = [
			255
			255
			255
			255
		]
		color2 = [
			0
			0
			0
			0
		]
		blendmode = brighten
		thickness = 4.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.5
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsetx
				scalemod = 1.0
				responsefunc = costime
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsety
				scalemod = 1.0
				responsefunc = sawtoothtime
				spectrumband = 0
			}
			{
				type = constant
				response = greenmodulation
				scalemod = -1.0
				responsefunc = sintime
				timerate = 1.7453301
			}
			{
				type = constant
				response = bluemodulation
				scalemod = 2.0
				responsefunc = sintime
				timerate = 1.7453301
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.02
		color = [
			255
			255
			255
			152
		]
		color2 = [
			0
			0
			0
			0
		]
		blendmode = multiply
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.8
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsetx
				scalemod = 1.0
				responsefunc = costime
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsety
				scalemod = 1.0
				responsefunc = sawtoothtime
				spectrumband = 0
			}
			{
				type = constant
				response = greenmodulation
				scalemod = -1.0
				responsefunc = sintime
				timerate = 1.7453301
			}
			{
				type = constant
				response = bluemodulation
				scalemod = 2.0
				responsefunc = sintime
				timerate = 1.7453301
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.01
		color = [
			255
			255
			255
			255
		]
		color2 = [
			0
			0
			0
			0
		]
		blendmode = brighten
		thickness = 4.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.5
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsetx
				scalemod = -1.0
				responsefunc = sintime
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsety
				scalemod = -1.0
				responsefunc = squarewavetime
				spectrumband = 0
			}
			{
				type = constant
				response = greenmodulation
				scalemod = -1.0
				responsefunc = sintime
				timerate = 1.7453301
			}
			{
				type = constant
				response = greenmodulation
				scalemod = 1.0
				responsefunc = sintime
				timerate = 1.7453301
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.02
		color = [
			255
			255
			255
			152
		]
		color2 = [
			0
			0
			0
			0
		]
		blendmode = multiply
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.8
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsetx
				scalemod = -1.0
				responsefunc = sintime
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsety
				scalemod = -1.0
				responsefunc = squarewavetime
				spectrumband = 0
			}
			{
				type = constant
				response = greenmodulation
				scalemod = -1.0
				responsefunc = sintime
				timerate = 1.7453301
			}
			{
				type = constant
				response = greenmodulation
				scalemod = 1.0
				responsefunc = sintime
				timerate = 1.7453301
			}
		]
	}
]
