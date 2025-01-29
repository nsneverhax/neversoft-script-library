OG_Enerdonut_F = [
	{
		type = blendPrev
		offset = (-0.0004, -0.0007)
		scale = (0.97999996, 0.97999996)
		Color = [
			252
			250
			255
			255
		]
		angle = 0.0
		angularVel = 0
		BlendMode = add
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			144
			70
			255
			126
		]
		material = OG_Mat_Flare_Brighten
		BlendMode = brighten
		thickness = 200.0
		angularVel = 17453.3
		controls = [
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			196
			228
			255
			102
		]
		material = OG_Mat_Flare_Brighten
		BlendMode = blend
		thickness = 101.0
		angularVel = 1745.3301
		controls = [
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			255
			169
			59
			93
		]
		BlendMode = add
		thickness = 3.0
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
				scaleMod = -500.0
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
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0.523599
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
				scaleMod = -500.0
				responseFunc = cosTime
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = -0.4
		Color = [
			255
			61
			195
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = -0.523599
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
				scaleMod = 500.0
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
			227
			227
			121
		]
		BlendMode = brighten
		thickness = 20.0
		angle = 0.0349066
		angularVel = 1.5708001
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
			217
			215
			255
			128
		]
		BlendMode = brighten
		thickness = 10.0
		angle = -0.0349066
		angularVel = -1.5708001
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
		radius = 0.1
		Color = [
			255
			169
			59
			93
		]
		BlendMode = add
		thickness = 3.0
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
				scaleMod = -500.0
				responseFunc = cosTime
				spectrumBand = 10
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_flare_sub
		BlendMode = blend
		angle = 0
		angularVel = 0
	}
]
