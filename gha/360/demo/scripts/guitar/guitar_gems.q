whammy_units_per_second = 6.3500004
default_gem_offset = 0
default_input_offset = 0
default_drums_offset = 0
default_practice_mode_geminput_offset = 0
default_practice_mode_pitchshift_offset_song = 0
default_practice_mode_pitchshift_offset_slow = 0
default_practice_mode_pitchshift_offset_slower = 0
default_practice_mode_pitchshift_offset_slowest = 0
default_prefretbar_time = 0
current_startup_script = nothing
current_exit_script = nothing
num_song_columns = 3
gem_colors = [
	green
	red
	yellow
	blue
	orange
]
gem_colors_text = [
	'green'
	'red'
	'yellow'
	'blue'
	'orange'
]
broken_strings = [
	broken_string_green
	broken_string_red
	broken_string_yellow
	broken_string_blue
	broken_string_orange
]
scripts_array = [
	{
		name = 'scripts'
		lead_ms = 0
	}
	{
		name = 'anim'
		lead_ms = 0
	}
	{
		name = 'triggers'
		lead_ms = 0
	}
	{
		name = 'cameras'
		lead_ms = 0
	}
	{
		name = 'lightshow'
		lead_ms = $lightshow_offset_ms
	}
	{
		name = 'crowd'
		lead_ms = 0
		audio_only
	}
	{
		name = 'drums'
		lead_ms = $default_drums_offset
		audio_only
	}
	{
		name = 'performance'
		lead_ms = 0
	}
]
fretbar_end_scale = 0.48000002
button_models = {
	green = {
		gem_material = sys_gem2d_green_sys_gem2d_green
		gem_hammer_material = sys_gem2d_green_hammer_sys_gem2d_green_hammer
		star_material = sys_star2d_green_sys_star2d_green
		star_hammer_material = sys_star2d_green_hammer_sys_star2d_green_hammer
		battle_star_material = sys_battlegem_green01_sys_battlegem_green01
		battle_star_hammer_material = sys_battlegem_hammer_green01_sys_battlegem_hammer_green01
		whammy_material = sys_whammy2d_green_sys_whammy2d_green
		star_power_material = sys_gem2d_starpower_sys_gem2d_starpower
		star_power_hammer_material = sys_gem2d_starpower_hammer_sys_gem2d_starpower_hammer
		star_power_whammy_material = sys_whammy2d_starpower_sys_whammy2d_starpower
		dead_whammy = sys_whammy2d_dead_sys_whammy2d_dead
		name = button_g
	}
	red = {
		gem_material = sys_gem2d_red_sys_gem2d_red
		gem_hammer_material = sys_gem2d_red_hammer_sys_gem2d_red_hammer
		star_material = sys_star2d_red_sys_star2d_red
		star_hammer_material = sys_star2d_red_hammer_sys_star2d_red_hammer
		battle_star_material = sys_battlegem_red01_sys_battlegem_red01
		battle_star_hammer_material = sys_battlegem_hammer_red01_sys_battlegem_hammer_red01
		whammy_material = sys_whammy2d_red_sys_whammy2d_red
		star_power_material = sys_gem2d_starpower_sys_gem2d_starpower
		star_power_hammer_material = sys_gem2d_starpower_hammer_sys_gem2d_starpower_hammer
		star_power_whammy_material = sys_whammy2d_starpower_sys_whammy2d_starpower
		dead_whammy = sys_whammy2d_dead_sys_whammy2d_dead
		name = button_r
	}
	yellow = {
		gem_material = sys_gem2d_yellow_sys_gem2d_yellow
		gem_hammer_material = sys_gem2d_yellow_hammer_sys_gem2d_yellow_hammer
		star_material = sys_star2d_yellow_sys_star2d_yellow
		star_hammer_material = sys_star2d_yellow_hammer_sys_star2d_yellow_hammer
		battle_star_material = sys_battlegem_yellow01_sys_battlegem_yellow01
		battle_star_hammer_material = sys_battlegem_hammer_yellow01_sys_battlegem_hammer_yellow01
		whammy_material = sys_whammy2d_yellow_sys_whammy2d_yellow
		star_power_material = sys_gem2d_starpower_sys_gem2d_starpower
		star_power_hammer_material = sys_gem2d_starpower_hammer_sys_gem2d_starpower_hammer
		star_power_whammy_material = sys_whammy2d_starpower_sys_whammy2d_starpower
		dead_whammy = sys_whammy2d_dead_sys_whammy2d_dead
		name = button_y
	}
	blue = {
		gem_material = sys_gem2d_blue_sys_gem2d_blue
		gem_hammer_material = sys_gem2d_blue_hammer_sys_gem2d_blue_hammer
		star_material = sys_star2d_blue_sys_star2d_blue
		star_hammer_material = sys_star2d_blue_hammer_sys_star2d_blue_hammer
		battle_star_material = sys_battlegem_blue01_sys_battlegem_blue01
		battle_star_hammer_material = sys_battlegem_hammer_blue01_sys_battlegem_hammer_blue01
		whammy_material = sys_whammy2d_blue_sys_whammy2d_blue
		star_power_material = sys_gem2d_starpower_sys_gem2d_starpower
		star_power_hammer_material = sys_gem2d_starpower_hammer_sys_gem2d_starpower_hammer
		star_power_whammy_material = sys_whammy2d_starpower_sys_whammy2d_starpower
		dead_whammy = sys_whammy2d_dead_sys_whammy2d_dead
		name = button_b
	}
	orange = {
		gem_material = sys_gem2d_orange_sys_gem2d_orange
		gem_hammer_material = sys_gem2d_orange_hammer_sys_gem2d_orange_hammer
		star_material = sys_star2d_orange_sys_star2d_orange
		star_hammer_material = sys_star2d_orange_hammer_sys_star2d_orange_hammer
		battle_star_material = sys_battlegem_orange01_sys_battlegem_orange01
		battle_star_hammer_material = sys_battlegem_hammer_orange01_sys_battlegem_hammer_orange01
		whammy_material = sys_whammy2d_orange_sys_whammy2d_orange
		star_power_material = sys_gem2d_starpower_sys_gem2d_starpower
		star_power_hammer_material = sys_gem2d_starpower_hammer_sys_gem2d_starpower_hammer
		star_power_whammy_material = sys_whammy2d_starpower_sys_whammy2d_starpower
		dead_whammy = sys_whammy2d_dead_sys_whammy2d_dead
		name = button_o
	}
}

script setup_models 
	tod_manager_create_perm_lights
	lightshow_createpermmodels
endscript

script setup_gemarrays 
	get_song_struct song = <song_name>
	if (($<player_status>.part) = rhythm)
		<part> = 'rhythm_'
	else
		<part> = ''
	endif
	if ($game_mode = p2_coop || $game_mode = p2_quickplay || $force_coop = 1 ||
			($game_mode = training && ($<player_status>.part = rhythm)))
		if structurecontains structure = <song_struct> use_coop_notetracks
			if (($<player_status>.part) = rhythm)
				<part> = 'rhythmcoop_'
			else
				<part> = 'guitarcoop_'
			endif
		endif
	endif
	get_song_prefix song = <song_name>
	get_difficulty_text_nl difficulty = <difficulty>
	formattext checksumname = gem_array '%s_%t_%p%d' s = <song_prefix> t = 'song' p = <part> d = <difficulty_text_nl> addtostringlookup
	formattext checksumname = fretbar_array '%s_fretbars' s = <song_prefix> addtostringlookup
	change structurename = <player_status> current_song_gem_array = <gem_array>
	change structurename = <player_status> current_song_fretbar_array = <fretbar_array>
	change structurename = <player_status> current_song_beat_time = ($<fretbar_array> [1])
	change structurename = <player_status> playline_song_beat_time = ($<fretbar_array> [1])
	reset_star_array song_name = <song_name> difficulty = <difficulty> player_status = <player_status>
	return gem_array = <gem_array> fretbar_array = <fretbar_array> song_prefix = <song_prefix> part = <part> difficulty_text_nl = <difficulty_text_nl>
endscript

