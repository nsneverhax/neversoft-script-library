av_test_profile = {
	avpreset = [
		$og_bluephoenix
		$og_notehitcircles_a
	]
	fxparam = $default_tod_manager
}

script og_add_visualizer 
	if screenfx_fxinstanceexists \{viewport = bg_viewport
			name = avfx01}
		screenfx_clearfxinstances \{viewport = bg_viewport}
	endif
	wait \{1
		frame}
	screenfx_addfxinstance \{viewport = bg_viewport
		name = avfx01
		scefname = avfx01
		type = audiovisualize
		on = 1
		primitives = $og_frequency_clouds_c}
	screenfx_addfxinstance \{viewport = bg_viewport
		name = avfx_bloom01
		scefname = avfx_bloom01
		type = bloom2
		on = 1
		materialfilter = 0
		fullscreen = 1
		subtract = [
			0
			0
			0
			0
		]
		colormodulate = [
			2.0
			2.0
			2.0
			1.0
		]
		saturation = 1.0
		equation = eq2}
endscript

script og_remove_visualizer 
	screenfx_fxinstanceexists \{viewport = bg_viewport
		name = avfx01}
	screenfx_clearfxinstances \{viewport = bg_viewport}
endscript
og_tunnelizertoo = [
	{
		type = blendprev
		angularvel = 0.1
		scale = (-1.1, -1.1)
		color = [
			254
			254
			254
			250
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.2, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.01
		scale = (1.01, 1.01)
		color = [
			254
			154
			54
			20
		]
		blendmode = add
	}
]
og_tunnelizer = [
	{
		type = blendprev
		angularvel = 0.1
		scale = (-1.0, -1.0)
		offset = (0.01, 0.01)
		color = [
			254
			254
			254
			250
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.2, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.01, 0.97999996)
		color = [
			80
			80
			80
			25
		]
		blendmode = add
	}
]
og_testbed = [
	{
		type = blendprev
		angularvel = 0.1
		scale = (-1.0, -1.0)
		offset = (0.0, -0.02)
		color = [
			254
			154
			54
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				type = frequency_history
				spectrumband = 2
				response = offsety
				scalemod = 1
			}
			{
				type = frequency
				spectrumband = 5
				response = scalex
				respounsefunc = sinlog10
				scalemod = -5
			}
		]
	}
	{
		type = line
		pos = (0.35000002, 0.5, 0.0)
		color = [
			50
			50
			200
			155
		]
		angle = 0
		length = -0.5
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 5000
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_bird = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.0, 1.0)
		offset = (0.0, -0.019499999)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		nonuniformscale
		controls = [
			{
				type = frequency_history
				spectrumband = 50
				response = offsety
				scalemod = 1
			}
			{
				type = frequency
				spectrumband = 5
				response = scalex
				respounsefunc = sinlog10
				scalemod = -0.5
			}
		]
	}
	{
		type = line
		pos = (0.35000002, 0.5, 0.0)
		color = [
			50
			50
			200
			155
		]
		angle = 0
		length = -0.5
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				spectrumband = 5
				response = deform
				deformscale = 5000
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0
		angle = -0.11
		scale = (1.0, 1.0)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			100
		]
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = 80
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		angle = 1
		scale = (0.90999997, 1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			160
		]
		blendmode = sub
	}
]
og_slinky = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.0, 1.0)
		offset = (0.0, -0.0075000003)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = add
		nonuniformscale
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				type = frequency_history
				spectrumband = 5
				response = offsety
				scalemod = 0.5
			}
			{
				type = frequency
				spectrumband = 5
				response = scalex
				scalemod = -0.5
			}
		]
	}
	{
		type = circle
		pos = (0.25, 0.5, 0.0)
		color = [
			200
			100
			50
			100
		]
		radius = 0.1
		blendmode = add
		thickness = 5
		controls = [
			{
				type = frequency_history
				response = radiusscale
				spectrumband = 16
				responsefunc = log10
				radiusscalemod = 0.1
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = -0.5
		thickness = 3
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				spectrumband = 5
				response = deform
				deformscale = 5000
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98999995, -1.1)
		offset = (0.002, 0.0)
		color = [
			254
			254
			254
			254
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (0.3, 0.5, 0.0)
		radius = 0.016499998
		color = [
			90
			0
			120
			250
		]
		thickness = 30
		angularvel = 0.1
		controls = [
			{
				type = notehit
				player = 1
				spectrumband = 10
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				spectrumband = 20
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 30
			}
		]
	}
	{
		type = circle
		pos = (0.7, 0.5, 0.0)
		radius = 0.016499998
		color = [
			90
			0
			0
			250
		]
		thickness = 30
		controls = [
			{
				type = notehit
				player = 2
				spectrumband = 20
				response = redmodulation
				colorscale = 1
			}
			{
				type = notehit
				player = 2
				spectrumband = 30
				response = greenmodulation
				colorscale = 1
			}
			{
				type = notehit
				player = 2
				spectrumband = 10
				response = bluemodulation
				colorscale = 1
			}
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 30
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.9, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		color = [
			200
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.9, 1.9)
		offset = (0.002, 0.0)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_spectrum3d_half = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.0, 1.0)
		offset = (0.0, -0.0075000003)
		color = [
			254
			254
			254
			250
		]
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.8, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 15.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 56
				response = lengthscale
				lengthscalemod = 200
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = -0.5
		thickness = 5
		angularvel = 0
		angle = 1.5707
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 1000
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.95, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 0.95
		thickness = 3
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 5000
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0
		angle = 1
		scale = (1.0, 1.0)
		offset = (0.0, 0.01)
		color = [
			254
			254
			254
			100
		]
		blendmode = add
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_strobeybusiness = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.0, 1.0)
		offset = (0.0, -0.0075000003)
		color = [
			254
			254
			254
			250
		]
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.8, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 15.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 56
				response = lengthscale
				lengthscalemod = 200
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = -0.5
		thickness = 5
		angularvel = 0
		angle = 1.5707
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 1000
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.95, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 0.95
		thickness = 3
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 5000
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0
		angle = 1
		scale = (1.0, 1.0)
		offset = (0.0, 0.01)
		color = [
			254
			254
			254
			100
		]
		blendmode = add
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_risinglandscape = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.0, 1.0)
		offset = (0.0, -0.0075000003)
		color = [
			254
			254
			254
			250
		]
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.8, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 15.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 56
				response = lengthscale
				lengthscalemod = 200
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = -0.5
		thickness = 5
		angularvel = 0
		angle = 1.5707
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 1000
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.95, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 0.95
		thickness = 3
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 5000
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0
		angle = 1
		scale = (1.0, 1.0)
		offset = (0.0, 0.01)
		color = [
			254
			254
			254
			6
		]
		blendmode = add
	}
]
og_fullrotationamped = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.0199)
		offset = (0.0125, 0.0)
		color = [
			254
			254
			254
			254
		]
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 3500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = -1.1
		angle = 1
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_fullrotation = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.1, 1.0)
		offset = (0.025, 0.0)
		color = [
			254
			254
			254
			254
		]
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 3500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = -1.1
		angle = 1
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_spintowin = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.1, -1.0)
		offset = (0.025, 0.0)
		color = [
			254
			254
			254
			254
		]
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 3500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = -1.1
		angle = 1
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_scarfmangle = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.1, -1.0)
		offset = (0.025, 0.0)
		color = [
			254
			254
			254
			254
		]
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 3500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		angle = 1
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_rightdominant = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.1, -1.0)
		offset = (0.025, 0.0)
		color = [
			254
			254
			254
			254
		]
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 3500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_colorsucker = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.0, 1.0)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (0.0, 1.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 0
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = frequency_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			50
			30
			20
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 1.5707
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 3500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.0, 0.01)
		color = [
			204
			154
			254
			75
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			105
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_colorsucker_h = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, -1.0)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 3500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_scarfturn = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.01, -1.01)
		offset = (0.0125, 0.0125)
		color = [
			254
			254
			254
			255
		]
		angle = 3
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 3500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_scarfsymspin = [
	{
		type = blendprev
		angularvel = 0.1
		scale = (-1.01, -1.01)
		offset = (0.0125, 0.0125)
		color = [
			254
			254
			254
			255
		]
		angle = 1
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 3500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_scarfradial = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.01, -1.01)
		offset = (0.0125, 0.0125)
		color = [
			254
			254
			254
			255
		]
		angle = 1
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 3500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_scarfsym = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.01, -1.01)
		offset = (0.0125, 0.0125)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 3500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_scarf = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.01, 1.01)
		offset = (0.0125, 0.0125)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 3500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_basin = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.01, 1.05)
		offset = (0.0125, 0.01)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 1500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_gold = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.01, -1.05)
		offset = (0.0125, 0.0)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 1500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_roybflip_out = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.01, -1.05)
		offset = (0.0, 0.0012500001)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				fade = 0.1
				scalemod = 1
			}
		]
	}
	{
		type = line
		pos = (0.125, 0.0, 0.0)
		color = [
			200
			50
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 50
		angularvel = 0.0
		controls = [
			{
				type = beaton
				fade = 0.1
				spectrumband = 10
				response = bluemodulation
				colorscale = 250
			}
			{
				type = beaton
				spectrumband = 25
				response = redmodulation
				colorscale = 50
			}
			{
				type = beaton
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.85, 0.0)
		color = [
			100
			0
			0
			155
		]
		angle = 1.5707
		length = 1
		thickness = 100
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 600
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		pos = (0.255, 0.95, 0.0)
		color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = -2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.255, 0.05, 0.0)
		color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		color = [
			0
			50
			200
			195
		]
		angle = 1.5707
		length = 0.5
		thickness = 10
		angularvel = 0.0
		blendmode = sub
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.95, 0.0)
		color = [
			0
			50
			200
			195
		]
		angle = -1.5707
		length = 0.5
		thickness = 10
		angularvel = 0.0
		blendmode = sub
		controls = [
			{
				type = frequency
				response = deform
				deformscale = -2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_roybflip = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.01, -1.025)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (0.125, 0.0, 0.0)
		color = [
			200
			50
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 50
		angularvel = 0.0
		controls = [
			{
				type = beaton
				fade = 0.1
				spectrumband = 10
				response = bluemodulation
				colorscale = 250
			}
			{
				type = beaton
				spectrumband = 25
				response = redmodulation
				colorscale = 50
			}
			{
				type = beaton
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.85, 0.0)
		color = [
			100
			0
			0
			155
		]
		angle = 1.5707
		length = 1
		thickness = 100
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 600
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		pos = (0.255, 0.95, 0.0)
		color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = -2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.255, 0.05, 0.0)
		color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		color = [
			0
			50
			200
			95
		]
		angle = 1.5707
		length = 0.5
		thickness = 3
		angularvel = 0.0
		blendmode = sub
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.95, 0.0)
		color = [
			0
			50
			200
			95
		]
		angle = -1.5707
		length = 0.5
		thickness = 3
		angularvel = 0.0
		blendmode = sub
		controls = [
			{
				type = frequency
				response = deform
				deformscale = -2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.9, 1.9)
		offset = (0.0, 0.0)
		color = [
			24
			24
			24
			2
		]
		angle = 0
		blendmode = add
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = alphamodulation
				fade = 0.1
				scalemod = 20
			}
		]
	}
]
og_spectrum3d_roybflip_a = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.01, -1.05)
		offset = (0.0, 0.0012500001)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				type = beaton
				spectrumband = 10
				response = alphamodulation
				fade = 0.1
				scalemod = 1
			}
		]
	}
	{
		type = line
		pos = (0.125, 0.0, 0.0)
		color = [
			200
			50
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 50
		angularvel = 0.0
		controls = [
			{
				type = beaton
				fade = 0.1
				spectrumband = 10
				response = bluemodulation
				colorscale = 250
			}
			{
				type = beaton
				spectrumband = 25
				response = redmodulation
				colorscale = 50
			}
			{
				type = beaton
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.85, 0.0)
		color = [
			100
			0
			0
			155
		]
		angle = 1.5707
		length = 1
		thickness = 100
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 600
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		pos = (0.255, 0.95, 0.0)
		color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = -2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.255, 0.05, 0.0)
		color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		color = [
			0
			50
			200
			195
		]
		angle = 1.5707
		length = 0.5
		thickness = 10
		angularvel = 0.0
		blendmode = sub
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.95, 0.0)
		color = [
			0
			50
			200
			195
		]
		angle = -1.5707
		length = 0.5
		thickness = 10
		angularvel = 0.0
		blendmode = sub
		controls = [
			{
				type = frequency
				response = deform
				deformscale = -2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_roybgrid = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-0.95, 1.01)
		offset = (0.0, 0.02)
		color = [
			255
			255
			255
			250
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (0.35000002, 0.01, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			200
			50
			0
			200
		]
		angle = 1.5707
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency_history
				spectrumband = 5
				response = deform
				deformscale = 2000
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 1.5707
		length = -0.6
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_royb = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.01, 1.0)
		offset = (0.0, 0.02)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 0
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		angle = 1.5707
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency_history
				spectrumband = 5
				response = deform
				deformscale = 2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 1.5707
		length = -0.41
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 1000
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_royb_a = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.01, 1.0)
		offset = (0.0, 0.02)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 0
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		angle = 1.5707
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency_history
				spectrumband = 5
				response = deform
				deformscale = 2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 1.5707
		length = -0.41
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 1000
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_roybflip_simple = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.01, 1.05)
		offset = (0.0, 0.0012500001)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				type = beaton
				spectrumband = 10
				response = alphamodulation
				fade = 0.1
				scalemod = 1
			}
		]
	}
	{
		type = line
		pos = (0.05, 0.5, 0.0)
		color = [
			200
			100
			0
			255
		]
		angle = 1.5707
		length = 0.05
		thickness = 20
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = beaton
				fade = 0.01
				spectrumband = 5
				response = bluemodulation
				colorscale = 250
			}
			{
				type = beaton
				fade = 0.01
				spectrumband = 25
				response = redmodulation
				colorscale = 50
			}
			{
				type = frequency
				spectrumband = 5
				response = lengthscale
				scalemod = 30
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.85, 0.0)
		color = [
			100
			0
			0
			155
		]
		angle = 1.5707
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				scalemod = 600
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		pos = (0.255, 0.95, 0.0)
		color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = -2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_roybflip_h = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.01, -1.05)
		offset = (0.0125, 0.0)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 0.75
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 2500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_roybgrid_h = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.01, -1.1)
		offset = (0.0125, 0.0)
		color = [
			254
			254
			254
			255
		]
		angle = 0
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.0, 0.0)
		color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 1500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_pbj = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, -1.0)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			254
		]
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = bluemodulation
				colorscale = -100
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
			{
				type = frequency_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.2, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				type = meandbs_history
				spectrumband = 10
				response = greenmodulation
				colorscale = -90
			}
			{
				type = frequency_history
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.3, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumband = 15
				response = bluemodulation
				colorscale = -130
			}
			{
				type = meandbs_history
				spectrumband = 15
				response = greenmodulation
				colorscale = -150
			}
			{
				type = frequency_history
				spectrumband = 15
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.4, 0.5, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumband = 20
				response = bluemodulation
				colorscale = -70
			}
			{
				type = meandbs_history
				spectrumband = 20
				response = greenmodulation
				colorscale = -100
			}
			{
				type = frequency_history
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumband = 25
				response = bluemodulation
				colorscale = -100
			}
			{
				type = meandbs_history
				spectrumband = 25
				response = greenmodulation
				colorscale = -200
			}
			{
				type = frequency_history
				spectrumband = 25
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.6, 0.5, 0.0)
		color = [
			200
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumband = 30
				response = bluemodulation
				colorscale = -200
			}
			{
				type = meandbs_history
				spectrumband = 30
				response = greenmodulation
				colorscale = -100
			}
			{
				type = frequency_history
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 300
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.9, 0.9)
		offset = (0.02, 0.0)
		color = [
			254
			254
			254
			100
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_spectrum3d_gnr = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, -1.0)
		offset = (0.01, 0.0)
		color = [
			254
			254
			54
			254
		]
		blendmode = blend
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = bluemodulation
				colorscale = -100
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -10
			}
		]
	}
	{
		type = line
		pos = (0.2, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				type = meandbs_history
				spectrumband = 10
				response = greenmodulation
				colorscale = -90
			}
			{
				type = meandbs_history
				spectrumband = 10
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		pos = (0.3, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumband = 15
				response = bluemodulation
				colorscale = -30
			}
			{
				type = meandbs_history
				spectrumband = 15
				response = greenmodulation
				colorscale = -30
			}
			{
				type = meandbs_history
				spectrumband = 15
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.4, 0.5, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumband = 20
				response = bluemodulation
				colorscale = -70
			}
			{
				type = meandbs_history
				spectrumband = 20
				response = greenmodulation
				colorscale = -100
			}
			{
				type = meandbs_history
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumband = 25
				response = bluemodulation
				colorscale = 100
			}
			{
				type = meandbs_history
				spectrumband = 25
				response = greenmodulation
				colorscale = 100
			}
			{
				type = meandbs_history
				spectrumband = 25
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.6, 0.5, 0.0)
		color = [
			200
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = meandbs_history
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = meandbs_history
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.5, 0.0)
		color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.9, 0.9)
		offset = (0.02, 0.0)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_bluerings = [
	{
		type = blendprev
		offset = (0.0, 0.005)
		scale = (0.98999995, 0.98999995)
		color = [
			255
			255
			255
			254
		]
		angle = -0.0
		angularvel = 0.0
		blendmode = blend
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.01
		color = [
			90
			0
			0
			50
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.05
				spectrumband = 30
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.75, 0.0)
		length = 0.001
		color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = lengthscale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.32500002, 0.0)
		radius = 0.015
		color = [
			90
			0
			0
			1
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.05
				spectrumband = 30
			}
			{
				type = frequency
				spectrumband = 10
				response = alphamodulation
				colorscale = 255
			}
		]
	}
	{
		type = line
		pos = (0.3, 0.76, 0.0)
		length = 0.001
		color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = lengthscale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.25, 0.0)
		radius = 0.02
		color = [
			190
			0
			0
			0
		]
		thickness = 3
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.05
				spectrumband = 30
			}
			{
				type = frequency
				spectrumband = 10
				response = alphamodulation
				colorscale = 160
			}
		]
	}
	{
		type = line
		pos = (0.3, 0.77, 0.0)
		length = 0.001
		color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = lengthscale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.32500002, 0.0)
		radius = 0.025
		color = [
			190
			0
			0
			0
		]
		thickness = 3
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
			{
				type = frequency
				spectrumband = 30
				response = alphamodulation
				colorscale = 160
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.03
		color = [
			190
			0
			0
			0
		]
		thickness = 3
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = green
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = green
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = green
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = green
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
			{
				type = frequency
				spectrumband = 30
				response = alphamodulation
				colorscale = 160
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = green
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = green
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = green
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.55, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.65000004, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 42
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.75, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 49
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 0.9)
		color = [
			255
			255
			255
			10
		]
		angle = 0.0
		angularvel = 1
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		color = [
			255
			51
			53
			5
		]
		angle = 0
		angularvel = 1.1
		blendmode = subtract
	}
]
og_singleplayercirclesarcspiral = [
	{
		type = blendprev
		offset = (0.0, 0.005)
		scale = (0.98999995, 0.98999995)
		color = [
			255
			255
			255
			254
		]
		angle = -0.0
		angularvel = 0.0
		blendmode = blend
	}
	{
		type = circle
		pos = (0.1, 0.5, 0.0)
		radius = 0.016499998
		color = [
			90
			0
			0
			50
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 30
				response = alphamodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 1
				spectrumband = 30
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.5, 0.0)
		length = 0.001
		color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = lengthscale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		pos = (0.3, 0.32500002, 0.0)
		radius = 0.016499998
		color = [
			90
			0
			0
			1
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.05
				spectrumband = 30
			}
			{
				type = frequency
				spectrumband = 10
				response = alphamodulation
				colorscale = 255
			}
		]
	}
	{
		type = line
		pos = (0.3, 0.32500002, 0.0)
		length = 0.001
		color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = lengthscale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.25, 0.0)
		radius = 0.016499998
		color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.05
				spectrumband = 30
			}
		]
	}
	{
		type = circle
		pos = (0.7, 0.32500002, 0.0)
		radius = 0.016499998
		color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
		]
	}
	{
		type = circle
		pos = (0.9, 0.5, 0.0)
		radius = 0.016499998
		color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = green
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = ogreen
				response = redmodulation
				colorscale = 280
			}
			{
				type = notehit
				player = 1
				gemcolor = green
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = green
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 1
				spectrumband = 30
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = green
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = green
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = green
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.55, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.65000004, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 42
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.75, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 49
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.85, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 56
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 0.9)
		color = [
			255
			255
			255
			10
		]
		angle = 0.0
		angularvel = 1
		blendmode = add
	}
]
og_singleplayercircles = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		color = [
			255
			255
			255
			254
		]
		angle = -0.0
		angularvel = 0.0
		blendmode = blend
	}
	{
		type = circle
		pos = (0.1, 0.5, 0.0)
		radius = 0.016499998
		color = [
			90
			0
			0
			50
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 30
				response = alphamodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
			{
				type = maxdbs
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.1
				spectrumband = 30
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.5, 0.0)
		length = 0.001
		color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = lengthscale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		pos = (0.3, 0.32500002, 0.0)
		radius = 0.016499998
		color = [
			90
			0
			0
			1
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
			{
				type = frequency
				spectrumband = 10
				response = alphamodulation
				colorscale = 255
			}
		]
	}
	{
		type = line
		pos = (0.3, 0.32500002, 0.0)
		length = 0.001
		color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = yellow
				response = lengthscale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.25, 0.0)
		radius = 0.016499998
		color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
		]
	}
	{
		type = circle
		pos = (0.7, 0.32500002, 0.0)
		radius = 0.016499998
		color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
		]
	}
	{
		type = circle
		pos = (0.9, 0.5, 0.0)
		radius = 0.016499998
		color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = green
				response = bluemodulation
				colorscale = 160
			}
			{
				type = notehit
				player = 1
				gemcolor = ogreen
				response = redmodulation
				colorscale = 180
			}
			{
				type = notehit
				player = 1
				gemcolor = green
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = green
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 1
				spectrumband = 30
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = green
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = green
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = green
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = red
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = blue
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.55, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = bluemodulation
				colorscale = 200
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = greenmodulation
				colorscale = 100
			}
			{
				type = notehit
				player = 1
				gemcolor = orange
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.65000004, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 42
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.75, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 49
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.85, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 56
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.99899995, -4.991)
		color = [
			255
			255
			255
			4
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		color = [
			255
			51
			53
			10
		]
		angle = 1.575
		angularvel = -1
		blendmode = subtract
	}
]
og_purplestar = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			218
			202
			205
			254
		]
		angle = 1.26
		angularvel = 0.0
		blendmode = blend
	}
	{
		type = line
		pos = (0.35000002, 0.5, 0.0)
		length = 0.1
		color = [
			200
			0
			200
			255
		]
		thickness = 10.0
		angularvel = 0.0
		angle = -1.26
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 63
				response = lengthscale
				lengthscalemod = 250
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (5.0, 5.0)
		color = [
			0
			0
			0
			0
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = add
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 150
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumband = 10
				response = alphamodulation
				colorscale = 45
			}
		]
	}
]
og_bluelines = [
	{
		type = blendprev
		offset = (0.0, 0.01)
		scale = (0.98999995, 0.98999995)
		color = [
			218
			202
			205
			254
		]
		angle = 0.015
		angularvel = 0.0
		blendmode = blend
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 63
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 56
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 49
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 42
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.55, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 35
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.65000004, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 28
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.75, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 21
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.85, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 14
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.95, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 7
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0099, -0.99099994)
		color = [
			255
			255
			255
			7
		]
		angle = -0.01
		angularvel = 0.0
		blendmode = add
	}
]
og_energina = [
	{
		type = blendprev
		offset = (0.0, -0.0)
		scale = (-0.99149996, -1.1915001)
		color = [
			218
			202
			205
			254
		]
		angle = -1.8
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 1.5707
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		color = [
			55
			251
			253
			38
		]
		angle = 0.01
		angularvel = -0.23
		blendmode = subtract
	}
]
og_bluewavesstrobe = [
	{
		type = blendprev
		offset = (0.0, -0.0)
		scale = (-0.99149996, -1.1915001)
		color = [
			218
			202
			205
			254
		]
		angle = -1.8
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		color = [
			55
			251
			253
			38
		]
		angularvel = -0.23
		blendmode = subtract
	}
]
og_wavesrotating = [
	{
		type = blendprev
		offset = (0.0, -0.0)
		scale = (-0.99149996, -1.1915001)
		color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularvel = 0.01
		blendmode = blend
		nonuniformscale
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		color = [
			55
			251
			253
			38
		]
		angularvel = -0.23
		blendmode = subtract
	}
]
og_redwavesin = [
	{
		type = blendprev
		offset = (0.0, -0.0)
		scale = (-0.99149996, -1.1915001)
		color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		color = [
			55
			251
			253
			38
		]
		angularvel = -0.23
		blendmode = subtract
	}
]
og_redwaves = [
	{
		type = blendprev
		offset = (0.0, -0.0)
		scale = (-1.15, -1.1915001)
		color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		color = [
			55
			251
			253
			38
		]
		angularvel = -0.23
		blendmode = subtract
	}
]
og_verticalbandsspectrum = [
	{
		type = blendprev
		offset = (0.0, -0.0)
		scale = (-1.15, -1.1915001)
		color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		color = [
			255
			51
			63
			38
		]
		angularvel = -0.23
		blendmode = subtract
	}
]
og_verticalbandsblue = [
	{
		type = blendprev
		offset = (0.0, -0.0)
		scale = (-1.15, -1.1915001)
		color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 1.5707
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		color = [
			255
			51
			63
			38
		]
		angularvel = -0.23
		blendmode = subtract
	}
]
og_colorwave = [
	{
		type = blendprev
		offset = (0.0, -0.0)
		scale = (-1.15, -1.1915001)
		color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.0)
		color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			51
			63
			38
		]
		angularvel = 0.5
		blendmode = subtract
	}
]
og_bluewaves = [
	{
		type = blendprev
		offset = (0.0, -0.0)
		scale = (-1.15, -1.1915001)
		color = [
			218
			252
			255
			254
		]
		angle = 4.8925004
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.0)
		color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			51
			63
			38
		]
		angularvel = 0.5
		blendmode = subtract
	}
]
og_bluetapestry = [
	{
		type = blendprev
		offset = (0.0, -0.0)
		scale = (1.15, -1.1915001)
		color = [
			218
			252
			255
			254
		]
		angle = 4.925
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.0025000002
		color = [
			0
			1
			1
			85
		]
		thickness = 3.0
		controls = [
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 20
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 25
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 50
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.005
		color = [
			0
			2
			2
			85
		]
		thickness = 2.0
		controls = [
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 30
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.0125
		color = [
			0
			3
			3
			85
		]
		thickness = 4.0
		controls = [
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 40
			}
			{
				type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 300
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.0)
		color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			51
			63
			38
		]
		angularvel = 0.5
		blendmode = subtract
	}
]
og_blueelectric = [
	{
		type = blendprev
		offset = (0.0, 0.02)
		scale = (1.015, -1.01)
		color = [
			218
			252
			255
			254
		]
		angularvel = 0.0
		angle = 0.0
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.3, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 300
			}
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 500
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 400
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.7, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 300
			}
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 500
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 400
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		color = [
			255
			255
			255
			25
		]
		angle = 0.0
		angularvel = 0.1
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			51
			63
			38
		]
		angularvel = 0.5
		blendmode = subtract
	}
]
og_latticediagonal = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.01, 1.01)
		color = [
			238
			232
			245
			255
		]
		angle = 0.05
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = 2.0
		color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angle = 0.5707
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 2.0
		color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angle = 0.5707
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		length = 0.01
		color = [
			50
			50
			50
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.7, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.9, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
]
og_hyper = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			228
			222
			235
			254
		]
		angularvel = 0.01
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angle = 1.5707
		angularvel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		length = 0.01
		color = [
			50
			50
			50
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.7, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.9, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (20.0, 2.0)
		color = [
			255
			255
			255
			35
		]
		angularvel = 0.5
		blendmode = subtract
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.1119901, 1.1)
		color = [
			255
			255
			255
			42
		]
		angularvel = 0.01
		blendmode = add
	}
]
og_tiedye = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			228
			222
			235
			254
		]
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angle = 1.5707
		angularvel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		length = 0.01
		color = [
			50
			50
			50
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.7, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.9, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (20.0, 2.0)
		color = [
			255
			255
			255
			35
		]
		angularvel = 0.5
		blendmode = subtract
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.1119901, 1.1)
		color = [
			255
			255
			255
			42
		]
		angularvel = 0.01
		blendmode = add
	}
]
og_bluespiral = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.015, 1.01)
		color = [
			208
			182
			235
			254
		]
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angle = 1.5707
		angularvel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		length = 0.01
		color = [
			50
			50
			50
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.7, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.9, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.2)
		scale = (2.0, 2.0)
		color = [
			255
			255
			255
			35
		]
		angularvel = 0.5
		blendmode = subtract
	}
	{
		type = blendprev
		offset = (0.01, 0.01)
		scale = (1.1119901, 1.1)
		color = [
			255
			255
			255
			42
		]
		angularvel = 0.01
		blendmode = add
	}
]
og_bluecross = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.015, -1.01)
		color = [
			208
			182
			235
			254
		]
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angle = 1.5707
		angularvel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		length = 0.01
		color = [
			50
			50
			50
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.7, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.9, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.2)
		scale = (2.0, 2.0)
		color = [
			255
			255
			255
			35
		]
		angularvel = 0.5
		blendmode = subtract
	}
	{
		type = blendprev
		offset = (0.01, 0.01)
		scale = (1.1119901, -1.1)
		color = [
			255
			255
			255
			42
		]
		angularvel = 0.01
		blendmode = add
	}
]
og_bluephoenix_ii = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.015, -1.01)
		color = [
			208
			182
			235
			254
		]
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.5, 0.0)
		length = 0.01
		color = [
			50
			50
			50
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.3, 0.5, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.7, 0.5, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.9, 0.5, 0.0)
		length = 0.01
		color = [
			100
			80
			20
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.2)
		scale = (2.0, 2.0)
		color = [
			255
			255
			255
			35
		]
		angularvel = 0.5
		blendmode = subtract
	}
	{
		type = blendprev
		offset = (0.01, 0.01)
		scale = (1.1119901, -1.1)
		color = [
			255
			255
			255
			42
		]
		angularvel = 0.01
		blendmode = add
	}
]
og_bluebands = [
	{
		type = blendprev
		offset = (0.0, 0.2)
		scale = (1.15, -1.1915001)
		color = [
			218
			252
			255
			254
		]
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.3, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.7, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.0)
		color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		blendmode = add
	}
]
og_blueoverload = [
	{
		type = blendprev
		offset = (0.0, 0.02)
		scale = (1.015, -1.01)
		color = [
			218
			252
			255
			254
		]
		angularvel = 1.0
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.3, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.7, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (1.0, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		blendmode = add
	}
]
og_blueringsfeedbackwave = [
	{
		type = blendprev
		offset = (0.0, -0.0)
		scale = (1.15, -1.1915001)
		color = [
			218
			252
			255
			254
		]
		angularvel = 0.1
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.0025000002
		color = [
			0
			1
			1
			85
		]
		thickness = 3.0
		controls = [
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 20
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 25
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 50
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.005
		color = [
			0
			2
			2
			85
		]
		thickness = 2.0
		controls = [
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 30
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.0125
		color = [
			0
			3
			3
			85
		]
		thickness = 1.0
		controls = [
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 40
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.0)
		color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			51
			63
			38
		]
		angularvel = 0.5
		blendmode = subtract
	}
]
og_blueringsphasing = [
	{
		type = blendprev
		offset = (0.0, -0.01)
		scale = (3.0, -1.915)
		color = [
			218
			252
			255
			254
		]
		angularvel = 0.1
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.01
		color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.025
		color = [
			0
			1
			1
			85
		]
		thickness = 3.0
		controls = [
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 30
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 25
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 50
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.05
		color = [
			0
			2
			2
			85
		]
		thickness = 2.0
		controls = [
			{
				type = waveform
				response = radiusscale
				radiusscalemod = 0.04
				responsefunc = log10
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.125
		color = [
			0
			3
			3
			85
		]
		thickness = 1.0
		controls = [
			{
				type = waveform
				response = radiusscale
				radiusscalemod = 0.04
				responsefunc = log10
			}
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.1, 1.0)
		color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		blendmode = add
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			255
			51
			63
			238
		]
		angularvel = 0.5
		blendmode = subtract
	}
]
og_spectrum_arches = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.0)
		offset = (0.0, 0.1)
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (0.0, 0.5, 0.0)
		radius = 0.65000004
		color = [
			200
			0
			0
			255
		]
		thickness = 4
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = waveform
				response = deform
				responsefunc = exp
				deformscale = 10.0
			}
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.3
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.05, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		angle = 0
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 6
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 6
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 6
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.15, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 12
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 12
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 12
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 18
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 18
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 18
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.35000002, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 24
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 24
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 24
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.45000002, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.05, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.1, 1.9)
		offset = (0.0, -0.1)
		color = [
			254
			254
			254
			85
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 1
		scale = (0.9, 0.9)
		offset = (0.01, 0.0)
		color = [
			54
			54
			54
			100
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1
			}
		]
	}
]
og_spectrum_exposition_neonchurch = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.0)
		offset = (0.0, 0.1)
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (0.0, 0.5, 0.0)
		radius = 0.65000004
		color = [
			200
			0
			0
			255
		]
		thickness = 4
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.3
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.05, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		angle = 0
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 6
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 6
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 6
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.15, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 12
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 12
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 12
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 18
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 18
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 18
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.35000002, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 24
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 24
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 24
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.45000002, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.05, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.1, 1.9)
		offset = (0.0, -0.1)
		color = [
			254
			254
			254
			85
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 1
		scale = (0.9, 0.9)
		offset = (0.01, 0.0)
		color = [
			54
			54
			54
			80
		]
		blendmode = sub
	}
]
og_spectrum_wash_matrixrain = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.0)
		offset = (0.0, 0.1)
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.05, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		angle = 0
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 6
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 6
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 6
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.15, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 12
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 12
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 12
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 18
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 18
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 18
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.35000002, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 24
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 24
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 24
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.45000002, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.05, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.1, 1.9)
		offset = (0.0, -0.1)
		color = [
			254
			254
			254
			45
		]
		blendmode = add
	}
]
og_spectrum_strobe = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, -1.01)
		offset = (0.1, 0.0)
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.1, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.15, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.25, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.35000002, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.45000002, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.55, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 1
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.25, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.0, -1.1)
		offset = (0.1, 0.0)
		color = [
			254
			254
			254
			125
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, 1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_spectrum_strobeii = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, -1.01)
		offset = (0.1, 0.0)
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.1, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.15, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.25, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.35000002, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.45000002, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.55, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 1
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.25, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.0, -1.1)
		offset = (0.1, 0.0)
		color = [
			254
			254
			254
			125
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.51, 2.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			250
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_spectrumneonflipbright = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.01)
		offset = (0.1, 0.0)
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (0.0, 0.5, 0.0)
		radius = 0.25
		color = [
			0
			0
			0
			255
		]
		thickness = 2
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = waveform
				response = deform
				responsefunc = sinlog10
				deformscale = 100.1
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.05, 0.0)
		color = [
			100
			0
			20
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.15, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.25, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.35000002, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.45000002, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.55, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 1
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.25, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, -1.1)
		offset = (0.1, 0.0)
		color = [
			254
			254
			254
			185
		]
		blendmode = add
	}
]
og_spectrumneonflip = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.01)
		offset = (0.1, 0.0)
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.5
		color = [
			0
			0
			0
			255
		]
		thickness = 2
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				type = beaton
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.03
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.05, 0.0)
		color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.15, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.25, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.35000002, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.45000002, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.6, 1.0, 0.0)
		color = [
			200
			0
			20
			255
		]
		length = 0.1
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.25, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.1)
		offset = (0.1, 0.0)
		color = [
			254
			254
			254
			85
		]
		blendmode = add
	}
]
og_spectrumneon = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.0)
		offset = (0.1, 0.0)
		color = [
			250
			250
			250
			250
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (1.0, 0.5, 0.0)
		radius = 0.5
		color = [
			100
			150
			220
			255
		]
		thickness = 10
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 20
			}
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.03
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.05, 0.0)
		color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.15, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.25, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.35000002, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.1, 0.45000002, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.25, 0.0)
		color = [
			0
			220
			0
			255
		]
		length = 1.5
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.0)
		offset = (0.1, 0.0)
		color = [
			254
			254
			254
			85
		]
		blendmode = add
	}
]
og_spectrumlattice = [
	{
		type = blendprev
		angularvel = -0.1
		scale = (1.0, -1.0)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			254
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.1, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 2
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.2, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 2
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.3, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 2
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.4, 0.5, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 2
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 2
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.6, 0.5, 0.0)
		color = [
			200
			0
			20
			255
		]
		length = 2
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.5
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
	}
]
og_spectrum3d = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, -1.0)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			254
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.1, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.2, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.3, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.4, 0.5, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.6, 0.5, 0.0)
		color = [
			200
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.9, 0.9)
		offset = (0.02, 0.0)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
		controls = [
			{
				type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]

script _spectrumvertical 
endscript
og_spectrumvertical = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, -1.0)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			254
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.1, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.2, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.3, 0.5, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.4, 0.5, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.6, 0.5, 0.0)
		color = [
			200
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.9, 0.9)
		offset = (-0.001, 0.002)
		color = [
			254
			254
			254
			80
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			120
		]
		blendmode = sub
	}
]
og_spectrumredgreen = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, -1.1)
		offset = (0.0, 0.0)
		color = [
			254
			254
			254
			220
		]
		blendmode = blend
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.0)
		offset = (0.01, 0.0)
		color = [
			254
			254
			254
			15
		]
		blendmode = add
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.18, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.26, 0.0)
		color = [
			100
			0
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.34, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.42000002, 0.0)
		color = [
			100
			0
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			200
			0
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			250
			200
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 30.1
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
]
og_electricdye = [
	{
		type = blendprev
		angularvel = 0.51
		scale = (-1.99, -1.05)
		offset = (-0.001, 0.002)
		color = [
			254
			254
			254
			250
		]
		blendmode = blend
	}
	{
		type = circle
		color = [
			250
			0
			0
			255
		]
		pos = (0.5, 0.5, 0.0)
		radius = 0.25
		thickness = 2
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100.0
			}
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 20
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.11, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.120000005, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.13, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.14, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		color = [
			200
			250
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (-0.90999997, -1.01)
		offset = (0.01, 0.01)
		color = [
			254
			254
			254
			250
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.01
		scale = (-1.11, -1.5)
		offset = (-0.001, 0.002)
		color = [
			254
			254
			254
			250
		]
		blendmode = sub
	}
]
og_tronsistors = [
	{
		type = blendprev
		angularvel = 0.01
		scale = (1.02, -1.5)
		offset = (-0.001, -0.001)
		color = [
			254
			254
			254
			250
		]
		blendmode = blend
	}
	{
		type = circle
		color = [
			0
			0
			0
			255
		]
		pos = (0.5, 0.5, 0.0)
		radius = 0.125
		thickness = 2
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 500.0
			}
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 20
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.11, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.120000005, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.13, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.14, 0.0)
		color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		color = [
			200
			250
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
]
og_daftname = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-0.90999997, -1.1)
		offset = (0.01, 0.01)
		color = [
			254
			254
			254
			250
		]
		blendmode = blend
	}
	{
		type = circle
		color = [
			0
			0
			0
			255
		]
		pos = (0.5, 0.5, 0.0)
		radius = 0.125
		thickness = 2
		controls = [
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 20
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.2, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		color = [
			200
			100
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.90999997, 1.01)
		color = [
			254
			154
			54
			20
		]
		blendmode = add
	}
]
og_daftdodger = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-0.90999997, -1.1)
		offset = (0.01, 0.01)
		color = [
			254
			254
			254
			250
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.2, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		color = [
			200
			100
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.90999997, 1.01)
		color = [
			254
			154
			54
			20
		]
		blendmode = add
	}
]
og_daftspectrum = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.1, -1.1)
		offset = (0.01, 0.01)
		color = [
			254
			254
			254
			250
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.2, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		color = [
			200
			100
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.01, 1.01)
		color = [
			254
			154
			54
			20
		]
		blendmode = add
	}
]
og_daftequalizer = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.1, -1.1)
		color = [
			254
			254
			254
			250
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.2, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.0, 0.0)
		color = [
			200
			100
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.01, 1.01)
		color = [
			254
			154
			54
			20
		]
		blendmode = add
	}
]
og_horizontalanalysis = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.1, -1.1)
		color = [
			254
			254
			254
			250
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.1, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.15, 0.0)
		color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.2, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.01, 1.01)
		color = [
			254
			154
			54
			20
		]
		blendmode = add
	}
]
og_grid = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0995, 1.199)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (0.515, 0.5, 0.0)
		radius = 0.321
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.51, 0.5, 0.0)
		radius = 0.421
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.501, 0.51, 0.0)
		radius = 0.5215
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = line
		pos = (0.511, 0.25, 0.0)
		color = [
			100
			0
			250
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 30.1
			}
		]
	}
	{
		type = line
		pos = (0.51199996, 0.125, 0.0)
		color = [
			248
			168
			28
			255
		]
		length = 1
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		type = line
		color = [
			250
			228
			55
			255
		]
		pos = (0.51, 0.5, 0.0)
		length = 0.97999996
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (1.2, 1.09)
		color = [
			80
			70
			40
			35
		]
		blendmode = add
	}
]
og_gridsimple = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0995, 1.199)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = line
		pos = (0.511, 0.5, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 20.1
			}
		]
	}
	{
		type = line
		pos = (0.51199996, 0.5, 0.0)
		color = [
			248
			168
			28
			255
		]
		length = 1
		angularvel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		type = line
		color = [
			250
			228
			55
			255
		]
		pos = (0.51, 0.5, 0.0)
		length = 0.97999996
		angularvel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (1.2, 1.09)
		color = [
			80
			70
			40
			35
		]
		blendmode = add
	}
]
og_rings_of_saturn = [
	{
		type = blendprev
		angularvel = 0.1
		scale = (-0.98999995, 0.98999995)
		color = [
			255
			255
			254
			255
		]
		blendmode = blend
	}
	{
		type = blendprev
		angularvel = 0.05
		scale = (0.9919999, 0.99099994)
		color = [
			5
			5
			5
			255
		]
		blendmode = add
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.05
		color = [
			0
			10
			0
			255
		]
		thickness = 5
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 20
			}
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.03
				spectrumband = 10
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.08
		color = [
			5
			5
			5
			255
		]
		thickness = 3
		controls = [
			{
				type = frequency
				spectrumband = 32
				response = deform
				responsefunc = sinlog10
				deformscale = 50.1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.03
		color = [
			5
			5
			5
			255
		]
		thickness = 10
		controls = [
			{
				type = frequency
				spectrumband = 32
				response = deform
				responsefunc = sinlog10
				deformscale = 50.1
			}
			{
				type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 30
			}
			{
				type = frequency
				spectrumband = 16
				response = greenmodulation
				colorscale = 15
			}
			{
				type = frequency
				spectrumband = 16
				response = bluemodulation
				colorscale = 15
			}
		]
	}
	{
		type = line
		color = [
			0
			0
			0
			255
		]
		pos = (0.5, 0.55, 0.0)
		length = 0.75
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 48
				responsefunc = log10
				deformscale = 20
			}
			{
				type = beaton
				response = bluemodulation
				colorscale = 1
			}
		]
	}
	{
		type = line
		color = [
			250
			0
			0
			255
		]
		pos = (0.5, 0.55, 0.0)
		length = 0.75
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 48
				responsefunc = log10
				deformscale = 10
			}
			{
				type = frequency
				spectrumband = 32
				response = greenmodulation
				colorscale = 200
			}
		]
	}
]
og_gridlock = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98499995, 1.199)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = hypotrochoid
		color = [
			255
			0
			0
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.120000005
		outerradius = 0.16
		innerradius = 0.1
		angularvel = 0.4
		thickness = 1.0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.75
		thickness = 2
		angularvel = 0.024
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = line
		pos = (0.51, 0.5, 0.0)
		color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		type = line
		color = [
			150
			168
			238
			255
		]
		pos = (0.5, 0.51, 0.0)
		length = 0.25
		angularvel = 0.025999999
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.15
		scale = (1.0999, 1.0999)
		color = [
			120
			108
			128
			25
		]
		blendmode = add
	}
]
og_weaverbright = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98499995, 1.199)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = hypotrochoid
		color = [
			255
			0
			0
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.120000005
		outerradius = 0.16
		innerradius = 0.1
		angularvel = 0.4
		thickness = 1.0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.75
		thickness = 2
		angularvel = 0.024
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = line
		pos = (0.51, 0.5, 0.0)
		color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		type = line
		color = [
			150
			168
			238
			255
		]
		pos = (0.5, 0.51, 0.0)
		length = 0.25
		angularvel = 0.025999999
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (1.0999, 0.99899995)
		color = [
			120
			108
			128
			25
		]
		blendmode = add
	}
]
og_weaver = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98499995, 1.199)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = circle
		color = [
			150
			50
			250
			255
		]
		pos = (0.515, 0.5, 0.0)
		radius = 0.21000001
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 10
			}
		]
	}
	{
		type = circle
		color = [
			150
			50
			250
			255
		]
		pos = (0.51, 0.5, 0.0)
		radius = 0.12100001
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = circle
		color = [
			150
			50
			250
			255
		]
		pos = (0.501, 0.51, 0.0)
		radius = 0.25
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 10
			}
		]
	}
	{
		type = hypotrochoid
		color = [
			255
			0
			0
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.120000005
		outerradius = 0.16
		innerradius = 0.1
		angularvel = 4
		thickness = 1.0
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.75
		thickness = 2
		angularvel = 0.024
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = line
		pos = (0.51, 0.5, 0.0)
		color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		type = line
		color = [
			150
			168
			238
			255
		]
		pos = (0.5, 0.51, 0.0)
		length = 1
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (1.0999, 0.99899995)
		color = [
			120
			108
			128
			15
		]
		blendmode = add
	}
]
og_envy = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.97999996, -0.98999995)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = circle
		color = [
			0
			0
			0
			255
		]
		pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				type = beaton
				spectrumband = 8
				response = redmodulation
				colorscale = 200
			}
		]
	}
	{
		type = hypotrochoid
		color = [
			225
			225
			255
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerradius = 0.16
		innerradius = 0.1
		angularvel = 1
		thickness = 5.0
	}
	{
		type = line
		pos = (0.51, 0.5, 0.0)
		color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		type = line
		color = [
			50
			228
			38
			255
		]
		pos = (0.5, 0.51, 0.0)
		length = 0.25
		angularvel = 0.26
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.01
		scale = (0.99899995, 0.99899995)
		color = [
			120
			120
			120
			12
		]
		blendmode = add
	}
]
og_bluephoenix = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.97999996, -0.98999995)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = circle
		color = [
			0
			0
			0
			255
		]
		pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				type = beaton
				spectrumband = 8
				response = redmodulation
				colorscale = 200
			}
			{
				type = waveform
				response = deform
				deformscale = 400.1
			}
		]
	}
	{
		type = hypotrochoid
		color = [
			225
			225
			255
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerradius = 0.16
		innerradius = 0.1
		angularvel = 1
		thickness = 5.0
	}
	{
		type = line
		pos = (0.51, 0.5, 0.0)
		color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		type = line
		color = [
			120
			130
			140
			255
		]
		pos = (0.5, 0.51, 0.0)
		length = 0.25
		angularvel = 0.26
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.01
		scale = (0.99899995, 0.99899995)
		color = [
			100
			128
			128
			12
		]
		blendmode = add
	}
]
og_dontharshmymellow = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (-0.97999996, -0.98999995)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (0.515, 0.5, 0.0)
		radius = 0.021
		color = [
			0
			0
			0
			255
		]
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 10
			}
		]
	}
	{
		type = circle
		color = [
			50
			50
			50
			255
		]
		pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 40.1
			}
			{
				type = beaton
				spectrumband = 30
				response = bluemodulation
				colorscale = 1
			}
		]
	}
	{
		type = circle
		color = [
			5
			4
			0
			255
		]
		pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				type = frequency
				spectrumband = 18
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		type = hypotrochoid
		color = [
			255
			204
			0
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerradius = 0.16
		innerradius = 0.21000001
		angularvel = 1
		thickness = 5.0
	}
	{
		type = line
		pos = (0.51, 0.5, 0.0)
		color = [
			228
			248
			48
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 10.1
			}
			{
				type = beaton
				spectrumband = 30
				response = bluemodulation
				colorscale = 1
			}
			{
				type = beaton
				response = lengthscale
				spectrumband = 18
				responsefunc = sinlog10
				lengthscalemod = 0.1
			}
		]
	}
	{
		type = line
		color = [
			150
			168
			238
			255
		]
		pos = (0.5, 0.51, 0.0)
		length = 0.1
		angularvel = 0.025999999
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				type = beaton
				response = lengthscale
				spectrumband = 18
				responsefunc = sinlog10
				lengthscalemod = 0.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.01
		scale = (0.99899995, 0.99899995)
		color = [
			120
			108
			128
			15
		]
		blendmode = add
	}
]
og_retinalburn = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.01, 0.98999995)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.1
		color = [
			0
			0
			0
			255
		]
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.05
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 32
				deformscale = 200
			}
		]
	}
	{
		type = hypotrochoid
		color = [
			68
			168
			248
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerradius = 0.26
		innerradius = 0.1
		angularvel = 5
		thickness = 1.0
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.01
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 10
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.51, 0.0)
		color = [
			48
			28
			48
			255
		]
		length = 0.25
		angularvel = 0.01
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = line
		color = [
			20
			38
			108
			255
		]
		pos = (0.25, 0.52, 0.0)
		length = 0.5
		angularvel = 0.01
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (0.98999995, 0.98999995)
		color = [
			120
			108
			128
			15
		]
		blendmode = add
	}
]
og_chrysalis = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.01, 0.98999995)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (0.515, 0.5, 0.0)
		radius = 0.1
		color = [
			0
			0
			0
			255
		]
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = hypotrochoid
		color = [
			68
			168
			248
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerradius = 0.26
		innerradius = 0.1
		angularvel = 5
		thickness = 1.0
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.01
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.51, 0.0)
		color = [
			48
			28
			48
			255
		]
		length = 0.25
		angularvel = 0.01
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = line
		color = [
			20
			38
			108
			255
		]
		pos = (0.5, 0.52, 0.0)
		length = 0.5
		angularvel = 0.01
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (0.98999995, 0.98999995)
		color = [
			120
			108
			128
			15
		]
		blendmode = add
	}
]
og_spinner = [
	{
		type = blendprev
		angularvel = 0.1
		scale = (1.01, 1.1)
		color = [
			250
			220
			0
			255
		]
		blendmode = blend
	}
	{
		type = circle
		color = [
			250
			250
			250
			255
		]
		pos = (0.515, 0.5, 0.0)
		radius = 0.1
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = hypotrochoid
		color = [
			68
			168
			248
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerradius = 0.16
		innerradius = 0.1
		angularvel = 1
		thickness = 15.0
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			228
			248
			248
			255
		]
		length = 0.1
		angularvel = 0.05
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 200.1
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.4, 0.0)
		color = [
			48
			28
			48
			255
		]
		length = 0.25
		angularvel = 0.03
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = line
		color = [
			20
			38
			108
			255
		]
		pos = (0.75, 0.4, 0.0)
		length = 0.5
		angularvel = 0.012999999
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.01
		scale = (0.99899995, 0.99899995)
		color = [
			120
			108
			128
			15
		]
		blendmode = add
	}
]
og_web = [
	{
		type = blendprev
		angularvel = 0.1
		scale = (1.01, 1.1)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = circle
		color = [
			220
			128
			28
			12
		]
		pos = (0.55, 0.5, 0.0)
		radius = 0.25
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = hypotrochoid
		color = [
			68
			68
			148
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerradius = 0.16
		innerradius = 0.1
		angularvel = 1
		thickness = 15.0
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			228
			248
			248
			255
		]
		length = 0.1
		angularvel = 0.05
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 200.1
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.4, 0.0)
		color = [
			248
			228
			248
			255
		]
		length = 0.025
		angularvel = 1.3
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = line
		color = [
			20
			38
			108
			255
		]
		pos = (0.75, 0.4, 0.0)
		length = 0.025
		angularvel = 2.3
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.01
		scale = (0.99899995, 0.99899995)
		color = [
			120
			108
			128
			12
		]
		blendmode = add
	}
]
og_psychoid = [
	{
		type = blendprev
		angularvel = 0.01
		scale = (1.01, 1.1)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = hypotrochoid
		color = [
			68
			68
			148
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerradius = 0.2
		innerradius = 0.1
		angularvel = 1
		thickness = 25.0
	}
	{
		type = line
		pos = (0.75, 0.42000002, 0.0)
		color = [
			228
			248
			248
			255
		]
		length = 0.1
		angularvel = 0.05
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 200.1
			}
		]
	}
	{
		type = circle
		color = [
			0
			0
			0
			255
		]
		pos = (0.55, 0.5, 0.0)
		radius = 0.125
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = circle
		color = [
			0
			0
			0
			255
		]
		pos = (0.55, 0.51, 0.0)
		radius = 0.126
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.01
		scale = (0.99899995, 0.99899995)
		color = [
			120
			108
			128
			25
		]
		blendmode = add
	}
	{
		type = hypotrochoid
		color = [
			0
			0
			0
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerradius = 0.16
		innerradius = 0.1
		angularvel = 1
		thickness = 25.0
	}
]
og_psyche = [
	{
		type = blendprev
		angularvel = 0.01
		scale = (1.01, 1.1)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = hypotrochoid
		color = [
			68
			68
			148
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerradius = 0.2
		innerradius = 0.1
		angularvel = 1
		thickness = 25.0
	}
	{
		type = line
		pos = (0.75, 0.42000002, 0.0)
		color = [
			228
			248
			248
			255
		]
		length = 0.1
		angularvel = 0.05
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 200.1
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.41, 0.0)
		color = [
			68
			8
			0
			255
		]
		length = 0.25
		angularvel = 0.06
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = line
		color = [
			0
			68
			8
			255
		]
		pos = (0.75, 0.4, 0.0)
		length = 0.25
		angularvel = 0.04
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.01
		scale = (0.99899995, 0.99899995)
		color = [
			120
			108
			128
			25
		]
		blendmode = add
	}
	{
		type = hypotrochoid
		color = [
			0
			0
			0
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerradius = 0.16
		innerradius = 0.1
		angularvel = 1
		thickness = 25.0
	}
]
og_eyeofthestorm = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.97999996, -0.98999995)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			0
			0
			0
			255
		]
		length = 0.75
		thickness = 1
		angularvel = 0.5
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 20.1
			}
		]
	}
	{
		type = circle
		pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = circle
		pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = hypotrochoid
		color = [
			68
			68
			148
			255
		]
		pos = (0.4515, 0.515, 0.0)
		length = 0.02
		outerradius = 0.16
		innerradius = 0.1
		angularvel = 1
		thickness = 5.0
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		type = line
		color = [
			20
			38
			108
			255
		]
		pos = (0.75, 0.4, 0.0)
		length = 0.25
		angularvel = 2.3
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.01
		scale = (0.99899995, 0.99899995)
		color = [
			120
			108
			128
			15
		]
		blendmode = add
	}
]
og_neon_tunnel = [
	{
		type = blendprev
		angularvel = 0.0
		angle = 0.1
		scale = (0.98999995, 0.98999995)
		offset = (0.0, 0.0)
		color = [
			255
			255
			254
			255
		]
		blendmode = blend
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 0.99099994)
		offset = (0.0, 0.0)
		color = [
			255
			5
			5
			1
		]
		blendmode = add
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.09
		color = [
			50
			0
			0
			255
		]
		thickness = 5
		controls = [
			{
				type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10
			}
		]
	}
	{
		type = line
		color = [
			0
			0
			0
			255
		]
		pos = (0.5, 0.1515, 0.0)
		length = 0.75
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 48
				responsefunc = log10
				deformscale = 10
			}
			{
				type = frequency
				spectrumband = 10
				response = alphamodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 11
				response = redmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 12
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 13
				response = bluemodulation
				colorscale = 100
			}
		]
	}
]
green_tunnel_primitives = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.001, 0.99899995)
		color = [
			245
			204
			246
			255
		]
		blendmode = blend
	}
	{
		type = circle
		pos = (0.25, 0.25, 0.0)
		radius = 0.1
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.55, 0.55, 0.0)
		length = 0.01
		outerradius = 0.15
		innerradius = 0.015
		angularvel = 5
		thickness = 1.0
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		color = [
			128
			148
			148
			255
		]
		length = 1
		angularvel = 0.5
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 10.1
			}
		]
	}
	{
		type = hypotrochoid
		color = [
			58
			108
			8
			255
		]
		pos = (0.5, 0.55, 0.0)
		length = 0.1
		outerradius = 0.15
		innerradius = 0.015
		angularvel = 1
		thickness = 1.0
	}
	{
		type = line
		color = [
			20
			38
			108
			55
		]
		pos = (0.75, 0.4, 0.0)
		length = 0.25
		angularvel = 0.03
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.01
		scale = (1.01, 0.899)
		color = [
			20
			38
			28
			128
		]
		blendmode = add
	}
]
og_preset_1 = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98999995, 0.98999995)
		color = [
			255
			254
			254
			255
		]
		blendmode = blend
	}
	{
		type = circle
		color = [
			0
			0
			0
			255
		]
		pos = (0.5, 0.45000002, 0.0)
		radius = 0.012999999
		thickness = 3
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 28
				responsefunc = log10
				deformscale = 15
			}
			{
				type = frequency
				spectrumband = 32
				response = greenmodulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumband = 32
				response = bluemodulation
				colorscale = 200
			}
		]
	}
	{
		type = circle
		color = [
			0
			100
			200
			255
		]
		pos = (0.51, 0.5, 0.0)
		radius = 0.015999999
		thickness = 2
		controls = [
			{
				type = waveform
				response = radiusscale
				radiusscalemod = 10
			}
			{
				type = frequency
				spectrumband = 8
				response = redmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 32
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 32
				response = bluemodulation
				colorscale = 200
			}
		]
	}
	{
		type = circle
		color = [
			55
			55
			255
			255
		]
		pos = (0.52, 0.5, 0.0)
		radius = 0.01
		thickness = 3
	}
	{
		type = line
		color = [
			150
			230
			250
			255
		]
		pos = (0.5, 0.5, 0.0)
		length = 0.375
		angularvel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 48
				responsefunc = sinlog10
				deformscale = 15
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.05
		scale = (0.9919999, -0.99099994)
		color = [
			5
			10
			15
			55
		]
		blendmode = add
	}
]
og_lazerz = [
	{
		type = blendprev
		angularvel = 0
		scale = (-1.1, 1.01)
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
	}
	{
		type = line
		color = [
			0
			0
			0
			255
		]
		pos = (0.0, 0.45000002, 0.0)
		length = 1
		thickness = 2
		angularvel = 0.01
		controls = [
			{
				type = frequency
				response = lengthscale
				spectrumband = 18
				responsefunc = sinlog10
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumband = 8
				response = redmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 32
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 200
			}
		]
	}
	{
		type = line
		color = [
			0
			0
			0
			255
		]
		pos = (1.0, 0.55, 0.0)
		length = 1
		thickness = 2
		angularvel = 0.1
		controls = [
			{
				type = frequency
				response = lengthscale
				spectrumband = 18
				responsefunc = sinlog10
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumband = 8
				response = redmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 32
				response = greenmodulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 200
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.01, -1.01)
		color = [
			50
			50
			50
			20
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98999995, 1.2)
		color = [
			100
			10
			10
			20
		]
		blendmode = sub
	}
]
og_preset_10 = [
	{
		type = blendprev
		angularvel = 0.1
		scale = (-1.0, 1.0)
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
	}
	{
		type = line
		color = [
			250
			200
			50
			255
		]
		pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = log10
				deformscale = 20
			}
		]
	}
	{
		type = line
		color = [
			250
			100
			50
			255
		]
		pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 20
			}
		]
	}
	{
		type = line
		color = [
			250
			200
			250
			255
		]
		pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 0
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.2, 1.2)
		color = [
			100
			100
			110
			160
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (1.5, 1.0)
		color = [
			110
			100
			100
			118
		]
		blendmode = sub
	}
]
og_psychoholic = [
	{
		type = blendprev
		angularvel = 0.01
		scale = (-1.0, 1.0)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = line
		color = [
			250
			200
			50
			255
		]
		pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = log10
				deformscale = 20
			}
		]
	}
	{
		type = line
		color = [
			250
			100
			50
			255
		]
		pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 20
			}
		]
	}
	{
		type = line
		color = [
			250
			200
			250
			255
		]
		pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 0
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.2, 1.2)
		color = [
			100
			100
			110
			160
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (1.5, 1.0)
		color = [
			110
			100
			100
			118
		]
		blendmode = sub
	}
]
og_koolaidoscope = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.0)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = line
		color = [
			250
			200
			50
			255
		]
		pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = log10
				deformscale = 20
			}
		]
	}
	{
		type = line
		color = [
			250
			100
			50
			255
		]
		pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 20
			}
		]
	}
	{
		type = line
		color = [
			250
			200
			250
			255
		]
		pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 0
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.2, 1.2)
		color = [
			100
			100
			110
			160
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (1.5, 1.0)
		color = [
			110
			100
			100
			118
		]
		blendmode = sub
	}
]
og_eventhorizon = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.0)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = line
		color = [
			250
			200
			50
			255
		]
		pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = log10
				deformscale = 20
			}
		]
	}
	{
		type = line
		color = [
			250
			100
			50
			255
		]
		pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 20
			}
		]
	}
	{
		type = line
		color = [
			250
			200
			250
			255
		]
		pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 0
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.2, 1.2)
		color = [
			100
			100
			110
			20
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 10
		scale = (0.569, 0.2569)
		color = [
			110
			100
			100
			18
		]
		blendmode = sub
	}
]
og_preset_circledeform = [
	{
		type = blendprev
		angularvel = 0.01
		scale = (0.98999995, 1.0124999)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
		nonuniformscale
	}
	{
		type = circle
		color = [
			50
			250
			250
			255
		]
		pos = (0.5, 0.5, 0.0)
		radius = 0.125
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 140.0
			}
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.05
				spectrumband = 20
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		color = [
			250
			250
			50
			255
		]
		radius = 0.1
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 120.0
			}
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 12
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		color = [
			250
			50
			250
			255
		]
		radius = 0.11
		controls = [
			{
				type = waveform
				response = deform
				deformscale = 120.0
			}
			{
				type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 48
			}
		]
	}
]
og_preset_2 = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.99899995, 0.99899995)
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (0.98999995, 0.98999995)
		color = [
			204
			254
			254
			255
		]
		blendmode = blend
	}
	{
		type = line
		color = [
			147
			60
			255
			255
		]
		pos = (0.5, 0.5, 0.0)
		length = 0.4
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 48
				responsefunc = log10
				deformscale = 20
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.9
		scale = (-1.01, 1.01)
		color = [
			254
			254
			254
			254
		]
		blendmode = blend
	}
]
og_love = [
	{
		type = blendprev
		angularvel = 0
		scale = (-0.98999995, -0.98999995)
		color = [
			255
			254
			254
			255
		]
		blendmode = blend
	}
	{
		type = circle
		color = [
			10
			0
			0
			255
		]
		pos = (0.5, 0.45000002, 0.0)
		radius = 0.03
		thickness = 3
		controls = [
			{
				type = waveform
				response = deform
				responsefunc = log10
				deformscale = 50.1
			}
		]
	}
	{
		type = circle
		color = [
			0
			0
			0
			255
		]
		pos = (0.51, 0.5, 0.0)
		radius = 0.06
		thickness = 3
	}
	{
		type = circle
		color = [
			255
			155
			255
			255
		]
		pos = (0.52, 0.5, 0.0)
		radius = 0.03
		thickness = 3
		controls = [
			{
				type = waveform
				response = deform
				responsefunc = log10
				deformscale = 100.1
			}
		]
	}
	{
		type = line
		color = [
			250
			200
			250
			255
		]
		pos = (0.5, 0.55, 0.0)
		length = 0.75
		angularvel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				responsefunc = log10
				deformscale = 10.1
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (-0.9919999, 0.99099994)
		color = [
			5
			5
			5
			55
		]
		blendmode = add
	}
]
