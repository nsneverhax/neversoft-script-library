og_lhc_strobe = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.9, 0.9)
		Color = [
			248
			255
			254
			255
		]
		angle = 0.0
		angularvel = 0
		BlendMode = add
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		Color = [
			255
			255
			255
			255
		]
		material = og_mat_rays_a
		BlendMode = blend
		angle = 0
		angularvel = 3.1415896
		controls = [
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		Color = [
			255
			255
			255
			255
		]
		material = og_mat_rays_b
		BlendMode = blend
		angle = 0
		angularvel = -0.872665
		controls = [
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.5
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 174.533
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			255
			255
			255
			3
		]
		material = og_mat_lenzflare_add
		BlendMode = blend
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				Type = beaton
				response = alphamodulation
				scalemod = 0.065
				fade = 0.1
			}
		]
	}
]
