og_vocals_freeform_static = [
	{
		type = blendprev
		offset = (0.01, 0.0)
		scale = (0.95, 1.1)
		color = [
			243
			250
			243
			243
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
	}
	{
		type = hypotrochoid
		pos = (0.31, 0.5, 0.0)
		scale = (0.1, 0.1)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			44
			44
			44
			51
		]
		material = og_mat_sphere_add
		thickness = 500.0
		angularvel = -1.9198599
	}
	{
		type = hypotrochoid
		pos = (0.31, 0.5, 0.0)
		scale = (0.5, 0.3)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			31
			31
			31
			51
		]
		material = og_mat_flare_add
		thickness = 200.0
		angularvel = 0.523599
	}
	{
		type = sprite
		pos = (0.31, 0.5)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			13
			13
			13
			255
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0.523599
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.0
		color = [
			255
			133
			58
			255
		]
		blendmode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = history
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				player = 1
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = -1.0
				player = 1
			}
			{
				type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				player = 1
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.0
		color = [
			255
			133
			58
			255
		]
		blendmode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = -1.0
				player = 2
			}
			{
				type = history
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				player = 2
			}
			{
				type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				player = 2
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.0
		color = [
			255
			133
			58
			255
		]
		blendmode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = -1.0
				player = 3
			}
			{
				type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				player = 3
			}
			{
				type = history
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				player = 3
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.0
		color = [
			255
			133
			58
			255
		]
		blendmode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = -1.0
				player = 4
			}
			{
				type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				player = 4
			}
			{
				type = history
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				player = 4
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.0
		color = [
			58
			255
			255
			0
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = history
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				player = 1
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 1.0
				player = 1
			}
			{
				type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				player = 1
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.0
		color = [
			58
			255
			255
			0
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 1.0
				player = 2
			}
			{
				type = history
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				player = 2
			}
			{
				type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				player = 2
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.0
		color = [
			58
			255
			255
			0
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 1.0
				player = 3
			}
			{
				type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				player = 3
			}
			{
				type = history
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				player = 3
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			52
			49
			255
			255
		]
		blendmode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.0
		color = [
			58
			255
			255
			0
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 1.0
				player = 4
			}
			{
				type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				player = 4
			}
			{
				type = history
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				player = 4
			}
		]
	}
]
