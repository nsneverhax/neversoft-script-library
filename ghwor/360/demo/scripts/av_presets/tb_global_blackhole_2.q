tb_global_blackhole_2 = {
	viewport_params = {
		clearcolor = [
			0
			0
			0
			255
		]
		blendmode = diffuse
		alphafromgray = 1
	}
	primitives = [
		{
			type = sprite
			pos = (0.5, 0.5, 0.0)
			scale = (1.0, 1.0)
			width = 1.0
			height = 1.0
			color = [
				117
				75
				56
				255
			]
			material = tb_mat_gradient
			angle = 0
			angularvel = 0
		}
		{
			type = circle
			pos = (0.5, 0.5, 0.0)
			radius = 0.01
			color = [
				121
				0
				105
				255
			]
			color2 = [
				0
				0
				0
				0
			]
			blendmode = brighten
			thickness = 1.0
			angle = 0
			angularvel = 0
			controls = [
				{
					type = constant
					response = offsetx
					scalemod = -0.035
					responsefunc = sintime
					timerate = 5.0
				}
				{
					type = constant
					response = offsety
					scalemod = -0.035
					responsefunc = costime
					timerate = 5.0
				}
				{
					type = frequency
					response = deform
					scalemod = 25.0
					spectrumband = 0
				}
			]
		}
		{
			type = circle
			pos = (0.5, 0.5, 0.0)
			radius = 0.01
			color = [
				121
				0
				105
				255
			]
			color2 = [
				0
				0
				0
				0
			]
			blendmode = brighten
			thickness = 1.0
			angle = 0
			angularvel = 0
			controls = [
				{
					type = constant
					response = offsetx
					scalemod = 0.035
					responsefunc = sintime
					timerate = 5.0
				}
				{
					type = constant
					response = offsety
					scalemod = 0.035
					responsefunc = costime
					timerate = 5.0
				}
				{
					type = frequency
					response = deform
					scalemod = 25.0
					spectrumband = 0
				}
			]
		}
		{
			type = circle
			pos = (0.5, 0.5, 0.0)
			radius = 0.0001
			color = [
				35
				26
				0
				255
			]
			color2 = [
				0
				0
				0
				0
			]
			blendmode = add
			thickness = 1.0
			angle = 0
			angularvel = 0
			controls = [
				{
					type = constant
					response = offsetx
					scalemod = 0.025
					responsefunc = sintime
					timerate = 5.0
				}
				{
					type = constant
					response = offsety
					scalemod = 0.025
					responsefunc = costime
					timerate = 5.0
				}
				{
					type = frequency
					response = deform
					scalemod = 20.0
					spectrumband = 0
				}
			]
		}
		{
			type = circle
			pos = (0.5, 0.5, 0.0)
			radius = 0.0001
			color = [
				35
				26
				0
				255
			]
			color2 = [
				0
				0
				0
				0
			]
			blendmode = add
			thickness = 1.0
			angle = 0
			angularvel = 0
			controls = [
				{
					type = constant
					response = offsetx
					scalemod = -0.025
					responsefunc = sintime
					timerate = 5.0
				}
				{
					type = constant
					response = offsety
					scalemod = -0.025
					responsefunc = costime
					timerate = 5.0
				}
				{
					type = frequency
					response = deform
					scalemod = 20.0
					spectrumband = 0
				}
			]
		}
		{
			type = blendprev
			offset = (0.0, 0.0)
			scale = (0.91999996, 0.91999996)
			color = [
				255
				255
				255
				254
			]
			angle = 0.0
			angularvel = 0.0
			blendmode = blend
		}
		{
			type = circle
			pos = (0.5, 0.5, 0.0)
			radius = 0.01
			color = [
				95
				69
				41
				255
			]
			color2 = [
				0
				0
				0
				0
			]
			blendmode = srcmuldstplusdst
			thickness = 1.0
			angle = 0
			angularvel = 0.26179898
			controls = [
				{
					type = frequency
					response = deform
					scalemod = 50.0
					spectrumband = 0
				}
				{
					type = beaton
					response = brightnessmodulation
					scalemod = 0.2
					responsefunc = costime
					fade = 0.1
				}
			]
		}
		{
			type = hypotrochoid
			pos = (0.5, 0.5, 0.0)
			scale = (1.0, 1.0)
			length = 0.15
			innerradius = 0.15
			outerradius = 0.45000002
			color = [
				255
				220
				0
				255
			]
			material = og_mat_flare_add
			thickness = 25.0
			angularvel = -1.7453301
			controls = [
				{
					type = frequency
					response = radiusscale
					scalemod = 0.3
					responsefunc = sintime
					timerate = 3.4906602
					spectrumband = 12
				}
			]
		}
		{
			type = hypotrochoid
			pos = (0.5, 0.5, 0.0)
			scale = (1.0, 1.0)
			length = 0.15
			innerradius = 0.15
			outerradius = 0.45000002
			color = [
				255
				220
				0
				255
			]
			material = og_mat_flare_add
			thickness = 25.0
			angularvel = 1.7453301
			controls = [
				{
					type = frequency
					response = radiusscale
					scalemod = 0.3
					responsefunc = sintime
					timerate = 3.4906602
					spectrumband = 12
				}
			]
		}
	]
}
