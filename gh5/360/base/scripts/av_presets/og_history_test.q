og_history_test = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98999995, 0.98999995)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
		material = og_mat_custom_blend_state
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.5
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = History
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
