tb_global_spark_anim_1 = [
	{
		type = sprite
		pos = (0.5, 0.4)
		width = 0.25
		height = 0.25
		color = [
			255
			213
			138
			255
		]
		material = tb_mat_spark_animated_add
		controls = [
			{
				type = beaton
				response = angularvelmod
				scalemod = 1.3
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		length = 0.05
		innerradius = 0.05
		outerradius = 0.25
		tracelength = 64
		color = [
			255
			213
			138
			255
		]
		material = tb_mat_spark_animated_add
		thickness = 200.0
		angularvel = 3.4906602
	}
	{
		type = hypotrochoid
		pos = (0.25, 0.5, 0.0)
		scale = (-1.0, -1.0)
		length = 0.0005
		innerradius = 0.05
		outerradius = 0.25
		tracelength = 64
		color = [
			255
			213
			138
			255
		]
		material = tb_mat_spark_animated_add
		thickness = 200.0
		angularvel = 3.4906602
	}
	{
		type = hypotrochoid
		pos = (0.75, 0.4, 0.0)
		scale = (1.0, -1.0)
		length = 0.0005
		innerradius = 0.05
		outerradius = 0.25
		tracelength = 64
		color = [
			255
			213
			138
			255
		]
		material = tb_mat_spark_animated_add
		thickness = 200.0
		angularvel = 3.4906602
	}
	{
		type = sprite
		pos = (0.5, 0.7)
		width = 0.25
		height = 0.25
		color = [
			255
			213
			138
			255
		]
		material = tb_mat_spark_animated_add
		angle = 0.315905
		controls = [
			{
				type = beaton
				response = angularvelmod
				scalemod = 1.3
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.8, 0.6)
		width = 0.25
		height = 0.25
		color = [
			255
			213
			138
			255
		]
		material = tb_mat_spark_animated_add
		angle = 0.321141
		controls = [
			{
				type = beaton
				response = angularvelmod
				scalemod = 1.3
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.65000004, 0.7, 0.0)
		scale = (-1.0, 1.0)
		length = 0.0005
		innerradius = 0.05
		outerradius = 0.25
		tracelength = 64
		color = [
			255
			213
			138
			255
		]
		material = tb_mat_spark_animated_add
		thickness = 200.0
		angularvel = 3.4906602
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.899, 0.899)
		color = [
			255
			255
			255
			254
		]
		blendmode = blend_alphadiffuse
		controls = [
			{
				type = beaton
				response = brightnessmodulation
				scalemod = -0.1
				responsefunc = costime
				fade = 0.2
			}
		]
	}
]
