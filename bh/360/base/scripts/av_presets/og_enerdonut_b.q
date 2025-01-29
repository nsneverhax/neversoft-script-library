OG_Enerdonut_B = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.01, 1.01)
		Color = [
			255
			255
			255
			254
		]
		angle = 0.0
		angularVel = 0
		BlendMode = blend_AlphaDiffuse
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.001
				responseFunc = sinTime
				timeRate = 1.0472
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.001
				responseFunc = cosTime
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
				timeRate = 3.1415896
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
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.4
		Color = [
			114
			203
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 3.1415896
		controls = [
			{
				type = constant
				response = lengthScale
				scaleMod = 0.1
				responseFunc = sinTime
				timeRate = 3.1415896
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
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.4
		Color = [
			61
			255
			242
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = -3.1415896
		controls = [
			{
				type = constant
				response = lengthScale
				scaleMod = 0.1
				responseFunc = sinTime
				timeRate = 3.1415896
			}
			{
				type = frequency_History
				response = deform
				scaleMod = 50.0
				responseFunc = cosTime
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.4
		Color = [
			255
			114
			114
			121
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 3.1415896
		controls = [
			{
				type = constant
				response = lengthScale
				scaleMod = 0.1
				responseFunc = sinTime
				timeRate = 3.1415896
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.4
		Color = [
			72
			61
			255
			128
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = -3.1415896
		controls = [
			{
				type = constant
				response = lengthScale
				scaleMod = 0.1
				responseFunc = sinTime
				timeRate = 3.1415896
			}
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
				responseFunc = cosTime
				timeRate = 3.1415896
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
