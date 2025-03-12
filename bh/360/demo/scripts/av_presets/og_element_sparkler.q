og_element_sparkler = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.95, 0.85)
		color = [
			216
			160
			160
			255
		]
		angle = 0
		angularvel = 0
		blendmode = blend
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (0.5, 0.5)
		width = 0.5
		height = 0.5
		color = [
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
				type = constant
				response = offsetx
				scalemod = 0.01
				responsefunc = costime
			}
			{
				type = constant
				response = offsety
				scalemod = 0.01
				responsefunc = sintime
			}
			{
				type = notehit
				response = scalex
				scalemod = 0.1
				responsefunc = sintime
				player = 1
				fade = 0.25
			}
			{
				type = notehit
				response = scaley
				scalemod = 0.1
				responsefunc = sintime
				player = 1
				fade = 0.25
			}
			{
				type = beaton
				response = brightnessmodulation
				scalemod = 0.1
				fade = 0.5
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.1
		radius2 = 1.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 5.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.0
				spectrumband = 1
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = -0.1
		radius2 = 0.3
		color = [
			255
			255
			255
			255
		]
		blendmode = subtract
		thickness = 2.0
		angle = 0
		angularvel = 2.0944
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.0
				spectrumband = 1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.06
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 20.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.05
				player = 1
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.2
		height = 0.2
		color = [
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
