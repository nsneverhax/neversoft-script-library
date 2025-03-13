jow_jam_4p_anarchy = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.95, 0.95)
		color = [
			242
			242
			242
			254
		]
		angle = 0
		angularvel = 0
		blendmode = blend
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 5
		radius = 0.01
		radius2 = 0.5
		color = [
			123
			150
			255
			255
		]
		blendmode = blend_alphadiffuse
		thickness = 1.0
		angle = 0
		angularvel = 1.7453301
		controls = [
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.01
		color = [
			31
			215
			0
			0
		]
		blendmode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.125
				player = 2
				gemcolor = green
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 2
				gemcolor = green
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.01
		color = [
			211
			0
			0
			0
		]
		blendmode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.125
				player = 2
				gemcolor = red
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 2
				gemcolor = red
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.01
		color = [
			255
			220
			0
			0
		]
		blendmode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.125
				player = 2
				gemcolor = yellow
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 2
				gemcolor = yellow
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.01
		color = [
			0
			62
			255
			0
		]
		blendmode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.125
				player = 2
				gemcolor = blue
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 2
				gemcolor = blue
				fade = 1.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.01
		color = [
			255
			143
			0
			0
		]
		blendmode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.125
				player = 2
				gemcolor = orange
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 2
				gemcolor = orange
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.4)
		scale = (1.0, 1.0)
		width = 0.2
		height = 0.2
		color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_sub
		angle = 0
		angularvel = 0
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 5
		radius = 0.01
		radius2 = 0.5
		color = [
			123
			150
			255
			255
		]
		blendmode = blend_alphadiffuse
		thickness = 1.0
		angle = 0
		angularvel = -1.7453301
		controls = [
		]
	}
	{
		type = sprite
		pos = (0.5, 0.4)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			3
			1
			2
			127
		]
		material = jow_mat_anarchy01_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 0.1
				player = 4
				fade = 0.2
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.2
				responsefunc = sintime
				timeoffset = 0.00933751
				timerate = 0.523599
			}
			{
				type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timeoffset = 0.00436332
				timerate = 0.523599
			}
		]
	}
	{
		type = sprite
		pos = (0.3, 0.35000002)
		scale = (1.0, 1.0)
		width = 0.05
		height = 0.075
		color = [
			87
			126
			224
			0
		]
		material = jow_mat_cardsclubs01_blend
		angle = 0.296706
		angularvel = 0
		controls = [
			{
				type = notehit
				response = scalexy
				scalemod = 2.0
				player = 1
				gemcolor = green
				fade = 0.2
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.7
				player = 1
				gemcolor = green
				fade = 0.2
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.24000001
				player = 1
				gemcolor = green
				fade = 0.2
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 0.00933751
				timerate = 1.2217301
			}
			{
				type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 0.00436332
				timerate = 0.61086506
			}
			{
				type = notehit
				response = scalexy
				scalemod = 2.0
				player = 1
				gemcolor = open
				fade = 0.2
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.7
				player = 1
				gemcolor = open
				fade = 0.2
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.15
				player = 1
				gemcolor = open
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		pos = (0.7, 0.3)
		scale = (1.0, 1.0)
		width = 0.04
		height = 0.06
		color = [
			87
			126
			224
			0
		]
		material = jow_mat_cardsdiamonds01_blend
		angle = -0.15708001
		angularvel = 0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 0.0133256
				timerate = 1.39626
			}
			{
				type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 0.019198598
				timerate = 0.523599
			}
			{
				type = notehit
				response = scalexy
				scalemod = 2.0
				player = 1
				gemcolor = red
				fade = 0.2
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.7
				player = 1
				gemcolor = red
				fade = 0.2
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.61
				player = 1
				gemcolor = red
				fade = 0.2
			}
			{
				type = notehit
				response = scalexy
				scalemod = 2.0
				player = 1
				gemcolor = open
				fade = 0.2
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.7
				player = 1
				gemcolor = open
				fade = 0.2
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.15
				player = 1
				gemcolor = open
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		pos = (0.4, 0.3)
		scale = (1.0, 1.0)
		width = 0.04
		height = 0.06
		color = [
			87
			126
			224
			0
		]
		material = jow_mat_cardsspades01_blend
		angle = -0.20944001
		angularvel = 0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 0.00061086507
				timerate = 0.69813204
			}
			{
				type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 0.0296706
				timerate = 1.2217301
			}
			{
				type = notehit
				response = scalexy
				scalemod = 2.0
				player = 1
				gemcolor = yellow
				fade = 0.2
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.7
				player = 1
				gemcolor = yellow
				fade = 0.2
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.47
				player = 1
				gemcolor = yellow
				fade = 0.2
			}
			{
				type = notehit
				response = scalexy
				scalemod = 2.0
				player = 1
				gemcolor = orange
				fade = 0.2
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.7
				player = 1
				gemcolor = orange
				fade = 0.2
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.54
				player = 1
				gemcolor = orange
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		pos = (0.6, 0.35000002)
		scale = (1.0, 1.0)
		width = 0.05
		height = 0.075
		color = [
			87
			126
			224
			0
		]
		material = jow_mat_cardshearts01_blend
		angle = 0.418879
		angularvel = 0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 0.00061086507
				timerate = 0.95993096
			}
			{
				type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 0.0296706
				timerate = 1.0472
			}
			{
				type = notehit
				response = scalexy
				scalemod = 2.0
				player = 1
				gemcolor = blue
				fade = 0.2
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.7
				player = 1
				gemcolor = blue
				fade = 0.2
			}
			{
				type = notehit
				response = scalexy
				scalemod = 2.0
				player = 1
				gemcolor = orange
				fade = 0.2
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.7
				player = 1
				gemcolor = orange
				fade = 0.2
			}
			{
				type = notehit
				response = huemodulation
				scalemod = -0.54
				player = 1
				gemcolor = orange
				fade = 0.2
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.4, 0.0)
		scale = (1.0, 1.0)
		length = 0.3
		innerradius = 0.1
		outerradius = 0.3
		color = [
			66
			153
			99
			0
		]
		material = jow_mat_star01_add
		thickness = 60.0
		angularvel = 6.28319
		controls = [
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 3
				fade = 0.1
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 3
				fade = 0.1
			}
			{
				type = frequency
				response = radiusscale
				scalemod = 0.1
				spectrumband = 24
			}
		]
	}
]
