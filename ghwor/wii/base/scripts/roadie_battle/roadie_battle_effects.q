roadie_battle_gem_fade_time = 0.2
roadie_battle_hyperspeed_change_per_second = 0.075
rb_bomb_highway_percentage = 0.25
roadie_battle_lod = 0
roadie_battle_max_lod = 1
roadie_battle_lane_fire_element = [
]
roadie_battle_star_power_drain_element = [
]
roadie_battle_star_power_buff_element = [
]
roadie_battle_multiplier_boost_element = [
]
roadie_battle_multiplier_generator_element = [
]
roadie_battle_hyperspeed_element = [
]
roadie_battle_hyperspeed_target = [
]
roadie_battle_double_note_params = [
]
roadie_battle_fade_attack_params = [
]
roadie_battle_mine_attack_params = [
]
roadie_battle_highway_smoke_element = [
]
rb_streak_visuals_element = [
]
rb_spark_glow_ids = [
]
rb_sp_generator_elements = [
]
rb_sidebar_right_id = [
]

script roadie_battle_kill_all_effect_scripts 
	KillSpawnedScript \{Name = roadie_battle_break_string_spawned}
	KillSpawnedScript \{Name = rb_star_power_generator_increment}
	KillSpawnedScript \{Name = rb_star_power_generator_reset}
	KillSpawnedScript \{Name = rb_multiplier_generator_shiny}
	KillSpawnedScript \{Name = rb_switch_when_completed_animating}
	KillSpawnedScript \{Name = rb_destroy_when_completed_animating}
	KillSpawnedScript \{Name = rb_streak_keeper_intro}
	KillSpawnedScript \{Name = rb_star_power_buff_star_animation}
	KillSpawnedScript \{Name = rb_star_power_buff_individual_star}
	KillSpawnedScript \{Name = rb_star_power_buff_glow_animation}
	KillSpawnedScript \{Name = roadie_battle_star_power_buff_animation_end}
	KillSpawnedScript \{Name = rb_multiplier_boost_hide}
	KillSpawnedScript \{Name = rb_multiplier_boost_intro_rings}
	KillSpawnedScript \{Name = rb_multiplier_boost_intro_ticks}
	KillSpawnedScript \{Name = rb_star_power_generator_intro}
	KillSpawnedScript \{Name = rb_star_power_burst_animation}
	KillSpawnedScript \{Name = rb_highway_sparking_animate_spawned}
	KillSpawnedScript \{Name = rb_make_single_spark_spawned}
	KillSpawnedScript \{Name = rb_highway_sparking_end}
	KillSpawnedScript \{Name = roadie_battle_highway_wipe}
	KillSpawnedScript \{Name = roadie_battle_repair_rail_sparkles}
	KillSpawnedScript \{Name = roadie_battle_notecatcher_burn}
	KillSpawnedScript \{Name = roadie_battle_buff_gfx}
	KillSpawnedScript \{Name = roadie_battle_highway_rail_sparkles}
endscript

script roadie_battle_init_lod 
	getnumplayersingame
	switch <num_players>
		case 1
		Change \{roadie_battle_lod = 0}
		case 2
		Change \{roadie_battle_lod = 0}
		case 3
		Change \{roadie_battle_lod = 1}
		case 4
		Change \{roadie_battle_lod = 1}
	endswitch
endscript

script roadie_battle_reset_buff_attack_variables 
	Change \{roadie_battle_lane_fire_element = [
			None
			None
			None
			None
		]}
	Change \{roadie_battle_star_power_drain_element = [
			None
			None
			None
			None
		]}
	Change \{roadie_battle_multiplier_boost_element = [
			None
			None
			None
			None
		]}
	Change \{roadie_battle_multiplier_generator_element = [
			None
			None
			None
			None
		]}
	Change \{roadie_battle_hyperspeed_element = [
			None
			None
			None
			None
		]}
	Change \{roadie_battle_hyperspeed_target = [
			1.0
			1.0
			1.0
			1.0
		]}
	Change \{roadie_battle_double_note_params = [
			{
			}
			{
			}
			{
			}
			{
			}
		]}
	Change \{roadie_battle_fade_attack_params = [
			{
			}
			{
			}
			{
			}
			{
			}
		]}
	Change \{roadie_battle_mine_attack_params = [
			{
			}
			{
			}
			{
			}
			{
			}
		]}
	Change \{roadie_battle_highway_smoke_element = [
			None
			None
			None
			None
		]}
	<array> = []
	begin
	AddArrayElement array = <array> element = {}
	repeat $max_roadie_count
	Change rb_sp_generator_elements = <array>
	<array> = []
	begin
	AddArrayElement array = <array> element = {stars = None glow = None}
	repeat $max_roadie_count
	Change roadie_battle_star_power_buff_element = <array>
	<Player> = 1
	<array> = []
	begin
	formatText checksumName = right_sp_id 'sidebar_right_sp_meterp%p' p = <Player>
	AddArrayElement array = <array> element = <right_sp_id>
	<Player> = (<Player> + 1)
	repeat $max_roadie_count
	Change rb_sidebar_right_id = <array>
	<i> = 0
	<array> = []
	begin
	formatText checksumName = left 'rb_highway_sparking_left_%a' a = <i> AddToStringLookup = true
	formatText checksumName = right 'rb_highway_sparking_right_%a' a = <i> AddToStringLookup = true
	formatText checksumName = sparking 'rb_highway_sparking_sparking_%a' a = <i> AddToStringLookup = true
	<struct> = {left = <left> right = <right> sparking = <sparking>}
	AddArrayElement array = <array> element = <struct>
	<i> = (<i> + 1)
	repeat $max_roadie_count
	Change rb_spark_glow_ids = <array>
	<array> = []
	<Player> = 1
	begin
	formatText checksumName = shield 'rb_shield_base_p%p' p = <Player> AddToStringLookup = true
	formatText checksumName = count 'rb_shield_count_p%p' p = <Player> AddToStringLookup = true
	<struct> = {shield = <shield> count = <count>}
	AddArrayElement array = <array> element = <struct>
	<Player> = (<Player> + 1)
	repeat $max_roadie_count
	Change rb_streak_visuals_element = <array>
	roadie_battle_initialize_buffs_queue
endscript

script roadie_battle_prepare_fade_attack \{Player = !i1768515945
		on_time = !f1768515945
		off_time = !f1768515945
		min_start_mark = !f1768515945
		max_start_mark = !f1768515945}
	extendcrcplayer roadie_battle_gem_fader <Player> out = script_id
	<player_index> = (<Player> - 1)
	calculategempositionandscale Player = <Player> lane = 2 fraction = <min_start_mark>
	<min_start_y> = <pos_y>
	calculategempositionandscale Player = <Player> lane = 2 fraction = <max_start_mark>
	<max_start_y> = <pos_y>
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_fade_attack_params
		index = <player_index>
		NewValue = {
			on_time = <on_time>
			off_time = <off_time>
			script_id = <script_id>
			min_start_y = <min_start_y>
			max_start_y = <max_start_y>
		}
	}
endscript

script roadie_battle_start_fading_gem \{Player = !i1768515945
		gem_id = !q1768515945}
	<player_index> = (<Player> - 1)
	GetRandomValue {
		Name = start_y
		a = ($roadie_battle_fade_attack_params [<player_index>].min_start_y)
		b = ($roadie_battle_fade_attack_params [<player_index>].max_start_y)
	}
	<gem_id> :obj_spawnscript {
		roadie_battle_synchronize_fade_attack
		id = ($roadie_battle_fade_attack_params [<player_index>].script_id)
		params = {
			Player = <Player>
			gem_id = <gem_id>
			whammy_id = <whammy_id>
			on_time = ($roadie_battle_fade_attack_params [<player_index>].on_time)
			off_time = ($roadie_battle_fade_attack_params [<player_index>].off_time)
			start_y = <start_y>
		}
	}
endscript

script roadie_battle_synchronize_fade_attack \{Player = !i1768515945
		gem_id = !q1768515945
		on_time = !f1768515945
		off_time = !f1768515945
		start_y = !f1768515945}
	begin
	WaitOneGameFrame
	GetScreenElementPosition id = <gem_id> local
	if ((<screenelementpos> [1]) >= <start_y>)
		break
	endif
	repeat
	<gem_id> :obj_setchecksumtag tag_name = disable_fade checksum_value = on_except_rewind
	if GotParam \{whammy_id}
		<whammy_id> :obj_setchecksumtag tag_name = disable_fade checksum_value = on_except_rewind
	endif
	begin
	<gem_id> :obj_getchecksumtag tag_name = double_note_state
	if (<checksum_value> = hidden)
		WaitOneGameFrame
	else
		break
	endif
	repeat
	<gem_id> :Obj_SpawnScriptNow {
		roadie_battle_fade_attack_animate_gem
		params = {
			on_time = <on_time>
			off_time = <off_time>
		}
	}
	if GotParam \{whammy_id}
		<whammy_id> :Obj_SpawnScriptNow {
			roadie_battle_fade_attack_animate_whammy
			params = {
				on_time = <on_time>
				off_time = <off_time>
			}
		}
	endif
endscript

script roadie_battle_fade_attack_animate_gem \{on_time = !f1768515945
		off_time = !f1768515945}
	begin
	Obj_SpawnScriptNow \{roadie_battle_fade_gem_sprite
		params = {
			from_alpha = 1.0
			to_alpha = 0.0
			time = $roadie_battle_gem_fade_time
		}}
	Wait <off_time> Seconds
	Obj_SpawnScriptNow \{roadie_battle_fade_gem_sprite
		params = {
			from_alpha = 0.0
			to_alpha = 1.0
			time = $roadie_battle_gem_fade_time
		}}
	Wait <on_time> Seconds
	repeat
endscript

script roadie_battle_fade_attack_animate_whammy \{on_time = !f1768515945
		off_time = !f1768515945}
	begin
	se_setprops \{alpha = 0.0
		time = $roadie_battle_gem_fade_time}
	Wait <off_time> Seconds
	se_setprops \{alpha = 1.0
		time = $roadie_battle_gem_fade_time}
	Wait <on_time> Seconds
	repeat
endscript

script roadie_battle_stop_fading_gem \{gem_id = !q1768515945}
	<gem_id> :Obj_KillSpawnedScript Name = roadie_battle_synchronize_fade_attack
	<gem_id> :Obj_KillSpawnedScript Name = roadie_battle_fade_attack_animate_gem
	if GotParam \{whammy_id}
		<whammy_id> :Obj_KillSpawnedScript Name = roadie_battle_fade_attack_animate_whammy
	endif
	<gem_id> :obj_getchecksumtag tag_name = double_note_state
	if (<checksum_value> != hidden)
		<gem_id> :obj_setchecksumtag tag_name = disable_fade checksum_value = OFF
		if GotParam \{whammy_id}
			<whammy_id> :obj_setchecksumtag tag_name = disable_fade checksum_value = OFF
		endif
	endif
endscript

script roadie_battle_shake_highway \{Player = !i1768515945}
	get_num_non_vocals_players_onscreen
	get_non_vocalist_player_number Player = <Player>
	get_highway_pos_and_scale num_non_vocals_players = <num_non_vocals_players> non_vocalist_player = <non_vocalist_player> Player = <Player>
	<original_position> = <Pos>
	extendcrcplayer highway_container <Player> out = container_id
	<container_id> :Obj_KillSpawnedScript Name = roadie_battle_animate_shake_highway
	<container_id> :Obj_SpawnScriptNow {
		roadie_battle_animate_shake_highway
		params = {
			original_position = <original_position>
		}
	}
endscript

script roadie_battle_animate_shake_highway \{original_position = 0x69696969}
	<x_amt> = 30
	<y_amt> = 150
	<time> = 0.75
	<decay_amt> = 0.75
	<frames_to_shake> = (<time> / 0.016667)
	CastToInteger \{frames_to_shake}
	<pos_neg> = [-1 , 1]
	begin
	getrandomarrayelement <pos_neg>
	<x_amt> = (<x_amt> * <decay_amt> * <element>)
	getrandomarrayelement <pos_neg>
	<y_amt> = (<y_amt> * <decay_amt> * <element>)
	if (<x_amt> > 0)
		GetRandomValue Name = x_shake a = (<x_amt> / 2.0) b = <x_amt>
	else
		GetRandomValue Name = x_shake a = <x_amt> b = (<x_amt> / 2.0)
	endif
	if (<y_amt> > 0)
		GetRandomValue Name = y_shake a = (<y_amt> / 2.0) b = <y_amt>
	else
		GetRandomValue Name = y_shake a = <y_amt> b = (<y_amt> / 2.0)
	endif
	setpaircomponents shake_vector X = <x_shake> y = <y_shake>
	<new_pos> = (<original_position> + <shake_vector>)
	se_setprops Pos = <new_pos>
	WaitOneGameFrame
	repeat <frames_to_shake>
	se_setprops Pos = <original_position>
endscript

script rb_destroy_when_completed_animating 
	se_waitprops
	Die
endscript

