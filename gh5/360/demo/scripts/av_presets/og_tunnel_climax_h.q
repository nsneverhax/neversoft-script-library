og_tunnel_climax_h = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (-1.01, -1.01)
		color = [
			255
			255
			255
			249
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
		controls = [
			{
				type = meandbs
				response = alphamodulation
				colorscale = 0.1
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (-2.0, -2.0)
		color = [
			255
			130
			60
			11
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = meandbs
				response = alphamodulation
				colorscale = 0.1
			}
			{
				type = beaton
				response = alphamodulation
				colorscale = 0.1
				fade = 0.5
			}
			{
				type = maxdbs
				response = alphamodulation
				colorscale = 0.1
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 9
		radius = 0.2
		radius2 = 0.75
		color = [
			116
			101
			255
			255
		]
		blendmode = add
		thickness = 10.0
		angle = 0.0872665
		angularvel = 1.0472
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.6
		color = [
			255
			255
			255
			255
		]
		blendmode = blend_alphadiffuse
		thickness = 200.0
	}
]
