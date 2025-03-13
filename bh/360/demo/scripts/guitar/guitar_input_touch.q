guitar_touch_patterns = [
	{
		touch_value = -107
		touch_pattern = 65536
		pattern_string = qs(0xcb20c733)
	}
	{
		touch_value = -80
		touch_pattern = 69632
		pattern_string = qs(0xbe50440f)
	}
	{
		touch_value = -51
		touch_pattern = 4096
		pattern_string = qs(0x7895d0b6)
	}
	{
		touch_value = -26
		touch_pattern = 4352
		pattern_string = qs(0xe8269f61)
	}
	{
		touch_value = 26
		touch_pattern = 256
		pattern_string = qs(0x9d561c5d)
	}
	{
		touch_value = 46
		touch_pattern = 272
		pattern_string = qs(0xfe13fb08)
	}
	{
		touch_value = 72
		touch_pattern = 16
		pattern_string = qs(0x6ea0b4df)
	}
	{
		touch_value = 99
		touch_pattern = 17
		pattern_string = qs(0x396bbdfa)
	}
	{
		touch_value = 127
		touch_pattern = 1
		pattern_string = qs(0x5a2e5aaf)
	}
]
touch_glow_props = [
	{
		mat = highway_slide_01
		rot_offset = 1.2
		rgba = [
			0
			165
			30
			255
		]
	}
	{
		mat = highway_slide_01
		rot_offset = 0.5
		rgba = [
			230
			30
			40
			255
		]
	}
	{
		mat = highway_slide_01
		rot_offset = 0.72999996
		rgba = [
			240
			240
			0
			255
		]
	}
	{
		mat = highway_slide_01
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
			30
			255
		]
		flip_v = 1
	}
	{
		mat = highway_slide_01
		rot_offset = 1.2
		rgba = [
			230
			30
			40
			255
		]
	}
	{
		mat = highway_slide_01
		rot_offset = 0.5
		rgba = [
			240
			240
			0
			255
		]
	}
	{
		mat = highway_slide_01
		rot_offset = 0.72999996
		rgba = [
			0
			135
			210
			255
		]
	}
	{
		mat = highway_slide_01
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
			30
			255
		]
		flip_v = 1
	}
	{
		mat = highway_slide_01
		rot_offset = 1.2
		rgba = [
			230
			30
			40
			255
		]
	}
	{
		mat = highway_slide_01
		rot_offset = 0.5
		rgba = [
			240
			240
			0
			255
		]
	}
	{
		mat = highway_slide_01
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

script guitar_touch_update_hilite \{player = 1
		color_num = 0}
	getplayerinfo <player> lefthanded_gems
	getarraysize \{$gem_colors}
	array_count = 0
	formattext checksumname = script_id 'fade_touch_glowp%p' p = <player> addtostringlookup = true
	begin
	if NOT (<lefthanded_gems> = 1)
		color_count = <array_count>
	else
		color_count = ((<array_size> - 2) - <array_count>)
	endif
	color = ($gem_colors [<color_count>])
	color_string = (($button_up_models [(<player> -1)]).<color>.name_string)
	formattext checksumname = touch_glow '%s_touch_glowp%p' s = <color_string> p = <player> addtostringlookup = true
	if (<array_count> = <color_num>)
		if screenelementexists id = <touch_glow>
			spawnscriptnow fade_touch_glow params = {touch_glow = <touch_glow> rgba = ($touch_glow_props [<array_count>].rgba) in} id = <script_id>
		endif
	else
		if screenelementexists id = <touch_glow>
			spawnscriptnow fade_touch_glow params = {touch_glow = <touch_glow> rgba = ($touch_glow_props [<array_count>].rgba)} id = <script_id>
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat (<array_size> - 1)
endscript

script fade_touch_glow 
	if gotparam \{in}
		if screenelementexists id = <touch_glow>
			<touch_glow> :se_setprops alpha = ($touch_glow_fade_in_alpha) rgba = <rgba> time = ($touch_glow_fade_in_time)
		endif
		wait \{1
			frame}
		if screenelementexists id = <touch_glow>
			<touch_glow> :se_setprops alpha = 0.25 rgba = <rgba> time = 0.5
		endif
	else
		if screenelementexists id = <touch_glow>
			<touch_glow> :se_setprops alpha = 0 rgba = <rgba> time = ($touch_glow_fade_out_time)
		endif
	endif
endscript

script drum_fill_update_hilite \{player = 1}
	getarraysize \{$gem_colors}
	array_count = 0
	formattext checksumname = script_id 'pulse_touch_glowp%p' p = <player> addtostringlookup = true
	begin
	color = ($gem_colors [<array_count>])
	color_string = (($button_up_models [(<player> -1)]).<color>.name_string)
	formattext checksumname = touch_glow '%s_touch_glowp%p' s = <color_string> p = <player> addtostringlookup = true
	if (<array_count> = <color_num>)
		if screenelementexists id = <touch_glow>
			spawnscriptnow pulse_touch_glow params = {touch_glow = <touch_glow> alpha = <alpha>} id = <script_id>
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript

script pulse_touch_glow \{alpha = 1.0}
	if screenelementexists id = <touch_glow>
		<touch_glow> :se_setprops alpha = <alpha> time = 0.05
	endif
	wait \{0.1
		seconds}
	if screenelementexists id = <touch_glow>
		<touch_glow> :se_setprops alpha = 0 time = 0.05
	endif
endscript

script reset_all_touch_glow 
	killspawnedscript \{name = fade_touch_glow}
	killspawnedscript \{name = pulse_touch_glow}
	player = 1
	begin
	getarraysize \{$gem_colors}
	array_count = 0
	begin
	color = ($gem_colors [<array_count>])
	color_string = (($button_up_models [(<player> -1)]).<color>.name_string)
	formattext checksumname = touch_glow '%s_touch_glowp%p' s = <color_string> p = <player> addtostringlookup = true
	if screenelementexists id = <touch_glow>
		<touch_glow> :se_setprops alpha = 0
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	player = (<player> + 1)
	repeat 4
endscript

script reset_player_touch_glow 
	requireparams \{[
			player
		]
		all}
	formattext checksumname = glow_script_id 'fade_touch_glowp%p' p = <player>
	killspawnedscript id = <glow_script_id>
	formattext checksumname = pulse_script_id 'pulse_touch_glowp%p' p = <player>
	killspawnedscript id = <pulse_script_id>
	getarraysize \{$gem_colors}
	array_count = 0
	begin
	color = ($gem_colors [<array_count>])
	color_string = (($button_up_models [(<player> -1)]).<color>.name_string)
	formattext checksumname = touch_glow '%s_touch_glowp%p' s = <color_string> p = <player> addtostringlookup = true
	if screenelementexists id = <touch_glow>
		<touch_glow> :se_setprops alpha = 0
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript

script guitar_touch_start_eq 
	getplayerinfo <player> part
	if (<part> = guitar)
		center_value = (500 + ((2000 / 8) * <touch_zone>))
		setsoundbusseffects effects = [{name = guitar_eq effect = parameq center = <center_value> bandwidth = 0.6 gain = 1.0}]
		setsoundbusseffects effects = [{name = guitar_eq effect = parameq center = <center_value> bandwidth = 0.6 gain = 2.0}] time = 0.1
	elseif (<part> = bass)
		center_value = (500 + ((2000 / 8) * <touch_zone>))
		setsoundbusseffects effects = [{name = bass_eq effect = parameq center = <center_value> bandwidth = 0.6 gain = 1.0}]
		setsoundbusseffects effects = [{name = bass_eq effect = parameq center = <center_value> bandwidth = 0.6 gain = 2.0}] time = 0.1
	endif
endscript

script guitar_touch_update_eq 
	getplayerinfo <player> part
	if (<part> = guitar)
		randomness = RandomInteger (20.0, 40.0)
		center_value = (<randomness> + 500 + ((2000 / 8) * <touch_zone>))
		setsoundbusseffects effects = [{name = guitar_eq effect = parameq center = <center_value> bandwidth = 0.6 gain = 2.0}] time = 0.1
	elseif (<part> = bass)
		randomness = RandomInteger (20.0, 40.0)
		center_value = (<randomness> + 500 + ((2000 / 8) * <touch_zone>))
		setsoundbusseffects effects = [{name = bass_eq effect = parameq center = <center_value> bandwidth = 0.6 gain = 2.0}] time = 0.1
	endif
endscript

script guitar_touch_stop_eq 
	getplayerinfo <player> part
	if (<part> = guitar)
		setsoundbusseffects \{effects = [
				{
					name = guitar_eq
					effect = parameq
					center = 800
					bandwidth = 0.5
					gain = 1.0
				}
			]
			time = 0.15}
	elseif (<part> = bass)
		setsoundbusseffects \{effects = [
				{
					name = bass_eq
					effect = parameq
					center = 800
					bandwidth = 0.5
					gain = 1.0
				}
			]
			time = 0.1}
	endif
endscript
