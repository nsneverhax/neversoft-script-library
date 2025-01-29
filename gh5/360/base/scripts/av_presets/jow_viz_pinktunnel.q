jow_viz_pinktunnel = [
	{
		Type = blendprev
		offset = (0.0, 0.003)
		Scale = (0.96999997, 0.96999997)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.03
		Color = [
			160
			255
			197
			0
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0.0
		angularvel = 1.39626
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				fade = 0.05
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.4
				Player = 1
				gemcolor = red
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.26
				Player = 1
				gemcolor = yellow
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.23
				Player = 1
				gemcolor = blue
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.33
				Player = 1
				gemcolor = orange
				fade = 0.1
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 8.0
		angle = 0
		angularvel = 1.0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				fade = 0.05
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 8.0
		angle = 0.523599
		angularvel = 1.0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				fade = 0.05
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 8.0
		angle = -0.523599
		angularvel = 1.0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				fade = 0.05
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 8.0
		angle = 1.0472
		angularvel = 1.0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				fade = 0.05
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 8.0
		angle = -1.0472
		angularvel = 1.0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				fade = 0.05
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 8.0
		angle = 1.5708001
		angularvel = 1.0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				fade = 0.05
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.4, 0.0)
		npoints = 4
		radius = 0.05
		radius2 = 0.07
		Color = [
			68
			179
			179
			255
		]
		BlendMode = blend
		thickness = 0.5
		angle = 0
		angularvel = 0.69813204
		controls = [
			{
				Type = constant
				response = huemodulation
				scalemod = 0.2
				responsefunc = sintime
				timerate = 1.9198599
			}
			{
				Type = beaton
				response = radius2scale
				scalemod = 0.02
				fade = 1.0
			}
			{
				Type = beaton
				response = radiusscale
				scalemod = 0.0139999995
				fade = 1.0
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.4, 0.0)
		npoints = 16
		radius = 0.25
		radius2 = 0.25
		Color = [
			134
			96
			255
			63
		]
		BlendMode = add
		thickness = 0.75
		angle = 2.0944
		angularvel = 0.17453298
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 0.14
				spectrumband = 24
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.4, 0.0)
		npoints = 8
		radius = 0.15
		radius2 = 0.15
		Color = [
			174
			97
			255
			255
		]
		BlendMode = blend
		thickness = 0.75
		angle = 1.0472
		angularvel = 0.349066
		controls = [
			{
				Type = constant
				response = huemodulation
				scalemod = 0.2
				responsefunc = sintime
				timerate = 1.5708001
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.4, 0.0)
		Scale = (1.6, 1.6)
		length = 0.3
		InnerRadius = 0.1
		outerradius = 0.3
		Color = [
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
				Type = frequency
				response = radiusscale
				scalemod = 0.1
				spectrumband = 24
			}
			{
				Type = constant
				response = huemodulation
				scalemod = 0.2
				responsefunc = sintime
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 3
				fade = 0.1
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.4, 0.0)
		npoints = 8
		radius = 0.15
		radius2 = 0.15
		Color = [
			174
			97
			255
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 1.0472
		angularvel = 0.349066
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				fade = 0.05
			}
			{
				Type = constant
				response = huemodulation
				scalemod = 0.2
				responsefunc = sintime
				timerate = 1.5708001
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.4, 0.0)
		npoints = 16
		radius = 0.25
		radius2 = 0.25
		Color = [
			134
			96
			255
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 2.0944
		angularvel = 0.17453298
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 2
				fade = 0.05
			}
		]
	}
]
