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
	got_sponsored = {
		text = qs(0x3fbc259e)
		cash = [
			1
			1
			1
			1
			1
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
	printf 'Progression_CashMilestonesSongWon - Song: %s' s = ($current_song)
	get_song_saved_in_globaltags song = ($current_song)
	if ((<saved_in_globaltags> = 0) && ($current_song != jamsession))
		printf 'Progression_CashMilestonesSongWon - %s is not in globaltags, bailing.' s = ($current_song)
		return
	endif
	getarraysize \{$cash_milestones_collection}
	if (<array_size> = 0)
		progression_cashmilestonesclear
	endif
	change \{got_sponsored_last_gig = 0}
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
		endif
	endif
	update_song_star_rating
	gamemode_getnumplayers
	<i> = 1
	begin
	change \{__cash_milestones_player_award = 0}
	getplayerinfo <i> is_local_client
	if (<is_local_client> = 1)
		evaluate_individual_cash_milestones player = <i>
		if progression_awardcashmilestones player = <i> milestone_cash = ($__cash_milestones_player_award)
			if isps3
				rank_all_local_players_up = 1
			endif
		endif
	endif
	change \{__cash_milestones_player_award = 0}
	<i> = (<i> + 1)
	repeat <num_players>
	if isps3
		if (($got_sponsored_last_gig) = 1)
			get_current_band_info
			formattext checksumname = sponsor_flags_chk 'got_sponsored_%s_t%d' s = ($got_sponsored_tier_catagory) d = ($got_sponsored_tier_number)
			addparam name = <sponsor_flags_chk> structure_name = my_flag value = 1
			setglobaltags <band_info> savegame = 0 params = <my_flag>
		endif
		get_current_band_info
		getglobaltags savegame = 0 <band_info> param = career_earnings
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
		if gotparam \{rank_all_local_players_up}
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
		change cash_milestones_collection_ui = ($cash_milestones_collection [0])
	endif
	cash_sum_gig_earnings
endscript

script cash_set_milestones_band_ui 
	gamemode_getnumplayers
	<player_idx> = 0
	begin
	<player_individual_cash> = 0
	<milestones> = ($cash_milestones_collection [<player_idx>])
	getarraysize <milestones>
	<num_milestones> = <array_size>
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
	setarrayelement arrayname = cash_milestones_band_ui globalarray index = <player_idx> newvalue = <player_cash>
	<player_idx> = (<player_idx> + 1)
	repeat <num_players>
endscript

script cash_sum_gig_earnings 
	<total_cash> = 0
	gamemode_getnumplayers
	<i> = 0
	begin
	getarraysize \{$cash_milestones_collection}
	if (<array_size> > 0)
		<collection> = ($cash_milestones_collection [<i>])
		getarraysize <collection>
		if (<array_size> > 0)
			<j> = 0
			begin
			<total_cash> = (<total_cash> + (<collection> [<j>].cash))
			<j> = (<j> + 1)
			repeat <array_size>
		endif
	endif
	<i> = (<i> + 1)
	repeat <num_players>
	change cash_milestones_gig_total = <total_cash>
endscript

script progression_cashmilestonesclear 
	change \{cash_milestones_collection = [
			[
			]
			[
			]
			[
			]
			[
			]
		]}
	change \{cash_milestones_collection_per_song = [
			[
			]
			[
			]
			[
			]
			[
			]
		]}
	change \{cash_milestones_collection_ui = [
		]}
	change \{cash_milestones_band_ui = [
			{
			}
			{
			}
			{
			}
			{
			}
		]}
	change \{cash_milestones_gig_total = 0}
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
	return \{false}
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
	player = 1
	begin
	formattext checksumname = player_status 'player%p_status' p = <player>
	if ($<player_status>.is_local_client = 1)
		num_local_players = (<num_local_players> + 1)
		local_team = ($<player_status>.team)
	endif
	<player> = (<player> + 1)
	repeat <num_players>
	if NOT gotparam \{local_team}
		scriptassert \{'There should be at least one local player in the game!'}
	endif
	return num_local_players = <num_local_players>
endscript

script progression_setcashmilestone \{multiplier = 1}
	requireparams \{[
			player
			milestone
		]
		all}
	if NOT structurecontains structure = $cash_milestones <milestone>
		softassert 'Uknknown cash milestone %m' m = <milestone>
		return
	endif
	if NOT gotparam \{sponsorship_value}
		get_current_difficulty player = <player>
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
			printf 'Progression_SetCashMilestone - PS3 band multiplier is %f' f = <multiplier>
		endif
	endif
	<milestone_reward> = (<milestone_base_cash> * <multiplier>)
	casttointeger \{milestone_reward}
	if (<milestone_reward> <= 0)
		return
	endif
	change __cash_milestones_player_award = ($__cash_milestones_player_award + <milestone_reward>)
	<player_idx> = (<player> - 1)
	<tmp_milestone_struct> = {milestone = <milestone> cash = <milestone_reward>}
	getarraysize ($cash_milestones_collection_per_song)
	if (<array_size> > 0)
		addarrayelement array = ($cash_milestones_collection_per_song [<player_idx>]) element = <tmp_milestone_struct>
		setarrayelement arrayname = cash_milestones_collection_per_song globalarray index = <player_idx> newvalue = <array>
		removeparameter \{array}
	endif
	cash_get_duplicate_milestone_index player = <player> milestone = <milestone>
	if (<duplicate_milestone_index> = -1)
		<milestone_struct> = {milestone = <milestone> cash = <milestone_reward> band = false}
		addarrayelement array = ($cash_milestones_collection [<player_idx>]) element = <milestone_struct>
	else
		<prev_milestone_struct> = ($cash_milestones_collection [<player_idx>] [<duplicate_milestone_index>])
		<prev_milestone_cash> = (<prev_milestone_struct>.cash)
		<milestone_struct> = {milestone = <milestone> cash = (<prev_milestone_cash> + <milestone_reward>) band = false}
		<player_collection> = ($cash_milestones_collection [<player_idx>])
		setarrayelement arrayname = player_collection index = <duplicate_milestone_index> newvalue = <milestone_struct>
		<array> = <player_collection>
	endif
	setarrayelement arrayname = cash_milestones_collection globalarray index = <player_idx> newvalue = <array>
endscript

script cash_get_duplicate_milestone_index 
	requireparams \{[
			milestone
			player
		]
		all}
	<player_idx> = (<player> - 1)
	<duplicate_milestone_index> = -1
	getarraysize ($cash_milestones_collection [<player_idx>])
	if (<array_size> > 0)
		<i> = 0
		begin
		<milestone_struct> = ($cash_milestones_collection [<player_idx>] [<i>])
		if structurecontains structure = <milestone_struct> milestone
			if checksumequals a = (<milestone_struct>.milestone) b = <milestone>
				<duplicate_milestone_index> = <i>
				break
			endif
		else
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return duplicate_milestone_index = <duplicate_milestone_index>
endscript

script progression_awardcashmilestones 
	requireparams \{[
			player
			milestone_cash
		]
		all}
	getplayerinfo <player> is_local_client
	if (<is_local_client> = 0)
		scriptassert \{'Calling script ensures this is a local client now'}
	endif
	cash_ranks_get_rank player = <player>
	old_rank = <rank>
	printf 'Cash milestones awarded $%d to player %p.' d = <milestone_cash> p = <player>
	getplayerinfo <player> new_cash
	setplayerinfo <player> new_cash = (<new_cash> + <milestone_cash>)
	getplayerinfo <player> checksum
	get_savegame_from_player_status player_status = <checksum>
	get_current_band_info
	getglobaltags savegame = <savegame> <band_info> param = cash
	setglobaltags savegame = <savegame> <band_info> params = {cash = (<cash> + <milestone_cash>)}
	getglobaltags savegame = <savegame> <band_info> param = career_earnings
	setglobaltags savegame = <savegame> <band_info> params = {career_earnings = (<career_earnings> + <milestone_cash>)}
	setplayerinfo <player> career_earnings = (<career_earnings> + <milestone_cash>)
	cash_ranks_get_rank player = <player>
	new_rank = <rank>
	if NOT (<new_rank> = <old_rank>)
		setplayerinfo <player> cash_rank_up = 1
		return \{true}
	endif
	return \{false}
endscript

script evaluate_individual_cash_milestones 
	requireparams \{[
			player
		]
		all}
	if ($current_song = jamsession)
		progression_setcashmilestone player = <player> milestone = jam
		return
	endif
	gamemode_gettype
	getplayerinfo <player> part
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
	if (<part> = vocals)
		song_name = ($current_song)
		if structurecontains structure = ($gh_songlist_props.<song_name>) doesnt_support_vocals
			return
		endif
	endif
	getplayerinfo <player> checksum
	getplayerinfo <player> is_local_client
	get_savegame_from_player_status player_status = <checksum>
	get_current_difficulty player = <player>
	get_difficulty_text_nl difficulty = <current_difficulty>
	get_song_prefix song = ($current_song)
	if (<type> = quickplay)
		<stars_tag> = beststars
		<score_tag> = bestscore
		get_formatted_songname song_prefix = <song_prefix> part = <part_text> difficulty_text_nl = <difficulty_text_nl>
	elseif (<type> = career)
		<stars_tag> = stars
		<score_tag> = score
		format_globaltag_song_checksum song_name = <song_prefix> part_text = <part_text> difficulty_text_nl = <difficulty_text_nl>
		<songname> = <song_checksum>
	else
		softassert \{'Cash milestones should be quickplay and career only.'}
		return
	endif
	printf 'evaluate_individual_cash_milestones - %p - %n' s = <part_eval> p = <player> n = <songname>
	cash_getstars player = <player>
	<new_stars> = <stars>
	if (($boss_battle) = 0)
		switch <new_stars>
			case 3
			progression_setcashmilestone player = <player> milestone = stars_3_bonus
			case 4
			progression_setcashmilestone player = <player> milestone = stars_4_bonus
			case 5
			progression_setcashmilestone player = <player> milestone = stars_5_bonus
			default
			softassert 'Player %p got %s stars' p = <player> s = <new_stars>
		endswitch
	endif
	if (<part> = vocals)
		getplayerinfo <player> vocal_phrase_quality
		getplayerinfo <player> vocal_phrase_max_qual
		<notes_hit> = (<vocal_phrase_quality> * 100)
		<max_notes> = (<vocal_phrase_max_qual> * 100)
	else
		cash_getinfo player = <player> param = notes_hit func = sum
		cash_getinfo player = <player> param = total_notes func = sum
		getplayerinfo player = <player> max_notes
	endif
	if (<max_notes> > 0)
		if (<notes_hit> = <max_notes>)
			progression_setcashmilestone player = <player> milestone = perfect_bonus
		endif
	endif
	if ($current_song != jamsession)
		cash_count_num_songs_beaten {
			player = <player>
			savegame = <savegame>
			part_text = <part_text>
			game_mode = <type>
			stars_tag = <stars_tag>
			ignore_song = $current_song
		}
		if (<num_songs_played> > 0)
			mod a = <num_songs_played> b = 10
			if (<num_songs_played> = 9)
				progression_setcashmilestone player = <player> milestone = decade
			endif
		endif
	endif
	if ($current_song != jamsession)
		getglobaltags savegame = <savegame> <songname> param = <score_tag>
		<old_score> = (<...>.<score_tag>)
		cash_getscore player = <player>
		<new_score> = <score>
		if (<new_score> > <old_score>)
			progression_setcashmilestone player = <player> milestone = score
		endif
	endif
	cash_getlowesthealth player = <player>
	if (<lowest_health> > (2.0 / 3.0))
		progression_setcashmilestone player = <player> milestone = never_in_red
	endif
	if ($current_song != jamsession && ($boss_battle) = 0)
		getplayerinfo <player> star_power_use_count
		if (<star_power_use_count> = 0)
			progression_setcashmilestone player = <player> milestone = never_used_star_power
		endif
	endif
	cash_getinfo player = <player> param = star_power_amount func = status
	if (<star_power_amount> >= 100.0)
		progression_setcashmilestone player = <player> milestone = full_star_power
	endif
	cash_getbestrun player = <player>
	progression_setcashmilestone player = <player> milestone = note_streak multiplier = (<best_run> / 25)
	cash_gettotalbandstreak player = <player>
	progression_setcashmilestone player = <player> milestone = band_note_streak multiplier = (<total_band_streak> / 25)
	cash_getbeginningrun player = <player>
	if (<beginning_run> >= $hot_start_min_streak)
		progression_setcashmilestone player = <player> milestone = hot_start
	endif
	cash_getcurrentrun player = <player>
	if (<current_run> >= $strong_finish_min_streak)
		progression_setcashmilestone player = <player> milestone = strong_finish
	endif
	if playerinfoequals <player> part = vocals
		getplayerinfo <player> vocal_phrase_quality
		getplayerinfo <player> vocal_phrase_max_qual
		<notes_hit> = (<vocal_phrase_quality> * 100)
		<total_notes> = (<vocal_phrase_max_qual> * 100)
	else
		cash_getinfo player = <player> param = notes_hit func = sum
		cash_getinfo player = <player> param = total_notes func = sum
	endif
	if (<total_notes> > 0)
		<pct_hit> = (100.0 * <notes_hit> / <total_notes>)
		casttointeger \{pct_hit}
		if (<pct_hit> > 100)
			softassert 'Player hit %h notes when the song only has %n notes' h = <notes_hit> n = <total_notes>
			<pct_hit> = 100
		endif
		progression_setcashmilestone player = <player> milestone = percent_hit multiplier = (((<pct_hit> - 75) / 5) + 1)
	endif
	if scriptexists <part_eval>
		printf '%s - %n' s = <part_eval> n = <songname>
		<part_eval> player = <player> savegame = <savegame> songname = <songname>
	endif
endscript

script evaluate_guitar_cash_milestones 
	requireparams \{[
			player
			savegame
			songname
		]
		all}
	if playerinfoequals <player> has_held_notes = 1
		get_current_difficulty player = <player>
		if (<current_difficulty> != easy_rhythm)
			getplayerinfo <player> whammy_every_note
			if (<whammy_every_note> = 1)
				progression_setcashmilestone player = <player> milestone = whammy_every_note
			endif
		endif
		if (<current_difficulty> != easy_rhythm)
			getplayerinfo <player> slide_wah_every_note
			if (<slide_wah_every_note> = 1)
				progression_setcashmilestone player = <player> milestone = slide_wah_every_note
			endif
		endif
	endif
endscript

script cash_has_beaten_song 
	requireparams \{[
			player
			savegame
			song_checksum
			part_text
			game_mode
			stars_tag
		]
		all}
	getarraysize \{$difficulty_list}
	<diff_idx> = 0
	begin
	<difficulty> = ($difficulty_list [<diff_idx>])
	get_difficulty_text_nl difficulty = <difficulty>
	if structurecontains structure = $permanent_songlist_props <song_checksum>
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
			if getglobaltags savegame = <savegame> <songname> param = <stars_tag>
				if ((<...>.<stars_tag>) >= 3)
					return \{has_beaten_song = 1}
				else
					return \{has_beaten_song = 0}
				endif
			endif
		endif
	endif
	<diff_idx> = (<diff_idx> + 1)
	repeat <array_size>
	return \{has_beaten_song = -1}
endscript

script cash_count_num_songs_beaten \{ignore_song = null}
	requireparams \{[
			player
			savegame
			part_text
			game_mode
			stars_tag
		]
		all}
	<num_songs_played> = 0
	getarraysize \{$gh_songlist}
	<i> = 0
	begin
	<song_checksum> = ($gh_songlist [<i>])
	cash_has_beaten_song {
		player = <player>
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
	repeat <array_size>
	return num_songs_played = <num_songs_played>
endscript

script cash_gotsponsoredlastgig 
	requireparams \{[
			player
		]
		all}
	gamemode_gettype
	if (<type> = career)
		if progression_check_for_gig_end
			song_breakdown_check_for_sponsor player = <player>
		endif
	endif
endscript

script cash_getscore 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> score
	casttointeger \{score}
	return score = <score>
endscript

script cash_getstars 
	requireparams \{[
			player
		]
		all}
	<stars> = 0
	if gamemode_isbandscoring
		stars = ($band1_status.stars)
	else
		getplayerinfo <player> stars
	endif
	return stars = <stars>
endscript

script cash_getlowesthealth 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> lowest_health
	return lowest_health = <lowest_health>
endscript

script cash_getcurrentrun 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> current_run
	return current_run = <current_run>
endscript

script cash_getbeginningrun 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> beginning_run
	return beginning_run = <beginning_run>
endscript

script cash_getbestrun 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> best_run
	return best_run = <best_run>
endscript

script cash_gettotalbandstreak 
	requireparams \{[
			player
		]
		all}
	<total_band_streak> = 0
	getbandindexbyplayer player = <player>
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
		band = false}
	requireparams \{[
			param
			player
		]
		all}
	<retval> = {}
	if (<band> = false)
		getplayerinfo <player> <param>
		addparam name = <param> structure_name = retval value = (<...>.<param>)
	elseif (<func> = status)
		getbandindexbyplayer player = <player>
		band_id = ($band_ids [<band_index>])
		addparam name = <param> structure_name = retval value = ($<band_id>.<param>)
	else
		<sum> = 0
		<greatest> = 0
		<least> = 1000000000
		<mean> = 0
		gamemode_getnumplayers
		<player> = 1
		begin
		getplayerinfo <player> <param>
		<curr> = (<...>.<param>)
		<sum> = (<sum> + <curr>)
		if (<curr> > <greatest>)
			<greatest> = <curr>
		endif
		if (<curr> < <least>)
			<least> = <curr>
		endif
		<player> = (<player> + 1)
		repeat <num_players>
		<mean> = (<sum> / <num_players>)
		addparam name = <param> structure_name = retval value = (<...>.<func>)
	endif
	return <retval>
endscript
