cash_milestones = {
	stars_3_bonus = {
		text = qs(0x234a96f0)
		cash = [
			5
			10
			15
			20
			25
		]
	}
	stars_4_bonus = {
		text = qs(0x7ffab599)
		cash = [
			10
			20
			30
			40
			50
		]
	}
	stars_5_bonus = {
		text = qs(0xea8a610c)
		cash = [
			15
			30
			45
			60
			75
		]
	}
	perfect_bonus = {
		text = qs(0xe96112a7)
		cash = [
			20
			40
			60
			80
			100
		]
	}
	decade = {
		text = qs(0x2243b2aa)
		cash = [
			20
			20
			20
			20
			20
		]
	}
	score = {
		text = qs(0x7a3c5908)
		cash = [
			5
			10
			15
			20
			25
		]
	}
	never_in_red = {
		text = qs(0x9de5d6bc)
		cash = [
			5
			10
			15
			20
			25
		]
	}
	never_used_star_power = {
		text = qs(0x3a4ad94f)
		cash = [
			5
			5
			5
			10
			10
		]
	}
	full_star_power = {
		text = qs(0x7deeb9a5)
		cash = [
			5
			5
			5
			10
			10
		]
	}
	note_streak = {
		text = qs(0xdc53700e)
		cash = [
			2
			5
			10
			15
			20
		]
	}
	band_note_streak = {
		text = qs(0x3c0138dc)
		cash = [
			1
			2
			3
			4
			5
		]
	}
	hot_start = {
		text = qs(0x5a9549fe)
		cash = [
			5
			5
			10
			15
			20
		]
	}
	strong_finish = {
		text = qs(0xafe42fa5)
		cash = [
			5
			5
			10
			15
			20
		]
	}
	percent_hit = {
		text = qs(0xa6cdc885)
		cash = [
			2
			4
			6
			8
			10
		]
	}
	jam = {
		text = qs(0x90966688)
		cash = [
			5
			10
			15
			20
			25
		]
	}
	whammy_every_note = {
		text = qs(0xa6f0b99d)
		cash = [
			5
			10
			15
			20
			25
		]
	}
	slide_wah_every_note = {
		text = qs(0x14a1ba50)
		cash = [
			10
			15
			20
			30
			40
		]
	}
}
cash_milestones_collection = [
]
cash_milestones_collection_ui = [
]
cash_milestones_band_ui = [
]
cash_milestones_gig_total = 0
__cash_milestones_player_award = 0

script progression_cashmilestonessongwon 

	get_song_saved_in_globaltags song = ($current_song)
	if ((<saved_in_globaltags> = 0) && ($current_song != jamsession))

		return
	endif
	GetArraySize \{$cash_milestones_collection}
	if (<array_Size> = 0)
		progression_cashmilestonesclear
	endif
	count_players_by_part \{part = guitar}
	gtrs_cnt = <players_by_part>
	count_players_by_part \{part = bass}
	gtrs_cnt = (<players_by_part> + <gtrs_cnt>)
	if (<gtrs_cnt> > 0)
		if ($cheat_alwaysslide = 1)
			return
		endif
	endif
	count_players_by_part \{part = drum}
	if (<players_by_part> > 0)
		if ($cheat_autokick = 1 || $cheat_freedrum = 1)
			return
		endif
	endif
	update_song_star_rating
	gamemode_getnumplayers
	<i> = 1
	begin
	Change \{__cash_milestones_player_award = 0}
	getplayerinfo <i> is_local_client
	if (<is_local_client> = 1)
		evaluate_individual_cash_milestones Player = <i>
		if progression_awardcashmilestones Player = <i> milestone_cash = ($__cash_milestones_player_award)
		endif
	endif
	Change \{__cash_milestones_player_award = 0}
	<i> = (<i> + 1)
	repeat <num_players>
	if isps3
		get_current_band_info
		GetGlobalTags savegame = 0 <band_info> param = career_earnings
		gamemode_getnumplayers
		<i> = 1
		begin
		getplayerinfo <i> is_local_client
		if (<is_local_client> = 1)
			setplayerinfo <i> career_earnings = <career_earnings>
		endif
		<i> = (<i> + 1)
		repeat <num_players>
	endif
	if isps3
		if GotParam \{rank_all_local_players_up}
			<i> = 1
			begin
			getplayerinfo <i> is_local_client
			if (<is_local_client> = 1)
				setplayerinfo <i> cash_rank_up = 1
			endif
			<i> = (<i> + 1)
			repeat <num_players>
		endif
	endif
	if (<num_players> > 1)
		cash_set_milestones_band_ui
	else
		Change cash_milestones_collection_ui = ($cash_milestones_collection [0])
	endif
	cash_sum_gig_earnings