script calc_health_invincible_time 
	get_song_end_time song = ($current_song)
	change structurename = <player_status> health_invincible_time = 0.0
	if ($game_mode = p1_quickplay ||
			$game_mode = p1_career)
		if NOT ($boss_battle = 1 || $battle_sudden_death = 1)
			if (($<player_status>.player = 1 && $current_difficulty = easy) ||
					($<player_status>.player = 2 && $current_difficulty2 = easy))
				change structurename = <player_status> health_invincible_time = (<total_end_time> * $health_invincible_time_percentage_easy / 100.0)
			endif
			if (($<player_status>.player = 1 && $current_difficulty = medium) ||
					($<player_status>.player = 2 && $current_difficulty2 = medium))
				change structurename = <player_status> health_invincible_time = (<total_end_time> * $health_invincible_time_percentage_medium / 100.0)
			endif
		endif
	elseif ($game_mode = p2_coop ||
			$game_mode = p2_quickplay)
		if ($current_difficulty = easy && $current_difficulty2 = easy)
			change structurename = <player_status> health_invincible_time = (<total_end_time> * $health_invincible_time_percentage_easy / 100.0)
		elseif (($current_difficulty = easy && $current_difficulty2 = medium) ||
				($current_difficulty = medium && $current_difficulty2 = easy) ||
				($current_difficulty = medium && $current_difficulty2 = medium))
			change structurename = <player_status> health_invincible_time = (<total_end_time> * $health_invincible_time_percentage_medium / 100.0)
		endif
	endif
endscript

script gem_scroller \{player = 1
		training_mode = 0}
	setup_gemarrays song_name = <song_name> difficulty = <difficulty> player_status = <player_status>
	calc_health_invincible_time song = <song_name> player_status = <player_status>
	if ($cheat_precisionmode = 1)
		if ($is_network_game)
			change \{check_time_early = $original_check_time_early}
			change \{check_time_late = $original_check_time_late}
		endif
	endif
	change structurename = <player_status> check_time_early = ($check_time_early * $current_speedfactor)
	change structurename = <player_status> check_time_late = ($check_time_late * $current_speedfactor)
	formattext checksumname = input_array 'input_array%p' p = <player_text>
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf "Creating array for %p" p = <player_text>
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	inputarraycreate name = <input_array>
	if (<player> = 1)
		if ($input_mode = record)
			cleardatabuffer \{name = replay}
			databufferputchecksum name = replay value = <song_name>
			databufferputchecksum name = replay value = ($current_transition)
			databufferputint \{name = replay
				value = $current_num_players}
			databufferputint name = replay value = ($player1_status.controller)
			databufferputint name = replay value = ($player2_status.controller)
			databufferputchecksum name = replay value = <difficulty> bytes = 16
			databufferputchecksum name = replay value = <difficulty2> bytes = 16
			getrandomseeds
			databufferputint name = replay value = <seed1>
			databufferputint name = replay value = <seed2>
			databufferputint name = replay value = <seed3>
			databufferputint name = replay value = <seed4>
			databufferputint name = replay value = <seed5>
			databufferputint name = replay value = <seed6>
		endif
	endif
	<gem_offset> = ($time_gem_offset)
	<input_offset> = ($time_input_offset)
	getglobaltags \{user_options}
	if (<lag_calibration> > 999)
		mod a = <lag_calibration> b = 1000
		<video_offset> = <mod>
		<audio_offset> = ((<lag_calibration> / 1000) - 1)
		<max_video> = (250 - <audio_offset>)
		if (<video_offset> > <max_video>)
			<video_offset> = <max_video>
		endif
		<input_offset> = (<input_offset> - <audio_offset>)
		<gem_offset> = (<gem_offset> - <audio_offset>)
		<gem_offset> = (<gem_offset> + <video_offset>)
	else
		<input_offset> = (<input_offset> - <lag_calibration>)
	endif
	if (<training_mode> = 0)
		spawnscriptlater strum_iterator params = {song_name = <song_name> difficulty = expert
			time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
			part = <part> target = (<player_status>.band_member)}
		spawnscriptlater fretfingers_iterator params = {song_name = <song_name> difficulty = expert
			time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
			part = <part> target = (<player_status>.band_member)}
		spawnscriptlater fretpos_iterator params = {song_name = <song_name>
			time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
			part = ($<player_status>.part) target = (<player_status>.band_member)}
		if ($game_mode = p2_faceoff)
			array_suffix = <player_text>
			if ($is_network_game)
				if NOT ishost
					if (<player_text> = 'p1')
						<array_suffix> = 'p2'
					else
						<array_suffix> = 'p1'
					endif
				endif
			endif
			spawnscriptlater faceoff_anim_iterator params = {song_name = <song_name> difficulty = expert
				time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
				player_status = <player_status> player_text = <array_suffix> player = <player>}
		endif
		if (<player> = 1)
			spawnscriptlater tempo_matching_iterator params = {song_name = <song_name> difficulty = <difficulty> thin_fretbars
				time_offset = <gem_offset> fretbar_function = create_fretbar skipleadin = 0
				player = <player> player_status = <player_status> player_text = <player_text>}
			spawnscriptlater drum_iterator params = {song_name = <song_name> difficulty = <difficulty>
				time_offset = (<gem_offset> + $drum_anim_lead_time) skipleadin = 0
				player = <player> player_status = <player_status> player_text = <player_text>}
			spawnscriptlater drum_cymbal_iterator params = {song_name = <song_name> difficulty = <difficulty>
				time_offset = (<gem_offset> + $cymbal_anim_lead_time) skipleadin = 0
				player = <player> player_status = <player_status> player_text = <player_text>}
			spawnscriptlater drum_countoff_iterator params = {song_name = <song_name> difficulty = <difficulty>
				time_offset = (<gem_offset> + $stick_tap_lead_time) skipleadin = 0
				player = <player> player_status = <player_status> player_text = <player_text>}
			if ($current_num_players = 1)
				bassist_song_part = 'rhythm_'
				bassist_part = bass
				rhythm_song_part = 'aux_'
				rhythm_part = rhythm
				get_song_struct song = <song_name>
				if structurecontains structure = <song_struct> name = rhythm_track
					if (<song_struct>.rhythm_track = 1)
						if structurecontains structure = <song_struct> name = use_coop_notetracks
							bassist_song_part = 'aux_'
							rhythm_song_part = 'rhythmcoop_'
						else
							bassist_song_part = 'aux_'
							rhythm_song_part = 'rhythm_'
						endif
					endif
				endif
				if compositeobjectexists \{name = bassist}
					spawnscriptlater strum_iterator params = {song_name = <song_name> difficulty = expert
						time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
						part = <bassist_song_part> target = bassist}
					spawnscriptlater fretfingers_iterator params = {song_name = <song_name> difficulty = expert
						time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
						part = <bassist_song_part> target = bassist}
					spawnscriptlater fretpos_iterator params = {song_name = <song_name> difficulty = <difficulty>
						time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
						part = <bassist_part> target = bassist}
				endif
				if compositeobjectexists \{name = rhythm}
					spawnscriptlater strum_iterator params = {song_name = <song_name> difficulty = expert
						time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
						part = <rhythm_song_part> target = rhythm}
					spawnscriptlater fretfingers_iterator params = {song_name = <song_name> difficulty = expert
						time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
						part = <rhythm_song_part> target = rhythm}
					spawnscriptlater fretpos_iterator params = {song_name = <song_name> difficulty = <difficulty>
						time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
						part = <rhythm_part> target = rhythm}
				endif
			endif
		endif
	endif
	formattext checksumname = input_array 'input_array%p' p = <player_text>
	spawnscriptlater gem_iterator params = {iterator_text = 'fill_array' song_name = <song_name> difficulty = <difficulty> part = <part> input_array = <input_array>
		time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset> + 1000.0) strum_function = fill_input_array skipleadin = ($<player_status>.scroll_time * 1000.0)
		player = <player> player_status = <player_status> player_text = <player_text>}
	if ($game_mode = p2_faceoff)
		spawnscriptlater faceoff_init params = {song_name = <song_name> difficulty = <difficulty> part = <part>
			time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset> + 1000.0) skipleadin = ($<player_status>.scroll_time * 1000.0)
			player = <player> player_status = <player_status> player_text = <player_text>}
		spawnscriptlater faceoff_volumes_init params = {song_name = <song_name> difficulty = <difficulty> part = <part>
			time_offset = ((($<player_status>.check_time_early) * 1000.0) + <input_offset>) skipleadin = ($<player_status>.scroll_time * 1000.0)
			player = <player> player_status = <player_status> player_text = <player_text>}
	endif
	<do_bot> = 0
	if ($boss_battle = 1)
		if (<player> = 2)
			formattext checksumname = bossresponse_array 'bossresponse_array%p' p = <player_text>
			inputarraycreate name = <bossresponse_array>
			spawnscriptlater gem_iterator params = {iterator_text = 'fill_bossarray' song_name = <song_name> difficulty = <difficulty> part = <part> input_array = <bossresponse_array>
				time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset> + 1000.0) strum_function = fill_input_array skipleadin = ($<player_status>.scroll_time * 1000.0)
				player = <player> player_status = <player_status> player_text = <player_text>}
			spawnscriptlater gem_iterator params = {iterator_text = 'boss' song_name = <song_name> difficulty = <difficulty> part = <part> use_input_array = 'bossresponse_array'
				time_offset = ((($<player_status>.check_time_early) * 1000.0) + <input_offset>) strum_function = check_buttons_boss skipleadin = ($<player_status>.scroll_time * 1000.0)
				player = <player> player_status = <player_status> player_text = <player_text>}
		elseif ($<player_status>.bot_play = 1)
			<do_bot> = 1
		endif
	elseif ($<player_status>.bot_play = 1)
		<do_bot> = 1
	endif
	if (<do_bot> = 1)
		spawnscriptlater gem_iterator params = {iterator_text = 'bot' song_name = <song_name> difficulty = <difficulty> part = <part> use_input_array = 'input_array' one_event_per_frame
			time_offset = ((($<player_status>.check_time_early) * 1000.0) + <input_offset>) strum_function = check_buttons_bot skipleadin = ($<player_status>.scroll_time * 1000.0)
			player = <player> player_status = <player_status> player_text = <player_text>}
		printf \{channel = log
			"Spawned bot!"}
	endif
	if ($new_net_logic)
		if (<player> = 2)
			formattext checksumname = bossresponse_array 'bossresponse_array%p' p = <player_text>
			inputarraycreate name = <bossresponse_array>
			spawnscriptlater gem_iterator params = {iterator_text = 'fill_bossarray' song_name = <song_name> difficulty = <difficulty> part = <part> input_array = <bossresponse_array>
				time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset> + 1000.0) strum_function = fill_input_array skipleadin = ($<player_status>.scroll_time * 1000.0)
				player = <player> player_status = <player_status> player_text = <player_text>}
			spawnscriptlater gem_iterator params = {iterator_text = 'boss' song_name = <song_name> difficulty = <difficulty> part = <part> use_input_array = 'bossresponse_array'
				time_offset = ((($<player_status>.check_time_early) * 1000.0) + <input_offset>) strum_function = check_buttons_boss skipleadin = ($<player_status>.scroll_time * 1000.0)
				player = <player> player_status = <player_status> player_text = <player_text>}
		endif
	endif
	spawnscriptlater fretbar_iterator params = {song_name = <song_name> difficulty = <difficulty> thin_fretbars
		time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset>) fretbar_function = create_fretbar skipleadin = ($<player_status>.scroll_time * 1000.0)
		player = <player> player_status = <player_status> player_text = <player_text>}
	spawnscriptlater gem_iterator params = {iterator_text = 'create_gem' song_name = <song_name> difficulty = <difficulty> part = <part> use_input_array = 'input_array'
		time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset>) gem_function = create_gem skipleadin = ($<player_status>.scroll_time * 1000.0)
		player = <player> player_status = <player_status> player_text = <player_text>}
	if ((<player_status>.is_local_client) || ($new_net_logic))
		spawnscriptlater check_buttons_fast params = {song_name = <song_name> difficulty = <difficulty>
			time_offset = ((($<player_status>.check_time_early) * 1000.0) + <input_offset>) player = <player>
			player_status = <player_status> player_text = <player_text>}
	else
		spawnscriptlater net_check_buttons params = {song_name = <song_name> player_status = <player_status>
			time_offset = ((($<player_status>.check_time_early) * 1000.0) + <input_offset>)}
	endif
	spawnscriptlater fretbar_update_tempo params = {song_name = <song_name> difficulty = <difficulty>
		time_offset = ((($<player_status>.check_time_early) * 1000.0) + <gem_offset>) player = <player> skipleadin = ($<player_status>.scroll_time * 1000.0)
		player_status = <player_status> player_text = <player_text>}
	spawnscriptlater fretbar_update_hammer_on_tolerance params = {song_name = <song_name> difficulty = <difficulty>
		time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset> + 1000.0) player = <player> skipleadin = ($<player_status>.scroll_time * 1000.0)
		player_status = <player_status> player_text = <player_text>}
	if (<player> = 1)
		if ($is_network_game)
			spawnscriptlater dispatch_player_state params = {player_status = <player_status>}
			spawnscriptlater \{network_events}
		endif
		spawnscriptlater fretbar_iterator params = {song_name = <song_name> difficulty = <difficulty>
			time_offset = (($default_prefretbar_time * 1000.0) + <gem_offset>) fretbar_function = guitarevent_prefretbar skipleadin = 0
			player = <player> player_status = <player_status> player_text = <player_text>}
		spawnscriptlater fretbar_iterator params = {song_name = <song_name> difficulty = <difficulty>
			time_offset = <gem_offset> fretbar_function = guitarevent_fretbar skipleadin = 0
			player = <player> player_status = <player_status> player_text = <player_text>}
		if ($debug_audible_downbeat = 1)
			spawnscriptlater fretbar_iterator params = {song_name = <song_name> difficulty = <difficulty>
				time_offset = (<gem_offset> + ($check_time_early * 1000.0)) fretbar_function = guitarevent_fretbar_early skipleadin = 0
				player = <player> player_status = <player_status> player_text = <player_text>}
			spawnscriptlater fretbar_iterator params = {song_name = <song_name> difficulty = <difficulty>
				time_offset = (<gem_offset> - ($check_time_late * 1000.0)) fretbar_function = guitarevent_fretbar_late skipleadin = 0
				player = <player> player_status = <player_status> player_text = <player_text>}
		endif
		spawnscriptlater lightshow_iterator params = {song_name = <song_name> time_offset = (<gem_offset> + $lightshow_offset_ms) skipleadin = 0}
		spawnscriptlater cameracuts_iterator params = {song_name = <song_name> time_offset = <gem_offset> skipleadin = 0}
		getarraysize \{$scripts_array}
		array_count = 0
		begin
		<lead_ms> = ($scripts_array [<array_count>].lead_ms)
		if structurecontains structure = ($scripts_array [<array_count>]) audio_only
			midiscript_offset = <lead_ms>
		else
			midiscript_offset = (<gem_offset> + <lead_ms>)
		endif
		spawnscriptlater event_iterator params = {song_name = <song_name> difficulty = <difficulty>
			event_string = ($scripts_array [<array_count>].name) time_offset = <midiscript_offset> skipleadin = 0
			player = <player> player_status = <player_status> player_text = <player_text>}
		spawnscriptlater notemap_startiterator params = {song_name = <song_name> difficulty = <difficulty>
			event_string = ($scripts_array [<array_count>].name) time_offset = <midiscript_offset> skipleadin = 0
			player = <player> player_status = <player_status> player_text = <player_text>}
		array_count = (<array_count> + 1)
		repeat <array_size>
	endif
	spawnscriptlater win_song params = {<...>}
