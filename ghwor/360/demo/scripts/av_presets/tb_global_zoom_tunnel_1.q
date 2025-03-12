tb_global_zoom_tunnel_1 = [
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		width = 1.0
		height = 1.0
		color = [
			124
			0
			176
			255
		]
		material = tb_mat_gradient
	}
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
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.02
		color = [
			17
			87
			88
			29
		]
		color2 = [
			88
			186
			255
			255
		]
		angularvel = 0.26179898
		controls = [
			{
				type = beaton
				response = radiusscale
				scalemod = 0.01
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (0.05, 0.05)
		width = 0.5
		height = 0.5
		color = [
			127
			127
			127
			198
		]
		material = og_mat_sphere_sub
		angularvel = 1.5708001
	}
]
