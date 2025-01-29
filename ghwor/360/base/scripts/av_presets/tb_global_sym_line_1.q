tb_global_sym_line_1 = [
	{
		Type = blendprev
		offset = (0.0, -0.005)
		Scale = (1.125, 0.895)
		Color = [
			242
			242
			242
			254
		]
		BlendMode = blend
	}
	{
		Type = line
		Pos = (0.75, 0.6, 0.0)
		length = 0.5
		Color = [
			44
			39
			29
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.25, 0.6, 0.0)
		length = -0.5
		Color = [
			44
			39
			29
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.75, 0.55, 0.0)
		length = 0.5
		Color = [
			22
			16
			13
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.25, 0.55, 0.0)
		length = -0.5
		Color = [
			22
			16
			13
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.05
		radius2 = 0.5
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		angularvel = 0.0872665
		controls = [
			{
				Type = beaton
				response = radiusscale
				scalemod = 0.4
				fade = 1.0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			18
			15
			14
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			18
			15
			14
			255
		]
		BlendMode = add
		thickness = 6.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -500.0
				spectrumband = 0
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.6, 0.0)
		length = 0.15
		InnerRadius = 0.15
		outerradius = 0.45000002
		Color = [
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
				Type = frequency
				response = radiusscale
				scalemod = 0.2
				responsefunc = sintime
				timerate = 3.4906602
				spectrumband = 12
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		length = 0.15
		InnerRadius = 0.15
		outerradius = 0.45000002
		Color = [
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
				Type = frequency
				response = radiusscale
				scalemod = 0.2
				responsefunc = sintime
				timerate = 3.4906602
				spectrumband = 12
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.55, 0.0)
		length = 0.5
		Color = [
			31
			27
			23
			255
		]
		BlendMode = add
		thickness = 6.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 300.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.55, 0.0)
		length = -0.5
		Color = [
			31
			27
			23
			255
		]
		BlendMode = add
		thickness = 6.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -300.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.6, 0.0)
		length = 0.5
		Color = [
			31
			27
			23
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.25, 0.6, 0.0)
		length = -0.5
		Color = [
			31
			27
			23
			255
		]
		BlendMode = add
		thickness = 6.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -200.0
				spectrumband = 0
			}
		]
	}
]
