tb_cube_climax = {
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
				255
				231
				209
				255
			]
			material = tb_mat_gradient
		}
		{
			Type = sprite
			Pos = (0.5, 0.5, 0.0)
			width = 1.0
			height = 1.0
			Color = [
				97
				64
				21
				255
			]
			material = tb_mat_space_bkgrnd
			controls = [
				{
					Type = frequency
					response = brightnessmodulation
					scalemod = 0.3
					responsefunc = costime
					spectrumband = 0
				}
			]
		}
		{
			Type = hypotrochoid
			Pos = (0.5, 0.4, 0.0)
			length = 0.2005
			InnerRadius = 0.35000002
			outerradius = 0.15
			tracelength = 18
			Color = [
				11
				11
				11
				255
			]
			material = tb_mat_space2_bkgrnd
			thickness = 999.0
			angularvel = 3.4906602
			controls = [
				{
					Type = frequencyonbeat
					response = angularvelmod
					scalemod = 5.0
					spectrumband = 0
				}
			]
		}
		{
			Type = hypotrochoid
			Pos = (0.5, 0.5, 0.0)
			length = 0.2005
			InnerRadius = 0.15
			outerradius = -0.05
			tracelength = 18
			Color = [
				11
				11
				11
				255
			]
			material = tb_mat_space2_bkgrnd
			thickness = 999.0
			angularvel = 3.4906602
			controls = [
				{
					Type = frequencyonbeat
					response = angularvelmod
					scalemod = 5.0
					spectrumband = 0
				}
			]
		}
		{
			Type = hypotrochoid
			Pos = (0.5, 0.6, 0.0)
			length = 0.2005
			InnerRadius = 0.25
			outerradius = 0.15
			tracelength = 18
			Color = [
				11
				11
				11
				255
			]
			material = tb_mat_space2_bkgrnd
			thickness = 999.0
			angularvel = 3.4906602
			controls = [
				{
					Type = frequencyonbeat
					response = angularvelmod
					scalemod = 5.0
					spectrumband = 0
				}
			]
		}
		{
			Type = hypotrochoid
			Pos = (0.5, 0.7, 0.0)
			length = 0.2005
			InnerRadius = 0.25
			outerradius = 0.05
			tracelength = 18
			Color = [
				11
				11
				11
				255
			]
			material = tb_mat_space2_bkgrnd
			thickness = 999.0
			angularvel = 3.4906602
			controls = [
				{
					Type = frequencyonbeat
					response = angularvelmod
					scalemod = 5.0
					spectrumband = 0
				}
			]
		}
		{
			Type = line
			Pos = (0.75, 0.625, 0.0)
			length = 0.75
			Color = [
				191
				98
				27
				255
			]
			thickness = 5.0
			controls = [
				{
					Type = frequency
					response = thicknessscale
					scalemod = 5.0
					spectrumband = 0
				}
				{
					Type = frequency
					response = deform
					scalemod = 200.0
					spectrumband = 0
				}
			]
		}
		{
			Type = line
			Pos = (0.25, 0.625, 0.0)
			length = -0.75
			Color = [
				110
				54
				3
				255
			]
			BlendMode = add
			thickness = 5.0
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = -200.0
					spectrumband = 0
				}
			]
		}
		{
			Type = line
			Pos = (0.75, 0.6151, 0.0)
			length = 0.5
			Color = [
				44
				39
				29
				255
			]
			BlendMode = add
			thickness = 6.0
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = -100.0
					spectrumband = 0
				}
			]
		}
		{
			Type = line
			Pos = (0.25, 0.6151, 0.0)
			length = -0.5
			Color = [
				44
				39
				29
				255
			]
			BlendMode = add
			thickness = 6.0
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = 100.0
					spectrumband = 0
				}
			]
		}
		{
			Type = line
			Pos = (0.75, 0.60510004, 0.0)
			length = -0.5
			Color = [
				22
				16
				13
				255
			]
			BlendMode = add
			thickness = 6.0
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = 150.0
					spectrumband = 0
				}
			]
		}
		{
			Type = line
			Pos = (0.25, 0.60510004, 0.0)
			length = 0.5
			Color = [
				22
				16
				13
				255
			]
			BlendMode = add
			thickness = 6.0
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = -150.0
					spectrumband = 0
				}
			]
		}
		{
			Type = line
			Pos = (0.25, 0.6, 0.0)
			length = -0.5
			Color = [
				37
				32
				27
				255
			]
			BlendMode = add
			thickness = 6.0
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = -75.0
					spectrumband = 0
				}
			]
		}
		{
			Type = line
			Pos = (0.75, 0.6, 0.0)
			length = 0.5
			Color = [
				37
				32
				27
				255
			]
			BlendMode = add
			thickness = 6.0
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = 75.0
					spectrumband = 0
				}
			]
		}
		{
			Type = line
			Pos = (0.25, 0.59499997, 0.0)
			length = -0.5
			Color = [
				31
				27
				23
				255
			]
			BlendMode = add
			thickness = 6.0
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = -125.0
					spectrumband = 0
				}
			]
		}
		{
			Type = line
			Pos = (0.75, 0.59499997, 0.0)
			length = 0.5
			Color = [
				31
				27
				23
				255
			]
			BlendMode = add
			thickness = 6.0
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = 125.0
					spectrumband = 0
				}
			]
		}
		{
			Type = line
			Pos = (0.25, 0.585, 0.0)
			length = -0.5
			Color = [
				18
				15
				14
				255
			]
			BlendMode = add
			thickness = 6.0
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = -100.0
					spectrumband = 0
				}
			]
		}
		{
			Type = line
			Pos = (0.75, 0.585, 0.0)
			length = 0.5
			Color = [
				18
				15
				14
				255
			]
			BlendMode = add
			thickness = 6.0
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = 100.0
					spectrumband = 0
				}
			]
		}
		{
			Type = sprite
			Pos = (0.25, 0.525)
			width = -0.51
			height = 0.25149998
			Color = [
				44
				44
				44
				255
			]
			material = tb_mat_demonstg2
		}
		{
			Type = sprite
			Pos = (0.75, 0.525)
			width = 0.51
			height = 0.25149998
			Color = [
				44
				44
				44
				255
			]
			material = tb_mat_demonstg2
		}
		{
			Type = sprite
			Pos = (0.25, 0.525)
			width = -0.51
			height = 0.25149998
			Color = [
				88
				88
				88
				255
			]
			material = tb_mat_demonstg1
		}
		{
			Type = sprite
			Pos = (0.75, 0.525)
			width = 0.51
			height = 0.25149998
			Color = [
				88
				88
				88
				255
			]
			material = tb_mat_demonstg1
		}
		{
			Type = rect
			Pos = (0.5, 1.15)
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
			Pos = (0.16, 0.31)
			Scale = (0.75, 0.75)
			width = -0.42700002
			height = 0.25149998
			Color = [
				51
				51
				51
				255
			]
			material = tb_mat_demonstg3
		}
		{
			Type = sprite
			Pos = (0.85, 0.31)
			Scale = (0.75, 0.75)
			width = 0.42700002
			height = 0.25149998
			Color = [
				51
				51
				51
				255
			]
			material = tb_mat_demonstg3
		}
		{
			Type = sprite
			Pos = (0.5, 0.31)
			Scale = (0.75, 0.75)
			width = -0.51
			height = 0.25149998
			Color = [
				51
				51
				51
				255
			]
			material = tb_mat_demonstg4
		}
		{
			Type = rect
			Pos = (0.5, -0.285)
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
	]
}
