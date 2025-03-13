agora_failed_attempts = 0

script agora_get_local_and_other_band_numbers 
	local_band_number = 0
	other_band_number = 0
	getnumplayersingame \{local
		out = x}
	if (<x> > 0)
		getfirstplayer \{local
			out = player}
		begin
		if (<local_band_number> = 0)
			getplayerinfo <player> band out = local_band_number
			break
		endif
		getnextplayer player = <player> local
		repeat <x>
		if NOT (<local_band_number> = 0)
			getnumplayersingame \{out = x}
			if (<x> > 0)
				getfirstplayer \{out = player}
				begin
				if (other_band_number = 0)
					getplayerinfo <player> band out = temp_band_number
					if NOT (temp_band_number = <local_band_number>)
						other_band_number = temp_band_number
						break
					endif
				endif
				getnextplayer player = <player>
				repeat <x>
			endif
		endif
	endif
	return local_band_number = <local_band_number> other_band_number = <other_band_number>
endscript

script agora_get_type_mode_rules 
	mode = 'none'
	rules = ''
	gamemode_gettype
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
	getarraysize \{$progression_gig_list}
	num_zones = <array_size>
	index = 0
	myval = 0
	begin
	gig_list = (($progression_gig_list [<index>]).gig_list)
	getarraysize ($<gig_list>)
	num_gigs = <array_size>
	gig_index = 0
	begin
	bonus_challenge_checksum = ($<gig_list> [<gig_index>])
	value = (<bonus_challenge_checksum>)
	bonus_challenge = {name = <bonus_challenge_checksum>}
	myval = (<bonus_challenge_checksum>)
	printf qs(0xc3a1b226) a = <bonus_challenge_checksum> b = (<myval>)
	addarrayelement array = <bonus_challenges> element = <bonus_challenge>
	bonus_challenges = <array>
	gig_index = (<gig_index> + 1)
	repeat <num_gigs>
	index = (<index> + 1)
	repeat <num_zones>
	printf \{qs(0x6f102b1a)}
	netsessionfunc obj = xmlkeyarchive func = agorachecksumdump params = {checksumarray = <bonus_challenges>}
endscript

script agora_update 
	if ($coop_dlc_active = 1)
		return
	endif
	get_current_progression_stars
	getglobaltags \{progression_band_info}
	if NOT get_current_band_name savegame = <savegame>
	endif
	band_id = <band_unique_id>
	bonus_challenges = []
	getarraysize \{$progression_gig_list}
	num_zones = <array_size>
	index = 0
	begin
	gig_list = (($progression_gig_list [<index>]).gig_list)
	getarraysize ($<gig_list>)
	num_gigs = <array_size>
	gig_index = 0
	begin
	bonus_challenge_checksum = ($<gig_list> [<gig_index>])
	getglobaltags <bonus_challenge_checksum> savegame = <savegame>
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
	addarrayelement array = <bonus_challenges> element = <bonus_challenge>
	bonus_challenges = <array>
	gig_index = (<gig_index> + 1)
	repeat <num_gigs>
	index = (<index> + 1)
	repeat <num_zones>
	agorawriteupdate {band_name = <band_name> band_id = <band_id> stars = <total_stars> bonus_challenges = <bonus_challenges>}
endscript

