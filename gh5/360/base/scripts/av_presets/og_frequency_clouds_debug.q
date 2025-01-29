og_frequency_clouds_debug = [
	{
		Type = blendprev
		offset = (0.0, 0.001)
		Scale = (0.99649996, 0.98999995)
		Color = [
			229
			229
			229
			255
		]
		angle = 0.0
		angularvel = 0
		BlendMode = blend
		controls = [
			{
				Type = frequency
				response = redmodulation
				scalemod = 0.1
				spectrumband = 1
			}
			{
				Type = frequency
				response = greenmodulation
				scalemod = 0.1
				spectrumband = 5
			}
			{
				Type = frequency
				response = bluemodulation
				scalemod = 0.1
				spectrumband = 8
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.4, 0.0)
		length = 0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = blend
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
		length = 0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = blend
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
		length = 0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = blend
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
		length = 0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = blend
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
		length = -0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = blend
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
		length = -0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = blend
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
		length = -0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = blend
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
		length = -0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = blend
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
			178
			146
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
			255
			255
			255
			255
		]
		material = og_mat_flare_add
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
			255
			255
			255
			255
		]
		material = og_mat_flare_add
		thickness = 20
		angularvel = -1.0
	}
]