endscript

script get_song_end_time_for_array 
	if NOT globalexists name = <song_array>
		total_end_time2 = 2.0
	else
		getarraysize $<song_array>
		if (<array_size> = 0)
			total_end_time2 = 2.0
		else
			last_entry = (<array_size> - $num_song_columns)
			end_time = ($<song_array> [(<last_entry>)])
			<whammy_time> = ($<song_array> [(<last_entry> + 1)])
			total_end_time2 = (<end_time> + <whammy_time>)
		endif
	endif
	if NOT gotparam \{total_end_time}
		total_end_time = <total_end_time2>
	else
		if (<total_end_time2> > <total_end_time>)
			total_end_time = <total_end_time2>
		endif
	endif
	return total_end_time = <total_end_time>
endscript

script get_song_end_time \{for_practice = 0}
	get_song_prefix song = <song>
	formattext checksumname = song_expert '%s_song_expert' s = <song_prefix> addtostringlookup
	formattext checksumname = rhythm_expert '%s_song_rhythm_expert' s = <song_prefix> addtostringlookup
	total_end_time = 2.0
	get_song_end_time_for_array total_end_time = <total_end_time> song_array = <song_expert>
	get_song_end_time_for_array total_end_time = <total_end_time> song_array = <rhythm_expert>
	get_song_struct song = <song>
	if structurecontains structure = <song_struct> use_coop_notetracks
		formattext checksumname = guitarcoop_expert '%s_song_guitarcoop_expert' s = <song_prefix> addtostringlookup
		formattext checksumname = rhythmcoop_expert '%s_song_rhythmcoop_expert' s = <song_prefix> addtostringlookup
		get_song_end_time_for_array total_end_time = <total_end_time> song_array = <guitarcoop_expert>
		get_song_end_time_for_array total_end_time = <total_end_time> song_array = <rhythmcoop_expert>
	endif
	if (<for_practice> = 0)
		get_song_prefix song = <song>
		formattext checksumname = song_section_array '%s_markers' s = <song_prefix>
		if globalexists name = <song_section_array>
			getarraysize ($<song_section_array>)
			if (<array_size> > 0)
				if ($<song_section_array> [(<array_size> - 1)].marker = "_ENDOFSONG")
					return total_end_time = ($<song_section_array> [(<array_size> - 1)].time)
				endif
			endif
		endif
	endif
	return total_end_time = <total_end_time>
