tb_strobe_1 = {
	viewport_params = {
		clearcolor = [
			24
			24
			24
			220
		]
		blendmode = diffuse
		alphafromgray = 1
	}
	primitives = [
		{
			type = line
			pos = (0.5, 0.5, 0.0)
			length = 1.0
			color = [
				4
				4
				4
				255
			]
			blendmode = blend
			thickness = 500.0
			angle = 0
			angularvel = 0
			controls = [
				{
					type = beaton
					response = brightnessmodulation
					scalemod = 1.0
					fade = 0.2
				}
			]
		}
	]
}
