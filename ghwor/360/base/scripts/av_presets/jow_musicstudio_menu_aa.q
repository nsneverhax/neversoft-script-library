jow_musicstudio_menu_aa = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.9, 1.5)
		Color = [
			255
			255
			255
			254
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = blend
		controls = [
		]
	}
	{
		Type = line
		Pos = (0.5, 0.0, 0.0)
		length = 1.0
		Color = [
			38
			30
			23
			255
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = huemodulation
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.17453298
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 1.0, 0.0)
		length = 1.0
		Color = [
			38
			30
			23
			255
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = huemodulation
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.17453298
			}
		]
	}
	{
		Type = line
		Pos = (0.0, 0.0, 0.0)
		length = 2.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularvel = 1.0
		controls = [
		]
	}
	{
		Type = line
		Pos = (1.0, 0.0, 0.0)
		length = 2.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularvel = -1.0
		controls = [
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = 0.5
		Color = [
			204
			255
			209
			255
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0.0
		angularvel = 0.0
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
		Pos = (0.25, 0.5, 0.0)
		length = 0.5
		Color = [
			204
			255
			209
			255
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
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
		Pos = (0.75, 0.5, 0.0)
		length = -0.5
		Color = [
			204
			255
			209
			255
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
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
		Pos = (0.75, 0.5, 0.0)
		length = -0.5
		Color = [
			204
			255
			209
			255
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0.0
		angularvel = 0
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
		Pos = (0.0, 1.0, 0.0)
		length = 2.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularvel = -1.0
		controls = [
		]
	}
	{
		Type = line
		Pos = (1.0, 1.0, 0.0)
		length = 2.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularvel = 1.0
		controls = [
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = 0.5
		Color = [
			110
			255
			211
			255
		]
		material = jow_mat_colorblue01_blend
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = -0.5
		Color = [
			110
			255
			211
			255
		]
		material = jow_mat_colorblue01_blend
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = 0.5
		Color = [
			110
			255
			211
			255
		]
		material = jow_mat_colorblue01_blend
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = -250.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = -0.5
		Color = [
			110
			255
			211
			255
		]
		material = jow_mat_colorblue01_blend
		thickness = 2.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = -250.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = -1.0
		Color = [
			110
			255
			211
			255
		]
		material = jow_mat_colorblue01_blend
		thickness = 0.5
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = -1.0
		Color = [
			110
			255
			211
			255
		]
		material = jow_mat_colorblue01_blend
		thickness = 0.5
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = -250.0
				spectrumband = 0
			}
		]
	}
]
