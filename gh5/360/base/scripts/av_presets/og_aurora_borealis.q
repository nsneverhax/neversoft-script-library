og_aurora_borealis = [
	{
		Type = blendprev
		offset = (0.0, -0.001)
		Scale = (0.99899995, 0.99899995)
		Color = [
			127
			127
			0
			12
		]
		angle = 0.000872665
		angularvel = 0.0
		BlendMode = diffuse
		controls = [
			{
				Type = frequency
				response = redmodulation
				scalemod = 500.0
				spectrumband = 1
			}
			{
				Type = frequency
				response = greenmodulation
				scalemod = 500.0
				spectrumband = 2
			}
			{
				Type = frequency
				response = bluemodulation
				scalemod = 1000.0
				spectrumband = 3
			}
		]
	}
	{
		Type = line
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
		angularvel = -0.872665
		controls = [
			{
				Type = frequency_history
				response = deform
				scalemod = 3000.0
				spectrumband = 10
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.2, 0.0)
		length = 0.05
		InnerRadius = 0.01
		outerradius = 0.05
		Color = [
			255
			185
			141
			255
		]
		BlendMode = add
		thickness = 5.0
		angularvel = 174.533
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.2, 0.0)
		length = 0.2
		InnerRadius = 0.01
		outerradius = 0.05
		Color = [
			255
			119
			33
			255
		]
		BlendMode = add
		thickness = 5.0
		angularvel = 8.726729
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.2, 0.0)
		length = 0.2
		InnerRadius = 0.1
		outerradius = 0.5
		Color = [
			255
			255
			255
			255
		]
		BlendMode = add
		thickness = 5.0
		angularvel = 8.726729
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency_history
				response = deform
				scalemod = 3000.0
				spectrumband = 10
			}
		]
	}
	{
		Type = circle
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
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 1000.0
				spectrumband = 10
			}
		]
	}
]
