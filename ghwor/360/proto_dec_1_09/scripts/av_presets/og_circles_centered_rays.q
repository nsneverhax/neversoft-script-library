og_circles_centered_rays = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.9, 0.9)
		Color = [
			255
			255
			255
			254
		]
		angle = 0
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 5
		radius = 0.01
		radius2 = 0.5
		Color = [
			123
			150
			255
			255
		]
		BlendMode = blend_alphadiffuse
		thickness = 1.0
		angle = 0
		angularvel = 1.7453301
		controls = [
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.01
		Color = [
			31
			215
			0
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.125
				Player = 1
				gemcolor = green
				fade = 1.0
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				gemcolor = green
				fade = 1.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.01
		Color = [
			211
			0
			0
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.125
				Player = 1
				gemcolor = red
				fade = 1.0
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				gemcolor = red
				fade = 1.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.01
		Color = [
			255
			220
			0
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.125
				Player = 1
				gemcolor = yellow
				fade = 1.0
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				gemcolor = yellow
				fade = 1.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.01
		Color = [
			0
			62
			255
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.125
				Player = 1
				gemcolor = blue
				fade = 1.0
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				gemcolor = blue
				fade = 1.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.01
		Color = [
			255
			143
			0
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.125
				Player = 1
				gemcolor = orange
				fade = 1.0
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				gemcolor = orange
				fade = 1.0
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
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 5
		radius = 0.01
		radius2 = 0.5
		Color = [
			123
			150
			255
			255
		]
		BlendMode = blend_alphadiffuse
		thickness = 1.0
		angle = 0
		angularvel = -1.7453301
		controls = [
		]
	}
]
