tb_global_zoom_tunnel_1 = [
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		Color = [
			124
			0
			176
			255
		]
		material = tb_mat_gradient
		angle = 0
		angularvel = 0
	}
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
		controls = [
			{
				Type = beaton
				response = green2modulation
				scalemod = 3.4
				responsefunc = sintimescalerate
				fade = 0.3
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.02
		Color = [
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
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0.26179898
		controls = [
			{
				Type = beaton
				response = radiusscale
				scalemod = 0.01
				fade = 1.0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (0.05, 0.05)
		width = 0.5
		height = 0.5
		Color = [
			127
			127
			127
			198
		]
		material = og_mat_sphere_sub
		angle = 0
		angularvel = 1.5708001
	}
]
