TB_UI_Band_Lobby_4 = [
	{
		type = blendPrev
		offset = (0.0, 0.00425)
		scale = (0.98999995, 1.0006)
		Color = [
			249
			249
			249
			254
		]
		angle = 0.0
		angularVel = 0.0
		BlendMode = diffuse
		controls = [
		]
	}
	{
		type = hypotrochoid
		Pos = (0.4, 0.1, 0.0)
		scale = (1.0, 1.0)
		length = 0.25
		InnerRadius = 0.05
		outerRadius = 0.35000002
		Color = [
			255
			0
			242
			255
		]
		material = OG_Mat_LenzFlare_Add
		thickness = 60.0
		angularVel = 1.7453301
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.4
				responseFunc = cosTime
				timeRate = 10.471999
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.2, 0.0)
		scale = (0.75, 0.75)
		length = 0.25
		InnerRadius = 0.15
		outerRadius = 0.45000002
		Color = [
			255
			0
			242
			255
		]
		material = OG_Mat_LenzFlare_Add
		thickness = 60.0
		angularVel = -1.7453301
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.4
				responseFunc = cosTime
				timeRate = 10.471999
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.6, 0.1, 0.0)
		scale = (0.5, 0.5)
		length = 0.25
		InnerRadius = 0.05
		outerRadius = 0.25
		Color = [
			255
			0
			242
			255
		]
		material = OG_Mat_LenzFlare_Add
		thickness = 60.0
		angularVel = -1.7453301
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.4
				responseFunc = cosTime
				timeRate = 10.471999
			}
		]
	}
]
