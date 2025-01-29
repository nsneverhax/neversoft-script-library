ds_no_assert_on_bad_send_data = 1
roadie_battle_in_game = 0
roadie_battle_roadie_difficulties = [
	0
	0
]
roadie_battle_intro_movie_length = 10500
roadie_battle_equipment_attacks = {
	speaker = {
		Name = 'speaker'
		icon_texture = speakericon
		icon_slot = 3
		display_text = qs(0x86f26f09)
		attack_array = [
			{
				Scr = roadie_battle_mine_attack
				params = {
				}
				text = qs(0x97048bc4)
			}
			{
				Scr = roadie_battle_mine_attack
				params = {
				}
				text = qs(0x97048bc4)
			}
			{
				Scr = roadie_battle_mine_attack
				params = {
				}
				text = qs(0x97048bc4)
			}
		]
	}
	guitar = {
		Name = 'guitar'
		icon_texture = guitaricon
		icon_slot = 1
		display_text = qs(0x11355666)
		attack_array = [
			{
				Scr = roadie_battle_lefty_flip
				params = {
				}
				text = qs(0x83adf584)
			}
			{
				Scr = roadie_battle_lefty_flip
				params = {
				}
				text = qs(0x83adf584)
			}
			{
				Scr = roadie_battle_lefty_flip
				params = {
				}
				text = qs(0x83adf584)
			}
		]
	}
	soundboard = {
		Name = 'soundboard'
		icon_texture = soundboardicon
		icon_slot = 4
		display_text = qs(0x8df2d173)
		attack_array = [
			{
				Scr = roadie_battle_hyperspeed
				params = {
				}
				text = qs(0x92754b35)
			}
			{
				Scr = roadie_battle_hyperspeed
				params = {
				}
				text = qs(0x92754b35)
			}
			{
				Scr = roadie_battle_hyperspeed
				params = {
				}
				text = qs(0x92754b35)
			}
		]
	}
	effects = {
		Name = 'effects'
		icon_texture = pyroicon
		icon_slot = 2
		display_text = qs(0xc0859026)
		attack_array = [
			{
				Scr = roadie_battle_effects_attack
				params = {
				}
				text = qs(0xbd1f506a)
			}
			{
				Scr = roadie_battle_effects_attack
				params = {
				}
				text = qs(0xbd1f506a)
			}
			{
				Scr = roadie_battle_effects_attack
				params = {
				}
				text = qs(0xbd1f506a)
			}
		]
	}
	amp = {
		Name = 'amp'
		icon_texture = ampicon
		icon_slot = 0
		display_text = qs(0x6c4ad1bd)
		attack_array = [
			{
				Scr = roadie_battle_amp_overload
				params = {
				}
				text = qs(0xd5c138b1)
			}
			{
				Scr = roadie_battle_amp_overload
				params = {
				}
				text = qs(0xd5c138b1)
			}
			{
				Scr = roadie_battle_amp_overload
				params = {
				}
				text = qs(0xd5c138b1)
			}
		]
	}
}
cyclic_fade_on_min_delay = 0.1
cyclic_fade_on_max_delay = 0.3
cyclic_fade_off_min_delay = 0.1
cyclic_fade_off_max_delay = 0.2
cyclic_fade_fading_time = 0.1
mine_frequency = 0.1
roadie_battle_ai_modifiers_global = {
	miss_modifier_chord = 0.5
	strum_threshold = 20.0
	hold_threshold = 40.0
	miss_string_distance_close = 0.25
	miss_string_distance_medium = 0.5
	miss_string_distance_far = 1.0
	miss_string_modifier_close = 0.5
	miss_string_modifier_medium = 0.3
	miss_string_modifier_far = 0.15
	scorediff_danger = -7000
	scorediff_bad = -3000
	scorediff_normal = 5000
	star_power_base_chance_danger = 0.3
	star_power_base_chance_bad = 0.25
	star_power_base_chance_normal = 0.2
	star_power_base_chance_good = 0.1
	star_power_modifier_maxed = 0.25
	same_pattern_multiplier = 0.25
	amp_attack_modifier = 0.04
	effects_attack_modifier = 0.02
	guitar_attack_modifier = 0.1
	soundboard_attack_modifier = 0.03
	speaker_attack_modifier = 0.0
	mine_hit_chance = 0.06
	rapid_threshold = 150
	rapid_modifier = 0.120000005
}
roadie_battle_ai_modifiers_easy = {
	base_miss_rate_danger = 0.16
	base_miss_rate_bad = 0.21000001
	base_miss_rate_normal = 0.28
	base_miss_rate_good = 0.33
}
roadie_battle_ai_modifiers_medium = {
	base_miss_rate_danger = 0.05
	base_miss_rate_bad = 0.11
	base_miss_rate_normal = 0.19
	base_miss_rate_good = 0.25
}
roadie_battle_ai_modifiers_hard = {
	base_miss_rate_danger = 0.01
	base_miss_rate_bad = 0.03
	base_miss_rate_normal = 0.05
	base_miss_rate_good = 0.1
}
roadie_battle_ai_modifiers_expert = {
	base_miss_rate_danger = 0.01
	base_miss_rate_bad = 0.02
	base_miss_rate_normal = 0.03
	base_miss_rate_good = 0.05
}
roadie_battle_amp_overload_flicker_amounts = {
	beginner = 0
	easy = 2
	medium = 2
	hard = 2
	expert = 2
}
roadie_battle_hyperspeed_scale_amounts = {
	beginner = 0.0
	easy = 0.7
	medium = 0.7
	hard = 0.8
	expert = 0.8
}
points_per_mine = {
	beginner = 0.0
	easy = 200.0
	medium = 200.0
	hard = 200.0
	expert = 200.0
}
roadie1_equipment_sabotaged = 0
roadie2_equipment_sabotaged = 0
roadie1_equipment_repaired = 0
roadie2_equipment_repaired = 0
roadie1_last_time_without_sabotages = 0
roadie2_last_time_without_sabotages = 0
roadie1_total_sabotage_time = 0
roadie2_total_sabotage_time = 0
roadie1_history = [
]
roadie2_history = [
]
roadie1_expression = Idle
roadie2_expression = Idle
roadie_battle_previous_song_length = 0

script is_roadie_battle_mode 
	if ($game_mode = roadie_battle)
		return \{true}
	endif
	gamemode_gettype
	if (<Type> = pro_faceoff || <Type> = competitive)
		if ($competitive_rules = roadie_battle)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script is_not_roadie_battle_mode 
	if is_roadie_battle_mode
		return \{FALSE}
	else
		return \{true}
	endif
endscript
roadie_battle_cheat_performancemode_save = -1

script roadie_battle_init_gameplay 
	if NOT is_roadie_battle_mode
		return
	endif
	Change \{current_level = load_z_vvstudio}
	Change \{disable_all_starpower = 1}
	Change roadie_battle_cheat_performancemode_save = ($Cheat_PerformanceMode)
	Change \{Cheat_PerformanceMode = -1}
	setplayerinfo \{1
		cheat_hyperspeed_value = 1.0}
	setplayerinfo \{2
		cheat_hyperspeed_value = 1.0}
	getnumplayersingame
	if (<num_players> = 1)
		getfirstplayer
		if (<Player> = 1)
			<bot> = 2
		else
			<bot> = 1
		endif
		setplayerinfo <bot> in_game = 1
		setplayerinfo <bot> roadie_battle_ai = 1
		setup_bot_controller Player = <bot>
		getplayerinfo <Player> part
		setplayerinfo <bot> part = <part>
		getplayerinfo <Player> difficulty
		setplayerinfo <bot> difficulty = <difficulty>
	endif
endscript
roadie_battle_intro_ran = 0

script roadie_battle_start_game_spawned 
	if NOT is_roadie_battle_mode
		return
	endif
	Change \{roadie_battle_intro_ran = 0}
	if ($roadie_battle_intro_movie_length > 0)
		begin
		GetSongTimeMs
		if (<time> >= (-1 * $roadie_battle_intro_movie_length))
			break
		endif
		WaitOneGameFrame
		repeat
		wiidscommunication :sendmessage \{play_intro_movie}
	endif
	begin
	GetSongTimeMs
	if (<time> >= -2000)
		if ($roadie_battle_intro_ran = 0)
			SpawnScriptNow \{roadie_battle_display_intro_screen}
			Change \{roadie_battle_intro_ran = 1}
		endif
	endif
	if (<time> >= 0)
		break
	endif
	WaitOneGameFrame
	repeat
	roadie_battle_start_game
endscript

script roadie_battle_start_game 
	if NOT is_roadie_battle_mode
		return
	endif
	songgetaudiolength
	Change roadie_battle_previous_song_length = <time>
	roadie_battle_stop_game
	Change \{debug_forcescore = good}
	SpawnScriptNow \{roadie_battle_pumper_script}
	if ScriptIsRunning \{roadie_battle_vs_meter_loop}
		KillSpawnedScript \{Name = roadie_battle_vs_meter_loop}
	endif
	SpawnScriptNow \{roadie_battle_vs_meter_loop}
	SpawnScriptNow \{roadie_battle_help_prompt_loop
		params = {
			Player = 1
		}}
	SpawnScriptNow \{roadie_battle_help_prompt_loop
		params = {
			Player = 2
		}}
	SpawnScriptNow \{roadie_battle_highway_highway_shift_hack}
	Change \{roadie_battle_in_game = 1}
	wiidscommunication :sendmessage \{start_mode}
	<roadie_index> = 0
	begin
	if (($roadie_infos [<roadie_index>].is_ai) = 1)
		<roadie> = (<roadie_index> + 1)
		SpawnScriptNow roadie_battle_ai_loop id = roadie_battle_ai_scripts params = {roadie = <roadie>}
	endif
	<roadie_index> = (<roadie_index> + 1)
	repeat 2
	Change \{roadie1_history = [
		]}
	Change \{roadie2_history = [
		]}
	Change \{roadie_battle_ds_disconnect_wait_hack = 0}
endscript

script roadie_battle_play_fretboard_sfx 
	SoundEvent \{event = roadie_battle_fretboard}
	SoundEvent \{event = roadie_battle_fretboard2}
	SoundEvent \{event = Song_Intro_Kick_SFX}
	Wait \{1.0
		Seconds}
	SoundEvent \{event = roadie_battle_sabotage_sfx}
endscript

script roadie_battle_display_intro_screen 
	ResolveScreenElementID \{id = {
			hud_root
			child = 0
		}
		param = hud_container}
	if NOT ScreenElementExists id = <hud_container>
		return
	endif
	root_window :se_getprops
	<orig_root_window_alpha> = <alpha>
	<orig_root_window_pos> = <Pos>
	root_window :se_setprops \{alpha = 1.0}
	root_window :se_setprops \{Pos = (0.0, 0.0)}
	if ScreenElementExists \{id = roadie_battle_intro_container}
		DestroyScreenElement \{id = roadie_battle_intro_container}
	endif
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = roadie_battle_intro_container
		rgba = [
			0
			0
			0
			255
		]
		dims = (0.0, 0.0)
		Pos = (0.0, 0.0)
		pos_anchor = [
			center
			center
		]
		just = [
			center
			center
		]}
	<fade_id> = <id>
	CreateScreenElement {
		Type = ContainerElement
		parent = <fade_id>
		Pos = <Pos>
		dims = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
	}
	<container_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		z_priority = 200
		Pos = (0.0, -60.0)
		Scale = 0.8
		texture = online_team_select_vs
	}
	<vs_text_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <vs_text_id>
		z_priority = 199
		rgba = [0 0 0 255]
		Pos = (5.0, 5.0)
		pos_anchor = [center center]
		texture = online_team_select_vs
	}
	SpawnScriptNow roadie_battle_intro_text_fader params = {delay = 0.33 sustain = 1.5 container_id = <vs_text_id>}
	if ScreenElementExists \{id = roadie_battle_names_container}
		DestroyScreenElement \{id = roadie_battle_names_container}
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = roadie_battle_names_container
		parent = <fade_id>
		Pos = <Pos>
		dims = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
	}
	Player = 1
	begin
	formatText TextName = team_text qs(0x10fda5ef) n = <Player>
	band_lobby_rockertext Player = <Player> viewport_index = (<Player> -1)
	formatText TextName = rocker_name qs(0x545e649b) r = (<text_params>.a)
	roadie_battle_get_roadie_from_player Player = <Player>
	formatText TextName = ds_name qs(0x3415bfde) d = (($roadie_infos [(<roadie> -1)]).Name)
	formatText TextName = tmp '%r & %d' r = (<text_params>.a) d = (($roadie_infos [(<roadie> -1)]).Name)
	formatText TextName = combo_name qs(0x545e649b) r = <tmp>
	if (<Player> = 1)
		<rgba> = [135 189 189 255]
		<delay> = 0.0
		<Pos> = (-320.0, -80.0)
		names_text_id = team1_names
	else
		<rgba> = [255 135 135 255]
		<delay> = 0.0
		<Pos> = (320.0, -80.0)
		names_text_id = team2_names
	endif
	roadie_battle_hud_get_id Player = <Player>
	CreateScreenElement {
		Type = ContainerElement
		parent = roadie_battle_names_container
		Pos = <Pos>
		dims = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
	}
	<container_id> = <id>
	<text_props> = {
		font = fontgrid_title_a1
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		internal_just = [center center]
		enable_min_scaling = FALSE
		Type = TextBlockElement
		rgba = <rgba>
		z_priority = 200
	}
	CreateScreenElement {
		<text_props>
		parent = <container_id>
		internal_scale = 1.0
		Pos = (0.0, -100.0)
		dims = (400.0, 150.0)
		text = <team_text>
		rgba = [0 0 0 0]
		shadow_rgba = [0 0 0 0]
	}
	<team_text_id> = <id>
	CreateScreenElement {
		<text_props>
		parent = <container_id>
		internal_scale = 0.75
		internal_just = [right center]
		Pos = (-100.0, -25.0)
		dims = (400.0, 150.0)
		text = <rocker_name>
	}
	<rocker_name_id> = <id>
	<final_props> = {
		Pos = (-140.0, -215.0)
		Scale = 0.6
		time = 0.5
		motion = smooth
	}
	SpawnScriptNow roadie_battle_intro_text_fader params = {
		delay = <delay>
		sustain = 4.0
		container_id = <rocker_name_id>
		final_props = <final_props>
	}
	CreateScreenElement {
		<text_props>
		parent = <container_id>
		internal_scale = 0.75
		internal_just = [left center]
		Pos = (0.0, 30.0)
		dims = (400.0, 150.0)
		text = <ds_name>
	}
	<ds_name_id> = <id>
	<final_props> = {
		Pos = (110.0, -215.0)
		Scale = 0.6
		time = 0.5
		motion = smooth
	}
	<other_props> = {
		alpha = 1
		time = 0.25
		motion = ease_out
	}
	SpawnScriptNow roadie_battle_intro_text_fader params = {
		delay = <delay>
		sustain = 4.0
		container_id = <ds_name_id>
		final_props = <final_props>
	}
	getplayerinfo <Player> roadie_battle_ai
	if NOT ((<roadie_battle_ai>) = 1)
		getplayerinfo <Player> controller
		freestyle_spawn_controller_lights {
			Pos = (200.0, 280.0)
			Scale = 1.0
			spacing = 16
			z_priority = 100
			parent = <team_text_id>
			Player = <Player>
			controller = <controller>
			animated
		}
	endif
	SpawnScriptNow roadie_battle_intro_text_fader params = {delay = <delay> sustain = 2.0 container_id = <team_text_id>}
	<Player> = (<Player> + 1)
	repeat 2
	Wait \{3.0
		Seconds}
	root_window :se_setprops alpha = <orig_root_window_alpha>
	root_window :se_setprops Pos = <orig_root_window_pos>
endscript

script roadie_battle_intro_text_fader 
	RequireParams \{[
			delay
			sustain
			container_id
		]
		all}
	<container_id> :se_setprops alpha = 0
	Wait <delay> Seconds
	<container_id> :se_setprops alpha = 1.0 time = 0.25 motion = ease_out
	<container_id> :se_waitprops
	Wait <sustain> Seconds
	if GotParam \{second_props}
		<container_id> :se_setprops <second_props>
		<container_id> :se_waitprops
	endif
	if GotParam \{final_props}
		<container_id> :se_setprops <final_props>
	endif
	if GotParam \{other_id}
		<other_id> :se_setprops <other_props>
	endif
	if GotParam \{final_props}
		return
	endif
	<container_id> :se_setprops alpha = 0.0 time = 0.5 motion = ease_out
	<container_id> :se_waitprops
	DestroyScreenElement id = <container_id>
endscript

script roadie_battle_stop_game \{showresults = 0}
	Change \{roadie_battle_in_game = 0}
	if NOT is_roadie_battle_mode
		return
	endif
	wiidscommunication :sendmessage \{set_holding_mode}
	roadie_battle_killspawnedscripts
	getfirstplayer
	begin
	if (<Player> < 0)
		return
	endif
	setplayerinfo <Player> roadie_battle_amp_attack = -1
	setplayerinfo <Player> roadie_battle_guitar_attack = -1
	setplayerinfo <Player> roadie_battle_soundboard_attack = -1
	setplayerinfo <Player> roadie_battle_speaker_attack = -1
	setplayerinfo <Player> roadie_battle_effects_attack = -1
	setplayerinfo <Player> roadie_battle_hyperspeed_scale = 1.0
	setplayerinfo <Player> mine_attack = -1
	setplayerinfo <Player> double_notes = -1
	setplayerinfo <Player> shake_notes = -1
	setplayerinfo <Player> roadie_battle_hyperspeed_scale = 1.0
	getplayerinfo <Player> difficulty
	difficulty_setup Player = <Player> difficulty = <difficulty>
	set_highway_speed Player = <Player>
	getplayerinfo <Player> lefthanded_gems_flip_save
	getplayerinfo <Player> lefthanded_gems
	if NOT (<lefthanded_gems_flip_save> = <lefthanded_gems>)
		setplayerinfo <Player> lefthanded_gems = <lefthanded_gems_flip_save>
	endif
	getplayerinfo <Player> lefthanded_button_ups_flip_save
	getplayerinfo <Player> lefthanded_button_ups
	if NOT (<lefthanded_button_ups_flip_save> = <lefthanded_button_ups>)
		setplayerinfo <Player> lefthanded_button_ups = <lefthanded_button_ups_flip_save>
	endif
	getnextplayer Player = <Player>
	repeat 2
	Change \{battle_p1_highway_hammer = 0}
	Change \{battle_p2_highway_hammer = 0}
	SetArrayElement \{ArrayName = roadie_battle_roadie_difficulties
		globalarray
		index = 0
		NewValue = 0}
	SetArrayElement \{ArrayName = roadie_battle_roadie_difficulties
		globalarray
		index = 1
		NewValue = 0}
	if (<showresults> = 1)
		if ScreenElementExists \{id = roadie_battle_names_container}
			DestroyScreenElement \{id = roadie_battle_names_container}
		endif
		getfirstplayer
		getplayerinfo <Player> score out = p1_score
		getnextplayer Player = <Player>
		getplayerinfo <Player> score out = p2_score
		p1_won = FALSE
		p2_won = FALSE
		if (<p1_score> > <p2_score>)
			p1_won = true
		elseif (<p1_score> < <p2_score>)
			p2_won = true
		else
			p1_won = true
			p2_won = true
		endif
		printf 'In roadie_battle_deinit--p1_won: %d...' d = <p1_won>
		wiidscommunication :sendmessage end_mode p1_wins = <p1_won> p2_wins = <p2_won>
	endif
endscript

script roadie_battle_get_sabotaged_and_repaired 
	RequireParams \{[
			roadie
		]
		all}
	formatText checksumName = roadie_history 'roadie%r_history' r = <roadie>
	GetArraySize ($<roadie_history>)
	i = 0
	repaired = 0
	sabotaged = 0
	begin
	<history_entry> = ($<roadie_history> [<i>])
	if ((<history_entry>.Type) = Attack)
		<sabotaged> = (<sabotaged> + 1)
	elseif ((<history_entry>.Type) = repair)
		<repaired> = (<repaired> + 1)
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return sabotaged = <sabotaged> repaired = <repaired>
endscript