script agora_write_stats 
	requireparams \{[
			song_checksum
		]
		all}
	printf \{qs(0xab65adaf)
		s = $game_mode}
	venue = (($levelzones.$current_level).name)
	getnullchecksum
	online = 'false'
	if NOT (($g_lobby_net_state) = local)
		online = 'true'
	endif
	get_song_prefix song = <song_checksum>
	title = <song_prefix>
	getglobaltags \{progression_band_info}
	band_id = <band_unique_id>
	agora_get_type_mode_rules
	if (<type> = competitive)
		gman_getresultsdata \{goal = competitive}
		ruleset = ($competitive_rules)
		if NOT structurecontains structure = ($<ruleset>) ranking_criteria
			scriptassert \{'agora_write_stats:  competitive ruleset does not have a ranking criteria!!!!!'}
		endif
		song_breakdown_shreddfest_determine_order
		getarraysize <order>
		order_size = <array_size>
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
		if (<type> = competitive)
			if ((($<ruleset>).ranking_criteria) = performance_value)
				gman_getdata goal = competitive player = <index> name = performance_value
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
		getplayerinfo <index> total_notes
		getplayerinfo <index> best_run
		getplayerinfo <index> sp_phrases_hit
		getplayerinfo <index> sp_phrases_total
		getplayerinfo <index> difficulty
		getplayerinfo <index> part
		if (<part> = vocals)
			getplayerinfo <index> vocals_highway_view
			if NOT gameevent_getlastusedmictype player = <index>
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
		getplayerinfo <index> band
		getplayerinfo <index> double_kick_drum
		if isusingheadset index = <index>
			usingheadset = 1
		else
			usingheadset = 0
		endif
		if structurecontains structure = ($gh_songlist_props) <song_checksum>
			if structurecontains structure = ($gh_songlist_props.<song_checksum>) double_kick
				if (($gh_songlist_props.<song_checksum>).double_kick = 0)
					double_kick_drum = 0
				endif
			else
				double_kick_drum = 0
			endif
		endif
		getbandinfo <band> score out = band_score
		getnetid player = <index>
		<net_id> = [0 0]
		setarrayelement arrayname = net_id index = 0 newvalue = <net_id_first>
		setarrayelement arrayname = net_id index = 1 newvalue = <net_id_second>
		if gamemode_iscooperative
			<winner> = 1
		else
			if (<is_tie> = 1)
				<winner> = 1
			elseif (order_size > 0)
				if (<band> = <order> [<order_idx>].band_num)
					<winner> = 1
				else
					<winner> = 0
				endif
			else
				<winner> = 0
			endif
		endif
		casttointeger \{score}
		create_agora_character_struct player = <index>
		new_participant_info = {
			player_id = <net_id>
			score = <score>
			performance_value = <performance_value>
			elimination_order = <elimination_order>
			band_score = <band_score>
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
			vocals_highway_view = <vocals_highway_view>
			specific_mic_type = <specific_mic_type>
			lefty_flip = <lefty_flip>
			double_kick_drum = <double_kick_drum>
			usingheadset = <usingheadset>
			character = <agora_character>
		}
		addarrayelement array = <participants_info> element = <new_participant_info>
		<participants_info> = <array>
		getnextplayer player = <index> out = index
		repeat <num_players>
		agorawritemultiperformance participants_info = <participants_info> title = <title> venue = <venue> mode = <mode> winner = <winner> online = <online>
	else
		getfirstplayer \{out = index}
		getplayerinfo <index> score
		if (<type> = competitive)
			if ((($<ruleset>).ranking_criteria) = performance_value)
				gman_getdata goal = competitive player = <index> name = performance_value
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
		getplayerinfo <index> total_notes
		getplayerinfo <index> best_run
		getplayerinfo <index> sp_phrases_hit
		getplayerinfo <index> sp_phrases_total
		getplayerinfo <index> difficulty
		getplayerinfo <index> part
		if (<part> = vocals)
			getplayerinfo <index> vocals_highway_view
			if NOT gameevent_getlastusedmictype player = <index>
				specific_mic_type = <nullchecksum>
			endif
		else
			vocals_highway_view = <nullchecksum>
			specific_mic_type = <nullchecksum>
		endif
		getplayerinfo <index> lefty_flip
		getplayerinfo <index> band
		getplayerinfo <index> double_kick_drum
		if isusingheadset index = <index>
			usingheadset = 1
		else
			usingheadset = 0
		endif
		getbandinfo <band> score out = band_score
		get_difficulty_text_nl difficulty = <difficulty>
		difficulty_text = <difficulty_text_nl>
		get_part_text_nl part = <part>
		casttointeger \{score}
		getnetid player = <index>
		<net_id> = [0 0]
		setarrayelement arrayname = net_id index = 0 newvalue = <net_id_first>
		setarrayelement arrayname = net_id index = 1 newvalue = <net_id_second>
		create_agora_character_struct player = <index>
		participant_info = {
			player_id = <net_id>
			score = <score>
			performance_value = <performance_value>
			elimination_order = <elimination_order>
			band_score = <band_score>
			winner = 1
			stars = <stars>
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
		agorawriteperformance mode = <mode> title = <title> participant_info = <participant_info> band_id = <band_id> venue = <venue> online = <online> player_id = <index>
	endif
	change \{agora_failed_attempts = 0}
endscript

script agorawriteperformance 
	getplayerinfo <player_id> cheat_alwaysslide
	if (<cheat_alwaysslide> = 1)
		addparams \{alwaysslide_active}
	endif
	getplayerinfo <player_id> cheat_allhopos
	if (<cheat_allhopos> = 1)
		addparams \{keytar_active}
	endif
	getplayerinfo <player_id> cheat_autokick
	if (<cheat_autokick> = 1)
		addparams \{autokick_active}
	endif
	getplayerinfo <player_id> cheat_freedrum
	if (<cheat_freedrum> = 1)
		addparams \{freedrum_active}
	endif
	if ($cheat_performancemode = 1)
		addparams \{performance_mode}
	endif
	if ($cheat_invincible = 1)
		addparams \{nofail_active}
	endif
	if ($cheat_airinstruments = 1)
		addparams \{air_guitar_active}
	endif
	printf \{qs(0xcd1057ea)}
	printstruct <...>
	netsessionfunc obj = xmlkeyarchive func = writeagora params = {write_type = writeperformance <...>}
endscript

script agorawritemultiperformance 
	printf \{qs(0x10f2f233)}
	printstruct <...>
	netsessionfunc obj = xmlkeyarchive func = writeagora params = {write_type = writemultiplayermatch <...>}
endscript

script agorawriteupdate 
	printf \{qs(0xe5b5e8d3)}
	printstruct <...>
	netsessionfunc obj = xmlkeyarchive func = writeagora params = {write_type = writeupdate <...>}
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
	<net_id> = [0 <index>]
	setarrayelement arrayname = net_id index = 0 newvalue = <net_id_first>
	setarrayelement arrayname = net_id index = 1 newvalue = <net_id_second>
	winner = 0
	casttointeger \{score}
	create_agora_character_struct \{player = 0}
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
	addarrayelement array = <participants_info> element = <new_participant_info>
	<participants_info> = <array>
	getnextplayer player = <index> out = index
	repeat <num_players>
	writemultiperformance participants_info = <participants_info> title = <title> venue = <venue> mode = <mode> winner = <winner>
endscript
