doupdatelensflare = 1
lensflare_morph_in = 0.15
lensflare_morph_out = 0.1

script disablesun 
	change \{doupdatelensflare = 0}
	maybehidelensflare
	setsunprops \{size = 0}
endscript

script enablesun 
	change \{doupdatelensflare = 1}
	unhidelensflare
	setsunprops \{size = 7332.0}
endscript

script createlensflare 
	return
	setscreenelementlock \{id = root_window
		off}
	createscreenelement \{type = containerelement
		parent = root_window
		id = lens_flare_container
		dims = (640.0, 480.0)
		pos = (0.0, 0.0)
		alpha = 0
		just = [
			left
			top
		]}
	getarraysize \{lens_flare_data}
	index = 0
	begin
	createscreenelement {
		type = spriteelement
		parent = lens_flare_container
		id = (lens_flare_data [<index>].id)
		scale = (lens_flare_data [<index>].scale)
		texture = (lens_flare_data [<index>].texture)
		rgba = (lens_flare_data [<index>].rgba)
		pos = (0.0, 0.0)
		blend = add
	}
	<index> = (<index> + 1)
	repeat <array_size>
	setscreenelementlock \{id = root_window
		on}
endscript

script maybehidelensflare \{morph_time = 0.0}
	if screenelementexists \{id = lens_flare_container}
		hidelensflare <...>
	else
		createlensflare
	endif
endscript
lens_flare_data = [
	{
		id = lf_sprite_1
		texture = apm_abberation02
		pos_scale = 0.8
		scale = 3.0
		rgba = [
			200
			128
			0
			16
		]
	}
	{
		id = lf_sprite_2
		texture = apm_abberation02
		pos_scale = 0.7
		scale = 2.0
		rgba = [
			255
			128
			0
			20
		]
	}
	{
		id = lf_sprite_3
		texture = apm_abberation01
		pos_scale = 0.65000004
		scale = 0.6
		rgba = [
			255
			128
			100
			32
		]
	}
	{
		id = lf_sprite_4
		texture = flare1
		pos_scale = 0.63
		scale = 0.75
		rgba = [
			255
			128
			128
			32
		]
	}
	{
		id = lf_sprite_5
		texture = flare1
		pos_scale = 0.58
		scale = 0.45000002
		rgba = [
			200
			128
			0
			32
		]
	}
	{
		id = lf_sprite_6
		texture = apm_abberation01
		pos_scale = 0.57
		scale = 0.75
		rgba = [
			200
			128
			0
			32
		]
	}
	{
		id = lf_sprite_7
		texture = flare1
		pos_scale = 0.49
		scale = 0.5
		rgba = [
			255
			128
			128
			64
		]
	}
	{
		id = lf_sprite_8
		texture = apm_abberation02
		pos_scale = 0.45000002
		scale = 1.3
		rgba = [
			200
			128
			0
			20
		]
	}
	{
		id = lf_sprite_9
		texture = flare1
		pos_scale = 0.43
		scale = 0.85
		rgba = [
			255
			128
			128
			32
		]
	}
	{
		id = lf_sprite_10
		texture = apm_abberation01
		pos_scale = 0.120000005
		scale = 3.1
		rgba = [
			200
			128
			0
			12
		]
	}
	{
		id = lf_sprite_11
		texture = apm_abberation02
		pos_scale = -0.45000002
		scale = 2.75
		rgba = [
			200
			128
			100
			16
		]
	}
	{
		id = lf_sprite_12
		texture = apm_abberation02
		pos_scale = -0.48000002
		scale = 1.0
		rgba = [
			200
			128
			100
			32
		]
	}
]
lens_flare_data1 = [
	{
		id = lf_sprite_1
		texture = flare1
		pos_scale = 0.8
		scale = 1.0
		rgba = [
			128
			128
			196
			64
		]
	}
	{
		id = lf_sprite_2
		texture = apm_abberation01
		pos_scale = 0.5
		scale = 0.75
		rgba = [
			128
			128
			0
			64
		]
	}
	{
		id = lf_sprite_3
		texture = flare1
		pos_scale = 0.333
		scale = 0.5
		rgba = [
			128
			128
			128
			64
		]
	}
	{
		id = lf_sprite_4
		texture = apm_abberation02
		pos_scale = 0.125
		scale = 2.0
		rgba = [
			128
			64
			128
			64
		]
	}
	{
		id = lf_sprite_5
		texture = apm_abberation01
		pos_scale = -0.5
		scale = 0.85
		rgba = [
			196
			128
			128
			64
		]
	}
	{
		id = lf_sprite_6
		texture = flare1
		pos_scale = -0.25
		scale = 0.75
		rgba = [
			128
			128
			128
			64
		]
	}
	{
		id = lf_sprite_7
		texture = apm_abberation02
		pos_scale = -0.18180001
		scale = 0.85
		rgba = [
			128
			128
			128
			128
		]
	}
]
sunburst_out = 0.25