script roadie_battle_get_total_time_sabotaged 
	RequireParams \{[
			roadie
		]
		all}
	formatText checksumName = roadie_history 'roadie%r_history' r = <roadie>
	GetArraySize ($<roadie_history>)
	i = 0
	total_time_sabotaged = 0
	previous_first_sabotage_time = 0
	previous_attack_count_change_time = 0
	average_number_attacked = 0
	<state> = repaired
	begin
	<history_entry> = ($<roadie_history> [<i>])
	if (((<history_entry>.Type) = recv_attack))
		<state> = sabotaged
		if ((<history_entry>.total_attacks) = 1)
			<previous_first_sabotage_time> = (<history_entry>.time)
		else
			<average_number_attacked> = (<average_number_attacked> + (((<history_entry>.time) - <previous_attack_count_change_time>) * ((<history_entry>.total_attacks) -1)))
		endif
		<previous_attack_count_change_time> = (<history_entry>.time)
	elseif (((<history_entry>.Type) = repair))
		if ((<history_entry>.total_attacks) = 0)
			<state> = repaired
			<total_time_sabotaged> = (<total_time_sabotaged> + ((<history_entry>.time) - <previous_first_sabotage_time>))
		else
			<average_number_attacked> = (<average_number_attacked> + (((<history_entry>.time) - <previous_attack_count_change_time>) * ((<history_entry>.total_attacks) + 1)))
		endif
		<previous_attack_count_change_time> = (<history_entry>.time)
	endif
	<i> = (<i> + 1)
	printf <average_number_attacked>
	repeat <array_Size>
	if (<state> = sabotaged)
		<total_time_sabotaged> = (<total_time_sabotaged> + ($roadie_battle_previous_song_length - <previous_first_sabotage_time>))
	endif
	<average_number_attacked> = (<average_number_attacked> / $roadie_battle_previous_song_length)
	return total_time_sabotaged = <total_time_sabotaged> average_number_attacked = <average_number_attacked>
endscript

script roadie_battle_deinit_gameplay 
	roadie_battle_reset_hyperspeed \{target_player = 1}
	roadie_battle_reset_hyperspeed \{target_player = 2}
	setplayerinfo \{1
		shake_notes = -1}
	setplayerinfo \{2
		shake_notes = -1}
	if ScreenElementExists \{id = roadie_battle_names_container}
		DestroyScreenElement \{id = roadie_battle_names_container}
	endif
	if ScreenElementExists \{id = roadie_battle_intro_container}
		DestroyScreenElement \{id = roadie_battle_intro_container}
	endif
	roadie_battle_stop_game
	KillSpawnedScript \{Name = roadie_battle_start_game_spawned}
	KillSpawnedScript \{Name = roadie_battle_start_game}
	Change \{debug_forcescore = OFF}
	roadie_battle_shutdown_bot
	Change \{disable_crowd = 0}
	Change \{disable_all_starpower = 0}
	Change Cheat_PerformanceMode = ($roadie_battle_cheat_performancemode_save)
endscript

script rb_choose_sides 
	ui_event \{event = menu_back
		data = {
			state = uistate_band_lobby_setup
		}}
	roadie_battle_stop_game
	KillSpawnedScript \{Name = roadie_battle_start_game_spawned}
	KillSpawnedScript \{Name = roadie_battle_start_game}
	songlist_clear_playlist
endscript

script roadie_battle_pause_game 
	if (is_roadie_battle_mode)
		if ($roadie_battle_in_game = 1)
			wiidscommunication :sendmessage \{pause_mode
				send_immediately = true}
		endif
	endif
endscript

script roadie_battle_resume_game 
	if (is_roadie_battle_mode)
		if ($roadie_battle_in_game = 1)
			wiidscommunication :sendmessage \{resume_mode}
		endif
	endif
endscript

script roadie_battle_shutdown_bot 
	Player = 1
	begin
	getplayerinfo <Player> roadie_battle_ai
	if (<roadie_battle_ai> = 1)
		setplayerinfo <Player> roadie_battle_ai = 0
		setplayerinfo <Player> in_game = 0
		getplayerinfo <Player> bot_original_controller
		if NOT (<bot_original_controller> = -1)
			setplayerinfo <Player> controller = <bot_original_controller>
		endif
		break
	endif
	Player = (<Player> + 1)
	repeat 2
endscript

script fade_gems 
	GetRandomValue \{a = $cyclic_fade_min_delay
		b = $cyclic_fade_max_delay
		Name = time}
	Wait <time> Seconds
	begin
	LaunchGemEvent event = cyclic_fade Player = <Player>
	Wait \{1
		gameframe}
	repeat
endscript

script roadie_battle_make_hyperhoop 
	<base_width> = ((<highway_struct>.highway_top_width) + (3.0 * (<highway_struct>.sidebar_x_offset)))
	<base_height> = (<base_width> * 0.5)
	<dims> = (0.0, 0.0)
	setpaircomponents dims X = <base_width> y = <base_height>
	<rgba> = [200 200 255 255]
	<alpha> = (255.0 * <ratio>)
	CastToInteger \{alpha}
	SetArrayElement ArrayName = rgba index = 3 NewValue = <alpha>
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		texture = `rb-highway-hyperhoops`
		blend = add
		Pos = (0.0, 0.0)
		just = [center , bottom]
		dims = <dims>
		z_priority = 5.1
		rgba = <rgba>
		alpha = 0
	}
	if ScreenElementExists \{id = last_hoop}
		AssignAlias \{id = last_hoop
			alias = last_last_hoop}
	endif
	AssignAlias id = <id> alias = last_hoop
	<end_pos> = (0.0, 1000.0)
	start_scale_x = 1.0
	start_scale_y = 1.0
	end_scale_x = (1.0 + (1.3299999 * 2))
	end_scale_y = (1.0 + (1.3299999 * 2))
	highway_speed_mult = 2.5
	return <...>
endscript

script roadie_battle_make_gem_ampfade_overlay 
	RequireParams \{[
			parent
		]
		all}
	if NOT ScreenElementExists id = <parent>
		return
	endif
	ExtendCrc <parent> '_ampfade' out = id
	if ScreenElementExists id = <id>
		return
	endif
	frame_length = 0.015999999
	<gem_id> = <parent>
	<gem_id> :se_getparentid
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent_id>
		id = <id>
		texture = `rb-highway-ampgem`
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		use_animated_uvs = true
		top_down_v
		frame_length = <frame_length>
		num_uv_frames = (2.0, 5.0)
		blend = add
		Scale = 0.25
		z_priority = 4.15
		loop_animated_uvs = FALSE
	}
	RunScriptOnScreenElement id = <id> roadie_battle_move_gem_ampfade_overlay params = {gem_id = <gem_id>}
	Wait (<frame_length> * 10) Seconds
	DestroyScreenElement id = <id>
endscript

script roadie_battle_move_gem_ampfade_overlay 
	RequireParams \{[
			gem_id
		]
		all}
	begin
	if NOT ScreenElementExists id = <gem_id>
		break
	else
		<gem_id> :se_getprops
		se_setprops Pos = <Pos> Scale = (<Scale> * 0.25)
	endif
	WaitOneGameFrame
	repeat
	se_setprops \{alpha = 0}
endscript

script roadie_battle_make_gem_sparks 
	begin
	if NOT ScreenElementExists id = <parent>
		return
	endif
	<parent> :se_getprops Pos
	if ((<Pos> [1]) > 210)
		break
	endif
	Wait \{1
		gameframe}
	repeat 60
	SpawnScriptNow roadie_battle_speaker_attack_animate_sparks params = {target_player = <Player>}
	begin
	if NOT ScreenElementExists id = <parent>
		return
	endif
	<parent> :se_getprops Pos
	if ((<Pos> [1]) > 410)
		break
	endif
	Wait \{1
		gameframe}
	repeat 60
	if NOT ScreenElementExists id = <parent>
		return
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		texture = `rb-highway-overloadedgem`
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		use_animated_uvs = true
		top_down_v
		frame_length = 0.01
		num_uv_frames = (13.0, 1.0)
		blend = add
		Scale = 0.125
		z_priority = 4.15
		loop_animated_uvs = FALSE
		current_frames = (6.0, 0.0)
	}
	Wait (0.01 * 13) Seconds
	<parent> :se_setprops texture = `rb-highway-explodedgem`
	DestroyScreenElement id = <id>
	if NOT ScreenElementExists id = <parent>
		return
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		texture = `rb-highway-explodedgemglow`
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		z_priority = 4.25
	}
	RunScriptOnScreenElement id = <id> roadie_battle_alpha_flicker params = {min_alpha = 0.45000002}
endscript

script roadie_battle_make_gem_hypertrail 
	RequireParams \{[
			Player
		]
		all}
	if NOT ScreenElementExists id = <parent>
		return
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		texture = `rb-highway-hypergemglow`
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		z_priority = 6.15
		alpha = 0.3
	}
	formatText checksumName = highway_id 'highway_containerp%p' p = <Player>
	RunScriptOnScreenElement id = <id> roadie_battle_spawn_hypertrail_segments params = {Player = <Player>}
endscript

script roadie_battle_spawn_hypertrail_segments 
	RequireParams \{[
			Player
		]
		all}
	se_getparentid
	<parent_id> :se_getprops
	<gem_id> = <parent_id>
	<parent_id> :se_getparentid
	getplayerinfo <Player> difficulty
	<final_hyperspeed_scale> = ($roadie_battle_hyperspeed_scale_amounts.<difficulty>)
	begin
	<gem_id> :se_getprops
	getplayerinfo <Player> roadie_battle_hyperspeed_scale
	<roadie_battle_hyperspeed_scale> = ((1.0 - <roadie_battle_hyperspeed_scale>) / (1.0 - <final_hyperspeed_scale>))
	<alpha> = (0.75 * <roadie_battle_hyperspeed_scale>)
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent_id>
		texture = `rb-highway-hypertrail`
		Pos = <Pos>
		Scale = <Scale>
		just = <just>
		pos_anchor = <pos_anchor>
		blend = add
		z_priority = (<z_priority> -1.0)
		alpha = <alpha>
	}
	SpawnScriptNow roadie_battle_fade_hypertrail_segment params = {id = <id>}
	Wait \{0.1
		Seconds}
	repeat
endscript

script roadie_battle_fade_hypertrail_segment 
	RequireParams \{[
			id
		]
		all}
	<id> :se_setprops alpha = 0 time = 0.5 Scale = (0.25, 2.0) Pos = {(0.0, 50.0) relative}
	<id> :se_waitprops
	DestroyScreenElement id = <id>
endscript

script roadie_battle_alpha_flicker 
	if NOT GotParam \{min_alpha}
		<min_alpha> = 0.0
	endif
	if NOT GotParam \{max_alpha}
		<max_alpha> = 1.0
	endif
	if NOT GotParam \{fade_time}
		<fade_time> = 0.03
	endif
	if NOT GotParam \{min_delay_time}
		<max_delay_time> = 0.0
	endif
	if NOT GotParam \{max_delay_time}
		<max_delay_time> = 0.06
	endif
	begin
	GetRandomValue a = <min_alpha> b = <max_alpha> Name = alpha
	se_setprops alpha = <alpha> time = <fade_time>
	se_waitprops
	GetRandomValue a = <min_delay_time> b = <max_delay_time> Name = delay_time
	Wait <delay_time> Seconds
	repeat
endscript

script roadie_battle_killspawnedscripts 
	KillSpawnedScript \{id = roadie_battle_attack}
	KillSpawnedScript \{id = battle_hyperspeed_ramp_p1}
	KillSpawnedScript \{id = battle_hyperspeed_ramp_p2}
	KillSpawnedScript \{Name = roadie_battle_stop_attack}
	KillSpawnedScript \{Name = roadie_battle_launch_attack}
	KillSpawnedScript \{Name = roadie_battle_pumper_script}
	KillSpawnedScript \{id = roadie_battle_fade_gems_p1}
	KillSpawnedScript \{id = roadie_battle_fade_gems_p2}
	KillSpawnedScript \{id = roadie_battle_amp_create_highway_soundwaves_p1}
	KillSpawnedScript \{id = roadie_battle_amp_create_highway_soundwaves_p2}
	KillSpawnedScript \{id = speaker_shake_script_p1}
	KillSpawnedScript \{id = speaker_shake_script_p2}
	KillSpawnedScript \{id = roadie_battle_ai_scripts}
	KillSpawnedScript \{Name = roadie_battle_vs_meter_loop}
	KillSpawnedScript \{Name = pulse_props_to_beat}
	KillSpawnedScript \{Name = roadie_battle_help_prompt_loop}
	KillSpawnedScript \{Name = roadie_battle_guitar_attack_spawn_cyclones}
	KillSpawnedScript \{id = left_roadie_portrait_animation_script}
	KillSpawnedScript \{id = right_roadie_portrait_animation_script}
	begin
	if ScriptIsRunning \{roadie_battle_speaker_attack_shake_speaker}
		KillSpawnedScript \{Name = roadie_battle_speaker_attack_shake_speaker}
	elseif ScriptIsRunning \{roadie_battle_ai_loop}
		KillSpawnedScript \{Name = roadie_battle_ai_loop}
	elseif ScriptIsRunning \{roadie_battle_make_gem_sparks}
		KillSpawnedScript \{Name = roadie_battle_make_gem_sparks}
	elseif ScriptIsRunning \{roadie_battle_highway_highway_shift_hack}
		KillSpawnedScript \{Name = roadie_battle_highway_highway_shift_hack}
	else
		break
	endif
	repeat
endscript

script roadie_battle_get_player_from_roadie 
	return Player = (($roadie_infos [(<roadie> -1)]).Player)
endscript

script roadie_battle_get_roadie_from_player 
	RequireParams \{[
			Player
		]
		all}
	<roadie_index> = 0
	begin
	if (($roadie_infos [<roadie_index>].Player) = <Player>)
		break
	endif
	<roadie_index> = (<roadie_index> + 1)
	repeat 2
	if (<roadie_index> > 1)
		ScriptAssert qs(0x2ec17ff8) p = <Player>
	endif
	return roadie = (<roadie_index> + 1)
endscript

script roadie_battle_pumper_script 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	roadie_battle_adjust_roadie_difficulty
	Wait \{1
		Second}
	repeat
endscript

script roadie_battle_get_roadie_difficulty_from_delta_score 
	if (<delta_score> < -5000)
		return \{difficulty = 0}
	elseif (<delta_score> < 7000)
		return \{difficulty = 1}
	else
		return \{difficulty = 2}
	endif
endscript

script roadie_battle_adjust_roadie_difficulty 
	getplayerinfo \{1
		score
		out = player1_score}
	getplayerinfo \{2
		score
		out = player2_score}
	roadie_battle_get_roadie_difficulty_from_delta_score delta_score = (<player1_score> - <player2_score>)
	if ($roadie_battle_roadie_difficulties [0] != <difficulty>)
		SetArrayElement ArrayName = roadie_battle_roadie_difficulties globalarray index = 0 NewValue = <difficulty>
		wiidscommunication :sendmessage set_ds_difficulty roadie_index = 0 new_difficulty = <difficulty>
	endif
	roadie_battle_get_roadie_difficulty_from_delta_score delta_score = (<player2_score> - <player1_score>)
	if ($roadie_battle_roadie_difficulties [1] != <difficulty>)
		SetArrayElement ArrayName = roadie_battle_roadie_difficulties globalarray index = 1 NewValue = <difficulty>
		wiidscommunication :sendmessage set_ds_difficulty roadie_index = 1 new_difficulty = <difficulty>
	endif
endscript

script roadie_battle_set_equipment_rgba 
	RequireParams \{[
			target_player
			equipment
			rgba
		]
		all}
	formatText checksumName = roadie_battle_icons_hud_id 'Roadie_Battle_Icons_Hud_p%d' d = <target_player>
	formatText checksumName = icon_alias 'alias_%e' e = <equipment>
	<roadie_battle_icons_hud_id> :desc_resolvealias Name = <icon_alias> param = icon_id
	<icon_id> :se_setprops rgba = <rgba>
endscript

script roadie_battle_stop_attack \{roadie = 1
		equipment = guitar}
	roadie_battle_get_player_from_roadie roadie = <roadie>
	<target_player> = <Player>
	if NOT StructureContains structure = ($roadie_battle_equipment_attacks) <equipment>
		printf \{'Equipment to stop attacking not found in structure!'}
		return
	endif
	<equipment_struct> = ($roadie_battle_equipment_attacks.<equipment>)
	formatText checksumName = attack_variable 'roadie_battle_%e_attack' e = (<equipment_struct>.Name)
	getplayerinfo <target_player> <attack_variable> out = attack_value
	if (<attack_value> < 0)
		printf \{'Equipment to attack is not attacked yet!'}
		return
	endif
	roadie_battle_hud_get_id Player = <target_player>
	if NOT ScreenElementExists id = <hud_id>
		printscriptinfo \{'Hud no longer exists... early out!'}
		return
	endif
	roadie_battle_remove_hud_icon target_player = <target_player> equipment = <equipment>
	<attack_struct> = (<equipment_struct>.attack_array [(<attack_value> -1)])
	<new_attack_value> = (-1 * (<attack_value> + 1))
	if (<new_attack_value> < -3)
		<new_attack_value> = -3
	endif
	switch (<equipment>)
		case amp
		setplayerinfo <target_player> roadie_battle_amp_attack = <new_attack_value>
		case effects
		setplayerinfo <target_player> roadie_battle_effects_attack = <new_attack_value>
		case guitar
		setplayerinfo <target_player> roadie_battle_guitar_attack = <new_attack_value>
		case soundboard
		setplayerinfo <target_player> roadie_battle_soundboard_attack = <new_attack_value>
		case speaker
		setplayerinfo <target_player> roadie_battle_speaker_attack = <new_attack_value>
	endswitch
	SoundEvent \{event = roadie_battle_repair_sfx}
	formatText TextName = display_message qs(0x7170f053) e = (<equipment_struct>.display_text)
	GetUpperCaseString <display_message>
	roadie_battle_hud_get_id Player = <target_player>
	<hud_id> :desc_resolvealias Name = alias_hud_text param = hud_text_id
	RunScriptOnScreenElement {
		id = <hud_text_id>
		roadie_battle_animate_text
		params = {
			text = <UppercaseString>
		}
	}
	if (<target_player> = 1)
		StopSoundsByBuss \{roadie_battle_p1_mode}
		GetRandomValue \{Name = random_sfx
			integer
			a = 0
			b = 4}
		if (<random_sfx> <= 1)
			SoundEvent \{event = roadie_battle_roadie1_repairs1}
		elseif (<random_sfx> <= 3)
			SoundEvent \{event = roadie_battle_roadie1_repairs2}
		endif
	else
		StopSoundsByBuss \{roadie_battle_p2_mode}
		GetRandomValue \{Name = random_sfx
			integer
			a = 0
			b = 4}
		if (<random_sfx> <= 1)
			SoundEvent \{event = roadie_battle_roadie2_repairs1}
		elseif (<random_sfx> <= 3)
			SoundEvent \{event = roadie_battle_roadie2_repairs2}
		endif
	endif
	getplayerinfo <target_player> difficulty
	SpawnScriptNow {
		(<attack_struct>.Scr)
		id = roadie_battle_attack
		params = {
			attack_mode = stop
			difficulty = <difficulty>
			Player = <target_player>
			other_player = <target_player>
			target_player = <target_player>
			(<attack_struct>.params)
		}
	}
	roadie_battle_ai_check_equipment roadie = <roadie>
	GetArraySize <repairable>
	total_attacks = <array_Size>
	GetSongTimeMs
	<history_entry> = {Type = repair time = <time> equipment = <equipment> total_attacks = <total_attacks>}
	formatText checksumName = roadie_history 'roadie%r_history' r = <roadie>
	AddArrayElement array = ($<roadie_history>) element = <history_entry>
	if (<roadie> = 1)
		Change roadie1_history = <array>
	else
		Change roadie2_history = <array>
	endif
	roadie_battle_roadie_animate_expression roadie = <roadie> expression = repair_complete
