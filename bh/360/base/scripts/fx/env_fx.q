DoUpdateLensFlare = 1
LensFlare_Morph_In = 0.15
LensFlare_Morph_Out = 0.1

script DisableSun 
	Change \{DoUpdateLensFlare = 0}
	MaybeHideLensFlare
	SetSunProps \{size = 0}
endscript

script EnableSun 
	Change \{DoUpdateLensFlare = 1}
	UnHideLensFlare
	SetSunProps \{size = 7332.0}
endscript

script CreateLensFlare 
	return
	SetScreenElementLock \{id = root_window
		off}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = Lens_Flare_Container
		dims = (640.0, 480.0)
		Pos = (0.0, 0.0)
		alpha = 0
		just = [
			left
			top
		]}
	GetArraySize \{Lens_Flare_Data}
	index = 0
	begin
	CreateScreenElement {
		type = SpriteElement
		parent = Lens_Flare_Container
		id = (Lens_Flare_Data [<index>].id)
		scale = (Lens_Flare_Data [<index>].scale)
		texture = (Lens_Flare_Data [<index>].texture)
		rgba = (Lens_Flare_Data [<index>].rgba)
		Pos = (0.0, 0.0)
		blend = add
	}
	<index> = (<index> + 1)
	repeat <array_size>
	SetScreenElementLock \{id = root_window
		on}
endscript

script MaybeHideLensFlare \{morph_time = 0.0}
	if ScreenElementExists \{id = Lens_Flare_Container}
		HideLensFlare <...>
	else
		CreateLensFlare
	endif
endscript
Lens_Flare_Data = [
	{
		id = lf_sprite_1
		texture = APM_abberation02
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
		texture = APM_abberation02
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
		texture = APM_abberation01
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
		texture = APM_abberation01
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
		texture = APM_abberation02
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
		texture = APM_abberation01
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
		texture = APM_abberation02
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
		texture = APM_abberation02
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
Lens_Flare_Data1 = [
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
		texture = APM_abberation01
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
		texture = APM_abberation02
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
		texture = APM_abberation01
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
		texture = APM_abberation02
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
SunBurst_Out = 0.25
