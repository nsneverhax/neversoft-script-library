og_eighties = [
	{
		type = blendprev
		offset = (0.01, 0.01)
		scale = (1.01, 2.0)
		color = [
			255
			255
			255
			242
		]
		angle = 0.0
		angularvel = 0.17453298
		blendmode = add
	}
	{
		type = line
		pos = (0.5, 0.75, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		blendmode = add
		thickness = 4.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 1000.0
				responsefunc = log10
				spectrumband = 10
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.25
		color = [
			101
			75
			255
			255
		]
		blendmode = add
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 1000.0
				responsefunc = log10
				spectrumband = 10
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			248
			248
			127
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = blend
	}
]
