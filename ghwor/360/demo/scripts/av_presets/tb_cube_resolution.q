tb_cube_resolution = [
	{
		type = sprite
		pos = (0.5, 0.5)
		width = 1.0
		height = 1.0
		color = [
			139
			139
			139
			255
		]
		material = tb_mat_space_bkgrnd
		controls = [
			{
				type = beaton
				response = brightnessmodulation
				scalemod = 0.3
				fade = 1.0
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		color = [
			255
			255
			255
			254
		]
		blendmode = blend
		controls = [
			{
				type = frequency
				response = scalexy
				scalemod = 0.15
				spectrumband = 0
			}
		]
	}
	{
		type = rect
		pos = (0.5, 1.135)
		width = 1.0
		height = 1.0
		color = [
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
		blendmode = blend
	}
	{
		type = sprite
		pos = (0.5, 0.501)
		width = 1.0
		height = 0.25
		color = [
			35
			35
			35
			255
		]
		material = tb_mat_conan_image_2b
	}
]