script rb_get_lane_rot_angle \{Player = !i1768515945
		lane = !i1768515945}
	getplayerinfo <Player> lefthanded_gems
	if (<lefthanded_gems> = 1)
		<cur_lane> = (2 + (2 - <lane>))
	else
		<cur_lane> = (2 - (2 - <lane>))
	endif
	<lane_color> = ($gem_colors [<cur_lane>])
	<player_index> = (<Player> - 1)
	<lane_rot_angle> = (($button_models [<player_index>]).<lane_color>.angle)
	return lane_rot_angle = <lane_rot_angle>
endscript

script roadie_battle_start_hyperspeed_effects \{Player = !i1768515945
		hyperspeed_scale = !f1768515945}
	<player_index> = (<Player> - 1)
	<old_hyperspeed_element> = ($roadie_battle_hyperspeed_element [<player_index>])
	if ScreenElementExists id = <old_hyperspeed_element>
		DestroyScreenElement id = <old_hyperspeed_element>
	endif
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_hyperspeed_target
		index = <player_index>
		NewValue = <hyperspeed_scale>
	}
	get_highway_hud_root_id Player = <Player>
	CreateScreenElement {
		parent = <highway_hud_root>
		Type = ContainerElement
		just = [center center]
		pos_anchor = [center center]
		Pos = (0.0, -40.0)
		alpha = 0.25
	}
	<container_id> = <id>
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_hyperspeed_element
		index = <player_index>
		NewValue = <container_id>
	}
	roadie_battle_hyperspeed_ramp_speed Player = <Player> target_hyperspeed = <hyperspeed_scale>
	<base_scale> = 1.0
	getnumplayersingame
	switch (<num_players>)
		case 1
		<Pos> = (0.0, -40.0)
		<base_scale> = 1.0
		case 2
		<Pos> = (0.0, 40.0)
		<base_scale> = 1.0
		case 3
		<Pos> = (0.0, 20.0)
		<base_scale> = 0.8
		case 4
		<Pos> = (0.0, 20.0)
		<base_scale> = 0.8
	endswitch
	<i> = 1
	begin
	if (<i> = 1)
		<rgba> = [0 , 0 , 255 , 255]
		<z_priority> = -9.0
		<Scale> = (9.5 * <base_scale>)
	else
		<rgba> = [127 , 127 , 255 , 255]
		<z_priority> = -12.0
		<Scale> = (6.5 * <base_scale>)
	endif
	CreateScreenElement {
		parent = <container_id>
		Type = SpriteElement
		texture = hyperspeed_sparkle
		just = [center center]
		pos_anchor = [center center]
		Pos = <Pos>
		blend = add
		Scale = <Scale>
		rgba = <rgba>
		z_priority = <z_priority>
	}
	<id> :Obj_SpawnScriptNow {
		roadie_battle_animate_hyperspeed_sparkle
		params = {
			i = <i>
			Player = <Player>
			final_scale = <Scale>
		}
	}
	<i> = (<i> + 1)
	repeat 2
	runscriptforeachgem {
		Player = <Player>
		script_name = roadie_battle_maybe_create_hyperspeed_gem_effects
		script_params = {}
	}
endscript

script roadie_battle_end_hyperspeed_effects \{Player = !i1768515945}
	<player_index> = (<Player> - 1)
	<container_id> = ($roadie_battle_hyperspeed_element [<player_index>])
	<container_id> :Obj_SpawnScriptNow {
		roadie_battle_hyperspeed_container_reaper
		params = {
			Player = <Player>
		}
	}
	formatText checksumName = morph_scroll_speed_id 'morph_scroll_speed%p' p = <Player>
	KillSpawnedScript id = <morph_scroll_speed_id>
	roadie_battle_hyperspeed_ramp_speed Player = <Player> target_hyperspeed = 1.0
endscript

script roadie_battle_hyperspeed_ramp_speed \{Player = !i1768515945
		target_hyperspeed = !f1768515945}
	getplayerinfo <Player> Hyperspeed out = current_hyperspeed
	<change_time> = ((<target_hyperspeed> - <current_hyperspeed>) / $roadie_battle_hyperspeed_change_per_second)
	if (<change_time> < 0.0)
		<change_time> = (0.0 - <change_time>)
	endif
	setplayerinfo <Player> roadie_battle_scroll_blend_time = <change_time>
	setplayerinfo <Player> Hyperspeed = <target_hyperspeed>
endscript

script roadie_battle_animate_hyperspeed_sparkle \{Player = !i1768515945
		i = !i1768515945
		final_scale = !f1768515945}
	<odd_even> = 0
	<target_hyperspeed> = ($roadie_battle_hyperspeed_target [(<Player> - 1)])
	begin
	<base_scale> = RandomFloat (0.9, 1.1)
	getplayerinfo <Player> Hyperspeed
	<hyperspeed_ratio> = ((1.0 - <Hyperspeed>) / (1.0 - <target_hyperspeed>))
	if (<i> = 1)
		<Scale> = (<final_scale> * <base_scale> * <hyperspeed_ratio>)
	else
		<Scale> = (<final_scale> * <base_scale> * <hyperspeed_ratio> * <hyperspeed_ratio>)
	endif
	if (<odd_even> > 0)
		se_setprops {
			rot_angle = RandomFloat (0.0, 360.0)
		}
	endif
	se_setprops {
		Scale = <Scale>
	}
	<odd_even> = (1 - <odd_even>)
	WaitOneGameFrame
	repeat
endscript

script roadie_battle_maybe_create_hyperspeed_gem_effects \{Player = !i1768515945
		gem_id = !q1768515945
		gem_type = !q1768515945}
	if ($roadie_battle_lod = 0)
		CreateScreenElement {
			Type = SpriteElement
			parent = <gem_id>
			texture = hyperspeed_gem_glow
			Pos = (0.0, 0.0)
			just = [center , center]
			pos_anchor = [center , center]
			blend = add
			z_priority = 6.15
		}
		<id> :Obj_SpawnScriptNow {
			roadie_battle_fade_hyperspeed_glow
			params = {
				Player = <Player>
			}
		}
		<gem_id> :Obj_SpawnScriptNow {
			roadie_battle_spawn_hypertrail_segments
			params = {
				Player = <Player>
			}
		}
	endif
endscript

script roadie_battle_fade_hyperspeed_glow \{Player = !i1768515945}
	<target_hyperspeed> = ($roadie_battle_hyperspeed_target [(<Player> - 1)])
	begin
	getplayerinfo <Player> Hyperspeed
	<hyperspeed_ratio> = ((1.0 - <Hyperspeed>) / (1.0 - <target_hyperspeed>))
	se_setprops alpha = (0.3 * <hyperspeed_ratio>)
	WaitOneGameFrame
	repeat
endscript

script roadie_battle_spawn_hypertrail_segments \{Player = !i1768515945}
	Obj_GetID
	se_getparentid
	<target_hyperspeed> = ($roadie_battle_hyperspeed_target [(<Player> - 1)])
	begin
	obj_getchecksumtag \{tag_name = double_note_state}
	if (<checksum_value> != hidden)
		GetScreenElementPosition id = <objID> local
		getscreenelementscale id = <objID>
		getplayerinfo <Player> Hyperspeed
		<hyperspeed_ratio> = ((1.0 - <Hyperspeed>) / (1.0 - <target_hyperspeed>))
		<alpha> = (0.5 * <hyperspeed_ratio>)
		CreateScreenElement {
			Type = SpriteElement
			parent = <parent_id>
			texture = hyperspeed_trail
			Pos = <screenelementpos>
			Scale = <Scale>
			just =
			[
				0.0
				0.75
			]
			pos_anchor =
			[
				-1.0
				-1.0
			]
			blend = add
			z_priority = 3
			alpha = <alpha>
		}
		<id> :Obj_SpawnScriptNow roadie_battle_fade_hypertrail_segment
	endif
	Wait \{0.1
		Seconds}
	repeat
endscript

script roadie_battle_fade_hypertrail_segment 
	se_setprops \{alpha = 0
		time = 0.5
		Scale = (0.25, 2.0)
		Pos = {
			(0.0, 50.0)
			relative
		}}
	se_waitprops
	Die
endscript

script roadie_battle_hyperspeed_container_reaper \{Player = !i1768515945}
	begin
	getplayerinfo <Player> Hyperspeed
	if (<Hyperspeed> = 1.0)
		break
	endif
	WaitOneGameFrame
	repeat
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_hyperspeed_element
		index = (<Player> - 1)
		NewValue = None
	}
	Die
endscript

script roadie_battle_start_double_note_effect \{Player = !i1768515945
		double_note_spawn_mark = !f1768515945}
	calculategempositionandscale Player = <Player> lane = 2 fraction = <double_note_spawn_mark>
	<player_index> = (<Player> - 1)
	setstructureparam {
		array_name = roadie_battle_double_note_params
		array_index = <player_index>
		param = spawn_y
		value = <pos_y>
	}
	setpaircomponents Scale X = <scale_x> y = <scale_y>
	setstructureparam {
		array_name = roadie_battle_double_note_params
		array_index = <player_index>
		param = Scale
		value = <Scale>
	}
	extendcrcplayer fretbar_container <Player> out = fretbar_container
	<highway_height> = ($highway_pos_table [<player_index>].highway_height)
	<highway_top_width> = ($highway_pos_table [<player_index>].highway_top_width)
	setpaircomponents glow_dims X = (<highway_top_width> * 2) y = <highway_height>
	CreateScreenElement {
		Type = SpriteElement
		parent = <fretbar_container>
		material = mat_sidebar_glow_02
		Pos = (0.0, 500.0)
		rot_angle = 0
		dims = <glow_dims>
		just = [center center]
		pos_anchor = [center center]
		z_priority = 1.1
		blend = add
		rgba = [177 69 200 100]
	}
	<id> :Obj_SpawnScriptNow roadie_battle_animate_double_note_highway_glow
	setstructureparam {
		array_name = roadie_battle_double_note_params
		array_index = <player_index>
		param = glow_id
		value = <id>
	}
	roadie_battle_shake_highway Player = <Player>
	getplayerinfo <Player> controller
	activatestarpowerpulse Player = <controller> num = 1 length = 35 Strength = 20 Priority = 100
	getplayerinfo Player = <Player> part
	<array> = []
	if (<part> != drum)
		GetArraySize \{$gem_colors}
		getnumplayersingame
		<i> = 0
		begin
		<Color> = ($gem_colors [<i>])
		<color_string> = ($button_up_models [<player_index>].<Color>.name_string)
		formatText checksumName = string_id '%s_stringp%p' s = <color_string> p = <Player>
		if ScreenElementExists id = <string_id>
			getscreenelementscale id = <string_id>
			if (<num_players> > 1)
				setpaircomponents glow_scale X = ((<Scale> [0]) * 0.75) y = (<Scale> [1] * 1.4)
			else
				setpaircomponents glow_scale X = ((<Scale> [0]) * 0.75) y = (<Scale> [1])
			endif
			CreateScreenElement {
				Type = SpriteElement
				parent = <string_id>
				texture = attack_instrument_stringglow
				blend = add
				pos_anchor = [center center]
				Pos = (0.0, 0.0)
				just = [center center]
				Scale = <glow_scale>
				z_priority = 3.9
				alpha = 0.2
				rgba = [200 150 230 255]
			}
			AddArrayElement array = <array> element = <id>
		endif
		formatText checksumName = catcher_id '%s_lipp%p' s = <color_string> p = <Player>
		if ScreenElementExists id = <catcher_id>
			CreateScreenElement {
				Type = SpriteElement
				parent = <catcher_id>
				texture = mat_nb_5d_orange_cap_lit_pos2
				blend = add
				pos_anchor = [center center]
				Pos = (0.0, 0.0)
				just = [center center]
				z_priority = 4.0
				alpha = 0.2
				rgba = [200 150 230 255]
			}
			AddArrayElement array = <array> element = <id>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		(<array> [0]) :Obj_SpawnScriptNow {
			roadie_battle_animate_double_note_strings
			params = {
				string_glow_ids = <array>
			}
		}
	endif
	setstructureparam {
		array_name = roadie_battle_double_note_params
		array_index = <player_index>
		param = string_glow_ids
		value = <array>
	}
endscript

script roadie_battle_stop_double_note_effect \{Player = !i1768515945}
	<player_index> = (<Player> - 1)
	<glow_id> = ($roadie_battle_double_note_params [<player_index>].glow_id)
	if ScreenElementExists id = <glow_id>
		DestroyScreenElement id = <glow_id>
	endif
	<string_glow_ids> = ($roadie_battle_double_note_params [<player_index>].string_glow_ids)
	GetArraySize <string_glow_ids>
	if (<array_Size> > 0)
		<i> = 0
		begin
		if ScreenElementExists id = (<string_glow_ids> [<i>])
			DestroyScreenElement id = (<string_glow_ids> [<i>])
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_double_note_params
		index = <player_index>
		NewValue = {}
	}
endscript

