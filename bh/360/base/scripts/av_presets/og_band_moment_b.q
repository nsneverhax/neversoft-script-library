OG_Band_Moment_B = [
	{
		type = sprite
		Pos = (0.5, 0.5)
		scale = (1.5, 1.5)
		width = 0.25
		height = 0.1
		Color = [
			53
			51
			37
			255
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0.17453298
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.4
				responseFunc = sinTime
				timeRate = 0.523599
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.8
				responseFunc = cosTime
				timeRate = 0.523599
			}
			{
				type = constant
				response = scaleY
				scaleMod = 2.0
				responseFunc = sinTime
				timeRate = 30.0
			}
			{
				type = constant
				response = scaleX
				scaleMod = 2.0
				responseFunc = sinTime
				timeRate = 30.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.4
		Color = [
			125
			124
			123
			255
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularVel = 0
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.41
		InnerRadius = 0.41
		outerRadius = 0.4
		Color = [
			255
			238
			180
			255
		]
		material = OG_Mat_Flare_Brighten
		thickness = 100.0
		angularVel = 174.533
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 13
		radius = 0.4
		radius2 = 0.41
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0.872665
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.99499995, 0.99499995)
		Color = [
			255
			251
			229
			242
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = sprite
		Pos = (0.5, 0.5)
		scale = (1.5, 1.5)
		width = 0.25
		height = 0.1
		Color = [
			53
			51
			37
			255
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0.349066
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.4
				responseFunc = sinTime
				timeRate = 5.23599
			}
			{
				type = constant
				response = offsetY
				scaleMod = -0.8
				responseFunc = cosTime
				timeRate = 5.23599
			}
			{
				type = constant
				response = scaleY
				scaleMod = 2.0
				responseFunc = sinTime
				timeRate = 30.0
			}
			{
				type = constant
				response = scaleX
				scaleMod = 2.0
				responseFunc = sinTime
				timeRate = 30.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5)
		scale = (1.5, 1.5)
		width = 0.25
		height = 0.1
		Color = [
			53
			51
			37
			255
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0.523599
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.4
				responseFunc = cosTime
				timeRate = 5.23599
			}
			{
				type = constant
				response = offsetY
				scaleMod = -0.8
				responseFunc = sinTime
				timeRate = 5.23599
			}
			{
				type = constant
				response = scaleY
				scaleMod = 2.0
				responseFunc = sinTime
				timeRate = 30.0
			}
			{
				type = constant
				response = scaleX
				scaleMod = 2.0
				responseFunc = sinTime
				timeRate = 30.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5)
		scale = (1.5, 1.5)
		width = 0.25
		height = 0.1
		Color = [
			53
			51
			37
			255
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0.0698132
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = -0.4
				responseFunc = cosTime
				timeRate = 5.23599
			}
			{
				type = constant
				response = offsetY
				scaleMod = -0.8
				responseFunc = sinTime
				timeRate = 5.23599
			}
			{
				type = constant
				response = scaleY
				scaleMod = 2.0
				responseFunc = sinTime
				timeRate = 30.0
			}
			{
				type = constant
				response = scaleX
				scaleMod = 2.0
				responseFunc = sinTime
				timeRate = 30.0
			}
		]
	}
]