endscript

script cash_set_milestones_band_ui 
	gamemode_getnumplayers
	<player_idx> = 0
	begin
	<player_individual_cash> = 0
	<milestones> = ($cash_milestones_collection [<player_idx>])
	GetArraySize <milestones>
	<num_milestones> = <array_Size>
	if (<num_milestones> > 0)
		<milestone_idx> = 0
		begin
		<milestone> = (<milestones> [<milestone_idx>])
		<player_individual_cash> = (<player_individual_cash> + <milestone>.cash)
		<milestone_idx> = (<milestone_idx> + 1)
		repeat <num_milestones>
	endif
	<player_cash> = {
		individual_cash = <player_individual_cash>
		total_cash = <player_individual_cash>
	}
	SetArrayElement ArrayName = cash_milestones_band_ui globalarray index = <player_idx> NewValue = <player_cash>
	<player_idx> = (<player_idx> + 1)
	repeat <num_players>
endscript

script cash_sum_gig_earnings 
	<total_cash> = 0
	gamemode_getnumplayers
	<i> = 0
	begin
	GetArraySize \{$cash_milestones_collection}
	if (<array_Size> > 0)
		<collection> = ($cash_milestones_collection [<i>])
		GetArraySize <collection>
		if (<array_Size> > 0)
			<j> = 0
			begin
			<total_cash> = (<total_cash> + (<collection> [<j>].cash))
			<j> = (<j> + 1)
			repeat <array_Size>
		endif
	endif
	<i> = (<i> + 1)
	repeat <num_players>
	Change cash_milestones_gig_total = <total_cash>
endscript

script progression_cashmilestonesclear 
	Change \{cash_milestones_collection = [
			[
			]
			[
			]
			[
			]
			[
			]
		]}
	Change \{cash_milestones_collection_per_song = [
			[
			]
			[
			]
			[
			]
			[
			]
		]}
	Change \{cash_milestones_collection_ui = [
		]}
	Change \{cash_milestones_band_ui = [
			{
			}
			{
			}
			{
			}
			{
			}
		]}
	Change \{cash_milestones_gig_total = 0}
endscript

script progression_anyplayerwoncash 
	gamemode_getnumplayers
	<i> = 1
	begin
	getplayerinfo <i> new_cash
	if (<new_cash> > 0)
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <num_players>
	return \{FALSE}
endscript

script progression_clearnewcash 
	gamemode_getnumplayers
	<i> = 1
	begin
	setplayerinfo <i> new_cash = 0
	<i> = (<i> + 1)
	repeat <num_players>
endscript

script progression_getnumlocalplayers 
	gamemode_getnumplayers
	num_local_players = 0
	Player = 1
	begin
	<player_status> = ($0x2994109a [<Player>])
	if ($<player_status>.is_local_client = 1)
		num_local_players = (<num_local_players> + 1)
		local_team = ($<player_status>.team)
	endif
	<Player> = (<Player> + 1)
	repeat <num_players>
	if NOT GotParam \{local_team}

	endif
	return num_local_players = <num_local_players>
endscript

