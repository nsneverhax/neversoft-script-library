og_quiet_pulse_a = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.97999996, 0.97999996)
		Color = [
			250
			255
			255
			255
		]
		angle = 0.00872665
		angularvel = 0.0
		BlendMode = blend
		controls = [
			{
				Type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.523599
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.015
		Color = [
			128
			114
			97
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.025
				responsefunc = costime
			}
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 10
			}
			{
				Type = constant
				response = brightnessmodulation
				scalemod = 0.8
				responsefunc = sintime
				timerate = 0.523599
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			62
			62
			62
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 1.0646498
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.15
		Color = [
			62
			62
			62
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = costime
				timerate = 1.0472
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 6
		radius = 0.0
		radius2 = 0.5
		Color = [
			62
			62
			62
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 3.1415896
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.025
				responsefunc = costime
			}
			{
				Type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 3.1415896
				timerate = 2.0944
			}
			{
				Type = constant
				response = radius2scale
				scalemod = 0.1
				responsefunc = costime
				timerate = 2.26893
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.015
		Color = [
			128
			114
			97
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = costime
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.025
				responsefunc = sintime
			}
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 10
			}
			{
				Type = constant
				response = brightnessmodulation
				scalemod = 0.8
				responsefunc = costime
				timerate = 0.523599
			}
		]
	}
]
