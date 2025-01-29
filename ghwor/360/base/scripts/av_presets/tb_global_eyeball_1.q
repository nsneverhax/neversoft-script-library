tb_global_eyeball_1 = [
	{
		Type = sprite
		Pos = (0.5, -0.095000006)
		Scale = (1.0, 2.0)
		width = 1.0
		height = -0.5
		Color = [
			136
			83
			74
			255
		]
		material = tb_mat_gradient
	}
	{
		Type = sprite
		Pos = (0.5, 0.89)
		Scale = (1.0, 2.0)
		width = 1.0
		height = 0.5
		Color = [
			136
			83
			74
			255
		]
		material = tb_mat_gradient
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.05
		Color = [
			28
			28
			28
			110
		]
		controls = [
			{
				Type = frequencyonbeat
				response = offsetx
				scalemod = 0.65000004
				responsefunc = costime
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = offsety
				scalemod = 0.35000002
				responsefunc = squarewavetime
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.4)
		width = 0.4
		height = 0.4
		Color = [
			226
			226
			226
			255
		]
		material = tb_mat_eye_blend
		controls = [
			{
				Type = frequencyonbeat
				response = offsetx
				scalemod = 0.65000004
				responsefunc = costime
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = offsety
				scalemod = 0.35000002
				responsefunc = squarewavetime
				spectrumband = 0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.2
		Color = [
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
				Type = frequencyonbeat
				response = saturation2modulation
				scalemod = 6.5
				responsefunc = sintime
				timerate = 1.7453301
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = hue2modulation
				scalemod = 3.0
				responsefunc = sintime
				timerate = 1.7453301
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = offsetx
				scalemod = 0.65000004
				responsefunc = costime
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = offsety
				scalemod = 0.35000002
				responsefunc = squarewavetime
				spectrumband = 0
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 0.98999995)
		Color = [
			255
			255
			255
			254
		]
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.03
		Color = [
			255
			255
			255
			119
		]
		BlendMode = multiply
		thickness = 2.1
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 0.5
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = offsetx
				scalemod = 0.65000004
				responsefunc = costime
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = offsety
				scalemod = 0.35000002
				responsefunc = squarewavetime
				spectrumband = 0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.02
		Color = [
			255
			255
			255
			152
		]
		BlendMode = multiply
		thickness = 2.1
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 0.8
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = offsetx
				scalemod = 0.65000004
				responsefunc = costime
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = offsety
				scalemod = 0.35000002
				responsefunc = squarewavetime
				spectrumband = 0
			}
		]
	}
	{
		Type = circle
		Pos = (0.525, 0.35000002, 0.0)
		radius = 0.015
		Color = [
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
				Type = frequencyonbeat
				response = offsetx
				scalemod = 0.65000004
				responsefunc = costime
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = offsety
				scalemod = 0.35000002
				responsefunc = squarewavetime
				spectrumband = 0
			}
		]
	}
]
