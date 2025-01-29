tb_cube_wash = [
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		Color = [
			44
			38
			44
			255
		]
		material = tb_mat_space_bkgrnd
		angle = 0
		angularvel = 0
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
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		length = 0.2005
		InnerRadius = 0.15
		outerradius = -0.05
		tracelength = 12
		Color = [
			72
			72
			72
			255
		]
		material = tb_mat_space3_bkgrnd
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
		Scale = (1.0, 1.0)
		length = 0.2005
		InnerRadius = 0.25
		outerradius = 0.15
		tracelength = 8
		Color = [
			72
			72
			72
			255
		]
		material = tb_mat_space3_bkgrnd
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
		Scale = (1.0, 1.0)
		length = 0.2005
		InnerRadius = 0.25
		outerradius = 0.05
		tracelength = 28
		Color = [
			72
			72
			72
			255
		]
		material = tb_mat_space3_bkgrnd
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
]