endscript

script roadie_battle_launch_attack \{roadie = 2
		equipment = guitar}
	roadie_battle_get_player_from_roadie roadie = <roadie>
	if NOT StructureContains structure = ($roadie_battle_equipment_attacks) <equipment>
		printf \{'Equipment to attack not found in structure!'}
		return
	endif
	<target_player> = (3 - <Player>)
	<equipment_struct> = ($roadie_battle_equipment_attacks.<equipment>)
	<equipment_name> = (<equipment_struct>.Name)
	formatText checksumName = attack_variable 'roadie_battle_%e_attack' e = <equipment_name>
	getplayerinfo <target_player> <attack_variable> out = attack_value
	SpawnScriptNow roadie_battle_launch_attack_sfx params = {target_player = <target_player> equipment = <equipment>}
	if (<attack_value> > 0)
		printf \{'Equipment to attack is already attacked!'}
		return
	endif
	roadie_battle_hud_get_id Player = <target_player>
	if NOT ScreenElementExists id = <hud_id>
		printscriptinfo \{'Hud no longer exists... early out!'}
	else
		RunScriptOnScreenElement id = <hud_id> roadie_battle_animate_attack params = <...>
	endif
	GetSongTimeMs
	<history_entry> = {Type = Attack time = <time> equipment = <equipment>}
	formatText checksumName = roadie_history 'roadie%r_history' r = <roadie>
	AddArrayElement array = ($<roadie_history>) element = <history_entry>
	if (<roadie> = 1)
		Change roadie1_history = <array>
	else
		Change roadie2_history = <array>
	endif
	roadie_battle_ai_check_equipment roadie = (3 - <roadie>)
	GetArraySize <repairable>
	total_attacks = <array_Size>
	GetSongTimeMs
	<history_entry> = {Type = recv_attack time = <time> equipment = <equipment> total_attacks = <total_attacks>}
	formatText checksumName = roadie_history 'roadie%r_history' r = (3 - <roadie>)
	AddArrayElement array = ($<roadie_history>) element = <history_entry>
	formatText checksumName = last_attack_time 'roadie%r_last_attack_time' r = <roadie>
	Change GlobalName = <last_attack_time> NewValue = <time>
	if ((3 - <roadie>) = 1)
		Change roadie1_history = <array>
	else
		Change roadie2_history = <array>
	endif
	roadie_battle_roadie_animate_expression roadie = <roadie> expression = sabotage_complete
	roadie_battle_roadie_animate_expression roadie = (3 - <roadie>) expression = sabotaged
endscript

script roadie_battle_launch_attack_sfx 
	if (<equipment> != effects)
		if (<target_player> = 1)
			StopSoundsByBuss \{roadie_battle_p2_mode}
			GetRandomValue \{Name = random_sfx
				integer
				a = 0
				b = 3}
			if (<random_sfx> = 0)
				SoundEvent \{event = roadie_battle_roadie2_laugh}
			elseif (<random_sfx> = 1)
				SoundEvent \{event = roadie_battle_roadie2_laugh2}
			elseif (<random_sfx> = 2)
				SoundEvent \{event = roadie_battle_roadie2_laugh3}
			else
				SoundEvent \{event = roadie_battle_roadie2_laugh4}
			endif
			Wait \{1.5
				Seconds}
			GetRandomValue \{Name = random_sfx
				integer
				a = 0
				b = 4}
			if (<random_sfx> = 0)
				StopSoundsByBuss \{roadie_battle_p1_mode}
				SoundEvent \{event = roadie_battle_roadie1_sabotaged1}
			elseif (<random_sfx> = 1)
				StopSoundsByBuss \{roadie_battle_p1_mode}
				SoundEvent \{event = roadie_battle_roadie1_sabotaged2}
			elseif (<random_sfx> = 2)
				StopSoundsByBuss \{roadie_battle_p1_mode}
				SoundEvent \{event = roadie_battle_roadie1_sabotaged3}
			elseif (<random_sfx> = 3)
				StopSoundsByBuss \{roadie_battle_p1_mode}
				SoundEvent \{event = roadie_battle_roadie1_sabotaged4}
			endif
		else
			GetRandomValue \{Name = random_sfx
				integer
				a = 0
				b = 3}
			StopSoundsByBuss \{roadie_battle_p1_mode}
			if (<random_sfx> = 0)
				SoundEvent \{event = roadie_battle_roadie1_laugh}
			elseif (<random_sfx> = 1)
				SoundEvent \{event = roadie_battle_roadie1_laugh2}
			elseif (<random_sfx> = 2)
				SoundEvent \{event = roadie_battle_roadie1_laugh3}
			else
				SoundEvent \{event = roadie_battle_roadie1_laugh4}
			endif
			Wait \{1.5
				Seconds}
			GetRandomValue \{Name = random_sfx
				integer
				a = 0
				b = 5}
			if (<random_sfx> = 0)
				StopSoundsByBuss \{roadie_battle_p2_mode}
				SoundEvent \{event = roadie_battle_roadie2_sabotaged1}
			elseif (<random_sfx> <= 2)
				StopSoundsByBuss \{roadie_battle_p2_mode}
				SoundEvent \{event = roadie_battle_roadie2_sabotaged2}
			elseif (<random_sfx> <= 4)
				StopSoundsByBuss \{roadie_battle_p2_mode}
				SoundEvent \{event = roadie_battle_roadie2_sabotaged3}
			endif
		endif
	else
		Wait \{3.5
			Seconds}
		if (<target_player> = 1)
			StopSoundsByBuss \{roadie_battle_p1_mode}
			SoundEvent \{event = roadie_battle_roadie1_cough}
		else
			StopSoundsByBuss \{roadie_battle_p2_mode}
			SoundEvent \{event = roadie_battle_roadie2_cough}
		endif
	endif
endscript

script roadie_battle_animate_attack 
	desc_resolvealias \{Name = alias_animation_path
		param = path_id}
	desc_resolvealias \{Name = alias_hud_text
		param = hud_text_id}
	formatText checksumName = anim_texture 'rb-wiihud-anim-%e' e = <equipment_name>
	CreateScreenElement {
		Type = ContainerElement
		parent = <path_id>
		Pos = (0.0, 0.0)
		pos_anchor = [center , top]
		just = [center , center]
		dims = (0.0, 0.0)
		z_priority = 20
	}
	<anim_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <anim_id>
		Pos = (0.0, 0.0)
		pos_anchor = [center , center]
		just = [center , center]
		Scale = <flip_scale>
		texture = <anim_texture>
		dims = (64.0, 64.0)
	}
	<anim_icon_id> = <id>
	formatText checksumName = icon_texture 'rb-wiihud-icon-%e' e = <equipment_name>
	CreateScreenElement {
		Type = ContainerElement
		parent = <anim_id>
		Pos = (0.0, 0.0)
		pos_anchor = [center , center]
		just = [center , center]
		dims = (38.0, 38.0)
		z_priority = 6
		alpha = 0
		local_id = <equipment>
	}
	<icon_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <icon_id>
		Pos = (0.0, 0.0)
		pos_anchor = [center , center]
		just = [center , center]
		Scale = <flip_scale>
		blend = add
		rgba = [255 255 255 255]
		texture = <icon_texture>
		dims = (38.0, 38.0)
		z_priority = 6
		alpha = 1
	}
	if NOT ((<equipment> = guitar) || (<equipment> = speaker) || (<equipment> = soundboard) || (<equipment> = effects) || (<equipment> = amp))
		<anim_id> :se_setprops pos_anchor = [center , bottom]
		<anim_id> :se_setprops Pos = (0.0, 0.0) time = 0.6 motion = ease_in
		<anim_id> :se_waitprops
		Wait \{0.2
			Seconds}
	else
		<anim_id> :se_setprops alpha = 0
	endif
	roadie_battle_add_hud_icon target_player = <target_player> equipment = <equipment>
	roadie_battle_start_attack_effect <...>
	if NOT ((<equipment> = guitar) || (<equipment> = speaker) || (<equipment> = soundboard) || (<equipment> = effects) || (<equipment> = amp))
		RunScriptOnScreenElement id = <anim_id> roadie_battle_attack_explode params = {equipment_name = <equipment_name> anim_icon_id = <anim_icon_id>}
	endif
endscript

script roadie_battle_start_attack_effect 
	<new_attack_value> = (-1 * (<attack_value>))
	getplayerinfo <target_player> current_health out = target_health
	GH3_Battle_Play_Crowd_Reaction_SFX receiving_player = <target_player> receiving_player_current_crowd_level = <target_health>
	<equipment_struct> = ($roadie_battle_equipment_attacks.<equipment>)
	<attack_struct> = (<equipment_struct>.attack_array [(<new_attack_value> -1)])
	switch (<equipment>)
		case amp
		setplayerinfo <target_player> roadie_battle_amp_attack = <new_attack_value>
		case effects
		setplayerinfo <target_player> roadie_battle_effects_attack = <new_attack_value>
		case guitar
		setplayerinfo <target_player> roadie_battle_guitar_attack = <new_attack_value>
		case soundboard
		setplayerinfo <target_player> roadie_battle_soundboard_attack = <new_attack_value>
		case speaker
		setplayerinfo <target_player> roadie_battle_speaker_attack = <new_attack_value>
	endswitch
	SoundEvent \{event = roadie_battle_sabotage_sfx}
	formatText TextName = display_message qs(0x1ffa900b) e = (<equipment_struct>.display_text)
	GetUpperCaseString <display_message>
	RunScriptOnScreenElement {
		id = <hud_text_id>
		roadie_battle_animate_text
		params = {
			text = <UppercaseString>
		}
	}
	getplayerinfo <target_player> difficulty
	SpawnScriptNow {
		(<attack_struct>.Scr)
		id = roadie_battle_attack
		params = {
			attack_mode = launch
			Player = <target_player>
			other_player = <target_player>
			target_player = <target_player>
			source_player = <Player>
			difficulty = <difficulty>
			(<attack_struct>.params)
		}
	}
	addtoplayerinfo <Player> battle_num_attacks = 1
	getplayerinfo <Player> band_member
	getplayerinfo <target_player> band_member out = target_band_member
	Band_PlayAttackAnim Name = <band_member> Type = <Attack>
	Band_PlayResponseAnim Name = <target_band_member> Type = <Attack>
	SpawnScriptNow hammer_highway id = roadie_battle_attack params = {other_player = <target_player>}
	getplayerinfo <target_player> controller
	activatestarpowerpulse Player = <controller> num = 1 length = 35 Strength = 20 Priority = 100
endscript

script roadie_battle_animate_text 
	se_setprops text = <text> alpha = 1
	Wait \{4
		Seconds}
	se_setprops \{alpha = 0
		time = 1.0
		motion = ease_in}
endscript

script roadie_battle_attack_explode 
	Obj_GetID
	roadie_battle_attack_create_explosion_elements parent = <objID>
	roadie_battle_attack_animate_explosion_elements anim_icon_id = <anim_icon_id> ball_id = <ball_id> back_id = <back_id> debris_id = <debris_id> smoke_id = <smoke_id>
	Die
endscript

script roadie_battle_attack_create_explosion_elements 
	RequireParams \{[
			parent
		]
		all}
	CreateScreenElement {
		parent = <parent>
		Type = SpriteElement
		texture = `rb-highway-explosionball`
		alpha = 1.0
		just = [0.0 0.3]
		pos_anchor = [center center]
		dims = (128.0, 128.0)
		Scale = (0.0, 0.0)
		Pos = (0.0, 0.0)
		blend = add
		relative_z_priority = 0.5
	}
	<ball_id> = <id>
	CreateScreenElement {
		parent = <ball_id>
		Type = SpriteElement
		texture = `rb-highway-explosionback`
		alpha = 1.0
		just = [center center]
		pos_anchor = [center center]
		dims = (128.0, 128.0)
		Scale = (0.8, 0.8)
		blend = add
		Pos = (0.0, 0.0)
		relative_z_priority = 0.25
	}
	<back_id> = <id>
	CreateScreenElement {
		parent = <ball_id>
		Type = SpriteElement
		texture = `rb-highway-explosiondebris`
		alpha = 1.0
		just = [center center]
		pos_anchor = [center center]
		dims = (128.0, 128.0)
		Scale = (0.0, 0.0)
		Pos = (0.0, 0.0)
		relative_z_priority = 0.75
	}
	<debris_id> = <id>
	CreateScreenElement {
		parent = <parent>
		Type = SpriteElement
		texture = `rb-highway-smoke2`
		alpha = 1.0
		just = [0.0 0.3]
		pos_anchor = [center center]
		dims = (128.0, 128.0)
		Scale = (0.0, 0.0)
		Pos = (0.0, 0.0)
		relative_z_priority = 0.01
	}
	<smoke_id> = <id>
	return ball_id = <ball_id> back_id = <back_id> debris_id = <debris_id> smoke_id = <smoke_id>
endscript

script roadie_battle_attack_animate_explosion_elements 
	RequireParams \{[
			anim_icon_id
			ball_id
			back_id
			debris_id
			smoke_id
		]
		all}
	<anim_time> = 1.0
	<anim_icon_id> :se_setprops {
		alpha = 0.0
		motion = ease_out
		time = (<anim_time> / 2.0)
	}
	<ball_id> :se_setprops {
		Scale = (3.0, 3.0)
		motion = ease_out
		alpha = 0.0
		time = <anim_time>
	}
	<back_id> :se_setprops {
		Scale = (1.2, 1.2)
		motion = ease_out
		time = <anim_time>
	}
	<debris_id> :se_setprops {
		Scale = (2.0, 2.0)
		motion = ease_out
		time = <anim_time>
		Pos = (0.0, 0.0)
		alpha = 0.5
	}
	<smoke_id> :se_setprops {
		Scale = (5.0, 5.0)
		motion = ease_out
		time = (<anim_time> * 1.2)
		Pos = (0.0, 0.0)
		alpha = 0.0
	}
	<smoke_id> :se_waitprops
endscript

script roadie_battle_amp_overload 
	if (<attack_mode> = launch)
		getplayerinfo <target_player> difficulty
		flicker_amount = ($roadie_battle_amp_overload_flicker_amounts.<difficulty>)
		if (<target_player> = 1)
			Change battle_flicker_difficulty_p1 = <flicker_amount>
		else
			Change battle_flicker_difficulty_p2 = <flicker_amount>
		endif
		roadie_battle_amp_attack_drop_amp target_player = <target_player>
		formatText checksumName = tmp_amp_create_highway_soundwaves_id 'roadie_battle_amp_create_highway_soundwaves_p%d' d = <target_player>
		SpawnScriptNow roadie_battle_amp_create_highway_soundwaves id = <tmp_amp_create_highway_soundwaves_id> params = {target_player = <target_player>}
		formatText checksumName = tmp_fade_gems_id 'roadie_battle_fade_gems_p%d' d = <target_player>
		SpawnScriptNow fade_gems id = <tmp_fade_gems_id> params = {Player = <target_player> other_player = <target_player>}
	else
		setplayerinfo <target_player> shake_notes = -1
		formatText checksumName = tmp_amp_create_highway_soundwaves_id 'roadie_battle_amp_create_highway_soundwaves_p%d' d = <target_player>
		KillSpawnedScript id = <tmp_amp_create_highway_soundwaves_id>
		formatText checksumName = tmp_fade_gems_id 'roadie_battle_fade_gems_p%d' d = <target_player>
		KillSpawnedScript id = <tmp_fade_gems_id>
		GuitarEvent_BattleAttackFinished <...>
		roadie_battle_amp_attack_remove_amp target_player = <target_player>
	endif
endscript

script roadie_battle_amp_attack_drop_amp 
	RequireParams \{[
			target_player
		]
		all}
	if (<target_player> = 1)
		SoundEvent \{event = roadie_battle_amp_intro}
		amp_id = ampp1
		<start_pos> = (-195.0, -200.0)
		<kicking_pos> = {(5.0, 0.0) relative}
		<unkicking_pos> = {(-5.0, 0.0) relative}
		<kicking_rot> = -2
		<end_pos> = (-195.0, 510.0)
		<scale_vector> = (1.0, 1.0)
		<squash_vector> = (1.2, 0.8)
	else
		SoundEvent \{event = roadie_battle_ampr_intro}
		amp_id = ampp2
		<start_pos> = (195.0, -200.0)
		<kicking_pos> = {(5.0, 0.0) relative}
		<unkicking_pos> = {(-5.0, 0.0) relative}
		<kicking_rot> = 2
		<end_pos> = (195.0, 510.0)
		<scale_vector> = (-1.0, 1.0)
		<squash_vector> = (-1.2, 0.8)
	endif
	DestroyScreenElement id = <amp_id>
	formatText checksumName = highway_id 'highway_containerp%p' p = <target_player>
	GetRandomValue \{Name = rot_angle
		a = -90
		b = 90}
	CreateScreenElement {
		Type = ContainerElement
		parent = <highway_id>
		id = <amp_id>
		Pos = <start_pos>
		Scale = <scale_vector>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <amp_id>
		texture = `rb-highway-amp`
		pos_anchor = [left , bottom]
		just = [center , bottom]
		z_priority = -1.3
	}
	<internal_amp_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <internal_amp_id>
		Pos = (0.0, 0.0)
		pos_anchor = [center , center]
		just = [center , center]
		texture = `rb-highway-ampglow`
		Scale = 1.0
		z_priority = -1.25
		blend = add
		alpha = 0
	}
	<ampglow_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <ampglow_id>
		Pos = (0.0, 0.0)
		pos_anchor = [center , center]
		just = [center , center]
		texture = `rb-highway-ampgrille`
		Scale = 1.0
		z_priority = -1.225
	}
	<ampgrill_id> = <id>
	<amp_id> :se_setprops Pos = <end_pos> rot_angle = 0 time = 0.65000004 motion = ease_in
	<amp_id> :se_waitprops
	<amp_id> :se_setprops Scale = <squash_vector> time = 0.05 motion = ease_out
	<amp_id> :se_waitprops
	<amp_id> :se_setprops Scale = <scale_vector> time = 0.06 motion = ease_out
	RunScriptOnScreenElement {
		id = <ampglow_id>
		pulse_props_to_beat
		params = {
			rest_props = {alpha = 0.25 motion = ease_out}
			rest_time_is_time_between_beats
			pulse_props = {alpha = 1.0 time = 0.031999998}
		}
	}
	RunScriptOnScreenElement {
		id = <ampgrill_id>
		pulse_props_to_beat
		params = {
			rest_props = {Scale = 1.0 motion = ease_out}
			rest_time_is_time_between_beats
			pulse_props = {Scale = 1.2 time = 0.031999998}
		}
	}
	RunScriptOnScreenElement {
		id = <internal_amp_id>
		pulse_props_to_beat
		params = {
			rest_props = {Pos = <kicking_pos> rot_angle = 0 motion = ease_out}
			rest_time_is_time_between_beats
			pulse_props = {Pos = <unkicking_pos> rot_angle = <kicking_rot> time = 0.031999998}
		}
	}
	SpawnScriptNow roadie_battle_shake_highway_hud params = {target_player = <target_player> x_amt = 5 y_amt = 50 time = 1.3299999 decay_amt = 0.75}
	setplayerinfo <target_player> shake_notes = 1
endscript

