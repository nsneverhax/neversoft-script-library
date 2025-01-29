roadie_battle_equipment_types = [
	soundboard
	speakers
	amps
	fx
	guitar
	bass
	drum
]
roadie_battle_equipment_names = [
	qs(0x8df2d173)
	qs(0x86f26f09)
	qs(0x6c4ad1bd)
	qs(0x12a6f05e)
	qs(0x11355666)
	qs(0x4f551cbe)
	qs(0xf3e03f27)
]
roadie_battle_string_masks = [
	65536
	4096
	256
	16
	1
]
roadie_battle_streak_keeper_max = 15
roadie_battle_equipment_buffs = {
	soundboard = {
		start_script = roadie_battle_start_star_power_boost_buff
		stop_script = roadie_battle_stop_star_power_boost_buff
		level_params = [
			{
				duration_secs = 2
				star_power_boost_rate = 10.0
			}
			{
				duration_secs = 5
				star_power_boost_rate = 10.0
			}
			{
				duration_secs = 8
				star_power_boost_rate = 10.0
			}
		]
		active_level_player_param = roadie_battle_soundboard_buff_level
		activated_message = qs(0x3de9cba3)
		equipment_icon = soundboardicon
		start_sfx = rb_soundboardbuff
	}
	speakers = {
		start_script = roadie_battle_start_multiplier_boost_buff
		stop_script = roadie_battle_stop_multiplier_boost_buff
		level_params = [
			{
				duration_secs = 15
				multiplier_boost = 3
			}
			{
				duration_secs = 15
				multiplier_boost = 6
			}
			{
				duration_secs = 15
				multiplier_boost = 12
			}
		]
		active_level_player_param = roadie_battle_speakers_buff_level
		activated_message = qs(0x75bc9ef8)
		equipment_icon = speakericon
		start_sfx = rb_speakersbuff
	}
	amps = {
		start_script = roadie_battle_start_streak_keeper_buff
		stop_script = roadie_battle_stop_streak_keeper_buff
		is_cumulative
		level_params = [
			{
				allowed_misses = 1
			}
			{
				allowed_misses = 3
			}
			{
				allowed_misses = 6
			}
		]
		active_level_player_param = roadie_battle_amps_buff_level
		activated_message = qs(0x0de0ebd1)
		equipment_icon = ampicon
		start_sfx = rb_ampbuff
	}
	fx = {
		start_script = roadie_battle_start_multiplier_generator_buff
		stop_script = roadie_battle_stop_multiplier_generator_buff
		level_params = [
			{
				duration_secs = 10
				multiplier_speed = 2
				max_multiplier = 5
			}
			{
				duration_secs = 15
				multiplier_speed = 2
				max_multiplier = 8
			}
			{
				duration_secs = 18
				multiplier_speed = 2
				max_multiplier = 12
			}
		]
		active_level_player_param = roadie_battle_fx_buff_level
		activated_message = qs(0x2bc2b0a5)
		equipment_icon = fxicon
		start_sfx = rb_pyrobuff
	}
	guitar = {
		start_script = roadie_battle_start_star_power_generator_buff
		stop_script = roadie_battle_stop_star_power_generator_buff
		level_params = [
			{
				duration_secs = 10
				required_note_streak = 5
				star_power_boost = 20
			}
			{
				duration_secs = 12
				required_note_streak = 4
				star_power_boost = 20
			}
			{
				duration_secs = 20
				required_note_streak = 3
				star_power_boost = 20
			}
		]
		active_level_player_param = roadie_battle_instrument_buff_level
		activated_message = qs(0x66a313e9)
		equipment_icon = guitaricon
		start_sfx = rb_instrumentbuff
	}
	bass = {
		start_script = roadie_battle_start_star_power_generator_buff
		stop_script = roadie_battle_stop_star_power_generator_buff
		level_params = [
			{
				duration_secs = 10
				required_note_streak = 5
				star_power_boost = 20
			}
			{
				duration_secs = 12
				required_note_streak = 4
				star_power_boost = 20
			}
			{
				duration_secs = 20
				required_note_streak = 3
				star_power_boost = 20
			}
		]
		active_level_player_param = roadie_battle_instrument_buff_level
		activated_message = qs(0x66a313e9)
		equipment_icon = bassicon
		start_sfx = rb_instrumentbuff
	}
	drum = {
		start_script = roadie_battle_start_star_power_generator_buff
		stop_script = roadie_battle_stop_star_power_generator_buff
		level_params = [
			{
				duration_secs = 10
				required_note_streak = 5
				star_power_boost = 20
			}
			{
				duration_secs = 12
				required_note_streak = 4
				star_power_boost = 20
			}
			{
				duration_secs = 20
				required_note_streak = 3
				star_power_boost = 20
			}
		]
		active_level_player_param = roadie_battle_instrument_buff_level
		activated_message = qs(0x66a313e9)
		equipment_icon = drumicon
		start_sfx = rb_instrumentbuff
	}
}
roadie_battle_equipment_attacks = {
	soundboard = {
		start_script = roadie_battle_start_hyperspeed_attack
		stop_script = roadie_battle_stop_hyperspeed_attack
		level_params = [
			{
				hyperspeed_scale = 0.85
			}
			{
				hyperspeed_scale = 0.78999996
			}
			{
				hyperspeed_scale = 0.71999997
			}
		]
		active_level_player_param = roadie_battle_soundboard_attack_level
		activated_message = qs(0xc6f062d2)
		repair_message = qs(0x66e8a830)
		equipment_icon = soundboardicon
		start_sfx = rb_hyperspeedattack
	}
	speakers = {
		start_script = roadie_battle_start_mine_attack
		stop_script = roadie_battle_stop_mine_attack
		level_params = [
			{
				mine_time_ms_min = 3000
				mine_time_ms_max = 5000
				mine_cost = 200
			}
			{
				mine_time_ms_min = 1000
				mine_time_ms_max = 3000
				mine_cost = 300
			}
			{
				mine_time_ms_min = 250
				mine_time_ms_max = 1000
				mine_cost = 500
			}
		]
		active_level_player_param = roadie_battle_speakers_attack_level
		activated_message = qs(0x65bf9d5b)
		repair_message = qs(0xa1abc7f0)
		equipment_icon = speakericon
		start_sfx = rb_speakerattack
	}
	amps = {
		start_script = roadie_battle_start_fade_notes_attack
		stop_script = roadie_battle_stop_fade_notes_attack
		level_params = [
			{
				on_time = 0.8
				off_time = 0.2
				severity = 1
				min_start_mark = 0.05
				max_start_mark = 0.15
			}
			{
				on_time = 0.75
				off_time = 0.25
				severity = 2
				min_start_mark = 0.05
				max_start_mark = 0.15
			}
			{
				on_time = 0.55
				off_time = 0.45000002
				severity = 3
				min_start_mark = 0.05
				max_start_mark = 0.15
			}
		]
		active_level_player_param = roadie_battle_amps_attack_level
		activated_message = qs(0x817fafa0)
		repair_message = qs(0x87365391)
		equipment_icon = ampicon
		start_sfx = rb_ampattack
	}
	fx = {
		start_script = roadie_battle_start_fire_attack
		stop_script = roadie_battle_stop_fire_attack
		level_params = [
			{
				num_flames = 5
				num_lanes = 1
			}
			{
				num_flames = 8
				num_lanes = 1
			}
			{
				num_flames = 12
				num_lanes = 1
			}
		]
		active_level_player_param = roadie_battle_fx_attack_level
		activated_message = qs(0x72f33f65)
		repair_message = qs(0x883481b4)
		equipment_icon = fxicon
		start_sfx = rb_pyroattack
	}
	guitar = {
		start_script = roadie_battle_start_double_notes_attack
		stop_script = roadie_battle_stop_double_notes_attack
		level_params = [
			{
				double_note_time_ms_min = 1000
				double_note_time_ms_max = 2000
				double_note_spawn_mark = 0.25
			}
			{
				double_note_time_ms_min = 500
				double_note_time_ms_max = 1000
				double_note_spawn_mark = 0.35000002
			}
			{
				double_note_time_ms_min = 0
				double_note_time_ms_max = 250
				double_note_spawn_mark = 0.45000002
			}
		]
		active_level_player_param = roadie_battle_instrument_attack_level
		activated_message = qs(0xa6d8f61e)
		repair_message = qs(0x5dbae042)
		equipment_icon = guitaricon
		start_sfx = rb_doublenoteattack
	}
	bass = {
		start_script = roadie_battle_start_double_notes_attack
		stop_script = roadie_battle_stop_double_notes_attack
		level_params = [
			{
				double_note_time_ms_min = 1000
				double_note_time_ms_max = 2000
				double_note_spawn_mark = 0.25
			}
			{
				double_note_time_ms_min = 500
				double_note_time_ms_max = 1000
				double_note_spawn_mark = 0.35000002
			}
			{
				double_note_time_ms_min = 0
				double_note_time_ms_max = 250
				double_note_spawn_mark = 0.45000002
			}
		]
		active_level_player_param = roadie_battle_instrument_attack_level
		activated_message = qs(0x932afe42)
		repair_message = qs(0xa24b46fc)
		equipment_icon = bassicon
		start_sfx = rb_doublenoteattack
	}
	drum = {
		start_script = roadie_battle_start_double_notes_attack
		stop_script = roadie_battle_stop_double_notes_attack
		level_params = [
			{
				double_note_time_ms_min = 1000
				double_note_time_ms_max = 2000
				double_note_spawn_mark = 0.25
			}
			{
				double_note_time_ms_min = 500
				double_note_time_ms_max = 1000
				double_note_spawn_mark = 0.35000002
			}
			{
				double_note_time_ms_min = 0
				double_note_time_ms_max = 250
				double_note_spawn_mark = 0.45000002
			}
		]
		active_level_player_param = roadie_battle_instrument_attack_level
		activated_message = qs(0xfc9cc3e9)
		repair_message = qs(0x7b00dbcc)
		equipment_icon = drumicon
		start_sfx = rb_doublenoteattack
	}
}
roadie_battle_max_buff_level = 2
roadie_battle_max_attack_level = 2
roadie_battle_queue_ids = [
]
roadie_battle_buff_queue = {
}