script roadie_battle_maybe_spawn_double_note_gem_effect \{Player = !i1768515945
		gem_id = !q1768515945}
	<gem_id> :obj_getchecksumtag tag_name = double_note_state
	if (<checksum_value> != not_double_note)
		<gem_id> :se_setprops alpha = 0
		if GotParam \{whammy_id}
			<whammy_id> :se_setprops alpha = 0
		endif
		<gem_id> :obj_setchecksumtag tag_name = disable_fade checksum_value = On
		if GotParam \{whammy_id}
			<whammy_id> :obj_setchecksumtag tag_name = disable_fade checksum_value = On
		endif
		<gem_id> :Obj_SpawnScriptNow {
			roadie_battle_double_note_gem_effect
			params = {
				Player = <Player>
				gem_id = <gem_id>
				whammy_id = <whammy_id>
			}
		}
	endif
endscript

script roadie_battle_double_note_gem_effect \{Player = !i1768515945
		gem_id = !q1768515945}
	<spawn_y> = ($roadie_battle_double_note_params [(<Player> - 1)].spawn_y)
	<Scale> = ($roadie_battle_double_note_params [(<Player> - 1)].Scale)
	begin
	WaitOneGameFrame
	GetScreenElementPosition id = <gem_id> local
	if ((<screenelementpos> [1]) >= <spawn_y>)
		break
	endif
	repeat
	<gem_fade_time> = 0.05
	<gem_id> :Obj_SpawnScriptNow {
		roadie_battle_fade_gem_sprite
		params = {
			from_alpha = 0.0
			to_alpha = 1.0
			time = <gem_fade_time>
		}
	}
	if GotParam \{whammy_id}
		<whammy_id> :se_setprops alpha = 1.0 time = <gem_fade_time>
	endif
	if ($roadie_battle_lod = 0)
		<gem_id> :se_getparentid
		CreateScreenElement {
			Type = SpriteElement
			parent = <parent_id>
			texture = attack_doublenote_glowwipe
			just = [center center]
			pos_anchor = [center center]
			blend = add
			z_priority = 3
			alpha = 0.0
			rgba = [200 190 230 255]
		}
		<id> :Obj_SpawnScriptNow {
			roadie_battle_animate_double_note_wipe
			params = {
				base_scale = <Scale>
			}
		}
		<id> :Obj_SpawnScriptNow {
			roadie_battle_move_double_note_wipe
			params = {
				gem_id = <gem_id>
			}
		}
	endif
	Wait <gem_fade_time> Seconds
	if ($roadie_battle_lod = 0)
		<gem_id> :obj_getintegertag tag_name = is_white_gem
		<is_white_gem> = <integer_value>
		getplayerinfo Player = <Player> part
		<overlay_pos> = (0.0, 0.0)
		if (<part> = drum)
			if (<is_white_gem> = 1)
				<overlay_texture> = attack_doublenote_kickdrumgemoverlay
			else
				<overlay_texture> = attack_doublenote_drumgemoverlay
				<overlay_pos> = (0.0, 15.0)
			endif
		else
			<overlay_texture> = attack_doublenote_gemoverlay
			<overlay_pos> = (0.0, 15.0)
		endif
		CreateScreenElement {
			Type = SpriteElement
			parent = <gem_id>
			Pos = <overlay_pos>
			texture = <overlay_texture>
			just = [center center]
			pos_anchor = [center center]
			blend = add
			z_priority = 6
			alpha = 1.0
		}
		<id> :Obj_SpawnScriptNow roadie_battle_fade_double_note_overlay
		<overlay_count> = 0
		<overlay_directions> = [left right]
		begin
		CreateScreenElement {
			Type = SpriteElement
			parent = <gem_id>
			Pos = <overlay_pos>
			texture = <overlay_texture>
			just = [center center]
			pos_anchor = [center center]
			blend = add
			z_priority = 6
			alpha = 0.5
		}
		<id> :Obj_SpawnScriptNow {
			roadie_battle_animate_double_note_teleport
			params = {
				direction = (<overlay_directions> [<overlay_count>])
			}
		}
		<overlay_count> = (<overlay_count> + 1)
		repeat 2
	endif
	<gem_id> :obj_setchecksumtag tag_name = double_note_state checksum_value = visible
	<gem_id> :obj_setchecksumtag tag_name = disable_fade checksum_value = OFF
	if GotParam \{whammy_id}
		<whammy_id> :obj_setchecksumtag tag_name = disable_fade checksum_value = OFF
	endif
endscript

script roadie_battle_fade_double_note_overlay 
	se_setprops \{alpha = 0.0
		time = 0.3}
	se_waitprops
	Die
endscript

script roadie_battle_animate_double_note_wipe \{base_scale = 0x69696969}
	setpaircomponents start_scale X = (<base_scale> [0] * 2.5) y = 0
	setpaircomponents target_scale X = (<start_scale> [0]) y = (<base_scale> [1] * 1.5)
	se_setprops Scale = <start_scale>
	se_setprops Scale = <target_scale> alpha = 0.5 time = 0.15
	se_waitprops
	se_setprops \{alpha = 0.0
		time = 0.25}
	se_waitprops
	Die
endscript

script roadie_battle_move_double_note_wipe \{gem_id = !q1768515945}
	begin
	if NOT ScreenElementExists id = <gem_id>
		break
	endif
	GetScreenElementPosition id = <gem_id> local
	setpaircomponents Pos X = 0 y = (<screenelementpos> [1])
	se_setprops Pos = <Pos>
	WaitOneGameFrame
	repeat
endscript

script roadie_battle_animate_double_note_teleport \{direction = 0x00000018}
	switch (<direction>)
		case left
		<slide_pos> = (-75.0, 15.0)
		case right
		<slide_pos> = (75.0, 15.0)
	endswitch
	se_setprops Pos = <slide_pos> alpha = 0 time = 0.4
	se_waitprops
	Die
endscript

script roadie_battle_animate_double_note_highway_glow 
	begin
	se_setprops \{alpha = 0
		time = 0.5}
	se_waitprops
	se_setprops \{alpha = 1
		time = 0.5}
	se_waitprops
	repeat
endscript

script roadie_battle_animate_double_note_strings \{string_glow_ids = !a1768515945}
	GetArraySize <string_glow_ids>
	begin
	setpaircomponents random_pos X = RandomInteger (-3.0, 3.0) y = 0
	<random_alpha> = RandomFloat (0.3, 0.65000004)
	<random_time> = RandomFloat (0.05, 0.1)
	<i> = 0
	begin
	(<string_glow_ids> [<i>]) :se_setprops Pos = <random_pos> alpha = <random_alpha> time = <random_time>
	<i> = (<i> + 1)
	repeat <array_Size>
	Wait <random_time> Seconds
	repeat
endscript

script roadie_battle_fade_gem_sprite \{from_alpha = !f1768515945
		to_alpha = !f1768515945
		time = !f1768515945}
	<seconds_elapsed> = 0.0
	<done> = FALSE
	begin
	WaitOneGameFrame
	if ($pause_grace_period < 0)
		getframelength
		<seconds_elapsed> = (<seconds_elapsed> + <frame_length>)
		if (<seconds_elapsed> >= <time>)
			<alpha> = <to_alpha>
			<done> = true
		else
			<alpha> = (<from_alpha> + ((<to_alpha> - <from_alpha>) * (<seconds_elapsed> / <time>)))
		endif
		se_setprops alpha = <alpha>
		if (<done> = true)
			break
		endif
	endif
	repeat
endscript

script roadie_battle_start_mine_effect \{Player = !i1768515945}
	<player_index> = (<Player> - 1)
	<old_speaker_id> = ($roadie_battle_mine_attack_params [<player_index>].speaker_id)
	if ScreenElementExists id = <old_speaker_id>
		DestroyScreenElement id = <old_speaker_id>
	endif
	calculategempositionandscale Player = <Player> lane = 2 fraction = $rb_bomb_highway_percentage
	<spawn_y> = <pos_y>
	extendcrcplayer highway_container <Player> out = highway_id
	CreateScreenElement {
		Type = SpriteElement
		parent = <highway_id>
		pos_anchor = [center bottom]
		just = [center bottom]
		texture = attack_mine_speaker
		z_priority = 9
		flip_v = true
	}
	<id> :Obj_SpawnScriptNow {
		roadie_battle_animate_speaker_intro
		params = {
			spawn_y = <spawn_y>
			Player = <Player>
		}
	}
	<speaker_id> = <id>
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_mine_attack_params
		index = <player_index>
		NewValue = {
			spawn_y = <spawn_y>
			speaker_id = <speaker_id>
		}
	}
endscript

script roadie_battle_animate_speaker_intro \{spawn_y = !f1768515945
		Player = !i1768515945}
	Obj_GetID
	getnumplayersingame
	switch (<num_players>)
		case 1
		<start_pos> = (155.0, -30.0)
		<scale_vector> = (0.9, 0.9)
		<squash_vector> = (1.05, 0.75)
		case 2
		<start_pos> = (150.0, -10.0)
		<scale_vector> = (0.75, 0.75)
		<squash_vector> = (0.9, 0.65000004)
		case 3
		<start_pos> = (135.0, -20.0)
		<scale_vector> = (0.65000004, 0.65000004)
		<squash_vector> = (0.75, 0.55)
		case 4
		<start_pos> = (100.0, 0.0)
		<scale_vector> = (0.45000002, 0.45000002)
		<squash_vector> = (0.55, 0.4)
	endswitch
	setpaircomponents end_pos X = (<start_pos> [0]) y = (<spawn_y> - <start_pos> [1])
	se_setprops Pos = <start_pos> Scale = <scale_vector>
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		Pos = (0.0, 0.0)
		pos_anchor = [center center]
		just = [center center]
		texture = attack_mine_speakerfire
		Scale = 2.0
		relative_z_priority = 1
		blend = add
		alpha = 0
		flip_v = true
	}
	<speakerfire_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		Pos = (0.0, 0.0)
		pos_anchor = [center center]
		just = [center center]
		texture = attack_mine_speakercone
		Scale = 2.0
		relative_z_priority = 1
		flip_v = true
	}
	<speakercone_id> = <id>
	se_setprops Pos = <end_pos> time = 0.65000004 motion = ease_in
	se_waitprops
	se_setprops Scale = <squash_vector> time = 0.05 motion = ease_out
	se_waitprops
	se_setprops Scale = <scale_vector> time = 0.06 motion = ease_out
	roadie_battle_shake_highway Player = <Player>
	getplayerinfo <Player> controller
	activatestarpowerpulse Player = <controller> num = 1 length = 35 Strength = 20 Priority = 100
	Wait \{0.33
		Seconds}
	roadie_battle_fire_speaker_sparks Player = <Player>
	<speakerfire_id> :Obj_SpawnScriptNow roadie_battle_animate_speaker_fire
	DestroyScreenElement id = <speakercone_id>
	Obj_SpawnScriptNow \{roadie_battle_shake_speaker}
endscript

script roadie_battle_shake_speaker 
	getnumplayersingame
	switch (<num_players>)
		case 1
		<x_scale> = RandomFloat (0.97499996, 1.025)
		<y_scale> = RandomFloat (0.97499996, 1.025)
		case 2
		<x_scale> = RandomFloat (0.72499996, 0.775)
		<y_scale> = RandomFloat (0.72499996, 0.775)
		case 3
		<x_scale> = RandomFloat (0.625, 0.675)
		<y_scale> = RandomFloat (0.625, 0.675)
		case 4
		<x_scale> = RandomFloat (0.425, 0.475)
		<y_scale> = RandomFloat (0.425, 0.475)
	endswitch
	begin
	setpaircomponents Scale X = <x_scale> y = <y_scale>
	se_setprops rot_angle = RandomFloat (-1.0, 1.0) Scale = <Scale> time = 0.031999998
	Wait \{2
		gameframes}
	repeat
endscript

script roadie_battle_animate_speaker_fire 
	<min_alpha> = 0.5
	<max_alpha> = 1.0
	<fade_time> = 0.03
	<min_delay_time> = 0.0
	<max_delay_time> = 0.06
	begin
	GetRandomValue a = <min_alpha> b = <max_alpha> Name = alpha
	se_setprops alpha = <alpha> time = <fade_time>
	se_waitprops
	GetRandomValue a = <min_delay_time> b = <max_delay_time> Name = delay_time
	Wait <delay_time> Seconds
	repeat
endscript

script rb_speaker_fire_flash 
	Obj_GetID
	<alpha> = 0
	<on_time> = 0.5
	<fade_in_step> = 0.5
	<fade_out_step> = 0.3
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = attack_amp_flash
		Pos = (-110.0, 60.0)
		just = [center center]
		pos_anchor = [center center]
		rot_angle = 180
		Scale = (3.0, 2.0)
		blend = add
		z_priority = 5
		rgba = [255 170 150 180]
		alpha = <alpha>
	}
	begin
	<alpha> = (<alpha> + <fade_in_step>)
	if (<alpha> > 0.6)
		<alpha> = 0.6
		<id> :se_setprops alpha = <alpha>
		break
	endif
	<id> :se_setprops alpha = <alpha>
	WaitOneGameFrame
	repeat
	Wait <on_time> Seconds
	begin
	<alpha> = (<alpha> - <fade_out_step>)
	if (<alpha> < 0)
		<alpha> = 0
		<id> :se_setprops alpha = <alpha>
		break
	endif
	<id> :se_setprops alpha = <alpha>
	WaitOneGameFrame
	repeat
	DestroyScreenElement id = <id>
