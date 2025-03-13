og_subtract_torn_clouds = [
	{
		type = blendprev
		offset = (0.0, -0.01)
		scale = (1.0, 1.0)
		color = [
			255
			248
			242
			249
		]
		angle = 0.0
		angularvel = 0
		blendmode = blend_alphadiffuse
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		color = [
			216
			207
			255
			50
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0001, 0.3)
		scale = (4.0, 1.0)
		color = [
			255
			255
			255
			84
		]
		angle = 0
		angularvel = 0
		blendmode = subtract
	}
	{
		type = line
		pos = (0.5, 0.88, 0.0)
		length = 0.95
		color = [
			123
			189
			255
			255
		]
		blendmode = add
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 0
			}
		]
	}
]
