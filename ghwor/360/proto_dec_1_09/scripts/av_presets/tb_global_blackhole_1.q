tb_global_blackhole_1 = {
	viewport_params = {
		clearcolor = [
			0
			0
			0
			255
		]
		BlendMode = diffuse
		alphafromgray = 1
	}
	primitives = [
		{
			Type = sprite
			Pos = (0.5, 0.5, 0.0)
			Scale = (1.0, 1.0)
			width = 1.0
			height = 1.0
			Color = [
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
			Type = circle
			Pos = (0.5, 0.5, 0.0)
			radius = 0.01
			Color = [
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
			BlendMode = brighten
			thickness = 1.0
			angle = 0
			angularvel = 0
			controls = [
				{
					Type = constant
					response = offsetx
					scalemod = -0.035
					responsefunc = sintime
					timerate = 5.0
				}
				{
					Type = constant
					response = offsety
					scalemod = -0.035
					responsefunc = costime
					timerate = 5.0
				}
				{
					Type = frequency
					response = deform
					scalemod = 25.0
					spectrumband = 0
				}
			]
		}
		{
			Type = circle
			Pos = (0.5, 0.5, 0.0)
			radius = 0.01
			Color = [
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
			BlendMode = brighten
			thickness = 1.0
			angle = 0
			angularvel = 0
			controls = [
				{
					Type = constant
					response = offsetx
					scalemod = 0.035
					responsefunc = sintime
					timerate = 5.0
				}
				{
					Type = constant
					response = offsety
					scalemod = 0.035
					responsefunc = costime
					timerate = 5.0
				}
				{
					Type = frequency
					response = deform
					scalemod = 25.0
					spectrumband = 0
				}
			]
		}
		{
			Type = circle
			Pos = (0.5, 0.5, 0.0)
			radius = 0.0001
			Color = [
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
			BlendMode = add
			thickness = 1.0
			angle = 0
			angularvel = 0
			controls = [
				{
					Type = constant
					response = offsetx
					scalemod = 0.025
					responsefunc = sintime
					timerate = 5.0
				}
				{
					Type = constant
					response = offsety
					scalemod = 0.025
					responsefunc = costime
					timerate = 5.0
				}
				{
					Type = frequency
					response = deform
					scalemod = 20.0
					spectrumband = 0
				}
			]
		}
		{
			Type = circle
			Pos = (0.5, 0.5, 0.0)
			radius = 0.0001
			Color = [
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
			BlendMode = add
			thickness = 1.0
			angle = 0
			angularvel = 0
			controls = [
				{
					Type = constant
					response = offsetx
					scalemod = -0.025
					responsefunc = sintime
					timerate = 5.0
				}
				{
					Type = constant
					response = offsety
					scalemod = -0.025
					responsefunc = costime
					timerate = 5.0
				}
				{
					Type = frequency
					response = deform
					scalemod = 20.0
					spectrumband = 0
				}
			]
		}
		{
			Type = blendprev
			offset = (0.0, 0.0)
			Scale = (0.91999996, 0.91999996)
			Color = [
				255
				255
				255
				254
			]
			angle = 0.0
			angularvel = 0.0
			BlendMode = blend
		}
		{
			Type = circle
			Pos = (0.5, 0.5, 0.0)
			radius = 0.01
			Color = [
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
			BlendMode = srcmuldstplusdst
			thickness = 1.0
			angle = 0
			angularvel = 0.26179898
			controls = [
				{
					Type = frequency
					response = deform
					scalemod = 50.0
					spectrumband = 0
				}
				{
					Type = beaton
					response = brightnessmodulation
					scalemod = 0.2
					responsefunc = costime
					fade = 0.1
				}
			]
		}
		{
			Type = hypotrochoid
			Pos = (0.5, 0.5, 0.0)
			Scale = (1.0, 1.0)
			length = 0.15
			InnerRadius = 0.15
			outerradius = 0.45000002
			tracelength = 64
			Color = [
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
					Type = frequency
					response = radiusscale
					scalemod = 0.3
					responsefunc = sintime
					timerate = 3.4906602
					spectrumband = 12
				}
			]
		}
		{
			Type = hypotrochoid
			Pos = (0.5, 0.5, 0.0)
			Scale = (1.0, 1.0)
			length = 0.15
			InnerRadius = 0.15
			outerradius = 0.35000002
			tracelength = 64
			Color = [
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
					Type = frequency
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
