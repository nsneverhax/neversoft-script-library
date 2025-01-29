og_element_sparkler = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.95, 0.85)
		Color = [
			216
			160
			160
			255
		]
		angle = 0
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (0.5, 0.5)
		width = 0.5
		height = 0.5
		Color = [
			12
			17
			22
			255
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = 0
		controls = [
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
				response = scalex
				scalemod = 0.1
				responsefunc = sintime
				Player = 1
				fade = 0.25
			}
			{
				Type = notehit
				response = scaley
				scalemod = 0.1
				responsefunc = sintime
				Player = 1
				fade = 0.25
			}
			{
				Type = beaton
				response = brightnessmodulation
				scalemod = 0.1
				fade = 0.5
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
		thickness = 5.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 0.0
				spectrumband = 1
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = -0.1
		radius2 = 0.3
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 2.0
		angle = 0
		angularvel = 2.0944
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 0.0
				spectrumband = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.06
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 20.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.05
				Player = 1
				fade = 0.5
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.2
		height = 0.2
		Color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_sub
		angle = 0
		angularvel = 0
	}
]