endscript

script roadie_battle_stop_mine_effect \{Player = !i1768515945}
	<speaker_id> = ($roadie_battle_mine_attack_params [(<Player> - 1)].speaker_id)
	if ScreenElementExists id = <speaker_id>
		<speaker_id> :Obj_SpawnScriptNow {
			roadie_battle_fade_and_kill_speaker
			params = {
				Player = <Player>
			}
		}
	endif
endscript

script roadie_battle_fade_and_kill_speaker \{Player = !i1768515945}
	se_setprops \{alpha = 0
		time = 0.5}
	se_waitprops
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_mine_attack_params
		index = (<Player> - 1)
		NewValue = {}
	}
	Die
endscript

script roadie_battle_maybe_spawn_mine_gem_effect \{Player = !i1768515945
		gem_id = !q1768515945
		gem_type = !q1768515945}
	if (<gem_type> = mine)
		<gem_id> :Obj_SpawnScriptNow {
			roadie_battle_mine_gem_effect
			params = {
				Player = <Player>
			}
		}
	endif
endscript

script roadie_battle_mine_gem_effect \{Player = !i1768515945}
	Obj_GetID
	<spawn_y> = ($roadie_battle_mine_attack_params [(<Player> - 1)].spawn_y)
	begin
	GetScreenElementPosition id = <objID> local
	if ((<screenelementpos> [1]) > <spawn_y>)
		break
	endif
	WaitOneGameFrame
	repeat 60
	roadie_battle_fire_speaker_sparks Player = <Player>
	se_setprops \{material = rb_button_bomb01
		alpha = 0.2}
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 1.0)
	<start_frame> = ((1.0, 0.0) * <u> + (0.0, 1.0) * <v>)
	<Flip> = RandomInteger (0.0, 1.0)
	if (<Flip> = 0)
		flip_v = FALSE
	else
		flip_v = true
	endif
	if ($roadie_battle_lod = 0)
		CreateScreenElement {
			Type = SpriteElement
			parent = <objID>
			texture = rb_lightinganim_frames
			Pos = (0.0, -10.0)
			just = [center , center]
			pos_anchor = [center , center]
			use_animated_uvs = true
			top_down_v
			flip_v
			frame_length = 0.05
			num_uv_frames = (4.0, 2.0)
			loop_animated_uvs = true
			Scale = 0.25
			blend = add
			z_priority = 4.25
			current_frames = <start_frame>
		}
	endif
	<flash_time> = 0.25
	begin
	Wait <flash_time> Seconds
	se_setprops \{material = rb_button_bomb02}
	Wait <flash_time> Seconds
	se_setprops \{material = rb_button_bomb01}
	repeat
endscript

script roadie_battle_fire_speaker_sparks \{Player = !i1768515945}
	<speaker_id> = ($roadie_battle_mine_attack_params [(<Player> - 1)].speaker_id)
	if ScreenElementExists id = <speaker_id>
		<speaker_id> :Obj_SpawnScriptNow roadie_battle_animate_speaker_sparks
	endif
	SoundEvent \{event = rb_speakersparks}
endscript

script roadie_battle_animate_speaker_sparks 
	Obj_GetID
	GetRandomValue \{Name = rot
		a = 5
		b = 10}
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = attack_mine_speakersparks
		Pos = (0.0, 0.0)
		just = [right center]
		pos_anchor = [right center]
		use_animated_uvs = true
		frame_length = 0.031999998
		num_uv_frames = (4.0, 6.0)
		blend = add
		Scale = (1.3499999, 1.0)
		z_priority = 12.0
		top_down_v
		loop_animated_uvs = FALSE
		flip_v = true
	}
	<spark_id> = <id>
	Obj_SpawnScriptNow \{rb_speaker_fire_flash}
	Obj_KillSpawnedScript \{Name = roadie_battle_shake_speaker}
	se_setprops rot_angle = <rot> time = 0.1
	se_waitprops
	se_setprops \{rot_angle = 0
		time = 0.1
		motion = ease_out}
	se_waitprops
	se_setprops rot_angle = (<rot> / -2) time = 0.08 motion = ease_out
	se_waitprops
	se_setprops \{rot_angle = 0
		time = 0.06
		motion = ease_out}
	Obj_SpawnScriptNow \{roadie_battle_shake_speaker}
	Wait \{1.3199999
		Seconds}
	DestroyScreenElement id = <spark_id>
endscript

script roadie_battle_start_lane_fires \{Player = !i1768515945
		num_flames = !i1768515945
		num_lanes = !i1768515945}
	extendcrcplayer gem_notes_container <Player> out = gem_container_id
	CreateScreenElement {
		Type = ContainerElement
		parent = <gem_container_id>
	}
	<container_id> = <id>
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_lane_fire_element
		index = (<Player> - 1)
		NewValue = <container_id>
	}
	roadie_battle_pick_strings Player = <Player> num_strings = <num_lanes>
	GetArraySize \{$roadie_battle_string_masks}
	<i> = 0
	begin
	<picked_mask> = ($roadie_battle_string_masks [<i>])
	if (<picked_mask> && <string_mask>)
		<container_id> :Obj_SpawnScriptNow {
			roadie_battle_start_lane_fire
			params = {
				Player = <Player>
				container_id = <container_id>
				lane = <i>
				num_flames = <num_flames>
			}
		}
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script roadie_battle_start_lane_fire \{Player = !i1768515945
		container_id = !q1768515945
		lane = !i1768515945
		num_flames = !i1768515945}
	<highway_fraction> = 0.0
	<highway_step> = (1.0 / <num_flames>)
	array = []
	begin
	calculategempositionandscale Player = <Player> lane = <lane> fraction = <highway_fraction>
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	<start_frame> = ((1.0, 0.0) * <u> + (0.0, 1.0) * <v>)
	switch (<lane>)
		case 0
		<pos_x> = (<pos_x> - (<highway_fraction> * 25))
		case 1
		<pos_x> = (<pos_x> - (<highway_fraction> * 12))
		case 3
		<pos_x> = (<pos_x> + (<highway_fraction> * 12))
		case 4
		<pos_x> = (<pos_x> + (<highway_fraction> * 25))
	endswitch
	setpaircomponents Pos X = <pos_x> y = <pos_y>
	setpaircomponents Scale X = <scale_x> y = <scale_y>
	<framerate> = (1.0 / 30.0)
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = rb_highway_fire
		Pos = <Pos>
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		rot_angle = 0
		use_animated_uvs = true
		top_down_v
		frame_length = <framerate>
		num_uv_frames = (4.0, 4.0)
		current_frames = <start_frame>
		Scale = <Scale>
		z_priority = 20
		loop_animated_uvs = true
		alpha = 0
	}
	AddArrayElement array = <array> element = {flame_id = <id> highway_fraction = <highway_fraction>}
	<highway_fraction> = (<highway_fraction> + <highway_step>)
	repeat <num_flames>
	rb_get_lane_rot_angle Player = <Player> lane = <lane>
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = attack_firefx_fireballanim
		just = [center , center]
		pos_anchor = [center , center]
		use_animated_uvs = true
		top_down_v
		frame_length = 0.015999999
		num_uv_frames = (4.0, 2.0)
		z_priority = 30
		loop_animated_uvs = true
		blend = add
		rot_angle = <lane_rot_angle>
		alpha = 1
	}
	<fireball_id> = <id>
	<highway_fraction> = 0.0
	<fireball_speed> = (1.0 / 0.6)
	<flame_index> = 0
	begin
	if (<highway_fraction> > 1.0)
		break
	endif
	calculategempositionandscale Player = <Player> lane = <lane> fraction = <highway_fraction>
	setpaircomponents Pos X = <pos_x> y = <pos_y>
	setpaircomponents Scale X = (<scale_x> * 0.5) y = (<scale_y> * 0.5)
	<fireball_id> :se_setprops Pos = <Pos> Scale = <Scale>
	if (<flame_index> < <num_flames>)
		if (<highway_fraction> >= (<array> [<flame_index>].highway_fraction))
			<flame_id> = (<array> [<flame_index>].flame_id)
			<flame_id> :Obj_SpawnScriptNow rb_animate_flame_properties params = {Scale = <Scale>}
			<flame_index> = (<flame_index> + 1)
		endif
	endif
	getframelength
	<highway_fraction> = (<highway_fraction> + (<fireball_speed> * <frame_length>))
	Wait \{1
		Frame}
	repeat
	<container_id> :Obj_SpawnScriptNow rb_highway_fire_lane_glow params = {Player = <Player> lane = <lane> parent = <container_id>}
	calculategempositionandscale Player = <Player> lane = <lane> fraction = 0.95
	switch (<lane>)
		case 0
		<pos_x> = (<pos_x> - 35)
		case 1
		<pos_x> = (<pos_x> - 12)
		case 3
		<pos_x> = (<pos_x> + 12)
		case 4
		<pos_x> = (<pos_x> + 35)
	endswitch
	<framerate> = (1.0 / 30)
	setpaircomponents Pos X = <pos_x> y = (<pos_y> + 30)
	setpaircomponents Scale X = <scale_x> y = <scale_y>
	<Scale> = (<Scale> * 0.45000002)
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	setpaircomponents start_frame X = <u> y = <v>
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = rb_highway_fire
		Pos = <Pos>
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		rot_angle = <rotation>
		use_animated_uvs = true
		top_down_v
		frame_length = <framerate>
		num_uv_frames = (4.0, 4.0)
		current_frames = <start_frame>
		Scale = <Scale>
		z_priority = 20
		loop_animated_uvs = true
		alpha = 0
	}
	<big_flame_id> = <id>
	<big_flame_id> :se_setprops alpha = 0.8 time = 0.1
	DestroyScreenElement id = <fireball_id>
	roadie_battle_shake_highway Player = <Player>
	getplayerinfo <Player> controller
	activatestarpowerpulse Player = <controller> num = 1 length = 35 Strength = 20 Priority = 100
	if ($roadie_battle_lod = 0)
		begin
		<init_rot_angle> = RandomInteger (-270.0, 270.0)
		if (<init_rot_angle> > 0)
			<neg> = -1
		else
			<neg> = 1
		endif
		<Flip> = RandomInteger (0.0, 1.0)
		if (<Flip> = 0)
			<flip_param> = true
		else
			<flip_param> = FALSE
		endif
		<init_scale> = RandomFloat (1.2, 1.5)
		<Scale> = <init_scale>
		<pos_x> = RandomFloat (-50.0, 50.0)
		<pos_y> = 20
		setpaircomponents Pos X = <pos_x> y = <pos_y>
		CreateScreenElement {
			Type = SpriteElement
			parent = <big_flame_id>
			texture = rb_highway_smoke2
			Pos = <Pos>
			just = [center , center]
			pos_anchor = [center , center]
			Scale = <Scale>
			flip_v = <flip_param>
			rot_angle = <init_rot_angle>
			blend = add
			alpha = 1
			rgba = [250 250 250 220]
			z_priority = 21
		}
		<LifeTime> = RandomFloat (1.5, 2.0)
		<dest_rgba> = [200 200 200 0]
		<mod_x> = RandomFloat (-10.0, 10.0)
		<dest_x> = (<mod_x> + <pos_x>)
		<rand_height> = RandomFloat (-100.0, -130.0)
		<dest_y> = (<LifeTime> * <rand_height>)
		setpaircomponents new_pos X = <dest_x> y = <dest_y>
		<mod_scale> = RandomFloat (1.1, 1.2)
		<dest_scale> = (<mod_scale> * <Scale>)
		<dest_rot_angle> = RandomInteger (0.0, 270.0)
		<dest_rot_angle> = (<dest_rot_angle> * <neg>)
		<id> :se_setprops alpha = 0.8 rot_angle = <dest_rot_angle> Pos = <new_pos> Scale = <dest_scale> time = <LifeTime> rgba = <dest_rgba>
		<id> :Obj_SpawnScriptNow rb_destroy_when_completed_animating
		<wait_t> = RandomFloat (0.3, 0.4)
		Wait <wait_t> Seconds
		repeat
	endif
endscript