script roadie_battle_stop_all_mods 
	roadie_battle_reset_buffs_queue
	getnumplayersingame
	getfirstplayer
	GetArraySize \{$roadie_battle_equipment_types}
	<equipment_count> = <array_Size>
	begin
	<equipment> = 0
	begin
	roadie_battle_stop_equipment_buff Player = <Player> equipment = ($roadie_battle_equipment_types [<equipment>])
	roadie_battle_stop_attack Player = <Player> equipment = ($roadie_battle_equipment_types [<equipment>])
	<equipment> = (<equipment> + 1)
	repeat <equipment_count>
	getnextplayer Player = <Player>
	repeat <num_players>
	KillSpawnedScript \{Name = roadie_battle_start_attack_sfx}
	KillSpawnedScript \{Name = roadie_battle_start_buff_sfx}
endscript

script roadie_battle_player_has_equipment \{equipment = 0x00000018
		Player = !i1768515945}
	getplayerinfo <Player> part
	switch (<equipment>)
		case guitar
		case bass
		case drum
		if (<part> = <equipment>)
			return \{true}
		endif
		default
		return \{true}
	endswitch
	return \{FALSE}
endscript

script roadie_battle_initialize_buffs_queue 
	GetArraySize \{$roadie_battle_equipment_names}
	<equipment_num> = <array_Size>
	<array> = []
	<Player> = 1
	begin
	<player_struct> = {}
	<equipment_index> = 0
	begin
	<equipment_name> = ($roadie_battle_equipment_names [<equipment_index>])
	<equipment_id> = ($roadie_battle_equipment_types [<equipment_index>])
	formatText checksumName = player_equipment_id 'player%p_%e' p = <Player> e = <equipment_name> AddToStringLookup = true
	setstructureparam struct_name = player_struct param = <equipment_id> value = <player_equipment_id>
	<equipment_index> = (<equipment_index> + 1)
	repeat <equipment_num>
	AddArrayElement array = <array> element = <player_struct>
	<Player> = (<Player> + 1)
	repeat $max_players_in_roadie_battle
	Change roadie_battle_queue_ids = <array>
	roadie_battle_reset_buffs_queue
