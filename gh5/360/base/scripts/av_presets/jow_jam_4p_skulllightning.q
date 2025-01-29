jow_jam_4p_skulllightning = [
	{
		Type = blendprev
		offset = (0.0, -0.02)
		Scale = (1.03, 0.997)
		Color = [
			255
			255
			255
			243
		]
		angle = 0
		angularvel = 0.0
		BlendMode = blend
	}
	{
		Type = nstar2
		Pos = (0.0, 1.0, 0.0)
		npoints = 5
		radius = -0.5
		radius2 = 0.5
		Color = [
			66
			9
			9
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = -0.349066
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 1.0
				spectrumband = 1
			}
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 0.5
				Player = 1
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.09
				Player = 1
				gemcolor = orange
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.63
				Player = 1
				gemcolor = blue
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.13499999
				Player = 1
				gemcolor = yellow
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.33
				Player = 1
				gemcolor = green
				fade = 0.1
			}
		]
	}
	{
		Type = nstar2
		Pos = (1.0, 1.0, 0.0)
		npoints = 5
		radius = -0.5
		radius2 = 0.5
		Color = [
			66
			9
			9
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0.349066
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 1.0
				spectrumband = 1
			}
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 0.5
				Player = 1
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.09
				Player = 1
				gemcolor = orange
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.63
				Player = 1
				gemcolor = blue
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.13499999
				Player = 1
				gemcolor = yellow
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.33
				Player = 1
				gemcolor = green
				fade = 0.1
			}
		]
	}
	{
		Type = sprite
		Pos = (0.15, 0.4)
		Scale = (1.0, 1.0)
		width = -0.1
		height = 0.35000002
		Color = [
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
				Type = notehit
				response = alphamodulation
				scalemod = 0.45000002
				Player = 3
				fade = 0.1
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 0.5
				Player = 3
				fade = 0.1
			}
			{
				Type = frequency
				response = offsetx
				scalemod = 0.2
				spectrumband = 48
			}
		]
	}
	{
		Type = sprite
		Pos = (0.85, 0.4)
		Scale = (1.0, 1.0)
		width = 0.1
		height = 0.35000002
		Color = [
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
				Type = notehit
				response = alphamodulation
				scalemod = 0.45000002
				Player = 3
				fade = 0.1
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 0.5
				Player = 3
				fade = 0.1
			}
			{
				Type = frequency
				response = offsetx
				scalemod = -0.2
				spectrumband = 48
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.03
		Color = [
			26
			26
			26
			255
		]
		BlendMode = brighten
		thickness = 6.0
		angle = 0.0
		angularvel = -1.27409
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				Type = frequency
				response = brightnessmodulation
				scalemod = 0.1
				spectrumband = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			26
			26
			26
			255
		]
		BlendMode = brighten
		thickness = 6.0
		angle = 1.5708001
		angularvel = 0.872665
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				Type = frequency
				response = brightnessmodulation
				scalemod = 0.1
				spectrumband = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.15
		Color = [
			26
			26
			26
			255
		]
		BlendMode = brighten
		thickness = 6.0
		angle = 1.2566401
		angularvel = -0.75049204
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				Type = frequency
				response = brightnessmodulation
				scalemod = 0.1
				spectrumband = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.05, 0.8, 0.0)
		radius = 0.03
		Color = [
			83
			47
			21
			0
		]
		BlendMode = add
		thickness = 12.0
		angle = 1.5708001
		angularvel = 0.69813204
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.7
				Player = 4
				fade = 0.1
			}
		]
	}
	{
		Type = circle
		Pos = (0.05, 0.8, 0.0)
		radius = 0.1
		Color = [
			51
			51
			51
			255
		]
		BlendMode = brighten
		thickness = 6.0
		angle = 1.2566401
		angularvel = -0.75049204
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.7
				Player = 4
				fade = 0.1
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5)
		Scale = (1.0, 1.0)
		width = 0.7
		height = 0.7
		Color = [
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
				Type = notehit
				response = alphamodulation
				scalemod = 0.4
				Player = 2
				fade = 0.05
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 0.4
				Player = 2
				fade = 0.05
			}
			{
				Type = constant
				response = scalexy
				scalemod = 0.2
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.1
				responsefunc = costime
				timerate = 0.872665
			}
		]
	}
	{
		Type = circle
		Pos = (0.95, 0.8, 0.0)
		radius = 0.03
		Color = [
			83
			47
			21
			0
		]
		BlendMode = add
		thickness = 12.0
		angle = 1.5708001
		angularvel = 0.69813204
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.7
				Player = 4
				fade = 0.1
			}
		]
	}
	{
		Type = circle
		Pos = (0.95, 0.8, 0.0)
		radius = 0.1
		Color = [
			51
			51
			51
			255
		]
		BlendMode = brighten
		thickness = 6.0
		angle = 1.2566401
		angularvel = -0.75049204
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				deformwindowstart = 5
				spectrumband = 1
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.7
				Player = 4
				fade = 0.1
			}
		]
	}
]
