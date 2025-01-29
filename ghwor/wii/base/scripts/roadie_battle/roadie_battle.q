roadie_battle_player_difficulty_order = [
	beginner
	easy
	medium
	hard
	expert
	expert_plus
]
roadie_battle_instrument_order = [
	guitar
	bass
	vocals
	drum
]
roadie_battle_mode_order = [
	coop
	competitive
]
roadie_battle_menu_order = [
	signin
	chooseavatar
	choosepartner
	ready
	challenge
	outro
	results
]
roadie_battle_challenge_instrument_order = [
	guitar
	bass
	drum
	Band
]
roadie_battle_prohibited_cheats = [
	Cheat_PerformanceMode
	cheat_invincible
	cheat_hudfreemode
	cheat_freedrum
	Cheat_Hyperspeed
]
roadie_battle_ds_start_time_ms = 0
roadie_battle_in_game = 0
roadie_battle_mode = coop
roadie_battle_ds_started = FALSE

script roadie_battle_enter 
	if inroadiebattlemode
		return
	endif
	setinroadiebattlemode \{value = true}
	CreateScreenElement \{parent = root_window
		id = roadie_event_listener
		Type = ContainerElement
		Pos = (0.0, 0.0)
		dims = (0.0, 0.0)
		event_handlers = [
			{
				ds_connect
				roadie_battle_handle_ds_connect
			}
			{
				ds_disconnect
				roadie_battle_handle_ds_disconnect
			}
			{
				missed_notep1
				roadie_battle_handle_missed_note
			}
			{
				missed_notep2
				roadie_battle_handle_missed_note
			}
			{
				missed_notep3
				roadie_battle_handle_missed_note
			}
			{
				missed_notep4
				roadie_battle_handle_missed_note
			}
			{
				hit_notep1
				roadie_battle_handle_hit_gem_color
			}
			{
				hit_notep2
				roadie_battle_handle_hit_gem_color
			}
			{
				hit_notep3
				roadie_battle_handle_hit_gem_color
			}
			{
				hit_notep4
				roadie_battle_handle_hit_gem_color
			}
			{
				hit_notesp1
				roadie_battle_handle_hit_note
			}
			{
				hit_notesp2
				roadie_battle_handle_hit_note
			}
			{
				hit_notesp3
				roadie_battle_handle_hit_note
			}
			{
				hit_notesp4
				roadie_battle_handle_hit_note
			}
			{
				whammy_onp1
				roadie_battle_handle_whammy_on
			}
			{
				whammy_onp2
				roadie_battle_handle_whammy_on
			}
			{
				whammy_onp3
				roadie_battle_handle_whammy_on
			}
			{
				whammy_onp4
				roadie_battle_handle_whammy_on
			}
			{
				whammy_offp1
				roadie_battle_handle_whammy_off
			}
			{
				whammy_offp2
				roadie_battle_handle_whammy_off
			}
			{
				whammy_offp3
				roadie_battle_handle_whammy_off
			}
			{
				whammy_offp4
				roadie_battle_handle_whammy_off
			}
			{
				star_power_onp1
				roadie_battle_handle_star_power_on
			}
			{
				star_power_onp2
				roadie_battle_handle_star_power_on
			}
			{
				star_power_onp3
				roadie_battle_handle_star_power_on
			}
			{
				star_power_onp4
				roadie_battle_handle_star_power_on
			}
			{
				star_power_offp1
				roadie_battle_handle_star_power_off
			}
			{
				star_power_offp2
				roadie_battle_handle_star_power_off
			}
			{
				star_power_offp3
				roadie_battle_handle_star_power_off
			}
			{
				star_power_offp4
				roadie_battle_handle_star_power_off
			}
			{
				roadie_battle_multiplier_changed
				roadie_battle_handle_multiplier_change
			}
		]}
endscript

script roadie_battle_exit 
	if NOT inroadiebattlemode
		return
	endif
	setinroadiebattlemode \{value = FALSE}
	DestroyScreenElement \{id = roadie_event_listener}
	roadie_battle_set_default_player_info
	roadie_battle_reset_stats
endscript

script roadie_battle_connected 
	roadie_battle_set_default_roadie_info
	roadie_battle_set_default_player_info
	roadie_battle_set_connected_ds_roadie_info
	roadie_battle_send_all_connected_ds_info
	roadie_battle_send_mode
	Change \{roadie_battle_lobby_first_time = true}
