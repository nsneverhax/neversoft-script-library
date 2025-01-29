OG_Hypo_Mat = [
	{
		type = line
		Pos = (0.65000004, 0.25, 0.0)
		length = 2.0
		Color = [
			198
			198
			198
			31
		]
		BlendMode = subtract
		thickness = 1.0
		angle = 0.0
		angularVel = 1.7453301
		controls = [
			{
				type = frequency_History
				response = deform
				scaleMod = 30.0
				spectrumBand = 10
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.2, 0.0)
		length = 0.05
		InnerRadius = 0.01
		outerRadius = 0.05
		Color = [
			255
			185
			141
			255
		]
		material = OG_Mat_Flare
		BlendMode = add
		thickness = 2.0
		angularVel = 174.533
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.2, 0.0)
		length = 0.2
		InnerRadius = 0.01
		outerRadius = 0.05
		Color = [
			255
			119
			33
			255
		]
		BlendMode = add
		thickness = 10.0
		angularVel = 8.726729
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.2, 0.0)
		length = 0.2
		InnerRadius = 0.1
		outerRadius = 0.5
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_Flare
		BlendMode = add
		thickness = 80.0
		angularVel = 8.726729
	}
	{
		type = line
		Pos = (0.5, 0.9, 0.0)
		length = 1.0
		Color = [
			0
			11
			28
			31
		]
		BlendMode = blend_AlphaDiffuse
		thickness = 20.0
		angle = 0.0
		angularVel = 0.0
		controls = [
			{
				type = frequency_History
				response = deform
				scaleMod = 1000.0
				spectrumBand = 10
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.001, 1.001)
		Color = [
			255
			255
			255
			31
		]
		angle = 0.0
		angularVel = 0
		BlendMode = add
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.001
				responseFunc = cosTime
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.001
				responseFunc = sinTime
			}
		]
	}
	{
		type = circle
		Pos = (0.55, 0.45000002, 0.0)
		radius = 0.2
		Color = [
			0
			0
			0
			255
		]
		BlendMode = subtract
		thickness = 2.0
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.2
				responseFunc = cosTime
			}
			{
				type = frequency
				response = deform
				scaleMod = 20.0
				spectrumBand = 0
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, -0.0001)
		scale = (0.99899995, 0.99899995)
		Color = [
			138
			138
			138
			0
		]
		angle = 0.00174533
		angularVel = 0.0
		BlendMode = diffuse
		controls = [
			{
				type = frequency
				response = blueModulation
				scaleMod = 1000.0
				spectrumBand = 10
			}
			{
				type = frequency
				response = greenModulation
				scaleMod = 500.0
				spectrumBand = 9
			}
			{
				type = frequency
				response = redModulation
				scaleMod = 200.0
				spectrumBand = 5
			}
		]
	}
	{
		type = nStar2
		Pos = (0.65000004, 0.25, 0.0)
		nPoints = 5
		radius = 0.001
		radius2 = 0.1
		Color = [
			22
			22
			22
			255
		]
		BlendMode = subtract
		thickness = 1.0
		angle = 0
		angularVel = 0.872665
	}
]
