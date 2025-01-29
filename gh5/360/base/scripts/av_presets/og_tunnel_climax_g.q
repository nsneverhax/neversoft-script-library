og_tunnel_climax_g = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (-1.01, 1.01)
		Color = [
			255
			255
			255
			249
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
		controls = [
			{
				Type = meandbs
				response = alphamodulation
				colorscale = 0.1
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (-2.0, -2.0)
		Color = [
			255
			130
			60
			11
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = meandbs
				response = alphamodulation
				colorscale = 0.1
			}
			{
				Type = beaton
				response = alphamodulation
				colorscale = 0.1
				fade = 0.5
			}
			{
				Type = maxdbs
				response = alphamodulation
				colorscale = 0.1
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 9
		radius = 0.2
		radius2 = 0.75
		Color = [
			116
			101
			255
			255
		]
		BlendMode = add
		thickness = 10.0
		angle = 0.0872665
		angularvel = 1.0472
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.6
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend_alphadiffuse
		thickness = 200.0
	}
]
