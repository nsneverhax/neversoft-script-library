agora_failed_attempts = 0

script agora_get_local_and_other_band_numbers 
	local_band_number = 0
	other_band_number = 0
	getnumplayersingame \{local
		out = X}
	if (<X> > 0)
		getfirstplayer \{local
			out = Player}
		begin
		if (<local_band_number> = 0)
			getplayerinfo <Player> Band out = local_band_number
			break
		endif
		getnextplayer Player = <Player> local
		repeat <X>
		if NOT (<local_band_number> = 0)
			getnumplayersingame \{out = X}
			if (<X> > 0)
				getfirstplayer \{out = Player}
				begin
				if (<other_band_number> = 0)
					getplayerinfo <Player> Band out = temp_band_number
					if NOT (<temp_band_number> = <local_band_number>)
						other_band_number = <temp_band_number>
						break
					endif
				endif
				getnextplayer Player = <Player>
				repeat <X>
			endif
		endif
	endif
	return local_band_number = <local_band_number> other_band_number = <other_band_number>
endscript

script agora_get_type_mode_rules 
	mode = 'none'
	rules = ''
	gamemode_gettype
	switch (<Type>)
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
			case PERFECTIONIST
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
			case band_vs_band
			rules = 'band_vs_band'
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
	return Type = <Type> mode = <mode> rules = <rules>
endscript

script agora_output_checksums 
	bonus_challenges = []
	printf \{qs(0xe1f842cf)}
	GetArraySize \{$progression_gig_list}
	num_zones = <array_Size>
	index = 0
	myval = 0
	begin
	gig_list = (($progression_gig_list [<index>]).gig_list)
	GetArraySize ($<gig_list>)
	num_gigs = <array_Size>
	gig_index = 0
	begin
	bonus_challenge_checksum = ($<gig_list> [<gig_index>])
	value = (<bonus_challenge_checksum>)
	bonus_challenge = {Name = <bonus_challenge_checksum>}
	myval = (<bonus_challenge_checksum>)
	printf qs(0xc3a1b226) a = <bonus_challenge_checksum> b = (<myval>)
	AddArrayElement array = <bonus_challenges> element = <bonus_challenge>
	bonus_challenges = <array>
	gig_index = (<gig_index> + 1)
	repeat <num_gigs>
	index = (<index> + 1)
	repeat <num_zones>
	printf \{qs(0x6f102b1a)}
	NetSessionFunc Obj = xmlkeyarchive func = agorachecksumdump params = {checksumarray = <bonus_challenges>}
endscript

script agora_update 
endscript

