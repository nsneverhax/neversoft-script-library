tb_cube_starpower = {
	viewport_params = {
		clearcolor = [
			9
			29
			31
			255
		]
		BlendMode = diffuse
		alphafromgray = 1
	}
	primitives = [
		{
			Type = blendprev
			offset = (0.0, -0.009)
			Scale = (0.96999997, 0.96999997)
			Color = [
				220
				220
				220
				254
			]
			BlendMode = blend
		}
		{
			Type = line
			Pos = (0.75, 0.65000004, 0.0)
			length = 1.0
			Color = [
				0
				57
				114
				172
			]
			thickness = 0.3
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = -200.0
				}
			]
		}
		{
			Type = nstar2
			Pos = (0.5, 0.6, 0.0)
			npoints = 5
			radius = 0.05
			radius2 = 0.4
			Color = [
				0
				69
				150
				255
			]
			BlendMode = brighten
			thickness = 2.0
			angularvel = 0.872665
		}
		{
			Type = hypotrochoid
			Pos = (0.5, 0.5, 0.0)
			length = 0.15
			InnerRadius = 0.15
			outerradius = 0.05
			Color = [
				185
				253
				255
				255
			]
			material = og_mat_flare_add
			thickness = 40.0
			angularvel = -0.872665
			controls = [
				{
					Type = beaton
					response = angularvelmod
					scalemod = 0.5
					fade = 1.0
				}
			]
		}
		{
			Type = blendprev
			offset = (0.0, -0.01)
			Scale = (0.95, 0.95)
			Color = [
				24
				24
				24
				203
			]
			BlendMode = add
		}
		{
			Type = line
			Pos = (0.25, 0.6, 0.0)
			length = -1.0
			Color = [
				0
				57
				114
				172
			]
			thickness = 0.3
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = 200.0
				}
			]
		}
		{
			Type = line
			Pos = (0.25, 0.625, 0.0)
			length = -1.0
			Color = [
				0
				57
				114
				172
			]
			thickness = 0.3
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = -200.0
				}
			]
		}
		{
			Type = line
			Pos = (0.75, 0.675, 0.0)
			length = 1.0
			Color = [
				0
				57
				114
				172
			]
			thickness = 0.3
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = 200.0
				}
			]
		}
		{
			Type = circle
			Pos = (0.5, 0.6, 0.0)
			radius = 0.1
			Color = [
				67
				96
				119
				115
			]
			BlendMode = diffuse
			thickness = 0.2
			angle = 0.523599
			angularvel = 0.69813204
			controls = [
				{
					Type = waveform
					response = deform
					scalemod = 500.0
					responsefunc = costime
					Player = 1
				}
				{
					Type = waveform
					response = scalexy
					scalemod = 100.0
					responsefunc = costime
					Player = 1
				}
				{
					Type = frequency
					response = alphamodulation
					scalemod = 2.0
					spectrumband = 0
				}
			]
		}
		{
			Type = line
			Pos = (0.25, 0.72499996, 0.0)
			length = -1.0
			Color = [
				12
				67
				99
				255
			]
			thickness = 0.5
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = 200.0
				}
			]
		}
		{
			Type = line
			Pos = (0.25, 0.75, 0.0)
			length = -1.0
			Color = [
				12
				67
				99
				255
			]
			thickness = 0.5
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = -200.0
				}
			]
		}
		{
			Type = line
			Pos = (0.75, 0.775, 0.0)
			length = 1.0
			Color = [
				12
				67
				99
				255
			]
			thickness = 0.5
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = -200.0
				}
			]
		}
		{
			Type = line
			Pos = (0.75, 0.8, 0.0)
			length = 1.0
			Color = [
				12
				67
				99
				255
			]
			thickness = 0.5
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = 200.0
				}
			]
		}
		{
			Type = circle
			Pos = (0.5, 0.59, 0.0)
			radius = 0.15
			Color = [
				67
				96
				119
				115
			]
			thickness = 0.2
			angle = 0.0872665
			angularvel = 0.0872665
			controls = [
				{
					Type = waveform
					response = deform
					scalemod = 400.0
					responsefunc = costime
					Player = 1
				}
				{
					Type = waveform
					response = scalexy
					scalemod = 60.0
					responsefunc = costime
					Player = 1
				}
				{
					Type = frequency
					response = alphamodulation
					scalemod = 2.0
					spectrumband = 0
				}
			]
		}
		{
			Type = circle
			Pos = (0.5, 0.5, 0.0)
			radius = 0.44
			Color = [
				67
				96
				119
				115
			]
			BlendMode = brighten
			thickness = 8.0
			angularvel = -0.0872665
			controls = [
				{
					Type = waveform
					response = deform
					scalemod = 500.0
					responsefunc = costime
					Player = 1
				}
				{
					Type = waveform
					response = scalexy
					scalemod = 90.0
					responsefunc = costime
					Player = 1
				}
			]
		}
		{
			Type = circle
			Pos = (0.5, 0.59, 0.0)
			radius = 0.15
			Color = [
				67
				96
				119
				115
			]
			BlendMode = add
			thickness = 0.35000002
			angle = 0.0872665
			angularvel = 0.0872665
			controls = [
				{
					Type = waveform
					response = deform
					scalemod = 500.0
					responsefunc = costime
					Player = 1
				}
				{
					Type = waveform
					response = scalexy
					scalemod = 90.0
					responsefunc = costime
					Player = 1
				}
				{
					Type = frequency
					response = alphamodulation
					scalemod = 2.0
					spectrumband = 0
				}
			]
		}
		{
			Type = hypotrochoid
			Pos = (0.5, 0.5, 0.0)
			length = 0.15
			InnerRadius = 0.15
			outerradius = 0.05
			Color = [
				185
				253
				255
				255
			]
			material = og_mat_flare_add
			thickness = 40.0
			angularvel = 0.872665
			controls = [
				{
					Type = beaton
					response = angularvelmod
					scalemod = 0.5
					fade = 1.0
				}
			]
		}
		{
			Type = circle
			Pos = (0.5, 0.62, 0.0)
			radius = 0.05
			Color = [
				67
				96
				119
				115
			]
			thickness = 0.75
			angle = 0.523599
			angularvel = 0.0872665
			controls = [
				{
					Type = waveform
					response = deform
					scalemod = 300.0
					responsefunc = costime
					Player = 1
				}
				{
					Type = waveform
					response = scalexy
					scalemod = 50.0
					responsefunc = costime
					Player = 1
				}
				{
					Type = frequency
					response = alphamodulation
					scalemod = 2.0
					spectrumband = 0
				}
			]
		}
		{
			Type = nstar2
			Pos = (0.5, 0.6, 0.0)
			npoints = 5
			radius = 0.05
			radius2 = 0.4
			Color = [
				0
				69
				150
				255
			]
			BlendMode = brighten
			thickness = 2.0
			angularvel = -0.872665
		}
	]
}
