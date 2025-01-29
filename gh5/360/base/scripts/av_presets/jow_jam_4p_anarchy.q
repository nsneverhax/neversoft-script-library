jow_jam_4p_anarchy = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.95, 0.95)
		Color = [
			242
			242
			242
			254
		]
		angle = 0
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = nstar2
		Pos = (0.5, 0.4, 0.0)
		npoints = 5
		radius = 0.01
		radius2 = 0.5
		Color = [
			123
			150
			255
			255
		]
		BlendMode = blend_alphadiffuse
		thickness = 1.0
		angle = 0
		angularvel = 1.7453301
		controls = [
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			31
			215
			0
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.125
				Player = 2
				gemcolor = green
				fade = 1.0
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 2
				gemcolor = green
				fade = 1.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			211
			0
			0
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.125
				Player = 2
				gemcolor = red
				fade = 1.0
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 2
				gemcolor = red
				fade = 1.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			255
			220
			0
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.125
				Player = 2
				gemcolor = yellow
				fade = 1.0
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 2
				gemcolor = yellow
				fade = 1.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			0
			62
			255
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.125
				Player = 2
				gemcolor = blue
				fade = 1.0
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 2
				gemcolor = blue
				fade = 1.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			255
			143
			0
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.125
				Player = 2
				gemcolor = orange
				fade = 1.0
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 2
				gemcolor = orange
				fade = 1.0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.4)
		Scale = (1.0, 1.0)
		width = 0.2
		height = 0.2
		Color = [
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
		Type = nstar2
		Pos = (0.5, 0.4, 0.0)
		npoints = 5
		radius = 0.01
		radius2 = 0.5
		Color = [
			123
			150
			255
			255
		]
		BlendMode = blend_alphadiffuse
		thickness = 1.0
		angle = 0
		angularvel = -1.7453301
		controls = [
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.4)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
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
				Type = notehit
				response = brightnessmodulation
				scalemod = 0.1
				Player = 4
				fade = 0.2
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.2
				responsefunc = sintime
				timeoffset = 0.00933751
				timerate = 0.523599
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timeoffset = 0.00436332
				timerate = 0.523599
			}
		]
	}
	{
		Type = sprite
		Pos = (0.3, 0.35000002)
		Scale = (1.0, 1.0)
		width = 0.05
		height = 0.075
		Color = [
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
				Type = notehit
				response = scalexy
				scalemod = 2.0
				Player = 1
				gemcolor = green
				fade = 0.2
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.7
				Player = 1
				gemcolor = green
				fade = 0.2
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.24000001
				Player = 1
				gemcolor = green
				fade = 0.2
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 0.00933751
				timerate = 1.2217301
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 0.00436332
				timerate = 0.61086506
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 2.0
				Player = 1
				gemcolor = open
				fade = 0.2
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.7
				Player = 1
				gemcolor = open
				fade = 0.2
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.15
				Player = 1
				gemcolor = open
				fade = 0.2
			}
		]
	}
	{
		Type = sprite
		Pos = (0.7, 0.3)
		Scale = (1.0, 1.0)
		width = 0.04
		height = 0.06
		Color = [
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
				Type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 0.0133256
				timerate = 1.39626
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 0.019198598
				timerate = 0.523599
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 2.0
				Player = 1
				gemcolor = red
				fade = 0.2
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.7
				Player = 1
				gemcolor = red
				fade = 0.2
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.61
				Player = 1
				gemcolor = red
				fade = 0.2
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 2.0
				Player = 1
				gemcolor = open
				fade = 0.2
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.7
				Player = 1
				gemcolor = open
				fade = 0.2
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.15
				Player = 1
				gemcolor = open
				fade = 0.2
			}
		]
	}
	{
		Type = sprite
		Pos = (0.4, 0.3)
		Scale = (1.0, 1.0)
		width = 0.04
		height = 0.06
		Color = [
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
				Type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 0.00061086507
				timerate = 0.69813204
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 0.0296706
				timerate = 1.2217301
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 2.0
				Player = 1
				gemcolor = yellow
				fade = 0.2
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.7
				Player = 1
				gemcolor = yellow
				fade = 0.2
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.47
				Player = 1
				gemcolor = yellow
				fade = 0.2
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 2.0
				Player = 1
				gemcolor = orange
				fade = 0.2
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.7
				Player = 1
				gemcolor = orange
				fade = 0.2
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.54
				Player = 1
				gemcolor = orange
				fade = 0.2
			}
		]
	}
	{
		Type = sprite
		Pos = (0.6, 0.35000002)
		Scale = (1.0, 1.0)
		width = 0.05
		height = 0.075
		Color = [
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
				Type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 0.00061086507
				timerate = 0.95993096
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 0.0296706
				timerate = 1.0472
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 2.0
				Player = 1
				gemcolor = blue
				fade = 0.2
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.7
				Player = 1
				gemcolor = blue
				fade = 0.2
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 2.0
				Player = 1
				gemcolor = orange
				fade = 0.2
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.7
				Player = 1
				gemcolor = orange
				fade = 0.2
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.54
				Player = 1
				gemcolor = orange
				fade = 0.2
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.4, 0.0)
		Scale = (1.0, 1.0)
		length = 0.3
		InnerRadius = 0.1
		outerradius = 0.3
		Color = [
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
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 3
				fade = 0.1
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 3
				fade = 0.1
			}
			{
				Type = frequency
				response = radiusscale
				scalemod = 0.1
				spectrumband = 24
			}
		]
	}
]