endscript

script is_roadie_battle_mode 
	if inroadiebattlemode
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script is_roadie_battle_coop 
	if inroadiebattlemode
		if ($roadie_battle_mode = coop)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script is_roadie_battle_competitive 
	if inroadiebattlemode
		if ($roadie_battle_mode = competitive)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script roadie_battle_init_gameplay 
	if NOT inroadiebattlemode
		return
	endif
	if NOT ispakloaded \{'pak\\roadie_battle\\roadie_battle_game_sprites.pak'}
		LoadPak \{'pak\\roadie_battle\\roadie_battle_game_sprites.pak'
			Heap = quota_sprites}
	endif
	if NOT ispakloaded \{'pak\\roadie_battle\\roadie_battle_game_sprites2.pak'}
		LoadPak \{'pak\\roadie_battle\\roadie_battle_game_sprites2.pak'
			Heap = quota_misc}
	endif
	GetArraySize \{$roadie_battle_prohibited_cheats}
	getnumplayersingame
	getfirstplayer
	begin
	<cheat> = 0
	begin
	cheat_set_playerinfo_or_global {
		cheat_name = ($roadie_battle_prohibited_cheats [<cheat>])
		state_index = 0
		Player = <Player>
	}
	<cheat> = (<cheat> + 1)
	repeat <array_Size>
	getnextplayer Player = <Player>
	repeat <num_players>
	roadie_battle_init_lod
endscript

script roadie_battle_deinit_gameplay 
	roadie_battle_stop_game
	UnLoadPak \{'pak\\roadie_battle\\roadie_battle_game_sprites.pak'}
	UnLoadPak \{'pak\\roadie_battle\\roadie_battle_game_sprites2.pak'}
endscript

script roadie_battle_start_game 
	if NOT inroadiebattlemode
		return
	endif
	if ($roadie_battle_in_game = 1)
		return
	endif
	Change \{roadie_battle_in_game = 1}
	pushfrontendoverridequota \{quota = quota_misc}
	roadie_battle_reset_game_roadie_info
	roadie_battle_reset_game_player_info
	roadie_battle_reset_buff_attack_variables
	if ($ds_debug_skipped_connection = true)
		getnumplayersingame
		getfirstplayer
		<roadie> = 0
		begin
		roadie_battle_set_roadie_info roadie = <roadie> param = Active value = true
		roadie_battle_set_roadie_info roadie = <roadie> param = signed_in value = true
		roadie_battle_set_roadie_info roadie = <roadie> param = avatar value = <roadie>
		roadie_battle_assign_roadie_to_player roadie = <roadie> Player = <Player>
		<roadie> = (<roadie> + 1)
		getnextplayer Player = <Player>
		repeat <num_players>
		Change active_roadie_count = <num_players>
		Change signed_in_roadie_count = <num_players>
	endif
	roadie_battle_send_song_info
	roadie_battle_create_hud
	roadie_battle_start_intro_hud
	getnumplayersingame
	getfirstplayer
	begin
	setgemcreationcallback Player = <Player> script_name = roadie_battle_gem_creation_callback script_params = {}
	getnextplayer Player = <Player>
	repeat <num_players>
	roadie_battle_dda_start
	roadie_battle_init_charge
	roadie_battle_reset_stats
	SpawnScriptNow \{roadie_battle_wait_and_start_ds}
	SpawnScriptNow \{roadie_battle_send_elapsed_song_time_loop}
endscript

script roadie_battle_wait_and_start_ds 
	begin
	GetSongTimeMs
	if (<time> >= $roadie_battle_ds_start_time_ms)
		break
	endif
	WaitOneGameFrame
	repeat
	wiidscommunication :sendmessage \{start_mode
		destination_aids = $roadie_battle_signed_in_ds_aids}
	Change \{roadie_battle_ds_started = true}
endscript

script roadie_battle_stop_game \{showresults = 0}
	if NOT inroadiebattlemode
		return
	endif
	if ($roadie_battle_in_game = 0)
		return
	endif
	Change \{roadie_battle_in_game = 0}
	Change \{roadie_battle_ds_started = FALSE}
	popfrontendoverridequota
	if (<showresults> = 1)
		roadie_battle_send_match_results
		Change \{roadie_win_vo_has_played = FALSE}
	else
		wiidscommunication :sendmessage \{set_holding_mode}
	endif
	Change \{is_ds_paused = FALSE}
	roadie_battle_killspawnedscripts
	roadie_battle_stop_all_mods
	roadie_battle_dda_stop
	roadie_battle_deinit_charge
	roadie = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	if (<signed_in> = true)
		roadie_battle_get_roadie_info roadie = <roadie> param = Player
		cleargemcreationcallback Player = <Player>
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
	roadie_battle_deactivate_timed_out_roadies
