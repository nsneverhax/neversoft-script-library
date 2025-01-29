OG_LHC_Falling = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			248
			255
			252
			254
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_dot_Add
		BlendMode = blend
		thickness = 10.0
		angularVel = 10
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.5
				responseFunc = sinTime
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			117
			175
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 1.0472
		angularVel = -0.17453298
		controls = [
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = 1000.0
				spectrumBand = 10
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 3
		radius = 0.1
		radius2 = 0.1
		Color = [
			20
			44
			53
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = angleMod
				scaleMod = 0.5
				responseFunc = sinTime
			}
			{
				type = constant
				response = radiusScale
				scaleMod = 0.5
				responseFunc = sinTime
			}
			{
				type = constant
				response = radius2Scale
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 0.523599
			}
		]
	}
]