endscript

script roadie_battle_reset_buffs_queue 
	GetArraySize \{$roadie_battle_equipment_names}
	<equipment_num> = <array_Size>
	<equipment_list> = {}
	getnumplayersingame
	getfirstplayer
	begin
	<equipment_index> = 0
	begin
	<equipment_id> = ($roadie_battle_equipment_types [<equipment_index>])
	<player_equipment_id> = ($roadie_battle_queue_ids [(<Player> - 1)].<equipment_id>)
	setstructureparam struct_name = equipment_list param = <player_equipment_id> value = []
	<equipment_index> = (<equipment_index> + 1)
	repeat <equipment_num>
	getnextplayer Player = <Player>
	repeat <num_players>
	Change roadie_battle_buff_queue = <equipment_list>
endscript

script roadie_battle_buff_queue_push \{equipment = 0x00000018
		level = !i1768515945
		Player = !i1768515945
		roadie = !i1768515945}
	<entry_id> = ($roadie_battle_queue_ids [(<Player> - 1)].<equipment>)
	<current_entries> = ($roadie_battle_buff_queue.<entry_id>)
	<new_entry> = {
		equipment = <equipment>
		level = <level>
		Player = <Player>
		roadie = <roadie>
	}
	AddArrayElement array = <current_entries> element = <new_entry>
	setstructureparam struct_name = roadie_battle_buff_queue param = <entry_id> value = <array>
endscript

script roadie_battle_buff_queue_pop \{Player = !i1768515945
		equipment = 0x00000028}
	<entry_id> = ($roadie_battle_queue_ids [(<Player> - 1)].<equipment>)
	GetArraySize ($roadie_battle_buff_queue.<entry_id>)
	if (<array_Size> > 0)
		<top_entry> = (($roadie_battle_buff_queue.<entry_id>) [0])
		<array> = []
		if (<array_Size> > 1)
			RemoveArrayElement array = ($roadie_battle_buff_queue.<entry_id>) index = 0
		else
			<array> = []
		endif
		setstructureparam struct_name = roadie_battle_buff_queue param = <entry_id> value = <array>
		return true entry = <top_entry>
	else
		return \{FALSE}
	endif
endscript

script get_roadie_battle_buff_queue_size \{Player = !i1768515945
		equipment = 0x00000028}
	<entry_id> = ($roadie_battle_queue_ids [(<Player> - 1)].<equipment>)
	GetArraySize ($roadie_battle_buff_queue.<entry_id>)
	return queue_size = <array_Size>
endscript

script roadie_battle_get_active_buff_level \{Player = !i1768515945
		equipment = 0x00000028}
	<active_level_player_param> = ($roadie_battle_equipment_buffs.<equipment>.active_level_player_param)
	getplayerinfo Player = <Player> <active_level_player_param>
	<active_level> = (<...>.<active_level_player_param>)
	return active_buff_level = <active_level>
endscript

