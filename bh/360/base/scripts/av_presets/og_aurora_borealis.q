OG_Aurora_Borealis = [
	{
		type = blendPrev
		offset = (0.0, -0.001)
		scale = (0.99899995, 0.99899995)
		Color = [
			127
			127
			0
			12
		]
		angle = 0.000872665
		angularVel = 0.0
		BlendMode = diffuse
		controls = [
			{
				type = frequency
				response = redModulation
				scaleMod = 500.0
				spectrumBand = 1
			}
			{
				type = frequency
				response = greenModulation
				scaleMod = 500.0
				spectrumBand = 2
			}
			{
				type = frequency
				response = blueModulation
				scaleMod = 1000.0
				spectrumBand = 3
			}
		]
	}
	{
		type = line
		Pos = (0.6, 0.5, 0.0)
		length = 1.0
		Color = [
			61
			160
			198
			31
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0.0
		angularVel = -0.872665
		controls = [
			{
				type = frequency_History
				response = deform
				scaleMod = 3000.0
				spectrumBand = 10
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.2, 0.0)
		scale = (1.0, 1.0)
		length = 0.05
		InnerRadius = 0.01
		outerRadius = 0.05
		Color = [
			255
			185
			141
			255
		]
		material = OG_Mat_Flare_add
		thickness = 20.0
		angularVel = 174.533
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.2, 0.0)
		scale = (1.0, 1.0)
		length = 0.2
		InnerRadius = 0.01
		outerRadius = 0.05
		Color = [
			255
			119
			33
			255
		]
		material = OG_Mat_Flare_add
		thickness = 20.0
		angularVel = 8.726729
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.2, 0.0)
		scale = (1.0, 1.0)
		length = 0.2
		InnerRadius = 0.1
		outerRadius = 0.5
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_Flare_add
		thickness = 20.0
		angularVel = 8.726729
	}
	{
		type = line
		Pos = (0.6, 0.98999995, 0.0)
		length = 1.0
		Color = [
			0
			11
			28
			31
		]
		BlendMode = subtract
		thickness = 10.0
		angle = 0.0
		angularVel = 0.0
		controls = [
			{
				type = frequency_History
				response = deform
				scaleMod = 3000.0
				spectrumBand = 10
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.001
		Color = [
			154
			39
			255
			255
		]
		BlendMode = multiply
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 1000.0
				spectrumBand = 10
			}
		]
	}
]
