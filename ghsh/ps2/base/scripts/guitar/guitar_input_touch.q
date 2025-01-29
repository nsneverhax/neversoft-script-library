guitar_touch_patterns = [
	{
		touch_value = -128
		touch_pattern = 1048576
		pattern_string = qs(0x0743e2fa)
	}
	{
		touch_value = -98
		touch_pattern = 65536
		pattern_string = qs(0xc1867643)
	}
	{
		touch_value = -73
		touch_pattern = 69632
		pattern_string = qs(0xb4f6f57f)
	}
	{
		touch_value = -48
		touch_pattern = 4096
		pattern_string = qs(0x723361c6)
	}
	{
		touch_value = -23
		touch_pattern = 4352
		pattern_string = qs(0xe2802e11)
	}
	{
		touch_value = 0
		touch_pattern = 1048576
		pattern_string = qs(0x0743e2fa)
	}
	{
		touch_value = 27
		touch_pattern = 256
		pattern_string = qs(0x97f0ad2d)
	}
	{
		touch_value = 47
		touch_pattern = 272
		pattern_string = qs(0xf4b54a78)
	}
	{
		touch_value = 72
		touch_pattern = 16
		pattern_string = qs(0x640605af)
	}
	{
		touch_value = 97
		touch_pattern = 17
		pattern_string = qs(0x33cd0c8a)
	}
	{
		touch_value = 127
		touch_pattern = 1
		pattern_string = qs(0x5088ebdf)
	}
]
0xe3492d41 = [
	{
		touch_value = -128
		touch_pattern = 1048576
		pattern_string = qs(0x0743e2fa)
	}
	{
		touch_value = -88
		touch_pattern = 65536
		pattern_string = qs(0xc1867643)
	}
	{
		touch_value = -59
		touch_pattern = 69632
		pattern_string = qs(0xb4f6f57f)
	}
	{
		touch_value = -30
		touch_pattern = 4096
		pattern_string = qs(0x723361c6)
	}
	{
		touch_value = -1
		touch_pattern = 4352
		pattern_string = qs(0xe2802e11)
	}
	{
		touch_value = 29
		touch_pattern = 256
		pattern_string = qs(0x97f0ad2d)
	}
	{
		touch_value = 58
		touch_pattern = 272
		pattern_string = qs(0xf4b54a78)
	}
	{
		touch_value = 87
		touch_pattern = 16
		pattern_string = qs(0x640605af)
	}
	{
		touch_value = 116
		touch_pattern = 17
		pattern_string = qs(0x33cd0c8a)
	}
	{
		touch_value = 127
		touch_pattern = 1
		pattern_string = qs(0x5088ebdf)
	}
]
touch_glow_props = [
	{
		mat = highway_slide_01
		rot_offset = 1.2
		rgba = [
			0
			165
			130
			255
		]
	}
	{
		mat = highway_slide_02
		rot_offset = 0.5
		rgba = [
			230
			80
			90
			255
		]
	}
	{
		mat = highway_slide_03
		rot_offset = 0.72999996
		rgba = [
			240
			240
			0
			255
		]
	}
	{
		mat = highway_slide_02
		rot_offset = -0.5
		rgba = [
			0
			135
			210
			255
		]
		flip_v = 1
	}
	{
		mat = highway_slide_01
		rot_offset = -1.2
		rgba = [
			220
			160
			25
			255
		]
		flip_v = 1
	}
]
touch_glow_props_drum = [
	{
		mat = highway_slide_01
		rot_offset = -1.2
		rgba = [
			0
			165
			130
			255
		]
		flip_v = 1
	}
	{
		mat = highway_slide_01
		rot_offset = 1.2
		rgba = [
			230
			80
			90
			255
		]
	}
	{
		mat = highway_slide_02
		rot_offset = 0.5
		rgba = [
			240
			240
			0
			255
		]
	}
	{
		mat = highway_slide_03
		rot_offset = 0.72999996
		rgba = [
			0
			135
			210
			255
		]
	}
	{
		mat = highway_slide_02
		rot_offset = -0.5
		rgba = [
			220
			160
			25
			255
		]
		flip_v = 1
	}
]
touch_glow_props_rb_drum = [
	{
		mat = highway_slide_01
		rot_offset = -1.2
		rgba = [
			0
			165
			130
			255
		]
		flip_v = 1
	}
	{
		mat = highway_slide_01
		rot_offset = 1.2
		rgba = [
			230
			80
			90
			255
		]
	}
	{
		mat = highway_slide_02
		rot_offset = 0.5
		rgba = [
			240
			240
			0
			255
		]
	}
	{
		mat = highway_slide_02
		rot_offset = -0.5
		rgba = [
			0
			135
			210
			255
		]
		flip_v = 1
	}
	{
		mat = highway_slide_02
		rot_offset = -0.5
		rgba = [
			220
			160
			25
			255
		]
		flip_v = 1
	}
]
touch_glow_fade_in_time = 0.0
touch_glow_fade_in_alpha = 0.85
touch_glow_fade_out_time = 0.05