script rb_animate_flame_properties \{Scale = 0x69696969}
	<dest_rgba> = [255 255 255 255]
	<start_scale> = (<Scale> * 0.6)
	se_setprops Scale = (<start_scale> * 1.2) alpha = 1
	begin
	SetArrayElement ArrayName = dest_rgba index = 0 NewValue = (RandomInteger (220.0, 255.0))
	SetArrayElement ArrayName = dest_rgba index = 1 NewValue = (RandomInteger (170.0, 190.0))
	SetArrayElement ArrayName = dest_rgba index = 2 NewValue = (RandomInteger (60.0, 80.0))
	SetArrayElement ArrayName = dest_rgba index = 3 NewValue = (RandomInteger (200.0, 255.0))
	GetRandomValue \{Name = nudge
		a = 0.85
		b = 1.15}
	<dest_scale> = (<start_scale> * <nudge>)
	<shift_time> = RandomFloat (0.433, 0.633)
	se_setprops rgba = <dest_rgba> Scale = <dest_scale> time = <shift_time>
	se_waitprops
	repeat
endscript

script rb_highway_fire_lane_glow \{Player = !i1768515945
		lane = !i1768515945
		parent = !q1768515945}
	calculategempositionandscale Player = <Player> lane = <lane> fraction = 0.8
	getnumplayersingame
	switch (<num_players>)
		case 1
		<Scale> = (14.0, 4.0)
		<pos_y> = (<pos_y> + 20)
		case 2
		<Scale> = (14.0, 4.0)
		<pos_y> = (<pos_y> + 20)
		case 3
		<Scale> = (14.0, 4.0)
		<pos_y> = (<pos_y> + 20)
		case 4
		<Scale> = (14.0, 4.0)
		<pos_y> = (<pos_y> + 20)
	endswitch
	setpaircomponents Pos X = <pos_x> y = <pos_y>
	rb_get_lane_rot_angle Player = <Player> lane = <lane>
	CreateScreenElement {
		Type = SpriteElement
		texture = attack_firefx_glow
		parent = <parent>
		blend = add
		Pos = <Pos>
		rot_angle = <lane_rot_angle>
		Scale = <Scale>
		rgba = [230 190 150 255]
		alpha = 0
		z_priority = 15
	}
	<glow_id> = <id>
	<fade_in_time> = RandomFloat (0.2, 0.4)
	<fade_out_time> = RandomFloat (0.2, 0.4)
	<off_time> = RandomFloat (0.01, 0.05)
	<on_time> = RandomFloat (0.01, 0.05)
	<alpha_in> = 0.8
	<alpha_out> = 0.3
	<new_rgba> = [250 150 30 255]
	begin
	SetArrayElement ArrayName = new_rgba index = 0 NewValue = (RandomInteger (245.0, 255.0))
	SetArrayElement ArrayName = new_rgba index = 1 NewValue = (RandomInteger (140.0, 160.0))
	SetArrayElement ArrayName = new_rgba index = 2 NewValue = (RandomInteger (20.0, 40.0))
	<glow_id> :se_setprops alpha = <alpha_in> rgba = <new_rgba> time = <fade_in_time>
	<glow_id> :se_waitprops
	Wait <on_time> Seconds
	SetArrayElement ArrayName = new_rgba index = 0 NewValue = (RandomInteger (245.0, 255.0))
	SetArrayElement ArrayName = new_rgba index = 1 NewValue = (RandomInteger (140.0, 160.0))
	SetArrayElement ArrayName = new_rgba index = 2 NewValue = (RandomInteger (20.0, 40.0))
	<glow_id> :se_setprops alpha = <alpha_out> rgba = <new_rgba> time = <fade_out_time>
	<glow_id> :se_waitprops
	Wait <off_time> Seconds
	repeat
endscript

script roadie_battle_stop_lane_fires \{Player = !i1768515945}
	<player_index> = (<Player> - 1)
	<container_id> = ($roadie_battle_lane_fire_element [<player_index>])
	if ScreenElementExists id = <container_id>
		DestroyScreenElement id = <container_id>
	endif
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_lane_fire_element
		index = <player_index>
		NewValue = None
	}
endscript

script rb_highway_sparking_begin \{Player = !i1768515945
		severity = !i1768515945}
	<right_glow_id> = ($rb_spark_glow_ids [(<Player> -1)].right)
	<left_glow_id> = ($rb_spark_glow_ids [(<Player> -1)].left)
	<sparking_id> = ($rb_spark_glow_ids [(<Player> -1)].sparking)
	if ScreenElementExists id = <right_glow_id>
		DestroyScreenElement id = <right_glow_id>
	endif
	if ScreenElementExists id = <left_glow_id>
		DestroyScreenElement id = <left_glow_id>
	endif
	if ScreenElementExists id = <sparking_id>
		DestroyScreenElement id = <sparking_id>
	endif
	extendcrcplayer gem_container <Player> out = container_id
	CreateScreenElement {
		Type = ContainerElement
		parent = <container_id>
		id = <sparking_id>
	}
	<parent_id> = <id>
	roadie_battle_shake_highway Player = <Player>
	getplayerinfo <Player> controller
	activatestarpowerpulse Player = <controller> num = 1 length = 35 Strength = 20 Priority = 100
	<parent_id> :Obj_SpawnScriptNow rb_highway_sparking_animate_spawned params = {Player = <Player> severity = <severity>}
	<parent_id> :Obj_SpawnScriptNow rb_highway_sparking_glow params = {Player = <Player> severity = <severity>}
endscript

script rb_highway_sparking_animate_spawned \{severity = !i1768515945}
	Obj_GetID
	<base_scale> = 0.45000002
	<speed_base> = 0.02
	GetStartTime
	getplayerinfo <Player> lefthanded_gems
	begin
	<t> = RandomFloat (0.4, 0.8)
	<Flip> = RandomInteger (0.0, 1.0)
	if (<Flip> = 0)
		lane = 0
		if (<lefthanded_gems> = 1)
			lane = 4
		endif
	else
		lane = 4
		if (<lefthanded_gems> = 1)
			lane = 0
		endif
	endif
	getnumplayersingame
	switch (<num_players>)
		case 1
		<offset> = 56
		case 2
		<offset> = 52
		case 3
		<offset> = 46
		case 4
		<offset> = 40
	endswitch
	<speed> = <speed_base>
	<rotation> = RandomInteger (0.0, 40.0)
	<mod_offset> = (<rotation> * 0.9)
	<offset> = (<offset> - <mod_offset>)
	calculategempositionandscale Player = <Player> lane = <lane> fraction = <t>
	if (<Flip> = 0)
		<pos_x> = (<pos_x> - (<offset> * <scale_x>))
	else
		<pos_x> = (<pos_x> + (<offset> * <scale_x>))
		<rotation> = (<rotation> * -1)
	endif
	setpaircomponents Pos X = <pos_x> y = <pos_y>
	<scale_x> = (<scale_x> * <base_scale>)
	<scale_y> = (<scale_y> * <base_scale>)
	setpaircomponents Scale X = <scale_x> y = <scale_y>
	SpawnScriptNow rb_make_single_spark_spawned params = {parent = <objID> Pos = <Pos> speed = <speed> Scale = <Scale> rotation = <rotation> Flip = <Flip> t = <t>}
	<t_wait> = RandomInteger (6.0, 9.0)
	Wait <t_wait> frames
	repeat 6
	begin
	<t> = RandomFloat (0.2, 0.7)
	<Flip> = RandomInteger (0.0, 1.0)
	if (<Flip> = 0)
		lane = 0
		if (<lefthanded_gems> = 1)
			lane = 4
		endif
	else
		lane = 4
		if (<lefthanded_gems> = 1)
			lane = 0
		endif
	endif
	getnumplayersingame
	switch (<num_players>)
		case 1
		<offset> = 56
		case 2
		<offset> = 52
		case 3
		<offset> = 46
		case 4
		<offset> = 40
	endswitch
	<speed> = <speed_base>
	<rotation> = RandomInteger (0.0, 45.0)
	<mod_offset> = (<rotation> * 0.9)
	<offset> = (<offset> - <mod_offset>)
	calculategempositionandscale Player = <Player> lane = <lane> fraction = <t>
	if (<Flip> = 0)
		<pos_x> = (<pos_x> - (<offset> * <scale_x>))
	else
		<pos_x> = (<pos_x> + (<offset> * <scale_x>))
		<rotation> = (<rotation> * -1)
	endif
	setpaircomponents Pos X = <pos_x> y = <pos_y>
	<scale_x> = (<scale_x> * <base_scale>)
	<scale_y> = (<scale_y> * <base_scale>)
	setpaircomponents Scale X = <scale_x> y = <scale_y>
	SpawnScriptNow rb_make_single_spark_spawned params = {parent = <objID> Pos = <Pos> speed = <speed> Scale = <Scale> rotation = <rotation> Flip = <Flip> t = <t>}
	<t_wait> = RandomInteger (12.0, 22.0)
	Wait <t_wait> frames
	repeat
endscript

script rb_make_single_spark_spawned \{parent = !q1768515945
		Pos = 0x69696969
		speed = !f1768515945
		Scale = 0x69696969
		rotation = !i1768515945
		Flip = !i1768515945
		t = !f1768515945}
	<flash_flip> = <Flip>
	<num_frames> = 16
	<Flip> = RandomInteger (0.0, 1.0)
	if (<Flip> = 0)
		flip_v = FALSE
	else
		flip_v = true
	endif
	<num_uv_frames> = (4.0, 4.0)
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		texture = attack_amp_sparksanim
		Pos = <Pos>
		just = [center center]
		pos_anchor = [center center]
		Scale = <Scale>
		flip_v
		alpha = 1
		rot_angle = <rotation>
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = <speed>
		num_uv_frames = <num_uv_frames>
		z_priority = 6
		loop_animated_uvs = FALSE
	}
	<spark_id> = <id>
	<delay_time> = (<num_uv_frames> [0] * <num_uv_frames> [1] * <speed>)
	if (<flash_flip> = 0)
		<flip_param> = FALSE
		<just> = [right center]
	else
		<flip_param> = true
		<just> = [left center]
		<t> = (<t> * -1)
	endif
	<rotation> = (<rotation> * -1)
	<mod_x> = (<t> * 420)
	<mod_y> = -10
	<Pos> = (((1.0, 0.0) * <mod_x>) + ((0.0, 1.0) * <mod_y>))
	rb_single_spark_flash parent = <spark_id> Pos = <Pos> just = <just> Scale = <Scale> rotation = <rotation> delay = <delay_time> Flip = <flip_param>
	Wait <delay_time> Seconds
	DestroyScreenElement id = <spark_id>
endscript

script rb_single_spark_flash \{parent = !q1768515945
		rotation = !i1768515945
		delay = !f1768515945
		Flip = 0x00000048}
	<alpha> = 0
	<on_time> = (<delay> * 0.1)
	<fade_in_step> = 0.5
	<fade_out_step> = 0.35000002
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		texture = attack_amp_flash
		Pos = <Pos>
		just = <just>
		pos_anchor = [center center]
		Scale = (<Scale> * 10)
		rot_angle = <rotation>
		blend = add
		flip_v = <Flip>
		z_priority = 5
		rgba = [255 255 150 200]
		alpha = <alpha>
	}
	begin
	<alpha> = (<alpha> + <fade_in_step>)
	if (<alpha> > 0.6)
		<alpha> = 0.6
		<id> :se_setprops alpha = <alpha>
		break
	endif
	<id> :se_setprops alpha = <alpha>
	WaitOneGameFrame
	repeat
	Wait <on_time> Seconds
	begin
	<alpha> = (<alpha> - <fade_out_step>)
	if (<alpha> < 0)
		<alpha> = 0
		<id> :se_setprops alpha = <alpha>
		break
	endif
	<id> :se_setprops alpha = <alpha>
	WaitOneGameFrame
	repeat
	DestroyScreenElement id = <id>
endscript

script rb_highway_sparking_glow \{Player = !i1768515945
		severity = !i1768515945}
	getnumplayersingame
	switch (<num_players>)
		case 1
		<Scale> = (1.4, 8.0)
		<pos_right> = (40.0, -220.0)
		<pos_left> = (-40.0, -220.0)
		case 2
		<Scale> = (1.2, 7.0)
		<pos_right> = (20.0, -160.0)
		<pos_left> = (-20.0, -160.0)
		case 3
		<Scale> = (1.0, 7.0)
		<pos_right> = (20.0, -160.0)
		<pos_left> = (-20.0, -160.0)
		case 4
		<Scale> = (1.0, 6.0)
		<pos_right> = (20.0, -160.0)
		<pos_left> = (-20.0, -160.0)
	endswitch
	extendcrcplayer sidebar_container_right <Player> out = sidebar_right_container
	extendcrcplayer sidebar_container_left <Player> out = sidebar_left_container
	CreateScreenElement {
		Type = SpriteElement
		texture = attack_amp_edgeglow
		parent = <sidebar_left_container>
		id = ($rb_spark_glow_ids [(<Player> -1)].right)
		blend = add
		Pos = <pos_right>
		rot_angle = 0
		Scale = <Scale>
		rgba = [200 50 50 255]
		flip_v = true
		alpha = 0
		z_priority = 5
	}
	<right_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		texture = attack_amp_edgeglow
		parent = <sidebar_right_container>
		id = ($rb_spark_glow_ids [(<Player> -1)].left)
		blend = add
		Pos = <pos_left>
		rot_angle = 0
		Scale = <Scale>
		rgba = [200 50 50 255]
		alpha = 0
		z_priority = 5
	}
	<left_id> = <id>
	<fade_in_time> = 0.5
	<fade_out_time> = 0.5
	<off_time> = 0.3
	<on_time> = 0.5
	<alpha_in> = 1.0
	<alpha_out> = 0.0
	begin
	<right_id> :se_setprops alpha = <alpha_in> time = <fade_in_time>
	<left_id> :se_setprops alpha = <alpha_in> time = <fade_in_time>
	<right_id> :se_waitprops
	Wait <on_time> Seconds
	<right_id> :se_setprops alpha = <alpha_out> time = <fade_out_time>
	<left_id> :se_setprops alpha = <alpha_out> time = <fade_out_time>
	<right_id> :se_waitprops
	Wait <off_time> Seconds
	repeat
