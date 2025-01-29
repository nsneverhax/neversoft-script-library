agora_failed_attempts = 0

script agora_get_local_and_other_band_numbers 
	local_band_number = 0
	other_band_number = 0
	GetNumPlayersInGame \{local
		out = x}
	if (<x> > 0)
		GetFirstPlayer \{local
			out = player}
		begin
		if (<local_band_number> = 0)
			GetPlayerInfo <player> Band out = local_band_number
			break
		endif
		GetNextPlayer player = <player> local
		repeat <x>
		if NOT (<local_band_number> = 0)
			GetNumPlayersInGame \{out = x}
			if (<x> > 0)
				GetFirstPlayer \{out = player}
				begin
				if (other_band_number = 0)
					GetPlayerInfo <player> Band out = temp_band_number
					if NOT (temp_band_number = <local_band_number>)
						other_band_number = temp_band_number
						break
					endif
				endif
				GetNextPlayer player = <player>
				repeat <x>
			endif
		endif
	endif
	return local_band_number = <local_band_number> other_band_number = <other_band_number>
endscript

script agora_get_type_mode_rules 
	mode = 'none'
	rules = ''
	GameMode_GetType
	switch (<type>)
		case quickplay
		mode = 'quickplay'
		case competitive
		mode = 'competitive'
		switch (($competitive_rules))
			case faceoff
			rules = 'faceoff'
			case momentum
			rules = 'momentum'
			case streakers
			rules = 'streakers'
			case do_or_die
			rules = 'do_or_die'
			case perfectionist
			rules = 'perfectionist'
			case elimination
			rules = 'elimination'
			case team_faceoff
			rules = 'team_faceoff'
			case team_momentum
			rules = 'team_momentum'
			case team_streakers
			rules = 'team_streakers'
			case team_do_or_die
			rules = 'team_do_or_die'
			case team_perfectionist
			rules = 'team_perfectionist'
			case team_elimination
			rules = 'team_elimination'
			case p8_pro_faceoff
			rules = 'p8_pro_faceoff'
			default
			rules = 'unknown'
		endswitch
		case career
		mode = 'career'
		case freeplay
		mode = 'freeplay'
		case pro_faceoff
		mode = 'pro_faceoff'
		default
		mode = 'unknown'
	endswitch
	return type = <type> mode = <mode> rules = <rules>
endscript

script agora_output_checksums 
	bonus_challenges = []
	printf \{qs(0xe1f842cf)}
	GetArraySize \{$progression_gig_list}
	num_zones = <array_size>
	index = 0
	myval = 0
	begin
	gig_list = (($progression_gig_list [<index>]).gig_list)
	GetArraySize ($<gig_list>)
	num_gigs = <array_size>
	gig_index = 0
	begin
	bonus_challenge_checksum = ($<gig_list> [<gig_index>])
	value = (<bonus_challenge_checksum>)
	bonus_challenge = {name = <bonus_challenge_checksum>}
	myval = (<bonus_challenge_checksum>)
	printf qs(0xc3a1b226) a = <bonus_challenge_checksum> b = (<myval>)
	AddArrayElement array = <bonus_challenges> element = <bonus_challenge>
	bonus_challenges = <array>
	gig_index = (<gig_index> + 1)
	repeat <num_gigs>
	index = (<index> + 1)
	repeat <num_zones>
	printf \{qs(0x6f102b1a)}
	NetSessionFunc Obj = XmlKeyArchive func = AgoraChecksumDump params = {checksumarray = <bonus_challenges>}
endscript

