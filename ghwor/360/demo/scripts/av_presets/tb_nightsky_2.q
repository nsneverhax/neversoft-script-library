tb_nightsky_2 = {
	viewport_params = {
		clearcolor = [
			40
			62
			72
			255
		]
		blendmode = blend
		alphafromgray = 1
	}
	primitives = [
		{
			type = sprite
			pos = (0.5, 0.5, 0.0)
			scale = (1.0, 2.0)
			width = 1.0
			height = 1.0
			color = [
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
			type = nstar2
			pos = (0.5, 0.3, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			color = [
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
			blendmode = blend
			thickness = 1.0
			angle = 0.78539795
			angularvel = 0
			controls = [
				{
					type = constant
					response = anglemod
					scalemod = 5.0
					responsefunc = costime
					timerate = 0.0872665
				}
				{
					type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			type = nstar2
			pos = (0.5, 0.3, 0.0)
			npoints = 5
			radius = 0.025
			radius2 = 0.05
			color = [
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
			blendmode = blend
			thickness = 1.0
			angle = 0
			angularvel = 0
			controls = [
				{
					type = constant
					response = anglemod
					scalemod = 5.0
					responsefunc = costime
					timerate = 0.0872665
				}
				{
					type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			type = nstar2
			pos = (0.3, 0.2, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			color = [
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
			blendmode = blend
			thickness = 1.0
			angle = 1.5708001
			angularvel = 0
			controls = [
				{
					type = constant
					response = anglemod
					scalemod = -5.0
					responsefunc = sintime
					timerate = -0.0872665
				}
				{
					type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			type = nstar2
			pos = (0.8, 0.4, 0.0)
			npoints = 5
			radius = 0.025
			radius2 = 0.05
			color = [
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
			blendmode = blend
			thickness = 1.0
			angle = 0.78539795
			angularvel = 0
			controls = [
				{
					type = constant
					response = anglemod
					scalemod = 5.0
					responsefunc = costime
					timerate = 0.0872665
				}
				{
					type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			type = nstar2
			pos = (0.7, 0.2, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			color = [
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
			blendmode = blend
			thickness = 1.0
			angle = 1.5708001
			angularvel = 0
			controls = [
				{
					type = constant
					response = anglemod
					scalemod = 5.0
					responsefunc = costime
					timerate = 0.0872665
				}
				{
					type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			type = nstar2
			pos = (0.5, 0.5, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			color = [
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
			blendmode = blend
			thickness = 1.0
			angle = 1.5708001
			angularvel = 0
			controls = [
				{
					type = constant
					response = anglemod
					scalemod = -5.0
					responsefunc = sintime
					timerate = -0.0872665
				}
				{
					type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			type = nstar2
			pos = (0.2, 0.4, 0.0)
			npoints = 5
			radius = 0.025
			radius2 = 0.05
			color = [
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
			blendmode = blend
			thickness = 1.0
			angle = 0.78539795
			angularvel = 0
			controls = [
				{
					type = constant
					response = anglemod
					scalemod = -5.0
					responsefunc = sintime
					timerate = -0.0872665
				}
				{
					type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			type = nstar2
			pos = (0.5, 0.1, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			color = [
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
			blendmode = blend
			thickness = 1.0
			angle = 1.5708001
			angularvel = 0
			controls = [
				{
					type = constant
					response = anglemod
					scalemod = -5.0
					responsefunc = sintime
					timerate = -0.0872665
				}
				{
					type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			type = nstar2
			pos = (0.1, 0.1, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			color = [
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
			blendmode = blend
			thickness = 1.0
			angle = 1.5708001
			angularvel = 0
			controls = [
				{
					type = constant
					response = anglemod
					scalemod = 5.0
					responsefunc = costime
					timerate = 0.0872665
				}
				{
					type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			type = nstar2
			pos = (0.9, 0.1, 0.0)
			npoints = 5
			radius = 0.01
			radius2 = 0.025
			color = [
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
			blendmode = blend
			thickness = 1.0
			angle = 1.5708001
			angularvel = 0
			controls = [
				{
					type = constant
					response = anglemod
					scalemod = -5.0
					responsefunc = sintime
					timerate = -0.0872665
				}
				{
					type = frequency
					response = radius2scale
					scalemod = 0.15
					spectrumband = 0
				}
			]
		}
		{
			type = rect
			pos = (0.5, 1.1)
			scale = (1.0, 1.0)
			width = 1.1
			height = 1.0
			color = [
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
			blendmode = blend
			thickness = 1.0
			angle = 0
			angularvel = 0
			controls = [
			]
		}
	]
}
