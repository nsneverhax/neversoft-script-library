current_progression_savegame = 0
progression_beat_game_last_song = 0
progression_unlock_tier_last_song = 0
progression_got_sponsored_last_song = 0
progression_play_completion_movie = 0
progression_completion_tier = 1
progression_unlocked_guitar = -1
progression_unlocked_guitar2 = -1
progression_unlocked_type = guitar
progression_total_stars_unlocked = 0
Cash_System_rules = [
	{
		diff = easy_rhythm
		newstars = 3
		oldstars = 0
		cash = 35
	}
	{
		diff = easy_rhythm
		newstars = 4
		oldstars = 0
		cash = 85
	}
	{
		diff = easy_rhythm
		newstars = 5
		oldstars = 0
		cash = 150
	}
	{
		diff = easy_rhythm
		newstars = 4
		oldstars = 3
		cash = 50
	}
	{
		diff = easy_rhythm
		newstars = 5
		oldstars = 3
		cash = 115
	}
	{
		diff = easy_rhythm
		newstars = 5
		oldstars = 4
		cash = 65
	}
	{
		diff = easy
		newstars = 3
		oldstars = 0
		cash = 75
	}
	{
		diff = easy
		newstars = 4
		oldstars = 0
		cash = 175
	}
	{
		diff = easy
		newstars = 5
		oldstars = 0
		cash = 300
	}
	{
		diff = easy
		newstars = 4
		oldstars = 3
		cash = 100
	}
	{
		diff = easy
		newstars = 5
		oldstars = 3
		cash = 225
	}
	{
		diff = easy
		newstars = 5
		oldstars = 4
		cash = 125
	}
	{
		diff = medium
		newstars = 3
		oldstars = 0
		cash = 150
	}
	{
		diff = medium
		newstars = 4
		oldstars = 0
		cash = 350
	}
	{
		diff = medium
		newstars = 5
		oldstars = 0
		cash = 600
	}
	{
		diff = medium
		newstars = 4
		oldstars = 3
		cash = 200
	}
	{
		diff = medium
		newstars = 5
		oldstars = 3
		cash = 450
	}
	{
		diff = medium
		newstars = 5
		oldstars = 4
		cash = 250
	}
	{
		diff = hard
		newstars = 3
		oldstars = 0
		cash = 300
	}
	{
		diff = hard
		newstars = 4
		oldstars = 0
		cash = 700
	}
	{
		diff = hard
		newstars = 5
		oldstars = 0
		cash = 1200
	}
	{
		diff = hard
		newstars = 4
		oldstars = 3
		cash = 400
	}
	{
		diff = hard
		newstars = 5
		oldstars = 3
		cash = 900
	}
	{
		diff = hard
		newstars = 5
		oldstars = 4
		cash = 500
	}
	{
		diff = expert
		newstars = 3
		oldstars = 0
		cash = 450
	}
	{
		diff = expert
		newstars = 4
		oldstars = 0
		cash = 1050
	}
	{
		diff = expert
		newstars = 5
		oldstars = 0
		cash = 1800
	}
	{
		diff = expert
		newstars = 4
		oldstars = 3
		cash = 600
	}
	{
		diff = expert
		newstars = 5
		oldstars = 3
		cash = 1350
	}
	{
		diff = expert
		newstars = 5
		oldstars = 4
		cash = 750
	}
]
songs_implemented = {
}

script Progression_CheckSong5Star 
	printf \{qs(0xb04c15e0)}
	get_progression_globals game_mode = ($game_mode)
	SongList = <tier_global>
	Tier = 1
	begin
	setlist_prefix = ($<SongList>.prefix)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize ($<SongList>.<tier_checksum>.songs)
	unlocked = 0
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gignum = <Tier>
	GetGlobalTags <gig_name>
	if (<unlocked> = 0 && <completed> = 0)
		return \{FALSE}
	endif
	array_count = 0
	begin
	if ($current_progression_flag = career_band)
		get_band_difficulty
		format_globaltag_song_checksum part = ($<SongList>.part) song = ($<SongList>.<tier_checksum>.songs [<array_count>]) difficulty = <band_difficulty>
	else
		format_globaltag_song_checksum part = ($<SongList>.part) song = ($<SongList>.<tier_checksum>.songs [<array_count>])
	endif
	GetGlobalTags <song_checksum> param = unlocked
	GetGlobalTags <song_checksum> param = stars
	if NOT Progression_IsBossSong tier_global = <tier_global> Tier = <Tier> song = ($<SongList>.<tier_checksum>.songs [<array_count>])
		if NOT (<stars> = 5)
			return \{FALSE}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat ($<SongList>.num_tiers)
	return \{true}
endscript

script Progression_CheckDiff 
	printf \{qs(0xfc49ebf7)}
	Progression_GetDifficulty
	if NOT (<diff> = <difficulty>)
		return \{FALSE}
	endif
	if GotParam \{mode}
		if NOT ($game_mode = <mode>)
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script Progression_SongFailed 
	printf \{qs(0xb3ef858d)}
	if ($coop_dlc_active = 1)
		return
	endif
	if ($game_mode = p1_career ||
			$game_mode = p2_career)
		UpdateAtoms \{Name = Progression}
	endif
	if NOT ($is_attract_mode = 1)
		if NOT ($is_network_game = 1)
			Change \{Achievements_SongWonFlag = 0}
			achievements_update
		endif
	endif
	if ($current_song != $last_song_failed)
		Change last_song_failed = ($current_song)
		Change \{current_song_failed_num = 1}
	else
		Change current_song_failed_num = ($current_song_failed_num + 1)
	endif
	if ($current_song_failed_num < 3)
		if isXenon
			if NOT ($current_song = jamsession)
				writesongdatatofile \{failed = 1}
			endif
		endif
	endif
endscript

