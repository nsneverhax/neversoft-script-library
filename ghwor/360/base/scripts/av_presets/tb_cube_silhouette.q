tb_cube_silhouette = [
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		width = 1.0
		height = 1.0
		Color = [
			4
			4
			4
			255
		]
		material = tb_mat_space_bkgrnd
		controls = [
			{
				Type = beaton
				response = brightnessmodulation
				scalemod = 0.6
				fade = 1.0
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 0.98999995)
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
				response = scalex
				scalemod = 0.1
				responsefunc = costime
				spectrumband = 0
			}
			{
				Type = frequencyonbeat
				response = scaley
				scalemod = 0.1
				responsefunc = squarewavetimescalerate
				spectrumband = 0
			}
		]
	}
]