script roadie_battle_start_equipment_buff_message \{equipment_index = !i1768515945
		level = !i1768515945
		ds_aid = !i1768515945
		Player = !i1768515945}
	if ($playing_song_for_real = 0)
		return
	endif
	if roadie_battle_find_roadie_by_aid aid = <ds_aid> assert = true
		roadie_battle_maybe_start_equipment_buff {
			equipment = ($roadie_battle_equipment_types [<equipment_index>])
			level = <level>
			Player = <Player>
			roadie = <roadie>
		}
	endif
endscript

script roadie_battle_maybe_start_equipment_buff \{equipment = 0x00000018
		level = !i1768515945
		Player = !i1768515945
		roadie = !i1768515945}
	roadie_battle_get_active_buff_level Player = <Player> equipment = <equipment>
	if StructureContains structure = ($roadie_battle_equipment_buffs.<equipment>) is_cumulative
		<active_buff_level> = -1
	endif
	get_roadie_battle_buff_queue_size Player = <Player> equipment = <equipment>
	if ((<active_buff_level> >= 0) || (<queue_size> > 0))
		roadie_battle_buff_queue_push {
			equipment = <equipment>
			level = <level>
			Player = <Player>
			roadie = <roadie>
		}
	else
		roadie_battle_start_equipment_buff {
			equipment = <equipment>
			level = <level>
			Player = <Player>
			roadie = <roadie>
		}
	endif
endscript

script roadie_battle_start_equipment_buff \{equipment = 0x00000018
		level = !i1768515945
		Player = !i1768515945
		roadie = !i1768515945}
	if debugbuild
		roadie_battle_get_active_buff_level Player = <Player> equipment = <equipment>
		if (<active_buff_level> >= 0)
			if NOT StructureContains structure = ($roadie_battle_equipment_buffs.<equipment>) is_cumulative
				ScriptAssert \{'Should not ever have to stop an active buff! Tell Marc M if this happens.'}
			endif
		endif
	endif
	<start_script> = ($roadie_battle_equipment_buffs.<equipment>.start_script)
	<level_params> = ($roadie_battle_equipment_buffs.<equipment>.level_params [<level>])
	<start_script> Player = <Player> equipment = <equipment> <level_params>
	<active_level_player_param> = ($roadie_battle_equipment_buffs.<equipment>.active_level_player_param)
	<player_info> = {}
	setstructureparam struct_name = player_info param = <active_level_player_param> value = <level>
	setplayerinfo Player = <Player> <player_info>
	roadie_battle_hud_buff_message {
		roadie = <roadie>
		Player = <Player>
		message = ($roadie_battle_equipment_buffs.<equipment>.activated_message)
		equipment_icon = ($roadie_battle_equipment_buffs.<equipment>.equipment_icon)
	}
	SpawnScriptNow {
		roadie_battle_start_buff_sfx
		params = {
			equipment = <equipment>
			Player = <Player>
			roadie = <roadie>
		}
	}
	getplayerinfo <Player> controller
	activatestarpowerpulse Player = <controller> num = 1 length = 35 Strength = 20 Priority = 100
	getplayerinfo Player = <Player> roadie_battle_roadie_index
	if (<roadie_battle_roadie_index> >= 0 && <roadie_battle_roadie_index> != <roadie>)
		getsavegamefromcontroller controller = ($primary_controller)
		GetGlobalTags achievement_info savegame = <savegame> param = roadie_battle_other_roadie_assists
		SetGlobalTags achievement_info savegame = <savegame> params = {roadie_battle_other_roadie_assists = (<roadie_battle_other_roadie_assists> + 1)}
	endif
endscript

script roadie_battle_start_buff_sfx \{equipment = 0x00000018
		Player = !i1768515945
		roadie = !i1768515945}
	roadie_battle_play_roadie_vo roadie = <roadie> vo_type = buff
	Wait \{0.839
		Seconds}
	if StructureContains structure = ($roadie_battle_equipment_buffs.<equipment>) start_sfx
		SoundEvent event = ($roadie_battle_equipment_buffs.<equipment>.start_sfx)
	endif
endscript

script roadie_battle_stop_equipment_buff \{equipment = 0x00000018
		Player = !i1768515945}
	roadie_battle_get_active_buff_level Player = <Player> equipment = <equipment>
	if (<active_buff_level> >= 0)
		stop_script = ($roadie_battle_equipment_buffs.<equipment>.stop_script)
		<stop_script> roadie = <roadie> Player = <Player>
		<active_level_player_param> = ($roadie_battle_equipment_buffs.<equipment>.active_level_player_param)
		<player_info> = {}
		setstructureparam struct_name = player_info param = <active_level_player_param> value = -1
		setplayerinfo Player = <Player> <player_info>
	endif
	if roadie_battle_buff_queue_pop Player = <Player> equipment = <equipment>
		SpawnScriptNow {
			roadie_battle_start_equipment_buff
			params = {
				equipment = (<entry>.equipment)
				level = (<entry>.level)
				Player = (<entry>.Player)
				roadie = (<entry>.roadie)
			}
		}
	endif
endscript