script progression_setcashmilestone \{multiplier = 1}

	if NOT StructureContains structure = $cash_milestones <milestone>

		return
	endif
	if NOT GotParam \{sponsorship_value}
		get_current_difficulty Player = <Player>
		<difficulty_idx> = ($difficulty_list_props.<current_difficulty>.index)
		<milestone_base_cash> = ($cash_milestones.<milestone>.cash [<difficulty_idx>])
	else
		<milestone_base_cash> = <sponsorship_value>
	endif
	if isps3
		progression_getnumlocalplayers
		if (<num_local_players> > 1)
			if (<milestone> = got_sponsored)
				multiplier = (<multiplier> / <num_local_players>)
			else
				multiplier = (<multiplier> / (<num_local_players> - 0.1))
			endif
		endif
	endif
	<milestone_reward> = (<milestone_base_cash> * <multiplier>)
	CastToInteger \{milestone_reward}
	if (<milestone_reward> <= 0)
		return
	endif
	Change __cash_milestones_player_award = ($__cash_milestones_player_award + <milestone_reward>)
	<player_idx> = (<Player> - 1)
	<tmp_milestone_struct> = {milestone = <milestone> cash = <milestone_reward>}
	GetArraySize ($cash_milestones_collection_per_song)
	if (<array_Size> > 0)
		AddArrayElement array = ($cash_milestones_collection_per_song [<player_idx>]) element = <tmp_milestone_struct>
		SetArrayElement ArrayName = cash_milestones_collection_per_song globalarray index = <player_idx> NewValue = <array>
		RemoveParameter \{array}
	endif
	cash_get_duplicate_milestone_index Player = <Player> milestone = <milestone>
	if (<duplicate_milestone_index> = -1)
		<milestone_struct> = {milestone = <milestone> cash = <milestone_reward> Band = FALSE}
		AddArrayElement array = ($cash_milestones_collection [<player_idx>]) element = <milestone_struct>
	else
		<prev_milestone_struct> = ($cash_milestones_collection [<player_idx>] [<duplicate_milestone_index>])
		<prev_milestone_cash> = (<prev_milestone_struct>.cash)
		<milestone_struct> = {milestone = <milestone> cash = (<prev_milestone_cash> + <milestone_reward>) Band = FALSE}
		<player_collection> = ($cash_milestones_collection [<player_idx>])
		SetArrayElement ArrayName = player_collection index = <duplicate_milestone_index> NewValue = <milestone_struct>
		<array> = <player_collection>
	endif
	SetArrayElement ArrayName = cash_milestones_collection globalarray index = <player_idx> NewValue = <array>
endscript

script cash_get_duplicate_milestone_index 

	<player_idx> = (<Player> - 1)
	<duplicate_milestone_index> = -1
	GetArraySize ($cash_milestones_collection [<player_idx>])
	if (<array_Size> > 0)
		<i> = 0
		begin
		<milestone_struct> = ($cash_milestones_collection [<player_idx>] [<i>])
		if StructureContains structure = <milestone_struct> milestone
			if checksumequals a = (<milestone_struct>.milestone) b = <milestone>
				<duplicate_milestone_index> = <i>
				break
			endif
		else
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return duplicate_milestone_index = <duplicate_milestone_index>
endscript

script progression_awardcashmilestones 

	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 0)

	endif
	cash_ranks_get_rank Player = <Player>
	old_rank = <rank>

	getplayerinfo <Player> new_cash
	setplayerinfo <Player> new_cash = (<new_cash> + <milestone_cash>)
	getplayerinfo <Player> checksum
	get_savegame_from_player_status player_status = <checksum>
	get_current_band_info
	GetGlobalTags savegame = <savegame> <band_info> param = cash
	SetGlobalTags savegame = <savegame> <band_info> params = {cash = (<cash> + <milestone_cash>)}
	GetGlobalTags savegame = <savegame> <band_info> param = career_earnings
	SetGlobalTags savegame = <savegame> <band_info> params = {career_earnings = (<career_earnings> + <milestone_cash>)}
	setplayerinfo <Player> career_earnings = (<career_earnings> + <milestone_cash>)
	cash_ranks_get_rank Player = <Player>
	new_rank = <rank>
	if NOT (<new_rank> = <old_rank>)
		setplayerinfo <Player> cash_rank_up = 1
		return \{true}
	endif
	return \{FALSE}