endscript

script win_song 
	if (<player> = 1)
		change \{num_players_finished = 0}
	endif
	song = <gem_array>
	getarraysize $<song>
	if NOT (<array_size> = 0)
		get_song_end_time song = ($current_song)
		end_s = ((<total_end_time> - <starttime>) / 1000.0)
		printf "Waiting %s seconds for song end marker." s = <end_s>
		if (<end_s> > 0)
			wait <end_s> seconds
		endif
	endif
	if ($current_num_players = 2)
		wait_on_player = 2
	else
		wait_on_player = 1
	endif
	if (<wait_on_player> = <player>)
		killmovie \{textureslot = 1}
		preload_movie = 'Fret_Flames'
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			if ($player1_status.score > $player2_status.score)
				preload_movie = 'Player1_wins'
			elseif ($player2_status.score > $player1_status.score)
				preload_movie = 'Player2_wins'
			endif
		endif
		killallmovies
		preloadmovie {
			movie = <preload_movie>
			textureslot = 1
			texturepri = 70
			no_looping
			no_hold
		}
	endif
	printf \{"Waiting %s seconds for extra song win delay."
		s = $song_win_delay}
	wait \{$song_win_delay
		seconds}
	change num_players_finished = ($num_players_finished + 1)
	printf "win_song finished %i %f" i = ($num_players_finished) f = ($current_num_players)
	if ($num_players_finished >= $current_num_players)
		if ($is_network_game)
			spawnscriptnow \{online_end_song}
		else
			printf \{"Broadcasting song won event."}
			extendcrc song_won <player_text> out = type
			broadcastevent type = <type>
		endif
	endif
endscript

script load_songqpak \{async = 0}
	if NOT (<song_name> = $current_song_qpak)
		transitions_resetzone
		unload_songqpak
		get_song_prefix song = <song_name>
		is_song_downloaded song_checksum = <song_name>
		if (<download> = 1)
			formattext textname = songqpak '%i_song.pak' i = <song_prefix>
		else
			formattext textname = songqpak 'songs/%i_song.pak' i = <song_prefix>
		endif
		printf "Loading Song q pak : %i" i = <songqpak>
		if NOT loadpakasync pak_name = <songqpak> heap = heap_song no_vram async = <async>
			downloadcontentlost
			return
		endif
		change current_song_qpak = <song_name>
		if gotparam \{song_prefix}
			formattext checksumname = song_setup '%s_setup' s = <song_prefix>
			if scriptexists <song_setup>
				spawnscriptnow <song_setup>
			endif
		endif
	endif
endscript

script unload_songqpak 
	if NOT ($current_song_qpak = none)
		get_song_prefix song = ($current_song_qpak)
		is_song_downloaded song_checksum = ($current_song_qpak)
		if (<download> = 1)
			formattext textname = songqpak '%i_song.pak' i = <song_prefix>
		else
			formattext textname = songqpak 'songs/%i_song.pak' i = <song_prefix>
		endif
		printf "UnLoading Song q pak : %i" i = <songqpak>
		unloadpak <songqpak>
		change \{current_song_qpak = none}
	endif
endscript
playing_song = 0

