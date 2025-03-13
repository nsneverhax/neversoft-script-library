jow_musicstudio_menu_aa = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.9, 1.5)
		color = [
			255
			255
			255
			254
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = blend
		controls = [
		]
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		length = 1.0
		color = [
			38
			30
			23
			255
		]
		blendmode = blend
		thickness = 6.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = huemodulation
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.17453298
			}
		]
	}
	{
		type = line
		pos = (0.5, 1.0, 0.0)
		length = 1.0
		color = [
			38
			30
			23
			255
		]
		blendmode = blend
		thickness = 6.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = huemodulation
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.17453298
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.0, 0.0)
		length = 2.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularvel = 1.0
		controls = [
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		length = 2.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularvel = -1.0
		controls = [
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = 0.5
		color = [
			204
			255
			209
			255
		]
		blendmode = blend
		thickness = 4.0
		angle = 0.0
		angularvel = 0.0
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
		pos = (0.25, 0.5, 0.0)
		length = 0.5
		color = [
			204
			255
			209
			255
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
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
		pos = (0.75, 0.5, 0.0)
		length = -0.5
		color = [
			204
			255
			209
			255
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
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
		pos = (0.75, 0.5, 0.0)
		length = -0.5
		color = [
			204
			255
			209
			255
		]
		blendmode = blend
		thickness = 4.0
		angle = 0.0
		angularvel = 0
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
		pos = (0.0, 1.0, 0.0)
		length = 2.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularvel = -1.0
		controls = [
		]
	}
	{
		type = line
		pos = (1.0, 1.0, 0.0)
		length = 2.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularvel = 1.0
		controls = [
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = 0.5
		color = [
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
				type = history
				historytype = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = -0.5
		color = [
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
				type = history
				historytype = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = 0.5
		color = [
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
				type = history
				historytype = frequency
				response = deform
				scalemod = -250.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = -0.5
		color = [
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
				type = history
				historytype = frequency
				response = deform
				scalemod = -250.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = -1.0
		color = [
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
				type = history
				historytype = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = -1.0
		color = [
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
				type = history
				historytype = frequency
				response = deform
				scalemod = -250.0
				spectrumband = 0
			}
		]
	}
]
