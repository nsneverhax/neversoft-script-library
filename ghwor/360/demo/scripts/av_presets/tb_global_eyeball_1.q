tb_global_eyeball_1 = [
	{
		type = sprite
		pos = (0.5, -0.095000006)
		scale = (1.0, 2.0)
		width = 1.0
		height = -0.5
		color = [
			136
			83
			74
			255
		]
		material = tb_mat_gradient
	}
	{
		type = sprite
		pos = (0.5, 0.89)
		scale = (1.0, 2.0)
		width = 1.0
		height = 0.5
		color = [
			136
			83
			74
			255
		]
		material = tb_mat_gradient
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.05
		color = [
			28
			28
			28
			110
		]
		controls = [
			{
				type = frequencyonbeat
				response = offsetx
				scalemod = 0.65000004
				responsefunc = costime
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsety
				scalemod = 0.35000002
				responsefunc = squarewavetime
				spectrumband = 0
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.4)
		width = 0.4
		height = 0.4
		color = [
			226
			226
			226
			255
		]
		material = tb_mat_eye_blend
		controls = [
			{
				type = frequencyonbeat
				response = offsetx
				scalemod = 0.65000004
				responsefunc = costime
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsety
				scalemod = 0.35000002
				responsefunc = squarewavetime
				spectrumband = 0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.2
		color = [
			24
			51
			97
			16
		]
		color2 = [
			7
			14
			28
			104
		]
		controls = [
			{
				type = frequencyonbeat
				response = saturation2modulation
				scalemod = 6.5
				responsefunc = sintime
				timerate = 1.7453301
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = hue2modulation
				scalemod = 3.0
				responsefunc = sintime
				timerate = 1.7453301
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsetx
				scalemod = 0.65000004
				responsefunc = costime
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsety
				scalemod = 0.35000002
				responsefunc = squarewavetime
				spectrumband = 0
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
		blendmode = blend
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.03
		color = [
			255
			255
			255
			119
		]
		blendmode = multiply
		thickness = 2.1
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
				scalemod = 0.65000004
				responsefunc = costime
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsety
				scalemod = 0.35000002
				responsefunc = squarewavetime
				spectrumband = 0
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
		blendmode = multiply
		thickness = 2.1
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
				scalemod = 0.65000004
				responsefunc = costime
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsety
				scalemod = 0.35000002
				responsefunc = squarewavetime
				spectrumband = 0
			}
		]
	}
	{
		type = circle
		pos = (0.525, 0.35000002, 0.0)
		radius = 0.015
		color = [
			255
			255
			255
			42
		]
		color2 = [
			255
			255
			255
			106
		]
		controls = [
			{
				type = frequencyonbeat
				response = offsetx
				scalemod = 0.65000004
				responsefunc = costime
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = offsety
				scalemod = 0.35000002
				responsefunc = squarewavetime
				spectrumband = 0
			}
		]
	}
]