script Progression_SongWon 
	printf \{qs(0xaea36534)}
	additional_cash = 0
	Change \{progression_beat_game_last_song = 0}
	Change \{progression_unlock_tier_last_song = 0}
	Change \{progression_got_sponsored_last_song = 0}
	Change \{progression_play_completion_movie = 0}
	disable_because_of_cheats
	update_song_star_rating
	if isSinglePlayerGame
		getplayerinfo \{1
			part}
	else
		part = Band
	endif
	get_band_difficulty
	get_difficulty_text_nl difficulty = <band_difficulty>
	get_song_prefix song = ($current_song)
	get_formatted_songname song_prefix = (<song_prefix>) difficulty_text_nl = <difficulty_text_nl> part = ($instrument_list.<part>.text_nl)
	if ($current_song != jamsession)
		if isSinglePlayerGame
			get_player_percent_accuracy \{player_index = 1}
		else
			gamemode_getnumplayersshown
			p = 1
			gold_stars = 1
			begin
			get_player_percent_accuracy player_index = <p>
			if (<percent_notes_hit> != 100)
				gold_stars = 0
			endif
			p = (<p> + 1)
			repeat <num_players_shown>
			if (<gold_stars> = 1)
				<percent_notes_hit> = 100
			else
				<percent_notes_hit> = 0
			endif
		endif
		if (<cheat_disable> = 0)
			if (<percent_notes_hit> = 100)
				if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
					SetGlobalTags <songname> params = {tr_percent100 = 1}
				endif
				if ($game_mode = p1_quickplay ||
						$game_mode = p1_career)
					SetGlobalTags <songname> params = {achievement_gold_star = 1}
				endif
			endif
		endif
	endif
	gamemode_gettype
	if (<Type> = career)
		if NOT ($current_song = jamsession)
			if globaltagexists \{$current_song
					noassert = 1}
				SetGlobalTags \{$current_song
					all_active_players = 1
					params = {
						unlocked = 1
					}}
				progression_set_unlocked_for_all_diff game_mode = ($game_mode) ($current_progression_flag) song = ($current_song)
			endif
			formatText {
				checksumName = venue_checksum
				'%s_%i'
				s = ($LevelZones.($current_level).Name)
				i = ($instrument_list.<part>.text_nl)
				AddToStringLookup = true
			}
			getsavegamefromcontroller controller = ($primary_controller)
			if globaltagexists <venue_checksum> noassert = 1
				SetGlobalTags <venue_checksum> savegame = <savegame> params = {unlocked = 1}
			endif
			formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.($current_level).Name)
			if globaltagexists <venue_checksum> noassert = 1
				SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
			endif
		endif
		if ($current_song = thethingthat)
			formatText \{checksumName = venue_checksum
				'venue_%s'
				s = 'z_Stone'}
			if globaltagexists <venue_checksum> noassert = 1
				SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
			endif
		endif
		get_progression_globals ($current_progression_flag) game_mode = ($game_mode) use_current_tab = 1
		SongList = <tier_global>
		bandname_id = band_info
		SetGlobalTags <bandname_id> params = {first_play = 0} all_active_players = 1
		GetGlobalTags \{Progression
			params = current_tier}
		GetGlobalTags \{Progression
			params = current_song_count}
		GetGlobalTags \{Progression
			params = career_using_createagig}
		song_count = <current_song_count>
		if GotParam \{current_tier}
			setlist_prefix = ($<SongList>.prefix)
			formatText checksumName = tier_checksum 'tier%s' s = <current_tier>
			if (<career_using_createagig> = 1)
				if ($current_progression_flag = career_band)
					get_band_difficulty
					format_globaltag_song_checksum part = ($<tier_global>.part) song = ($current_song) difficulty = <band_difficulty>
				else
					format_globaltag_song_checksum part = ($<tier_global>.part) song = ($current_song)
				endif
			else
				if ($current_progression_flag = career_band)
					get_band_difficulty
					format_globaltag_song_checksum part = ($<tier_global>.part) song = ($current_song) difficulty = <band_difficulty>
				else
					format_globaltag_song_checksum part = ($<tier_global>.part) song = ($current_song)
				endif
			endif
			if Progression_IsBossSong tier_global = <tier_global> Tier = <current_tier> song = ($current_song)
				Change \{structurename = player1_status
					stars = 5}
			endif
			if isSinglePlayerGame
				getplayerinfo \{1
					stars}
				new_stars = <stars>
				getplayerinfo \{1
					score}
				new_score = <score>
			else
				new_stars = ($band1_status.stars)
				new_score = ($band1_status.score)
			endif
			if ($is_network_game = 0)
				progression_cashmilestonessongwon
			endif
			if isSinglePlayerGame
				get_player_percent_accuracy \{player_index = 1}
			else
				gamemode_getnumplayersshown
				p = 1
				gold_stars = 1
				begin
				get_player_percent_accuracy player_index = <p>
				if (<percent_notes_hit> != 100)
					gold_stars = 0
				endif
				p = (<p> + 1)
				repeat <num_players_shown>
				if (<gold_stars> = 1)
					<percent_notes_hit> = 100
				else
					<percent_notes_hit> = 0
				endif
			endif
			if (<cheat_disable> = 0)
				if (<percent_notes_hit> = 100)
					SetGlobalTags <song_checksum> params = {percent100 = 1} all_active_players = 1
				endif
			endif
			if (<cheat_disable> = 0)
				gamemode_getnumplayersshown
				if (<num_players_shown> > 0)
					if is_boss_battle_song
						num_players_shown = 1
					endif
					<Player> = 1
					begin
					getplayerinfo <Player> is_local_client
					if (<is_local_client> = 1)
						getplayerinfo <Player> controller
						if ($primary_controller = <controller>)
							getsavegamefromcontroller controller = <controller>
							GetGlobalTags <song_checksum> savegame = <savegame> param = stars
							old_stars = <stars>
							GetGlobalTags <song_checksum> savegame = <savegame> param = score
							old_score = <score>
							if (($permanent_songlist_props.($current_song).double_kick) = 1)
								getplayerinfo <Player> double_kick_drum
								if (<double_kick_drum> = 1)
									SetGlobalTags <song_checksum> savegame = <savegame> params = {double_bass_complete = 1}
								endif
							endif
							if check_if_metallifacts_exists song = ($current_song)
								if (<old_stars> < 3)
									flag_new_song_info_for_all_difficulties new_song_info = 1 part = <part>
								endif
							endif
							if (<new_stars> > <old_stars>)
								SetGlobalTags <song_checksum> savegame = <savegame> params = {stars = <new_stars>}
								if ($current_tab = tab_setlist)
									if NOT StructureContains structure = ($<tier_global>.<tier_checksum>) nocash
										Progression_AwardCash old_stars = <stars> new_stars = <new_stars>
									endif
								endif
							endif
							if (<new_score> > <old_score>)
								CastToInteger \{new_score}
								SetGlobalTags <song_checksum> savegame = <savegame> params = {score = <new_score>}
							endif
						endif
					endif
					Player = (<Player> + 1)
					repeat <num_players_shown>
				endif
			endif
			setup_encore = 1
			GetGlobalTags \{Progression
				params = career_play_song_and_end
				noassert = 1}
			if GotParam \{career_play_song_and_end}
				if (<career_play_song_and_end> = 1)
					setup_encore = 0
				endif
			endif
			if (<career_using_createagig> = 1)
				setup_encore = 0
			endif
			progression_get_total_stars
			if (<setup_encore> = 1)
				if NOT progression_check_intro_complete
					GetArraySize ($<tier_global>.<tier_checksum>.songs)
					if StructureContains structure = ($<tier_global>.<tier_checksum>) encore_stars
						if (($<tier_global>.<tier_checksum>.encore_stars) = 0)
							if (($<tier_global>.<tier_checksum>.encore_stars) <= <total_stars>)
								ENCORE = ($<tier_global>.<tier_checksum>.songs [(<array_Size> - 1)])
								if ($current_progression_flag = career_band)
									get_band_difficulty
									format_globaltag_song_checksum part = ($<tier_global>.part) song = <ENCORE> difficulty = <band_difficulty>
								else
									format_globaltag_song_checksum part = ($<tier_global>.part) song = <ENCORE>
								endif
								GetGlobalTags <song_checksum> param = unlocked
								if (<unlocked> = 0)
									Change \{current_transition = preencore}
									next_song_to_force = ($<tier_global>.<tier_checksum>.songs [(<array_Size> - 1)])
									if ($debug_encore = 0)
										SetGlobalTags Progression params = {encore_song = <next_song_to_force>}
									endif
								else
									if NOT progression_check_intro_complete
										progression_set_intro_complete
									endif
								endif
							endif
						endif
					endif
				endif
			endif
			if ($is_network_game = 0)
				format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
				GetGlobalTags <gig_name> param = completed
				if (<completed> = 0)
					if StructureContains structure = ($<tier_global>.<tier_checksum>) end_with_credits
						if progression_career_check_gig_complete ($current_progression_flag) gig = ($current_gig_number)
							Change \{end_credits = 1}
						endif
					endif
				endif
			endif
		endif
	elseif (<Type> = quickplay && $is_network_game = 0)
		progression_cashmilestonessongwon
	endif
	progression_updatedetailedstatsforgig
	if isXenon
		if NOT ($current_song = jamsession)
			writesongdatatofile
		endif
	endif
	if ($debug_encore = 0)
		if GotParam \{next_song_to_force}
			Change current_song = <next_song_to_force>
		endif
	endif
