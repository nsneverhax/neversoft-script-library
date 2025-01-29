OG_LHC_Prelude = [
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 1.0
		height = 0.25
		Color = [
			15
			9
			18
			255
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		angle = 0
		angularVel = 1.7453301
		controls = [
			{
				type = constant
				response = scaleX
				scaleMod = 1.0
				responseFunc = sinTime
				timeRate = 2.0
			}
			{
				type = constant
				response = scaleY
				scaleMod = 1.0
				responseFunc = sinTime
				timeRate = 2.0
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.97999996, 0.97999996)
		Color = [
			225
			223
			229
			254
		]
		angle = 0.0174533
		angularVel = 0.0
		BlendMode = blend
		controls = [
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.35000002
		Color = [
			11
			9
			20
			127
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.15
				responseFunc = sinTime
				timeRate = 2.0
			}
			{
				type = constant
				response = alphaModulation
				scaleMod = -1.0
				responseFunc = sinTime
				timeRate = 2.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.35000002
		Color = [
			29
			62
			64
			127
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.15
				responseFunc = sinTime
				timeOffset = 4.71239
				timeRate = 2.0
			}
			{
				type = constant
				response = alphaModulation
				scaleMod = -1.0
				responseFunc = sinTime
				timeOffset = 4.71239
				timeRate = 2.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.35000002
		Color = [
			11
			9
			20
			127
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.15
				responseFunc = sinTime
				timeOffset = 1.5708001
				timeRate = 2.0
			}
			{
				type = constant
				response = alphaModulation
				scaleMod = -1.0
				responseFunc = sinTime
				timeOffset = 1.5708001
				timeRate = 2.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.35000002
		Color = [
			29
			62
			64
			127
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.15
				responseFunc = sinTime
				timeOffset = 3.1415896
				timeRate = 2.0
			}
			{
				type = constant
				response = alphaModulation
				scaleMod = -1.0
				responseFunc = sinTime
				timeOffset = 3.1415896
				timeRate = 2.0
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		scale = (2.0, 2.0)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.1
		Color = [
			255
			255
			255
			38
		]
		material = OG_Mat_dot_Add
		BlendMode = blend
		thickness = 30.0
		angularVel = 87.266495
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			138
			138
			138
			255
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularVel = 1.7453301
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 1000.0
				spectrumBand = 10
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		scale = (2.0, 2.0)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.1
		Color = [
			255
			255
			255
			38
		]
		material = OG_Mat_dot_Add
		BlendMode = blend
		thickness = 30.0
		angularVel = -87.266495
	}
]
