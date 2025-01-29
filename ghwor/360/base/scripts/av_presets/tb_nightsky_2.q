tb_nightsky_2 = {
	viewport_params = {
		clearcolor = [
			40
			62
			72
			255
		]
		BlendMode = blend
		alphafromgray = 1
	}
	primitives = [
		{
			Type = sprite
			Pos = (0.5, 0.5, 0.0)
			Scale = (1.0, 2.0)
			width = 1.0
			height = 1.0
			Color = [
				7
				90
				116
				255
			]
			material = tb_mat_gradient
			angle = 0
			angularvel = 0
		}
		{
			Type = nstar2
			Pos = (0.5, 0.3, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			Color = [
				94
				46
				198
				255
			]
			color2 = [
				255
				178
				39
				255
			]
			BlendMode = blend
			thickness = 1.0
			angle = 0.78539795
			angularvel = 0
			controls = [
				{
					Type = constant
					response = anglemod
					scalemod = 5.0
					responsefunc = costime
					timerate = 0.0872665
				}
				{
					Type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			Type = nstar2
			Pos = (0.5, 0.3, 0.0)
			npoints = 5
			radius = 0.025
			radius2 = 0.05
			Color = [
				94
				46
				198
				255
			]
			color2 = [
				255
				178
				39
				255
			]
			BlendMode = blend
			thickness = 1.0
			angle = 0
			angularvel = 0
			controls = [
				{
					Type = constant
					response = anglemod
					scalemod = 5.0
					responsefunc = costime
					timerate = 0.0872665
				}
				{
					Type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			Type = nstar2
			Pos = (0.3, 0.2, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			Color = [
				94
				46
				198
				255
			]
			color2 = [
				255
				178
				39
				255
			]
			BlendMode = blend
			thickness = 1.0
			angle = 1.5708001
			angularvel = 0
			controls = [
				{
					Type = constant
					response = anglemod
					scalemod = -5.0
					responsefunc = sintime
					timerate = -0.0872665
				}
				{
					Type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			Type = nstar2
			Pos = (0.8, 0.4, 0.0)
			npoints = 5
			radius = 0.025
			radius2 = 0.05
			Color = [
				94
				46
				198
				255
			]
			color2 = [
				255
				178
				39
				255
			]
			BlendMode = blend
			thickness = 1.0
			angle = 0.78539795
			angularvel = 0
			controls = [
				{
					Type = constant
					response = anglemod
					scalemod = 5.0
					responsefunc = costime
					timerate = 0.0872665
				}
				{
					Type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			Type = nstar2
			Pos = (0.7, 0.2, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			Color = [
				94
				46
				198
				255
			]
			color2 = [
				255
				178
				39
				255
			]
			BlendMode = blend
			thickness = 1.0
			angle = 1.5708001
			angularvel = 0
			controls = [
				{
					Type = constant
					response = anglemod
					scalemod = 5.0
					responsefunc = costime
					timerate = 0.0872665
				}
				{
					Type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			Type = nstar2
			Pos = (0.5, 0.5, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			Color = [
				94
				46
				198
				255
			]
			color2 = [
				255
				178
				39
				255
			]
			BlendMode = blend
			thickness = 1.0
			angle = 1.5708001
			angularvel = 0
			controls = [
				{
					Type = constant
					response = anglemod
					scalemod = -5.0
					responsefunc = sintime
					timerate = -0.0872665
				}
				{
					Type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			Type = nstar2
			Pos = (0.2, 0.4, 0.0)
			npoints = 5
			radius = 0.025
			radius2 = 0.05
			Color = [
				94
				46
				198
				255
			]
			color2 = [
				255
				178
				39
				255
			]
			BlendMode = blend
			thickness = 1.0
			angle = 0.78539795
			angularvel = 0
			controls = [
				{
					Type = constant
					response = anglemod
					scalemod = -5.0
					responsefunc = sintime
					timerate = -0.0872665
				}
				{
					Type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			Type = nstar2
			Pos = (0.5, 0.1, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			Color = [
				94
				46
				198
				255
			]
			color2 = [
				255
				178
				39
				255
			]
			BlendMode = blend
			thickness = 1.0
			angle = 1.5708001
			angularvel = 0
			controls = [
				{
					Type = constant
					response = anglemod
					scalemod = -5.0
					responsefunc = sintime
					timerate = -0.0872665
				}
				{
					Type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			Type = nstar2
			Pos = (0.1, 0.1, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			Color = [
				94
				46
				198
				255
			]
			color2 = [
				255
				178
				39
				255
			]
			BlendMode = blend
			thickness = 1.0
			angle = 1.5708001
			angularvel = 0
			controls = [
				{
					Type = constant
					response = anglemod
					scalemod = 5.0
					responsefunc = costime
					timerate = 0.0872665
				}
				{
					Type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			Type = nstar2
			Pos = (0.9, 0.1, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			Color = [
				94
				46
				198
				255
			]
			color2 = [
				255
				178
				39
				255
			]
			BlendMode = blend
			thickness = 1.0
			angle = 1.5708001
			angularvel = 0
			controls = [
				{
					Type = constant
					response = anglemod
					scalemod = -5.0
					responsefunc = sintime
					timerate = -0.0872665
				}
				{
					Type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			Type = rect
			Pos = (0.5, 1.1)
			Scale = (1.0, 1.0)
			width = 1.1
			height = 1.0
			Color = [
				18
				22
				35
				255
			]
			color2 = [
				31
				33
				35
				255
			]
			BlendMode = blend
			thickness = 1.0
			angle = 0
			angularvel = 0
			controls = [
			]
		}
	]
}
