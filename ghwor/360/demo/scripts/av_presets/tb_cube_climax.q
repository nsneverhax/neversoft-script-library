tb_cube_climax = {
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
			type = sprite
			pos = (0.5, 0.225)
			width = 1.0
			height = -1.0
			color = [
				255
				231
				209
				255
			]
			material = tb_mat_gradient
		}
		{
			type = sprite
			pos = (0.5, 0.5, 0.0)
			width = 1.0
			height = 1.0
			color = [
				97
				64
				21
				255
			]
			material = tb_mat_space_bkgrnd
			controls = [
				{
					type = frequency
					response = brightnessmodulation
					scalemod = 0.3
					responsefunc = costime
					spectrumband = 0
				}
			]
		}
		{
			type = hypotrochoid
			pos = (0.5, 0.4, 0.0)
			length = 0.2005
			innerradius = 0.35000002
			outerradius = 0.15
			tracelength = 18
			color = [
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
					type = frequencyonbeat
					response = angularvelmod
					scalemod = 5.0
					spectrumband = 0
				}
			]
		}
		{
			type = hypotrochoid
			pos = (0.5, 0.5, 0.0)
			length = 0.2005
			innerradius = 0.15
			outerradius = -0.05
			tracelength = 18
			color = [
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
					type = frequencyonbeat
					response = angularvelmod
					scalemod = 5.0
					spectrumband = 0
				}
			]
		}
		{
			type = hypotrochoid
			pos = (0.5, 0.6, 0.0)
			length = 0.2005
			innerradius = 0.25
			outerradius = 0.15
			tracelength = 18
			color = [
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
					type = frequencyonbeat
					response = angularvelmod
					scalemod = 5.0
					spectrumband = 0
				}
			]
		}
		{
			type = hypotrochoid
			pos = (0.5, 0.7, 0.0)
			length = 0.2005
			innerradius = 0.25
			outerradius = 0.05
			tracelength = 18
			color = [
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
					type = frequencyonbeat
					response = angularvelmod
					scalemod = 5.0
					spectrumband = 0
				}
			]
		}
		{
			type = line
			pos = (0.75, 0.625, 0.0)
			length = 0.75
			color = [
				191
				98
				27
				255
			]
			thickness = 5.0
			controls = [
				{
					type = frequency
					response = thicknessscale
					scalemod = 5.0
					spectrumband = 0
				}
				{
					type = frequency
					response = deform
					scalemod = 200.0
					spectrumband = 0
				}
			]
		}
		{
			type = line
			pos = (0.25, 0.625, 0.0)
			length = -0.75
			color = [
				110
				54
				3
				255
			]
			blendmode = add
			thickness = 5.0
			controls = [
				{
					type = frequency
					response = deform
					scalemod = -200.0
					spectrumband = 0
				}
			]
		}
		{
			type = line
			pos = (0.75, 0.6151, 0.0)
			length = 0.5
			color = [
				44
				39
				29
				255
			]
			blendmode = add
			thickness = 6.0
			controls = [
				{
					type = frequency
					response = deform
					scalemod = -100.0
					spectrumband = 0
				}
			]
		}
		{
			type = line
			pos = (0.25, 0.6151, 0.0)
			length = -0.5
			color = [
				44
				39
				29
				255
			]
			blendmode = add
			thickness = 6.0
			controls = [
				{
					type = frequency
					response = deform
					scalemod = 100.0
					spectrumband = 0
				}
			]
		}
		{
			type = line
			pos = (0.75, 0.60510004, 0.0)
			length = -0.5
			color = [
				22
				16
				13
				255
			]
			blendmode = add
			thickness = 6.0
			controls = [
				{
					type = frequency
					response = deform
					scalemod = 150.0
					spectrumband = 0
				}
			]
		}
		{
			type = line
			pos = (0.25, 0.60510004, 0.0)
			length = 0.5
			color = [
				22
				16
				13
				255
			]
			blendmode = add
			thickness = 6.0
			controls = [
				{
					type = frequency
					response = deform
					scalemod = -150.0
					spectrumband = 0
				}
			]
		}
		{
			type = line
			pos = (0.25, 0.6, 0.0)
			length = -0.5
			color = [
				37
				32
				27
				255
			]
			blendmode = add
			thickness = 6.0
			controls = [
				{
					type = frequency
					response = deform
					scalemod = -75.0
					spectrumband = 0
				}
			]
		}
		{
			type = line
			pos = (0.75, 0.6, 0.0)
			length = 0.5
			color = [
				37
				32
				27
				255
			]
			blendmode = add
			thickness = 6.0
			controls = [
				{
					type = frequency
					response = deform
					scalemod = 75.0
					spectrumband = 0
				}
			]
		}
		{
			type = line
			pos = (0.25, 0.59499997, 0.0)
			length = -0.5
			color = [
				31
				27
				23
				255
			]
			blendmode = add
			thickness = 6.0
			controls = [
				{
					type = frequency
					response = deform
					scalemod = -125.0
					spectrumband = 0
				}
			]
		}
		{
			type = line
			pos = (0.75, 0.59499997, 0.0)
			length = 0.5
			color = [
				31
				27
				23
				255
			]
			blendmode = add
			thickness = 6.0
			controls = [
				{
					type = frequency
					response = deform
					scalemod = 125.0
					spectrumband = 0
				}
			]
		}
		{
			type = line
			pos = (0.25, 0.585, 0.0)
			length = -0.5
			color = [
				18
				15
				14
				255
			]
			blendmode = add
			thickness = 6.0
			controls = [
				{
					type = frequency
					response = deform
					scalemod = -100.0
					spectrumband = 0
				}
			]
		}
		{
			type = line
			pos = (0.75, 0.585, 0.0)
			length = 0.5
			color = [
				18
				15
				14
				255
			]
			blendmode = add
			thickness = 6.0
			controls = [
				{
					type = frequency
					response = deform
					scalemod = 100.0
					spectrumband = 0
				}
			]
		}
		{
			type = sprite
			pos = (0.25, 0.525)
			width = -0.51
			height = 0.25149998
			color = [
				44
				44
				44
				255
			]
			material = tb_mat_demonstg2
		}
		{
			type = sprite
			pos = (0.75, 0.525)
			width = 0.51
			height = 0.25149998
			color = [
				44
				44
				44
				255
			]
			material = tb_mat_demonstg2
		}
		{
			type = sprite
			pos = (0.25, 0.525)
			width = -0.51
			height = 0.25149998
			color = [
				88
				88
				88
				255
			]
			material = tb_mat_demonstg1
		}
		{
			type = sprite
			pos = (0.75, 0.525)
			width = 0.51
			height = 0.25149998
			color = [
				88
				88
				88
				255
			]
			material = tb_mat_demonstg1
		}
		{
			type = rect
			pos = (0.5, 1.15)
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
			pos = (0.16, 0.31)
			scale = (0.75, 0.75)
			width = -0.42700002
			height = 0.25149998
			color = [
				51
				51
				51
				255
			]
			material = tb_mat_demonstg3
		}
		{
			type = sprite
			pos = (0.85, 0.31)
			scale = (0.75, 0.75)
			width = 0.42700002
			height = 0.25149998
			color = [
				51
				51
				51
				255
			]
			material = tb_mat_demonstg3
		}
		{
			type = sprite
			pos = (0.5, 0.31)
			scale = (0.75, 0.75)
			width = -0.51
			height = 0.25149998
			color = [
				51
				51
				51
				255
			]
			material = tb_mat_demonstg4
		}
		{
			type = rect
			pos = (0.5, -0.285)
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
	]
}
