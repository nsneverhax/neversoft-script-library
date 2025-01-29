DoUpdateLensFlare = 1
LensFlare_Morph_In = 0.15
LensFlare_Morph_Out = 0.1

script DisableSun 
	ScriptAssert \{'DisableSun: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script EnableSun 
	ScriptAssert \{'EnableSun: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script CreateLensFlare 
	return
	SetScreenElementLock \{id = root_window
		OFF}
	CreateScreenElement \{Type = ContainerElement
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
		Type = SpriteElement
		parent = Lens_Flare_Container
		id = (Lens_Flare_Data [<index>].id)
		Scale = (Lens_Flare_Data [<index>].Scale)
		texture = (Lens_Flare_Data [<index>].texture)
		rgba = (Lens_Flare_Data [<index>].rgba)
		Pos = (0.0, 0.0)
		blend = add
	}
	<index> = (<index> + 1)
	repeat <array_Size>
	SetScreenElementLock \{id = root_window
		On}
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
		Scale = 3.0
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
		Scale = 2.0
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
		Scale = 0.6
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
		Scale = 0.75
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
		Scale = 0.45000002
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
		Scale = 0.75
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
		Scale = 0.5
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
		Scale = 1.3
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
		Scale = 0.85
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
		Scale = 3.1
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
		Scale = 2.75
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
		Scale = 1.0
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
		Scale = 1.0
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
		Scale = 0.75
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
		Scale = 0.5
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
		Scale = 2.0
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
		Scale = 0.85
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
		Scale = 0.75
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
		Scale = 0.85
		rgba = [
			128
			128
			128
			128
		]
	}
]
SunBurst_Out = 0.25