script roadie_battle_start_star_power_boost_buff \{Player = !i1768515945
		star_power_boost_rate = !f1768515945
		duration_secs = !f1768515945}
	extendcrcplayer roadie_battle_star_power_booster <Player> out = script_id
	SpawnScriptNow {
		roadie_battle_star_power_boost_script
		id = <script_id>
		params = {
			Player = <Player>
			roadie = <roadie>
			equipment = <equipment>
			star_power_boost_rate = <star_power_boost_rate>
			duration_secs = <duration_secs>
		}
	}
	roadie_battle_star_power_buff_animation_start Player = <Player>
endscript

script roadie_battle_stop_star_power_boost_buff \{Player = !i1768515945}
	extendcrcplayer roadie_battle_star_power_booster <Player> out = script_id
	KillSpawnedScript id = <script_id>
	roadie_battle_star_power_buff_animation_end Player = <Player>
endscript

script roadie_battle_star_power_boost_script \{Player = !i1768515945
		star_power_boost_rate = !f1768515945
		duration_secs = !f1768515945}
	<seconds_elapsed> = 0.0
	begin
	WaitOneGameFrame
	getframelength
	increase_star_power Player = <Player> amount = (<star_power_boost_rate> * <frame_length>)
	<seconds_elapsed> = (<seconds_elapsed> + <frame_length>)
	if (<seconds_elapsed> >= <duration_secs>)
		break
	endif
	repeat
	SpawnScriptNow roadie_battle_stop_equipment_buff params = {equipment = <equipment> Player = <Player>}
endscript

script roadie_battle_start_streak_keeper_buff \{Player = !i1768515945
		equipment = 0x00000028
		allowed_misses = !i1768515945}
	getplayerinfo <Player> roadie_battle_streak_keeper_notes
	<old_streak_keeper_notes> = <roadie_battle_streak_keeper_notes>
	<new_allowed_misses> = (<roadie_battle_streak_keeper_notes> + <allowed_misses>)
	if (<new_allowed_misses> > $roadie_battle_streak_keeper_max)
		<new_allowed_misses> = $roadie_battle_streak_keeper_max
	endif
	setplayerinfo Player = <Player> roadie_battle_streak_keeper_notes = <new_allowed_misses>
	if (<old_streak_keeper_notes> <= 0)
		rb_streak_keeper_visuals_start Player = <Player> allowed_misses = <allowed_misses>
	else
		rb_streak_keeper_visuals_update {
			Player = <Player>
			old_count = <roadie_battle_streak_keeper_notes>
			new_count = <new_allowed_misses>
		}
	endif
endscript

script roadie_battle_stop_streak_keeper_buff \{Player = !i1768515945}
	setplayerinfo Player = <Player> roadie_battle_streak_keeper_notes = 0
	extendcrcplayer roadie_battle_streak_keeper <Player> out = script_id
	KillSpawnedScript id = <script_id>
	rb_streak_keeper_visuals_stop Player = <Player>
endscript

script roadie_battle_streak_keeper_note_missed \{Player = !i1768515945}
	if ($roadie_battle_test_worst_case_enabled = 1)
		return
	endif
	extendcrcplayer roadie_battle_streak_keeper <Player> out = script_id
	SpawnScriptNow {
		roadie_battle_streak_keeper_note_missed_spawned
		id = <script_id>
		params = {
			Player = <Player>
		}
	}
endscript

script roadie_battle_streak_keeper_note_missed_spawned \{Player = !i1768515945}
	WaitOneGameFrame
	getplayerinfo Player = <Player> roadie_battle_streak_keeper_notes
	if (<roadie_battle_streak_keeper_notes> <= 0)
		return
	elseif (<roadie_battle_streak_keeper_notes> = 1)
		rb_streak_keeper_visuals_update {
			Player = <Player>
			old_count = 1
			new_count = 0
		}
		SoundEvent \{event = rb_ampbuffends}
		SpawnScriptNow {
			roadie_battle_stop_equipment_buff
			params = {
				equipment = amps
				Player = <Player>
			}
		}
	else
		<new_note_count> = (<roadie_battle_streak_keeper_notes> - 1)
		setplayerinfo Player = <Player> roadie_battle_streak_keeper_notes = <new_note_count>
		rb_streak_keeper_visuals_update {
			Player = <Player>
			old_count = <roadie_battle_streak_keeper_notes>
			new_count = <new_note_count>
		}
	endif
endscript

script roadie_battle_buff_timer \{Player = !i1768515945
		equipment = 0x00000028
		duration_secs = !f1768515945}
	if ($roadie_battle_test_worst_case_enabled = 1)
		return
	endif
	Wait <duration_secs> Seconds
	SpawnScriptNow {
		roadie_battle_stop_equipment_buff
		params = {
			Player = <Player>
			equipment = <equipment>
		}
	}
endscript

script roadie_battle_start_multiplier_boost_buff \{Player = !i1768515945
		equipment = 0x00000028
		multiplier_boost = !i1768515945
		duration_secs = !f1768515945}
	extendcrcplayer roadie_battle_multiplier_boost <Player> out = script_id
	SpawnScriptNow {
		roadie_battle_buff_timer
		id = <script_id>
		params = {
			Player = <Player>
			equipment = <equipment>
			duration_secs = <duration_secs>
		}
	}
	rb_multiplier_boost_show Player = <Player> multiplier_boost = <multiplier_boost> duration_secs = <duration_secs>
endscript

