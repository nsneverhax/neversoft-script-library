og_discotron = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			251
			226
			255
			242
		]
		angle = 0.17453298
		angularvel = 0
		BlendMode = blend_alphadiffuse
		nonuniformscale
	}
	{
		Type = nstar2
		Pos = (0.5, 0.35000002, 0.0)
		npoints = 19
		radius = 0.5
		radius2 = 0.0012500001
		Color = [
			255
			66
			0
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularvel = 0.17453298
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		length = 0.7
		Color = [
			0
			255
			205
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 4.71239
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 50.0
				spectrumband = 10
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		length = 0.05
		InnerRadius = 0.05
		outerradius = 0.1
		Color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_add
		BlendMode = add
		thickness = 50.0
		angularvel = 0.872665
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.125
				Player = 1
				gemcolor = green
				fade = 1.0
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 200.0
				Player = 1
				gemcolor = green
				fade = 1.0
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		length = 0.05
		InnerRadius = 0.05
		outerradius = 0.1
		Color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_add
		BlendMode = add
		thickness = 50.0
		angularvel = -0.872665
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.125
				Player = 1
				gemcolor = green
				fade = 1.0
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 200.0
				Player = 1
				gemcolor = green
				fade = 1.0
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		length = 0.7
		Color = [
			0
			255
			205
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 4.71239
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -50.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		length = 0.7
		Color = [
			0
			255
			205
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 4.71239
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = jitterdeform
				scalemod = 50.0
				spectrumband = 10
			}
		]
	}
]
