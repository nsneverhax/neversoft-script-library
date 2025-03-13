og_frequency_clouds_electric_d = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.95, 0.95)
		color = [
			251
			255
			235
			255
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
		controls = [
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			255
			255
			255
			255
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
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			0
			0
			0
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -10.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			255
			255
			255
			255
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
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			0
			0
			0
			255
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
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			255
			255
			255
			255
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
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			0
			0
			0
			255
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
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			255
			255
			255
			255
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
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			0
			0
			0
			255
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
				spectrumband = 10
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			36
			8
			51
			25
		]
		material = og_mat_sphere_blend
		angle = 0
		angularvel = 1.7453301
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.05
		color = [
			255
			245
			182
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency_history
				response = deform
				scalemod = 200.0
				spectrumband = 2
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = -0.1
		color = [
			255
			110
			0
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency_history
				response = deform
				scalemod = -200.0
				spectrumband = 1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.001
		color = [
			105
			105
			105
			25
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 1000.0
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			74
			45
			84
			82
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = -1.3089999
	}
]