endscript

script flag_new_song_info_for_all_difficulties \{new_song_info = 1}
	if NOT GotParam \{song}
		<song> = ($current_song)
	endif
	GetArraySize ($difficulty_list)
	<i> = 0
	begin
	get_difficulty_text_nl index = <i>
	get_song_prefix song = <song>
	get_formatted_songname song_prefix = (<song_prefix>) difficulty_text_nl = <difficulty_text_nl> part = ($instrument_list.<part>.text_nl)
	SetGlobalTags <songname> savegame = <savegame> params = {new_song_info = <new_song_info>}
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script update_song_star_rating 
	gamemode_getnumplayersshown
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player>
	<stars> = ($<player_status>.projected_song_stars)
	CastToInteger \{stars}
	if (<stars> < 3)
		<stars> = 3
	endif
	Change structurename = <player_status> stars = <stars>
	Player = (<Player> + 1)
	repeat $current_num_players
	<stars> = ($band1_status.projected_song_stars)
	CastToInteger \{stars}
	if (<stars> < 3)
		<stars> = 3
	endif
	Change structurename = band1_status stars = <stars>
endscript

script get_player_percent_accuracy 
	RequireParams \{[
			player_index
		]
		all}
	if NOT playerinfoequals <player_index> part = vocals
		getplayerinfo <player_index> notes_hit
		getplayerinfo <player_index> max_notes
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
	else
		getplayerinfo <player_index> vocal_phrase_quality
		getplayerinfo <player_index> vocal_phrase_max_qual
		if (<vocal_phrase_max_qual> > 0)
			<percent_notes_hit> = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
	endif
	adjust_percent_for_display percent = <percent_notes_hit>
	<percent_notes_hit> = <adjusted_percent>
	return percent_notes_hit = <percent_notes_hit>
endscript
end_credits = 0
boss_devil_score = 0

script Progression_EndCredits 
	printf \{qs(0x08c313c4)}
	Change boss_devil_score = ($player1_status.score)
	reset_score \{player_status = player1_status}
	Change \{current_level = $final_credits_zone}
	Change \{current_song = $final_credits_song}
	create_loading_screen
	Load_Venue
	restart_gem_scroller song_name = ($current_song) difficulty = ($player1_status.difficulty) difficulty2 = ($player2_status.difficulty) starttime = 0 end_credits_restart = 1
	generic_event_choose \{state = uistate_play_song}
	SpawnScriptNow \{scrolling_list_begin}
endscript

script Progression_EndCredits_Done 
	if ($end_credits = 1)
		Change structurename = player1_status score = ($boss_devil_score)
		Change \{boss_devil_score = 0}
	endif
	destroy_credits_menu
endscript

script Progression_AwardCash 
	printf \{qs(0xf198ad82)}
	additional_cash = 0
	get_current_band_info
	GetGlobalTags <band_info>
	GetGlobalTags \{Progression
		params = current_song_count}
	get_progression_globals ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	GetGlobalTags <gig_name> param = cash_earned
	SetGlobalTags <gig_name> params = {cash_earned = (<cash_earned> + <additional_cash>)}
	GetGlobalTags \{Progression
		params = current_song_count}
	return additional_cash = <additional_cash>
endscript

script Progression_CountCompletedSongsInCurrentTier 
	completed_songs = 0
	tier_size = 0
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	if NOT (<tier_global> = 0 || $current_gig_number = 0)
		Progression_GetNumTierSong tier_global = <tier_global> Tier = ($current_gig_number) all
		song_count = 0
		begin
		Progression_GetTierSong tier_global = <tier_global> Tier = ($current_gig_number) song_count = <song_count>
		GetGlobalTags <song_checksum> param = stars
		if NOT (<stars> = 0)
			completed_songs = (<completed_songs> + 1)
		endif
		song_count = (<song_count> + 1)
		repeat <tier_size>
	endif
	return {completed_songs = <completed_songs> total_songs = <tier_size>}
endscript

script Progression_GetNumTierSong 
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	if GotParam \{all}
		return tier_size = <array_Size>
	endif
	if StructureContains structure = ($<tier_global>.<tier_checksum>) encorep1
		array_Size = (<array_Size> - 1)
	endif
	if StructureContains structure = ($<tier_global>.<tier_checksum>) encorep2
		array_Size = (<array_Size> - 1)
	endif
	if StructureContains structure = ($<tier_global>.<tier_checksum>) boss
		array_Size = (<array_Size> - 1)
	endif
	return tier_size = <array_Size>
endscript

script Progression_GetTierSong 
	setlist_prefix = ($<tier_global>.prefix)
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	song = ($<tier_global>.<tier_checksum>.songs [<song_count>])
	format_globaltag_song_checksum part = ($<tier_global>.part) song = <song>
	return song = <song> song_checksum = <song_checksum>
endscript

script Progression_GetBossSong 
	setlist_prefix = ($<tier_global>.prefix)
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	if NOT StructureContains structure = ($<tier_global>.<tier_checksum>) boss
		return \{song_count = -1
			song = None
			song_checksum = None}
	endif
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = (<array_Size> - 1)
	if StructureContains structure = ($<tier_global>.<tier_checksum>) encorep1
		array_count = (<array_count> - 1)
	endif
	song = ($<tier_global>.<tier_checksum>.songs [<array_count>])
	format_globaltag_song_checksum part = ($<tier_global>.part) song = <song>
	return song_count = <array_count> song = <song> song_checksum = <song_checksum>
endscript

script Progression_GetEncoreSong \{Type = any}
	setlist_prefix = ($<tier_global>.prefix)
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	if (<Type> = any)
		if NOT StructureContains structure = ($<tier_global>.<tier_checksum>) encorep1
			if NOT StructureContains structure = ($<tier_global>.<tier_checksum>) encorep2
				return \{song_count = -1
					song = None
					song_checksum = None}
			endif
		endif
	endif
	if (<Type> = p1)
		if StructureContains structure = ($<tier_global>.<tier_checksum>) encore_stars
		elseif StructureContains structure = ($<tier_global>.<tier_checksum>) encorep1
		elseif NOT StructureContains structure = ($<tier_global>.<tier_checksum>) encore_stars
			return \{song_count = -1
				song = None
				song_checksum = None}
		elseif NOT StructureContains structure = ($<tier_global>.<tier_checksum>) encorep1
			return \{song_count = -1
				song = None
				song_checksum = None}
		endif
	endif
	if (<Type> = p2)
		if NOT StructureContains structure = ($<tier_global>.<tier_checksum>) encorep2
			return \{song_count = -1
				song = None
				song_checksum = None}
		endif
	endif
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = (<array_Size> - 1)
	if (<Type> = p1)
		if StructureContains structure = ($<tier_global>.<tier_checksum>) encorep2
			array_count = (<array_count> - 1)
		endif
	endif
	song = ($<tier_global>.<tier_checksum>.songs [<array_count>])
	if ($current_progression_flag = career_band)
		get_band_difficulty
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty = <band_difficulty>
	else
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song>
	endif
	return song_count = <array_count> song = <song> song_checksum = <song_checksum>
endscript

script Progression_IsBossSong 
	if NOT GotParam \{Tier}
		return \{FALSE}
	endif
	query_song = <song>
	Progression_GetBossSong <...>
	if (<song> = <query_song>)
		return \{true}
	endif
	return \{FALSE}
endscript

