og_element_drumograph = [
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.3
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = -0.2
				Player = 1
				fade = 0.5
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (0.1, 0.1)
		width = 0.5
		height = 0.5
		Color = [
			0
			8
			17
			255
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = redmodulation
				scalemod = 0.25
				Player = 1
				fade = 0.5
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.01
				responsefunc = costime
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.01
				responsefunc = sintime
			}
			{
				Type = notehit
				response = greenmodulation
				scalemod = 0.1
				Player = 1
				fade = 0.1
			}
			{
				Type = notehit
				response = scalex
				scalemod = 1.0
				responsefunc = sintime
				Player = 1
				fade = 1.0
			}
			{
				Type = notehit
				response = scaley
				scalemod = 1.0
				responsefunc = sintime
				Player = 1
				fade = 1.0
			}
			{
				Type = beaton
				response = scalex
				scalemod = 0.5
				fade = 0.1
			}
			{
				Type = beaton
				response = scaley
				scalemod = 0.5
				fade = 0.1
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.1
		radius2 = 1.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 10.0
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
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.1
		radius2 = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 10.0
		angle = 0
		angularvel = 2.0944
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 0.5
				responsefunc = log2
				spectrumband = 1
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 0.98999995)
		Color = [
			255
			255
			255
			242
		]
		angle = 0
		angularvel = 0
		BlendMode = add
	}
]