script agora_update 
	if ($coop_dlc_active = 1)
		return
	endif
	get_current_progression_stars
	GetGlobalTags \{progression_band_info}
	if NOT get_current_band_name savegame = <savegame>
	endif
	band_id = <band_unique_id>
	bonus_challenges = []
	GetArraySize \{$progression_gig_list}
	num_zones = <array_size>
	index = 0
	begin
	gig_list = (($progression_gig_list [<index>]).gig_list)
	GetArraySize ($<gig_list>)
	num_gigs = <array_size>
	gig_index = 0
	begin
	bonus_challenge_checksum = ($<gig_list> [<gig_index>])
	GetGlobalTags <bonus_challenge_checksum> savegame = <savegame>
	bonus_challenge = {
		name = <bonus_challenge_checksum>
		unlocked = <unlocked>
		completed = <completed>
		completed_gold = <completed_gold>
		completed_platinum = <completed_platinum>
		completed_diamond = <completed_diamond>
		encore_unlocked = <encore_unlocked>
		has_been_played = <has_been_played>
		song1_stars_earned = <song1_stars_earned>
	}
	AddArrayElement array = <bonus_challenges> element = <bonus_challenge>
	bonus_challenges = <array>
	gig_index = (<gig_index> + 1)
	repeat <num_gigs>
	index = (<index> + 1)
	repeat <num_zones>
	AgoraWriteUpdate {band_name = <band_name> band_id = <band_id> STARS = <total_stars> bonus_challenges = <bonus_challenges>}
endscript

