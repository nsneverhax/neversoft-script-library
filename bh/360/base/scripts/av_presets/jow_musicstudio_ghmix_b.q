JOW_MusicStudio_GHMix_B = [
	{
		type = blendPrev
		offset = (0.0, 0.01)
		scale = (1.0, 1.0)
		Color = [
			70
			70
			70
			254
		]
		angle = 3.1415896
		angularVel = 0.0174533
		BlendMode = blend
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.5, 4.0)
		Color = [
			255
			255
			255
			47
		]
		angle = 0.523599
		angularVel = 0.0
		BlendMode = subtract
	}
	{
		type = sprite
		Pos = (0.45000002, 0.2)
		scale = (1.0, 1.0)
		width = 2.0
		height = 3.0
		Color = [
			59
			52
			79
			100
		]
		material = OG_Mat_Flare_add
		angle = 1.5533401
		angularVel = 0.0349066
		controls = [
			{
				type = constant
				response = scaleY
				scaleMod = 0.3
				responseFunc = sinTime
				timeRate = 0.349066
			}
			{
				type = constant
				response = alphaModulation
				scaleMod = 0.3
				responseFunc = sinTime
				timeRate = 0.349066
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.8)
		scale = (1.0, 1.0)
		width = 4.0
		height = 4.0
		Color = [
			27
			31
			37
			255
		]
		material = OG_Mat_Flare_add
		angle = 1.58825
		angularVel = -0.0349066
		controls = [
			{
				type = constant
				response = scaleY
				scaleMod = 0.2
				responseFunc = cosTime
				timeRate = 0.17453298
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.0
				responseFunc = sinTime
			}
			{
				type = constant
				response = hueModulation
				scaleMod = 0.120000005
				responseFunc = sinTime
				timeRate = 0.349066
			}
		]
	}
]
