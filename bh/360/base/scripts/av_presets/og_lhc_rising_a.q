OG_LHC_Rising_A = [
	{
		type = blendPrev
		offset = (-0.0004, -0.0006)
		scale = (0.99499995, 0.99499995)
		Color = [
			255
			253
			251
			244
		]
		angle = 0.0021816602
		angularVel = 0
		BlendMode = add
	}
	{
		type = sprite
		Pos = (0.5, 0.5)
		scale = (1.0, 1.0)
		width = 0.125
		height = 0.3
		Color = [
			103
			108
			149
			255
		]
		material = OG_Mat_Flare_add
		BlendMode = add
		angle = 0
		angularVel = 6.28319
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.3
				responseFunc = sinTime
				timeRate = 20.0
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.6
				responseFunc = cosTime
				timeRate = 20.0
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.5
				responseFunc = sinTime
			}
			{
				type = constant
				response = scaleX
				scaleMod = 0.5
				responseFunc = sinTime
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.0125
		InnerRadius = 0.25
		outerRadius = 0.48000002
		Color = [
			123
			115
			87
			255
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		thickness = 150.0
		angularVel = 17.453299
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 13
		radius = 0.0
		radius2 = 1.0
		Color = [
			15
			15
			15
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0.872665
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.6
		height = 0.6
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
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.3
		Color = [
			81
			48
			24
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
		length = 0.0125
		InnerRadius = 0.25
		outerRadius = 0.48000002
		Color = [
			123
			115
			87
			255
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		thickness = 140.0
		angularVel = -17.453299
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		Color = [
			112
			112
			112
			0
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		angle = 0
		angularVel = 0.523599
		controls = [
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 10.0
				fade = 0.1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.2
		Color = [
			202
			120
			60
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularVel = 18.849602
		controls = [
			{
				type = beatOn
				response = radiusScale
				scaleMod = 0.1
				fade = 0.1
			}
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				spectrumBand = 10
			}
		]
	}
]
