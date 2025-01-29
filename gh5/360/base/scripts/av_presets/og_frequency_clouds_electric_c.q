og_frequency_clouds_electric_c = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 0.98999995)
		Color = [
			242
			240
			240
			255
		]
		angle = 0.0
		angularvel = 0
		BlendMode = blend
		controls = [
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
			0
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
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
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
			0
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
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
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
			0
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
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
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
			0
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
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
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
			0
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
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
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
			0
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
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
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
			0
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
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
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
			0
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
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.001
		Color = [
			255
			245
			182
			0
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency_history
				response = deform
				scalemod = 600.0
				spectrumband = 2
			}
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			255
			110
			0
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency_history
				response = deform
				scalemod = 600.0
				spectrumband = 1
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (0.5, 0.5)
		width = 0.5
		height = 0.5
		Color = [
			241
			214
			255
			0
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = 0.523599
		controls = [
			{
				Type = beaton
				response = alphamodulation
				scalemod = 0.02
				fade = 1.0
			}
		]
	}
]