script roadie_battle_amp_attack_remove_amp 
	RequireParams \{[
			target_player
		]
		all}
	if (<target_player> = 1)
		amp_id = ampp1
		<start_pos> = (-195.0, -200.0)
		<end_pos> = (-195.0, 510.0)
		<scale_vector> = (1.0, 1.0)
		<squash_vector> = (1.2, 0.8)
		<pos1> = {(-10.0, -75.0) relative}
		<pos2> = {(-13.0, 75.0) relative}
		<pos3> = {(-120.0, 1375.0) relative}
		SoundEvent \{event = roadie_battle_amp_outro}
	else
		amp_id = ampp2
		<start_pos> = (195.0, -200.0)
		<end_pos> = (195.0, 510.0)
		<scale_vector> = (-1.0, 1.0)
		<squash_vector> = (-1.2, 0.8)
		<pos1> = {(10.0, -75.0) relative}
		<pos2> = {(13.0, 75.0) relative}
		<pos3> = {(120.0, 1375.0) relative}
		SoundEvent \{event = roadie_battle_ampr_outro}
	endif
	<amp_id> :se_setprops Scale = <squash_vector> time = 0.16 motion = ease_out
	<amp_id> :se_waitprops
	<amp_id> :se_setprops Scale = <scale_vector> time = 0.05 motion = ease_out
	<amp_id> :se_waitprops
	<amp_id> :se_setprops Pos = <pos1> time = 0.15 motion = ease_out
	<amp_id> :se_waitprops
	<amp_id> :se_setprops Pos = <pos2> time = 0.15 motion = ease_in
	<amp_id> :se_waitprops
	<amp_id> :se_setprops Pos = <pos3> time = 0.65000004
	<amp_id> :se_waitprops
	DestroyScreenElement id = <amp_id>
endscript
roadie_battle_amp_soundwave_params = {
	left = {
		Pos = (55.0, 90.0)
		just = [
			left
			center
		]
		Scale = (-1.0, 1.0)
		rot_angle = 25
	}
	right = {
		Pos = (335.0, 90.0)
		just = [
			right
			center
		]
		Scale = (1.0, 1.0)
		rot_angle = -20
	}
}

script roadie_battle_amp_create_highway_soundwaves 
	RequireParams \{[
			target_player
		]
		all}
	formatText checksumName = highway_container_id 'highway_containerp%p' p = <target_player>
	formatText checksumName = highway_window_id 'highway_windowp%p' p = <target_player>
	if ScreenElementExists id = <highway_window_id>
		DestroyScreenElement id = <highway_window_id>
	endif
	if ScreenElementExists id = <highway_container_id>
		<highway_container_id> :se_setprops pos_anchor = [center center]
		CreateScreenElement {
			Type = WindowElement
			id = <highway_window_id>
			parent = <highway_container_id>
			dims = (400.0, 350.0)
			pos_anchor = (200.0, 175.0)
			Pos = (0.0, 570.0)
			just = [center center]
		}
	else
		return
	endif
	begin
	get_time_until_next_fretbar
	if ((<time_until_next_fretbar> <= 0.0167) || (<time_until_next_fretbar> > 1.0))
		<time_until_next_fretbar> = 0.1
	endif
	Wait <time_until_next_fretbar> Seconds
	if (<target_player> = 1)
		<first_wave_params> = ($roadie_battle_amp_soundwave_params.left)
		<second_wave_params> = ($roadie_battle_amp_soundwave_params.right)
	else
		<first_wave_params> = ($roadie_battle_amp_soundwave_params.right)
		<second_wave_params> = ($roadie_battle_amp_soundwave_params.left)
	endif
	if ScreenElementExists id = <highway_window_id>
		CreateScreenElement {
			Type = SpriteElement
			parent = <highway_window_id>
			texture = `rb-highway-soundwave`
			z_priority = 3
			<first_wave_params>
		}
		<id1> = <id>
	else
		return
	endif
	SpawnScriptNow roadie_battle_amp_animate_highway_soundwaves params = {id1 = <id1>}
	repeat
endscript

script roadie_battle_amp_animate_highway_soundwaves 
	RequireParams \{[
			id1
		]
		all}
	<id1> :se_getprops
	<scalex> = (<Scale> [0] * 10)
	<scaley> = (<Scale> [1] * 10)
	<Scale> = ((<scalex> * (1.0, 0.0)) + (<scaley> * (0.0, 1.0)))
	<id1> :se_setprops Scale = <Scale> alpha = 0.25 time = 1.5
	<id1> :se_waitprops
	DestroyScreenElement id = <id1>
endscript

script roadie_battle_difficulty_up 
	if (<attack_mode> = launch)
		getplayerinfo <target_player> difficulty
		if (<difficulty> = expert)
			roadie_battle_double_notes <...>
			return
		endif
		setplayerinfo <target_player> diffup_notes = 1
		fillinputarrayforbattle Player = <target_player> Attack = difficulty_up
		extendcrcplayer change_difficulty <target_player> out = Type
		switch <difficulty>
			case easy
			broadcastevent Type = <Type> data = {difficulty = medium difficulty_text_nl = 'medium'}
			case medium
			broadcastevent Type = <Type> data = {difficulty = hard difficulty_text_nl = 'hard'}
			case hard
			broadcastevent Type = <Type> data = {difficulty = expert difficulty_text_nl = 'expert'}
		endswitch
	else
		getplayerinfo <target_player> difficulty
		getplayerinfo <target_player> diffup_notes
		if (<diffup_notes> = 0 && <difficulty> = expert)
			roadie_battle_double_notes <...>
			return
		endif
		extendcrcplayer change_difficulty <target_player> out = Type
		switch <original_difficulty>
			case easy
			broadcastevent Type = <Type> data = {difficulty = easy difficulty_text_nl = 'easy'}
			case medium
			broadcastevent Type = <Type> data = {difficulty = medium difficulty_text_nl = 'medium'}
			case hard
			broadcastevent Type = <Type> data = {difficulty = hard difficulty_text_nl = 'hard'}
		endswitch
		setplayerinfo <other_player> diffup_notes = -1
		GuitarEvent_BattleAttackFinished <...>
	endif
endscript

script roadie_battle_double_notes 
	if (<attack_mode> = launch)
		setplayerinfo <target_player> double_notes = 1000000
		fillinputarrayforbattle Player = <target_player> Attack = double_notes
		setplayerinfo <target_player> double_notes = 1
	else
		setplayerinfo <target_player> double_notes = -1
		GuitarEvent_BattleAttackFinished <...>
	endif
endscript

script roadie_battle_mine_attack 
	if (<attack_mode> = launch)
		roadie_battle_speaker_attack_drop_speaker target_player = <target_player>
		setplayerinfo <target_player> mine_attack = 1000000
		FillInputArray Player = <target_player> Attack = mine_attack
	else
		formatText checksumName = speaker_id 'speakerp%p' p = <target_player>
		roadie_battle_speaker_attack_drop_good_speaker target_player = <target_player>
		setplayerinfo <target_player> mine_attack = -1
		GuitarEvent_BattleAttackFinished <...>
	endif
endscript

script roadie_battle_speaker_attack_drop_speaker 
	RequireParams \{[
			target_player
		]
		all}
	if (<target_player> = 1)
		speaker_id = speakerp1
		<start_pos> = (-145.0, -200.0)
		<end_pos> = (-145.0, 420.0)
		<scale_vector> = (1.0, 1.0)
		<squash_vector> = (1.2, 0.8)
		SoundEvent \{event = roadie_battle_speaker_intro}
	else
		speaker_id = speakerp2
		<start_pos> = (145.0, -200.0)
		<end_pos> = (145.0, 420.0)
		<scale_vector> = (-1.0, 1.0)
		<squash_vector> = (-1.2, 0.8)
		SoundEvent \{event = roadie_battle_speakerr_intro}
	endif
	DestroyScreenElement id = <speaker_id>
	formatText checksumName = highway_id 'highway_containerp%p' p = <target_player>
	GetRandomValue \{Name = rot_angle
		a = -90
		b = 90}
	CreateScreenElement {
		Type = SpriteElement
		parent = <highway_id>
		id = <speaker_id>
		Pos = <start_pos>
		pos_anchor = [center , bottom]
		Scale = <scale_vector>
		just = [center , bottom]
		texture = `rb-highway-speaker`
		z_priority = -2.3
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <speaker_id>
		Pos = (0.0, 0.0)
		pos_anchor = [center , center]
		just = [center , center]
		texture = `rb-highway-speakerfire`
		Scale = 2.0
		z_priority = -2.25
		blend = add
		alpha = 0
	}
	<speakerfire_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <speaker_id>
		Pos = (0.0, 0.0)
		pos_anchor = [center , center]
		just = [center , center]
		texture = `rb-highway-speakercone`
		Scale = 2.0
		z_priority = -2.2
	}
	<speaker_id> :se_setprops Pos = <end_pos> rot_angle = 0 time = 0.65000004 motion = ease_in
	<speaker_id> :se_waitprops
	<speaker_id> :se_setprops Scale = <squash_vector> time = 0.05 motion = ease_out
	<speaker_id> :se_waitprops
	<speaker_id> :se_setprops Scale = <scale_vector> time = 0.06 motion = ease_out
	SpawnScriptNow roadie_battle_shake_highway_hud params = {target_player = <target_player> x_amt = 5 y_amt = 50 time = 1.3299999 decay_amt = 0.75}
	Wait \{0.33
		Seconds}
	SpawnScriptNow roadie_battle_speaker_attack_animate_sparks params = {target_player = <target_player>}
	if ScreenElementExists id = <speakerfire_id>
		RunScriptOnScreenElement id = <speakerfire_id> roadie_battle_alpha_flicker params = {min_alpha = 0.5}
	else
		return
	endif
	formatText checksumName = speaker_shake_script_id 'speaker_shake_script_p%p' p = <target_player>
	SpawnScriptNow id = <speaker_shake_script_id> roadie_battle_speaker_attack_shake_speaker params = {speaker_id = <speaker_id>}
	DestroyScreenElement id = <id>
endscript

script roadie_battle_speaker_attack_shake_speaker 
	RequireParams \{[
			speaker_id
		]
		all}
	if NOT ScreenElementExists id = <speaker_id>
		return
	endif
	<speaker_id> :se_getprops
	<orig_scalex> = (<Scale> [0])
	begin
	if NOT ScreenElementExists id = <speaker_id>
		return
	endif
	if (<orig_scalex> > 0)
		GetRandomValue \{a = 0.97499996
			b = 1.025
			Name = scalex}
	else
		GetRandomValue \{a = -1.025
			b = -0.97499996
			Name = scalex}
	endif
	GetRandomValue \{a = 0.97499996
		b = 1.025
		Name = scaley}
	<Scale> = ((<scalex> * (1.0, 0.0)) + (<scaley> * (0.0, 1.0)))
	GetRandomValue \{a = -1.0
		b = 1.0
		Name = rot_angle}
	<speaker_id> :se_setprops rot_angle = <rot_angle> Scale = <Scale> time = 0.031999998
	Wait \{2
		gameframes}
	repeat
endscript

script roadie_battle_speaker_attack_drop_good_speaker 
	RequireParams \{[
			target_player
		]
		all}
	if (<target_player> = 1)
		speaker_id = speakerp1
		<speaker_shake_script_id> = speaker_shake_script_p1
		<start_pos> = (-145.0, -200.0)
		<end_pos> = (-145.0, 340.0)
		<scale_vector> = (1.0, 1.0)
		<squash_vector> = (1.2, 0.8)
		<rot> = -9
		<pos1> = {(-20.0, -75.0) relative}
		<pos2> = {(-20.0, 75.0) relative}
		<pos3> = {(-120.0, 1375.0) relative}
	else
		speaker_id = speakerp2
		<speaker_shake_script_id> = speaker_shake_script_p2
		<start_pos> = (145.0, -200.0)
		<end_pos> = (145.0, 340.0)
		<scale_vector> = (-1.0, 1.0)
		<rot> = 9
		<squash_vector> = (-1.2, 0.8)
		<pos1> = {(20.0, -75.0) relative}
		<pos2> = {(20.0, 75.0) relative}
		<pos3> = {(120.0, 1375.0) relative}
	endif
	formatText checksumName = highway_id 'highway_containerp%p' p = <target_player>
	GetRandomValue \{Name = rot_angle
		a = -90
		b = 90}
	CreateScreenElement {
		Type = SpriteElement
		parent = <highway_id>
		id = <good_speaker_id>
		Pos = <start_pos>
		pos_anchor = [center , bottom]
		Scale = <scale_vector>
		just = [center , bottom]
		texture = `rb-highway-speaker`
		z_priority = -2.1
	}
	<good_speaker_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <good_speaker_id>
		Pos = (0.0, 0.0)
		pos_anchor = [center , center]
		just = [center , center]
		texture = `rb-highway-speakercone`
		Scale = 2.0
		z_priority = -2.0
	}
	<good_speaker_id> :se_setprops Pos = <end_pos> rot_angle = 0 time = 0.65000004 motion = ease_in
	SoundEvent \{event = roadie_battle_speaker_outro}
	Wait \{0.62
		Seconds}
	KillSpawnedScript id = <speaker_shake_script_id>
	<good_speaker_id> :se_setprops Scale = <squash_vector> time = 0.05 motion = ease_out
	<speaker_id> :se_setprops Scale = <squash_vector> time = 0.05 motion = ease_out
	<speaker_id> :se_waitprops
	<good_speaker_id> :se_setprops Scale = <scale_vector> Pos = {(0.0, -15.0) relative} rot_angle = <rot> time = 0.06 motion = ease_out
	<speaker_id> :se_setprops Scale = <scale_vector> time = 0.06 motion = ease_out
	<speaker_id> :se_waitprops
	<speaker_id> :se_setprops Pos = {(0.0, 600.0) relative} time = 0.3 motion = ease_in
	<good_speaker_id> :se_setprops Pos = <pos1> time = 0.15 motion = ease_out
	<good_speaker_id> :se_waitprops
	<good_speaker_id> :se_setprops Pos = <pos2> time = 0.15 motion = ease_in
	<good_speaker_id> :se_waitprops
	<good_speaker_id> :se_setprops Pos = <pos3> time = 0.65000004
	<good_speaker_id> :se_waitprops
	<good_speaker_id> :se_waitprops
	KillSpawnedScript \{Name = roadie_battle_speaker_attack_animate_sparks}
	DestroyScreenElement id = <speaker_id>
	DestroyScreenElement id = <good_speaker_id>
endscript

script roadie_battle_speaker_attack_animate_sparks 
	RequireParams \{[
			target_player
		]
		all}
	if (<target_player> = 1)
		<speaker_id> = speakerp1
		<Pos> = (10.0, -10.0)
		GetRandomValue \{Name = rot
			a = -10
			b = -5}
		SoundEvent \{event = roadie_battle_speaker_spits}
	else
		<speaker_id> = speakerp2
		<Pos> = (410.0, -10.0)
		GetRandomValue \{Name = rot
			a = 5
			b = 10}
		SoundEvent \{event = roadie_battle_speaker_spitsr}
	endif
	if NOT ScreenElementExists id = <speaker_id>
		return
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <speaker_id>
		texture = `rb-highway-speakersparks`
		Pos = <Pos>
		just = [left , center]
		pos_anchor = [left , center]
		use_animated_uvs = true
		frame_length = 0.031999998
		num_uv_frames = (4.0, 6.0)
		blend = add
		Scale = (1.3499999, 1.0)
		z_priority = 12.0
		top_down_v
		loop_animated_uvs = FALSE
	}
	formatText checksumName = speaker_shake_script_id 'speaker_shake_script_p%p' p = <target_player>
	KillSpawnedScript id = <speaker_shake_script_id>
	<speaker_id> :se_setprops rot_angle = <rot> time = 0.1
	<speaker_id> :se_waitprops
	<speaker_id> :se_setprops rot_angle = 0 time = 0.1 motion = ease_out
	<speaker_id> :se_waitprops
	<speaker_id> :se_setprops rot_angle = (<rot> / -2) time = 0.08 motion = ease_out
	<speaker_id> :se_waitprops
	<speaker_id> :se_setprops rot_angle = 0 time = 0.06 motion = ease_out
	SpawnScriptNow id = <speaker_shake_script_id> roadie_battle_speaker_attack_shake_speaker params = {speaker_id = <speaker_id>}
	Wait (0.055 * 24) Seconds
	DestroyScreenElement id = <id>
endscript

script roadie_battle_highway_highway_shift_hack 
	get_num_non_vocals_players_onscreen
	begin
	if NOT ((ScriptIsRunning move_highway_2d) || (ScriptIsRunning hammer_highway) || (ScriptIsRunning shake_highway) || (ScriptIsRunning roadie_battle_shake_highway_hud))
		Player = 1
		begin
		formatText checksumName = container_id 'highway_containerp%p' p = <Player>
		get_non_vocalist_player_number Player = <Player>
		if NOT GotParam \{non_vocalist_player}
			return
		endif
		get_highway_pos_and_scale num_non_vocals_players = <num_non_vocals_players> non_vocalist_player = <non_vocalist_player> Player = <Player>
		RemoveParameter \{non_vocalist_player}
		original_pos = <Pos>
		<container_id> :se_getprops
		if (<Pos> != <original_pos>)
			<container_id> :se_setprops Pos = <original_pos>
		endif
		<Player> = (<Player> + 1)
		repeat 2
	endif
	Wait \{0.5
		Seconds}
	repeat
endscript

script roadie_battle_shake_highway_hud 
	RequireParams \{[
			target_player
			x_amt
			y_amt
			time
			decay_amt
		]
		all}
	if (<target_player> = 1)
		mid_hammer_highway = $battle_p1_highway_hammer
	else
		mid_hammer_highway = $battle_p2_highway_hammer
	endif
	if NOT (<mid_hammer_highway> = 1)
		if (<target_player> = 1)
			Change \{battle_p1_highway_hammer = 1}
		else
			Change \{battle_p2_highway_hammer = 1}
		endif
		get_highway_pos_and_scale num_non_vocals_players = 2 non_vocalist_player = <target_player> Player = <target_player>
		<orig_pos> = <Pos>
		formatText checksumName = hud_id 'highway_containerp%p' p = <target_player>
		RunScriptOnScreenElement id = <hud_id> roadie_battle_shake_effect params = {x_amt = <x_amt> y_amt = <y_amt> time = <time> decay_amt = <decay_amt>}
		<hud_id> :se_waitprops
		<hud_id> :se_setprops Pos = <orig_pos>
	endif
endscript

script roadie_battle_shake_effect 
	RequireParams \{[
			x_amt
			y_amt
			time
		]
		all}
	se_getprops \{Pos}
	<orig_pos> = <Pos>
	<frames_to_shake> = (<time> / 0.016667)
	if NOT GotParam \{decay_amt}
		<decay_amt> = (1.0 / <frames_to_shake>)
		<decay_amt> = (1.0 - <decay_amt>)
	endif
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
	<shake_vector> = ((<x_shake> * (1.0, 0.0)) + (<y_shake> * (0.0, 1.0)))
	<shake_vector> = (<orig_pos> + <shake_vector>)
	se_setprops Pos = <shake_vector>
	Wait \{1
		gameframe}
	repeat <frames_to_shake>
	se_setprops Pos = <orig_pos>
endscript

script roadie_battle_lefty_flip 
	if (<attack_mode> = launch)
		roadie_battle_guitar_attack_drop_arrowsign target_player = <target_player>
		SpawnScriptNow roadie_battle_guitar_attack_spawn_cyclones params = {target_player = <target_player>}
		Wait \{0.15
			Seconds}
		SpawnScriptNow roadie_battle_guitar_attack_spin_arrowsign params = {target_player = <target_player>}
		roadie_battle_animate_lefty_flip other_player = <target_player>
	else
		SpawnScriptNow roadie_battle_guitar_attack_spawn_cyclones params = {target_player = <target_player>}
		Wait \{0.15
			Seconds}
		SpawnScriptNow roadie_battle_guitar_attack_spin_arrowsign params = {target_player = <target_player> Destroy}
		roadie_battle_animate_lefty_flip other_player = <target_player> unflip
		GuitarEvent_BattleAttackFinished <...>
	endif
	getplayerinfo <target_player> lefthanded_button_ups
	setplayerinfo <target_player> lefthanded_button_ups = (1 - <lefthanded_button_ups>)
	refresh_button_models Player = <target_player>
endscript

