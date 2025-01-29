tb_global_ripples_1 = [
	{
		Type = sprite
		Pos = (0.5, -0.095000006)
		Scale = (1.0, 2.0)
		width = 1.0
		height = -0.5
		Color = [
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
				Type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.17627801
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.89)
		Scale = (1.0, 2.0)
		width = 1.0
		height = 0.5
		Color = [
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
				Type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.17627801
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
		angle = 0
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
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
		BlendMode = brighten
		thickness = 4.0
		angle = 0
		angularvel = 0
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
				scalemod = 1.0
				responsefunc = costime
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = offsety
				scalemod = 1.0
				responsefunc = sawtoothtime
				spectrumband = 0
			}
			{
				Type = constant
				response = greenmodulation
				scalemod = -1.0
				responsefunc = sintime
				timerate = 1.7453301
			}
			{
				Type = constant
				response = bluemodulation
				scalemod = 2.0
				responsefunc = sintime
				timerate = 1.7453301
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
		color2 = [
			0
			0
			0
			0
		]
		BlendMode = multiply
		thickness = 3.0
		angle = 0
		angularvel = 0
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
				scalemod = 1.0
				responsefunc = costime
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = offsety
				scalemod = 1.0
				responsefunc = sawtoothtime
				spectrumband = 0
			}
			{
				Type = constant
				response = greenmodulation
				scalemod = -1.0
				responsefunc = sintime
				timerate = 1.7453301
			}
			{
				Type = constant
				response = bluemodulation
				scalemod = 2.0
				responsefunc = sintime
				timerate = 1.7453301
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
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
		BlendMode = brighten
		thickness = 4.0
		angle = 0
		angularvel = 0
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
				scalemod = -1.0
				responsefunc = sintime
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = offsety
				scalemod = -1.0
				responsefunc = squarewavetime
				spectrumband = 0
			}
			{
				Type = constant
				response = greenmodulation
				scalemod = -1.0
				responsefunc = sintime
				timerate = 1.7453301
			}
			{
				Type = constant
				response = greenmodulation
				scalemod = 1.0
				responsefunc = sintime
				timerate = 1.7453301
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
		color2 = [
			0
			0
			0
			0
		]
		BlendMode = multiply
		thickness = 3.0
		angle = 0
		angularvel = 0
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
				scalemod = -1.0
				responsefunc = sintime
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = offsety
				scalemod = -1.0
				responsefunc = squarewavetime
				spectrumband = 0
			}
			{
				Type = constant
				response = greenmodulation
				scalemod = -1.0
				responsefunc = sintime
				timerate = 1.7453301
			}
			{
				Type = constant
				response = greenmodulation
				scalemod = 1.0
				responsefunc = sintime
				timerate = 1.7453301
			}
		]
	}
]
