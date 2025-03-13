jow_jam_4p_chiplines = [
	{
		type = blendprev
		offset = (0.0, -0.05)
		scale = (0.7, 1.5)
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
			38
			38
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
			38
			38
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
		pos = (0.25, 0.35000002, 0.0)
		length = -0.5
		color = [
			77
			148
			255
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
				scalemod = 150.0
				spectrumband = 0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.3
				player = 1
				gemcolor = green
				fade = 0.5
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.6
				player = 1
				gemcolor = red
				fade = 0.5
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.455
				player = 1
				gemcolor = yellow
				fade = 0.5
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.53
				player = 1
				gemcolor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.35000002, 0.0)
		length = -0.5
		color = [
			77
			148
			255
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
				scalemod = -150.0
				spectrumband = 0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.3
				player = 1
				gemcolor = green
				fade = 0.5
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.6
				player = 1
				gemcolor = red
				fade = 0.5
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.455
				player = 1
				gemcolor = yellow
				fade = 0.5
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.53
				player = 1
				gemcolor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.35000002, 0.0)
		length = 0.5
		color = [
			77
			148
			255
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
				scalemod = 150.0
				spectrumband = 0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.3
				player = 1
				gemcolor = green
				fade = 0.5
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.6
				player = 1
				gemcolor = red
				fade = 0.5
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.455
				player = 1
				gemcolor = yellow
				fade = 0.5
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.53
				player = 1
				gemcolor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.35000002, 0.0)
		length = 0.5
		color = [
			77
			148
			255
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
				scalemod = -150.0
				spectrumband = 0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.3
				player = 1
				gemcolor = green
				fade = 0.5
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.6
				player = 1
				gemcolor = red
				fade = 0.5
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.455
				player = 1
				gemcolor = yellow
				fade = 0.5
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.53
				player = 1
				gemcolor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = -1.0
		color = [
			101
			102
			102
			255
		]
		blendmode = blend
		thickness = 0.5
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = notehit
				response = huemodulation
				scalemod = -0.2
				player = 2
				gemcolor = green
				fade = 0.2
			}
			{
				type = history
				historytype = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
			{
				type = notehit
				response = saturationmodulation
				scalemod = 0.5
				player = 2
				fade = 0.2
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.5
				player = 2
				gemcolor = red
				fade = 0.2
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.35000002
				player = 2
				gemcolor = yellow
				fade = 0.2
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.43
				player = 2
				gemcolor = orange
				fade = 0.2
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = -1.0
		color = [
			101
			102
			102
			255
		]
		blendmode = blend
		thickness = 0.5
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = notehit
				response = huemodulation
				scalemod = -0.2
				player = 2
				gemcolor = green
				fade = 0.2
			}
			{
				type = history
				historytype = frequency
				response = deform
				scalemod = -250.0
				spectrumband = 0
			}
			{
				type = notehit
				response = saturationmodulation
				scalemod = 0.5
				player = 2
				fade = 0.2
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.5
				player = 2
				gemcolor = red
				fade = 0.2
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.35000002
				player = 2
				gemcolor = yellow
				fade = 0.2
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.43
				player = 2
				gemcolor = orange
				fade = 0.2
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 1.8, 0.0)
		npoints = 5
		radius = 0.8
		radius2 = 0.6
		color = [
			94
			94
			94
			0
		]
		blendmode = blend
		thickness = 6.0
		angle = 0.628319
		angularvel = 0.0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 3
				fade = 0.5
			}
			{
				type = notehit
				response = redmodulation
				scalemod = 0.3
				player = 3
				fade = 0.5
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 1.8, 0.0)
		npoints = 5
		radius = 0.8
		radius2 = 0.55
		color = [
			94
			94
			94
			0
		]
		blendmode = blend
		thickness = 6.0
		angle = 0.628319
		angularvel = 0.0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 4
				fade = 0.5
			}
			{
				type = notehit
				response = greenmodulation
				scalemod = 0.3
				player = 4
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		pos = (0.2, 0.6)
		scale = (1.0, 1.0)
		width = -0.07
		height = 0.07
		color = [
			66
			137
			255
			255
		]
		material = jow_mat_chipbit01_blend
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.04
				responsefunc = sintime
				timerate = 1.5708001
			}
			{
				type = beaton
				response = anglemod
				scalemod = 0.3
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		pos = (0.8, 0.6)
		scale = (1.0, 1.0)
		width = 0.07
		height = 0.07
		color = [
			66
			137
			255
			255
		]
		material = jow_mat_chipbit01_blend
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = -0.04
				responsefunc = sintime
				timerate = 1.5708001
			}
			{
				type = beaton
				response = anglemod
				scalemod = -0.3
				fade = 0.2
			}
		]
	}
]
