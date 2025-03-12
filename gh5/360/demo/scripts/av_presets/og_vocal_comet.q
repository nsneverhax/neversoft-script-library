og_vocal_comet = [
	{
		type = sprite
		pos = (0.89, 0.0, 0.0)
		scale = (1.0, 0.9)
		width = 0.075
		height = 0.075
		color = [
			3
			2
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
				scalemod = 50.0
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = alphamodulation
				scalemod = -100.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = vocalsphrasequality
				response = brightnessmodulation
				scalemod = 1.0
				vocalist_num = 1
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
		type = line
		pos = (0.887, 0.5, 0.0)
		length = 0.5
		color = [
			65
			250
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
				response = bluemodulation
				scalemod = 0.9
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = vocalsphrasequality
				response = saturationmodulation
				scalemod = 1.0
				vocalist_num = 1
			}
		]
	}
	{
		type = sprite
		pos = (0.82, 0.0)
		scale = (1.0, 0.9)
		width = 0.37
		height = 0.1
		color = [
			3
			2
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
				scalemod = 0.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = vocalsphrasequality
				response = brightnessmodulation
				scalemod = 1.0
				vocalist_num = 1
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