endscript

script roadie_battle_handle_missed_note \{Player = !i1768515945
		required_strum = !i1768515945}
	if roadie_battle_find_roadie_for_player Player = <Player> assert = FALSE
		wiidscommunication :sendmessage {
			roadie_missed_note
			pattern = <required_strum>
			destination_aid = ($roadie_infos [<roadie>].ds_aid)
		}
	endif
	getplayerinfo Player = <Player> roadie_battle_streak_keeper_notes
	if (<roadie_battle_streak_keeper_notes> > 0)
		roadie_battle_streak_keeper_note_missed Player = <Player>
	endif
	getplayerinfo Player = <Player> roadie_battle_star_power_generator_boost
	if (<roadie_battle_star_power_generator_boost> > 0)
		roadie_battle_star_power_generator_miss Player = <Player>
	endif
endscript

script roadie_battle_handle_hit_gem_color \{Player = !i1768515945}
	if roadie_battle_find_roadie_for_player Player = <Player> assert = FALSE
		roadie_battle_add_charge roadie = <roadie> charge = ($roadie_infos [<roadie>].charge_per_hit_gem)
	endif
	getplayerinfo Player = <Player> roadie_battle_star_power_generator_boost
	if (<roadie_battle_star_power_generator_boost> > 0)
		roadie_battle_star_power_generator_hit Player = <Player>
	endif
endscript

script roadie_battle_handle_hit_note \{Player = !i1768515945
		strum_pattern = !i1768515945}
	if roadie_battle_find_roadie_for_player Player = <Player> assert = FALSE
		wiidscommunication :sendmessage {
			roadie_hit_note
			pattern = <strum_pattern>
			destination_aid = ($roadie_infos [<roadie>].ds_aid)
		}
	endif
endscript

script roadie_battle_handle_whammy_on \{Player = !i1768515945
		pattern = !i1768515945}
	if roadie_battle_find_roadie_for_player Player = <Player> assert = FALSE
		wiidscommunication :sendmessage {
			roadie_start_sustain
			pattern = <pattern>
			destination_aid = ($roadie_infos [<roadie>].ds_aid)
		}
		roadie_battle_start_charging_sustain roadie = <roadie>
	endif
endscript

script roadie_battle_handle_whammy_off \{Player = !i1768515945
		pattern = !i1768515945}
	if roadie_battle_find_roadie_for_player Player = <Player> assert = FALSE
		wiidscommunication :sendmessage {
			roadie_end_sustain
			pattern = <pattern>
			destination_aid = ($roadie_infos [<roadie>].ds_aid)
		}
		roadie_battle_stop_charging_sustain roadie = <roadie>
	endif
endscript

script roadie_battle_handle_star_power_on \{Player = !i1768515945}
	if roadie_battle_find_roadie_for_player Player = <Player>
		wiidscommunication :sendmessage {
			roadie_star_power_status
			is_active = 1
			destination_aid = ($roadie_infos [<roadie>].ds_aid)
		}
	endif
endscript

script roadie_battle_handle_star_power_off \{Player = !i1768515945}
	if roadie_battle_find_roadie_for_player Player = <Player>
		wiidscommunication :sendmessage {
			roadie_star_power_status
			is_active = 0
			destination_aid = ($roadie_infos [<roadie>].ds_aid)
		}
	endif
endscript

script roadie_battle_handle_multiplier_change \{Player = !i1768515945
		new_multiplier = !i1768515945
		old_multiplier = !i1768515945}
	if (<new_multiplier> > <old_multiplier>)
		if roadie_battle_find_roadie_for_player Player = <Player>
			wiidscommunication :sendmessage {
				roadie_multiplier_increase
				multiplier = <new_multiplier>
				destination_aid = ($roadie_infos [<roadie>].ds_aid)
			}
		endif
	endif
endscript

