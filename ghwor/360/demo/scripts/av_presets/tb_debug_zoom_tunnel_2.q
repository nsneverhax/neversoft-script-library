tb_debug_zoom_tunnel_2 = [
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.5)
		width = 1.0
		height = 1.0
		color = [
			74
			0
			112
			255
		]
		material = tb_mat_gradient
		angle = 0
		angularvel = 0
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.02
		color = [
			88
			75
			17
			22
		]
		color2 = [
			255
			132
			0
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0.26179898
		controls = [
			{
				type = beaton
				response = radiusscale
				scalemod = 0.01
				fade = 0.1
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.895, 0.895)
		color = [
			252
			252
			252
			254
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = blend
		controls = [
			{
				type = beaton
				response = green2modulation
				scalemod = 3.4
				responsefunc = sintimescalerate
				fade = 0.3
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (0.01, 0.01)
		width = 0.75
		height = 0.75
		color = [
			255
			241
			227
			133
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = 1.5708001
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.5
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = green2modulation
				scalemod = 1.0
				spectrumband = 0
			}
		]
	}
]
