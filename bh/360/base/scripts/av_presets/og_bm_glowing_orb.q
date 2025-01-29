OG_BM_Glowing_Orb = [
	{
		type = sprite
		Pos = (0.5, 0.5)
		scale = (1.0, 1.0)
		width = 0.25
		height = 0.1
		Color = [
			61
			58
			42
			255
		]
		material = OG_Mat_Flare_add
		BlendMode = add
		angle = 0
		angularVel = -2.0944
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 2.0
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.5
				responseFunc = cosTime
				timeRate = 2.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.258
		Color = [
			81
			76
			24
			255
		]
		BlendMode = brighten
		thickness = 10.0
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		length = 0.025
		InnerRadius = 0.25
		outerRadius = 0.5
		Color = [
			123
			115
			87
			255
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		thickness = 100.0
		angularVel = 1.7453301
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 13
		radius = 0.25
		radius2 = 1.0
		Color = [
			0
			255
			18
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularVel = 0.872665
	}
	{
		type = blendPrev
		offset = (-0.0004, -0.0006)
		scale = (0.99499995, 0.99499995)
		Color = [
			255
			251
			253
			242
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			28
			23
			15
			255
		]
		material = OG_Mat_Sphere_Sub
		BlendMode = blend
		angle = 0
		angularVel = 0.17453298
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = -0.52
		height = -0.52
		Color = [
			30
			40
			22
			63
		]
		material = OG_Mat_Sphere_B_Add
		BlendMode = blend
		angle = 0
		angularVel = -0.349066
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.51
		height = 0.51
		Color = [
			40
			34
			34
			127
		]
		material = OG_Mat_Sphere_Add
		BlendMode = blend
		angle = 0
		angularVel = 0.523599
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.55
		height = 0.55
		Color = [
			101
			61
			0
			31
		]
		material = OG_Mat_Sphere_Blend
		BlendMode = blend
		angle = 0
		angularVel = 0.523599
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (0.75, 0.75)
		width = 0.4
		height = 0.5
		Color = [
			73
			73
			73
			0
		]
		material = OG_Mat_BM_01_blend
		BlendMode = blend
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = alphaModulation
				scaleMod = 2.0
				responseFunc = sinTime
				timeRate = 0.25
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 0.25
			}
			{
				type = constant
				response = scaleX
				scaleMod = 0.25
				responseFunc = sinTime
				timeRate = 0.25
			}
		]
	}
	{
		type = sprite
		Pos = (0.35000002, 0.45000002)
		scale = (0.5, 0.5)
		width = 0.55
		height = 0.5
		Color = [
			64
			64
			63
			0
		]
		material = OG_Mat_BM_02_blend
		BlendMode = blend
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = alphaModulation
				scaleMod = 0.8
				responseFunc = sinTime
				timeOffset = 1.5707
				timeRate = 0.25
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.35000002
				responseFunc = sinTime
				timeOffset = 1.5707
				timeRate = 0.25
			}
			{
				type = constant
				response = scaleX
				scaleMod = 0.35000002
				responseFunc = sinTime
				timeOffset = 1.5707
				timeRate = 0.25
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5)
		scale = (0.5, 0.5)
		width = 0.55
		height = 0.5
		Color = [
			44
			44
			44
			0
		]
		material = OG_Mat_BM_03
		BlendMode = blend
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = alphaModulation
				scaleMod = 0.5
				responseFunc = sinTime
				timeOffset = 3.1399999
				timeRate = 0.25
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.5
				responseFunc = sinTime
				timeOffset = 3.1399999
				timeRate = 0.25
			}
			{
				type = constant
				response = scaleX
				scaleMod = 0.5
				responseFunc = sinTime
				timeOffset = 3.1399999
				timeRate = 0.25
			}
		]
	}
	{
		type = sprite
		Pos = (0.4, 0.55)
		scale = (0.5, 0.5)
		width = 0.35000002
		height = 0.5
		Color = [
			64
			51
			24
			0
		]
		material = OG_Mat_BM_04
		BlendMode = blend
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = alphaModulation
				scaleMod = 0.25
				responseFunc = sinTime
				timeOffset = 4.7121
				timeRate = 0.25
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.25
				responseFunc = sinTime
				timeOffset = 4.7121
				timeRate = 0.25
			}
			{
				type = constant
				response = scaleX
				scaleMod = 0.25
				responseFunc = sinTime
				timeOffset = 4.7121
				timeRate = 0.25
			}
		]
	}
]
