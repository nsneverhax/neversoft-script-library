jow_musicstudio_menu_c = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.1, 1.05)
		color = [
			255
			255
			255
			254
		]
		angle = 0
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
			29
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
			29
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
		thickness = 0.5
		angle = 1.5708001
		angularvel = 0.3
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
		thickness = 0.5
		angle = 1.5708001
		angularvel = -0.3
		controls = [
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			166
			255
			241
			255
		]
		blendmode = blend
		thickness = 1.0
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
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			166
			255
			241
			255
		]
		blendmode = blend
		thickness = 1.0
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
		length = 0.5
		color = [
			166
			255
			241
			255
		]
		blendmode = blend
		thickness = 1.0
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
		length = 0.5
		color = [
			166
			255
			241
			255
		]
		blendmode = blend
		thickness = 1.0
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
		thickness = 0.5
		angle = 1.5708001
		angularvel = -0.3
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
		thickness = 0.5
		angle = 1.5708001
		angularvel = 0.3
		controls = [
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			110
			190
			255
			255
		]
		blendmode = blend
		thickness = 0.8
		angle = 0
		angularvel = 0
		controls = [
			{
				type = history
				historytype = frequency
				response = deform
				scalemod = 300.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			110
			190
			255
			255
		]
		blendmode = blend
		thickness = 0.8
		angle = 0
		angularvel = 0
		controls = [
			{
				type = history
				historytype = frequency
				response = deform
				scalemod = 300.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			110
			190
			255
			255
		]
		blendmode = blend
		thickness = 0.8
		angle = 0
		angularvel = 0
		controls = [
			{
				type = history
				historytype = frequency
				response = deform
				scalemod = -300.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			110
			190
			255
			255
		]
		blendmode = blend
		thickness = 0.8
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = history
				historytype = frequency
				response = deform
				scalemod = -300.0
				spectrumband = 0
			}
		]
	}
]
