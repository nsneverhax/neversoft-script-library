jow_viz_chiplines = [
	{
		Type = blendprev
		offset = (0.0, -0.03)
		Scale = (0.7, 1.5)
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
			38
			38
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
			38
			38
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
		Pos = (0.25, 0.4, 0.0)
		length = -0.5
		Color = [
			77
			148
			255
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
				scalemod = 150.0
				spectrumband = 0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.3
				Player = 1
				gemcolor = green
				fade = 0.5
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.6
				Player = 1
				gemcolor = red
				fade = 0.5
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.455
				Player = 1
				gemcolor = yellow
				fade = 0.5
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.53
				Player = 1
				gemcolor = yellow
				fade = 0.5
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.4, 0.0)
		length = -0.5
		Color = [
			77
			148
			255
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
				scalemod = -150.0
				spectrumband = 0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.3
				Player = 1
				gemcolor = green
				fade = 0.5
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.6
				Player = 1
				gemcolor = red
				fade = 0.5
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.455
				Player = 1
				gemcolor = yellow
				fade = 0.5
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.53
				Player = 1
				gemcolor = yellow
				fade = 0.5
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.4, 0.0)
		length = 0.5
		Color = [
			77
			148
			255
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
				scalemod = 150.0
				spectrumband = 0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.3
				Player = 1
				gemcolor = green
				fade = 0.5
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.6
				Player = 1
				gemcolor = red
				fade = 0.5
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.455
				Player = 1
				gemcolor = yellow
				fade = 0.5
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.53
				Player = 1
				gemcolor = yellow
				fade = 0.5
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.4, 0.0)
		length = 0.5
		Color = [
			77
			148
			255
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
				scalemod = -150.0
				spectrumband = 0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.3
				Player = 1
				gemcolor = green
				fade = 0.5
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.6
				Player = 1
				gemcolor = red
				fade = 0.5
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.455
				Player = 1
				gemcolor = yellow
				fade = 0.5
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.53
				Player = 1
				gemcolor = yellow
				fade = 0.5
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = -1.0
		Color = [
			252
			255
			255
			255
		]
		BlendMode = blend
		thickness = 0.5
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.2
				Player = 2
				gemcolor = green
				fade = 0.2
			}
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = 250.0
				spectrumband = 0
			}
			{
				Type = notehit
				response = saturationmodulation
				scalemod = 0.5
				Player = 2
				fade = 0.2
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.5
				Player = 2
				gemcolor = red
				fade = 0.2
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.35000002
				Player = 2
				gemcolor = yellow
				fade = 0.2
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.43
				Player = 2
				gemcolor = orange
				fade = 0.2
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = -1.0
		Color = [
			252
			255
			255
			255
		]
		BlendMode = blend
		thickness = 0.5
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.2
				Player = 2
				gemcolor = green
				fade = 0.2
			}
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = -250.0
				spectrumband = 0
			}
			{
				Type = notehit
				response = saturationmodulation
				scalemod = 0.5
				Player = 2
				fade = 0.2
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.5
				Player = 2
				gemcolor = red
				fade = 0.2
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.35000002
				Player = 2
				gemcolor = yellow
				fade = 0.2
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.43
				Player = 2
				gemcolor = orange
				fade = 0.2
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 1.8, 0.0)
		npoints = 5
		radius = 0.8
		radius2 = 0.6
		Color = [
			94
			94
			94
			0
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0.628319
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 3
				fade = 0.5
			}
			{
				Type = notehit
				response = redmodulation
				scalemod = 0.3
				Player = 3
				fade = 0.5
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 1.8, 0.0)
		npoints = 5
		radius = 0.8
		radius2 = 0.55
		Color = [
			94
			94
			94
			0
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0.628319
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 4
				fade = 0.5
			}
			{
				Type = notehit
				response = greenmodulation
				scalemod = 0.3
				Player = 4
				fade = 0.5
			}
		]
	}
]