endscript

script evaluate_individual_cash_milestones 

	if ($current_song = jamsession)
		progression_setcashmilestone Player = <Player> milestone = jam
		return
	endif
	gamemode_gettype
	getplayerinfo <Player> part
	switch <part>
		case guitar
		<part_eval> = evaluate_guitar_cash_milestones
		<part_text> = 'guitar'
		case bass
		<part_eval> = evaluate_guitar_cash_milestones
		<part_text> = 'bass'
		case drum
		<part_text> = 'drum'
		case vocals
		<part_text> = 'vocals'
	endswitch
	song_name = ($current_song)
	if StructureContains structure = ($gh_songlist_props.<song_name>) guitar_only
		if NOT (<part> = guitar)
			if NOT ($gh_songlist_props.<song_name>.guitar_only = drums && <part> = drum)
				return
			endif
		endif
	endif
	getplayerinfo <Player> checksum
	getplayerinfo <Player> is_local_client
	get_savegame_from_player_status player_status = <checksum>
	get_current_difficulty Player = <Player>
	get_difficulty_text_nl difficulty = <current_difficulty>
	get_song_prefix song = ($current_song)
	if (<Type> = quickplay)
		<stars_tag> = beststars
		<score_tag> = bestscore
		get_formatted_songname song_prefix = <song_prefix> part = <part_text> difficulty_text_nl = <difficulty_text_nl>
	elseif (<Type> = career)
		<stars_tag> = stars
		<score_tag> = score
		format_globaltag_song_checksum song_name = <song_prefix> part_text = <part_text> difficulty_text_nl = <difficulty_text_nl>
		<songname> = <song_checksum>
	else

		return
	endif

	cash_getstars Player = <Player>
	<new_stars> = <stars>
	if (($boss_battle) = 0)
		switch <new_stars>
			case 3
			progression_setcashmilestone Player = <Player> milestone = stars_3_bonus
			case 4
			progression_setcashmilestone Player = <Player> milestone = stars_4_bonus
			case 5
			progression_setcashmilestone Player = <Player> milestone = stars_5_bonus
			default

		endswitch
	endif
	if (<part> = vocals)
		getplayerinfo <Player> vocal_phrase_quality
		getplayerinfo <Player> vocal_phrase_max_qual
		<notes_hit> = (<vocal_phrase_quality> * 100)
		<max_notes> = (<vocal_phrase_max_qual> * 100)
	else
		cash_getinfo Player = <Player> param = notes_hit func = sum
		cash_getinfo Player = <Player> param = total_notes func = sum
		getplayerinfo Player = <Player> max_notes
	endif
	if (<max_notes> > 0)
		if (<notes_hit> = <max_notes>)
			progression_setcashmilestone Player = <Player> milestone = perfect_bonus
		endif
	endif
	if ($current_song != jamsession)
		cash_count_num_songs_beaten {
			Player = <Player>
			savegame = <savegame>
			part_text = <part_text>
			game_mode = <Type>
			stars_tag = <stars_tag>
			ignore_song = $current_song
		}
		if (<num_songs_played> > 0)
			Mod a = <num_songs_played> b = 10
			if (<num_songs_played> = 9)
				progression_setcashmilestone Player = <Player> milestone = decade
			endif
		endif
	endif
	if ($current_song != jamsession)
		GetGlobalTags savegame = <savegame> <songname> param = <score_tag>
		<old_score> = (<...>.<score_tag>)
		cash_getscore Player = <Player>
		<new_score> = <score>
		if (<new_score> > <old_score>)
			progression_setcashmilestone Player = <Player> milestone = score
		endif
	endif
	cash_getlowesthealth Player = <Player>
	if (<lowest_health> > (2.0 / 3.0))
		progression_setcashmilestone Player = <Player> milestone = never_in_red
	endif
	if ($current_song != jamsession && ($boss_battle) = 0)
		getplayerinfo <Player> star_power_use_count
		if (<star_power_use_count> = 0)
			progression_setcashmilestone Player = <Player> milestone = never_used_star_power
		endif
	endif
	cash_getinfo Player = <Player> param = star_power_amount func = status
	if (<star_power_amount> >= 100.0)
		progression_setcashmilestone Player = <Player> milestone = full_star_power
	endif
	cash_getbestrun Player = <Player>
	progression_setcashmilestone Player = <Player> milestone = note_streak multiplier = (<best_run> / 25)
	cash_gettotalbandstreak Player = <Player>
	progression_setcashmilestone Player = <Player> milestone = band_note_streak multiplier = (<total_band_streak> / 25)
	cash_getbeginningrun Player = <Player>
	if (<beginning_run> >= $hot_start_min_streak)
		progression_setcashmilestone Player = <Player> milestone = hot_start
	endif
	cash_getcurrentrun Player = <Player>
	if (<current_run> >= $strong_finish_min_streak)
		progression_setcashmilestone Player = <Player> milestone = strong_finish
	endif
	if playerinfoequals <Player> part = vocals
		getplayerinfo <Player> vocal_phrase_quality
		getplayerinfo <Player> vocal_phrase_max_qual
		<notes_hit> = (<vocal_phrase_quality> * 100)
		<total_notes> = (<vocal_phrase_max_qual> * 100)
	else
		cash_getinfo Player = <Player> param = notes_hit func = sum
		cash_getinfo Player = <Player> param = total_notes func = sum
	endif
	if (<total_notes> > 0)
		<pct_hit> = (100.0 * <notes_hit> / <total_notes>)
		CastToInteger \{pct_hit}
		if (<pct_hit> > 100)

			<pct_hit> = 100
		endif
		progression_setcashmilestone Player = <Player> milestone = percent_hit multiplier = (((<pct_hit> - 75) / 5) + 1)
	endif
	if ScriptExists <part_eval>

		<part_eval> Player = <Player> savegame = <savegame> songname = <songname>
	endif