script Progression_IsEncoreSong 
	query_song = <song>
	get_progression_globals ($current_progression_flag) game_mode = ($game_mode) use_current_tab = 1
	Progression_GetEncoreSong <...> Type = p1
	if (<song> = <query_song>)
		return \{true}
	endif
	Progression_GetEncoreSong <...> Type = p2
	if (<song> = <query_song>)
		return \{true}
	endif
	return \{FALSE}
endscript

script progression_shouldplaysongspecificvo 
	if ($game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		if ($current_progression_flag = career_band)
			get_band_difficulty
			format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty = <band_difficulty>
		else
			format_globaltag_song_checksum part = ($<tier_global>.part) song = <song>
		endif
		GetGlobalTags <song_checksum> param = unlocked
		if (<unlocked> = 0)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Progression_UnlockSong \{ENCORE = 0
		boss = 0
		unlocked = 0}
	setlist_prefix = ($<tier_global>.prefix)
	Tier = 1
	begin
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	if ($<tier_global>.<tier_checksum>.songs [<array_count>] = <song>)
		if ($current_progression_flag = career_band)
			get_band_difficulty
			format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier_checksum>.songs [<array_count>]) difficulty = <band_difficulty>
		else
			format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier_checksum>.songs [<array_count>])
		endif
		SetGlobalTags <song_checksum> params = {unlocked = 1}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat ($<tier_global>.num_tiers)
endscript

script Progression_GetDifficulty 
	difficulty = ($player1_status.difficulty)
	if ($game_mode = p2_career)
		get_minimum_difficulty difficulty1 = ($player1_status.difficulty) difficulty2 = ($player2_status.difficulty)
		difficulty = <minimum_difficulty>
	endif
	return difficulty = <difficulty>
endscript

script Progression_SetProgressionNodeFlags 
	ChangeNodeFlag \{LS_ALWAYS
		1}
	ls_encore = 0
	ls_3_5 = 0
	get_progression_globals ($current_progression_flag) game_mode = ($game_mode)
	Tier = ($current_gig_number)
	if ($coop_dlc_active = 0)
		if ($game_mode = p1_career ||
				$game_mode = p2_career ||
				$game_mode = p3_career ||
				$game_mode = p4_career)
			if Progression_IsEncoreSong tier_global = <tier_global> Tier = <Tier> song = ($current_song)
				ls_encore = 1
			endif
			Progression_GetDifficulty
			Progression_CountCompletedSongsInCurrentTier
			if (<completed_songs> >= (<total_songs> - 1))
				ls_3_5 = 1
			endif
		endif
	endif
	if ($debug_encore)
		<ls_encore> = 1
	endif
	printf qs(0xd8a1c35d) d = <ls_encore> i = <ls_3_5>
	ChangeNodeFlag \{LS_3_5_PRE
		0}
	ChangeNodeFlag \{LS_3_5_POST
		0}
	ChangeNodeFlag \{LS_ENCORE_PRE
		0}
	ChangeNodeFlag \{LS_ENCORE_POST
		0}
	ChangeNodeFlag \{ls_encore_post2
		0}
	if (<ls_encore> = 1)
		ChangeNodeFlag \{LS_3_5_PRE
			0}
		ChangeNodeFlag \{LS_3_5_POST
			1}
		ChangeNodeFlag \{LS_ENCORE_PRE
			0}
		if ($current_song = noleafclover && $current_level = load_z_tushino)
			ChangeNodeFlag \{LS_ENCORE_POST
				0}
			ChangeNodeFlag \{ls_encore_post2
				1}
		else
			ChangeNodeFlag \{LS_ENCORE_POST
				1}
			ChangeNodeFlag \{ls_encore_post2
				0}
		endif
	elseif (<ls_3_5> = 1)
		ChangeNodeFlag \{LS_3_5_PRE
			0}
		ChangeNodeFlag \{LS_3_5_POST
			1}
		ChangeNodeFlag \{LS_ENCORE_PRE
			1}
		ChangeNodeFlag \{LS_ENCORE_POST
			0}
		ChangeNodeFlag \{ls_encore_post2
			0}
	else
		ChangeNodeFlag \{LS_3_5_PRE
			1}
		ChangeNodeFlag \{LS_3_5_POST
			0}
		ChangeNodeFlag \{LS_ENCORE_PRE
			1}
		ChangeNodeFlag \{LS_ENCORE_POST
			0}
		ChangeNodeFlag \{ls_encore_post2
			0}
	endif
	song = $current_song
	ChangeNodeFlag \{ls_perf_standard
		1}
	ChangeNodeFlag \{ls_perf_round
		0}
	ChangeNodeFlag \{ls_perf_round_m1
		0}
	ChangeNodeFlag \{ls_perf_round_m2
		0}
	ChangeNodeFlag \{ls_perf_round_m3
		0}
	ChangeNodeFlag \{ls_perf_round_m4
		0}
	ChangeNodeFlag \{ls_perf_round_m5
		0}
	ChangeNodeFlag \{ls_perf_round_m6
		0}
	ChangeNodeFlag \{ls_perf_round_m7
		0}
	ChangeNodeFlag \{ls_perf_round_m8
		0}
	ChangeNodeFlag \{ls_perf_round_v
		0}
	if StructureContains structure = ($gh_songlist_props.<song>) in_the_round
		if (($gh_songlist_props.<song>.in_the_round) = 1)
			ChangeNodeFlag \{ls_perf_standard
				0}
			ChangeNodeFlag \{ls_perf_round
				1}
			ChangeNodeFlag \{ls_perf_round_m1
				1}
			ChangeNodeFlag \{ls_perf_round_m2
				1}
			ChangeNodeFlag \{ls_perf_round_m3
				1}
			ChangeNodeFlag \{ls_perf_round_m4
				1}
			ChangeNodeFlag \{ls_perf_round_m5
				1}
			ChangeNodeFlag \{ls_perf_round_m6
				1}
			ChangeNodeFlag \{ls_perf_round_m7
				1}
			ChangeNodeFlag \{ls_perf_round_m8
				1}
		endif
	endif
	ChangeNodeFlag \{ls_perf_openingact
		1}
	ChangeNodeFlag \{ls_perf_metallica
		0}
	if StructureContains structure = ($gh_songlist_props.<song>) Band
		if is_current_band_metallica Band = ($gh_songlist_props.<song>.Band)
			ChangeNodeFlag \{ls_perf_openingact
				0}
			ChangeNodeFlag \{ls_perf_metallica
				1}
		endif
	endif
	GetPakManCurrentName \{map = zones}
	if GotParam \{pakname}
		formatText checksumName = zone_setup '%s_SetupNodeflags' s = <pakname>
		if ScriptExists <zone_setup>
			SpawnScriptNow <zone_setup>
		endif
	endif
