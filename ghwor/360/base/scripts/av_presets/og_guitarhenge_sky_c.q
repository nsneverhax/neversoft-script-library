og_guitarhenge_sky_c = [
	{
		Type = blendprev
		offset = (0.0, 0.001)
		Scale = (0.9, 0.95)
		Color = [
			223
			235
			235
			255
		]
		angle = 0.0
		angularvel = 0
		BlendMode = blend
		controls = [
			{
				Type = frequency
				response = huemodulation
				scalemod = 0.5
				spectrumband = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			121
			200
			193
			0
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.05
				responsefunc = sintime
				timerate = 1.0472
			}
			{
				Type = constant
				response = radiusscale
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 0.00872665
				timerate = 1.5708001
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.1
				responsefunc = sintime
				timerate = 1.0472
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = -0.2
				responsefunc = sintime
				timerate = 1.0472
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.1
		Color = [
			121
			200
			193
			0
		]
		BlendMode = brighten
		thickness = 8.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.05
				responsefunc = sintime
				timerate = 1.0472
			}
			{
				Type = constant
				response = radiusscale
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 0.00872665
				timerate = 1.5708001
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.1
				responsefunc = sintime
				timerate = 1.0472
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = -0.2
				responsefunc = sintime
				timerate = 1.0472
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.4, 0.0)
		length = -0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				responsefunc = sintime
				timerate = 3.1415896
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.4, 0.0)
		length = -0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -100.0
				responsefunc = sintime
				timerate = 3.1415896
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.4, 0.0)
		length = -0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -200.0
				responsefunc = sintime
				timerate = 3.1415896
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.4, 0.0)
		length = -0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.1415896
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.4, 0.0)
		length = 0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.4, 0.0)
		length = 0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.4, 0.0)
		length = 0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -200.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.4, 0.0)
		length = 0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.4)
		Scale = (3.0, 0.01)
		width = 1.0
		height = 1.0
		Color = [
			99
			81
			0
			25
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = 3.1415896
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.1
				Player = 1
				fade = 1.0
			}
			{
				Type = beaton
				response = scaley
				scalemod = 0.2
				fade = 0.8
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.1
		Color = [
			121
			200
			193
			198
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = 1000.0
				spectrumband = 2
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			121
			200
			193
			124
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = 1000.0
				spectrumband = 2
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.4, 0.0)
		Scale = (1.0, 0.2)
		length = 0.05
		InnerRadius = 0.25
		outerradius = 0.05
		Color = [
			0
			0
			0
			255
		]
		material = og_mat_flare_blend
		thickness = 20
		angularvel = 1.0
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.4, 0.0)
		Scale = (1.0, 0.2)
		length = 0.05
		InnerRadius = 0.25
		outerradius = 0.05
		Color = [
			0
			0
			0
			255
		]
		material = og_mat_flare_blend
		thickness = 20
		angularvel = -1.0
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.4, 0.0)
		Scale = (1.0, 1.0)
		length = 0.125
		InnerRadius = 0.25
		outerradius = 0.05
		Color = [
			0
			0
			0
			255
		]
		material = og_mat_flare_blend
		thickness = 20
		angularvel = 2.0
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.4, 0.0)
		Scale = (1.0, 1.0)
		length = 0.125
		InnerRadius = 0.25
		outerradius = 0.05
		Color = [
			0
			0
			0
			255
		]
		material = og_mat_flare_blend
		thickness = 20.0
		angularvel = -2.0
	}
]
