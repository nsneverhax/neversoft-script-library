og_hypo_mat = [
	{
		type = line
		pos = (0.65000004, 0.25, 0.0)
		length = 2.0
		color = [
			198
			198
			198
			31
		]
		blendmode = subtract
		thickness = 1.0
		angle = 0.0
		angularvel = 1.7453301
		controls = [
			{
				type = frequency_history
				response = deform
				scalemod = 30.0
				spectrumband = 10
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.2, 0.0)
		length = 0.05
		innerradius = 0.01
		outerradius = 0.05
		color = [
			255
			185
			141
			255
		]
		material = og_mat_flare
		blendmode = add
		thickness = 2.0
		angularvel = 174.533
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.2, 0.0)
		length = 0.2
		innerradius = 0.01
		outerradius = 0.05
		color = [
			255
			119
			33
			255
		]
		blendmode = add
		thickness = 10.0
		angularvel = 8.726729
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.2, 0.0)
		length = 0.2
		innerradius = 0.1
		outerradius = 0.5
		color = [
			255
			255
			255
			255
		]
		material = og_mat_flare
		blendmode = add
		thickness = 80.0
		angularvel = 8.726729
	}
	{
		type = line
		pos = (0.5, 0.9, 0.0)
		length = 1.0
		color = [
			0
			11
			28
			31
		]
		blendmode = blend_alphadiffuse
		thickness = 20.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				type = frequency_history
				response = deform
				scalemod = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.001, 1.001)
		color = [
			255
			255
			255
			31
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.001
				responsefunc = costime
			}
			{
				type = constant
				response = offsety
				scalemod = 0.001
				responsefunc = sintime
			}
		]
	}
	{
		type = circle
		pos = (0.55, 0.45000002, 0.0)
		radius = 0.2
		color = [
			0
			0
			0
			255
		]
		blendmode = subtract
		thickness = 2.0
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.2
				responsefunc = costime
			}
			{
				type = frequency
				response = deform
				scalemod = 20.0
				spectrumband = 0
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, -0.0001)
		scale = (0.99899995, 0.99899995)
		color = [
			138
			138
			138
			0
		]
		angle = 0.00174533
		angularvel = 0.0
		blendmode = diffuse
		controls = [
			{
				type = frequency
				response = bluemodulation
				scalemod = 1000.0
				spectrumband = 10
			}
			{
				type = frequency
				response = greenmodulation
				scalemod = 500.0
				spectrumband = 9
			}
			{
				type = frequency
				response = redmodulation
				scalemod = 200.0
				spectrumband = 5
			}
		]
	}
	{
		type = nstar2
		pos = (0.65000004, 0.25, 0.0)
		npoints = 5
		radius = 0.001
		radius2 = 0.1
		color = [
			22
			22
			22
			255
		]
		blendmode = subtract
		thickness = 1.0
		angle = 0
		angularvel = 0.872665
	}
]