endscript

script evaluate_guitar_cash_milestones 

	if playerinfoequals <Player> has_held_notes = 1
		get_current_difficulty Player = <Player>
		if (<current_difficulty> != easy_rhythm)
			getplayerinfo <Player> whammy_every_note
			if (<whammy_every_note> = 1)
				progression_setcashmilestone Player = <Player> milestone = whammy_every_note
			endif
		endif
		if (<current_difficulty> != easy_rhythm)
			getplayerinfo <Player> slide_wah_every_note
			if (<slide_wah_every_note> = 1)
				progression_setcashmilestone Player = <Player> milestone = slide_wah_every_note
			endif
		endif
	endif
endscript

script cash_has_beaten_song 

	GetArraySize \{$difficulty_list}
	<diff_idx> = 0
	begin
	<difficulty> = ($difficulty_list [<diff_idx>])
	get_difficulty_text_nl difficulty = <difficulty>
	if StructureContains structure = $permanent_songlist_props <song_checksum>
		<song_props> = ($permanent_songlist_props.<song_checksum>)
		<in_globaltags> = 1
		<in_globaltags> = (<song_props>.saved_in_globaltags)
		if (<in_globaltags> = 1)
			get_song_prefix song = <song_checksum>
			if (<game_mode> = quickplay)
				get_formatted_songname song_prefix = <song_prefix> part = <part_text> difficulty_text_nl = <difficulty_text_nl>
			else
				<song_checksum_o> = <song_checksum>
				format_globaltag_song_checksum song_name = <song_prefix> part_text = <part_text> difficulty_text_nl = <difficulty_text_nl>
				<songname> = <song_checksum>
				<song_checksum> = <song_checksum_o>
			endif
			if GetGlobalTags savegame = <savegame> <songname> param = <stars_tag>
				if ((<...>.<stars_tag>) >= 3)
					return \{has_beaten_song = 1}
				else
					return \{has_beaten_song = 0}
				endif
			endif
		endif
	endif
	<diff_idx> = (<diff_idx> + 1)
	repeat <array_Size>
	return \{has_beaten_song = -1}
