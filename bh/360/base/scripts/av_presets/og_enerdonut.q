OG_Enerdonut = [
	{
		type = blendPrev
		offset = (-0.0004, -0.0007)
		scale = (1.01, 1.01)
		Color = [
			255
			255
			255
			254
		]
		angle = 0.00174533
		angularVel = 0
		BlendMode = blend_AlphaDiffuse
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.2
		Color = [
			99
			98
			70
			255
		]
		BlendMode = brighten
		thickness = 10.0
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.05
				responseFunc = sinTime
				timeRate = 1.0472
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			144
			70
			255
			126
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		thickness = 200.0
		angularVel = 17453.3
		controls = [
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			196
			228
			255
			102
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		thickness = 101.0
		angularVel = 1745.3301
		controls = [
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.2
		Color = [
			255
			169
			59
			93
		]
		BlendMode = add
		thickness = 1.0
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.05
				responseFunc = sinTime
				timeRate = 2.0944
			}
			{
				type = frequency_History
				response = deform
				scaleMod = -50.0
				responseFunc = cosTime
				spectrumBand = 10
			}
		]
	}
]