script start_gem_scroller \{starttime = 0
		practice_intro = 0
		training_mode = 0
		endtime = 99999999
		devil_finish_restart = 0
		end_credits_restart = 0}
	if (<devil_finish_restart> = 1)
		printf \{"FINISH DEVIL RESTART"}
	else
		change \{devil_finish = 0}
		if ($current_song = bossdevil)
			<starttime> = 0
		endif
	endif
	if (<end_credits_restart> = 1)
		printf \{"END CREDITS RESTART"}
	else
		if NOT ($current_song = kingsandqueenscredits)
			change \{end_credits = 0}
		endif
	endif
	change \{playing_song = 1}
	mark_unsafe_for_shutdown
	dragonforce_hack_off
	menu_music_off
	guitarevent_entervenue
	init_play_log
	load_songqpak song_name = <song_name> async = 1
	if isxenon
		change \{default_gem_offset = $xenon_gem_offset}
		change \{default_input_offset = $xenon_input_offset}
		change \{default_drums_offset = $xenon_drums_offset}
		change \{default_practice_mode_geminput_offset = $xenon_practice_mode_geminput_offset}
		change \{default_practice_mode_pitchshift_offset_song = $xenon_practice_mode_pitchshift_offset_song}
		change \{default_practice_mode_pitchshift_offset_slow = $xenon_practice_mode_pitchshift_offset_slow}
		change \{default_practice_mode_pitchshift_offset_slower = $xenon_practice_mode_pitchshift_offset_slower}
		change \{default_practice_mode_pitchshift_offset_slowest = $xenon_practice_mode_pitchshift_offset_slowest}
		change \{default_prefretbar_time = $xenon_prefretbar_time}
	else
		if isps3
			change \{default_gem_offset = $ps3_gem_offset}
			change \{default_input_offset = $ps3_input_offset}
			change \{default_drums_offset = $ps3_drums_offset}
			change \{default_practice_mode_geminput_offset = $ps3_practice_mode_geminput_offset}
			change \{default_practice_mode_pitchshift_offset_song = $ps3_practice_mode_pitchshift_offset_song}
			change \{default_practice_mode_pitchshift_offset_slow = $ps3_practice_mode_pitchshift_offset_slow}
			change \{default_practice_mode_pitchshift_offset_slower = $ps3_practice_mode_pitchshift_offset_slower}
			change \{default_practice_mode_pitchshift_offset_slowest = $ps3_practice_mode_pitchshift_offset_slowest}
			change \{default_prefretbar_time = $ps3_prefretbar_time}
		else
			change \{default_gem_offset = $ps2_gem_offset}
			change \{default_input_offset = $ps2_input_offset}
			change \{default_drums_offset = $ps2_drums_offset}
			change \{default_practice_mode_geminput_offset = $ps2_practice_mode_geminput_offset}
			change \{default_practice_mode_pitchshift_offset_song = $ps2_practice_mode_pitchshift_offset_song}
			change \{default_practice_mode_pitchshift_offset_slow = $ps2_practice_mode_pitchshift_offset_slow}
			change \{default_practice_mode_pitchshift_offset_slower = $ps2_practice_mode_pitchshift_offset_slower}
			change \{default_practice_mode_pitchshift_offset_slowest = $ps2_practice_mode_pitchshift_offset_slowest}
			change \{default_prefretbar_time = $ps2_prefretbar_time}
		endif
	endif
	begin_singleplayer_game
	get_song_struct song = <song_name>
	if structurecontains structure = <song_struct> boss
		<difficulty2> = <difficulty>
	endif
	change current_song = <song_name>
	change current_difficulty = <difficulty>
	change current_difficulty2 = <difficulty2>
	change current_starttime = <starttime>
	change current_endtime = <endtime>
	change \{boss_play = 0}
	change \{showing_raise_axe = 0}
	change \{allow_4x_effect = true}
	<perry_mic_stand> = 0
	if structurecontains structure = <song_struct> perry_mic_stand
		if ($current_num_players = 1)
			<perry_mic_stand> = (<song_struct>.perry_mic_stand)
		endif
	endif
	progression_setprogressionnodeflags perry_mic_stand = <perry_mic_stand>
	get_song_struct song = <song_name>
	if structurecontains structure = <song_struct> boss
		change current_boss = (<song_struct>.boss)
		change \{boss_battle = 1}
		change \{current_num_players = 2}
		change boss_oldcontroller = ($player2_status.controller)
		getinputhandlerbotindex \{player = 2}
		change structurename = player2_status controller = <controller>
		if structurecontains \{structure = $current_boss
				name = character_profile}
			profile = ($current_boss.character_profile)
			change structurename = player2_status character_id = <profile>
			change \{structurename = player2_status
				outfit = 1}
			change \{structurename = player2_status
				style = 1}
		endif
		printf \{channel = log
			"Starting bot for boss"}
	else
		if (($player2_status.bot_play = 1) || ($new_net_logic))
			change boss_oldcontroller = ($player2_status.controller)
			getinputhandlerbotindex \{player = 2}
			change structurename = player2_status controller = <controller>
			printf \{channel = log
				"Starting bot for player 2"}
		endif
	endif
	if ($player1_status.bot_play = 1)
		getinputhandlerbotindex \{player = 1}
		change structurename = player1_status controller = <controller>
		printf \{channel = log
			"Starting bot for player 1"}
	endif
	if ($game_mode = p2_battle)
		printf \{"Initiating Battlemode"}
		battlemode_init
	endif
	if ($boss_battle = 1)
		printf \{"Initiating BossBattle"}
		bossbattle_init
	endif
	if ($new_net_logic)
		new_net_logic_init
	endif
	printf \{"-------------------------------------"}
	printf \{"-------------------------------------"}
	printf \{"-------------------------------------"}
	printf \{"Now playing %s %d"
		s = $current_song
		d = $current_difficulty}
	printf \{"-------------------------------------"}
	printf \{"-------------------------------------"}
	printf \{"-------------------------------------"}
	song_start_time = <starttime>
	call_startup_scripts <...>
	setup_bg_viewport
	create_cameracuts <...>
	starttimeafterintro = <starttime>
	printf "Current Transition = %s" s = ($current_transition)
	if ($current_transition = none)
		change \{current_transition = fastintro}
	endif
	transition_gettime type = ($current_transition)
	starttime = (<starttime> - <transition_time>)
	setslomo \{0.001}
	reset_song_time starttime = <starttime>
	if NOT ($use_character_debug_cam = 1)
	endif
	create_movie_viewport
	create_crowd_models
	crowd_create_lighters
	crowd_stagediver_hide
	if ($debug_showmeasures = on)
		debug_measures_text :setprops \{unhide}
	endif
	change \{structurename = guitarist_info
		stance = stance_a}
	change \{structurename = guitarist_info
		next_stance = stance_a}
	change \{structurename = guitarist_info
		current_anim = idle}
	change \{structurename = guitarist_info
		cycle_anim = true}
	change \{structurename = guitarist_info
		next_anim = none}
	change \{structurename = guitarist_info
		playing_missed_note = false}
	change \{structurename = guitarist_info
		waiting_for_cameracut = false}
	change \{structurename = bassist_info
		stance = stance_a}
	change \{structurename = bassist_info
		next_stance = stance_a}
	change \{structurename = bassist_info
		current_anim = idle}
	change \{structurename = bassist_info
		cycle_anim = true}
	change \{structurename = bassist_info
		next_anim = none}
	change \{structurename = bassist_info
		playing_missed_note = false}
	change \{structurename = bassist_info
		waiting_for_cameracut = false}
	change \{structurename = vocalist_info
		stance = stance_a}
	change \{structurename = vocalist_info
		next_stance = stance_a}
	change \{structurename = vocalist_info
		current_anim = idle}
	change \{structurename = vocalist_info
		cycle_anim = true}
	change \{structurename = vocalist_info
		next_anim = none}
	change \{structurename = drummer_info
		stance = stance_a}
	change \{structurename = drummer_info
		next_stance = stance_a}
	change \{structurename = drummer_info
		current_anim = idle}
	change \{structurename = drummer_info
		cycle_anim = true}
	change \{structurename = drummer_info
		next_anim = none}
	change \{structurename = drummer_info
		twist = 0.0}
	change \{structurename = drummer_info
		desired_twist = 0.0}
	change \{structurename = drummer_info
		last_left_arm_note = 0}
	change \{structurename = drummer_info
		last_right_arm_note = 0}
	if (<training_mode> = 0)
		if NOT create_band \{starting_song = true
				async = 1}
			downloadcontentlost
		endif
	endif
	create_vocalist_dummy
	if ($game_mode = training)
		practicemode_init
	endif
	preload_song song_name = <song_name> starttime = <song_start_time>
	calc_score = true
	if NOT (<devil_finish_restart> = 1 || $end_credits = 1)
		if ($use_last_player_scores = 0)
			reset_score \{player_status = player1_status}
		else
			change \{use_last_player_scores = 0}
			<calc_score> = false
		endif
	endif
	reset_score \{player_status = player2_status}
	getglobaltags \{user_options}
	setarrayelement \{arrayname = currently_holding
		globalarray
		index = 0
		newvalue = 0}
	setarrayelement \{arrayname = currently_holding
		globalarray
		index = 1
		newvalue = 0}
	player = 1
	begin
	if (<player> = 2)
		if gotparam \{difficulty2}
			<difficulty> = <difficulty2>
		endif
	endif
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	formattext textname = player_text 'p%i' i = <player> addtostringlookup
	change structurename = <player_status> guitar_volume = 0
	updateguitarvolume
	getglobaltags \{user_options}
	if (<player> = 1)
		change structurename = <player_status> lefthanded_gems = (<lefty_flip_p1>)
		change structurename = <player_status> lefthanded_button_ups = (<lefty_flip_p1>)
	else
		if ($is_network_game = 0)
			change structurename = <player_status> lefthanded_gems = (<lefty_flip_p2>)
			change structurename = <player_status> lefthanded_button_ups = (<lefty_flip_p2>)
		endif
	endif
	get_resting_whammy_position controller = ($<player_status>.controller)
	if gotparam \{resting_whammy_position}
		change structurename = <player_status> resting_whammy_position = <resting_whammy_position>
	endif
	get_star_power_position controller = ($<player_status>.controller)
	if gotparam \{star_power_position}
		change structurename = <player_status> star_tilt_threshold = <star_power_position>
	endif
	if ($tutorial_disable_hud = 0)
		setup_hud <...>
	endif
	if ($output_gpu_log = 1)
		textoutputstart
	endif
	if NOT gotparam \{no_score_update}
		spawnscriptlater update_score_fast params = {<...>}
	endif
	if (($is_network_game) && ($player1_status.highway_layout = solo_highway))
		spawnscriptlater \{update_score_fast
			params = {
				player_status = player2_status
			}}
	endif
	if (<training_mode> = 0)
		if NOT (<devil_finish_restart> = 1)
			crowd_reset <...>
		endif
	endif
	star_power_reset <...>
	difficulty_setup <...>
	setup_highway <...>
	if (<training_mode> = 0)
		reset_hud <...>
	endif
	spawnscriptnow gem_scroller params = {<...>}
	if ((<player> = 1) || ($new_net_logic) || ($is_network_game = 0))
		spawnscriptnow button_checker params = {<...>}
	endif
	if NOT (($is_network_game) && (<player> = 2))
		spawnscriptlater check_for_star_power params = {<...>}
	endif
	if (<calc_score> = true)
		calc_songscoreinfo player_status = <player_status>
	endif
	player = (<player> + 1)
	repeat $current_num_players
	getpakmancurrent \{map = zones}
	if ($boss_battle = 1)
		if should_play_boss_intro
			if ($current_transition = boss)
				gh_sfx_preload_boss_intro_audio
			endif
		endif
	endif
	gh3_set_guitar_verb_and_echo_to_dry
	transition_play type = ($current_transition)
	change \{current_transition = none}
	change \{check_for_unplugged_controllers = 1}
	wait \{1
		gameframe}
	if ($is_network_game)
		syncandlaunchnetgame
		begin
		if (($net_ready_to_start) || ($player2_present = 0))
			ui_flow_manager_respond_to_action \{action = net_begin_song}
			ui_print_gamertags \{pos1 = (240.0, 70.0)
				pos2 = (1040.0, 70.0)
				dims = (310.0, 25.0)
				just1 = [
					left
					top
				]
				just2 = [
					right
					top
				]
				offscreen = 1}
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	reset_transition_fxandlighting
	stoprendering
	destroy_loading_screen
	setslomo \{$current_speedfactor}
	if (($player2_present = 0) && ($is_network_game = 1))
		if NOT ((screenelementexists id = net_popup_container) || (scriptisrunning create_connection_lost_dialog))
			spawnscriptnow \{create_connection_lost_dialog}
		endif
	endif
	spawnscriptnow begin_song_after_intro params = {starttimeafterintro = <starttimeafterintro>}
	if ($boss_battle = 1)
		if ($show_boss_helper_screen = 1)
			disable_bg_viewport
			if screenelementexists \{id = battlemode_container}
				battlemode_container :setprops \{alpha = 0}
			endif
			getpakmancurrent \{map = zones}
			if should_play_boss_intro
				spawnscriptnow \{wait_and_show_boss_helper_after_intro}
			else
				spawnscriptlater \{show_boss_helper_now}
			endif
		else
			enable_bg_viewport
		endif
	endif
	mark_safe_for_shutdown