script roadie_battle_stop_multiplier_boost_buff \{Player = !i1768515945}
	extendcrcplayer roadie_battle_multiplier_boost <Player> out = script_id
	KillSpawnedScript id = <script_id>
	rb_multiplier_boost_hide Player = <Player>
	setplayerinfo <Player> roadie_battle_multiplier_boost = 0
	updatemultiplierchange Player = <Player>
endscript

script roadie_battle_start_multiplier_generator_buff \{Player = !i1768515945
		duration_secs = !f1768515945
		multiplier_speed = !i1768515945
		max_multiplier = !i1768515945}
	setplayerinfo <Player> multiplier_speed = <multiplier_speed>
	setplayerinfo <Player> roadie_battle_max_streak_multiplier = <max_multiplier>
	extendcrcplayer roadie_battle_multiplier_generator <Player> out = script_id
	SpawnScriptNow {
		roadie_battle_buff_timer
		id = <script_id>
		params = {
			Player = <Player>
			equipment = <equipment>
			duration_secs = <duration_secs>
		}
	}
	rb_multiplier_generator_visuals Player = <Player>
endscript

script roadie_battle_stop_multiplier_generator_buff \{Player = !i1768515945}
	extendcrcplayer roadie_battle_multiplier_generator <Player> out = script_id
	KillSpawnedScript id = <script_id>
	setplayerinfo <Player> multiplier_speed = ($g_default_scoring.multiplier_speed)
	setplayerinfo <Player> roadie_battle_max_streak_multiplier = 0
	rb_multiplier_generator_visuals_stop Player = <Player>
endscript

script roadie_battle_start_star_power_generator_buff \{Player = !i1768515945
		equipment = 0x00000028
		required_note_streak = !i1768515945
		star_power_boost = !f1768515945
		duration_secs = !f1768515945}
	setplayerinfo Player = <Player> roadie_battle_star_power_generator_boost = <star_power_boost>
	setplayerinfo Player = <Player> roadie_battle_star_power_generator_current_streak = 0
	setplayerinfo Player = <Player> roadie_battle_star_power_generator_required_streak = <required_note_streak>
	extendcrcplayer roadie_battle_star_power_generator <Player> out = script_id
	SpawnScriptNow {
		roadie_battle_buff_timer
		id = <script_id>
		params = {
			Player = <Player>
			equipment = <equipment>
			duration_secs = <duration_secs>
		}
	}
	rb_star_power_generator_create Player = <Player> note_streak = <required_note_streak>
endscript

script roadie_battle_stop_star_power_generator_buff \{Player = !i1768515945}
	setplayerinfo Player = <Player> roadie_battle_star_power_generator_boost = 0
	extendcrcplayer roadie_battle_star_power_generator <Player> out = script_id
	KillSpawnedScript id = <script_id>
	rb_star_power_generator_destroy Player = <Player>
endscript

script roadie_battle_star_power_generator_hit \{Player = !i1768515945}
	getplayerinfo Player = <Player> roadie_battle_star_power_generator_current_streak out = current_streak
	getplayerinfo Player = <Player> roadie_battle_star_power_generator_required_streak out = required_streak
	<current_streak> = (<current_streak> + 1)
	if (<current_streak> >= <required_streak>)
		SpawnScriptNow rb_star_power_generator_increment params = {Player = <Player> num = <current_streak> full = true}
		<current_streak> = 0
		SoundEvent \{event = audio_star_power_awarded}
	else
		SpawnScriptNow rb_star_power_generator_increment params = {Player = <Player> num = <current_streak> full = FALSE}
	endif
	setplayerinfo Player = <Player> roadie_battle_star_power_generator_current_streak = <current_streak>
endscript

script roadie_battle_star_power_generator_miss \{Player = !i1768515945}
	setplayerinfo Player = <Player> roadie_battle_star_power_generator_current_streak = 0
	SpawnScriptNow rb_star_power_generator_reset params = {Player = <Player>}
endscript

script roadie_battle_start_attack_message \{equipment_index = !i1768515945
		level = !i1768515945
		ds_aid = !i1768515945}
	if ($playing_song_for_real = 0)
		return
	endif
	if roadie_battle_find_roadie_by_aid aid = <ds_aid> assert = true
		roadie_battle_get_roadie_info roadie = <roadie> param = Player
		roadie_battle_start_attack {
			equipment = ($roadie_battle_equipment_types [<equipment_index>])
			level = <level>
			Player = <Player>
			roadie = <roadie>
		}
	endif
endscript

