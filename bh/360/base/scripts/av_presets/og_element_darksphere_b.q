OG_Element_DarkSphere_B = [
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 19
		radius = 0.1
		radius2 = 1.0
		Color = [
			46
			24
			24
			255
		]
		BlendMode = brighten
		thickness = 50.0
		angle = 0
		angularVel = 0.872665
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = 1.0
				responseFunc = log2
				spectrumBand = 1
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.9, 0.9)
		Color = [
			255
			255
			255
			253
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			128
			96
			235
			255
		]
		material = OG_Mat_Circle
		angle = 0
		angularVel = -0.54105204
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			128
			96
			235
			255
		]
		material = OG_Mat_Circle_Sub
		angle = 0
		angularVel = 0.523599
		controls = [
			{
				type = frequency
				response = scaleX
				scaleMod = 30.0
				spectrumBand = 10
			}
			{
				type = frequency
				response = scaleY
				scaleMod = 30.0
				spectrumBand = 10
			}
		]
	}
]
