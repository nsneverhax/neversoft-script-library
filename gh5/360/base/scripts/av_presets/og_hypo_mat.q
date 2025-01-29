og_hypo_mat = [
	{
		Type = line
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
		angularvel = 1.7453301
		controls = [
			{
				Type = frequency_history
				response = deform
				scalemod = 30.0
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
		material = og_mat_flare
		BlendMode = add
		thickness = 2.0
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
		thickness = 10.0
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
		material = og_mat_flare
		BlendMode = add
		thickness = 80.0
		angularvel = 8.726729
	}
	{
		Type = line
		Pos = (0.5, 0.9, 0.0)
		length = 1.0
		Color = [
			0
			11
			28
			31
		]
		BlendMode = blend_alphadiffuse
		thickness = 20.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency_history
				response = deform
				scalemod = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.001, 1.001)
		Color = [
			255
			255
			255
			31
		]
		angle = 0.0
		angularvel = 0
		BlendMode = add
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.001
				responsefunc = costime
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.001
				responsefunc = sintime
			}
		]
	}
	{
		Type = circle
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
				Type = constant
				response = radiusscale
				scalemod = 0.2
				responsefunc = costime
			}
			{
				Type = frequency
				response = deform
				scalemod = 20.0
				spectrumband = 0
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, -0.0001)
		Scale = (0.99899995, 0.99899995)
		Color = [
			138
			138
			138
			0
		]
		angle = 0.00174533
		angularvel = 0.0
		BlendMode = diffuse
		controls = [
			{
				Type = frequency
				response = bluemodulation
				scalemod = 1000.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = greenmodulation
				scalemod = 500.0
				spectrumband = 9
			}
			{
				Type = frequency
				response = redmodulation
				scalemod = 200.0
				spectrumband = 5
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.65000004, 0.25, 0.0)
		npoints = 5
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
		angularvel = 0.872665
	}
]
