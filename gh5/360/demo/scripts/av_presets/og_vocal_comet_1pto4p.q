og_vocal_comet_1pto4p = [
	{
		type = sprite
		pos = (0.89, 0.0, 0.0)
		scale = (1.0, 0.6)
		width = 0.075
		height = 0.075
		color = [
			246
			255
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
				player = 1
			}
			{
				type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				player = 1
			}
			{
				type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				player = 1
			}
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 10.0
				player = 1
			}
			{
				type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 25.0
				player = 1
			}
			{
				type = starpowerstate
				response = huemodulation
				scalemod = 0.2
				player = 1
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
				player = 1
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				player = 1
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 1
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
			143
		]
		angle = 0
		angularvel = 0
		blendmode = add
		controls = [
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.4
				player = 1
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.4
				player = 2
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.4
				player = 3
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 0.4
				player = 4
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
				type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				player = 1
			}
			{
				type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				player = 1
			}
			{
				type = waveform
				response = deform
				scalemod = 75.0
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 1
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = -0.8
				player = 1
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
				player = 2
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				player = 2
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 2
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 2
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
				player = 2
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				player = 2
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 2
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 2
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.89, 0.0, 0.0)
		scale = (1.0, 0.6)
		width = 0.075
		height = 0.075
		color = [
			246
			255
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
				player = 2
			}
			{
				type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				player = 2
			}
			{
				type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				player = 2
			}
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 10.0
				player = 2
			}
			{
				type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 25.0
				player = 2
			}
			{
				type = starpowerstate
				response = huemodulation
				scalemod = 0.2
				player = 2
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
				type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				player = 2
			}
			{
				type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				player = 2
			}
			{
				type = waveform
				response = deform
				scalemod = 75.0
				player = 2
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = -0.8
				player = 2
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 2
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 2
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
				player = 3
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				player = 3
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 3
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 3
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
				player = 3
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				player = 3
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 3
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 3
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.89, 0.0, 0.0)
		scale = (1.0, 0.6)
		width = 0.075
		height = 0.075
		color = [
			246
			255
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
				player = 3
			}
			{
				type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				player = 3
			}
			{
				type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				player = 3
			}
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 10.0
				player = 3
			}
			{
				type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 25.0
				player = 3
			}
			{
				type = starpowerstate
				response = huemodulation
				scalemod = 0.2
				player = 3
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
				type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				player = 3
			}
			{
				type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				player = 3
			}
			{
				type = waveform
				response = deform
				scalemod = 75.0
				player = 3
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = -0.8
				player = 3
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 3
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 3
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
				player = 4
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				player = 4
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 4
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 4
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
				player = 4
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				player = 4
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 4
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 4
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.89, 0.0, 0.0)
		scale = (1.0, 0.6)
		width = 0.075
		height = 0.075
		color = [
			246
			255
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
				player = 4
			}
			{
				type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				player = 4
			}
			{
				type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				player = 4
			}
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 10.0
				player = 4
			}
			{
				type = vocalsnoteon
				response = brightnessmodulation
				scalemod = 25.0
				player = 4
			}
			{
				type = starpowerstate
				response = huemodulation
				scalemod = 0.2
				player = 4
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
				type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
				player = 4
			}
			{
				type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
				player = 4
			}
			{
				type = waveform
				response = deform
				scalemod = 75.0
				player = 4
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = -0.8
				player = 4
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 4
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 4
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
				player = 1
			}
			{
				type = vocalsnoteon
				response = alphamodulation
				scalemod = 2.0
				player = 1
			}
			{
				type = starpowerstate
				response = bluemodulation
				scalemod = 1.0
				player = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redmodulation
				scalemod = -1.0
				player = 1
				fade = 1.0
			}
		]
	}
]
