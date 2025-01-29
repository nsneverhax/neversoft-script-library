tb_cube_resolution = [
	{
		Type = sprite
		Pos = (0.5, 0.5)
		width = 1.0
		height = 1.0
		Color = [
			139
			139
			139
			255
		]
		material = tb_mat_space_bkgrnd
		controls = [
			{
				Type = beaton
				response = brightnessmodulation
				scalemod = 0.3
				fade = 1.0
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 0.98999995)
		Color = [
			255
			255
			255
			254
		]
		BlendMode = blend
		controls = [
			{
				Type = frequency
				response = scalexy
				scalemod = 0.15
				spectrumband = 0
			}
		]
	}
	{
		Type = rect
		Pos = (0.5, 1.135)
		width = 1.0
		height = 1.0
		Color = [
			0
			0
			0
			255
		]
		color2 = [
			0
			0
			0
			255
		]
		BlendMode = blend
	}
	{
		Type = sprite
		Pos = (0.5, 0.501)
		width = 1.0
		height = 0.25
		Color = [
			35
			35
			35
			255
		]
		material = tb_mat_conan_image_2b
	}
]