script roadie_battle_pause_game 
	if inroadiebattlemode
		if (($roadie_battle_in_game = 1) && ($roadie_battle_ds_started = true))
			wiidscommunication :sendmessage \{pause_mode
				destination_aids = $roadie_battle_signed_in_ds_aids
				send_immediately = true}
		elseif ($roadie_battle_in_lobby = true)
			wiidscommunication :sendmessage \{set_holding_mode
				send_immediately = true}
		endif
	endif
endscript

script roadie_battle_resume_game 
	if inroadiebattlemode
		if (($roadie_battle_in_game = 1) && ($roadie_battle_ds_started = true))
			wiidscommunication :sendmessage \{resume_mode
				destination_aids = $roadie_battle_signed_in_ds_aids}
			roadie_battle_send_elapsed_song_time
		elseif ($roadie_battle_in_lobby = true)
			roadie_battle_lobby_all_goto_initial_ds_menu
		endif
	endif
endscript

script roadie_battle_killspawnedscripts 
	KillSpawnedScript \{Name = roadie_battle_wait_and_start_ds}
	KillSpawnedScript \{Name = roadie_battle_send_elapsed_song_time_loop}
	roadie_battle_kill_all_effect_scripts
	roadie_battle_hud_kill_spawned_scripts
endscript

script roadie_battle_gem_creation_callback \{Player = !i1768515945
		gem_id = !q1768515945
		gem_type = !q1768515945}
	getplayerinfo Player = <Player> roadie_battle_fade_notes_active
	if (<roadie_battle_fade_notes_active> = 1)
		roadie_battle_start_fading_gem {
			Player = <Player>
			gem_id = <gem_id>
			whammy_id = <whammy_id>
		}
	endif
	roadie_battle_maybe_spawn_mine_gem_effect gem_id = <gem_id> gem_type = <gem_type> Player = <Player>
	getplayerinfo Player = <Player> Hyperspeed
	getplayerinfo Player = <Player> roadie_battle_soundboard_attack_level
	if ((<Hyperspeed> < 1.0) || (<roadie_battle_soundboard_attack_level> != -1))
		roadie_battle_maybe_create_hyperspeed_gem_effects Player = <Player> gem_id = <gem_id> gem_type = <gem_type>
	endif
	roadie_battle_maybe_spawn_double_note_gem_effect Player = <Player> gem_id = <gem_id> whammy_id = <whammy_id>
endscript

script roadie_battle_set_default_player_info 
	<Player> = 1
	begin
	setplayerinfo Player = <Player> roadie_battle_roadie_index = -1
	roadie_battle_reset_game_player_info_individual Player = <Player>
	<Player> = (<Player> + 1)
	repeat 4
endscript

script roadie_battle_reset_game_player_info 
	getnumplayersingame
	getfirstplayer
	begin
	roadie_battle_reset_game_player_info_individual Player = <Player>
	wiidscommunication :sendmessage {
		player_rank_changed
		Player = <Player>
		rank = 1
	}
	getnextplayer Player = <Player>
	repeat <num_players>
endscript

script roadie_battle_reset_game_player_info_individual \{Player = !i1768515945}
	setplayerinfo Player = <Player> roadie_battle_streak_keeper_notes = 0
	setplayerinfo Player = <Player> roadie_battle_mine_interval_min = -1
	setplayerinfo Player = <Player> roadie_battle_mine_interval_max = -1
	setplayerinfo Player = <Player> roadie_battle_mine_cost = 0
	setplayerinfo Player = <Player> roadie_battle_mine_next_time = 0
	setplayerinfo Player = <Player> roadie_battle_multiplier_boost = 0
	setplayerinfo Player = <Player> roadie_battle_broken_string_mask = 0
	setplayerinfo Player = <Player> roadie_battle_color_swap_lanes = 0
	setplayerinfo Player = <Player> roadie_battle_color_swap_chance = 0.0
	setplayerinfo Player = <Player> roadie_battle_unassisted_score = 0
	setplayerinfo Player = <Player> roadie_battle_unassisted_run = 0
	setplayerinfo Player = <Player> roadie_battle_star_power_generator_current_streak = 0
	setplayerinfo Player = <Player> roadie_battle_star_power_generator_required_streak = 0
	setplayerinfo Player = <Player> roadie_battle_star_power_generator_boost = 0
	setplayerinfo Player = <Player> roadie_battle_fade_notes_active = 0
	setplayerinfo Player = <Player> roadie_battle_double_note_interval_min = -1
	setplayerinfo Player = <Player> roadie_battle_double_note_interval_max = -1
	setplayerinfo Player = <Player> roadie_battle_double_note_next_time = 0
	setplayerinfo Player = <Player> roadie_battle_soundboard_buff_level = -1
	setplayerinfo Player = <Player> roadie_battle_speakers_buff_level = -1
	setplayerinfo Player = <Player> roadie_battle_amps_buff_level = -1
	setplayerinfo Player = <Player> roadie_battle_fx_buff_level = -1
	setplayerinfo Player = <Player> roadie_battle_instrument_buff_level = -1
	setplayerinfo Player = <Player> roadie_battle_soundboard_attack_level = -1
	setplayerinfo Player = <Player> roadie_battle_speakers_attack_level = -1
	setplayerinfo Player = <Player> roadie_battle_amps_attack_level = -1
	setplayerinfo Player = <Player> roadie_battle_fx_attack_level = -1
	setplayerinfo Player = <Player> roadie_battle_instrument_attack_level = -1
	setplayerinfo Player = <Player> roadie_battle_scroll_blend_time = 2.0
	setplayerinfo Player = <Player> roadie_battle_max_streak_multiplier = 0
	setplayerinfo Player = <Player> roadie_battle_active_attack_count = 0