script roadie_battle_guitar_attack_drop_arrowsign 
	RequireParams \{[
			target_player
		]
		all}
	if (<target_player> = 1)
		arrowsign_id = arrowsignp1
		<start_pos> = (-223.0, 0.0)
		<end_pos> = (-218.0, 640.0)
		<rot_angle> = -9
		SoundEvent \{event = roadie_battle_lefty_intro}
	else
		arrowsign_id = arrowsignp2
		<start_pos> = (225.0, 0.0)
		<end_pos> = (218.0, 640.0)
		<rot_angle> = 9
		SoundEvent \{event = roadie_battle_leftyr_intro}
	endif
	getplayerinfo <target_player> lefthanded_button_ups_flip_save
	if (<lefthanded_button_ups_flip_save> > 0)
		<scale_vector> = (1.0, 1.0)
		<init_scale> = (0.8, 1.2)
		<squash_scale> = (1.1, 0.9)
	else
		<scale_vector> = (-1.0, 1.0)
		<init_scale> = (-0.8, 1.2)
		<squash_scale> = (-1.1, 0.9)
	endif
	formatText checksumName = hud_id 'highway_containerp%p' p = <target_player>
	<hud_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <hud_id>
		id = <arrowsign_id>
		Pos = <start_pos>
		pos_anchor = [center , bottom]
		Scale = <scale_vector>
		just = [center , bottom]
		texture = `rb-highway-arrowsign`
		z_priority = 80.0
		Scale = <scale_vector>
	}
	<arrowsign_id> :se_setprops Pos = <end_pos> Scale = <init_scale> time = 0.65000004 motion = ease_in
	<arrowsign_id> :se_waitprops
	<arrowsign_id> :se_setprops Scale = <squash_scale> time = 0.065 motion = ease_in
	<arrowsign_id> :se_waitprops
	<arrowsign_id> :se_setprops Scale = <scale_vector> time = 0.065 motion = ease_out
	rot_amount = 8.0
	begin
	<time> = 0.025
	if (<time> < 0)
		<time> = (-1 * <time>)
	endif
	<arrowsign_id> :se_setprops rot_angle = <rot_amount> time = <time>
	<arrowsign_id> :se_waitprops
	rot_amount = (<rot_angle> + <rot_amount> * -0.75)
	repeat 10
	<arrowsign_id> :se_setprops rot_angle = <rot_angle> time = 0.025
endscript

script roadie_battle_guitar_attack_spin_arrowsign 
	RequireParams \{[
			target_player
		]
		all}
	if (<target_player> = 1)
		arrowsign_id = arrowsignp1
		SoundEvent \{event = roadie_battle_lefty_sign_p1}
		SoundEvent \{event = roadie_battle_lefty_tornadol}
	else
		arrowsign_id = arrowsignp2
		SoundEvent \{event = roadie_battle_lefty_sign_p2}
		SoundEvent \{event = roadie_battle_lefty_tornador}
	endif
	getplayerinfo <target_player> lefthanded_button_ups_flip_save
	if (<lefthanded_button_ups_flip_save> > 0)
		<Scale> = -1
		<scale_vector> = (-1.0, 1.0)
	else
		<Scale> = 1
		<scale_vector> = (1.0, 1.0)
	endif
	if GotParam \{Destroy}
		<Scale> = (<Scale> * -1)
		<fade_rate> = 0.75
		Wait \{0.5
			Seconds}
	else
		<fade_rate> = 1.0
		<arrowsign_id> :se_setprops Scale = <scale_vector>
	endif
	i = 1
	<alpha> = 1.0
	begin
	<time> = (<i> * 0.03)
	<alpha> = (<alpha> * <fade_rate>)
	if (<Scale> = 1)
		<Scale> = -1
		<scale_vector> = (-1.0, 1.0)
	else
		<Scale> = 1
		<scale_vector> = (1.0, 1.0)
	endif
	<arrowsign_id> :se_setprops Scale = <scale_vector> alpha = <alpha> time = <time>
	<arrowsign_id> :se_waitprops
	<i> = (<i> + 1)
	repeat 6
	if GotParam \{Destroy}
		DestroyScreenElement id = <arrowsign_id>
	endif
endscript

script roadie_battle_guitar_attack_spawn_cyclones 
	RequireParams \{[
			target_player
		]
		all}
	formatText checksumName = container_id 'gem_containerp%p' p = <target_player> AddToStringLookup = true
	<gem_colors> = [green red yellow blue orange]
	<player_index> = (<target_player> -1)
	<buttons> = ($button_up_models [<player_index>])
	i = 0
	begin
	formatText checksumName = cyclone_id 'cyclone%p_%n' p = <target_player> n = <i>
	<gem_color> = (<gem_colors> [<i>])
	<button> = (<buttons>.<gem_color>)
	<Pos> = (<button>.pos_2d)
	<Pos> = (<Pos> - (0.0, 100.0))
	CreateScreenElement {
		Type = SpriteElement
		id = <cyclone_id>
		parent = <container_id>
		texture = `rb-highway-flipcyclone`
		Pos = <Pos>
		just = [center , center]
		pos_anchor = [center , bottom]
		use_animated_uvs = true
		frame_length = 0.06
		num_uv_frames = (6.0, 4.0)
		blend = add
		Scale = 1.0
		z_priority = 11.0
		top_down_v
		loop_animated_uvs = FALSE
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <cyclone_id>
		texture = `rb-highway-flipcyclone2`
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		use_animated_uvs = true
		frame_length = 0.06
		num_uv_frames = (6.0, 4.0)
		Scale = 1.0
		z_priority = 10.9
		top_down_v
		loop_animated_uvs = FALSE
	}
	<cyclone_id> :se_setprops alpha = 0 time = 1.3
	<i> = (<i> + 1)
	Wait \{0.05
		Seconds}
	repeat 5
	formatText checksumName = cyclone_id 'sign_cyclone%p' p = <target_player>
	if (<target_player> = 1)
		<Pos> = (-225.0, 480.0)
	else
		<Pos> = (225.0, 480.0)
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <cyclone_id>
		parent = <container_id>
		texture = `rb-highway-flipcyclone`
		Pos = <Pos>
		just = [center , center]
		pos_anchor = [center , bottom]
		use_animated_uvs = true
		frame_length = 0.06
		num_uv_frames = (6.0, 4.0)
		blend = add
		Scale = 2.0
		z_priority = 11.0
		top_down_v
		loop_animated_uvs = FALSE
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <cyclone_id>
		texture = `rb-highway-flipcyclone2`
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		use_animated_uvs = true
		frame_length = 0.06
		num_uv_frames = (6.0, 4.0)
		z_priority = 10.9
		top_down_v
		loop_animated_uvs = FALSE
	}
	<cyclone_id> :se_setprops alpha = 0 time = 1
	Wait \{0.15
		Seconds}
	formatText checksumName = cyclone_id 'center_cyclone%p' p = <target_player>
	CreateScreenElement {
		Type = SpriteElement
		id = <cyclone_id>
		parent = <container_id>
		texture = `rb-highway-flipcyclone`
		Pos = (0.0, 460.0)
		just = [center , center]
		pos_anchor = [center , bottom]
		use_animated_uvs = true
		frame_length = 0.05
		num_uv_frames = (6.0, 4.0)
		blend = add
		Scale = 2.1
		z_priority = 11.0
		top_down_v
		loop_animated_uvs = FALSE
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <cyclone_id>
		texture = `rb-highway-flipcyclone2`
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		use_animated_uvs = true
		frame_length = 0.05
		num_uv_frames = (6.0, 4.0)
		Scale = 1.0
		z_priority = 10.9
		top_down_v
		loop_animated_uvs = FALSE
	}
	<cyclone_id> :se_setprops alpha = 0 time = 0.75
	<cyclone_id> :se_waitprops
	DestroyScreenElement id = <cyclone_id>
	formatText checksumName = cyclone_id 'sign_cyclone%p' p = <target_player>
	DestroyScreenElement id = <cyclone_id>
	<i> = 0
	begin
	formatText checksumName = cyclone_id 'cyclone%p_%n' p = <target_player> n = <i>
	DestroyScreenElement id = <cyclone_id>
	<i> = (<i> + 1)
	repeat 5
endscript

script roadie_battle_effects_attack 
	if (<attack_mode> = launch)
		roadie_battle_effects_attack_launch_fireball target_player = <target_player>
		get_highway_hud_root_id Player = <target_player>
		SpawnScriptNow roadie_battle_shake_highway_hud params = {target_player = <target_player> x_amt = 5 y_amt = 50 time = 1.3299999 decay_amt = 0.75}
		roadie_battle_create_effects target_player = <target_player>
	else
		GuitarEvent_BattleAttackFinished <...>
		formatText checksumName = roadie_battle_effects_hud_id 'Roadie_Battle_Effects_Hud_p%d' d = <target_player>
		if (<target_player> = 1)
			SoundEvent \{event = roadie_battle_pyrooutro}
		else
			SoundEvent \{event = roadie_battle_pyrooutror}
		endif
		Wait \{5.0
			Seconds}
		DestroyScreenElement id = <roadie_battle_effects_hud_id>
	endif
endscript

script roadie_battle_effects_attack_launch_fireball 
	RequireParams \{[
			target_player
		]
		all}
	formatText checksumName = hud_id 'Roadie_Battle_Icons_Hud_p%d' d = <target_player>
	if (<target_player> = 1)
		SoundEvent \{event = roadie_battle_pyrointro}
	else
		SoundEvent \{event = roadie_battle_pyrointror}
	endif
	if (<target_player> = 1)
		<frame1_params> = {Pos = (500.0, 200.0) Scale = (0.25, -0.75) rot_angle = -12 z_priority = -20.0}
		<frame2_params> = {Pos = (350.0, -200.0) Scale = (0.55, -1.9499999) time = 0.75 motion = ease_out}
		<frame3_params> = {Pos = (150.0, -200.0) Scale = (0.85, 1.55) z_priority = 90.0 rot_angle = 12}
		<frame4_params> = {Scale = (1.3, 5.4) Pos = (-200.0, 1600.0) rot_angle = 6 time = 0.85 motion = ease_in}
	else
		<frame1_params> = {Pos = (-500.0, 200.0) Scale = (0.25, -0.75) rot_angle = 12 z_priority = -20.0}
		<frame2_params> = {Pos = (-350.0, -200.0) Scale = (0.55, -1.9499999) time = 0.75 motion = ease_out}
		<frame3_params> = {Pos = (-150.0, -200.0) Scale = (0.85, 1.55) z_priority = 90.0 rot_angle = -12}
		<frame4_params> = {Scale = (1.3, 5.4) Pos = (200.0, 1600.0) rot_angle = -6 time = 0.85 motion = ease_in}
		SoundEvent \{event = roadie_battle_roadie1_pyrointro}
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <hud_id>
		texture = `rb-highway-fire`
		Pos = <Pos>
		just = [center , bottom]
		pos_anchor = [center , bottom]
		use_animated_uvs = true
		top_down_v
		frame_length = 0.042999998
		num_uv_frames = (4.0, 4.0)
		blend = add
		alpha = 1.0
		Scale = <Scale>
		current_frames = <current_frames>
		z_priority = 90.0
	}
	<id> :se_setprops <frame1_params>
	<id> :se_waitprops
	<id> :se_setprops <frame2_params>
	<id> :se_waitprops
	<id> :se_setprops <frame3_params>
	<id> :se_waitprops
	<id> :se_setprops <frame4_params>
	<id> :se_waitprops
	DestroyScreenElement id = <id>
	if (<target_player> = 1)
		SoundEvent \{event = roadie_battle_roadie2_pyrointro}
	endif
endscript

script roadie_battle_create_effects 
	get_highway_hud_root_id Player = <target_player>
	formatText checksumName = roadie_battle_effects_hud_id 'Roadie_Battle_Effects_Hud_p%d' d = <target_player>
	CreateScreenElement {
		parent = <highway_hud_root>
		id = <roadie_battle_effects_hud_id>
		Type = ContainerElement
		pos_anchor = [center center]
		just = [center center]
		Pos = (0.0, 0.0)
		z_priority = 10
	}
	formatText checksumName = roadie_battle_flame_effects_id 'Roadie_Battle_Flame_Effects_p%d' d = <target_player>
	CreateScreenElement {
		parent = <roadie_battle_effects_hud_id>
		id = <roadie_battle_flame_effects_id>
		Type = ContainerElement
		pos_anchor = [center center]
		just = [center center]
		Pos = (0.0, 0.0)
		z_priority = 10
	}
	<i> = 0
	begin
	switch <i>
		case 0
		<PosX> = -175
		<PosY> = 325
		<scalefactor> = 0.6
		<rgba> = [255 160 160 255]
		case 1
		<PosX> = -115
		<PosY> = 350
		<scalefactor> = 0.8
		<rgba> = [255 200 100 255]
		case 2
		<PosX> = 0
		<PosY> = 375
		<scalefactor> = 1.2
		<rgba> = [255 255 255 255]
		case 3
		<PosX> = 115
		<PosY> = 350
		<scalefactor> = 0.8
		<rgba> = [255 200 100 255]
		case 4
		<PosX> = 175
		<PosY> = 325
		<scalefactor> = 0.6
		<rgba> = [255 160 160 255]
	endswitch
	<Pos> = ((<PosX> * (1.0, 0.0)) + (<PosY> * (0.0, 1.0)))
	GetRandomValue \{a = 0
		b = 3
		Name = frameu
		integer}
	GetRandomValue \{a = 0
		b = 3
		Name = framev
		integer}
	<current_frames> = ((<frameu> * (1.0, 0.0)) + (<framev> * (0.0, 1.0)))
	GetRandomValue \{a = 0.9
		b = 1.1
		Name = scalex}
	GetRandomValue \{a = 0.9
		b = 1.1
		Name = scaley}
	GetRandomValue \{a = 0
		b = 1
		Name = Flip
		integer}
	if (<Flip> = 1)
		<Scale> = ((<scalefactor> * <scalex> * (-1.0, 0.0)) + (<scalefactor> * <scaley> * (0.0, 1.0)))
	else
		<Scale> = ((<scalefactor> * <scalex> * (1.0, 0.0)) + (<scalefactor> * <scaley> * (0.0, 1.0)))
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <roadie_battle_effects_hud_id>
		texture = `rb-highway-fire`
		Pos = <Pos>
		just = [center , bottom]
		pos_anchor = [center , bottom]
		use_animated_uvs = true
		top_down_v
		frame_length = 0.044999998
		num_uv_frames = (4.0, 4.0)
		blend = add
		alpha = 0.65000004
		rgba = <rgba>
		Scale = <Scale>
		current_frames = <current_frames>
		z_priority = 90.0
	}
	RunScriptOnScreenElement roadie_battle_animate_flame id = <id> params = {target_player = <target_player>}
	<i> = (<i> + 1)
	repeat 5
	CreateScreenElement {
		Type = SpriteElement
		parent = <roadie_battle_effects_hud_id>
		texture = `rb-highway-fire`
		Pos = (0.0, 370.0)
		just = [center , bottom]
		pos_anchor = [center , bottom]
		use_animated_uvs = true
		top_down_v
		frame_length = 0.044999998
		num_uv_frames = (4.0, 4.0)
		blend = add
		alpha = 0.3
		rgba = [128 0 0 255]
		Scale = (1.5, 0.85)
		z_priority = 89.0
	}
	RunScriptOnScreenElement roadie_battle_animate_flame id = <id> params = {target_player = <target_player>}
	roadie_battle_create_highway_effects {
		target_player = <target_player>
		effect = 'smoke'
		parent = <roadie_battle_effects_hud_id>
		count = 12
		child_props = {
			dims = (200.0, 200.0)
			Pos = (0.0, -600.0)
		}
	}
	roadie_battle_create_highway_effects {
		target_player = <target_player>
		effect = 'pyroglow'
		parent = <roadie_battle_effects_hud_id>
		count = 1
		child_props = {
			dims = (300.0, 200.0)
			Pos = (0.0, 310.0)
			Scale = (1.725, 1.15)
			blend = add
			z_priority = 30.5
			pos_anchor = [center bottom]
			just = [center bottom]
		}
	}
	return
	roadie_battle_create_highway_effects {
		target_player = <target_player>
		effect = 'pyrochunks'
		parent = <roadie_battle_effects_hud_id>
		count = 6
		child_props = {
			blend = add
		}
	}
	roadie_battle_create_highway_effects {
		target_player = <target_player>
		effect = 'pyrothreads'
		parent = <roadie_battle_effects_hud_id>
		count = 10
		child_props = {
			dims = (64.0, 128.0)
			Pos = (0.0, 0.0)
			blend = add
			pos_anchor = [center bottom]
			just = [center bottom]
		}
	}
	roadie_battle_create_highway_effects {
		target_player = <target_player>
		effect = 'pyrosparkle'
		parent = <roadie_battle_effects_hud_id>
		count = 5
		child_props = {
			dims = (64.0, 64.0)
			Pos = (0.0, 0.0)
			blend = add
		}
	}
endscript

script roadie_battle_animate_flame 
	RequireParams \{[
			target_player
		]
		all}
	se_getprops
	<orig_scale> = <Scale>
	<scalex> = (<orig_scale> [0])
	<scaley> = (<orig_scale> [1])
	<Scale> = ((<scalex> * (0.5, 0.0)) + (<scaley> * (0.0, 0.5)))
	se_setprops Scale = <Scale> alpha = 0.25
	se_setprops Scale = <orig_scale> alpha = 0.65000004 time = 1.0
	se_waitprops
	begin
	getplayerinfo <target_player> roadie_battle_effects_attack
	if (<roadie_battle_effects_attack> <= 0)
		break
	endif
	GetRandomValue \{a = 0.8
		b = 1.2
		Name = scalex}
	GetRandomValue \{a = 0.8
		b = 1.2
		Name = scaley}
	<scalex> = (<orig_scale> [0] * <scalex>)
	<scaley> = (<orig_scale> [1] * <scaley>)
	<Scale> = ((<scalex> * (1.0, 0.0)) + (<scaley> * (0.0, 1.0)))
	GetRandomValue \{a = -7
		b = 7
		Name = rot_angle}
	GetRandomValue \{a = 0.15
		b = 0.35000002
		Name = time}
	se_setprops Scale = <Scale> rot_angle = <rot_angle> time = <time>
	se_waitprops
	repeat
	se_setprops \{Scale = 0.0
		Pos = {
			(0.0, 0.0)
			relative
		}
		time = 2.2
		motion = ease_in}
endscript

script roadie_battle_effects_animate_pyroglow 
	RequireParams \{[
			target_player
		]
		all}
	begin
	getplayerinfo <target_player> roadie_battle_effects_attack
	if (<roadie_battle_effects_attack> <= 0)
		break
	endif
	GetRandomValue \{Name = alpha
		a = 0.4
		b = 1.0
		resolution = 1000}
	GetRandomValue \{Name = anim_time
		a = 0.15
		b = 0.25
		resolution = 1000}
	<child> :se_setprops {
		alpha = <alpha>
		time = <anim_time>
	}
	<child> :se_waitprops
	repeat
	se_setprops \{alpha = 0
		time = 2.0
		motion = ease_in}
endscript

