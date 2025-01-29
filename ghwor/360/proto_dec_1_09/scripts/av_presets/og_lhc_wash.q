og_lhc_wash = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 0.98999995)
		Color = [
			255
			247
			254
			254
		]
		angle = 0.0
		angularvel = 0
		BlendMode = blend
		controls = [
			{
				Type = beaton
				response = redmodulation
				scalemod = -0.5
				fade = 0.025
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.01
		Color = [
			255
			233
			174
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.2
				responsefunc = sintime
				timerate = 0.69813204
			}
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 10
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 8
		radius = 0.1
		radius2 = 0.5
		Color = [
			172
			255
			253
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0.872665
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 9
		radius = 0.1
		radius2 = 0.5
		Color = [
			172
			255
			253
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = -0.872665
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.01
		Color = [
			255
			233
			174
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.2
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 0.69813204
			}
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 10
			}
			{
				Type = constant
				response = anglemod
				scalemod = 0.25
				responsefunc = sintime
				timerate = 1.0472
			}
		]
	}
]
