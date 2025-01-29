OG_Fog_Field = [
	{
		type = blendPrev
		offset = (0.0, -0.01)
		scale = (0.98999995, 0.98999995)
		Color = [
			136
			151
			161
			254
		]
		angle = 0.0174533
		angularVel = 0
		BlendMode = blend
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.9, 0.9)
		Color = [
			255
			255
			255
			47
		]
		angle = 0.17453298
		angularVel = 0.0
		BlendMode = subtract
	}
	{
		type = sprite
		Pos = (0.2, 0.2)
		scale = (8.0, 0.3)
		width = 0.5
		height = 0.5
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare_add
		angle = -0.33161303
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = scaleY
				scaleMod = 0.01
				responseFunc = sinTime
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.1)
		scale = (6.0, 0.2)
		width = 0.5
		height = 0.5
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare_add
		angle = 0.0
		angularVel = 0.122173004
		controls = [
			{
				type = constant
				response = scaleY
				scaleMod = 0.01
				responseFunc = cosTime
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.025
				responseFunc = sinTime
				timeRate = 0.523599
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
		Pos = (0.6, 0.4)
		scale = (5.0, 0.2)
		width = 0.5
		height = 0.5
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare_add
		angle = 0.0
		angularVel = -0.0872665
		controls = [
			{
				type = constant
				response = scaleY
				scaleMod = 0.01
				responseFunc = sinTime
			}
			{
				type = constant
				response = redModulation
				scaleMod = 0.1
				responseFunc = sinTime
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.025
				responseFunc = sinTime
				timeOffset = 0.0872665
				timeRate = 0.296706
			}
		]
	}
	{
		type = sprite
		Pos = (0.3, 0.5)
		scale = (9.0, 0.4)
		width = 0.5
		height = 0.5
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare_add
		angle = 0.0
		angularVel = 0.052359905
		controls = [
			{
				type = constant
				response = scaleY
				scaleMod = 0.01
				responseFunc = cosTime
			}
		]
	}
	{
		type = sprite
		Pos = (0.8, 0.7)
		scale = (10.0, 0.5)
		width = 0.5
		height = 0.5
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare_add
		angle = 0.0
		angularVel = 0.052359905
		controls = [
			{
				type = constant
				response = offsetY
				scaleMod = 0.025
				responseFunc = sinTime
				timeRate = 0.523599
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.9)
		scale = (9.0, 0.4)
		width = 0.5
		height = 0.5
		Color = [
			79
			79
			79
			255
		]
		material = OG_Mat_Flare_add
		angle = 0.0
		angularVel = -0.0698132
		controls = [
			{
				type = constant
				response = offsetY
				scaleMod = 0.025
				responseFunc = sinTime
				timeOffset = 0.0872665
				timeRate = 0.296706
			}
		]
	}
]
