og_frequency_clouds_c = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 0.98999995)
		Color = [
			254
			250
			242
			255
		]
		angle = 0.0
		angularvel = 0
		BlendMode = blend
		controls = [
			{
				Type = gamepaused
				response = alphamodulation
				scalemod = -0.001
				fade = 1.0
			}
			{
				Type = gamepaused
				response = scalex
				scalemod = 0.01
				responsefunc = sintime
				timerate = 0.872665
				fade = 1.0
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.005
				responsefunc = sintime
				timerate = 0.872665
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.001
		Color = [
			182
			158
			202
			255
		]
		BlendMode = multiply
		thickness = 5.0
		angle = 0
		angularvel = 2.0944
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
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
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
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
		Pos = (0.25, 0.5, 0.0)
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
				scalemod = -200.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
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
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
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
				scalemod = -200.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
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
		Pos = (0.25, 0.5, 0.0)
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
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
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
				spectrumband = 0
			}
		]
	}
]
