TB_UI_Mainmenu_Pause_A = {
	bloom_Params = {
		on = 1
		fullScreen = 1
		materialFilter = 0
		subtract = [
			0
			0
			0
			0
		]
		colormodulate = [
			0.8
			0.8
			0.8
			0.5
		]
		saturaion = 1.0
	}
	primitives = [
		{
			type = blendPrev
			offset = (-0.02, 0.0)
			scale = (0.9, 0.9)
			Color = [
				66
				66
				66
				255
			]
			angle = 0.0
			angularVel = 0.0
			BlendMode = blend
			controls = [
				{
					type = constant
					response = brightnessModulation
					scaleMod = 0.2
					responseFunc = sinTime
					timeRate = 1.0472
				}
				{
					type = constant
					response = blueModulation
					scaleMod = 0.2
					responseFunc = sinTime
					timeRate = 1.0472
				}
				{
					type = constant
					response = redModulation
					scaleMod = 0.2
					responseFunc = sinTime
					timeRate = 1.0472
				}
			]
		}
		{
			type = sprite
			Pos = (0.5, 0.45000002)
			scale = (0.3, 0.3)
			width = 1.3
			height = 1.3
			Color = [
				213
				0
				127
				255
			]
			material = TB_Mat_Mainstar1_Blend
			angle = 0.0
			angularVel = -2.0944
			controls = [
				{
					type = constant
					response = scaleXY
					scaleMod = -0.02
					responseFunc = cosTimeScaleRate
					timeRate = 3.1415896
				}
			]
		}
		{
			type = sprite
			Pos = (0.54, 0.6)
			scale = (0.3, 0.3)
			width = 1.4
			height = 1.4
			Color = [
				0
				127
				213
				255
			]
			material = TB_Mat_Mainstar2_Blend
			angle = 0
			angularVel = -3.1415896
			controls = [
				{
					type = constant
					response = scaleXY
					scaleMod = 0.03
					responseFunc = sinTimeScaleRate
					timeRate = 6.28319
				}
			]
		}
		{
			type = sprite
			Pos = (0.54, 0.6)
			scale = (1.0, 1.0)
			width = 0.4
			height = 0.4
			Color = [
				255
				255
				255
				0
			]
			material = OG_Mat_Sphere_Add
			angle = 0
			angularVel = 0
			controls = [
				{
					type = constant
					response = alphaModulation
					scaleMod = 1.0
					responseFunc = sinTime
					timeRate = 0.78539795
				}
			]
		}
		{
			type = hypotrochoid
			Pos = (0.5, 0.45000002, 0.0)
			scale = (1.0, 1.0)
			length = 0.0005
			InnerRadius = 0.25
			outerRadius = 0.0
			Color = [
				112
				0
				255
				255
			]
			material = OG_Mat_Sphere_Bright
			thickness = 240.0
			angularVel = 1.0472
			controls = [
				{
					type = constant
					response = hueModulation
					scaleMod = 0.2
					responseFunc = sinTime
					timeRate = 1.0472
				}
			]
		}
		{
			type = hypotrochoid
			Pos = (0.54, 0.6, 0.0)
			scale = (1.0, 1.0)
			length = 0.0005
			InnerRadius = 0.25
			outerRadius = 0.0
			Color = [
				112
				0
				255
				255
			]
			material = OG_Mat_Sphere_Bright
			thickness = 360.0
			angularVel = 3.1415896
			controls = [
				{
					type = constant
					response = hueModulation
					scaleMod = 0.2
					responseFunc = sinTime
					timeRate = 1.0472
				}
			]
		}
		{
			type = hypotrochoid
			Pos = (0.5, 0.45000002, 0.0)
			scale = (1.0, 1.0)
			length = 0.0005
			InnerRadius = 0.3
			outerRadius = 0.0
			Color = [
				112
				0
				255
				255
			]
			material = OG_Mat_Sphere_Bright
			thickness = 360.0
			angularVel = 2.0944
			controls = [
				{
					type = constant
					response = hueModulation
					scaleMod = 0.2
					responseFunc = sinTime
					timeRate = 1.0472
				}
			]
		}
		{
			type = hypotrochoid
			Pos = (0.54, 0.6, 0.0)
			scale = (1.0, 1.0)
			length = 0.0005
			InnerRadius = 0.25
			outerRadius = 0.0
			Color = [
				112
				0
				255
				255
			]
			material = OG_Mat_Sphere_Bright
			thickness = 480.0
			angularVel = 4.18879
			controls = [
				{
					type = constant
					response = hueModulation
					scaleMod = 0.2
					responseFunc = sinTime
					timeRate = 1.0472
				}
			]
		}
		{
			type = sprite
			Pos = (0.0, -0.03)
			scale = (1.0, 1.0)
			width = 12.0
			height = 1.5
			Color = [
				255
				255
				255
				255
			]
			material = OG_Mat_flare_sub
			angle = 0.0
			angularVel = 0
		}
		{
			type = sprite
			Pos = (1.2, 0.1)
			scale = (1.0, 1.0)
			width = 2.0
			height = 4.0
			Color = [
				255
				255
				255
				255
			]
			material = OG_Mat_flare_sub
			angle = 0
			angularVel = 0
		}
		{
			type = sprite
			Pos = (1.2, 0.1)
			scale = (1.0, 1.0)
			width = 2.0
			height = 4.0
			Color = [
				255
				255
				255
				255
			]
			material = OG_Mat_flare_sub
			angle = 0
			angularVel = 0
		}
	]
}