script roadie_battle_start_attack \{equipment = 0x00000018
		level = !i1768515945
		Player = !i1768515945
		roadie = !i1768515945}
	roadie_battle_stop_attack equipment = <equipment> Player = <Player>
	SpawnScriptNow {
		roadie_battle_start_attack_sfx
		params = {
			equipment = <equipment>
			Player = <Player>
			roadie = <roadie>
		}
	}
	roadie_battle_hud_attack_message {
		Player = <Player>
		message = ($roadie_battle_equipment_attacks.<equipment>.activated_message)
		equipment_icon = ($roadie_battle_equipment_attacks.<equipment>.equipment_icon)
	}
	<start_script> = ($roadie_battle_equipment_attacks.<equipment>.start_script)
	<level_params> = ($roadie_battle_equipment_attacks.<equipment>.level_params [<level>])
	<start_script> Player = <Player> <level_params>
	<active_level_player_param> = ($roadie_battle_equipment_attacks.<equipment>.active_level_player_param)
	<player_info> = {}
	setstructureparam struct_name = player_info param = <active_level_player_param> value = <level>
	setplayerinfo Player = <Player> <player_info>
	addtoplayerinfo <Player> roadie_battle_active_attack_count = 1
	if ($roadie_battle_mode = competitive)
		getsavegamefromcontroller controller = ($primary_controller)
		GetGlobalTags achievement_info savegame = <savegame> param = roadie_battle_total_imps_summoned
		SetGlobalTags achievement_info savegame = <savegame> params = {roadie_battle_total_imps_summoned = (<roadie_battle_total_imps_summoned> + 1)}
	endif
	rb_update_highway_smoke Player = <Player>
endscript

script roadie_battle_start_attack_sfx \{equipment = 0x00000018
		Player = !i1768515945
		roadie = !i1768515945}
	getplayerinfo Player = <Player> controller
	PlaySound vv_imp_cackle_c buss = UI_Battle_Mode vol = 100 controllers = {controller1 = <controller>}
	roadie_battle_play_roadie_vo roadie = <roadie> vo_type = attacked
	Wait \{0.839
		Seconds}
	if StructureContains structure = ($roadie_battle_equipment_attacks.<equipment>) start_sfx
		SoundEvent event = ($roadie_battle_equipment_attacks.<equipment>.start_sfx)
	endif
endscript

script roadie_battle_stop_attack_message \{equipment_index = !i1768515945
		ds_aid = !i1768515945}
	if roadie_battle_find_roadie_by_aid aid = <ds_aid> assert = true
		roadie_battle_repair_equipment {
			equipment = ($roadie_battle_equipment_types [<equipment_index>])
			roadie = <roadie>
		}
	endif
endscript

script roadie_battle_repair_equipment \{equipment = 0x00000018
		roadie = !i1768515945}
	<Player> = ($roadie_infos [<roadie>].Player)
	if roadie_battle_stop_attack equipment = <equipment> Player = <Player>
		getplayerinfo Player = <Player> controller
		GetRandomValue \{Name = random_sfx
			integer
			a = 0
			b = 3}
		if (<random_sfx> <= 1)
			PlaySound vv_imp_killed_e buss = UI_Battle_Mode vol = 100 controllers = {controller1 = <controller>}
		elseif (<random_sfx> >= 2)
			PlaySound vv_imp_killed_a buss = UI_Battle_Mode vol = 100 controllers = {controller1 = <controller>}
		endif
		SoundEvent \{event = rb_repair}
		roadie_battle_play_roadie_vo roadie = <roadie> vo_type = repair
		roadie_battle_hud_repair_message {
			Player = <Player>
			roadie = <roadie>
			message = ($roadie_battle_equipment_attacks.<equipment>.repair_message)
			equipment_icon = ($roadie_battle_equipment_attacks.<equipment>.equipment_icon)
		}
	endif
endscript

script roadie_battle_stop_attack \{equipment = 0x00000018
		Player = !i1768515945}
	roadie_battle_get_active_attack_level Player = <Player> equipment = <equipment>
	if (<active_attack_level> >= 0)
		stop_script = ($roadie_battle_equipment_attacks.<equipment>.stop_script)
		<stop_script> Player = <Player>
		<active_level_player_param> = ($roadie_battle_equipment_attacks.<equipment>.active_level_player_param)
		<player_info> = {}
		setstructureparam struct_name = player_info param = <active_level_player_param> value = -1
		setplayerinfo Player = <Player> <player_info>
		addtoplayerinfo <Player> roadie_battle_active_attack_count = -1
		rb_update_highway_smoke Player = <Player>
		return \{true}
	endif
	return \{FALSE}
endscript

script roadie_battle_get_active_attack_level \{Player = !i1768515945
		equipment = 0x00000028}
	<active_level_player_param> = ($roadie_battle_equipment_attacks.<equipment>.active_level_player_param)
	getplayerinfo Player = <Player> <active_level_player_param>
	<active_level> = (<...>.<active_level_player_param>)
	return active_attack_level = <active_level>
endscript

script roadie_battle_start_fade_notes_attack \{Player = !i1768515945
		on_time = !f1768515945
		off_time = !f1768515945
		min_start_mark = !f1768515945
		max_start_mark = !f1768515945}
	roadie_battle_prepare_fade_attack {
		Player = <Player>
		on_time = <on_time>
		off_time = <off_time>
		min_start_mark = <min_start_mark>
		max_start_mark = <max_start_mark>
	}
	runscriptforeachgem Player = <Player> script_name = roadie_battle_start_fading_gem script_params = {}
	SpawnScriptNow rb_highway_sparking_begin params = {Player = <Player> severity = <severity>}
	setplayerinfo Player = <Player> roadie_battle_fade_notes_active = 1
endscript

