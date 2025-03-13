og_lhc_rising_a = [
	{
		type = blendprev
		offset = (-0.0004, -0.0006)
		scale = (0.99499995, 0.99499995)
		color = [
			255
			253
			251
			244
		]
		angle = 0.0021816602
		angularvel = 0
		blendmode = add
	}
	{
		type = sprite
		pos = (0.5, 0.5)
		scale = (1.0, 1.0)
		width = 0.125
		height = 0.3
		color = [
			103
			108
			149
			255
		]
		material = og_mat_flare_add
		blendmode = add
		angle = 0
		angularvel = 6.28319
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.3
				responsefunc = sintime
				timerate = 20.0
			}
			{
				type = constant
				response = offsety
				scalemod = 0.6
				responsefunc = costime
				timerate = 20.0
			}
			{
				type = constant
				response = scaley
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				type = constant
				response = scalex
				scalemod = 0.5
				responsefunc = sintime
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.0125
		innerradius = 0.25
		outerradius = 0.48000002
		color = [
			123
			115
			87
			255
		]
		material = og_mat_flare_add
		blendmode = blend
		thickness = 150.0
		angularvel = 17.453299
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 13
		radius = 0.0
		radius2 = 1.0
		color = [
			15
			15
			15
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0.872665
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.6
		height = 0.6
		color = [
			28
			23
			15
			255
		]
		material = og_mat_sphere_sub
		blendmode = blend
		angle = 0
		angularvel = 0.17453298
		controls = [
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.3
		color = [
			81
			48
			24
			255
		]
		blendmode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.0125
		innerradius = 0.25
		outerradius = 0.48000002
		color = [
			123
			115
			87
			255
		]
		material = og_mat_flare_add
		blendmode = blend
		thickness = 140.0
		angularvel = -17.453299
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		color = [
			112
			112
			112
			0
		]
		material = og_mat_flare_add
		blendmode = blend
		angle = 0
		angularvel = 0.523599
		controls = [
			{
				type = beaton
				response = alphamodulation
				scalemod = 10.0
				fade = 0.1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.2
		color = [
			202
			120
			60
			255
		]
		blendmode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 18.849602
		controls = [
			{
				type = beaton
				response = radiusscale
				scalemod = 0.1
				fade = 0.1
			}
			{
				type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 10
			}
		]
	}
]
