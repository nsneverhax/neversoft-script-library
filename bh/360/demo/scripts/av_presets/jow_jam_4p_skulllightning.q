jow_jam_4p_skulllightning = [
	{
		type = blendprev
		offset = (0.0, -0.02)
		scale = (1.03, 0.997)
		color = [
			255
			255
			255
			243
		]
		angle = 0
		angularvel = 0.0
		blendmode = blend
	}
	{
		type = nstar2
		pos = (0.0, 1.0, 0.0)
		npoints = 5
		radius = -0.5
		radius2 = 0.5
		color = [
			66
			9
			9
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = -0.349066
		angularvel = 0
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 1.0
				spectrumband = 1
			}
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 0.5
				player = 1
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.09
				player = 1
				gemcolor = orange
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.63
				player = 1
				gemcolor = blue
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.13499999
				player = 1
				gemcolor = yellow
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.33
				player = 1
				gemcolor = green
				fade = 0.1
			}
		]
	}
	{
		type = nstar2
		pos = (1.0, 1.0, 0.0)
		npoints = 5
		radius = -0.5
		radius2 = 0.5
		color = [
			66
			9
			9
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = 0.349066
		angularvel = 0
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 1.0
				spectrumband = 1
			}
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 0.5
				player = 1
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.09
				player = 1
				gemcolor = orange
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.63
				player = 1
				gemcolor = blue
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.13499999
				player = 1
				gemcolor = yellow
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.33
				player = 1
				gemcolor = green
				fade = 0.1
			}
		]
	}
	{
		type = sprite
		pos = (0.15, 0.4)
		scale = (1.0, 1.0)
		width = -0.1
		height = 0.35000002
		color = [
			77
			61
			215
			38
		]
		material = jow_mat_lightning01_blend
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.45000002
				player = 3
				fade = 0.1
			}
			{
				type = notehit
				response = scalexy
				scalemod = 0.5
				player = 3
				fade = 0.1
			}
			{
				type = frequency
				response = offsetx
				scalemod = 0.2
				spectrumband = 48
			}
		]
	}
	{
		type = sprite
		pos = (0.85, 0.4)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.35000002
		color = [
			77
			61
			215
			38
		]
		material = jow_mat_lightning01_blend
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.45000002
				player = 3
				fade = 0.1
			}
			{
				type = notehit
				response = scalexy
				scalemod = 0.5
				player = 3
				fade = 0.1
			}
			{
				type = frequency
				response = offsetx
				scalemod = -0.2
				spectrumband = 48
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.03
		color = [
			26
			26
			26
			255
		]
		blendmode = brighten
		thickness = 6.0
		angle = 0.0
		angularvel = -1.27409
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				type = frequency
				response = brightnessmodulation
				scalemod = 0.1
				spectrumband = 1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.1
		color = [
			26
			26
			26
			255
		]
		blendmode = brighten
		thickness = 6.0
		angle = 1.5708001
		angularvel = 0.872665
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				type = frequency
				response = brightnessmodulation
				scalemod = 0.1
				spectrumband = 1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.15
		color = [
			26
			26
			26
			255
		]
		blendmode = brighten
		thickness = 6.0
		angle = 1.2566401
		angularvel = -0.75049204
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				type = frequency
				response = brightnessmodulation
				scalemod = 0.1
				spectrumband = 1
			}
		]
	}
	{
		type = circle
		pos = (0.05, 0.8, 0.0)
		radius = 0.03
		color = [
			83
			47
			21
			0
		]
		blendmode = add
		thickness = 12.0
		angle = 1.5708001
		angularvel = 0.69813204
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.7
				player = 4
				fade = 0.1
			}
		]
	}
	{
		type = circle
		pos = (0.05, 0.8, 0.0)
		radius = 0.1
		color = [
			51
			51
			51
			255
		]
		blendmode = brighten
		thickness = 6.0
		angle = 1.2566401
		angularvel = -0.75049204
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.7
				player = 4
				fade = 0.1
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5)
		scale = (1.0, 1.0)
		width = 0.7
		height = 0.7
		color = [
			44
			22
			10
			38
		]
		material = jow_mat_skull01_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.4
				player = 2
				fade = 0.05
			}
			{
				type = notehit
				response = scalexy
				scalemod = 0.4
				player = 2
				fade = 0.05
			}
			{
				type = constant
				response = scalexy
				scalemod = 0.2
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				type = constant
				response = offsety
				scalemod = 0.1
				responsefunc = costime
				timerate = 0.872665
			}
		]
	}
	{
		type = circle
		pos = (0.95, 0.8, 0.0)
		radius = 0.03
		color = [
			83
			47
			21
			0
		]
		blendmode = add
		thickness = 12.0
		angle = 1.5708001
		angularvel = 0.69813204
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.7
				player = 4
				fade = 0.1
			}
		]
	}
	{
		type = circle
		pos = (0.95, 0.8, 0.0)
		radius = 0.1
		color = [
			51
			51
			51
			255
		]
		blendmode = brighten
		thickness = 6.0
		angle = 1.2566401
		angularvel = -0.75049204
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.7
				player = 4
				fade = 0.1
			}
		]
	}
]