endscript

script rb_highway_sparking_end \{Player = !i1768515945}
	<player_index> = (<Player> - 1)
	<right_glow_id> = ($rb_spark_glow_ids [<player_index>].right)
	<left_glow_id> = ($rb_spark_glow_ids [<player_index>].left)
	<sparking_id> = ($rb_spark_glow_ids [<player_index>].sparking)
	<sparking_id> :se_setprops alpha = 0 time = 0.3
	<right_glow_id> :se_setprops alpha = 0 time = 0.3
	<left_glow_id> :se_setprops alpha = 0 time = 0.3
	<sparking_id> :se_waitprops
	DestroyScreenElement id = <sparking_id>
	DestroyScreenElement id = <right_glow_id>
	DestroyScreenElement id = <left_glow_id>
endscript

script roadie_battle_star_power_buff_animation_start \{Player = !i1768515945}
	<star_id> = (($roadie_battle_star_power_buff_element [<Player> - 1]).stars)
	if ScreenElementExists id = <star_id>
		DestroyScreenElement id = <star_id>
	endif
	<glow_id> = (($roadie_battle_star_power_buff_element [<Player> - 1]).glow)
	if ScreenElementExists id = <glow_id>
		DestroyScreenElement id = <glow_id>
	endif
	extendcrcplayer sidebar_right_sp_meter <Player> out = right_sp_id
	<right_sp_id> :Obj_SpawnScriptNow rb_star_power_buff_animation params = {Player = <Player>}
endscript

script rb_star_power_buff_animation \{Player = !i1768515945}
	Obj_GetID
	<objID> :desc_resolvealias Name = alias_needle_container
	CreateScreenElement {
		Type = ContainerElement
		parent = <resolved_id>
	}
	setstructureparam array_name = roadie_battle_star_power_buff_element array_index = (<Player> -1) param = stars value = <id>
	<id> :Obj_SpawnScriptNow rb_star_power_buff_star_animation
	<id> :Obj_SpawnScriptNow rb_star_power_buff_fill_star
	CreateScreenElement {
		Type = ContainerElement
		parent = <objID>
	}
	setstructureparam array_name = roadie_battle_star_power_buff_element array_index = (<Player> -1) param = glow value = <id>
	<id> :Obj_SpawnScriptNow rb_star_power_buff_glow_animation
	<id> :Obj_SpawnScriptNow rb_star_power_buff_bg_stars
endscript

script rb_star_power_buff_star_animation 
	Obj_GetID
	begin
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_soundboard_ghoststar
		parent = <objID>
		blend = blend
		z_priority = 10
		Scale = 1.0
	}
	<id> :Obj_SpawnScriptNow rb_star_power_buff_individual_star
	Wait \{0.1
		Seconds}
	repeat
endscript
rb_starpower_buff_start_pos = (-90.0, 15.0)
rb_starpower_buff_end_pos = (30.0, 25.0)
rb_starpower_buff_start_rand_x = 50.0
rb_starpower_buff_start_rand_y = 100.0

script rb_star_power_buff_individual_star 
	GetRandomValue Name = start_x_offset a = (0 - $rb_starpower_buff_start_rand_x) b = $rb_starpower_buff_start_rand_x
	GetRandomValue Name = start_y_offset a = (0 - $rb_starpower_buff_start_rand_y) b = $rb_starpower_buff_start_rand_y
	setpaircomponents start_offset X = <start_x_offset> y = <start_y_offset>
	<start_pos> = ($rb_starpower_buff_start_pos + <start_offset>)
	<end_pos> = $rb_starpower_buff_end_pos
	<end_rot> = RandomInteger (150.0, 210.0)
	<end_time> = 0.3
	<mid_ratio> = 0.2
	<mid_pos> = (<start_pos> + ((<end_pos> - <start_pos>) * <mid_ratio>))
	<mid_rot> = (<end_rot> * <mid_ratio>)
	<mid_time> = (<end_time> * <mid_ratio>)
	<start_scale> = RandomFloat (0.6, 1.4)
	se_setprops Pos = <start_pos> alpha = 0.0 Scale = <start_scale> rot_angle = 0
	se_setprops Pos = <mid_pos> alpha = 1.0 rot_angle = <mid_rot> time = <mid_time>
	se_waitprops
	se_setprops Pos = <end_pos> alpha = 0.1 Scale = 0.0 rot_angle = <end_rot> time = <end_time>
	se_waitprops
	Die
endscript

script rb_star_power_buff_glow_animation 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		texture = sp_fill_glow02
		parent = <objID>
		Pos = (48.0, 130.0)
		blend = add
		z_priority = 10
		Scale = (1.5, 2.0)
		rot_angle = 0
		rgba = [255 255 255 150]
		alpha = 0
	}
	begin
	<id> :se_setprops alpha = 1.0 time = 0.5
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.0 time = 0.5
	<id> :se_waitprops
	WaitOneGameFrame
	repeat
endscript

script rb_star_power_buff_fill_star 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = hyperspeed_sparkle
		parent = <objID>
		Pos = (25.0, 40.0)
		blend = add
		z_priority = 12
		Scale = 1.5
		rgba = [255 255 255 200]
	}
	<star_id> = <id>
	<rot_angle> = 0
	begin
	<rand_alpha> = RandomFloat (0.3, 0.9)
	<star_id> :se_setprops alpha = <rand_alpha> rot_angle = <rot_angle> time = 0.2
	<rot_angle> = (<rot_angle> + 60.0)
	<star_id> :se_waitprops
	repeat
endscript

script rb_star_power_buff_bg_stars 
	Obj_GetID
	<new_pos> = (75.0, 50.0)
	begin
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	setpaircomponents start_frame X = <u> y = <v>
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = boost_intro_sparkleanim
		parent = <objID>
		Pos = <new_pos>
		blend = add
		z_priority = -10
		Scale = 0.5
		rgba = [255 255 255 255]
		use_animated_uvs = true
		top_down_v
		frame_length = 0.01
		num_uv_frames = (4.0, 4.0)
		loop_animated_uvs = true
		current_frames = <start_frame>
	}
	<id> :se_setprops alpha = 0.9 rot_angle = 260
	<new_pos> = (<new_pos> + (10.0, 90.0))
	repeat 3
endscript

script roadie_battle_star_power_buff_animation_end \{Player = !i1768515945}
	<player_index> = (<Player> - 1)
	<star_id> = (($roadie_battle_star_power_buff_element [<player_index>]).stars)
	<star_id> :Obj_SpawnScriptNow {
		roadie_battle_star_power_buff_animation_end_stars
		params = {
			player_index = <player_index>
		}
	}
	<glow_id> = (($roadie_battle_star_power_buff_element [<player_index>]).glow)
	<glow_id> :Obj_SpawnScriptNow {
		roadie_battle_star_power_buff_animation_end_glow
		params = {
			player_index = <player_index>
		}
	}
endscript

script roadie_battle_star_power_buff_animation_end_stars \{player_index = !i1768515945}
	se_setprops \{alpha = 0
		time = 0.3}
	se_waitprops
	setstructureparam {
		array_name = roadie_battle_star_power_buff_element
		array_index = <player_index>
		param = stars
		value = None
	}
	Die
endscript

script roadie_battle_star_power_buff_animation_end_glow \{player_index = !i1768515945}
	se_setprops \{alpha = 0
		time = 0.3}
	se_waitprops
	setstructureparam {
		array_name = roadie_battle_star_power_buff_element
		array_index = <player_index>
		param = glow
		value = None
	}
	Die
endscript

script rb_streak_keeper_visuals_start \{Player = !i1768515945
		allowed_misses = !i1768515945}
	<container_id> = ($rb_streak_visuals_element [(<Player> - 1)].shield)
	if ScreenElementExists id = <container_id>
		DestroyScreenElement id = <container_id>
	endif
	extendcrcplayer sidebar_right_ns_meter <Player> out = right_ns_id
	ResolveScreenElementID {
		id = {
			<right_ns_id> child = {
				hud_meter_combo_master child = hud_meter_combo_frame
			}
		}
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = <resolved_id>
		id = <container_id>
		Pos = (22.0, 22.0)
		dims = (128.0, 128.0)
		rot_angle = 0
		preserve_local_orientation = true
	}
	<id> :Obj_SpawnScriptNow rb_streak_keeper_intro
	<id> :Obj_SpawnScriptNow rb_streak_keeper_persistent_glow
	<id> :Obj_SpawnScriptNow rb_streak_keeper_bg_stars
	<id> :Obj_SpawnScriptNow rb_streak_keeper_glows
endscript

script rb_streak_keeper_persistent_glow 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = boost_glow
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		z_priority = -2
		alpha = 0.4
		Scale = 0.6
		rot_angle = 0
		preserve_local_orientation = true
	}
	<wait_time> = 0.5
	<mod_alpha> = 0.4
	<mod_scale> = (0.2, 0.2)
	<alpha> = 0.4
	<Scale> = (0.8, 0.8)
	begin
	<id> :se_setprops alpha = <alpha> Scale = <Scale> time = 0.4
	<mod_alpha> = (<mod_alpha> * -1)
	<alpha> = (<alpha> + <mod_alpha>)
	<mod_scale> = (<mod_scale> * -1)
	<Scale> = (<Scale> + <mod_scale>)
	<id> :se_waitprops
	repeat
endscript

script rb_streak_keeper_bg_stars 
	Obj_GetID
	<new_pos> = (0.0, 0.0)
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	setpaircomponents start_frame X = <u> y = <v>
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = boost_intro_sparkleanim
		parent = <objID>
		Pos = <new_pos>
		blend = add
		z_priority = -10
		Scale = 0.45000002
		alpha = 0.9
		rgba = [255 255 255 255]
		use_animated_uvs = true
		top_down_v
		frame_length = 0.01
		num_uv_frames = (4.0, 4.0)
		loop_animated_uvs = true
		current_frames = <start_frame>
	}
	<stars_id> = <id>
	<rot_angle> = 0
	begin
	<stars_id> :se_setprops rot_angle = <rot_angle> time = 0.2
	<rot_angle> = (<rot_angle> + 11)
	<stars_id> :se_waitprops
	repeat
endscript

script rb_streak_keeper_glows 
	Obj_GetID
	begin
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = boost_amp_ghostshield
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		z_priority = 10
		alpha = 0.3
		Scale = 2.0
		rot_angle = 0
		preserve_local_orientation = true
	}
	<id> :se_setprops alpha = 0.6 Scale = 1.0 time = 0.4
	<id> :Obj_SpawnScriptNow rb_destroy_when_completed_animating
	Wait \{0.15
		Seconds}
	repeat 3
endscript

script rb_streak_keeper_intro 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = boost_amp_shield
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = blend
		Scale = 1
		z_priority = -1
		alpha = 1
		rot_angle = 0
		preserve_local_orientation = true
	}
	Wait \{0.6
		Seconds}
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = boost_amp_shieldsweep
		Pos = (-26.0, -20.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		Scale = (0.4, 0.4)
		z_priority = 5
		alpha = 0.3
		rot_angle = 0
		preserve_local_orientation = true
	}
	<id> :se_setprops Pos = (0.0, -20.0) Scale = (0.8, 0.5) alpha = 0.6 time = 0.2
	<id> :se_waitprops
	<id> :se_setprops Pos = (26.0, -20.0) Scale = (0.4, 0.4) alpha = 0.3 time = 0.2
	<id> :se_waitprops
	DestroyScreenElement id = <id>
endscript

script rb_streak_keeper_visuals_stop \{Player = !i1768515945}
	<keeper_id> = ($rb_streak_visuals_element [(<Player> - 1)].shield)
	<keeper_id> :Obj_SpawnScriptNow rb_streak_keeper_visuals_stop_animation params = {Player = <Player>}
endscript

script rb_streak_keeper_visuals_stop_animation \{Player = !i1768515945}
	formatText checksumName = right_ns_id 'sidebar_right_ns_meterp%p' p = <Player>
	ResolveScreenElementID {
		id = {
			<right_ns_id> child = {hud_meter_combo_master
				child = hud_meter_combo_frame
			}
		}
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <resolved_id>
		texture = boost_amp_ghostshieldbroken
		Scale = 1.0
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		alpha = 1
		z_priority = 5
		Pos = (0.0, 0.0)
		rot_angle = 0
		preserve_local_orientation = true
	}
	<id> :se_setprops alpha = 0 Scale = 1.3 time = 0.8
	<id> :Obj_SpawnScriptNow rb_destroy_when_completed_animating
	Die
