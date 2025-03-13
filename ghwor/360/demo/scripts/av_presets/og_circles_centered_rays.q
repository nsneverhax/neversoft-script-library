og_circles_centered_rays = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.9, 0.9)
		color = [
			255
			255
			255
			254
		]
		blendmode = blend
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 5
		radius = 0.01
		radius2 = 0.5
		color = [
			123
			150
			255
			255
		]
		blendmode = blend_alphadiffuse
		angularvel = 1.7453301
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.01
		color = [
			31
			215
			0
			0
		]
		blendmode = brighten
		thickness = 10.0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.125
				player = 1
				gemcolor = green
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = green
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.01
		color = [
			211
			0
			0
			0
		]
		blendmode = brighten
		thickness = 10.0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.125
				player = 1
				gemcolor = red
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = red
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.01
		color = [
			255
			220
			0
			0
		]
		blendmode = brighten
		thickness = 10.0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.125
				player = 1
				gemcolor = yellow
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = yellow
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.01
		color = [
			0
			62
			255
			0
		]
		blendmode = brighten
		thickness = 10.0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.125
				player = 1
				gemcolor = blue
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = blue
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.01
		color = [
			255
			143
			0
			0
		]
		blendmode = brighten
		thickness = 10.0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.125
				player = 1
				gemcolor = orange
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = orange
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		width = 0.2
		height = 0.2
		color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_sub
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 5
		radius = 0.01
		radius2 = 0.5
		color = [
			123
			150
			255
			255
		]
		blendmode = blend_alphadiffuse
		angularvel = -1.7453301
	}
]