script guitar_touch_update_hilite \{Player = 1
		color_num = 0}
	getplayerinfo <Player> text
	player_text = <text>
	getplayerinfo <Player> lefthanded_gems
	GetArraySize \{$gem_colors}
	array_count = 0
	begin
	if NOT (<lefthanded_gems> = 1)
		color_count = <array_count>
	else
		color_count = ((<array_Size> - 2) - <array_count>)
	endif
	Color = ($gem_colors [<color_count>])
	color_string = (($button_up_models [(<Player> -1)]).<Color>.name_string)
	formatText checksumName = touch_glow '%s_touch_glow%p' s = <color_string> p = <player_text> AddToStringLookup = true
	if (<array_count> = <color_num>)
		if ScreenElementExists id = <touch_glow>
			SpawnScriptNow fade_touch_glow params = {touch_glow = <touch_glow> rgba = ($touch_glow_props [<array_count>].rgba) in}
		endif
	else
		if ScreenElementExists id = <touch_glow>
			SpawnScriptNow fade_touch_glow params = {touch_glow = <touch_glow> rgba = ($touch_glow_props [<array_count>].rgba)}
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat (<array_Size> - 1)
endscript

script fade_touch_glow 
	if GotParam \{in}
		if ScreenElementExists id = <touch_glow>
			<touch_glow> :se_setprops alpha = ($touch_glow_fade_in_alpha) rgba = <rgba> time = ($touch_glow_fade_in_time)
		endif
	else
		if ScreenElementExists id = <touch_glow>
			<touch_glow> :se_setprops alpha = 0 rgba = <rgba> time = ($touch_glow_fade_out_time)
		endif
	endif
endscript

script drum_fill_update_hilite \{Player = 1}
	getplayerinfo <Player> text
	player_text = <text>
	GetArraySize \{$gem_colors}
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	color_string = (($button_up_models [(<Player> -1)]).<Color>.name_string)
	formatText checksumName = touch_glow '%s_touch_glow%p' s = <color_string> p = <player_text> AddToStringLookup = true
	if (<array_count> = <color_num>)
		if ScreenElementExists id = <touch_glow>
			SpawnScriptNow pulse_touch_glow params = {touch_glow = <touch_glow> alpha = <alpha>}
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
endscript

script pulse_touch_glow \{alpha = 1.0}
	if ScreenElementExists id = <touch_glow>
		<touch_glow> :se_setprops alpha = <alpha> time = 0.05
	endif
	Wait \{0.1
		Seconds}
	if ScreenElementExists id = <touch_glow>
		<touch_glow> :se_setprops alpha = 0 time = 0.05
	endif
endscript
0x70ae4aba = -1.0

script guitar_touch_start_eq 
	getplayerinfo <Player> part
	if (<part> = guitar)
		Change 0x70ae4aba = <touch_zone>
		0x627ebdce stream_id = $0x84acfb5b bend = 0.0 part = <part>
	elseif (<part> = bass)
		Change 0x70ae4aba = <touch_zone>
		0x627ebdce stream_id = $0x84acfb5b bend = 0.0 part = <part>
	endif
endscript

script guitar_touch_update_eq 
	getplayerinfo <Player> part
	if (<part> = guitar)
		if (($0x70ae4aba) >= 0)
			0x627ebdce stream_id = $0x84acfb5b bend = (($0x70ae4aba - <touch_zone>) / 8.0) part = <part>
		else
			Change 0x70ae4aba = <touch_zone>
		endif
	elseif (<part> = bass)
		if (($0x70ae4aba) >= 0)
			0x627ebdce stream_id = $0x84acfb5b bend = (($0x70ae4aba - <touch_zone>) / 8.0) part = <part>
		else
			Change 0x70ae4aba = <touch_zone>
		endif
	endif
endscript

script guitar_touch_stop_eq 
	getplayerinfo <Player> part
	if (<part> = guitar)
		Change \{0x70ae4aba = -1.0}
		0x627ebdce stream_id = $0x84acfb5b bend = 0.0 part = <part>
	elseif (<part> = bass)
		Change \{0x70ae4aba = -1.0}
		0x627ebdce stream_id = $0x84acfb5b bend = 0.0 part = <part>
	endif
endscript
