og_discotron = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			251
			226
			255
			242
		]
		angle = 0.17453298
		angularvel = 0
		blendmode = blend_alphadiffuse
		nonuniformscale
	}
	{
		type = nstar2
		pos = (0.5, 0.35000002, 0.0)
		npoints = 19
		radius = 0.5
		radius2 = 0.0012500001
		color = [
			255
			66
			0
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0.17453298
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		length = 0.7
		color = [
			0
			255
			205
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 4.71239
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 50.0
				spectrumband = 10
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.05
		innerradius = 0.05
		outerradius = 0.1
		color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_add
		blendmode = add
		thickness = 50.0
		angularvel = 0.872665
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.125
				player = 1
				gemcolor = green
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 200.0
				player = 1
				gemcolor = green
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.05
		innerradius = 0.05
		outerradius = 0.1
		color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_add
		blendmode = add
		thickness = 50.0
		angularvel = -0.872665
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.125
				player = 1
				gemcolor = green
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 200.0
				player = 1
				gemcolor = green
				fade = 1.0
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		length = 0.7
		color = [
			0
			255
			205
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 4.71239
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -50.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		length = 0.7
		color = [
			0
			255
			205
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 4.71239
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = jitterdeform
				scalemod = 50.0
				spectrumband = 10
			}
		]
	}
]
