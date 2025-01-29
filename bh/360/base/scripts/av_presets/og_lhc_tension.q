OG_LHC_Tension = [
	{
		type = sprite
		Pos = (0.5, 0.25)
		scale = (0.5, 0.5)
		width = 0.5
		height = 0.125
		Color = [
			255
			28
			28
			255
		]
		material = OG_Mat_Equation_01
		BlendMode = blend
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.75
				responseFunc = sinTime
				timeRate = 0.872665
			}
			{
				type = constant
				response = angleMod
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 0.872665
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 0.523599
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 1.5708001
			}
			{
				type = constant
				response = scaleX
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 1.5708001
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = -1.0
				fade = 0.3
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			253
			249
			255
			127
		]
		angle = 0.0
		angularVel = 0.0
		BlendMode = blend
		controls = [
			{
				type = constant
				response = scaleX
				scaleMod = 0.006
				responseFunc = sinTime
				timeRate = 3.1415896
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.006
				responseFunc = sinTime
				timeRate = 3.1415896
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.025
				responseFunc = sinTime
				timeRate = 0.523599
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.025
				responseFunc = cosTime
				timeRate = 0.523599
			}
		]
	}
	{
		type = circle
		Pos = (0.25, 0.5, 0.0)
		radius = 0.001
		Color = [
			93
			248
			130
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = beatOn
				response = radiusScale
				scaleMod = 0.258
				fade = 0.5
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				fade = 0.5
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.125
		Color = [
			42
			64
			29
			255
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.4
				responseFunc = sinTime
				timeRate = 1.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.25)
		scale = (0.5, 0.5)
		width = 1.0
		height = 0.125
		Color = [
			255
			97
			28
			255
		]
		material = OG_Mat_Equation_02
		BlendMode = blend
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.75
				responseFunc = cosTime
				timeRate = 0.43633202
			}
			{
				type = constant
				response = angleMod
				scaleMod = 0.5
				responseFunc = cosTime
				timeRate = 0.43633202
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.25
				responseFunc = cosTime
				timeRate = 0.95993096
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.25
				responseFunc = cosTime
				timeRate = 1.5708001
			}
			{
				type = constant
				response = scaleX
				scaleMod = 0.25
				responseFunc = cosTime
				timeRate = 1.5708001
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = -1.0
				fade = 0.3
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 2.0
		Color = [
			169
			255
			99
			51
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 1.0472
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.5
				responseFunc = cosTime
				timeRate = 0.43633202
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.5
				responseFunc = cosTime
				timeRate = 0.95993096
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 2.0
		Color = [
			169
			255
			99
			124
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 1.0472
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.5
				responseFunc = cosTime
				timeRate = 0.523599
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.5
				responseFunc = cosTime
				timeOffset = 1.5708001
				timeRate = 0.69813204
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.25)
		scale = (0.5, 0.5)
		width = 0.5
		height = 0.125
		Color = [
			255
			28
			87
			255
		]
		material = OG_Mat_Equation_03
		BlendMode = blend
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.75
				responseFunc = sinTime
				timeRate = 0.26179898
			}
			{
				type = constant
				response = angleMod
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 0.26179898
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 0.17453298
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 0.43633202
			}
			{
				type = constant
				response = scaleX
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 0.43633202
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = -0.8
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.25)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		Color = [
			255
			28
			87
			255
		]
		material = OG_Mat_Equation_01
		BlendMode = blend
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.75
				responseFunc = sinTime
				timeOffset = 1.5708001
				timeRate = 0.872665
			}
			{
				type = constant
				response = angleMod
				scaleMod = 0.5
				responseFunc = sinTime
				timeOffset = 1.5708001
				timeRate = 0.872665
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 0.523599
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 1.5708001
			}
			{
				type = constant
				response = scaleX
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 1.5708001
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = -1.0
				fade = 0.3
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.25)
		scale = (1.0, 1.0)
		width = 1.0
		height = 0.125
		Color = [
			255
			48
			28
			255
		]
		material = OG_Mat_Equation_02
		BlendMode = blend
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.5
				responseFunc = cosTime
				timeOffset = 3.1415896
				timeRate = 0.43633202
			}
			{
				type = constant
				response = angleMod
				scaleMod = 0.5
				responseFunc = cosTime
				timeOffset = 3.1415896
				timeRate = 0.43633202
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.3
				responseFunc = sinTime
				timeRate = 0.95993096
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.25
				responseFunc = cosTime
				timeRate = 1.5708001
			}
			{
				type = constant
				response = scaleX
				scaleMod = 0.25
				responseFunc = cosTime
				timeRate = 1.5708001
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = -1.0
				fade = 0.3
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.25)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		Color = [
			255
			155
			28
			255
		]
		material = OG_Mat_Equation_03
		BlendMode = blend
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.75
				responseFunc = sinTime
				timeOffset = 4.71239
				timeRate = 0.26179898
			}
			{
				type = constant
				response = angleMod
				scaleMod = 0.5
				responseFunc = sinTime
				timeOffset = 4.71239
				timeRate = 0.26179898
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.3
				responseFunc = sinTime
				timeRate = 0.20944001
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 0.43633202
			}
			{
				type = constant
				response = scaleX
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 0.43633202
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = -0.8
				fade = 0.5
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 2.0
		Color = [
			169
			255
			99
			51
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = -0.64577204
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 0.43633202
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 0.95993096
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 19
		radius = 0.001
		radius2 = 1.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 2.6179898
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 2.0
		Color = [
			169
			255
			99
			51
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 1.0995599
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.5
				responseFunc = cosTime
				timeRate = 0.64577204
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 0.95993096
			}
		]
	}
	{
		type = circle
		Pos = (0.85, 0.5, 0.0)
		radius = 0.1
		Color = [
			93
			248
			130
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = beatOn
				response = radiusScale
				scaleMod = 0.258
				fade = 0.5
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				fade = 0.5
			}
		]
	}
]