script agora_write_stats 
	RequireParams \{[
			song_checksum
		]
		all}
	printf \{qs(0xab65adaf)
		s = $game_mode}
	venue = (($LevelZones.$current_level).name)
	GetNullChecksum
	online = 'false'
	if NOT (($g_lobby_net_state) = local)
		online = 'true'
	endif
	get_song_prefix song = <song_checksum>
	Title = <song_prefix>
	GetGlobalTags \{progression_band_info}
	band_id = <band_unique_id>
	agora_get_type_mode_rules
	if (<type> = competitive)
		GMan_GetResultsData \{goal = competitive}
		ruleset = ($competitive_rules)
		if NOT StructureContains structure = ($<ruleset>) ranking_criteria
			ScriptAssert \{'agora_write_stats:  competitive ruleset does not have a ranking criteria!!!!!'}
		endif
		song_breakdown_shreddfest_determine_order
		GetArraySize <order>
		order_size = <array_size>
	else
		order = []
		is_tie = 0
		order_size = 0
	endif
	GetNumPlayersInGame
	if (<num_players> > 1)
		participants_info = []
		GetFirstPlayer \{out = index}
		begin
		GetPlayerInfo <index> score
		if (<type> = competitive)
			if ((($<ruleset>).ranking_criteria) = performance_value)
				GMan_GetData goal = competitive player = <index> name = performance_value
				elimination_order = 0
			elseif ((($<ruleset>).ranking_criteria) = elimination_order)
				performance_value = 0
				elimination_order = <score>
			endif
		else
			performance_value = 0
			elimination_order = 0
		endif
		GetPlayerInfo <index> STARS
		GetPlayerInfo <index> notes_hit
		GetPlayerInfo <index> total_notes
		GetPlayerInfo <index> best_run
		GetPlayerInfo <index> sp_phrases_hit
		GetPlayerInfo <index> sp_phrases_total
		GetPlayerInfo <index> difficulty
		GetPlayerInfo <index> part
		if (<part> = vocals)
			GetPlayerInfo <index> vocals_highway_view
			if NOT GameEvent_GetLastUsedMicType player = <index>
				specific_mic_type = <nullchecksum>
			endif
		else
			vocals_highway_view = <nullchecksum>
			specific_mic_type = <nullchecksum>
		endif
		GetPlayerInfo <index> lefty_flip
		get_difficulty_text_nl difficulty = <difficulty>
		difficulty_text = <difficulty_text_nl>
		get_part_text_nl part = <part>
		GetPlayerInfo <index> Band
		GetPlayerInfo <index> double_kick_drum
		if IsUsingHeadset index = <index>
			usingheadset = 1
		else
			usingheadset = 0
		endif
		if StructureContains structure = ($gh_songlist_props) <song_checksum>
			if StructureContains structure = ($gh_songlist_props.<song_checksum>) double_kick
				if (($gh_songlist_props.<song_checksum>).double_kick = 0)
					double_kick_drum = 0
				endif
			else
				double_kick_drum = 0
			endif
		endif
		GetBandInfo <Band> score out = band_score
		GetNetID player = <index>
		<net_id> = [0 0]
		SetArrayElement arrayName = net_id index = 0 newValue = <net_id_first>
		SetArrayElement arrayName = net_id index = 1 newValue = <net_id_second>
		if GameMode_IsCooperative
			<winner> = 1
		else
			if (<is_tie> = 1)
				<winner> = 1
			elseif (order_size > 0)
				if (<Band> = <order> [<order_idx>].band_num)
					<winner> = 1
				else
					<winner> = 0
				endif
			else
				<winner> = 0
			endif
		endif
		CastToInteger \{score}
		create_agora_character_struct player = <index>
		new_participant_info = {
			player_id = <net_id>
			score = <score>
			performance_value = <performance_value>
			elimination_order = <elimination_order>
			band_score = <band_score>
			winner = <winner>
			STARS = <STARS>
			notes_hit = <notes_hit>
			notes_missed = (<total_notes> - <notes_hit>)
			best_streak = <best_run>
			failed_attempts = ($agora_failed_attempts)
			sp_phrases_hit = <sp_phrases_hit>
			sp_phrases_total = <sp_phrases_total>
			difficulty = <difficulty_text>
			part = <part_text>
			vocals_highway_view = <vocals_highway_view>
			specific_mic_type = <specific_mic_type>
			lefty_flip = <lefty_flip>
			double_kick_drum = <double_kick_drum>
			usingheadset = <usingheadset>
			character = <agora_character>
		}
		AddArrayElement array = <participants_info> element = <new_participant_info>
		<participants_info> = <array>
		GetNextPlayer player = <index> out = index
		repeat <num_players>
		AgoraWriteMultiPerformance participants_info = <participants_info> Title = <Title> venue = <venue> mode = <mode> winner = <winner> online = <online>
	else
		GetFirstPlayer \{out = index}
		GetPlayerInfo <index> score
		if (<type> = competitive)
			if ((($<ruleset>).ranking_criteria) = performance_value)
				GMan_GetData goal = competitive player = <index> name = performance_value
				elimination_order = 0
			elseif ((($<ruleset>).ranking_criteria) = elimination_order)
				performance_value = 0
				elimination_order = <score>
			endif
		else
			performance_value = 0
			elimination_order = 0
		endif
		GetPlayerInfo <index> STARS
		GetPlayerInfo <index> notes_hit
		GetPlayerInfo <index> total_notes
		GetPlayerInfo <index> best_run
		GetPlayerInfo <index> sp_phrases_hit
		GetPlayerInfo <index> sp_phrases_total
		GetPlayerInfo <index> difficulty
		GetPlayerInfo <index> part
		if (<part> = vocals)
			GetPlayerInfo <index> vocals_highway_view
			if NOT GameEvent_GetLastUsedMicType player = <index>
				specific_mic_type = <nullchecksum>
			endif
		else
			vocals_highway_view = <nullchecksum>
			specific_mic_type = <nullchecksum>
		endif
		GetPlayerInfo <index> lefty_flip
		GetPlayerInfo <index> Band
		GetPlayerInfo <index> double_kick_drum
		if IsUsingHeadset index = <index>
			usingheadset = 1
		else
			usingheadset = 0
		endif
		GetBandInfo <Band> score out = band_score
		get_difficulty_text_nl difficulty = <difficulty>
		difficulty_text = <difficulty_text_nl>
		get_part_text_nl part = <part>
		CastToInteger \{score}
		GetNetID player = <index>
		<net_id> = [0 0]
		SetArrayElement arrayName = net_id index = 0 newValue = <net_id_first>
		SetArrayElement arrayName = net_id index = 1 newValue = <net_id_second>
		create_agora_character_struct player = <index>
		participant_info = {
			player_id = <net_id>
			score = <score>
			performance_value = <performance_value>
			elimination_order = <elimination_order>
			band_score = <band_score>
			winner = 1
			STARS = <STARS>
			notes_hit = <notes_hit>
			notes_missed = (<total_notes> - <notes_hit>)
			best_streak = <best_run>
			failed_attempts = ($agora_failed_attempts)
			sp_phrases_hit = <sp_phrases_hit>
			sp_phrases_total = <sp_phrases_total>
			difficulty = <difficulty_text>
			part = <part_text>
			vocals_highway_view = <vocals_highway_view>
			specific_mic_type = <specific_mic_type>
			lefty_flip = <lefty_flip>
			double_kick_drum = <double_kick_drum>
			usingheadset = <usingheadset>
			character = <agora_character>
		}
		AgoraWritePerformance mode = <mode> Title = <Title> participant_info = <participant_info> band_id = <band_id> venue = <venue> online = <online> player_id = <index>
	endif
	Change \{agora_failed_attempts = 0}
