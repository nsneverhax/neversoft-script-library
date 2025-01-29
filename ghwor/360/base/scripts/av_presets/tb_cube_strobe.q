tb_cube_strobe = {
	viewport_params = {
		clearcolor = [
			24
			24
			24
			220
		]
		BlendMode = diffuse
		alphafromgray = 1
	}
	primitives = [
		{
			Type = sprite
			Pos = (0.5, 0.225)
			width = 1.0
			height = -1.0
			Color = [
				209
				248
				255
				255
			]
			material = tb_mat_gradient
		}
		{
			Type = sprite
			Pos = (0.5, 0.49)
			Scale = (1.0, 1.5)
			width = 1.0
			height = -1.0
			Color = [
				11
				11
				11
				216
			]
			material = tb_mat_gradient
			controls = [
				{
					Type = beaton
					response = brightnessmodulation
					scalemod = 0.6
					fade = 0.2
				}
			]
		}
		{
			Type = sprite
			Pos = (0.5, 0.215)
			Scale = (0.7, 0.1)
			width = 0.95
			height = 0.95
			Color = [
				135
				200
				255
				0
			]
			material = og_mat_flare_add
			controls = [
				{
					Type = frequencyonbeat
					response = alphamodulation
					scalemod = 5.0
					responsefunc = costime
					timerate = 5.23599
					spectrumband = 0
				}
			]
		}
		{
			Type = sprite
			Pos = (0.5, 0.375)
			Scale = (0.15, 1.0)
			width = 0.6
			height = 0.32500002
			Color = [
				255
				255
				255
				0
			]
			material = tb_mat_lightnin_animated_add
			controls = [
				{
					Type = frequencyonbeat
					response = alphamodulation
					scalemod = 5.0
					responsefunc = costime
					timerate = 5.23599
					spectrumband = 0
				}
			]
		}
		{
			Type = sprite
			Pos = (0.5, 0.45900002)
			width = 0.3
			height = 0.25
			Color = [
				162
				237
				242
				1
			]
			material = tb_mat_spark_animated_add
			controls = [
				{
					Type = frequencyonbeat
					response = alphamodulation
					scalemod = 5.0
					responsefunc = costime
					timerate = 5.23599
					spectrumband = 0
				}
			]
		}
		{
			Type = sprite
			Pos = (0.3, 0.256)
			Scale = (0.7, 0.1)
			width = 0.95
			height = 0.95
			Color = [
				51
				76
				97
				0
			]
			material = og_mat_flare_add
			controls = [
				{
					Type = frequencyonbeat
					response = alphamodulation
					scalemod = 5.0
					responsefunc = costime
					timerate = 3.4906602
					spectrumband = 0
				}
			]
		}
		{
			Type = sprite
			Pos = (0.3, 0.375)
			Scale = (0.15, 1.0)
			width = 0.5
			height = 0.225
			Color = [
				255
				255
				255
				0
			]
			material = tb_mat_lightnin_animated_add
			controls = [
				{
					Type = frequencyonbeat
					response = alphamodulation
					scalemod = 5.0
					responsefunc = costime
					timerate = 3.4906602
					spectrumband = 0
				}
			]
		}
		{
			Type = sprite
			Pos = (0.25, 0.425)
			width = 0.2
			height = 0.15
			Color = [
				162
				237
				242
				1
			]
			material = tb_mat_spark_animated_add
			controls = [
				{
					Type = frequencyonbeat
					response = alphamodulation
					scalemod = 5.0
					responsefunc = costime
					timerate = 3.4906602
					spectrumband = 0
				}
			]
		}
		{
			Type = sprite
			Pos = (0.25, 0.425)
			width = 0.51
			height = 0.51
			Color = [
				13
				13
				13
				255
			]
			material = tb_mat_epic_image_1b
		}
		{
			Type = sprite
			Pos = (0.7, 0.375)
			Scale = (0.15, 1.0)
			width = -0.5
			height = 0.225
			Color = [
				255
				255
				255
				0
			]
			material = tb_mat_lightnin_animated_add
			controls = [
				{
					Type = frequencyonbeat
					response = alphamodulation
					scalemod = 5.0
					responsefunc = costime
					timerate = 10.471999
					spectrumband = 0
				}
			]
		}
		{
			Type = sprite
			Pos = (0.7, 0.425)
			width = -0.2
			height = 0.15
			Color = [
				162
				237
				242
				1
			]
			material = tb_mat_spark_animated_add
			controls = [
				{
					Type = frequencyonbeat
					response = alphamodulation
					scalemod = 5.0
					responsefunc = costime
					timerate = 10.471999
					spectrumband = 0
				}
			]
		}
		{
			Type = sprite
			Pos = (0.75, 0.425)
			width = -0.51
			height = 0.51
			Color = [
				13
				13
				13
				255
			]
			material = tb_mat_epic_image_1b
		}
		{
			Type = rect
			Pos = (0.5, 1.1)
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
			Pos = (0.72499996, 0.27)
			Scale = (0.5, 0.1)
			width = 0.95
			height = 0.95
			Color = [
				51
				76
				97
				0
			]
			material = og_mat_flare_add
			controls = [
				{
					Type = frequencyonbeat
					response = alphamodulation
					scalemod = 5.0
					responsefunc = costime
					timerate = 10.471999
					spectrumband = 0
				}
			]
		}
	]
}