script roadie_battle_effects_animate_smoke 
	RequireParams \{[
			target_player
		]
		all}
	<anim_time> = 5.0
	delay = (<anim_time> * <ratio>)
	printf 'Delaying %d seconds...' d = <delay>
	Wait <delay> Seconds
	begin
	GetRandomValue \{Name = start_x
		a = -100.0
		b = 100.0
		resolution = 1000}
	GetRandomValue \{Name = delta_x
		a = -300.0
		b = 300.0
		resolution = 1000}
	GetRandomValue \{Name = alpha
		a = 0.4
		b = 0.5
		resolution = 1000}
	GetRandomValue \{Name = rotation
		a = -30.0
		b = 30.0
		resolution = 1000}
	GetRandomValue \{Name = delta_rotation
		a = 360.0
		b = 420.0
		resolution = 1000}
	GetRandomValue \{Name = negate
		a = 0
		b = 1
		integer}
	if (<negate> = 1)
		<delta_rotation> = (-1 * <delta_rotation>)
	endif
	GetRandomValue \{Name = Scale
		a = 1.4
		b = 1.75
		resolution = 1000}
	GetRandomValue \{Name = delta_scale
		a = 1.4
		b = 1.75
		resolution = 1000}
	GetRandomValue \{Name = z_priority
		a = 40.0
		b = 41.0
		resolution = 1000}
	<main_start_pos> = (0.0, 500.0)
	<main_end_pos> = (0.0, -300.0)
	<sub_end_pos> = (0.0, 0.0)
	setpaircomponents main_start_pos X = <start_x>
	setpaircomponents main_end_pos X = <start_x>
	setpaircomponents sub_end_pos X = <delta_x>
	<child> :se_setprops {
		Pos = (0.0, 0.0)
		alpha = 1.0
		Scale = <Scale>
		dims = (200.0, 200.0)
		time = 0
		rot_angle = <rotation>
		z_priority = <z_priority>
		flip_v = Random (@ FALSE @ true )
		rgba = [255 255 255 255]
	}
	<child> :se_waitprops
	se_setprops {
		Pos = <main_start_pos>
		alpha = <alpha>
		time = 0
	}
	<end_rotation> = (<rotation> + <delta_rotation>)
	se_setprops {
		Pos = <main_end_pos>
		time = <anim_time>
		motion = ease_out
	}
	<child> :se_setprops {
		Pos = <sub_end_pos>
		alpha = 0.0
		time = <anim_time>
		dims = (200.0, 200.0)
		motion = ease_in
		rot_angle = <end_rotation>
		Scale = (<Scale> + <delta_scale>)
		rgba = [0 0 32 255]
	}
	se_waitprops
	getplayerinfo <target_player> roadie_battle_effects_attack
	if (<roadie_battle_effects_attack> <= 0)
		break
	endif
	repeat
	se_setprops \{alpha = 0
		time = 2.0
		motion = ease_in}
endscript

script roadie_battle_effects_animate_pyrochunks 
	<anim_time> = 0.25
	delay = (<anim_time> * <ratio>)
	printf 'Delaying %d seconds...' d = <delay>
	Wait <delay> Seconds
	<mult> = -1.0
	if (<ratio> < 0.5)
		<mult> = 1.0
	endif
	begin
	GetRandomValue \{Name = start_x
		a = 0.0
		b = 200.0
		resolution = 1000}
	GetRandomValue \{Name = delta_x
		a = -100.0
		b = 100.0
		resolution = 1000}
	GetRandomValue \{Name = alpha
		a = 1.0
		b = 1.0
		resolution = 1000}
	GetRandomValue \{Name = rotation
		a = -45.0
		b = 45.0
		resolution = 1000}
	GetRandomValue \{Name = Scale
		a = 2.7
		b = 3.5
		resolution = 1000}
	GetRandomValue \{Name = delta_scale
		a = 1.2
		b = 1.6
		resolution = 1000}
	GetRandomValue \{Name = z_priority
		a = 41.0
		b = 42.0
		resolution = 1000}
	<delta_x> = 0
	GetRandomValue Name = vel_x a = (<mult> * 460.0) b = (<mult> * 520.0) resolution = 1000
	<start_x> = (<mult> * <start_x>)
	GetRandomValue \{Name = vel_y
		a = -615.0
		b = -640.0
		resolution = 1000}
	<main_start_pos> = (0.0, 375.0)
	<main_end_pos> = (0.0, 325.0)
	<sub_start_pos> = (0.0, 0.0)
	<sub_end_pos> = (0.0, 0.0)
	<velocity> = (0.0, 0.0)
	setpaircomponents velocity X = <vel_x> y = <vel_y>
	setpaircomponents main_start_pos X = <start_x>
	setpaircomponents main_end_pos X = <start_x>
	<child> :se_setprops {
		Pos = <sub_start_pos>
		alpha = 1.0
		Scale = <Scale>
		time = 0
		z_priority = <z_priority>
		flip_h = Random (@ FALSE @ true )
		flip_v = Random (@ FALSE @ true )
		rgba = [255 255 255 255]
		rot_angle = 0
	}
	<child> :se_waitprops
	se_setprops {
		Pos = <main_start_pos>
		alpha = <alpha>
		rot_angle = <rotation>
		time = 0
		linear_velocity = <velocity>
		apply_rotational_aspects = true
		mass = 0.1
	}
	<end_rotation> = (<rotation> + <rotation>)
	se_setprops {
		Pos = <main_end_pos>
		time = <anim_time>
		motion = ease_out
	}
	<child> :se_setprops {
		Pos = <sub_end_pos>
		alpha = 0.0
		time = <anim_time>
		motion = linear
		Scale = (<Scale> * <delta_scale>)
		rgba = [100 50 0 255]
		rot_angle = <vel_x>
	}
	se_waitprops
	repeat
endscript

script roadie_battle_effects_animate_pyrothreads 
	<anim_time> = 0.1
	delay = (<anim_time> * <ratio>)
	printf 'Delaying %d seconds...' d = <delay>
	Wait <delay> Seconds
	GetRandomValue \{Name = z_priority
		a = 40.0
		b = 41.0
		resolution = 1000}
	<child> :se_setprops {
		z_priority = <z_priority>
	}
	begin
	GetRandomValue \{Name = start_x
		a = -110.0
		b = 110.0
		resolution = 1000}
	GetRandomValue \{Name = delta_x
		a = -100.0
		b = 100.0
		resolution = 1000}
	GetRandomValue \{Name = alpha
		a = 1.0
		b = 1.0
		resolution = 1000}
	GetRandomValue \{Name = rotation
		a = -20.0
		b = 20.0
		resolution = 1000}
	GetRandomValue \{Name = delta_rotation
		a = -5.0
		b = 5.0
		resolution = 1000}
	GetRandomValue \{Name = Scale
		a = 1.3
		b = 1.7
		resolution = 1000}
	GetRandomValue \{Name = child_scale_y
		a = 1.2
		b = 1.6
		resolution = 1000}
	GetRandomValue \{Name = child_scale_x
		a = 1.5
		b = 1.8499999
		resolution = 1000}
	GetRandomValue \{Name = delta_scale
		a = 0.5
		b = 0.5
		resolution = 1000}
	<delta_x> = 0
	<main_start_pos> = (0.0, 380.0)
	<main_end_pos> = (0.0, 380.0)
	<sub_start_pos> = (0.0, 0.0)
	<sub_end_pos> = (0.0, 0.0)
	<child_scale> = (0.0, 0.0)
	setpaircomponents sub_start_pos X = <start_x>
	setpaircomponents sub_end_pos X = <start_x>
	setpaircomponents child_scale X = <child_scale_x> y = <child_scale_y>
	<child> :se_setprops {
		Pos = <sub_start_pos>
		alpha = 1.0
		Scale = (1.0, 0.0)
		time = 0
		rot_angle = 0
		flip_h = Random (@ FALSE @ true )
		flip_v = Random (@ FALSE @ true )
		rgba = [255 255 255 255]
	}
	se_setprops {
		Pos = <main_start_pos>
		alpha = 1.0
		rot_angle = <rotation>
		Scale = <Scale>
		time = 0
	}
	se_setprops {
		Pos = <main_end_pos>
		time = <anim_time>
		alpha = 0.0
		motion = ease_in
	}
	<child> :se_setprops {
		Pos = <sub_end_pos>
		time = <anim_time>
		rot_angle = <delta_rotation>
		Scale = <child_scale>
		rgba = [200 100 0 255]
	}
	se_waitprops
	repeat
endscript

script roadie_battle_effects_animate_pyrosparkle 
	<anim_time> = 0.4
	begin
	GetRandomValue \{Name = delay
		a = 4.0
		b = 2.0
		resolution = 10000}
	Wait <delay> Seconds
	GetRandomValue \{Name = start_x
		a = -200.0
		b = 200.0
		resolution = 1000}
	GetRandomValue \{Name = delta_x
		a = -100.0
		b = 100.0
		resolution = 1000}
	GetRandomValue \{Name = delta_y
		a = -100.0
		b = 100.0
		resolution = 1000}
	GetRandomValue \{Name = alpha
		a = 1.0
		b = 1.0
		resolution = 1000}
	GetRandomValue \{Name = rotation
		a = -10.0
		b = 10.0
		resolution = 1000}
	GetRandomValue \{Name = Scale
		a = 1.25
		b = 1.5
		resolution = 1000}
	GetRandomValue \{Name = delta_scale
		a = 0.25
		b = 0.25
		resolution = 1000}
	GetRandomValue \{Name = z_priority
		a = 31.0
		b = 32.0
		resolution = 1000}
	<Scale> = 0.6
	<mult> = Random (@ -1.0 @ 1.0 )
	GetRandomValue Name = delta_rotation a = (<mult> * 360.0) b = (<mult> * 720.0) resolution = 1000
	<main_start_pos> = (0.0, 400.0)
	<main_end_pos> = (0.0, 300.0)
	<sub_start_pos> = (0.0, 0.0)
	<sub_end_pos> = (0.0, -500.0)
	setpaircomponents sub_start_pos X = <start_x>
	setpaircomponents main_end_pos X = (<start_x> / 2.0)
	setpaircomponents sub_end_pos X = (<start_x>) y = (-500.0 + <delta_y>)
	<child> :se_setprops {
		Pos = <sub_start_pos>
		alpha = 1.0
		Scale = <Scale>
		z_priority = <z_priority>
		rot_angle = 0
		flip_h = Random (@ FALSE @ true )
		flip_v = Random (@ FALSE @ true )
		rgba = [255 255 255 255]
	}
	se_setprops {
		Pos = <main_start_pos>
		alpha = 1.0
		Scale = 1.0
		rot_angle = <rotation>
		time = 0
	}
	se_setprops {
		Pos = <main_end_pos>
		time = <anim_time>
		motion = ease_in
	}
	<child> :se_setprops {
		Pos = <sub_end_pos>
		rot_angle = <delta_rotation>
		time = <anim_time>
		motion = ease_out
		Scale = (1.0, 1.0)
		rgba = [50 25 0 255]
	}
	se_waitprops
	<child> :se_setprops alpha = 0
	repeat
endscript

script roadie_battle_create_highway_effects \{parent_type = ContainerElement}
	RequireParams \{[
			target_player
			effect
			parent
			count
		]
		all}
	if (<effect> = smoke)
		texture_id = `rb-highway-smoke2`
	else
		formatText checksumName = texture_id 'rb-highway-%e' e = <effect>
	endif
	if NOT GotParam \{script_id}
		formatText checksumName = script_id 'roadie_battle_effects_animate_%e' e = <effect>
	endif
	<i> = 0
	begin
	CreateScreenElement {
		parent = <parent>
		Type = <parent_type>
		alpha = 1.0
		pos_anchor = [center center]
		just = [center center]
		dims = (0.0, 0.0)
		apply_gravity = true
		mass = 0.1
		linear_velocity = (0.0, -1000.0)
		initial_force = (0.0, -1000.0)
	}
	<tmp_parent> = <id>
	CreateScreenElement {
		parent = <tmp_parent>
		Type = SpriteElement
		texture = <texture_id>
		alpha = 0.0
		just = [center center]
		pos_anchor = [center center]
		<child_props>
	}
	<child> = <id>
	if GotParam \{debuggery}
		CreateScreenElement {
			parent = <child>
			Type = SpriteElement
			texture = white
			rgba = [0 0 255 255]
			alpha = 2.0
			just = [center center]
			pos_anchor = [center center]
			dims = (5.0, 10.0)
			Pos = (0.0, 0.0)
			z_priority = 1000
		}
	endif
	RunScriptOnScreenElement id = <tmp_parent> <script_id> params = {target_player = <target_player> child = <child> ratio = ((1.0 * <i>) / <count>)}
	<i> = (<i> + 1)
	repeat <count>
endscript

script roadie_battle_block_until_whammy_done 
	if GotParam \{target_player}
		<other_player> = <target_player>
	endif
	<index> = (<other_player> - 1)
	if ($currently_holding [<index>] = 1)
		if (<index> = 0)
			if NOT GotParam \{no_drain}
				SpawnScriptNow \{roadie_battle_lefty_drain_waitp1
					id = roadie_battle_attack}
			endif
			Block \{anytypes = [
					whammy_offp1
					fake_whammy_offp1
				]}
			if NOT GotParam \{no_drain}
				KillSpawnedScript \{Name = lroadie_battle_efty_drain_waitp1}
			endif
		else
			if NOT GotParam \{no_drain}
				SpawnScriptNow \{roadie_battle_lefty_drain_waitp2
					id = roadie_battle_attack}
			endif
			Block \{anytypes = [
					whammy_offp2
					fake_whammy_offp2
				]}
			if NOT GotParam \{no_drain}
				KillSpawnedScript \{Name = roadie_battle_lefty_drain_waitp2}
			endif
		endif
	endif
endscript

script roadie_battle_hyperspeed 
	target_scale = ($roadie_battle_hyperspeed_scale_amounts.<difficulty>)
	formatText checksumName = script_id 'battle_hyperspeed_ramp_p%d' d = <target_player>
	KillSpawnedScript id = <script_id>
	formatText checksumName = hyperball_id 'roadie_battle_hyper_ball2_p%d' d = <target_player>
	formatText checksumName = hyperglow_id 'roadie_battle_hyper_glow_p%d' d = <target_player>
	if (<attack_mode> = launch)
		SoundEvent \{event = roadie_battle_hyperspeed_start}
		setplayerinfo <target_player> hyperspeed_attack = 1
		SpawnScriptNow roadie_battle_hyperspeed_ramp_speed id = <script_id> params = {target_player = <target_player> target_scale = <target_scale> change_per_second = 0.075}
		get_highway_hud_root_id Player = <target_player>
		CreateScreenElement {
			parent = <highway_hud_root>
			id = <hyperball_id>
			Type = ContainerElement
			just = [center center]
			pos_anchor = [center center]
			Pos = (0.0, -40.0)
			alpha = 0.2
		}
		<i> = 1
		begin
		if (<i> = 1)
			<rgba> = [0 , 0 , 255 , 255]
			<z_priority> = -9.0
			<Scale> = 8.5
		else
			<rgba> = [127 , 127 , 255 , 255]
			<z_priority> = -12.0
			<Scale> = 5.25
		endif
		CreateScreenElement {
			parent = <hyperball_id>
			Type = SpriteElement
			texture = `rb-highway-hypersparkle`
			just = [center center]
			pos_anchor = [center center]
			Pos = (0.0, 0.0)
			blend = add
			Scale = <Scale>
			rgba = <rgba>
			z_priority = <z_priority>
		}
		RunScriptOnScreenElement id = <id> roadie_battle_animate_hyperball params = {i = <i> Player = <target_player> final_scale = <Scale>}
		<i> = (<i> + 1)
		repeat 2
		CreateScreenElement {
			parent = <highway_hud_root>
			id = <hyperglow_id>
			Type = SpriteElement
			texture = `rb-highway-hyperglow`
			just = [center center]
			pos_anchor = [center center]
			blend = add
			z_priority = -40
		}
		RunScriptOnScreenElement id = <hyperglow_id> roadie_battle_animate_hyperglow params = {Player = <target_player>}
	else
		SoundEvent \{event = roadie_battle_hyperspeed_end}
		setplayerinfo <target_player> hyperspeed_attack = -1
		SpawnScriptNow roadie_battle_hyperspeed_ramp_speed id = <script_id> params = {target_player = <target_player> target_scale = 1.0 change_per_second = 0.075}
		GuitarEvent_BattleAttackFinished <...>
		begin
		getplayerinfo <target_player> roadie_battle_hyperspeed_scale
		if (<roadie_battle_hyperspeed_scale> > 0.98999995)
			break
		endif
		Wait \{0.25
			Seconds}
		repeat
		DestroyScreenElement id = <hyperball_id>
		DestroyScreenElement id = <hyperglow_id>
	endif
endscript

script roadie_battle_animate_hyperglow 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> difficulty
	<final_hyperspeed_scale> = ($roadie_battle_hyperspeed_scale_amounts.<difficulty>)
	begin
	GetRandomValue \{Name = base_alpha
		a = 0.2
		b = 0.3
		resolution = 1000}
	getplayerinfo <Player> roadie_battle_hyperspeed_scale
	<roadie_battle_hyperspeed_scale> = ((1.0 - <roadie_battle_hyperspeed_scale>) / (1.0 - <final_hyperspeed_scale>))
	<alpha> = (<base_alpha> * <roadie_battle_hyperspeed_scale> * <roadie_battle_hyperspeed_scale> * <roadie_battle_hyperspeed_scale>)
	se_setprops {
		Scale = (5.5, 3.5)
		dims = (64.0, 64.0)
		just = [center , bottom]
		pos_anchor = [center , bottom]
		rgba = [100 , 100 , 200 , 255]
		z_priority = 0
		alpha = <alpha>
		time = 0.1
	}
	Wait \{0.1
		Seconds}
	repeat
endscript

script roadie_battle_animate_hyperball 
	RequireParams \{[
			Player
			i
			final_scale
		]
		all}
	getplayerinfo <Player> difficulty
	<final_hyperspeed_scale> = ($roadie_battle_hyperspeed_scale_amounts.<difficulty>)
	<odd_even> = 0
	begin
	GetRandomValue \{Name = base_scale
		a = 0.9
		b = 1.1
		resolution = 1000}
	getplayerinfo <Player> roadie_battle_hyperspeed_scale
	<roadie_battle_hyperspeed_scale> = ((1.0 - <roadie_battle_hyperspeed_scale>) / (1.0 - <final_hyperspeed_scale>))
	if (<i> = 1)
		<Scale> = (<final_scale> * <base_scale> * <roadie_battle_hyperspeed_scale>)
	else
		<Scale> = (<final_scale> * <base_scale> * <roadie_battle_hyperspeed_scale> * <roadie_battle_hyperspeed_scale>)
	endif
	if (<odd_even> > 0)
		GetRandomValue \{Name = rotation
			a = 0.0
			b = 360.0
			resolution = 1000}
		se_setprops {
			rot_angle = <rotation>
		}
	endif
	se_setprops {
		Scale = <Scale>
	}
	<odd_even> = (1 - <odd_even>)
	WaitOneGameFrame
	repeat
endscript

script roadie_battle_hyperspeed_ramp_speed 
	getplayerinfo <target_player> roadie_battle_hyperspeed_scale out = hyperspeed_scale
	if (<hyperspeed_scale> > <target_scale>)
		<change_per_second> = (-1 * <change_per_second>)
	endif
	begin
	getplayerinfo <target_player> roadie_battle_hyperspeed_scale out = hyperspeed_scale
	if (<hyperspeed_scale> != <target_scale>)
		GetDeltaTime
		<hyperspeed_scale> = (1.0 * (<hyperspeed_scale> + (<change_per_second> * <delta_time>)))
		if (<change_per_second> < 0 && <hyperspeed_scale> < <target_scale>)
			<hyperspeed_scale> = (1.0 * <target_scale>)
		endif
		if (<change_per_second> > 0 && <hyperspeed_scale> > <target_scale>)
			<hyperspeed_scale> = (1.0 * <target_scale>)
		endif
		setplayerinfo <target_player> roadie_battle_hyperspeed_scale = <hyperspeed_scale>
		getplayerinfo <target_player> difficulty
		difficulty_setup Player = <target_player> difficulty = <difficulty>
		set_highway_speed Player = <target_player>
	endif
	WaitOneGameFrame
	repeat
endscript

script roadie_battle_reset_hyperspeed 
	RequireParams \{[
			target_player
		]
		all}
	setplayerinfo <target_player> roadie_battle_hyperspeed_scale = 1.0
	getplayerinfo <target_player> difficulty
	difficulty_setup Player = <target_player> difficulty = <difficulty>
	set_highway_speed Player = <target_player>
endscript