endscript
gh4_demo_songs = {
	prefix = 'demo'
	num_tiers = 4
	tier1 = {
		songs = [
			beatit
			rebelyell
		]
		level = load_z_goth
		defaultunlocked = 2
	}
	tier2 = {
		songs = [
			crazytrain
		]
		level = load_z_fairgrounds
		defaultunlocked = 1
	}
	tier3 = {
		songs = [
			americanwoman
		]
		level = load_z_fairgrounds
		defaultunlocked = 1
	}
	tier4 = {
		songs = [
			everlong
		]
		level = load_z_military
		defaultunlocked = 1
	}
}
Bonus_progression = {
	tier_global = bonus_songs
	progression_global = None
}
download_guitar_progression = {
	tier_global = gh4_download_songs_guitar
	progression_global = None
}
download_bass_progression = {
	tier_global = gh4_download_songs_bass
	progression_global = None
}
download_drum_progression = {
	tier_global = gh4_download_songs_drum
	progression_global = None
}
download_vocals_progression = {
	tier_global = gh4_download_songs_vocals
	progression_global = None
}
download_band_progression = {
	tier_global = gh4_download_songs_band
	progression_global = None
}
demo_progression = {
	tier_global = gh4_demo_songs
	progression_global = None
}
career_guitar_progression = {
	tier_global = gh4_career_guitar_songs
	progression_global = gh4_career_guitar_progression
}
career_bass_progression = {
	tier_global = gh4_career_bass_songs
	progression_global = gh4_career_bass_progression
}
career_drum_progression = {
	tier_global = gh4_career_drum_songs
	progression_global = gh4_career_drum_progression
}
career_vocals_progression = {
	tier_global = gh4_career_vocals_songs
	progression_global = gh4_career_vocals_progression
}
career_band_progression = {
	tier_global = gh4_career_band_songs
	progression_global = gh4_career_band_progression
}

script get_progression_globals \{use_current_tab = 0}
	if NOT GotParam \{game_mode}
		game_mode = ($game_mode)
	endif
	if (<use_current_tab> = 1)
		if ($current_tab = tab_bonus)
			Bonus = 1
		elseif ($current_tab = tab_downloads)
			download = 1
		endif
	endif
	if ($is_demo_mode = 1)
		if GotParam \{Bonus}
			AddParams ($Bonus_progression)
		elseif GotParam \{download}
			AddParams ($Download_progression)
		elseif (<game_mode> = p1_career)
			AddParams ($Demo_progression_Career)
		elseif (<game_mode> = p1_quickplay)
			AddParams ($Demo_progression_Quickplay)
		else
			AddParams ($Demo_progression_Multiplayer)
		endif
		return tier_global = <tier_global> progression_global = <progression_global>
	endif
	if GotParam \{download}
		if GotParam \{career_guitar}
			AddParams ($download_guitar_progression)
		elseif GotParam \{career_bass}
			AddParams ($download_bass_progression)
		elseif GotParam \{career_drum}
			AddParams ($download_drum_progression)
		elseif GotParam \{career_vocals}
			AddParams ($download_vocals_progression)
		elseif GotParam \{career_band}
			AddParams ($download_band_progression)
		endif
	endif
	if GotParam \{career_band}
		AddParams ($career_band_progression)
	elseif GotParam \{career_guitar}
		AddParams ($career_guitar_progression)
	elseif GotParam \{career_bass}
		AddParams ($career_bass_progression)
	elseif GotParam \{career_drum}
		AddParams ($career_drum_progression)
	elseif GotParam \{career_vocals}
		AddParams ($career_vocals_progression)
	elseif GotParam \{Bonus}
		AddParams ($Bonus_progression)
	elseif ($band_mode_mode = career)
		AddParams ($career_band_progression)
	elseif ($band_mode_mode = quickplay)
		AddParams ($career_band_progression)
	elseif (<game_mode> = p1_career)
		AddParams ($career_guitar_progression)
	elseif (<game_mode> = p2_career)
		AddParams ($career_band_progression)
	elseif (<game_mode> = p1_quickplay)
		AddParams ($career_guitar_progression)
	elseif (<game_mode> = p2_quickplay)
		AddParams ($career_band_progression)
	elseif (<game_mode> = p2_coop)
		AddParams ($career_band_progression)
	else
		AddParams ($career_band_progression)
	endif
	return tier_global = <tier_global> progression_global = <progression_global>
endscript

script progression_set_new_song_in_gig_list 
	printf \{'progression_set_new_song_in_gig_list'}
	printscriptinfo \{'progression_set_new_song_in_gig_list'}
	get_progression_globals ($current_progression_flag)
	setlist_prefix = ($<tier_global>.prefix)
	formatText \{checksumName = tiername
		'tier%d'
		d = $current_gig_number}
	song_num = 0
	GetArraySize ($<tier_global>.<tiername>.songs)
	song_size = <array_Size>
	GetGlobalTags \{Progression}
	if (<career_using_createagig> = 0)
		format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
		SetGlobalTags <gig_name> params = {started = 1} all_active_players = 1
		if GotParam \{career_play_song_and_end}
			if (<career_play_song_and_end> = 1)
				progression_patch_up_gig_completion <...>
				return \{FALSE}
			endif
		endif
	endif
	if ($quickplay_song_list_current != -1)
		if quickplay_set_new_song_in_gig_list
			return \{true}
		endif
	else
		if progression_check_intro_complete
			UpdateAtoms \{Name = Progression}
			return \{FALSE}
		endif
	endif
	updated_progression = 0
	if (<career_using_createagig> = 0)
		disable_because_of_cheats
		if (<cheat_disable> = 0)
			gamemode_getnumplayersshown
			player_index = 0
			begin
			getplayerinfo (<player_index> + 1) is_local_client
			if (<is_local_client> != 0)
				getplayerinfo (<player_index> + 1) controller
				getsavegamefromcontroller controller = <controller>
				GetGlobalTags <gig_name> savegame = <savegame> params = completed
				if (<completed> = 0)
					SetGlobalTags <gig_name> params = {completed = 1} savegame = <savegame>
					if NOT ($game_mode = p1_career)
						Change \{allow_career_progression_check = 1}
						Change current_progression_savegame = <savegame>
						register_new_progression_atoms ($current_progression_flag) keep_current_savegame
						updated_progression = 1
						Change \{allow_career_progression_check = 0}
					endif
				elseif (<completed> = -1)
					SetGlobalTags <gig_name> params = {completed = 2} savegame = <savegame>
				endif
			endif
			player_index = (<player_index> + 1)
			repeat <num_players_shown>
		endif
		if ($current_level != $final_credits_zone)
			formatText {
				checksumName = venue_checksum
				'%s_%i'
				s = ($LevelZones.($current_level).Name)
				i = ($instrument_list.($<tier_global>.part).text_nl)
				AddToStringLookup = true
			}
			SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
			formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.($current_level).Name)
			SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
		endif
	endif
	if (<updated_progression> = 0)
		UpdateAtoms \{Name = Progression}
	endif
	if IsHost
		SendStructure \{callback = savegigcomplete
			data_to_send = {
				None
			}}
	endif
	if NOT ($is_attract_mode = 1)
		Change \{achievements_newgigwonflag = 1}
		achievements_update
		Change \{achievements_newgigwonflag = 0}
	endif
	return \{FALSE}
endscript

script savegigcomplete 
	get_progression_globals ($current_progression_flag)
	setlist_prefix = ($<tier_global>.prefix)
	formatText \{checksumName = tiername
		'tier%d'
		d = $current_gig_number}
	song_num = 0
	GetArraySize ($<tier_global>.<tiername>.songs)
	song_size = <array_Size>
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	SetGlobalTags <gig_name> params = {started = 1}
	GetGlobalTags <gig_name> params = completed
	if (<completed> = 0)
		SetGlobalTags <gig_name> params = {completed = 1}
		Change \{allow_career_progression_check = 1}
	elseif (<completed> = -1)
		SetGlobalTags <gig_name> params = {completed = 2}
	endif
	formatText {
		checksumName = venue_checksum
		'%s_%i'
		s = ($LevelZones.($current_level).Name)
		i = ($instrument_list.($<tier_global>.part).text_nl)
		AddToStringLookup = true
	}
	SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
	formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.($current_level).Name)
	SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
	UpdateAtoms \{Name = Progression}
	Change \{allow_career_progression_check = 0}