endscript

script AgoraWritePerformance 
	GetPlayerInfo <player_id> Cheat_AlwaysSlide
	if (<Cheat_AlwaysSlide> = 1)
		AddParams \{alwaysslide_active}
	endif
	GetPlayerInfo <player_id> Cheat_allHOPOs
	if (<Cheat_allHOPOs> = 1)
		AddParams \{keytar_active}
	endif
	GetPlayerInfo <player_id> Cheat_AutoKick
	if (<Cheat_AutoKick> = 1)
		AddParams \{autokick_active}
	endif
	GetPlayerInfo <player_id> Cheat_FreeDrum
	if (<Cheat_FreeDrum> = 1)
		AddParams \{freedrum_active}
	endif
	if ($Cheat_PerformanceMode = 1)
		AddParams \{performance_mode}
	endif
	if ($Cheat_Invincible = 1)
		AddParams \{nofail_active}
	endif
	if ($Cheat_AirInstruments = 1)
		AddParams \{air_guitar_active}
	endif
	printf \{qs(0xcd1057ea)}
	printstruct <...>
	NetSessionFunc Obj = XmlKeyArchive func = WriteAgora params = {write_type = WritePerformance <...>}
endscript

script AgoraWriteMultiPerformance 
	printf \{qs(0x10f2f233)}
	printstruct <...>
	NetSessionFunc Obj = XmlKeyArchive func = WriteAgora params = {write_type = WriteMultiplayerMatch <...>}
endscript

script AgoraWriteUpdate 
	printf \{qs(0xe5b5e8d3)}
	printstruct <...>
	NetSessionFunc Obj = XmlKeyArchive func = WriteAgora params = {write_type = WriteUpdate <...>}
	printf \{qs(0xc2baa364)}
endscript

script test_agora_write_stats 
	printf \{qs(0xa79d8b88)
		s = $game_mode}
	num_players = 8
	participants_info = []
	begin
	score = <index> * 8
	STARS = <index> * 8
	notes_hit = <index> * 8
	total_notes = <index> * 8
	best_run = <index> * 8
	sp_phrases_hit = <index> * 8
	sp_phrases_total = <index> * 8
	difficulty = <index> * 8
	part = <index> * 8
	lefty_flip = <index> * 8
	difficulty_text = qs(0x9b9559e1)
	part = qs(0x990435b2)
	controller = 0
	<net_id> = [0 <index>]
	SetArrayElement arrayName = net_id index = 0 newValue = <net_id_first>
	SetArrayElement arrayName = net_id index = 1 newValue = <net_id_second>
	winner = 0
	CastToInteger \{score}
	create_agora_character_struct \{player = 0}
	new_participant_info = {
		player_id = <net_id>
		score = <score>
		winner = <winner>
		STARS = <STARS>
		notes_hit = <notes_hit>
		notes_missed = (<total_notes> - <notes_hit>)
		best_streak = <best_run>
		failed_attempts = ($agora_failed_attempts)
		sp_phrases_hit = <sp_phrases_hit>
		sp_phrases_total = <sp_phrases_total>
		difficulty = <difficulty_text>
		part = <part_text>
		lefty_flip = <lefty_flip>
		character = <agora_character>
	}
	AddArrayElement array = <participants_info> element = <new_participant_info>
	<participants_info> = <array>
	GetNextPlayer player = <index> out = index
	repeat <num_players>
	WriteMultiPerformance participants_info = <participants_info> Title = <Title> venue = <venue> mode = <mode> winner = <winner>
endscript
