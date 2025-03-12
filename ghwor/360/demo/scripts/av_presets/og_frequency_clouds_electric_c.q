og_frequency_clouds_electric_c = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		color = [
			242
			240
			240
			255
		]
		angle = 0.0
		angularvel = 0
		blendmode = blend
		controls = [
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			219
			161
			255
			0
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 0
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			106
			149
			255
			0
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -100.0
				spectrumband = 0
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			219
			161
			255
			0
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -200.0
				spectrumband = 0
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			106
			149
			255
			0
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			219
			161
			255
			0
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -200.0
				spectrumband = 0
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			106
			149
			255
			0
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			219
			161
			255
			0
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 0
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			106
			149
			255
			0
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -100.0
				spectrumband = 0
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.001
		color = [
			255
			245
			182
			0
		]
		blendmode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency_history
				response = deform
				scalemod = 600.0
				spectrumband = 2
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.1
		color = [
			255
			110
			0
			255
		]
		blendmode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency_history
				response = deform
				scalemod = 600.0
				spectrumband = 1
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (0.5, 0.5)
		width = 0.5
		height = 0.5
		color = [
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
				type = beaton
				response = alphamodulation
				scalemod = 0.02
				fade = 1.0
			}
		]
	}
]
