tb_global_sym_line_1 = [
	{
		type = blendprev
		offset = (0.0, -0.005)
		scale = (1.125, 0.895)
		color = [
			242
			242
			242
			254
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.75, 0.6, 0.0)
		length = 0.5
		color = [
			44
			39
			29
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -100.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.6, 0.0)
		length = -0.5
		color = [
			44
			39
			29
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.55, 0.0)
		length = 0.5
		color = [
			22
			16
			13
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -200.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.55, 0.0)
		length = -0.5
		color = [
			22
			16
			13
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 0
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.05
		radius2 = 0.5
		color = [
			255
			255
			255
			255
		]
		blendmode = subtract
		angularvel = 0.0872665
		controls = [
			{
				type = beaton
				response = radiusscale
				scalemod = 0.4
				fade = 1.0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			18
			15
			14
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			18
			15
			14
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -500.0
				spectrumband = 0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.6, 0.0)
		length = 0.15
		innerradius = 0.15
		outerradius = 0.45000002
		color = [
			255
			220
			0
			255
		]
		material = og_mat_flare_add
		thickness = 25.0
		angularvel = 1.7453301
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.2
				responsefunc = sintime
				timerate = 3.4906602
				spectrumband = 12
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		length = 0.15
		innerradius = 0.15
		outerradius = 0.45000002
		color = [
			255
			220
			0
			255
		]
		material = og_mat_flare_add
		thickness = 25.0
		angularvel = -1.7453301
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.2
				responsefunc = sintime
				timerate = 3.4906602
				spectrumband = 12
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.55, 0.0)
		length = 0.5
		color = [
			31
			27
			23
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 300.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.55, 0.0)
		length = -0.5
		color = [
			31
			27
			23
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -300.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.6, 0.0)
		length = 0.5
		color = [
			31
			27
			23
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.6, 0.0)
		length = -0.5
		color = [
			31
			27
			23
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -200.0
				spectrumband = 0
			}
		]
	}
]
