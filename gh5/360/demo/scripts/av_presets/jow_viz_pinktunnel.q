jow_viz_pinktunnel = [
	{
		type = blendprev
		offset = (0.0, 0.003)
		scale = (0.96999997, 0.96999997)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		angularvel = 0
		blendmode = blend
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.03
		color = [
			160
			255
			197
			0
		]
		blendmode = blend
		thickness = 6.0
		angle = 0.0
		angularvel = 1.39626
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				fade = 0.05
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.4
				player = 1
				gemcolor = red
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.26
				player = 1
				gemcolor = yellow
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.23
				player = 1
				gemcolor = blue
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.33
				player = 1
				gemcolor = orange
				fade = 0.1
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.4, 0.0)
		length = 0.1
		color = [
			255
			255
			255
			255
		]
		blendmode = subtract
		thickness = 8.0
		angle = 0
		angularvel = 1.0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				fade = 0.05
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.4, 0.0)
		length = 0.1
		color = [
			255
			255
			255
			255
		]
		blendmode = subtract
		thickness = 8.0
		angle = 0.523599
		angularvel = 1.0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				fade = 0.05
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.4, 0.0)
		length = 0.1
		color = [
			255
			255
			255
			255
		]
		blendmode = subtract
		thickness = 8.0
		angle = -0.523599
		angularvel = 1.0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				fade = 0.05
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.4, 0.0)
		length = 0.1
		color = [
			255
			255
			255
			255
		]
		blendmode = subtract
		thickness = 8.0
		angle = 1.0472
		angularvel = 1.0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				fade = 0.05
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.4, 0.0)
		length = 0.1
		color = [
			255
			255
			255
			255
		]
		blendmode = subtract
		thickness = 8.0
		angle = -1.0472
		angularvel = 1.0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				fade = 0.05
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.4, 0.0)
		length = 0.1
		color = [
			255
			255
			255
			255
		]
		blendmode = subtract
		thickness = 8.0
		angle = 1.5708001
		angularvel = 1.0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				fade = 0.05
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 4
		radius = 0.05
		radius2 = 0.07
		color = [
			68
			179
			179
			255
		]
		blendmode = blend
		thickness = 0.5
		angle = 0
		angularvel = 0.69813204
		controls = [
			{
				type = constant
				response = huemodulation
				scalemod = 0.2
				responsefunc = sintime
				timerate = 1.9198599
			}
			{
				type = beaton
				response = radius2scale
				scalemod = 0.02
				fade = 1.0
			}
			{
				type = beaton
				response = radiusscale
				scalemod = 0.0139999995
				fade = 1.0
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 16
		radius = 0.25
		radius2 = 0.25
		color = [
			134
			96
			255
			63
		]
		blendmode = add
		thickness = 0.75
		angle = 2.0944
		angularvel = 0.17453298
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.14
				spectrumband = 24
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 8
		radius = 0.15
		radius2 = 0.15
		color = [
			174
			97
			255
			255
		]
		blendmode = blend
		thickness = 0.75
		angle = 1.0472
		angularvel = 0.349066
		controls = [
			{
				type = constant
				response = huemodulation
				scalemod = 0.2
				responsefunc = sintime
				timerate = 1.5708001
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.4, 0.0)
		scale = (1.6, 1.6)
		length = 0.3
		innerradius = 0.1
		outerradius = 0.3
		color = [
			255
			110
			240
			51
		]
		material = og_mat_flare_add
		thickness = 40.0
		angularvel = 6.28319
		controls = [
			{
				type = frequency
				response = radiusscale
				scalemod = 0.1
				spectrumband = 24
			}
			{
				type = constant
				response = huemodulation
				scalemod = 0.2
				responsefunc = sintime
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 3
				fade = 0.1
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 8
		radius = 0.15
		radius2 = 0.15
		color = [
			174
			97
			255
			0
		]
		blendmode = add
		thickness = 3.0
		angle = 1.0472
		angularvel = 0.349066
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				fade = 0.05
			}
			{
				type = constant
				response = huemodulation
				scalemod = 0.2
				responsefunc = sintime
				timerate = 1.5708001
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 16
		radius = 0.25
		radius2 = 0.25
		color = [
			134
			96
			255
			0
		]
		blendmode = add
		thickness = 3.0
		angle = 2.0944
		angularvel = 0.17453298
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 2
				fade = 0.05
			}
		]
	}
]
