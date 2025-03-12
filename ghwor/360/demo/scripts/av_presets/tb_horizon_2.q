tb_horizon_2 = {
	bloom_params = {
		on = 1
		fullscreen = 1
		materialfilter = 0
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
			type = sprite
			pos = (0.5, 0.5, 0.0)
			scale = (1.0, 2.0)
			width = 1.0
			height = 1.0
			color = [
				36
				32
				112
				255
			]
			material = tb_mat_gradient
			angle = 0
			angularvel = 0
		}
		{
			type = line
			pos = (0.5, 0.5, 0.0)
			length = 1.0
			color = [
				139
				222
				227
				255
			]
			blendmode = blend
			thickness = 1.0
			angle = 0
			angularvel = 0
			controls = [
				{
					type = frequency
					response = thicknessscale
					scalemod = 75.0
					spectrumband = 0
				}
			]
		}
		{
			type = blendprev
			offset = (0.0, 0.0015)
			scale = (0.98999995, 0.98999995)
			color = [
				255
				255
				255
				254
			]
			angle = 0
			angularvel = 0
			blendmode = blend
		}
	]
}