endscript

script roadie_battle_send_mode 
	convert_to_ds_enum \{order_array_name = roadie_battle_mode_order
		checksum_value = $roadie_battle_mode
		out_name = mode}
	wiidscommunication :sendmessage {
		set_roadie_mode
		mode = <mode>
	}
endscript

script roadie_battle_goto_ds_menu \{menu_name = !q1768515945
		aid = -1
		aids = [
		]}
	convert_to_ds_enum {
		order_array_name = roadie_battle_menu_order
		checksum_value = <menu_name>
		out_name = menu_index
	}
	<destination_param> = {}
	if (<aid> != -1)
		setstructureparam struct_name = destination_param param = destination_aid value = <aid>
	else
		GetArraySize <aids>
		if (<array_Size> > 0)
			setstructureparam struct_name = destination_param param = destination_aids value = <aids>
		endif
	endif
	wiidscommunication :sendmessage {
		roadie_goto_menu
		menu = <menu_index>
		<destination_param>
	}
endscript

script roadie_battle_send_song_info 
	playlist_getcurrentsong
	songfilemanager func = get_song_end_time song_name = <current_song>
	CastToInteger \{total_end_time}
	song_duration_secs = (<total_end_time> / 1000)
	GetGlobalTags <current_song> param = top_roadie_score
	get_song_title song = <current_song>
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	if (<signed_in> = true)
		roadie_battle_get_roadie_info roadie = <roadie> param = Player
		roadie_battle_get_roadie_info roadie = <roadie> param = ds_aid
		roadiebattle_countgemsforplayer song = <current_song> Player = <Player>
		wiidscommunication :sendmessage {
			roadie_song_info
			destination_aid = <ds_aid>
			title = <song_title>
			purple_gem_count = (<gem_counts>.Purple)
			purple_sustain_length = (<gem_counts>.purple_length)
			green_gem_count = (<gem_counts>.green)
			green_sustain_length = (<gem_counts>.green_length)
			red_gem_count = (<gem_counts>.red)
			red_sustain_length = (<gem_counts>.red_length)
			yellow_gem_count = (<gem_counts>.yellow)
			yellow_sustain_length = (<gem_counts>.yellow_length)
			blue_gem_count = (<gem_counts>.blue)
			blue_sustain_length = (<gem_counts>.blue_length)
			orange_gem_count = (<gem_counts>.orange)
			orange_sustain_length = (<gem_counts>.orange_length)
			total_gem_count = (<gem_counts>.total)
			total_sustain_length = (<gem_counts>.total_length)
			song_duration_secs = <song_duration_secs>
			top_roadie_score = <top_roadie_score>
		}
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
endscript

script roadie_battle_send_elapsed_song_time 
	GetSongTimeMs
	CastToInteger \{time}
	wiidscommunication :sendmessage set_time_elapsed time = <time>
endscript

script roadie_battle_send_elapsed_song_time_loop 
	begin
	roadie_battle_send_elapsed_song_time
	Wait \{4
		Seconds}
	repeat
endscript