endscript

script rb_streak_keeper_visuals_update \{Player = !i1768515945
		old_count = !i1768515945
		new_count = !i1768515945}
	<container_id> = ($rb_streak_visuals_element [(<Player> - 1)].shield)
	if (<new_count> >= <old_count>)
		<rgba> = [255 255 255 255]
		<start_pos> = (0.0, 0.0)
		<end_pos> = (0.0, 0.0)
		<start_scale> = 2.0
		<end_scale> = 1.0
		<start_alpha> = 0.2
		<end_alpha> = 0.6
	else
		<rgba> = [200 50 50 255]
		<start_pos> = (0.0, 0.0)
		<end_pos> = (0.0, 30.0)
		<start_scale> = 1.0
		<end_scale> = 0.5
		<start_alpha> = 0.6
		<end_alpha> = 0.0
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = boost_amp_ghostshield
		Pos = <start_pos>
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		Scale = <start_scale>
		z_priority = 10
		rgba = <rgba>
		alpha = <start_alpha>
		rot_angle = 0
		preserve_local_orientation = true
	}
	<id> :Obj_SpawnScriptNow {
		rb_streak_keeper_animate_shield
		params = {
			end_pos = <end_pos>
			end_alpha = <end_alpha>
			end_scale = <end_scale>
		}
	}
endscript

script rb_streak_keeper_animate_shield \{end_pos = 0x69696969
		end_alpha = !f1768515945
		end_scale = !f1768515945}
	se_setprops Pos = <end_pos> alpha = <end_alpha> Scale = <end_scale> time = 0.6
	se_waitprops
	Die
endscript

script rb_multiplier_boost_show \{Player = !i1768515945
		multiplier_boost = !i1768515945
		duration_secs = !f1768515945}
	<id> = ($roadie_battle_multiplier_boost_element [(<Player> - 1)])
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
	extendcrcplayer sidebar_right_ns_meter <Player> out = right_ns_id
	ResolveScreenElementID {
		id = {
			<right_ns_id> child = {
				hud_meter_combo_master child = hud_meter_combo_frame
			}
		}
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = <resolved_id>
		Pos = (22.0, 22.0)
	}
	SetArrayElement globalarray ArrayName = roadie_battle_multiplier_boost_element index = (<Player> - 1) NewValue = <id>
	<id> :Obj_SpawnScriptNow rb_multiplier_boost_persistent_glow
	<id> :Obj_SpawnScriptNow rb_multiplier_boost_bg_ring
	<id> :Obj_SpawnScriptNow rb_multiplier_boost_bg_stars
	<id> :Obj_SpawnScriptNow rb_multiplier_boost_intro_rings params = {Player = <Player> multiplier_boost = <multiplier_boost>}
	<id> :Obj_SpawnScriptNow rb_multiplier_boost_intro_ticks params = {Player = <Player> duration_secs = <duration_secs>}
endscript

script rb_multiplier_boost_persistent_glow 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = boost_glow
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		z_priority = -6
		alpha = 1.0
		Scale = 1.0
	}
	<mod_alpha> = 0.4
	<mod_scale> = (0.2, 0.2)
	<alpha> = 0.4
	<Scale> = (0.7, 0.7)
	begin
	<id> :se_setprops alpha = <alpha> Scale = <Scale> time = 0.6
	<mod_alpha> = (<mod_alpha> * -1)
	<alpha> = (<alpha> + <mod_alpha>)
	<mod_scale> = (<mod_scale> * -1)
	<Scale> = (<Scale> + <mod_scale>)
	<id> :se_waitprops
	repeat
endscript

script rb_multiplier_boost_bg_ring 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = boost_speakers_ghostcircle
		parent = <objID>
		Pos = (0.0, 0.0)
		blend = add
		z_priority = -5
		Scale = 1.0
		alpha = 1.0
	}
endscript

script rb_multiplier_boost_bg_stars 
	Obj_GetID
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	setpaircomponents start_frame X = <u> y = <v>
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = boost_intro_sparkleanim
		parent = <objID>
		Pos = (0.0, 0.0)
		blend = add
		z_priority = -10
		Scale = 0.4
		rgba = [255 255 255 255]
		alpha = 0.9
		use_animated_uvs = true
		top_down_v
		frame_length = 0.005
		num_uv_frames = (4.0, 4.0)
		loop_animated_uvs = true
		current_frames = <start_frame>
	}
	<rot_angle> = 0
	begin
	<id> :se_setprops rot_angle = <rot_angle> time = 0.2
	<rot_angle> = (<rot_angle> + 11)
	<id> :se_waitprops
	repeat
endscript

script rb_multiplier_boost_intro_rings \{Player = !i1768515945
		multiplier_boost = !i1768515945}
	Obj_GetID
	<boost> = 0
	begin
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = boost_speakers_ghostcircle
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		Scale = 2.0
		z_priority = 10
		alpha = 0
	}
	<id> :se_setprops Scale = 1.8 alpha = 0.3 time = 0.1
	<id> :se_waitprops
	<id> :se_setprops Scale = 1.0 alpha = 0 time = 0.4
	<id> :Obj_SpawnScriptNow rb_destroy_when_completed_animating
	Wait \{0.4
		sec}
	<boost> = (<boost> + 1)
	setplayerinfo <Player> roadie_battle_multiplier_boost = <boost>
	starmeter_show_hide_notestreak
	UpdateNixie Player = <Player>
	updatemultiplierchange Player = <Player>
	repeat <multiplier_boost>
endscript

script rb_multiplier_boost_outro_rings \{Player = !i1768515945}
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = boost_speakers_ghostcircle
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		rgba = [255 50 50 255]
		Scale = 1.0
		z_priority = 10
		alpha = 1
	}
	<id> :se_setprops Scale = 2.0 alpha = 0 time = 0.8
	<id> :Obj_SpawnScriptNow rb_destroy_when_completed_animating
endscript

script rb_multiplier_boost_intro_ticks \{Player = !i1768515945
		duration_secs = !f1768515945}
	Obj_GetID
	GetStartTime
	<array> = []
	<rotation> = 295
	<num_ticks> = 15
	begin
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = boost_speakers_tickmark
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = blend
		Scale = 1.0
		rot_angle = <rotation>
		z_priority = 2
		alpha = 0
	}
	<id> :se_setprops alpha = 1.0 rgba = [200 , 200 , 255 , 255] time = 0.05
	<rotation> = (<rotation> + 18)
	AddArrayElement array = <array> element = <id>
	WaitOneGameFrame
	repeat <num_ticks>
	getelapsedtime starttime = <starttime>
	casttofloat \{ElapsedTime}
	<ElapsedTime> = (<ElapsedTime> / 1000.0)
	<ticks_float> = <num_ticks>
	casttofloat \{ticks_float}
	<time_per_tick> = ((<duration_secs> - <ElapsedTime>) / <ticks_float>)
	<fade_time> = 0.2
	if (<time_per_tick> < <fade_time>)
		<fade_time> = <time_per_tick>
	endif
	<tick_index> = 0
	<kill_id> = None
	begin
	Wait <time_per_tick> Seconds
	<kill_id> = (<array> [<tick_index>])
	<kill_id> :se_setprops alpha = 0 time = <fade_time>
	<tick_index> = (<tick_index> + 1)
	repeat <num_ticks>
	rb_multiplier_boost_outro_rings Player = <Player>
endscript

script rb_multiplier_boost_hide \{Player = !i1768515945}
	<player_index> = (<Player> - 1)
	<id> = ($roadie_battle_multiplier_boost_element [<player_index>])
	<id> :Obj_SpawnScriptNow {
		rb_multiplier_boost_hide_object
		params = {
			player_index = <player_index>
		}
	}
endscript

script rb_multiplier_boost_hide_object \{player_index = !i1768515945}
	se_setprops \{alpha = 0
		time = 0.2}
	se_waitprops
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_multiplier_boost_element
		index = <player_index>
		NewValue = None
	}
	Die
endscript
rb_sp_generator_num_marks = 5
rb_sp_generator_burst_stars = 8

script rb_star_power_generator_create \{Player = !i1768515945
		note_streak = !i1768515945}
	<right_sp_id> = ($rb_sidebar_right_id [(<Player> - 1)])
	fill_elements = {}
	<pos_offset> = (45.0, 295.0)
	CreateScreenElement {
		Type = ContainerElement
		parent = <right_sp_id>
		Pos = <pos_offset>
	}
	<container_id> = <id>
	setstructureparam struct_name = fill_elements param = container value = <id>
	<base_pos> = (2.0, 45.0)
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_instrument_boostmeter
		parent = <container_id>
		Pos = <base_pos>
		blend = blend
		just = [center center]
		Scale = (2.0, 3.0)
		alpha = 0
		z_priority = 1
	}
	<bg_id> = <id>
	<divider_height> = 36
	<divider_offset> = (0.0, 13.0)
	<i> = 1
	begin
	<X> = 24
	<y> = (<divider_height> - ((<divider_height> * <i>) / $rb_sp_generator_num_marks))
	setpaircomponents Pos X = <X> y = <y>
	<Pos> = (<Pos> + <divider_offset>)
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_instrument_boostdivider
		parent = <bg_id>
		blend = blend
		Pos = <Pos>
		alpha = 1
		z_priority = 5
	}
	<i> = (<i> + 1)
	repeat $rb_sp_generator_num_marks
	CreateScreenElement {
		Type = SpriteElement
		texture = sp_fill_glow02
		parent = <container_id>
		Pos = (10.0, 65.0)
		blend = add
		z_priority = -10
		Scale = (2.0, 2.0)
		rot_angle = -3
		rgba = [255 255 255 150]
		alpha = 1
	}
	setstructureparam struct_name = fill_elements param = meter_glow_1 value = <id>
	CreateScreenElement {
		Type = SpriteElement
		texture = sp_fill01
		parent = <container_id>
		Pos = (7.0, 95.0)
		rgba = [0 255 255 255]
		alpha = 1
		blend = blend
		z_priority = 3
		Scale = (1.6, 0.0)
	}
	setstructureparam struct_name = fill_elements param = fill_bar value = <id>
	CreateScreenElement {
		Type = SpriteElement
		texture = sb_tubeglow01
		parent = <container_id>
		Pos = (20.0, 100.0)
		rgba = [255 255 255 255]
		alpha = 1
		rot_angle = 15
		blend = add
		z_priority = 4
		Scale = (1.2, 0.5)
	}
	setstructureparam struct_name = fill_elements param = fill_needle value = <id>
	SetArrayElement globalarray ArrayName = rb_sp_generator_elements index = (<Player> - 1) NewValue = <fill_elements>
	<fade_time> = 0.5
	<bg_id> :se_setprops alpha = 1 time = <fade_time>
	<container_id> :Obj_SpawnScriptNow rb_lightning_wheel params = {big_pos = (107.0, 40.0) little_pos = (40.0, 40.0)}
endscript

script rb_lightning_wheel \{big_pos = 0x69696969
		little_pos = 0x69696969}
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = boost_instrument_lightninganim
		Pos = <little_pos>
		just = [center , center]
		pos_anchor = [center , center]
		Scale = (1.0, 1.0)
		blend = add
		alpha = 1
		z_priority = -6
	}
	<little_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = boost_instrument_lightninganim
		Pos = <big_pos>
		just = [center , center]
		pos_anchor = [center , center]
		Scale = (2.0, 2.0)
		blend = add
		alpha = 1
		z_priority = -5
	}
	<big_id> = <id>
	<little_id> :se_setprops rot_angle = 0
	<big_id> :se_setprops rot_angle = 0
	begin
	<little_id> :se_setprops rot_angle = 480 time = 2.0
	<big_id> :se_setprops rot_angle = -360 time = 2.0
	<little_id> :se_waitprops
	<little_id> :se_setprops rot_angle = 0
	<big_id> :se_setprops rot_angle = 0
	repeat
endscript

script rb_star_power_generator_fill_transfer {
	}
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = boost_instrument_lightninganim
		Pos = (50.0, 230.0)
		just = [center , center]
		pos_anchor = [center , center]
		Scale = (1.7, 1.8)
		blend = add
		alpha = 1
		z_priority = -5
	}
	<arc1_id> = <id>
	<arc1_id> :se_setprops alpha = 1
	<arc1_id> :se_setprops rot_angle = 360 time = 0.3
	Wait \{0.1
		Seconds}
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = boost_instrument_lightninganim
		Pos = (35.0, 180.0)
		just = [center , center]
		pos_anchor = [center , center]
		Scale = (1.7, 1.8)
		blend = add
		alpha = 1
		z_priority = -5
	}
	<arc2_id> = <id>
	<arc2_id> :se_setprops alpha = 1
	<arc2_id> :se_setprops rot_angle = -360 time = 0.4
	Wait \{0.1
		Seconds}
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = boost_instrument_lightninganim
		Pos = (40.0, 130.0)
		just = [center , center]
		pos_anchor = [center , center]
		Scale = (1.7, 1.8)
		blend = add
		alpha = 1
		z_priority = -5
	}
	<arc3_id> = <id>
	<arc3_id> :se_setprops alpha = 1
	<arc3_id> :se_setprops rot_angle = 360 time = 0.5
	<arc1_id> :se_waitprops
	DestroyScreenElement id = <arc1_id>
	<arc2_id> :se_waitprops
	DestroyScreenElement id = <arc2_id>
	<arc3_id> :se_waitprops
	DestroyScreenElement id = <arc3_id>