endscript

script quickplay_set_new_song_in_gig_list 
	if ($quickplay_song_list_current = -1)
		return \{FALSE}
	endif
	if ($quickplay_song_list_current >= $num_quickplay_song_list)
		return \{FALSE}
	endif
	Change quickplay_song_list_current = ($quickplay_song_list_current + 1)
	if ($quickplay_song_list_current >= $num_quickplay_song_list)
		return \{FALSE}
	else
		Change current_song = ($quickplay_song_list [($quickplay_song_list_current)])
		return \{true}
	endif
endscript

script quickplay_end_of_gig_list 
	if ($quickplay_song_list_current >= $num_quickplay_song_list)
		return \{true}
	endif
	<quickplay_song_list_current> = ($quickplay_song_list_current + 1)
	if (<quickplay_song_list_current> >= $num_quickplay_song_list)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script progression_check_for_gig_end 
	GetGlobalTags \{Progression}
	if (<career_using_createagig> = 1)
		if quickplay_end_of_gig_list
			return \{true}
		endif
	else
		get_progression_globals ($current_progression_flag)
		if NOT progression_check_intro_complete
			GetArraySize ($<tier_global>.tier1.songs)
			if (($current_song) = ($<tier_global>.tier1.songs [(<array_Size> - 1)]))
				return \{true}
			endif
			return \{FALSE}
		endif
		return \{true}
		if GotParam \{career_play_song_and_end}
			if (<career_play_song_and_end> = 1)
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script debug_unlock_next_gig \{part = Band}
	temp = $allow_career_progression_check
	Change \{allow_career_progression_check = 1}
	progression_flag = career_band
	unlock_order = gh4_career_band_progression_unlock_order
	if (<part> = guitar)
		<progression_flag> = career_guitar
		<unlock_order> = gh4_career_guitar_progression_unlock_order
	elseif (<part> = bass)
		<progression_flag> = career_bass
		<unlock_order> = gh4_career_bass_progression_unlock_order
	elseif (<part> = drum)
		<progression_flag> = career_drum
		<unlock_order> = gh4_career_drum_progression_unlock_order
	elseif (<part> = vocals)
		<progression_flag> = career_vocals
		<unlock_order> = gh4_career_vocals_progression_unlock_order
	endif
	progression_career_gig_complete <...> (<progression_flag>)
	Change allow_career_progression_check = <temp>
endscript

script register_new_progression_atoms 
	index = ($difficulty_list_props.($player1_status.difficulty).index)
	SetProgressionDifficulty difficulty = <index>
	DeRegisterAtoms
	if NOT GotParam \{keep_current_savegame}
		getsavegamefromcontroller controller = ($primary_controller)
		Change current_progression_savegame = <savegame>
	endif
	get_progression_globals game_mode = ($game_mode) <...>
	if NOT (<progression_global> = None)
		setup_unlock_atoms <...>
		array = $<progression_global>
		GetArraySize \{$unlock_atoms}
		if (<array_Size> > 0)
			i = 0
			begin
			AddArrayElement array = <array> element = ($unlock_atoms [<i>])
			i = (<i> + 1)
			repeat <array_Size>
		endif
		RegisterAtoms Name = Progression <array>
		UpdateAtoms \{Name = Progression}
	endif
endscript

