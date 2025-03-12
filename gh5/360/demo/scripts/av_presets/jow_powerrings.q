jow_powerrings = [
	{
		type = blendprev
		offset = (0.0, -0.001)
		scale = (0.95, 0.96999997)
		color = [
			242
			250
			255
			204
		]
		angle = 0
		angularvel = 0.0
		blendmode = blend
		controls = [
			{
				type = rockmeterstatus
				response = alphamodulation
				scalemod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.125
		color = [
			114
			167
			255
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = 1.5708001
		angularvel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 60.0
				responsefunc = sintime
			}
			{
				type = history
				historytype = frequency
				response = redmodulation
				scalemod = 6.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.55, 0.5, 0.0)
		length = 0.06
		color = [
			114
			167
			255
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 120.0
				responsefunc = sintime
			}
			{
				type = history
				historytype = frequency
				response = redmodulation
				scalemod = 6.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.45000002, 0.5, 0.0)
		length = 0.06
		color = [
			114
			167
			255
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 120.0
				responsefunc = sintime
			}
			{
				type = history
				historytype = frequency
				response = redmodulation
				scalemod = 6.0
				spectrumband = 0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.65000004, 0.0)
		radius = 0.0
		color = [
			108
			255
			131
			0
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = green
				fade = 1.0
			}
			{
				type = history
				historytype = frequency
				response = offsety
				scalemod = -0.0125
				responsefunc = sintime
				spectrumband = 2
			}
			{
				type = waveform
				response = deform
				scalemod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusscale
				scalemod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.65000004, 0.0)
		radius = 0.005
		color = [
			255
			108
			108
			0
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = red
				fade = 1.0
			}
			{
				type = history
				historytype = frequency
				response = offsety
				scalemod = -0.0125
				responsefunc = sintime
				spectrumband = 2
			}
			{
				type = waveform
				response = deform
				scalemod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusscale
				scalemod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.65000004, 0.0)
		radius = 0.01
		color = [
			255
			229
			108
			0
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = yellow
				fade = 1.0
			}
			{
				type = history
				historytype = frequency
				response = offsety
				scalemod = -0.0125
				responsefunc = sintime
				spectrumband = 2
			}
			{
				type = waveform
				response = deform
				scalemod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusscale
				scalemod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.65000004, 0.0)
		radius = 0.015
		color = [
			108
			144
			255
			0
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = blue
				fade = 1.0
			}
			{
				type = history
				historytype = frequency
				response = offsety
				scalemod = -0.0125
				responsefunc = sintime
				spectrumband = 2
			}
			{
				type = waveform
				response = deform
				scalemod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusscale
				scalemod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.65000004, 0.0)
		radius = 0.02
		color = [
			255
			184
			108
			0
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = orange
				fade = 1.0
			}
			{
				type = history
				historytype = frequency
				response = offsety
				scalemod = -0.0125
				responsefunc = sintime
				spectrumband = 2
			}
			{
				type = waveform
				response = deform
				scalemod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusscale
				scalemod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.35000002, 0.0)
		radius = 0.0
		color = [
			108
			255
			131
			0
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = green
				fade = 1.0
			}
			{
				type = history
				historytype = frequency
				response = offsety
				scalemod = 0.0125
				responsefunc = sintime
				spectrumband = 2
			}
			{
				type = waveform
				response = deform
				scalemod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusscale
				scalemod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.35000002, 0.0)
		radius = 0.005
		color = [
			255
			108
			108
			0
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = red
				fade = 1.0
			}
			{
				type = history
				historytype = frequency
				response = offsety
				scalemod = 0.0125
				responsefunc = sintime
				spectrumband = 2
			}
			{
				type = waveform
				response = deform
				scalemod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusscale
				scalemod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.35000002, 0.0)
		radius = 0.01
		color = [
			255
			229
			108
			0
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = yellow
				fade = 1.0
			}
			{
				type = history
				historytype = frequency
				response = offsety
				scalemod = 0.0125
				responsefunc = sintime
				spectrumband = 2
			}
			{
				type = waveform
				response = deform
				scalemod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusscale
				scalemod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.35000002, 0.0)
		radius = 0.015
		color = [
			108
			144
			255
			0
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = blue
				fade = 1.0
			}
			{
				type = history
				historytype = frequency
				response = offsety
				scalemod = 0.0125
				responsefunc = sintime
				spectrumband = 2
			}
			{
				type = waveform
				response = deform
				scalemod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusscale
				scalemod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.35000002, 0.0)
		radius = 0.02
		color = [
			255
			184
			108
			0
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = orange
				fade = 1.0
			}
			{
				type = history
				historytype = frequency
				response = offsety
				scalemod = 0.0125
				responsefunc = sintime
				spectrumband = 2
			}
			{
				type = waveform
				response = deform
				scalemod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusscale
				scalemod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.3
		radius2 = -0.02
		color = [
			255
			255
			255
			255
		]
		blendmode = subtract
		thickness = 0.5
		angle = 0
		angularvel = -0.69813204
		controls = [
			{
				type = notehit
				response = radius2scale
				scalemod = 0.02
				player = 1
				fade = 1.0
			}
		]
	}
]
