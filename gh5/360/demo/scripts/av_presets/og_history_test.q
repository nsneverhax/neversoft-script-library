og_history_test = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98999995, 0.98999995)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
		material = og_mat_custom_blend_state
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.5
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = history
				historytype = vocalsamplitude
				response = deform
				scalemod = 100.0
				spectrumband = 10
				responsefunc = sintime
				timerate = 12.5664
			}
		]
	}
]