script progression_career_check_challenge_complete 
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig_num>
	formatText checksumName = challenge_crc 'challenge%d_completed' d = <challenge_num>
	GetGlobalTags <gig_name>
	if ((<...>.<challenge_crc>) = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script check_gig_completed_quick 
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig_num>
	GetGlobalTags <gig_name>
	if (<completed> = 1 || <completed> = 2)
		return \{true}
	endif
	return \{FALSE}
endscript

script check_gig_unlocked 
	get_progression_globals <...>
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig>
	GetGlobalTags <gig_name>
	if (<unlocked> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script unlock_special_event_challenge 
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig_num>
	GetGlobalTags <gig_name>
	if (<challenge_num> = 2)
		SetGlobalTags <gig_name> params = {challenge2_unlocked = 1}
		if (<challenge2_unlocked> != 1)
			SetGlobalTags <gig_name> params = {completed = -1}
		endif
	elseif (<challenge_num> = 3)
		SetGlobalTags <gig_name> params = {challenge3_unlocked = 1}
		if (<challenge3_unlocked> != 1)
			SetGlobalTags <gig_name> params = {completed = -1}
		endif
	endif
endscript

script progression_career_check_gig_complete savegame = ($current_progression_savegame)
	printf \{qs(0x567674eb)}
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	if GotParam \{gig}
		formatText checksumName = Tier 'tier%d' d = <gig>
		GetArraySize ($<tier_global>.<Tier>.songs)
		num_required = <array_Size>
		array_entry = 0
		begin
		diff_index = 0
		begin
		format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<Tier>.songs [<array_entry>]) difficulty_index = <diff_index>
		GetGlobalTags <song_checksum> savegame = <savegame> params = stars
		if (<stars> > 2)
			<num_required> = (<num_required> - 1)
			break
		endif
		diff_index = (<diff_index> + 1)
		repeat 5
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		if (<num_required> <= 0)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript
allow_career_progression_check = 0

script progression_career_gig_complete savegame = ($current_progression_savegame)
	if ($allow_career_progression_check = 0)
		return
	endif
	Change \{allow_career_progression_check = 0}
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	set_got_unlocked = 0
	set_num = 1
	begin
	formatText checksumName = setnum 'unlockset%d' d = <set_num>
	if NOT StructureContains structure = $<unlock_order> <setnum>
		break
	endif
	set_has_none = 0
	if StructureContains structure = ($<unlock_order>.<setnum>) None
		set_has_none = 1
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = ($<unlock_order>.<setnum>.None)
		GetGlobalTags <gig_name> savegame = <savegame>
		if (<unlocked> = 0)
			SetGlobalTags <gig_name> savegame = <savegame> params = {unlocked = 1 first_time_unlocked = 1}
			return
		endif
	endif
	if (<set_has_none> = 0)
		gig_num = 1
		begin
		formatText checksumName = gignum 'gig%d' d = <gig_num>
		if NOT StructureContains structure = ($<unlock_order>.<setnum>) <gignum>
			break
		endif
		gig = ($<unlock_order>.<setnum>.<gignum>.Name)
		gig_number = ($<unlock_order>.<setnum>.<gignum>.num)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		GetGlobalTags <gig_name> savegame = <savegame> noassert = 1
		if (<unlocked> = 0)
			SetGlobalTags <gig_name> savegame = <savegame> params = {unlocked = 1 first_time_unlocked = 1}
			<set_got_unlocked> = 1
			formatText checksumName = tiername 'tier%d' d = <gig_number>
			GetArraySize ($<tier_global>.<tiername>.songs)
			song_index = 0
			begin
			SetGlobalTags ($<tier_global>.<tiername>.songs [<song_index>]) savegame = <savegame> params = {unlocked = 1}
			song_index = (<song_index> + 1)
			repeat <array_Size>
		endif
		<gig_num> = (<gig_num> + 1)
		repeat
		specialevent_num = 1
		begin
		formatText checksumName = specialeventnum 'special_event%d' d = <specialevent_num>
		if NOT StructureContains structure = ($<unlock_order>.<setnum>) <specialeventnum>
			break
		endif
		gig = ($<unlock_order>.<setnum>.<specialeventnum>.Name)
		gig_num = ($<unlock_order>.<setnum>.<specialeventnum>.num)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		GetGlobalTags <gig_name> savegame = <savegame> noassert = 1
		if (<unlocked> = 0)
			SetGlobalTags <gig_name> savegame = <savegame> params = {unlocked = 1 first_time_unlocked = 1}
			<set_got_unlocked> = 1
			formatText checksumName = tiername 'tier%d' d = <gig_num>
			GetArraySize ($<tier_global>.<tiername>.songs)
			song_index = 0
			begin
			SetGlobalTags ($<tier_global>.<tiername>.songs [<song_index>]) savegame = <savegame> params = {unlocked = 1}
			song_index = (<song_index> + 1)
			repeat <array_Size>
		endif
		<specialevent_num> = (<specialevent_num> + 1)
		repeat
		paytoplay_num = 1
		begin
		formatText checksumName = paytoplaynum 'pay_to_play%d' d = <paytoplay_num>
		if NOT StructureContains structure = ($<unlock_order>.<setnum>) <paytoplaynum>
			break
		endif
		gig = ($<unlock_order>.<setnum>.<paytoplaynum>.Name)
		gig_number = ($<unlock_order>.<setnum>.<paytoplaynum>.num)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		GetGlobalTags <gig_name> savegame = <savegame> noassert = 1
		if (<unlocked> = 0)
			SetGlobalTags <gig_name> savegame = <savegame> params = {unlocked = 1 first_time_unlocked = 1}
			<set_got_unlocked> = 1
		endif
		<paytoplay_num> = (<paytoplay_num> + 1)
		repeat
		if (<set_got_unlocked> = 1)
			return
		endif
	endif
	<set_num> = (<set_num> + 1)
	repeat
endscript

script progression_career_gig_unlock 
	printf \{'Progression_Career_Gig_Unlock'}
	printstruct <...>
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig_name>
	GetGlobalTags <gig_name>
	if (<unlocked> = 0)
		SetGlobalTags <gig_name> savegame = ($current_progression_savegame) params = {unlocked = 1 first_time_unlocked = 1}
	endif
endscript

script progression_cleardetailedstatsforgig 
	Change \{gig_detailed_stats = [
			[
			]
			[
			]
			[
			]
			[
			]
		]}
	Change \{gig_detailed_stats_band = {
		}}
endscript

script progression_updatedetailedstatsforgig 
	progression_cleardetailedstatsforgig
	<default_song_stats> = {
		song = ($current_song)
	}
	gamemode_getnumplayersshown
	if (<num_players_shown> > 0)
		<player_idx> = 0
		begin
		<Player> = (<player_idx> + 1)
		getplayerinfo <Player> is_local_client
		if (<is_local_client> = 1)
			getplayerinfo <Player> score
			CastToInteger \{score}
			getplayerinfo <Player> cash_rank_up
			getplayerinfo <Player> new_cash
			getplayerinfo <Player> career_earnings
			getplayerinfo <Player> stars
			getplayerinfo <Player> notes_hit
			getplayerinfo <Player> total_notes
			getplayerinfo <Player> sp_phrases_hit
			getplayerinfo <Player> sp_phrases_total
			getplayerinfo <Player> best_run
			getplayerinfo <Player> max_notes
			getplayerinfo <Player> vocal_streak_phrases
			getplayerinfo <Player> vocal_phrase_quality
			getplayerinfo <Player> vocal_phrase_max_qual
			get_average_multiplier Player = <Player>
			<avg_multiplier> = <average_multiplier>
			get_song_section_arrays_for_player Player = <Player>
			<curr_song_stats> = {
				<default_song_stats>
				score = <score>
				stars = <stars>
				notes_hit = <notes_hit>
				best_run = <best_run>
				max_notes = <max_notes>
				total_notes = <total_notes>
				sp_phrases_hit = <sp_phrases_hit>
				sp_phrases_total = <sp_phrases_total>
				avg_multiplier = <avg_multiplier>
				cash_rank_up = <cash_rank_up>
				new_cash = <new_cash>
				career_earnings = <career_earnings>
				vocal_streak_phrases = <vocal_streak_phrases>
				vocal_phrase_quality = <vocal_phrase_quality>
				vocal_phrase_max_qual = <vocal_phrase_max_qual>
				detailed_stats = <detailed_stats>
				detailed_stats_max = <detailed_stats_max>
				section_names = <section_names>
			}
			GetArraySize \{$gig_detailed_stats}
			if (<array_Size> < 10)
				<stats_all> = ($gig_detailed_stats)
				<old_stats_player> = (<stats_all> [<player_idx>])
				AddArrayElement array = <old_stats_player> element = <curr_song_stats>
				SetArrayElement ArrayName = stats_all index = <player_idx> NewValue = <array>
				Change GlobalName = gig_detailed_stats NewValue = <stats_all>
			else
				ScriptAssert 'Played more than %d songs in the current gig.' d = <array_Size>
			endif
		endif
		<player_idx> = (<player_idx> + 1)
		repeat <num_players_shown>
	endif
	if (($current_num_players) > 1)
		current_band_stats = {
			stars = ($band1_status.stars)
			score = ($band1_status.score)
			high_mult = ($band1_status.high_mult)
			high_2p_streak = ($band1_status.high_2p_streak)
			high_3p_streak = ($band1_status.high_3p_streak)
			high_4p_streak = ($band1_status.high_4p_streak)
		}
		Change gig_detailed_stats_band = <current_band_stats>
	endif
endscript

script get_song_section_arrays_for_player 
	RequireParams \{[
			Player
		]
		all}
	<detailed_stats> = []
	<detailed_stats_max> = []
	<section_names> = []
	formatText checksumName = last_song_stats 'p%p_last_song_detailed_stats' p = <Player> AddToStringLookup
	formatText checksumName = last_song_stats_max 'p%p_last_song_detailed_stats_max' p = <Player> AddToStringLookup
	getplayerinfo <Player> current_song_section_array
	if (<current_song_section_array> = None)
		return detailed_stats = <detailed_stats> detailed_stats_max = <detailed_stats_max> section_names = <section_names>
	endif
	<song_section_array> = <current_song_section_array>
	getmarkerarraysize array = <song_section_array>
	if (<array_Size> > 0)
		<detailed_stats> = ($<last_song_stats>)
		<detailed_stats_max> = ($<last_song_stats_max>)
		i = 0
		begin
		formatText TextName = marker_text qs(0x73307931) s = (($<song_section_array> [<i>]).marker)
		AddArrayElement array = <section_names> element = <marker_text>
		<section_names> = <array>
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return detailed_stats = <detailed_stats> detailed_stats_max = <detailed_stats_max> section_names = <section_names>
endscript

script progression_gig_get_highest_difficulty_completed 
	get_progression_globals <...> ($current_progression_flag)
	setlist_prefix = ($<tier_global>.prefix)
	highest_diff_completed = 'none'
	highest_diff_index = 4
	if GotParam \{gig}
		formatText checksumName = Tier 'tier%d' d = <gig>
		GetArraySize ($<tier_global>.<Tier>.songs)
		num_required = <array_Size>
		array_entry = 0
		begin
		song = ($<tier_global>.<Tier>.songs [<array_entry>])
		progression_song_get_highest_difficulty_completed song = <song> ($current_progression_flag)
		if (<diff_index> != -1)
			num_required = (<num_required> - 1)
			if (<diff_index> < <highest_diff_index>)
				highest_diff_index = <diff_index>
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		if (<num_required> <= 0)
			get_difficulty_text_nl difficulty = ($difficulty_list [<highest_diff_index>])
			<highest_diff_completed> = <difficulty_text_nl>
		endif
	endif
	return highest_diff_completed = <highest_diff_completed>
endscript

script progression_song_get_highest_difficulty_completed 
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	highest_diff_completed = 'none'
	highest_diff_index = -1
	if GotParam \{song}
		diff_index = 0
		GetArraySize \{$difficulty_list}
		diff_size = <array_Size>
		begin
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty = ($difficulty_list [<diff_index>])
		GetGlobalTags <song_checksum> params = stars
		if (<stars> > 2)
			get_difficulty_text_nl difficulty = ($difficulty_list [<diff_index>])
			<highest_diff_completed> = <difficulty_text_nl>
			<highest_diff_index> = <diff_index>
		endif
		<diff_index> = (<diff_index> + 1)
		repeat <diff_size>
	endif
	return highest_diff_completed = <highest_diff_completed> diff_index = <highest_diff_index>
endscript

script progression_set_unlocked_for_all_diff 
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	if GotParam \{song}
		diff_index = 0
		GetArraySize \{$difficulty_list}
		diff_size = <array_Size>
		begin
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty = ($difficulty_list [<diff_index>])
		SetGlobalTags <song_checksum> params = {unlocked = 1}
		<diff_index> = (<diff_index> + 1)
		repeat <diff_size>
	endif
endscript

script progression_song_get_best_difficulty_completed 
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	best_stars = 0
	if GotParam \{song}
		diff_index = 0
		GetArraySize \{$difficulty_list}
		diff_size = <array_Size>
		begin
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty = ($difficulty_list [<diff_index>])
		GetGlobalTags <song_checksum> params = stars
		GetGlobalTags <song_checksum> param = unlocked
		if (<stars> > <best_stars>)
			best_stars = <stars>
		endif
		<diff_index> = (<diff_index> + 1)
		repeat <diff_size>
	endif
	return {stars = <best_stars> song_checksum = <song_checksum>}
endscript

script progression_get_total_stars 
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	SongList = <tier_global>
	total_stars = 0
	Tier = 1
	begin
	setlist_prefix = ($<SongList>.prefix)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize ($<SongList>.<tier_checksum>.songs)
	unlocked = 0
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gignum = <Tier>
	if GotParam \{savegame}
		GetGlobalTags <gig_name> savegame = <savegame>
	else
		GetGlobalTags <gig_name>
	endif
	array_count = 0
	begin
	RemoveParameter \{stars}
	RemoveParameter \{unlocked}
	progression_song_get_best_difficulty_completed song = ($<SongList>.<tier_checksum>.songs [<array_count>]) game_mode = ($game_mode) ($current_progression_flag)
	if NOT Progression_IsBossSong tier_global = <tier_global> Tier = <Tier> song = ($<SongList>.<tier_checksum>.songs [<array_count>])
		total_stars = (<total_stars> + <stars>)
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat ($<SongList>.num_tiers)
	return {total_stars = <total_stars>}
endscript

script progression_check_intro_complete 
	get_current_band_info
	GetGlobalTags <band_info>
	getplayerinfo \{1
		part}
	if ($current_num_players > 1)
		part = Band
		if ($band_mode_active = 0)
			return \{FALSE}
		endif
	endif
	switch <part>
		case guitar
		check = <career_intro_guitar_complete>
		case bass
		check = <career_intro_bass_complete>
		case drum
		check = <career_intro_drum_complete>
		case vocals
		check = <career_intro_vocals_complete>
		case Band
		check = <career_intro_band_complete>
	endswitch
	if (<check> = 0)
		return \{FALSE}
	endif
	return \{true}
endscript

script progression_set_intro_complete 
	get_current_band_info
	GetGlobalTags <band_info>
	getplayerinfo \{1
		part}
	if ($current_num_players > 1)
		part = Band
	endif
	switch <part>
		case guitar
		SetGlobalTags <band_info> params = {career_intro_guitar_complete = 1}
		case bass
		SetGlobalTags <band_info> params = {career_intro_bass_complete = 1}
		case drum
		SetGlobalTags <band_info> params = {career_intro_drum_complete = 1}
		case vocals
		SetGlobalTags <band_info> params = {career_intro_vocals_complete = 1}
		case Band
		SetGlobalTags <band_info> params = {career_intro_band_complete = 1}
	endswitch
endscript

script progression_should_show_credits 
	get_current_band_info
	GetGlobalTags <band_info>
	getplayerinfo \{1
		part}
	if ($current_num_players > 1)
		part = Band
		if ($band_mode_active = 0)
			return \{FALSE}
		endif
	endif
	switch <part>
		case guitar
		check = <career_credits_guitar_complete>
		case bass
		check = <career_credits_bass_complete>
		case drum
		check = <career_credits_drum_complete>
		case vocals
		check = <career_credits_vocals_complete>
		case Band
		check = <career_credits_band_complete>
	endswitch
	if (<check> = 0)
		if progression_check_all_songs_complete part = <part>
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script progression_set_credits_complete 
	get_current_band_info
	GetGlobalTags <band_info>
	getplayerinfo \{1
		part}
	if ($current_num_players > 1)
		part = Band
	endif
	switch <part>
		case guitar
		SetGlobalTags <band_info> params = {career_credits_guitar_complete = 1}
		case bass
		SetGlobalTags <band_info> params = {career_credits_bass_complete = 1}
		case drum
		SetGlobalTags <band_info> params = {career_credits_drum_complete = 1}
		case vocals
		SetGlobalTags <band_info> params = {career_credits_vocals_complete = 1}
		case Band
		SetGlobalTags <band_info> params = {career_credits_band_complete = 1}
	endswitch
endscript

script progression_should_show_fan 
	get_current_band_info
	GetGlobalTags <band_info>
	progression_get_total_stars
	if (<career_fan_shrine_complete> = 0)
		if (<total_stars> >= 30)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script progression_set_fan_complete 
	get_current_band_info
	GetGlobalTags <band_info>
	SetGlobalTags <band_info> params = {career_fan_shrine_complete = 1}
endscript

script progression_check_all_songs_complete 
	RequireParams \{[
			part
		]
		all}
	progression_flag = career_guitar
	switch (<part>)
		case bass
		progression_flag = career_bass
		case drum
		progression_flag = career_drum
		case vocals
		progression_flag = career_vocals
		case Band
		progression_flag = career_band
	endswitch
	get_progression_globals (<progression_flag>)
	printstruct <...>
	total_songs = 0
	completed_songs = 0
	num_tiers = ($<tier_global>.num_tiers)
	num_tiers = (<num_tiers> - 1)
	tier_num = 1
	begin
	formatText checksumName = tiername 'tier%d' d = <tier_num>
	go_through_songs = 1
	if StructureContains structure = ($<tier_global>.<tiername>) debug_gig
		go_through_songs = 0
	endif
	if StructureContains structure = ($<tier_global>.<tiername>) createagig
		go_through_songs = 0
	endif
	if (<go_through_songs> = 1)
		GetArraySize ($<tier_global>.<tiername>.songs)
		song_index = 0
		begin
		song = ($<tier_global>.<tiername>.songs [<song_index>])
		diff_index = 0
		begin
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty_index = <diff_index>
		GetGlobalTags <song_checksum> params = stars
		if (<stars> > 2)
			completed_songs = (<completed_songs> + 1)
			break
		endif
		diff_index = (<diff_index> + 1)
		repeat 5
		total_songs = (<total_songs> + 1)
		song_index = (<song_index> + 1)
		repeat <array_Size>
	endif
	tier_num = (<tier_num> + 1)
	repeat <num_tiers>
	if (<total_songs> = <completed_songs>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript
