OG_Jam_Menu = [
	{
		type = blendPrev
		offset = (0.0, 0.01)
		scale = (1.0, 1.0)
		Color = [
			136
			151
			161
			254
		]
		angle = 3.1415896
		angularVel = 0
		BlendMode = blend
	}
	{
		type = sprite
		width = 0.2
		height = 3.0
		offset = (0.5, 0.75)
		scale = (1.0, 1.0)
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare
		BlendMode = blend
		angle = 1.5533401
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = scaleY
				scaleMod = 0.125
				responseFunc = cosTime
			}
		]
	}
	{
		type = sprite
		width = 0.2
		height = 5.0
		offset = (0.25, 0.9)
		scale = (1.0, 1.0)
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare
		BlendMode = blend
		angle = 1.58825
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = redModulation
				scaleMod = 0.1
				responseFunc = sinTime
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.125
				responseFunc = cosTime
			}
		]
	}
	{
		type = sprite
		width = 0.2
		height = 4.0
		offset = (0.75, 0.6)
		scale = (1.0, 1.0)
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare
		BlendMode = blend
		angle = 1.5708001
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = scaleY
				scaleMod = 0.125
				responseFunc = sinTime
			}
			{
				type = constant
				response = redModulation
				scaleMod = 0.1
				responseFunc = sinTime
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (3.0, 1.0)
		Color = [
			255
			255
			255
			47
		]
		angle = 0.26179898
		angularVel = 0.0872665
		BlendMode = subtract
	}
	{
		type = sprite
		width = 0.2
		height = 4.0
		offset = (0.25, 0.45000002)
		scale = (1.0, 1.0)
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare
		BlendMode = blend
		angle = 1.5708001
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = scaleY
				scaleMod = 0.125
				responseFunc = cosTime
			}
		]
	}
	{
		type = sprite
		width = 0.4
		height = 6.0
		offset = (0.5, 0.2)
		scale = (1.0, 1.0)
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare
		BlendMode = blend
		angle = 1.5708001
		angularVel = 0.0
		controls = [
		]
	}
	{
		type = sprite
		width = 1.0
		height = 0.1
		offset = (0.05, 0.5)
		scale = (1.0, 1.0)
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare
		BlendMode = blend
		angle = 0.0
		angularVel = 0.0
		controls = [
		]
	}
]
