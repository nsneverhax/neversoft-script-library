tb_global_horizon_mist_1 = {
	bloom_params = {
		On = 1
		fullscreen = 1
		MaterialFilter = 0
		subtract = [
			0
			0
			0
			0
		]
		colormodulate = [
			1.0
			1.0
			1.0
			0.8
		]
		saturaion = 1.0
	}
	primitives = [
		{
			Type = sprite
			Pos = (0.5, 0.5, 0.0)
			Scale = (1.0, 2.0)
			width = 1.0
			height = 1.0
			Color = [
				36
				32
				112
				255
			]
			material = tb_mat_gradient
		}
		{
			Type = line
			Pos = (0.5, 0.5, 0.0)
			length = 1.0
			Color = [
				139
				222
				227
				255
			]
			controls = [
				{
					Type = frequency
					response = thicknessscale
					scalemod = 75.0
					spectrumband = 0
				}
			]
		}
		{
			Type = blendprev
			offset = (0.0, 0.0015)
			Scale = (0.98999995, 0.98999995)
			Color = [
				255
				255
				255
				254
			]
			BlendMode = blend
		}
	]
}