endscript

script rb_star_power_generator_increment \{Player = !i1768515945
		num = !i1768515945
		full = 0x00000038}
	<player_index> = (<Player> - 1)
	<percentage_full> = ((1.0 / $rb_sp_generator_num_marks) * <num>)
	<id> = ((($rb_sp_generator_elements) [<player_index>]).fill_needle)
	<slope> = (5.0, 135.0)
	<start> = (20.0, 100.0)
	<target> = (<start> - (<percentage_full> * <slope>))
	<id> :se_setprops Pos = <target>
	<id> = ((($rb_sp_generator_elements) [<player_index>]).fill_bar)
	<slope> = (0.0, 60.0)
	<start> = (7.0, 95.0)
	<start_scale> = (1.6, 0.0)
	<scale_shift> = (-0.4, 1.0)
	<target_pos> = (<start> - (<percentage_full> * <slope>))
	<target_scale> = (<start_scale> + (<percentage_full> * <scale_shift>))
	<id> :se_setprops Pos = <target_pos> Scale = <target_scale>
	if (<full> = true)
		<right_sp_id> = ($rb_sidebar_right_id [(<Player> - 1)])
		<right_sp_id> :desc_resolvealias Name = alias_needle_container
		<resolved_id> :Obj_SpawnScriptNow rb_star_power_burst_animation params = {Player = <Player> roadie = <roadie>}
		<resolved_id> :Obj_SpawnScriptNow rb_star_power_generator_fill_transfer
		Wait \{0.1
			Seconds}
		rb_star_power_generator_reset Player = <Player>
	endif
endscript

script rb_star_power_burst_animation \{Player = !i1768515945}
	Obj_GetID
	CreateScreenElement {
		Type = ContainerElement
		parent = <objID>
	}
	<container_id> = <id>
	<fade_time> = 0.6
	begin
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_soundboard_ghoststar
		parent = <container_id>
		Pos = $rb_starpower_buff_end_pos
		Scale = 0.1
		alpha = 1
		z_priority = 2
		rgba = [86 116 185 255]
	}
	<angle> = RandomInteger (-120.0, 120.0)
	<radius> = RandomFloat (60.0, 100.0)
	<dest_scale> = RandomFloat (0.8, 1.2)
	sin <angle>
	<X> = (<sin> * <radius>)
	cos <angle>
	<y> = (-1.0 * <cos> * <radius>)
	setpaircomponents dest_pos X = <X> y = <y>
	<dest_pos> = (<dest_pos> + $rb_starpower_buff_end_pos)
	<id> :se_setprops Pos = <dest_pos> alpha = 0 Scale = <dest_scale> rgba = [168 248 255 0] time = <fade_time>
	repeat $rb_sp_generator_burst_stars
	getplayerinfo Player = <Player> roadie_battle_star_power_generator_boost
	increase_star_power Player = <Player> amount = <roadie_battle_star_power_generator_boost>
	Wait <fade_time> Seconds
	DestroyScreenElement id = <container_id>
endscript

script rb_star_power_generator_reset \{Player = !i1768515945}
	<fill_elements> = (($rb_sp_generator_elements) [(<Player> - 1)])
	<id> = (<fill_elements>.fill_bar)
	<id> :se_setprops Pos = (7.0, 95.0) Scale = (1.6, 0.0)
	<id> = (<fill_elements>.fill_needle)
	<id> :se_setprops Pos = (20.0, 100.0)
endscript

script rb_star_power_generator_destroy \{Player = !i1768515945}
	<player_index> = (<Player> - 1)
	<id> = ((($rb_sp_generator_elements) [<player_index>]).container)
	DestroyScreenElement id = <id>
	SetArrayElement {
		globalarray
		ArrayName = rb_sp_generator_elements
		index = <player_index>
		NewValue = {}
	}
endscript

script rb_multiplier_generator_visuals \{Player = !i1768515945}
	<id> = ($roadie_battle_multiplier_generator_element [(<Player> - 1)])
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
	extendcrcplayer sidebar_right_ns_meter <Player> out = right_ns_id
	ResolveScreenElementID id = {<right_ns_id> child = {hud_meter_combo_master child = combo_note_leds_container}}
	CreateScreenElement {
		Type = ContainerElement
		parent = <resolved_id>
		Pos = (45.0, 100.0)
	}
	<container_id> = <id>
	SetArrayElement globalarray ArrayName = roadie_battle_multiplier_generator_element index = (<Player> - 1) NewValue = <id>
	<container_id> :Obj_SpawnScriptNow rb_lightning_wheel params = {big_pos = (-70.0, 65.0) little_pos = (-15.0, 25.0)}
	<container_id> :Obj_SpawnScriptNow rb_multiplier_generator_shiny
	<container_id> :Obj_SpawnScriptNow rb_multiplier_generator_bg_stars
endscript

script rb_multiplier_generator_bg_stars 
	Obj_GetID
	<new_pos> = (-30.0, -10.0)
	begin
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	setpaircomponents start_frame X = <u> y = <v>
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = boost_intro_sparkleanim
		parent = <objID>
		Pos = <new_pos>
		blend = add
		z_priority = -10
		Scale = 0.5
		rgba = [255 255 255 255]
		use_animated_uvs = true
		top_down_v
		frame_length = 0.01
		num_uv_frames = (4.0, 4.0)
		loop_animated_uvs = true
		current_frames = <start_frame>
	}
	<id> :se_setprops alpha = 0.9 rot_angle = 210
	<new_pos> = (<new_pos> + (80.0, 70.0))
	repeat 2
endscript

script rb_multiplier_generator_shiny 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_fx_multiplierstreak
		parent = <objID>
		Pos = (-20.0, 30.0)
		Scale = 1.0
		blend = add
		alpha = 1
		z_priority = 2
	}
	<slope> = (1.0, 1.74)
	<start> = (40.0, 70.0)
	<vert> = 70.0
	<slide_inout> = 10.0
	<total_time> = 0.4
	<slide_time> = (<total_time> * <slide_inout> * 0.85 / <vert>)
	begin
	<id> :se_setprops alpha = 1 Scale = 0 Pos = <start>
	<target> = (<start> - (<slide_inout> * <slope>))
	<id> :se_setprops Pos = <target> Scale = 1.0 time = <slide_time>
	<id> :se_waitprops
	<target> = (<start> - ((<vert> - <slide_inout>) * <slope>))
	<id> :se_setprops Pos = <target> time = (<total_time> - 2.0 * <slide_time>)
	<id> :se_waitprops
	<target> = (<start> - (<vert> * <slope>))
	<id> :se_setprops Pos = <target> Scale = 0 time = <slide_time>
	<id> :se_waitprops
	<id> :se_setprops alpha = 0
	repeat
endscript

script rb_multiplier_generator_visuals_stop \{Player = !i1768515945}
	<player_index> = (<Player> - 1)
	<id> = ($roadie_battle_multiplier_generator_element [<player_index>])
	<id> :Obj_SpawnScriptNow {
		rb_multiplier_generator_visuals_stop_object
		params = {
			player_index = <player_index>
		}
	}
endscript

script rb_multiplier_generator_visuals_stop_object \{player_index = !i1768515945}
	se_setprops \{alpha = 0
		time = 0.3}
	se_waitprops
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_multiplier_generator_element
		index = <player_index>
		NewValue = None
	}
	Die
endscript

script rb_update_highway_smoke \{Player = !i1768515945}
	<player_index> = (<Player> - 1)
	<id> = ($roadie_battle_highway_smoke_element [<player_index>])
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
	<smoke_container> = None
	getplayerinfo <Player> roadie_battle_active_attack_count
	if ((<roadie_battle_active_attack_count> > 0))
		if ($roadie_battle_lod = 0)
			extendcrcplayer gem_container <Player> out = container_id
			if ScreenElementExists id = <container_id>
				CreateScreenElement {
					Type = ContainerElement
					parent = <container_id>
				}
				<smoke_container> = <id>
				<smoke_container> :Obj_SpawnScriptNow rb_highway_smoke params = {Player = <Player>}
			endif
		endif
	endif
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_highway_smoke_element
		index = <player_index>
		NewValue = <smoke_container>
	}
endscript

script rb_highway_smoke \{Player = !i1768515945}
	Obj_GetID
	getplayerinfo <Player> roadie_battle_active_attack_count
	switch (<roadie_battle_active_attack_count>)
		case 1
		<smoke_rgba> = [226 226 226 190]
		<dest_rgba> = [155 155 155 190]
		<spawn_delay> = RandomFloat (0.4, 0.5)
		<LifeTime> = RandomFloat (2.5, 3.5)
		<final_offset> = RandomInteger (25.0, 60.0)
		case 2
		<smoke_rgba> = [255 100 4 225]
		<dest_rgba> = [255 100 4 225]
		<spawn_delay> = RandomFloat (0.2, 0.3)
		<LifeTime> = RandomFloat (1.5, 2.5)
		<final_offset> = RandomInteger (25.0, 60.0)
		case 3
		case 4
		case 5
		default
		<smoke_rgba> = [255 41 6 255]
		<dest_rgba> = [255 41 6 255]
		<spawn_delay> = RandomFloat (0.1, 0.2)
		<LifeTime> = RandomFloat (1.0, 1.5)
		<final_offset> = RandomInteger (25.0, 60.0)
	endswitch
	<smoke_count> = 2
	<offset> = 10
	<base_scale> = 1.0
	getplayerinfo <Player> lefthanded_gems
	begin
	<Flip> = 0
	begin
	begin
	if (<Flip> = 0)
		<flip_param> = FALSE
		lane = 0
		if (<lefthanded_gems> = 1)
			lane = 4
		endif
	else
		<flip_param> = true
		lane = 4
		if (<lefthanded_gems> = 1)
			lane = 0
		endif
	endif
	<init_dist> = RandomFloat (0.8, 1.1)
	calculategempositionandscale Player = <Player> lane = <lane> fraction = <init_dist>
	if (<Flip> = 0)
		<dest_x> = (<pos_x> - (<offset> * <scale_x>))
	else
		<dest_x> = (<pos_x> + (<offset> * <scale_x>))
	endif
	setpaircomponents Pos X = <dest_x> y = <pos_y>
	<scale_x> = (<scale_x> * <base_scale>)
	<scale_y> = (<scale_y> * <base_scale>)
	setpaircomponents Scale X = <scale_x> y = <scale_y>
	<init_rot_angle> = RandomInteger (-270.0, 270.0)
	if (<init_rot_angle> > 0)
		<neg> = -1
	else
		<neg> = 1
	endif
	<init_scale> = RandomFloat (2.0, 3.0)
	<scale_x> = (<scale_x> * <init_scale>)
	<scale_y> = (<scale_y> * <init_scale>)
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = rb_highway_smoke2
		Pos = <Pos>
		just = [center , center]
		pos_anchor = [center , center]
		Scale = <Scale>
		flip_v = <flip_param>
		rot_angle = <init_rot_angle>
		blend = add
		alpha = 1.0
		rgba = <smoke_rgba>
		z_priority = -10
	}
	if (<Flip> = 0)
		<dest_x> = (<pos_x> - (<final_offset> * <scale_x>))
	else
		<dest_x> = (<pos_x> + (<final_offset> * <scale_x>))
	endif
	<mod_y> = (<LifeTime> * 100.0)
	<dest_y> = (<pos_y> - <mod_y>)
	setpaircomponents Pos X = <dest_x> y = <dest_y>
	<mod_scale> = RandomFloat (1.0, 1.5)
	<dest_scale_x> = (<scale_x> * <mod_scale>)
	<dest_scale_y> = (<scale_y> * <mod_scale>)
	setpaircomponents Scale X = <dest_scale_x> y = <dest_scale_y>
	<dest_rot_angle> = RandomInteger (0.0, 270.0)
	<dest_rot_angle> = (<dest_rot_angle> * <neg>)
	<id> :se_setprops alpha = 0 rot_angle = <dest_rot_angle> Pos = <Pos> Scale = <Scale> time = <LifeTime> rgba = <dest_rgba>
	<id> :Obj_SpawnScriptNow rb_destroy_when_completed_animating
	Wait <spawn_delay> Seconds
	repeat <smoke_count>
	<Flip> = (<Flip> + 1)
	repeat 2
	repeat
endscript
