og_element_darksphere_b = [
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.1
		radius2 = 1.0
		Color = [
			46
			24
			24
			255
		]
		BlendMode = brighten
		thickness = 50.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 1.0
				responsefunc = log2
				spectrumband = 1
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.9, 0.9)
		Color = [
			255
			255
			255
			253
		]
		angle = 0
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			128
			96
			235
			255
		]
		material = og_mat_circle
		angle = 0
		angularvel = -0.54105204
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			128
			96
			235
			255
		]
		material = og_mat_circle_sub
		angle = 0
		angularvel = 0.523599
		controls = [
			{
				Type = frequency
				response = scalex
				scalemod = 30.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = scaley
				scalemod = 30.0
				spectrumband = 10
			}
		]
	}
]
