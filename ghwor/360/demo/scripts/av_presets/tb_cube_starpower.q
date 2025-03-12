tb_cube_starpower = {
	viewport_params = {
		clearcolor = [
			9
			29
			31
			255
		]
		blendmode = diffuse
		alphafromgray = 1
	}
	primitives = [
		{
			type = blendprev
			offset = (0.0, -0.009)
			scale = (0.96999997, 0.96999997)
			color = [
				220
				220
				220
				254
			]
			blendmode = blend
		}
		{
			type = line
			pos = (0.75, 0.65000004, 0.0)
			length = 1.0
			color = [
				0
				57
				114
				172
			]
			thickness = 0.3
			controls = [
				{
					type = frequency
					response = deform
					scalemod = -200.0
				}
			]
		}
		{
			type = nstar2
			pos = (0.5, 0.6, 0.0)
			npoints = 5
			radius = 0.05
			radius2 = 0.4
			color = [
				0
				69
				150
				255
			]
			blendmode = brighten
			thickness = 2.0
			angularvel = 0.872665
		}
		{
			type = hypotrochoid
			pos = (0.5, 0.5, 0.0)
			length = 0.15
			innerradius = 0.15
			outerradius = 0.05
			color = [
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
					type = beaton
					response = angularvelmod
					scalemod = 0.5
					fade = 1.0
				}
			]
		}
		{
			type = blendprev
			offset = (0.0, -0.01)
			scale = (0.95, 0.95)
			color = [
				24
				24
				24
				203
			]
			blendmode = add
		}
		{
			type = line
			pos = (0.25, 0.6, 0.0)
			length = -1.0
			color = [
				0
				57
				114
				172
			]
			thickness = 0.3
			controls = [
				{
					type = frequency
					response = deform
					scalemod = 200.0
				}
			]
		}
		{
			type = line
			pos = (0.25, 0.625, 0.0)
			length = -1.0
			color = [
				0
				57
				114
				172
			]
			thickness = 0.3
			controls = [
				{
					type = frequency
					response = deform
					scalemod = -200.0
				}
			]
		}
		{
			type = line
			pos = (0.75, 0.675, 0.0)
			length = 1.0
			color = [
				0
				57
				114
				172
			]
			thickness = 0.3
			controls = [
				{
					type = frequency
					response = deform
					scalemod = 200.0
				}
			]
		}
		{
			type = circle
			pos = (0.5, 0.6, 0.0)
			radius = 0.1
			color = [
				67
				96
				119
				115
			]
			blendmode = diffuse
			thickness = 0.2
			angle = 0.523599
			angularvel = 0.69813204
			controls = [
				{
					type = waveform
					response = deform
					scalemod = 500.0
					responsefunc = costime
					player = 1
				}
				{
					type = waveform
					response = scalexy
					scalemod = 100.0
					responsefunc = costime
					player = 1
				}
				{
					type = frequency
					response = alphamodulation
					scalemod = 2.0
					spectrumband = 0
				}
			]
		}
		{
			type = line
			pos = (0.25, 0.72499996, 0.0)
			length = -1.0
			color = [
				12
				67
				99
				255
			]
			thickness = 0.5
			controls = [
				{
					type = frequency
					response = deform
					scalemod = 200.0
				}
			]
		}
		{
			type = line
			pos = (0.25, 0.75, 0.0)
			length = -1.0
			color = [
				12
				67
				99
				255
			]
			thickness = 0.5
			controls = [
				{
					type = frequency
					response = deform
					scalemod = -200.0
				}
			]
		}
		{
			type = line
			pos = (0.75, 0.775, 0.0)
			length = 1.0
			color = [
				12
				67
				99
				255
			]
			thickness = 0.5
			controls = [
				{
					type = frequency
					response = deform
					scalemod = -200.0
				}
			]
		}
		{
			type = line
			pos = (0.75, 0.8, 0.0)
			length = 1.0
			color = [
				12
				67
				99
				255
			]
			thickness = 0.5
			controls = [
				{
					type = frequency
					response = deform
					scalemod = 200.0
				}
			]
		}
		{
			type = circle
			pos = (0.5, 0.59, 0.0)
			radius = 0.15
			color = [
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
					type = waveform
					response = deform
					scalemod = 400.0
					responsefunc = costime
					player = 1
				}
				{
					type = waveform
					response = scalexy
					scalemod = 60.0
					responsefunc = costime
					player = 1
				}
				{
					type = frequency
					response = alphamodulation
					scalemod = 2.0
					spectrumband = 0
				}
			]
		}
		{
			type = circle
			pos = (0.5, 0.5, 0.0)
			radius = 0.44
			color = [
				67
				96
				119
				115
			]
			blendmode = brighten
			thickness = 8.0
			angularvel = -0.0872665
			controls = [
				{
					type = waveform
					response = deform
					scalemod = 500.0
					responsefunc = costime
					player = 1
				}
				{
					type = waveform
					response = scalexy
					scalemod = 90.0
					responsefunc = costime
					player = 1
				}
			]
		}
		{
			type = circle
			pos = (0.5, 0.59, 0.0)
			radius = 0.15
			color = [
				67
				96
				119
				115
			]
			blendmode = add
			thickness = 0.35000002
			angle = 0.0872665
			angularvel = 0.0872665
			controls = [
				{
					type = waveform
					response = deform
					scalemod = 500.0
					responsefunc = costime
					player = 1
				}
				{
					type = waveform
					response = scalexy
					scalemod = 90.0
					responsefunc = costime
					player = 1
				}
				{
					type = frequency
					response = alphamodulation
					scalemod = 2.0
					spectrumband = 0
				}
			]
		}
		{
			type = hypotrochoid
			pos = (0.5, 0.5, 0.0)
			length = 0.15
			innerradius = 0.15
			outerradius = 0.05
			color = [
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
					type = beaton
					response = angularvelmod
					scalemod = 0.5
					fade = 1.0
				}
			]
		}
		{
			type = circle
			pos = (0.5, 0.62, 0.0)
			radius = 0.05
			color = [
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
					type = waveform
					response = deform
					scalemod = 300.0
					responsefunc = costime
					player = 1
				}
				{
					type = waveform
					response = scalexy
					scalemod = 50.0
					responsefunc = costime
					player = 1
				}
				{
					type = frequency
					response = alphamodulation
					scalemod = 2.0
					spectrumband = 0
				}
			]
		}
		{
			type = nstar2
			pos = (0.5, 0.6, 0.0)
			npoints = 5
			radius = 0.05
			radius2 = 0.4
			color = [
				0
				69
				150
				255
			]
			blendmode = brighten
			thickness = 2.0
			angularvel = -0.872665
		}
	]
}
