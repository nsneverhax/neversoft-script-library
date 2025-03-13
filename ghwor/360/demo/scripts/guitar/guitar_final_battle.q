is_ampzilla_battle = 0

script final_battle_win_song_check 
	getplayerinfo ($g_net_leader_player_num) band
	getbandinfo <band> projected_song_stars
	quest_progression_get_current_song_num
	formattext checksumname = stars_for_song 'stars_for_song%d' d = <song_num> addtostringlookup = true
	if NOT structurecontains structure = $quest_chapter_finale name = <stars_for_song>
		scriptassert 'Missing %a in structure %b!' a = <stars_for_song> b = ($quest_chapter_finale.name)
	endif
	<required_stars> = ($quest_chapter_finale.<stars_for_song>)
	if (<projected_song_stars> < <required_stars> && ($cheat_invincible) = 0)
		hud_final_battle_diminish_power
		return \{false}
	endif
	return \{true}
endscript
failed_song_at_end_of_finalbattle = 0

script final_battle_win_song 
	change \{failed_song = 0}
	change \{failed_song_at_end_of_finalbattle = 0}
	getfirstplayer \{out = first_player}
	if (<player> = <first_player>)
		change \{num_players_finished = 0}
	endif
	songfilemanager func = get_song_end_time song_name = <song_name> career = true
	total_end_time_career = <total_end_time>
	songfilemanager func = get_song_end_time song_name = <song_name> career = false
	printf qs(0x037498f0) s = <total_end_time>
	timemarkerreached_setparams time_offset = 0 time = <total_end_time>
	begin
	if timemarkerreached
		break
	endif
	wait \{1
		gameframe}
	repeat
	timemarkerreached_clearparams
	if NOT final_battle_win_song_check
		<event> = song_failed
		change \{failed_song_at_end_of_finalbattle = 1}
		extendcrcplayer <event> <player> out = type
		broadcastevent type = <type>
		return
	endif
	timemarkerreached_setparams time_offset = 0 time = <total_end_time_career>
	begin
	if timemarkerreached
		break
	endif
	wait \{1
		gameframe}
	repeat
	getnumplayersingame
	if (<num_players> = 2)
		wait_on_player = 2
	else
		wait_on_player = 1
	endif
	if quest_progression_is_chapter_rush
		wait \{$rush_set_song_win_delay
			seconds}
	else
		wait \{$song_win_delay
			seconds}
	endif
	change num_players_finished = ($num_players_finished + 1)
	getnumplayersingame \{on_screen}
	if ($num_players_finished >= <num_players_shown>)
		if ($is_network_game)
			spawnscriptnow \{online_end_song}
		else
			<event> = song_won
			extendcrcplayer <event> <player> out = type
			broadcastevent type = <type>
		endif
	endif
endscript

script hud_final_battle_star_up 
	gamemode_gettype
	if (<type> = career)
		if ($current_chapter = quest_chapter_finale)
			quest_progression_get_current_song_num
			formattext checksumname = stars_for_song 'stars_for_song%d' d = <song_num>
			if structurecontains structure = $quest_chapter_finale name = <stars_for_song>
				<max_zilla_stars> = ($quest_chapter_finale.<stars_for_song> * 1.0)
				if (<stars> >= <max_zilla_stars>)
					<stars> = <max_zilla_stars>
					hud_final_battle_full_stars
				endif
				zilla_meter_length = 205.0
				zilla_meter_height = 137.0
				<zilla_percent> = (<stars> / <max_zilla_stars>)
				<zilla_height> = (<zilla_percent> * <zilla_meter_height>)
				<dims> = (((1.0, 0.0) * <zilla_meter_length>) + (<zilla_height> * (0.0, 1.0)))
				dmg_start_pos = (36.0, 205.0)
				dmg_line_pos_range = -140
				<dmg_delta> = (<dmg_line_pos_range> / <max_zilla_stars>)
				new_pos = (<dmg_start_pos> + ((0.0, 1.0) * <stars> * <dmg_delta>))
				if screenelementexists \{id = hud_star_meter_id}
					hud_star_meter_id :se_setprops guitar_fill_mask_dims = <dims> time = 0.2
					hud_star_meter_id :se_setprops dmg_line_pos = <new_pos> time = 0.2
				endif
			endif
		endif
	endif
endscript

script is_final_battle_star_songs 
	gamemode_gettype
	if (<type> = career)
		if quest_progression_is_chapter_finale
			<current_song> = none
			playlist_getcurrentsong
			get_finalbattle_song_number song = <current_song>
			if (<song_number> = 0 || <song_number> = 1 || <song_number> = 2)
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script hud_final_battle_diminish_power 
	if (($is_ampzilla_battle) != 1)
		return
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_hud_meter_star
			param = star_meter}
		printf \{channel = zdebug
			qs(0xccccee13)}
		return
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_final_power_meter
			param = zilla_meter}
		printf \{channel = zdebug
			qs(0x06e05b66)}
		return
	endif
	<zilla_percent> = 0.0
	getscreenelementdims id = <zilla_meter>
	<dims> = (((1.0, 0.0) * <zilla_percent>) + (<height> * (0.0, 1.0)))
	<zilla_meter> :se_setprops fill_dims = <dims>
	wait \{2
		seconds}
endscript

script hud_final_battle_full_stars 
	if screenelementexists \{id = hud_star_meter_id}
		hud_star_meter_id :se_setprops \{hud_demigod_guitar_full_glow_alpha = 1}
	endif
endscript