script roadie_battle_lefty_drain_waitp1 
	begin
	GetSongTimeMs
	getplayerinfo \{1
		lefty_notes}
	if (<time> > <lefty_notes>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	setplayerinfo \{1
		lefty_notes = -1}
	broadcastevent \{Type = fake_whammy_offp1}
endscript

script roadie_battle_lefty_drain_waitp2 
	begin
	GetSongTimeMs
	getplayerinfo \{2
		lefty_notes}
	if (<time> > <lefty_notes>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	setplayerinfo \{2
		lefty_notes = -1}
	broadcastevent \{Type = fake_whammy_offp2}
endscript

script roadie_battle_animate_lefty_flip 
	if GotParam \{target_player}
		other_player = <target_player>
	endif
	formatText checksumName = gem_notes_container_id 'gem_notes_containerp%p' p = <other_player> AddToStringLookup = true
	if GotParam \{unflip}
		<Scale> = (1.0, 1.0)
		<flip_scale> = (-1.0, 1.0)
		<end_scale> = (1.0, 1.0)
	else
		<Scale> = (-1.0, 1.0)
		<flip_scale> = (1.0, 1.0)
		<end_scale> = (1.0, 1.0)
	endif
	GetArraySize \{$gem_colors}
	odd_even = 0
	<time> = 0.05
	begin
	if (<odd_even> = 0)
		<new_scale> = <flip_scale>
		<odd_even> = 1
	else
		<new_scale> = <Scale>
		<odd_even> = 0
	endif
	<time> = (<time> + 0.075)
	<array_count> = 0
	begin
	Color = ($gem_colors [<array_count>])
	gem_material = (($button_up_models [(<other_player> -1)]).<Color>)
	color_string = (<gem_material>.name_string)
	formatText checksumName = name_base '%s_basep%p' s = <color_string> p = <other_player> AddToStringLookup = true
	<name_base> :se_setprops Scale = <new_scale> time = <time> motion = smooth
	array_count = (<array_count> + 1)
	repeat <array_Size>
	<gem_notes_container_id> :se_setprops Scale = <new_scale> time = <time> motion = smooth
	Wait <time> Seconds
	repeat 4
	<array_count> = 0
	begin
	Color = ($gem_colors [<array_count>])
	formatText checksumName = name_base '%s_basep%p' s = (($button_up_models [(<other_player> -1)]).<Color>.name_string) p = <other_player> AddToStringLookup = true
	<name_base> :se_setprops Scale = <end_scale>
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script roadie_battle_hud_get_id 
	formatText checksumName = hud_id 'Roadie_Battle_Icons_Hud_p%d' d = <Player>
	return hud_id = <hud_id>
endscript

script roadie_battle_hud_get_rgba 
	RequireParams \{[
			Player
		]
		all}
	roadie_battle_hud_get_id Player = <Player>
	<hud_id> :se_getprops
	return rgba = <team_name_rgba>
endscript

script roadie_battle_hud_get_flip_scale 
	<hud_id> :se_getprops
	return flip_scale = <flip_scale>
endscript

script roadie_battle_hud_get_icons_holder_id 
	ResolveScreenElementID id = [
		{id = <tray_id>}
		{local_id = trayicons}
	]
	<array_Size> = 0
	if GetScreenElementChildren id = <resolved_id>
		GetArraySize <children>
	endif
	return icons_holder_id = <resolved_id> num_icons = <array_Size>
endscript

script roadie_battle_hud_calculate_icon_pos_from_index 
	RequireParams \{[
			index
		]
		all}
	<start_offset> = 0
	<width> = 38
	return icon_pos = ((<start_offset> - (<index> * <width>)) * (1.0, 0.0)) icon_width = <width>
endscript

script roadie_battle_hud_add_icon 
	RequireParams \{[
			Player
			icon_id
		]
		all}
	roadie_battle_hud_get_id Player = <Player>
	roadie_battle_hud_get_flip_scale hud_id = <hud_id>
	<hud_id> :desc_resolvealias Name = alias_tray param = tray_id
	roadie_battle_hud_get_icons_holder_id tray_id = <tray_id>
	<index> = <num_icons>
	roadie_battle_hud_calculate_icon_pos_from_index index = <index>
	<icon_id> :se_setprops tags = {icon_index = <index>} alpha = 1
	reparentinsamelocation id = <icon_id> parent = <icons_holder_id> new_pos_anchor = [right , center] new_just = [right , center]
	RunScriptOnScreenElement id = <tray_id> roadie_battle_hud_animate_add_icon params = {icon_id = <icon_id> icon_pos = <icon_pos> icon_width = <icon_width>}
endscript

script roadie_battle_hud_remove_icon 
	RequireParams \{[
			Player
			equipment_name
		]
		all}
	if NOT GotParam \{equipment}
		formatText checksumName = equipment <equipment_name>
	endif
	roadie_battle_hud_get_id Player = <Player>
	<hud_id> :desc_resolvealias Name = alias_tray param = tray_id
	roadie_battle_hud_get_icons_holder_id tray_id = <tray_id>
	ResolveScreenElementID id = [
		{id = <icons_holder_id>}
		{local_id = <equipment>}
	]
	<icon_id> = <resolved_id>
	RunScriptOnScreenElement id = <tray_id> roadie_battle_hud_animate_remove_icon params = {icon_id = <icon_id>}
endscript

script roadie_battle_hud_animate_add_icon 
	<icon_id> :se_setprops alpha = 1
	<icon_id> :se_setprops {
		Pos = <icon_pos>
		time = 0.5
		motion = ease_in
	}
	se_setprops {
		Pos = {(<icon_width> * (1.0, 0.0)) relative}
		time = 0.5
		motion = ease_in
	}
	se_waitprops
	roadie_battle_hud_animate_flash id = <icon_id> On = 1
	roadie_battle_hud_animate_flash id = <icon_id> On = 0
	roadie_battle_hud_animate_flash id = <icon_id> On = 1
	roadie_battle_hud_animate_flash id = <icon_id> On = 0
	roadie_battle_hud_animate_flash id = <icon_id> On = 1
endscript

script roadie_battle_hud_animate_remove_icon 
	se_waitprops
	se_setprops \{alpha = 1
		time = 0.3}
	roadie_battle_hud_animate_flash id = <icon_id> On = 0
	roadie_battle_hud_animate_flash id = <icon_id> On = 1
	roadie_battle_hud_animate_flash id = <icon_id> On = 0
	se_waitprops
	DestroyScreenElement id = <icon_id>
	Obj_GetID
	roadie_battle_hud_get_icons_holder_id tray_id = <objID>
	if (<num_icons> > 0)
		GetScreenElementChildren id = <icons_holder_id>
		<i> = 0
		begin
		roadie_battle_hud_calculate_icon_pos_from_index index = <i>
		(<children> [<i>]) :se_setprops {
			Pos = <icon_pos>
			time = 0.5
			motion = ease_in
			tags = {icon_index = (<i>)}
		}
		<i> = (<i> + 1)
		repeat <num_icons>
	else
		roadie_battle_hud_calculate_icon_pos_from_index \{index = 0}
	endif
	se_setprops {
		Pos = {(<icon_width> * (-1.0, 0.0)) relative}
		time = 0.5
		motion = ease_in
	}
	se_waitprops
endscript

script roadie_battle_hud_animate_flash \{time = 0.1
		motion = smooth}
	<id> :se_setprops {alpha = <On> time = <time> motion = <motion>}
	<id> :se_waitprops
endscript
ds_disconnect_popup_open = 0
roadie_battle_ds_disconnect_wait_hack = 0

script roadie_battle_in_game_disconnect_handler 
	begin
	ui_event_get_top
	if (<base_name> = 'song_breakdown_competitive')
		<done> = 0
		if ($roadie_battle_ds_disconnect_wait_hack = 0)
			begin
			if ScreenElementExists \{id = song_breakdown_competitive_id}
				<done> = 1
				break
			endif
			WaitOneGameFrame
			repeat 100
		endif
		if (<done> = 1)
			break
		endif
	elseif (<base_name> = 'gameplay')
		if ($roadie_battle_ds_disconnect_wait_hack = 0)
			Wait \{1.0
				Seconds}
			if NOT ScreenElementExists \{id = loading_screen_container}
				break
			endif
		endif
	elseif (<base_name> = 'songlist' || <base_name> = 'unlock_venue')
		Wait \{1.0
			Seconds}
		if NOT ScreenElementExists \{id = loading_screen_container}
			break
		endif
	endif
	Wait \{0.5
		Seconds}
	repeat
	pausegh3
	disable_pause
	if ScriptIsRunning \{roadie_battle_vs_meter_loop}
		KillSpawnedScript \{Name = roadie_battle_vs_meter_loop}
	endif
	Change \{game_mode = p1_quickplay}
	Change \{ds_disconnect_popup_open = 1}
	create_dialog_box \{use_all_controllers
		heading_text = qs(0x79597197)
		body_text = qs(0xccf81252)
		options = [
			{
				func = roadie_battle_in_game_disconnect_continue
				func_params = {
					dont_remove_helpers
				}
				text = qs(0x0e41fe46)
			}
		]
		dlog_event_handlers = [
			{
				pad_up
				nullscript
			}
			{
				pad_down
				nullscript
			}
		]}
	if (<base_name> = 'songlist')
		LaunchEvent \{Type = unfocus
			target = SongList}
	elseif (<base_name> = 'song_breakdown_competitive')
		LaunchEvent \{Type = unfocus
			target = song_breakdown_competitive_id}
	elseif ScreenElementExists \{id = unlock_venue_screen_id}
		LaunchEvent \{Type = unfocus
			target = unlock_venue_screen_id}
	endif
endscript

script roadie_battle_in_game_disconnect_continue 
	roadie_battle_killspawnedscripts
	destroy_dialog_box
	Change \{ds_disconnect_popup_open = 0}
	cancel_ds_operation
	unpausegh3
	ui_event_get_top
	if (<base_name> = 'gameplay')
		Wait \{0.2
			Seconds}
	endif
	quit_warning_select_quit \{callback = NULL
		data = {
		}}
	roadie_battle_stop_game
	Wait \{1.0
		Seconds}
	ui_event \{event = menu_back
		state = uistate_mainmenu}
	begin
	ui_event_get_top
	if (<base_name> = 'mainmenu')
		break
	endif
	Wait \{0.25
		Seconds}
	repeat
	enable_pause
endscript

script roadie_battle_idle_reset_loop 
	begin
	if NOT scriptidisrunning \{left_roadie_portrait_animation_script}
		SpawnScriptNow \{roadie_battle_roadie_animate_expression
			params = {
				roadie = 1
				expression = Idle
			}}
	endif
	if NOT scriptidisrunning \{right_roadie_portrait_animation_script}
		SpawnScriptNow \{roadie_battle_roadie_animate_expression
			params = {
				roadie = 2
				expression = Idle
			}}
	endif
	Wait \{0.25
		Seconds}
	repeat
endscript
roadie1_resume_state = Idle
roadie2_resume_state = Idle

script roadie_battle_roadie_animate_expression 
	RequireParams \{[
			roadie
			expression
		]
		all}
	roadie_battle_get_player_from_roadie roadie = <roadie>
	if (<Player> = 1)
		<animation_id> = left_roadie_portrait_animation_script
	else
		<animation_id> = right_roadie_portrait_animation_script
	endif
	KillSpawnedScript id = <animation_id>
	SpawnScriptNow roadie_battle_roadie_animate_expression_internal id = <animation_id> params = {roadie = <roadie> expression = <expression>}
endscript

script roadie_battle_stop_animation_after_time 
	RequireParams \{[
			roadie
			time
		]}
	roadie_battle_get_player_from_roadie roadie = <roadie>
	if (<Player> = 1)
		<animation_id> = left_roadie_portrait_animation_script
	else
		<animation_id> = right_roadie_portrait_animation_script
	endif
	formatText checksumName = resume_state 'roadie%r_resume_state' r = <Player>
	Wait <time> Seconds
	SpawnScriptNow roadie_battle_roadie_animate_expression params = {roadie = <roadie> expression = ($<resume_state>)}
endscript

script roadie_battle_roadie_animate_expression_internal 
	RequireParams \{[
			roadie
			expression
		]
		all}
	if NOT ((<roadie> >= 1) && (<roadie> <= 2))
		ScriptAssert 'Invalid roadie number: %r' r = <roadie>
		return
	endif
	roadie_battle_get_player_from_roadie roadie = <roadie>
	if (<Player> < 1)
		ScriptAssert \{'Invalid player number was resolved... aborting!'}
		return
	endif
	formatText checksumName = roadie_expressions 'roadie%r_expressions' r = <Player>
	if (<Player> = 1)
		<roadie_portrait_id> = left_roadie_portrait
		<animation_id> = left_roadie_portrait_animation_script
	else
		<roadie_portrait_id> = right_roadie_portrait
		<animation_id> = right_roadie_portrait_animation_script
	endif
	expression_name = <expression>
	<expression> = ($<roadie_expressions>.<expression_name>)
	<parts> = (<expression>.parts)
	if StructureContains \{structure = expression
			sfx_event}
		SoundEvent event = (<expression>.sfx_event)
	endif
	if StructureContains \{structure = expression
			Duration}
		SpawnScriptNow roadie_battle_stop_animation_after_time params = {roadie = <roadie> time = (<expression>.Duration)}
	endif
	if StructureContains \{structure = expression
			loop_all_parts}
		loop_all_parts = true
	endif
	if StructureContains \{structure = expression
			resume_state}
		formatText checksumName = resume_state 'roadie%r_resume_state' r = <Player>
		Change GlobalName = <resume_state> NewValue = (<expression>.resume_state)
	endif
	begin
	current_part_num = 0
	GetArraySize <parts>
	begin
	<current_part> = (<parts> [<current_part_num>])
	roadie_battle_get_duration_from_part part = <current_part>
	<Type> = (<current_part>.Type)
	if StructureContains \{structure = current_part
			frame_length}
		<frame_length> = (<current_part>.frame_length)
	else
		<frame_length> = -1
	endif
	if (IsArray <frame_length>)
		<frame_length> = -1
	endif
	<total_time_waited> = 0.0
	if ((<Type> != custom) && ((<frame_length> < 0) || (<Type> = random_frames)))
		<num_uv_frames> = (<current_part>.num_uv_frames)
		roadie_battle_get_frame_count_from_uvs num_uv_frames = <num_uv_frames>
		<frame_number> = 0
		begin
		if (<total_time_waited> >= <Duration>)
			break
		endif
		roadie_battle_build_props_from_part part = <current_part> frame_number = <frame_number>
		<roadie_portrait_id> :se_setprops <props>
		Wait <frame_length> Seconds
		<total_time_waited> = (<total_time_waited> + <frame_length>)
		if (<Type> != random_frames)
			<frame_number> = (<frame_number> + 1)
			if (<frame_number> >= <frame_count>)
				if (<Type> = Loop)
					<frame_number> = 0
				else
					break
				endif
			endif
		endif
		repeat
	else
		roadie_battle_build_props_from_part part = <current_part>
		<roadie_portrait_id> :se_setprops <props>
		if StructureContains \{structure = props
				time}
			<roadie_portrait_id> :se_waitprops
		else
			Wait <Duration> Seconds
		endif
	endif
	<current_part_num> = (<current_part_num> + 1)
	repeat <array_Size>
	if NOT GotParam \{loop_all_parts}
		break
	endif
	repeat
	formatText checksumName = resume_state 'roadie%r_resume_state' r = <Player>
	SpawnScriptNow roadie_battle_roadie_animate_expression params = {roadie = <roadie> expression = ($<resume_state>)}
endscript

script roadie_battle_get_duration_from_part 
	RequireParams \{[
			part
		]
		all}
	if StructureContains \{structure = part
			Duration}
		<Duration> = (<part>.Duration)
	else
		if StructureContains \{structure = part
				frame_length}
			<frame_length> = (<part>.frame_length)
			if IsArray <frame_length>
				GetArraySize <frame_length>
				<i> = 0
				<Duration> = 0.0
				begin
				<Duration> = (<Duration> + (<frame_length> [<i>]))
				<i> = (<i> + 1)
				repeat <array_Size>
			else
				roadie_battle_get_frame_count_from_uvs num_uv_frames = (<part>.num_uv_frames)
				<Duration> = (<frame_count> * <frame_length>)
			endif
		else
			<Duration> = 1.0
		endif
	endif
	return Duration = <Duration>
endscript

script roadie_battle_get_frame_count_from_uvs 
	return frame_count = ((<num_uv_frames> [0]) * (<num_uv_frames> [1]))
endscript

script roadie_battle_build_props_from_part 
	RequireParams \{[
			part
		]
		all}
	if NOT StructureContains \{structure = part
			Type}
		ScriptAssert \{'Missing parameter <type> in part! Aborting with empty props!'}
		return \{props = {
			}}
	endif
	<Type> = (<part>.Type)
	<frame_length> = 0.1
	switch (<Type>)
		case one_shot
		case Loop
		case random_frames
		if NOT StructureContains \{structure = part
				texture}
			ScriptAssert \{'Missing parameter <texture> in part! Aborting with empty props!'}
			return props = {} frame_length = <frame_length>
		endif
		if NOT StructureContains \{structure = part
				num_uv_frames}
			ScriptAssert \{'Missing parameter <num_uv_frames> in part! Aborting with empty props!'}
			return props = {} frame_length = <frame_length>
		endif
		if NOT StructureContains \{structure = part
				frame_length}
			if NOT StructureContains \{structure = part
					frame_length_range}
				ScriptAssert \{'Missing parameter <frame_length> or <frame_length_range> in part! Aborting with empty props!'}
				return props = {} frame_length = <frame_length>
			endif
		endif
		<texture> = (<part>.texture)
		<num_uv_frames> = (<part>.num_uv_frames)
		<frame_length> = (<part>.frame_length)
		if IsArray <frame_length>
			roadie_battle_get_frame_count_from_uvs num_uv_frames = <num_uv_frames>
			GetArraySize <frame_length>
			if (<frame_count> != <array_Size>)
				ScriptAssert \{'<frame_length> array size does not match the number of frames in <num_uv_frames> Aborting with empty props!'}
				return props = {} frame_length = <frame_length>
			endif
			if NOT GotParam \{frame_number}
				ScriptAssert \{'Expected parameter <frame_number> since we got an array for <frame_length>! Aborting with empty props!'}
				return props = {} frame_length = <frame_length>
			endif
			<frame_length> = (<frame_length> [<frame_number>])
			<loop_animated_uvs> = FALSE
			u = (<num_uv_frames> [0])
			v = (<num_uv_frames> [1])
			CastToInteger \{u}
			CastToInteger \{v}
			Mod a = <frame_number> b = <u>
			X = <Mod>
			CastToInteger \{X}
			if (<v> = 1)
				<v> = 2
			endif
			y = (<frame_number> / <v>)
			CastToInteger \{y}
			<current_frames> = ((<X> * (1.0, 0.0)) + (<y> * (0.0, 1.0)))
			<normal_frame_length> = 100.0
		elseif StructureContains \{structure = part
				frame_length_range}
			<frame_length_range> = (<part>.frame_length_range)
			GetRandomValue Name = frame_length_tmp a = (<frame_length_range> [0]) b = (<frame_length_range> [1])
			<normal_frame_length> = 100.0
			<loop_animated_uvs> = FALSE
		else
			if (<Type> = Loop)
				<loop_animated_uvs> = true
			else
				<loop_animated_uvs> = FALSE
			endif
			<normal_frame_length> = <frame_length>
		endif
		if (<Type> = random_frames)
			u = (<num_uv_frames> [0] -1)
			v = (<num_uv_frames> [1] -1)
			CastToInteger \{u}
			CastToInteger \{v}
			GetRandomValue Name = current_frames_a a = 0 b = <u> integer
			GetRandomValue Name = current_frames_b a = 0 b = <v> integer
			<current_frames> = ((<current_frames_a> * (1.0, 0.0)) + (<current_frames_b> * (0.0, 1.0)))
		elseif NOT GotParam \{current_frames}
			<current_frames> = (0.0, 0.0)
		endif
		props = {
			use_animated_uvs = true
			top_down_v
			texture = <texture>
			frame_length = <normal_frame_length>
			num_uv_frames = <num_uv_frames>
			loop_animated_uvs = <loop_animated_uvs>
			use_animated_uvs = true
			current_frames = <current_frames>
		}
		if StructureContains \{structure = part
				dims}
			props = {<props> dims = (<part>.dims)}
		endif
		if StructureContains \{structure = part
				Scale}
			props = {<props> Scale = (<part>.Scale)}
		endif
		case custom
		props = (<part>.props)
		default
		ScriptAssert \{'Unknown part type: %p! Aborting with empty props!'}
		return props = {} frame_length = <frame_length>
	endswitch
	if (<Type> = random_frames)
		<frame_length> = <frame_length_tmp>
	endif
	return props = <props> frame_length = <frame_length>
endscript

script reparentinsamelocation 
	<id> :se_getparentid
	<id> :se_getprops
	if NOT GotParam \{new_just}
		<new_just> = <just>
	endif
	if NOT GotParam \{new_pos_anchor}
		<new_pos_anchor> = <pos_anchor>
	endif
	GetScreenElementPosition id = <id> absolute
	<id> :se_setprops parent = <parent> Pos = {<screenelementpos> absolute}
	<id> :se_setprops pos_anchor = <new_pos_anchor> just = <new_just>
endscript

script roadie_battle_add_hud_icon 
	RequireParams \{[
			target_player
			equipment
		]
		all}
	<equipment_struct> = ($roadie_battle_equipment_attacks.<equipment>)
	<equipment_name> = (<equipment_struct>.Name)
	formatText checksumName = icons_container_id 'icons_container_p%p' p = <target_player>
	formatText checksumName = icon_id '%e_icon_p%p' e = <equipment_name> p = <target_player>
	<max_offset> = 5
	<icon_slot> = (<equipment_struct>.icon_slot)
	if NOT (ScreenElementExists id = <icons_container_id>)
		get_highway_hud_root_id Player = <target_player>
		if (<target_player> = 1)
			<Pos> = (-200.0, 15.0)
		else
			<Pos> = (-180.0, 15.0)
		endif
		CreateScreenElement {
			Type = ContainerElement
			id = <icons_container_id>
			parent = <highway_hud_root>
			pos_anchor = [center top]
			just = [center top]
			Pos = <Pos>
		}
	endif
	if NOT (ScreenElementExists id = <icon_id>)
		get_highway_hud_root_id Player = <target_player>
		<icon_texture> = (<equipment_struct>.icon_texture)
		CreateScreenElement {
			Type = SpriteElement
			id = <icon_id>
			parent = <icons_container_id>
			texture = <icon_texture>
			Pos = <start_pos>
			z_priority = 15
		}
	endif
	GetRandomValue Name = start_posx a = ((<icon_slot> * 85) - <max_offset>) b = ((<icon_slot> * 85) + <max_offset>)
	<start_posy> = -300
	<start_pos> = (((1.0, 0.0) * <start_posx>) + ((0.0, 1.0) * <start_posy>))
	<start_scale> = 3.0
	GetRandomValue Name = PosX a = ((<icon_slot> * 100) - <max_offset>) b = ((<icon_slot> * 100) + <max_offset>)
	GetRandomValue Name = PosY a = (0 + (-1 * <max_offset>)) b = (0 + <max_offset>)
	<Pos> = (((1.0, 0.0) * <PosX>) + ((0.0, 1.0) * <PosY>))
	<Scale> = 1.0
	GetRandomValue \{Name = rot
		a = -25
		b = 25}
	<icon_id> :se_setprops {
		Pos = <start_pos>
		Scale = <start_scale>
		alpha = 1
		rot_angle = 0
		rgba = [255 255 255 255]
	}
	<icon_id> :se_setprops {
		rot_angle = <rot>
		Pos = <Pos>
		Scale = <Scale>
		time = 0.25
		motion = ease_in
	}
	<icon_id> :se_waitprops
	RunScriptOnScreenElement id = <icons_container_id> roadie_battle_shake_effect params = {x_amt = 5 y_amt = 30 time = 0.5 decay_amt = 0.75}
endscript

script roadie_battle_remove_hud_icon 
	RequireParams \{[
			target_player
			equipment
		]
		all}
	<equipment_struct> = ($roadie_battle_equipment_attacks.<equipment>)
	<equipment_name> = (<equipment_struct>.Name)
	formatText checksumName = icons_container_id 'icons_container_p%p' p = <target_player>
	formatText checksumName = icon_id '%e_icon_p%p' e = <equipment_name> p = <target_player>
	<icon_id> :se_setprops Scale = 0 rot_angle = 1080 time = 0.5 rgba = [100 100 100 255] motion = ease_out
endscript

script roadie_battle_vs_meter_loop 
	if NOT is_roadie_battle_mode
		return
	endif
	Change \{prev_fretbar_index = 0}
	ResolveScreenElementID \{id = {
			hud_root
			child = 0
		}
		param = hud_container}
	if ScreenElementExists \{id = roadie_battle_vs_needle}
		DestroyScreenElement \{id = roadie_battle_vs_needle}
	endif
	if NOT ScreenElementExists id = <hud_container>
		return
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <hud_container>
		id = roadie_battle_vs_needle
		Pos = (593.0, 400.0)
		pos_anchor = [center , center]
	}
	CreateScreenElement \{Type = SpriteElement
		parent = roadie_battle_vs_needle
		texture = `rb-newmeter-base`
		Pos = (0.0, 0.0)
		just = [
			center
			center
		]
		pos_anchor = [
			center
			center
		]
		Scale = (1.21, 1.0)
		z_priority = 0}
	<meter_base_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <meter_base_id>
		texture = `rb-newmeter-blue`
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		z_priority = 0.1
		blend = add
	}
	<meter_blue_id> = <id>
	RunScriptOnScreenElement id = <meter_blue_id> roadie_battle_pulse_meterglow params = {Player = 1}
	CreateScreenElement {
		Type = SpriteElement
		parent = <meter_base_id>
		texture = `rb-newmeter-blue`
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		z_priority = 0.1
		alpha = 0.8
		blend = add
	}
	<meter_extra_blue_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <meter_base_id>
		texture = `rb-newmeter-red`
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		z_priority = 0.1
		blend = add
	}
	<meter_red_id> = <id>
	RunScriptOnScreenElement id = <meter_red_id> roadie_battle_pulse_meterglow params = {Player = 2}
	CreateScreenElement {
		Type = SpriteElement
		parent = <meter_base_id>
		texture = `rb-newmeter-red`
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		z_priority = 0.1
		alpha = 0.8
		blend = add
	}
	<meter_extra_red_id> = <id>
	CreateScreenElement \{Type = TextBlockElement
		parent = roadie_battle_vs_needle
		Pos = (-70.0, -74.0)
		dims = (200.0, 150.0)
		font = fontgrid_title_gh3
		internal_scale = 0.475
		rgba = [
			135
			189
			189
			255
		]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		text = qs(0x6160dbf3)
		internal_just = [
			left
			bottom
		]
		rot_angle = -6
		enable_min_scaling = FALSE}
	<p1_text_id> = <id>
	RunScriptOnScreenElement id = <p1_text_id> roadie_battle_update_score_text params = {Player = 1}
	CreateScreenElement \{Type = TextBlockElement
		parent = roadie_battle_vs_needle
		Pos = (60.0, -74.0)
		dims = (200.0, 150.0)
		font = fontgrid_title_gh3
		internal_scale = 0.475
		rgba = [
			255
			135
			135
			255
		]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		text = qs(0x6160dbf3)
		internal_just = [
			right
			bottom
		]
		rot_angle = 6
		enable_min_scaling = FALSE}
	<p2_text_id> = <id>
	RunScriptOnScreenElement id = <p2_text_id> roadie_battle_update_score_text params = {Player = 2}
	CreateScreenElement {
		Type = SpriteElement
		parent = <meter_base_id>
		texture = icon_leader
		Pos = (20.0, -20.0)
		just = [center , center]
		pos_anchor = [center , center]
		alpha = 0.0
		Scale = 1.0
		z_priority = 0.1
	}
	<icon_leader_id> = <id>
	RunScriptOnScreenElement id = <icon_leader_id> roadie_battle_rotate_leader_crown
	CreateScreenElement {
		Type = SpriteElement
		parent = <icon_leader_id>
		texture = icon_leader
		Pos = (3.0, 3.0)
		rgba = [0 0 0 255]
		just = [center , center]
		pos_anchor = [center , center]
		alpha = 1.0
		Scale = 1.0
		z_priority = 0.05
	}
	CreateScreenElement \{Type = ContainerElement
		parent = roadie_battle_vs_needle
		Pos = (0.0, 1170.0)
		dims = (0.0, 1170.0)
		just = [
			center
			bottom
		]
		pos_anchor = [
			center
			top
		]}
	<marker_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <marker_id>
		texture = `rb-newmeter-marker`
		Pos = (0.0, -50.0)
		z_priority = 0.3
	}
	<marker_img_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <id>
		texture = `rb-newmeter-markerglow`
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		z_priority = 0.2
		alpha = 0.8
		blend = add
	}
	roadie_battle_vs_needle :se_setprops \{Pos = {
			(0.0, 300.0)
			relative
		}
		alpha = 0.0}
	roadie_battle_vs_needle :se_setprops \{Pos = {
			(0.0, -300.0)
			relative
		}
		alpha = 1.0
		time = 0.5
		motion = ease_in}
	roadie_battle_vs_needle :se_waitprops
	RunScriptOnScreenElement \{id = roadie_battle_vs_needle
		roadie_battle_shake_effect
		params = {
			x_amt = 5
			y_amt = 30
			time = 0.4
			decay_amt = 0.75
		}}
	Wait \{0.4}
	SpawnScriptNow \{roadie_battle_create_roadie_portraits}
	<odd_even> = 0
	begin
	getfaceoffratio
	<odd_even> = (1 - <odd_even>)
	if (<faceoff_ratio> > 0)
		<alpha> = (<faceoff_ratio>)
		<Scale> = (0.7, 0.7)
		<Player> = 1
		<rgba> = [32 32 100 255]
	else
		<alpha> = (-1.0 * <faceoff_ratio>)
		<Scale> = (-0.7, 0.7)
		<Player> = 2
		<rgba> = [100 32 32 255]
	endif
	if (<alpha> < 0.25)
		<rgba> = [52 52 52 255]
	endif
	<angle> = (-8.25 * <faceoff_ratio>)
	<other_angle> = (<angle> * 1.1)
	get_time_until_next_fretbar
	if ((<time_until_next_fretbar> <= 0.0167) || (<time_until_next_fretbar> > 1.0))
		<time_until_next_fretbar> = 0.1
	endif
	<marker_id> :se_setprops rot_angle = <angle> time = <time_until_next_fretbar> motion = ease_out
	if (<faceoff_ratio> > 0)
		<marker_img_id> :se_setprops rot_angle = (<angle> * 0.9) flip_v = true time = <time_until_next_fretbar> motion = ease_out
		<meter_extra_blue_id> :se_setprops alpha = 0.8 time = <time_until_next_fretbar>
		<meter_extra_red_id> :se_setprops alpha = 0.0 time = <time_until_next_fretbar>
		<p1_text_id> :se_setprops rgba = [255 255 255 255] Scale = 1.1 time = <time_until_next_fretbar>
		<p2_text_id> :se_setprops rgba = [255 135 135 255] Scale = 1.0 time = <time_until_next_fretbar>
	else
		<marker_img_id> :se_setprops rot_angle = (<angle> * 0.9) flip_v = FALSE time = <time_until_next_fretbar> motion = ease_out
		<meter_extra_red_id> :se_setprops alpha = 0.8 time = <time_until_next_fretbar>
		<meter_extra_blue_id> :se_setprops alpha = 0.0 time = <time_until_next_fretbar>
		<p1_text_id> :se_setprops rgba = [135 189 189 255] Scale = 1.0 time = <time_until_next_fretbar>
		<p2_text_id> :se_setprops rgba = [255 255 255 255] Scale = 1.1 time = <time_until_next_fretbar>
	endif
	Wait <time_until_next_fretbar> Seconds
	repeat