endscript

script cash_count_num_songs_beaten \{ignore_song = NULL}

	<num_songs_played> = 0
	GetArraySize \{$gh_songlist}
	<i> = 0
	begin
	<song_checksum> = ($gh_songlist [<i>])
	cash_has_beaten_song {
		Player = <Player>
		savegame = <savegame>
		part_text = <part_text>
		game_mode = <game_mode>
		stars_tag = <stars_tag>
		song_checksum = <song_checksum>
	}
	if (<has_beaten_song> = 1)
		<num_songs_played> = (<num_songs_played> + 1)
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return num_songs_played = <num_songs_played>
endscript

script cash_getscore 

	getplayerinfo <Player> score
	CastToInteger \{score}
	return score = <score>
endscript

script cash_getstars 

	<stars> = 0
	if gamemode_isbandscoring
		stars = ($band1_status.stars)
	else
		getplayerinfo <Player> stars
	endif
	return stars = <stars>
endscript

script cash_getlowesthealth 

	getplayerinfo <Player> lowest_health
	return lowest_health = <lowest_health>
endscript

script cash_getcurrentrun 

	getplayerinfo <Player> current_run
	return current_run = <current_run>
endscript

script cash_getbeginningrun 

	getplayerinfo <Player> beginning_run
	return beginning_run = <beginning_run>
endscript

script cash_getbestrun 

	getplayerinfo <Player> best_run
	return best_run = <best_run>
endscript

script cash_gettotalbandstreak 

	<total_band_streak> = 0
	getbandindexbyplayer Player = <Player>
	<band_id> = ($band_ids [<band_index>])
	<p2_streak> = ($<band_id>.high_2p_streak * 2)
	<p3_streak> = ($<band_id>.high_3p_streak * 3)
	<p4_streak> = ($<band_id>.high_4p_streak * 4)
	gamemode_getnumplayers
	switch (<num_players>)
		case 2
		<total_band_streak> = (<p2_streak>)
		case 3
		<total_band_streak> = (<p2_streak> + <p3_streak>)
		case 4
		<total_band_streak> = (<p2_streak> + <p3_streak> + <p4_streak>)
		default
		<total_band_streak> = 0
	endswitch
	return total_band_streak = <total_band_streak>
endscript

script cash_getinfo \{func = sum
		Band = FALSE}

	<retval> = {}
	if (<Band> = FALSE)
		getplayerinfo <Player> <param>
		AddParam Name = <param> structure_name = retval value = (<...>.<param>)
	elseif (<func> = status)
		getbandindexbyplayer Player = <Player>
		band_id = ($band_ids [<band_index>])
		AddParam Name = <param> structure_name = retval value = ($<band_id>.<param>)
	else
		<sum> = 0
		<greatest> = 0
		<least> = 1000000000
		<mean> = 0
		gamemode_getnumplayers
		<Player> = 1
		begin
		getplayerinfo <Player> <param>
		<curr> = (<...>.<param>)
		<sum> = (<sum> + <curr>)
		if (<curr> > <greatest>)
			<greatest> = <curr>
		endif
		if (<curr> < <least>)
			<least> = <curr>
		endif
		<Player> = (<Player> + 1)
		repeat <num_players>
		<mean> = (<sum> / <num_players>)
		AddParam Name = <param> structure_name = retval value = (<...>.<func>)
	endif
	return <retval>
endscript