endscript
show_boss_helper_screen = 0

script wait_and_show_boss_helper_after_intro 
	disable_pause
	transition_wait
	kill_gem_scroller
	ui_flow_manager_respond_to_action \{action = battle_mode_helper}
	disable_pause
	change \{show_boss_helper_screen = 0}
endscript

script show_boss_helper_now 
	kill_gem_scroller
	ui_flow_manager_respond_to_action \{action = battle_mode_helper}
	change \{show_boss_helper_screen = 0}
endscript

script begin_song_after_intro 
	begin
	getsongtimems
	if (<time> >= <starttimeafterintro>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	begin_song
endscript

script kill_gem_scroller \{no_render = 0
		reset_character_info = 1}
	mark_unsafe_for_shutdown
	printf \{"kill_gem_scroller - Start"}
	if NOT gotparam \{restarting}
		stoprendering
	endif
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
	songunloadfsbifdownloaded
	disable_highway_prepass
	kill_starpower_camera \{changecamera = 0}
	kill_walk_camera \{changecamera = 0}
	change \{structurename = player1_status
		star_power_amount = 0}
	change \{structurename = player2_status
		star_power_amount = 0}
	kill_starpower_stagefx player_text = ($player1_status.text) player_status = $player1_status ifempty = 0
	kill_starpower_stagefx player_text = ($player2_status.text) player_status = $player2_status ifempty = 0
	change \{allow_4x_effect = true}
	if screenelementexists \{id = starpower_container_leftp1}
		doscreenelementmorph \{id = starpower_container_leftp1
			alpha = 0}
	endif
	if screenelementexists \{id = starpower_container_leftp2}
		doscreenelementmorph \{id = starpower_container_leftp2
			alpha = 0}
	endif
	if screenelementexists \{id = starpower_container_rightp1}
		doscreenelementmorph \{id = starpower_container_rightp1
			alpha = 0}
	endif
	if screenelementexists \{id = starpower_container_rightp2}
		doscreenelementmorph \{id = starpower_container_rightp2
			alpha = 0}
	endif
	change \{showing_raise_axe = 0}
	kill_debug_elements
	guitarevent_exitvenue
	destroy_cameracuts
	practicemode_deinit
	notemap_deinit
	destroy2dparticlesystem \{id = all}
	launchgemevent \{event = kill_objects}
	destroy_credits_menu
	destroy_battle_alert_frames
	killspawnedscript \{name = move_2d_elements_to_default}
	killspawnedscript \{name = wait_and_play_you_rock_movie}
	killspawnedscript \{name = update_score_fast}
	killspawnedscript \{name = check_for_star_power}
	killspawnedscript \{name = wait_for_inactive}
	killspawnedscript \{name = pulsate_all_star_power_bulbs}
	killspawnedscript \{name = pulsate_star_power_bulb}
	killspawnedscript \{name = rock_meter_star_power_on}
	killspawnedscript \{name = rock_meter_star_power_off}
	killspawnedscript \{name = star_power_activate_and_drain}
	killspawnedscript \{name = hud_activated_star_power}
	killspawnedscript \{name = hud_move_note_scorebar}
	killspawnedscript \{name = hud_flash_red_bg_p1}
	killspawnedscript \{name = hud_flash_red_bg_p2}
	killspawnedscript \{name = hud_flash_red_bg_kill}
	killspawnedscript \{name = hud_lightning_alert}
	killspawnedscript \{name = hud_show_note_streak_combo}
	killspawnedscript \{name = highway_pulse_multiplier_loss}
	kill_pulsate_star_power_bulbs \{player = 1}
	kill_pulsate_star_power_bulbs \{player = 2}
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	formattext textname = player_text 'p%i' i = <player> addtostringlookup
	change structurename = <player_status> star_power_used = 0
	guitarevent_killsong <...>
	destroy_hud <...>
	destroy_highway <...>
	battlemode_deinit <...>
	bossbattle_deinit <...>
	faceoff_deinit <...>
	faceoff_volumes_deinit <...>
	player = (<player> + 1)
	repeat $max_num_players
	kill_startup_script <...>
	killspawnedscript \{name = guitarevent_missednote}
	killspawnedscript \{name = guitarevent_unnecessarynote}
	killspawnedscript \{name = guitarevent_hitnotes}
	killspawnedscript \{name = guitarevent_hitnote}
	killspawnedscript \{name = guitarevent_starpoweron}
	killspawnedscript \{name = guitarevent_starpoweroff}
	killspawnedscript \{name = guitarevent_starhitnote}
	killspawnedscript \{name = guitarevent_starsequencebonus}
	killspawnedscript \{name = guitarevent_starmissnote}
	killspawnedscript \{name = guitarevent_whammyon}
	killspawnedscript \{name = guitarevent_whammyoff}
	killspawnedscript \{name = guitarevent_starwhammyon}
	killspawnedscript \{name = guitarevent_starwhammyoff}
	killspawnedscript \{name = guitarevent_note_window_open}
	killspawnedscript \{name = guitarevent_note_window_close}
	killspawnedscript \{name = guitarevent_crowd_poor_medium}
	killspawnedscript \{name = guitarevent_crowd_medium_good}
	killspawnedscript \{name = guitarevent_crowd_medium_poor}
	killspawnedscript \{name = guitarevent_crowd_good_medium}
	killspawnedscript \{name = guitarevent_createfirstgem}
	killspawnedscript \{name = highway_pulse_black}
	killspawnedscript \{name = guitarevent_hitnote_spawned}
	killspawnedscript \{name = hit_note_fx}
	killspawnedscript \{name = do_starpower_stagefx}
	killspawnedscript \{name = do_starpower_camera}
	killspawnedscript \{name = first_gem_fx}
	killspawnedscript \{name = gem_iterator}
	killspawnedscript \{name = gem_array_stepper}
	killspawnedscript \{name = gem_array_events}
	killspawnedscript \{name = gem_step}
	killspawnedscript \{name = gem_step_end}
	killspawnedscript \{name = fretbar_iterator}
	killspawnedscript \{name = strum_iterator}
	killspawnedscript \{name = fretpos_iterator}
	killspawnedscript \{name = fretfingers_iterator}
	killspawnedscript \{name = drum_iterator}
	killspawnedscript \{name = drum_cymbal_iterator}
	killspawnedscript \{name = drum_countoff_iterator}
	killspawnedscript \{name = watchforstartplaying_iterator}
	killspawnedscript \{name = tempo_matching_iterator}
	killspawnedscript \{name = faceoff_anim_iterator}
	killspawnedscript \{name = gem_scroller}
	killspawnedscript \{name = button_checker}
	killspawnedscript \{name = check_buttons}
	killspawnedscript \{name = check_buttons_fast}
	killspawnedscript \{name = net_check_buttons}
	killspawnedscript \{name = fretbar_update_tempo}
	killspawnedscript \{name = fretbar_update_hammer_on_tolerance}
	killspawnedscript \{name = move_whammy}
	killspawnedscript \{name = create_fretbar}
	killspawnedscript \{name = move_highway_2d}
	killspawnedscript \{name = move_highway_prepass}
	killspawnedscript \{name = guitarevent_prefretbar}
	killspawnedscript \{name = guitarevent_fretbar}
	killspawnedscript \{name = check_note_hold}
	killspawnedscript \{name = net_check_note_hold}
	killspawnedscript \{name = star_power_whammy}
	killspawnedscript \{name = net_stream_star_whammy}
	killspawnedscript \{name = show_star_power_ready}
	killspawnedscript \{name = hud_glowburst_alert}
	change \{star_power_ready_on_p1 = 0}
	change \{star_power_ready_on_p2 = 0}
	killspawnedscript \{name = event_iterator}
	killspawnedscript \{name = win_song}
	killspawnedscript \{name = hand_note_iterator}
	killspawnedscript \{name = kill_object_later}
	killspawnedscript \{name = waitandkillhighway}
	killspawnedscript \{name = testlevel_debug}
	killspawnedscript \{name = show_coop_raise_axe_for_starpower}
	killspawnedscript \{name = net_whammy_pitch_shift}
	killspawnedscript \{name = crowd_allplayanim}
	killspawnedscript \{name = hud_activated_star_power_spawned}
	killspawnedscript \{name = dispatch_player_state}
	killspawnedscript \{name = network_events}
	killspawnedscript \{name = online_win_song}
	new_net_logic_deinit
	destroy_net_popup
	destroy_gamertags
	lightshow_shutdown
	kill_lightshow_fx
	destroyparticlesbygroupid \{groupid = zoneparticles}
	transition_killall
	killspawnedscript \{name = guitarevent_songfailed_spawned}
	killspawnedscript \{name = play_intro}
	killspawnedscript \{name = begin_song_after_intro}
	hud_flash_red_bg_kill \{player = 1}
	hud_flash_red_bg_kill \{player = 2}
	printf \{"kill_gem_scroller - Killing Event Scripts"}
	killspawnedscript \{id = song_event_scripts}
	printf \{"kill_gem_scroller - Killing Event Scripts Finished"}
	killspawnedscript \{id = zone_scripts}
	getpakmancurrentname \{map = zones}
	formattext checksumname = zone_killsong '%s_KillSong' s = <pakname>
	if scriptexists <zone_killsong>
		<zone_killsong>
	endif
	destroy_allwhammyfx
	ls_resetvenuelights
	destroy_movie_viewport
	destroy_crowd_models
	destroy_bg_viewport
	destroy_intro
	destroy_band
	destroy_vocalist_dummy
	if (<reset_character_info> = 1)
		printf \{channel = reset
			"resetting character info......."}
		restore_player_selected_character_info \{player_status = player1_status}
		restore_player_selected_character_info \{player_status = player2_status}
	else
		printf \{channel = reset
			"NOT resetting character info......."}
	endif
	if ($debug_showmeasures = on)
		debug_measures_text :setprops \{hide}
	endif
	change \{structurename = guitarist_info
		stance = stance_frontend}
	change \{structurename = guitarist_info
		next_stance = stance_frontend}
	change \{structurename = guitarist_info
		current_anim = idle}
	change \{structurename = guitarist_info
		cycle_anim = true}
	change \{structurename = guitarist_info
		next_anim = none}
	change \{structurename = guitarist_info
		playing_missed_note = false}
	change \{structurename = bassist_info
		stance = stance_frontend}
	change \{structurename = bassist_info
		next_stance = stance_frontend}
	change \{structurename = bassist_info
		current_anim = idle}
	change \{structurename = bassist_info
		cycle_anim = true}
	change \{structurename = bassist_info
		next_anim = none}
	change \{structurename = bassist_info
		playing_missed_note = false}
	destroy_debug_measure_text
	kill_character_scripts
	change \{check_for_unplugged_controllers = 0}
	shut_down_practice_mode
	destroy_menu \{menu_id = you_rock_container}
	killmovie \{textureslot = 1}
	printf \{"kill_gem_scroller - waiting for dead objects"}
	wait \{2
		gameframes}
	printf \{"kill_gem_scroller - waiting for dead objects End"}
	end_song
	if NOT (<no_render> = 1)
		if ($shutdown_game_for_signin_change_flag = 0)
			startrendering
		endif
	endif
	printf \{"kill_gem_scroller - End"}
	mark_safe_for_shutdown
	change \{playing_song = 0}
endscript

script kill_gem_scroller_hack 
	kill_gem_scroller \{reset_character_info = 0}
endscript

script restart_gem_scroller \{no_render = 0}
	mark_unsafe_for_shutdown
	disable_pause
	if gotparam \{replay}
		change \{input_mode = play}
		readdatabuffer name = replay filename = <replay>
		databuffergetchecksum \{name = replay}
		<song_name> = <checksum>
		databuffergetchecksum \{name = replay}
		change current_transition = <checksum>
		databuffergetint \{name = replay}
		if (<int> > 0)
			change current_num_players = <int>
			databuffergetint \{name = replay}
			change structurename = player1_status controller = <int>
			databuffergetint \{name = replay}
			change structurename = player2_status controller = <int>
		else
			change \{current_num_players = 1}
			databuffergetint \{name = replay}
			databuffergetint \{name = replay}
			change \{structurename = player1_status
				controller = -1}
			change \{structurename = player2_status
				controller = -1}
		endif
		databuffergetchecksum \{name = replay
			bytes = 16}
		<difficulty> = <checksum>
		databuffergetchecksum \{name = replay
			bytes = 16}
		<difficulty2> = <checksum>
		databuffergetint \{name = replay}
		<seed1> = <int>
		databuffergetint \{name = replay}
		<seed2> = <int>
		databuffergetint \{name = replay}
		<seed3> = <int>
		databuffergetint \{name = replay}
		<seed4> = <int>
		databuffergetint \{name = replay}
		<seed5> = <int>
		databuffergetint \{name = replay}
		<seed6> = <int>
		setrandomseeds seed1 = <seed1> seed2 = <seed2> seed3 = <seed3> seed4 = <seed4> seed5 = <seed5> seed6 = <seed6>
		change \{replay_suspend = 1}
	else
		change \{input_mode = record}
	endif
	pausegame
	launchevent \{type = unfocus
		target = root_window}
	printf "Starting new song %s on %l" s = <song_name> l = <difficulty>
	kill_gem_scroller no_render = <no_render> restarting
	start_gem_scroller <...>
	change \{check_for_unplugged_controllers = 1}
	unbindguitarcontrollerstatus
	launchevent \{type = focus
		target = root_window}
	gh3_start_pressed
	if ($current_level = load_z_nipmuc)
		change \{jailbait_achievement = 1}
	elseif ($current_level = load_z_maxskc)
		change \{subway_achievement = 1}
	endif
endscript

script reset_song_time \{starttime = 0}
	change current_deltatime = (1.0 / 60.0)
	change current_time = (<starttime> / 1000.0)
	if ($input_mode = play)
		change \{replay_suspend = 0}
	endif
	resetsongtimer starttime = (<starttime> / 1000.0)
endscript

script fill_input_array 
	fillinputarray <...>
endscript

script create_gem 
	create2dgem <...>
endscript

script gem_iterator \{song_name = test
		difficulty = easy
		array_type = "song"
		player = 1}
	get_difficulty_text_nl difficulty = <difficulty>
	spawnscriptnow gem_array_events params = {<...> difficulty_text_nl = <difficulty_text_nl>}
	if gotparam \{use_input_array}
		spawnscriptnow gem_array_stepper params = {<...>}
	else
		spawnscriptnow gem_array_stepper params = {<...> difficulty = easy difficulty_text_nl = 'easy'}
		spawnscriptnow gem_array_stepper params = {<...> difficulty = medium difficulty_text_nl = 'medium'}
		spawnscriptnow gem_array_stepper params = {<...> difficulty = hard difficulty_text_nl = 'hard'}
		spawnscriptnow gem_array_stepper params = {<...> difficulty = expert difficulty_text_nl = 'expert'}
	endif
endscript

script gem_array_events 
	printf "Changing event receivers... %i %d" i = <iterator_text> d = <difficulty_text_nl>
	cleareventhandlergroup \{iterator_group}
	extendcrc gem_step_event <player_text> out = id
	extendcrc <id> <iterator_text> out = id
	extendcrc <id> <difficulty_text_nl> out = id
	seteventhandler response = call_script event = <id> scr = gem_step params = {<...>} group = iterator_group
	extendcrc gem_step_end <player_text> out = id
	extendcrc <id> <iterator_text> out = id
	extendcrc <id> <difficulty_text_nl> out = id
	seteventhandler response = call_script event = <id> scr = gem_step_end params = {<...>} group = iterator_group
	if NOT gotparam \{use_input_array}
		extendcrc change_difficulty <player_text> out = id
		seteventhandler response = switch_script event = <id> scr = gem_array_events params = {<...>} group = iterator_group
	endif
	block
endscript

script gem_step 
	gemstep
endscript

script gem_step_end 
endscript

script gem_array_stepper 
	gem_array_stepper_cfunc_setup
	begin
	if gem_array_stepper_cfunc
		break
	endif
	wait \{1
		gameframe}
	repeat
	gem_array_stepper_cfunc_cleanup
endscript

script default_startup 
endscript

script call_startup_scripts 
	change \{current_startup_script = default_startup}
	change \{time_gem_offset = $default_gem_offset}
	getglobaltags \{user_options}
	change \{time_input_offset = $default_input_offset}
	get_song_struct song = <song_name>
	if structurecontains structure = <song_struct> name = startup_script
		change current_startup_script = (<song_struct>.startup_script)
	endif
	if structurecontains structure = <song_struct> name = exit_script
		change current_exit_script = (<song_struct>.exit_script)
	else
	endif
	if structurecontains structure = <song_struct> name = gem_offset
		change time_gem_offset = ($time_gem_offset + (<song_struct>.gem_offset))
	endif
	if structurecontains structure = <song_struct> name = input_offset
		change time_input_offset = ($time_input_offset + (<song_struct>.input_offset))
	endif
	if structurecontains structure = <song_struct> name = hammer_on_measure_scale
		change hammer_on_measure_scale = (<song_struct>.hammer_on_measure_scale)
	else
		change \{hammer_on_measure_scale = $default_hammer_on_measure_scale}
	endif
	if ($game_mode = training && $in_menu_choose_practice_section = 0 && $current_speedfactor != 1.0)
		if ($current_speedfactor >= 0.8)
			pitchshiftoffset = ($default_practice_mode_pitchshift_offset_slow)
		elseif ($current_speedfactor >= 0.6)
			pitchshiftoffset = ($default_practice_mode_pitchshift_offset_slower)
		else
			pitchshiftoffset = ($default_practice_mode_pitchshift_offset_slowest)
		endif
		change time_gem_offset = ($time_gem_offset + <pitchshiftoffset> + $default_practice_mode_geminput_offset)
		change time_input_offset = ($time_input_offset + <pitchshiftoffset> + $default_practice_mode_geminput_offset)
		change default_drums_offset = ($default_drums_offset - $default_practice_mode_geminput_offset)
	endif
	spawnscriptnow ($current_startup_script) params = {<...>}
endscript

script kill_startup_script 
	if NOT ($current_startup_script = nothing)
		killspawnedscript name = ($current_startup_script)
	endif
	if NOT ($current_exit_script = nothing)
		spawnscriptnow ($current_exit_script) params = {<...>}
	endif
endscript

script load_venue \{block_scripts = 0}
	getpakmancurrentname \{map = zones}
	if gotparam \{pakname}
		if (<pakname> = (($levelzones.$current_level).name))
			transitions_resetzone
			return
		else
			resetwaypoints
			destroy_crowd_models
			setpakmancurrentblock \{map = zones
				pak = none}
		endif
	else
		resetwaypoints
	endif
	resetpulseevents
	formattext textname = filename '%s.pak' s = (($levelzones.$current_level).name)
	getcontentfolderindexfromfile <filename>
	if (<device> = content)
		if NOT downloads_opencontentfolder content_index = <content_index>
			downloadcontentlost
			return
		endif
	endif
	if NOT setpakmancurrentblock map = zones pak = (($levelzones.$current_level).zone) block_scripts = <block_scripts>
		downloadcontentlost
		return
	endif
	if (<device> = content)
		downloads_closecontentfolder content_index = <content_index>
	endif
	gh3_change_crowd_reverb_settings_by_venue
	if nodeflagexists \{nodeflag_viewerlights}
		if ($current_level = load_z_viewer ||
				$current_level = viewer)
			changenodeflag \{nodeflag_viewerlights
				0}
			changenodeflag \{nodeflag_viewerlights
				1}
		else
			changenodeflag \{nodeflag_viewerlights
				0}
		endif
	endif
endscript

script start_song \{device_num = 0
		practice_intro = 0
		endtime = 999999999}
	mark_unsafe_for_shutdown
	set_rich_presence_game_mode
	if ($is_network_game = 0)
		xenon_singleplayer_session_init
	endif
	load_venue
	transition_selecttransition practice_intro = <practice_intro>
	if NOT (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_coop) || ($game_mode = p2_battle) || ($game_mode = p2_quickplay))
		change player1_device = (<device_num>)
		change structurename = player1_status controller = (<device_num>)
	else
		change \{structurename = player1_status
			controller = $player1_device}
		change \{structurename = player2_status
			controller = $player2_device}
		printf "Pads assigned: Player 1: %p Player 2: %q" p = ($player1_status.controller) q = ($player2_status.controller)
	endif
	change \{battle_sudden_death = 0}
	if ($game_mode = p2_battle)
		change \{save_current_powerups_p1 = [
				0
				0
				0
			]}
		change \{save_current_powerups_p2 = [
				0
				0
				0
			]}
		change \{structurename = player1_status
			save_num_powerups = 0}
		change \{structurename = player2_status
			save_num_powerups = 0}
		change \{structurename = player1_status
			save_health = 0.0}
		change \{structurename = player2_status
			save_health = 0.0}
	endif
	if NOT gotparam \{starttime}
		if gotparam \{uselaststarttime}
			starttime = ($current_starttime)
		else
			starttime = 0
		endif
	endif
	if NOT gotparam \{difficulty2}
		difficulty2 = ($current_difficulty2)
	endif
	if NOT gotparam \{difficulty}
		difficulty = ($current_difficulty)
	endif
	if NOT gotparam \{song_name}
		song_name = ($current_song)
	endif
	restart_gem_scroller song_name = <song_name> difficulty = <difficulty> difficulty2 = <difficulty2> starttime = <starttime> practice_intro = <practice_intro> endtime = <endtime>
	change \{check_for_unplugged_controllers = 1}
