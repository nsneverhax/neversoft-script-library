tb_cube_silhouette = [
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		width = 1.0
		height = 1.0
		color = [
			4
			4
			4
			255
		]
		material = tb_mat_space_bkgrnd
		controls = [
			{
				type = beaton
				response = brightnessmodulation
				scalemod = 0.6
				fade = 1.0
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 0.98999995)
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
				response = scalex
				scalemod = 0.1
				responsefunc = costime
				spectrumband = 0
			}
			{
				type = frequencyonbeat
				response = scaley
				scalemod = 0.1
				responsefunc = squarewavetimescalerate
				spectrumband = 0
			}
		]
	}
]
