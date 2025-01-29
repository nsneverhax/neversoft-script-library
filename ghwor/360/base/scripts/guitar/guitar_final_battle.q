is_ampzilla_battle = 0

script final_battle_win_song_check 
	getplayerinfo ($g_net_leader_player_num) Band
	getbandinfo <Band> projected_song_stars
	quest_progression_get_current_song_num
	formatText checksumName = stars_for_song 'stars_for_song%d' d = <song_num> AddToStringLookup = true
	if NOT StructureContains structure = $quest_chapter_finale Name = <stars_for_song>
		ScriptAssert 'Missing %a in structure %b!' a = <stars_for_song> b = ($quest_chapter_finale.Name)
	endif
	<required_stars> = ($quest_chapter_finale.<stars_for_song>)
	if (<projected_song_stars> < <required_stars> && ($cheat_invincible) = 0)
		hud_final_battle_diminish_power
		return \{FALSE}
	endif
	return \{true}
endscript
failed_song_at_end_of_finalbattle = 0

script final_battle_win_song 
	Change \{failed_song = 0}
	Change \{failed_song_at_end_of_finalbattle = 0}
	getfirstplayer \{out = first_player}
	if (<Player> = <first_player>)
		Change \{num_players_finished = 0}
	endif
	songfilemanager func = get_song_end_time song_name = <song_name> career = true
	total_end_time_career = <total_end_time>
	songfilemanager func = get_song_end_time song_name = <song_name> career = FALSE
	printf qs(0x037498f0) s = <total_end_time>
	TimeMarkerReached_SetParams time_offset = 0 time = <total_end_time>
	begin
	if TimeMarkerReached
		break
	endif
	Wait \{1
		gameframe}
	repeat
	TimeMarkerReached_ClearParams
	if NOT final_battle_win_song_check
		<event> = song_failed
		Change \{failed_song_at_end_of_finalbattle = 1}
		extendcrcplayer <event> <Player> out = Type
		broadcastevent Type = <Type>
		return
	endif
	TimeMarkerReached_SetParams time_offset = 0 time = <total_end_time_career>
	begin
	if TimeMarkerReached
		break
	endif
	Wait \{1
		gameframe}
	repeat
	getnumplayersingame
	if (<num_players> = 2)
		wait_on_player = 2
	else
		wait_on_player = 1
	endif
	if quest_progression_is_chapter_rush
		Wait \{$rush_set_song_win_delay
			Seconds}
	else
		Wait \{$Song_Win_Delay
			Seconds}
	endif
	Change num_players_finished = ($num_players_finished + 1)
	getnumplayersingame \{on_screen}
	if ($num_players_finished >= <num_players_shown>)
		if ($is_network_game)
			SpawnScriptNow \{online_end_song}
		else
			<event> = song_won
			extendcrcplayer <event> <Player> out = Type
			broadcastevent Type = <Type>
		endif
	endif
endscript

script hud_final_battle_star_up 
	gamemode_gettype
	if (<Type> = career)
		if ($current_chapter = quest_chapter_finale)
			quest_progression_get_current_song_num
			formatText checksumName = stars_for_song 'stars_for_song%d' d = <song_num>
			if StructureContains structure = $quest_chapter_finale Name = <stars_for_song>
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
				if ScreenElementExists \{id = hud_star_meter_id}
					hud_star_meter_id :se_setprops guitar_fill_mask_dims = <dims> time = 0.2
					hud_star_meter_id :se_setprops dmg_line_pos = <new_pos> time = 0.2
				endif
			endif
		endif
	endif
endscript

script is_final_battle_star_songs 
	gamemode_gettype
	if (<Type> = career)
		if quest_progression_is_chapter_finale
			<current_song> = None
			playlist_getcurrentsong
			get_finalbattle_song_number song = <current_song>
			if (<song_number> = 0 || <song_number> = 1 || <song_number> = 2)
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script hud_final_battle_diminish_power 
	if (($is_ampzilla_battle) != 1)
		return
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_hud_meter_star
			param = star_meter}
		printf \{channel = zdebug
			qs(0xccccee13)}
		return
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_final_power_meter
			param = zilla_meter}
		printf \{channel = zdebug
			qs(0x06e05b66)}
		return
	endif
	<zilla_percent> = 0.0
	GetScreenElementDims id = <zilla_meter>
	<dims> = (((1.0, 0.0) * <zilla_percent>) + (<height> * (0.0, 1.0)))
	<zilla_meter> :se_setprops fill_dims = <dims>
	Wait \{2
		Seconds}
endscript

script hud_final_battle_full_stars 
	if ScreenElementExists \{id = hud_star_meter_id}
		hud_star_meter_id :se_setprops \{hud_demigod_guitar_full_glow_alpha = 1}
	endif
endscript