script agora_write_stats 
	RequireParams \{[
			song_checksum
		]
		all}
	venue = (($LevelZones.$current_level).Name)
	getnullchecksum
	online = 'false'
	if NOT (($g_lobby_net_state) = local)
		online = 'true'
	endif
	get_song_prefix song = <song_checksum>
	title = <song_prefix>
	GetGlobalTags \{progression_band_info}
	band_id = <band_unique_id>
	agora_get_type_mode_rules
	if (<Type> = competitive)
		get_goal_results_data \{goal = competitive}
		ruleset = ($competitive_rules)
		if NOT StructureContains structure = ($<ruleset>) ranking_criteria
			ScriptAssert \{'agora_write_stats:  competitive ruleset does not have a ranking criteria!!!!!'}
		endif
		song_breakdown_shreddfest_determine_order
		GetArraySize <order>
		order_size = <array_Size>
	else
		order = []
		is_tie = 0
		order_size = 0
	endif
	getnumplayersingame
	if (<num_players> > 1)
		participants_info = []
		getfirstplayer \{out = index}
		begin
		getplayerinfo <index> score
		if (<Type> = competitive)
			if ((($<ruleset>).ranking_criteria) = performance_value)
				gman_getdata goal = competitive Player = <index> Name = performance_value
				elimination_order = 0
			elseif ((($<ruleset>).ranking_criteria) = elimination_order)
				performance_value = 0
				elimination_order = <score>
			endif
		else
			performance_value = 0
			elimination_order = 0
		endif
		getplayerinfo <index> stars
		getplayerinfo <index> notes_hit
		getplayerinfo <index> max_notes
		getplayerinfo <index> best_run
		getplayerinfo <index> sp_phrases_hit
		getplayerinfo <index> sp_phrases_total
		getplayerinfo <index> difficulty
		getplayerinfo <index> part
		if (<part> = vocals)
			getplayerinfo <index> vocals_highway_view
			if NOT gameevent_getlastusedmictype Player = <index>
				specific_mic_type = <nullchecksum>
			endif
		else
			vocals_highway_view = <nullchecksum>
			specific_mic_type = <nullchecksum>
		endif
		getplayerinfo <index> lefty_flip
		get_difficulty_text_nl difficulty = <difficulty>
		difficulty_text = <difficulty_text_nl>
		get_part_text_nl part = <part>
		getplayerinfo <index> Band
		getplayerinfo <index> double_kick_drum
		if isusingheadset index = <index>
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
		getbandinfo <Band> score out = band_score
		GetNetID Player = <index>
		<net_id> = [0 0]
		SetArrayElement ArrayName = net_id index = 0 NewValue = <net_id_first>
		SetArrayElement ArrayName = net_id index = 1 NewValue = <net_id_second>
		if gamemode_iscooperative
			<winner> = 1
		else
			if (<is_tie> = 1)
				<winner> = 1
			elseif (<order_size> > 0)
				if (<Band> = <order> [0].band_num)
					<winner> = 1
				else
					<winner> = 0
				endif
			else
				<winner> = 0
			endif
		endif
		CastToInteger \{score}
		create_agora_character_struct Player = <index>
		new_participant_info = {
			player_id = <net_id>
			score = <score>
			performance_value = <performance_value>
			elimination_order = <elimination_order>
			band_score = <band_score>
			winner = <winner>
			stars = <stars>
			notes_hit = <notes_hit>
			notes_missed = (<max_notes> - <notes_hit>)
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
		getnextplayer Player = <index> out = index
		repeat <num_players>
		agorawritemultiperformance participants_info = <participants_info> title = <title> venue = <venue> mode = <mode> winner = <winner> online = <online>
	else
		getfirstplayer \{out = index}
		getplayerinfo <index> score
		if (<Type> = competitive)
			if ((($<ruleset>).ranking_criteria) = performance_value)
				gman_getdata goal = competitive Player = <index> Name = performance_value
				elimination_order = 0
			elseif ((($<ruleset>).ranking_criteria) = elimination_order)
				performance_value = 0
				elimination_order = <score>
			endif
		else
			performance_value = 0
			elimination_order = 0
		endif
		getplayerinfo <index> stars
		getplayerinfo <index> notes_hit
		getplayerinfo <index> max_notes
		getplayerinfo <index> best_run
		getplayerinfo <index> sp_phrases_hit
		getplayerinfo <index> sp_phrases_total
		getplayerinfo <index> difficulty
		getplayerinfo <index> part
		if (<part> = vocals)
			getplayerinfo <index> vocals_highway_view
			if NOT gameevent_getlastusedmictype Player = <index>
				specific_mic_type = <nullchecksum>
			endif
		else
			vocals_highway_view = <nullchecksum>
			specific_mic_type = <nullchecksum>
		endif
		getplayerinfo <index> lefty_flip
		getplayerinfo <index> Band
		getplayerinfo <index> double_kick_drum
		if isusingheadset index = <index>
			usingheadset = 1
		else
			usingheadset = 0
		endif
		getbandinfo <Band> score out = band_score
		get_difficulty_text_nl difficulty = <difficulty>
		difficulty_text = <difficulty_text_nl>
		get_part_text_nl part = <part>
		CastToInteger \{score}
		GetNetID Player = <index>
		<net_id> = [0 0]
		SetArrayElement ArrayName = net_id index = 0 NewValue = <net_id_first>
		SetArrayElement ArrayName = net_id index = 1 NewValue = <net_id_second>
		create_agora_character_struct Player = <index>
		participant_info = {
			player_id = <net_id>
			score = <score>
			performance_value = <performance_value>
			elimination_order = <elimination_order>
			band_score = <band_score>
			winner = 1
			stars = <stars>
			notes_hit = <notes_hit>
			notes_missed = (<max_notes> - <notes_hit>)
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
		agorawriteperformance mode = <mode> title = <title> participant_info = <participant_info> band_id = <band_id> venue = <venue> online = <online> player_id = <index>
	endif
	Change \{agora_failed_attempts = 0}
endscript

script agorawriteperformance 
	getplayerinfo <player_id> cheat_alwaysslide
	if (<cheat_alwaysslide> = 1)
		AddParams \{alwaysslide_active}
	endif
	getplayerinfo <player_id> cheat_allhopos
	if (<cheat_allhopos> = 1)
		AddParams \{keytar_active}
	endif
	getplayerinfo <player_id> cheat_autokick
	if (<cheat_autokick> = 1)
		AddParams \{autokick_active}
	endif
	getplayerinfo <player_id> cheat_freedrum
	if (<cheat_freedrum> = 1)
		AddParams \{freedrum_active}
	endif
	if ($Cheat_PerformanceMode = 1)
		AddParams \{performance_mode}
	endif
	if ($cheat_invincible = 1)
		AddParams \{nofail_active}
	endif
	if ($cheat_airinstruments = 1)
		AddParams \{air_guitar_active}
	endif
	NetSessionFunc Obj = xmlkeyarchive func = writeagora params = {write_type = WritePerformance <...>}
endscript

script agorawritemultiperformance 
	NetSessionFunc Obj = xmlkeyarchive func = writeagora params = {write_type = writemultiplayermatch <...>}
endscript

script agorawriteupdate 
	printf \{qs(0xe5b5e8d3)}
	printstruct <...>
	NetSessionFunc Obj = xmlkeyarchive func = writeagora params = {write_type = WriteUpdate <...>}
	printf \{qs(0xc2baa364)}
endscript

script test_agora_write_stats 
	printf \{qs(0xa79d8b88)
		s = $game_mode}
	num_players = 8
	participants_info = []
	begin
	score = <index> * 8
	stars = <index> * 8
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
	<net_id> = [0 0]
	SetArrayElement ArrayName = net_id index = 0 NewValue = <net_id_first>
	SetArrayElement ArrayName = net_id index = 1 NewValue = <net_id_second>
	winner = 0
	CastToInteger \{score}
	create_agora_character_struct \{Player = 0}
	new_participant_info = {
		player_id = <net_id>
		score = <score>
		winner = <winner>
		stars = <stars>
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
	getnextplayer Player = <index> out = index
	repeat <num_players>
	WriteMultiPerformance participants_info = <participants_info> title = <title> venue = <venue> mode = <mode> winner = <winner>
endscript
