OG_Discotron = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			251
			226
			255
			242
		]
		angle = 0.17453298
		angularVel = 0
		BlendMode = blend_AlphaDiffuse
		nonUniformScale
	}
	{
		type = nStar2
		Pos = (0.5, 0.35000002, 0.0)
		nPoints = 19
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
		angularVel = 0.17453298
	}
	{
		type = line
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
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 50.0
				spectrumBand = 10
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.05
		InnerRadius = 0.05
		outerRadius = 0.1
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_Flare_add
		BlendMode = add
		thickness = 50.0
		angularVel = 0.872665
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.125
				player = 1
				gemColor = green
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 200.0
				player = 1
				gemColor = green
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.05
		InnerRadius = 0.05
		outerRadius = 0.1
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_Flare_add
		BlendMode = add
		thickness = 50.0
		angularVel = -0.872665
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.125
				player = 1
				gemColor = green
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 200.0
				player = 1
				gemColor = green
				fade = 1.0
			}
		]
	}
	{
		type = line
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
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -50.0
				spectrumBand = 10
			}
		]
	}
	{
		type = line
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
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = jitterDeform
				scaleMod = 50.0
				spectrumBand = 10
			}
		]
	}
]