endscript

script restart_song \{practice_intro = 0
		sudden_death = 0}
	kill_start_key_binding
	create_loading_screen \{mode = restart_song}
	if ($is_network_game = 0)
		xenon_singleplayer_session_init
	endif
	if (<sudden_death> = 0)
		change \{battle_sudden_death = 0}
	endif
	if ($game_mode = p2_battle)
		if NOT (<sudden_death> = 1)
			change \{save_current_powerups_p1 = [
					0
					0
					0
				]}
			change \{save_current_powerups_p2 = [
					0
					0
					0
				]}
			change \{structurename = player1_status
				save_num_powerups = 0}
			change \{structurename = player2_status
				save_num_powerups = 0}
			change \{structurename = player1_status
				save_health = 0.0}
			change \{structurename = player2_status
				save_health = 0.0}
		endif
	endif
	if ($current_song = bossjoe)
		change boss_wuss_out = ($boss_wuss_out + 1)
		printf \{channel = trchen
			"Boss Wuss Out %s"
			s = $boss_wuss_out}
	endif
	stopsoundevent \{crowd_fail_song_sfx}
	if (<practice_intro> = 0)
		change \{current_transition = fastintro}
		if ($coop_dlc_active = 0)
			get_progression_globals game_mode = ($game_mode) use_current_tab = 1
			tier = ($setlist_selection_tier)
			if ($game_mode = p1_career)
				if progression_isencoresong tier_global = <tier_global> tier = <tier> song = ($current_song)
					change \{current_transition = restartencore}
				endif
			endif
			if progression_isbosssong tier_global = <tier_global> tier = <tier> song = ($current_song)
				change \{current_transition = restartboss}
			endif
		endif
	endif
	restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = ($current_starttime) practice_intro = <practice_intro> endtime = <endtime>
endscript

script kill_object_later 
	begin
	if screenelementexists id = <gem_id>
		getscreenelementposition id = <gem_id> local
		py = (<screenelementpos>.(0.0, 1.0))
		if (<py> >= $highway_playline)
			destroygem name = <gem_id>
			break
		endif
		wait \{1
			gameframe}
	else
		break
	endif
	repeat
endscript

script debug_flash_star 
	begin
	launchgemevent \{event = debug_star}
	wait \{8
		gameframes}
	launchgemevent \{event = debug_gem}
	wait \{8
		gameframes}
	repeat
endscript
