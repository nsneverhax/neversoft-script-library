og_vocal_comet_static = [
	{
		type = sprite
		pos = (0.89, 0.0, 0.0)
		scale = (1.0, 0.7)
		width = 0.075
		height = 0.075
		color = [
			255
			150
			0
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				vocalist_num = 1
			}
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 25.0
				vocalist_num = 1
			}
			{
				type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 25.0
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = -100.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = nstar2
		pos = (0.89, 0.0, 0.0)
		npoints = 5
		radius = 0.01
		radius2 = 0.0233
		color = [
			59
			232
			252
			0
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 2.6179898
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				vocalist_num = 1
			}
			{
				type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 0.5
				vocalist_num = 1
			}
			{
				type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.5
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = 20.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = nstar2
		pos = (0.89, 0.0, 0.0)
		npoints = 5
		radius = 0.0429
		radius2 = 0.1
		color = [
			0
			1
			1
			0
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 2.6179898
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 0.2
				vocalist_num = 1
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		scale = (1.0, 0.7)
		length = 0.0125
		innerradius = 0.125
		outerradius = 0.1
		color = [
			255
			86
			0
			0
		]
		material = og_mat_flare_add
		thickness = 10.0
		angularvel = 13.9626
		controls = [
			{
				type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				vocalist_num = 1
			}
			{
				type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				vocalist_num = 1
			}
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				vocalist_num = 1
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		scale = (0.7, 0.2)
		length = 0.052500002
		innerradius = 0.0125
		outerradius = 0.1
		color = [
			65
			251
			0
			31
		]
		material = og_mat_flare_add
		thickness = 10.0
		angularvel = 13.9626
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				vocalist_num = 1
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.85, 0.0, 0.0)
		scale = (1.0, 0.7)
		length = 0.0125
		innerradius = 0.125
		outerradius = 0.1
		color = [
			255
			185
			0
			0
		]
		material = og_mat_flare_add
		thickness = 10.0
		angularvel = -52.359898
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				vocalist_num = 1
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.89, 0.0, 0.0)
		scale = (0.3, 0.3)
		length = 0.2175
		innerradius = 0.125
		outerradius = 0.3
		color = [
			0
			196
			255
			0
		]
		material = og_mat_flare_add
		thickness = 10.0
		angularvel = -523.599
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 0.6
				vocalist_num = 1
			}
			{
				type = vocalsamplitude
				response = brightnessmodulation
				scalemod = 5.0
				vocalist_num = 1
			}
			{
				type = beaton
				response = radius2scale
				scalemod = 0.3
				fade = 1.0
			}
		]
	}
	{
		type = line
		pos = (0.887, 0.5, 0.0)
		length = 0.5
		color = [
			65
			251
			0
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 40.0
			}
			{
				type = starpowerstate
				response = saturationmodulation
				scalemod = -0.8
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.82, 0.0)
		scale = (1.0, 0.7)
		width = 0.37
		height = 0.1
		color = [
			255
			150
			0
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
				vocalist_num = 1
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.9
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = huemodulation
				scalemod = 0.4
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = saturationmodulation
				scalemod = -0.2
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = blendprev
		offset = (-0.005, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			255
			255
			154
		]
		angle = 0
		angularvel = 0
		blendmode = add
		controls = [
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 0.18
				vocalist_num = 1
			}
		]
	}
]