endscript

script roadie_battle_pulse_meterglow 
	RequireParams \{[
			Player
		]
		all}
	begin
	getfaceoffratio
	if (<faceoff_ratio> > 0)
		<alpha> = (<faceoff_ratio>)
		<winning> = 1
	else
		<alpha> = (-1.0 * <faceoff_ratio>)
		<winning> = 2
	endif
	if (<Player> != <winning>)
		<alpha> = 0.0
	endif
	se_setprops alpha = <alpha> Scale = 1.033 time = 0.75 motion = smooth
	se_waitprops
	se_setprops \{Scale = 1.0
		time = 0.75
		motion = smooth}
	se_waitprops
	repeat
endscript

script roadie_battle_rotate_leader_crown 
	odd_even = 0
	if GotParam \{Shadow}
		icon_leader_props = [
			{
				Pos = (-17.0, -13.0)
			}
			{
				Pos = (23.0, -13.0)
			}
		]
	else
		icon_leader_props = [
			{
				Pos = (-20.0, -15.0)
			}
			{
				Pos = (20.0, -15.0)
			}
		]
	endif
	begin
	getfaceoffratio
	if (<faceoff_ratio> > 0)
		<props> = (<icon_leader_props> [0])
		if (<faceoff_ratio> < 0.01)
			<props> = {<props> alpha = 0.0}
		else
			<props> = {<props> alpha = 1.0}
		endif
	else
		<props> = (<icon_leader_props> [1])
		if (<faceoff_ratio> > -0.01)
			<props> = {<props> alpha = 0.0}
		else
			<props> = {<props> alpha = 1.0}
		endif
	endif
	se_getprops
	if (<odd_even> = 0)
		se_setprops <props> rot_angle = 10 time = 0.5 motion = smooth
	else
		se_setprops <props> rot_angle = -10 time = 0.5 motion = smooth
	endif
	<odd_even> = (1 - <odd_even>)
	if (<alpha> = 0 && (<faceoff_ratio> >= 0.1 || <faceoff_ratio> <= -0.01))
		freestyle_hud_pop_graphic_in
	endif
	se_waitprops
	repeat
endscript

script roadie_battle_create_roadie_portraits 
	CreateScreenElement \{Type = SpriteElement
		parent = roadie_battle_vs_needle
		id = left_roadie_portrait
		texture = `rb-roadie1-idle1`
		num_uv_frames = (2.0, 2.0)
		dims = (128.0, 128.0)
		Pos = (-100.0, -120.0)
		just = [
			center
			center
		]
		pos_anchor = [
			center
			center
		]
		Scale = 1.2
		z_priority = -0.1}
	CreateScreenElement \{Type = SpriteElement
		parent = roadie_battle_vs_needle
		id = right_roadie_portrait
		texture = `rb-roadie2-idle1`
		dims = (128.0, 128.0)
		Pos = (100.0, -120.0)
		just = [
			center
			center
		]
		pos_anchor = [
			center
			center
		]
		Scale = 1.2
		z_priority = -0.1}
	left_roadie_portrait_id :se_setprops \{Pos = {
			(0.0, 300.0)
			relative
		}
		alpha = 0.0}
	left_roadie_portrait_id :se_setprops \{Pos = {
			(0.0, -300.0)
			relative
		}
		alpha = 1.0
		time = 0.5
		motion = ease_in}
	RunScriptOnScreenElement \{id = left_roadie_portrait
		roadie_battle_shake_effect
		params = {
			x_amt = 5
			y_amt = 30
			time = 0.4
			decay_amt = 0.75
		}}
	Wait \{0.25}
	roadie_battle_get_roadie_from_player \{Player = 1}
	SpawnScriptNow roadie_battle_roadie_animate_expression params = {roadie = <roadie> expression = Idle}
	right_roadie_portrait_id :se_setprops \{Pos = {
			(0.0, 300.0)
			relative
		}
		alpha = 0.0}
	right_roadie_portrait_id :se_setprops \{Pos = {
			(0.0, -300.0)
			relative
		}
		alpha = 1.0
		time = 0.5
		motion = ease_in}
	RunScriptOnScreenElement \{id = right_roadie_portrait
		roadie_battle_shake_effect
		params = {
			x_amt = 5
			y_amt = 30
			time = 0.4
			decay_amt = 0.75
		}}
	Wait \{0.25}
	roadie_battle_get_roadie_from_player \{Player = 2}
	SpawnScriptNow roadie_battle_roadie_animate_expression params = {roadie = <roadie> expression = Idle}
endscript

script roadie_battle_update_score_text 
	RequireParams \{[
			Player
		]
		all}
	begin
	getplayerinfo <Player> score
	CastToInteger \{score}
	formatText TextName = score_text qs(0x4d4555da) s = <score>
	se_setprops text = <score_text>
	WaitOneGameFrame
	repeat
endscript
roadie1_last_attack_time = 0
roadie2_last_attack_time = 0

script roadie_battle_help_prompt_loop 
	RequireParams \{[
			Player
		]
		all}
	roadie_battle_get_roadie_from_player Player = <Player>
	roadie_battle_hud_get_id Player = <Player>
	if NOT ScreenElementExists id = <hud_id>
		return
	endif
	<hud_id> :desc_resolvealias Name = alias_hud_text param = hud_text_id
	begin
	begin
	if NOT ScreenElementExists id = <hud_text_id>
		return
	endif
	<hud_text_id> :se_getprops
	if (<alpha> <= 0)
		break
	endif
	Wait \{0.5
		Seconds}
	repeat
	<roadie_index> = (<roadie> - 1)
	getplayerinfo <Player> roadie_battle_ai
	if NOT (<roadie_battle_ai> = 1)
		if NOT (($roadie_infos [<roadie_index>].is_ai) = 1)
			roadie_battle_ai_check_equipment roadie = <roadie>
			GetArraySize <repairable>
			if (<array_Size> >= 3)
				RunScriptOnScreenElement {
					id = <hud_text_id>
					roadie_battle_animate_text
					params = {
						text = qs(0x43ee3ca4)
					}
				}
			elseif (<array_Size> <= 2)
				GetSongTimeMs
				formatText checksumName = last_attack_time 'roadie%r_last_attack_time' r = <roadie>
				<time_since_last_attack> = (<time> - $<last_attack_time>)
				if (<time_since_last_attack> >= 40000)
					RunScriptOnScreenElement {
						id = <hud_text_id>
						roadie_battle_animate_text
						params = {
							text = qs(0x80fac740)
						}
					}
				endif
			endif
		endif
	endif
	Wait \{10
		Seconds}
	repeat
endscript
prev_fretbar_index = 0

script get_next_fretbar_time 
	gman_songtool_getcurrentsong
	GetSongTimeMs
	<time> = (<time> + ($time_gem_offset / 1000.0) - 0.02)
	songfilemanager func = get_num_fretbar_notes song_name = <current_song>
	<fretbar_index> = $prev_fretbar_index
	begin
	songfilemanager func = get_fretbar_note song_name = <current_song> index = <fretbar_index>
	if (<fretbar_time> > <time>)
		break
	endif
	<fretbar_index> = (<fretbar_index> + 1)
	repeat (<num_fretbar_notes> - $prev_fretbar_index)
	Change prev_fretbar_index = <fretbar_index>
	return next_fretbar_time = <fretbar_time>
endscript

script get_time_until_next_fretbar 
	return \{time_until_next_fretbar = 0.4}
	GetSongTimeMs
	<time> = (<time> + ($time_gem_offset / 1000.0) - 0.02)
	get_next_fretbar_time
	return time_until_next_fretbar = ((<next_fretbar_time> - <time>) / 1000.0)
endscript

script pulse_props_to_beat 
	RequireParams \{[
			rest_props
			pulse_props
		]
		all}
	if GotParam \{rest_time_is_time_between_beats}
		begin
		se_setprops <pulse_props>
		se_waitprops
		get_time_until_next_fretbar
		if ((<time_until_next_fretbar> <= 0.0167) || (<time_until_next_fretbar> > 1.0))
			<time_until_next_fretbar> = 0.1
		endif
		se_setprops <rest_props> time = <time_until_next_fretbar>
		se_waitprops
		repeat
	else
		begin
		se_setprops <rest_props>
		se_waitprops
		get_time_until_next_fretbar
		if ((<time_until_next_fretbar> <= 0.0167) || (<time_until_next_fretbar> > 1.0))
			<time_until_next_fretbar> = 0.1
		endif
		Wait <time_until_next_fretbar> Seconds
		se_setprops <pulse_props>
		se_waitprops
		repeat
	endif
endscript
