tb_strobe_1 = {
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
			Type = line
			Pos = (0.5, 0.5, 0.0)
			length = 1.0
			Color = [
				4
				4
				4
				255
			]
			BlendMode = blend
			thickness = 500.0
			angle = 0
			angularvel = 0
			controls = [
				{
					Type = beaton
					response = brightnessmodulation
					scalemod = 1.0
					fade = 0.2
				}
			]
		}
	]
}
