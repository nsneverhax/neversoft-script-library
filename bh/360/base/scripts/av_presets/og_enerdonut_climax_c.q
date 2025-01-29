OG_Enerdonut_Climax_C = [
	{
		type = blendPrev
		offset = (-0.0004, -0.0007)
		scale = (0.97999996, 0.97999996)
		Color = [
			255
			255
			255
			255
		]
		angle = 0.0
		angularVel = 0
		BlendMode = add
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.005
				responseFunc = sinTime
				timeRate = 1.0472
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.005
				responseFunc = cosTime
				timeRate = 1.0472
			}
		]
	}
	{
		type = blendPrev
		offset = (-0.0004, -0.0007)
		scale = (2.0, 1.0)
		Color = [
			121
			246
			110
			38
		]
		angle = 1.48353
		angularVel = 0
		BlendMode = subtract
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
		angle = 0
		angularVel = 0
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
			255
			138
			114
			255
		]
		BlendMode = add
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
			255
			61
			195
			255
		]
		BlendMode = add
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
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularVel = 1.39627
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
			72
			61
			255
			128
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularVel = -1.39626
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
		angle = 0
		angularVel = 0
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
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (0.5, 0.5)
		width = 0.5
		height = 0.5
		Color = [
			255
			161
			128
			255
		]
		material = OG_Mat_Flare_Blend
		BlendMode = blend
		angle = 0
		angularVel = 1.7453301
		controls = [
			{
				type = beatOn
				response = scaleX
				scaleMod = 0.5
				fade = 1.0
			}
			{
				type = beatOn
				response = scaleY
				scaleMod = 0.5
				fade = 1.0
			}
		]
	}
]
