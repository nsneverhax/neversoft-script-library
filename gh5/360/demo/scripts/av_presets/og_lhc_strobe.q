og_lhc_strobe = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.9, 0.9)
		color = [
			248
			255
			254
			255
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		color = [
			255
			255
			255
			255
		]
		material = og_mat_rays_a
		blendmode = blend
		angle = 0
		angularvel = 3.1415896
		controls = [
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		color = [
			255
			255
			255
			255
		]
		material = og_mat_rays_b
		blendmode = blend
		angle = 0
		angularvel = -0.872665
		controls = [
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.5
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 174.533
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			255
			255
			255
			3
		]
		material = og_mat_lenzflare_add
		blendmode = blend
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				type = beaton
				response = alphamodulation
				scalemod = 0.065
				fade = 0.1
			}
		]
	}
]
