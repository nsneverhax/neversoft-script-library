OG_Fog_Field_2 = [
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
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (3.0, 1.0)
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
		width = 0.2
		height = 3.0
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare_add
		angle = 1.5533401
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = scaleY
				scaleMod = 0.3
				responseFunc = sinTime
			}
		]
	}
	{
		type = sprite
		Pos = (0.25, 0.1)
		scale = (1.0, 1.0)
		width = 0.2
		height = 5.0
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare_add
		angle = 1.58825
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = scaleY
				scaleMod = 0.2
				responseFunc = cosTime
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.0
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
		type = sprite
		Pos = (0.35000002, 0.3)
		scale = (1.0, 1.0)
		width = 0.2
		height = 4.0
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare_add
		angle = 1.5708001
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = scaleY
				scaleMod = 0.3
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
		type = sprite
		Pos = (0.65000004, 0.4)
		scale = (1.0, 1.0)
		width = 0.2
		height = 4.0
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare_add
		angle = 1.5708001
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = scaleY
				scaleMod = 0.2
				responseFunc = cosTime
			}
		]
	}
	{
		type = sprite
		Pos = (0.15, 0.5)
		scale = (1.0, 1.0)
		width = 0.4
		height = 6.0
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare_add
		angle = 1.5708001
		angularVel = 0.0
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.3, 0.7)
		scale = (1.0, 1.0)
		width = 1.0
		height = 0.1
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare_add
		angle = 0.0
		angularVel = 0.0
		controls = [
		]
	}
]