script roadie_battle_stop_fade_notes_attack \{Player = !i1768515945}
	<player_index> = (<Player> - 1)
	SpawnScriptNow rb_highway_sparking_end params = {Player = <Player>}
	runscriptforeachgem Player = <Player> script_name = roadie_battle_stop_fading_gem script_params = {}
	setplayerinfo Player = <Player> roadie_battle_fade_notes_active = 0
endscript

script roadie_battle_start_fire_attack \{Player = !i1768515945
		num_flames = !i1768515945
		num_lanes = !i1768515945}
	roadie_battle_start_lane_fires Player = <Player> num_flames = <num_flames> num_lanes = <num_lanes>
endscript

script roadie_battle_stop_fire_attack \{Player = !i1768515945}
	roadie_battle_stop_lane_fires Player = <Player>
endscript

script roadie_battle_start_mine_attack \{Player = !i1768515945
		mine_time_ms_min = !i1768515945
		mine_time_ms_max = !i1768515945
		mine_cost = !i1768515945}
	if debugbuild
		if (<mine_time_ms_min> < 0)
			ScriptAssert \{'mine_time_ms_min must be >= 0'}
		endif
		if (<mine_time_ms_max> < 0)
			ScriptAssert \{'mine_time_ms_max must be >= 0'}
		endif
		if (<mine_time_ms_min> > <mine_time_ms_max>)
			ScriptAssert \{'mine_time_ms_max must be <= mine_time_ms_max'}
		endif
	endif
	setplayerinfo <Player> roadie_battle_mine_interval_min = <mine_time_ms_min>
	setplayerinfo <Player> roadie_battle_mine_interval_max = <mine_time_ms_max>
	setplayerinfo <Player> roadie_battle_mine_cost = <mine_cost>
	setplayerinfo <Player> roadie_battle_mine_next_time = 0
	roadie_battle_start_mine_effect Player = <Player>
endscript

script roadie_battle_stop_mine_attack \{Player = !i1768515945}
	setplayerinfo <Player> roadie_battle_mine_interval_min = -1
	setplayerinfo <Player> roadie_battle_mine_interval_max = -1
	roadiebattle_purgeattackgems Player = <Player>
	roadie_battle_stop_mine_effect Player = <Player>
endscript

script roadie_battle_pick_strings \{Player = !i1768515945
		num_strings = !i1768515945}
	getplayerinfo Player = <Player> difficulty
	switch (<difficulty>)
		case easy
		<available_strings> = 3
		case medium
		<available_strings> = 4
		default
		<available_strings> = 5
	endswitch
	if (<available_strings> < <num_strings>)
		<num_strings> = <available_strings>
	endif
	<string_mask> = 0
	begin
	GetRandomValue Name = picked_string a = 0 b = (<available_strings> - 1) integer
	begin
	<picked_mask> = ($roadie_battle_string_masks [<picked_string>])
	if (<picked_mask> && <string_mask>)
		<picked_string> = (<picked_string> + 1)
		if (<picked_string> >= <available_strings>)
			<picked_string> = 0
		endif
	else
		<string_mask> = (<string_mask> || <picked_mask>)
		break
	endif
	repeat
	repeat <num_strings>
	return string_mask = <string_mask>
endscript

script roadie_battle_start_hyperspeed_attack \{Player = !i1768515945
		hyperspeed_scale = !f1768515945}
	roadie_battle_start_hyperspeed_effects Player = <Player> hyperspeed_scale = <hyperspeed_scale>
endscript

script roadie_battle_stop_hyperspeed_attack \{Player = !i1768515945}
	SoundEvent \{event = rb_hyperspeedattackend}
	roadie_battle_end_hyperspeed_effects Player = <Player>
endscript

script roadie_battle_start_double_notes_attack \{Player = !i1768515945
		double_note_time_ms_min = !i1768515945
		double_note_time_ms_max = !i1768515945
		double_note_spawn_mark = !f1768515945}
	if debugbuild
		if (<double_note_time_ms_min> < 0)
			ScriptAssert \{'double_note_time_ms_min must be >= 0'}
		endif
		if (<double_note_time_ms_max> < 0)
			ScriptAssert \{'double_note_time_ms_max must be >= 0'}
		endif
		if (<double_note_time_ms_min> > <double_note_time_ms_max>)
			ScriptAssert \{'double_note_time_ms_min must be <= double_note_time_ms_max'}
		endif
		if ((<double_note_spawn_mark> < 0) || (<double_note_spawn_mark> > 1))
			ScriptAssert \{'double_note_spawn_mark must be between 0 and 1'}
		endif
	endif
	setplayerinfo <Player> roadie_battle_double_note_interval_min = <double_note_time_ms_min>
	setplayerinfo <Player> roadie_battle_double_note_interval_max = <double_note_time_ms_max>
	setplayerinfo <Player> roadie_battle_double_note_next_time = 0
	roadie_battle_start_double_note_effect Player = <Player> double_note_spawn_mark = <double_note_spawn_mark>
endscript

script roadie_battle_stop_double_notes_attack \{Player = !i1768515945}
	setplayerinfo <Player> roadie_battle_double_note_interval_min = -1
	setplayerinfo <Player> roadie_battle_double_note_interval_max = -1
	roadiebattle_purgeattackgems Player = <Player>
	roadie_battle_stop_double_note_effect Player = <Player>
endscript
