agora_failed_attempts = 0
agora_hardwaretypes = [
	unknown
	mic
	vnegi_com
	vkonami_gun
	vdigital_ctrl
	vjoystick
	vnamco_gun
	vanalog_ctrl
	vguitar_ctrl
	vstd_guitar_ctrl
	vdrum_ctrl
	vstd_drum_ctrl
	vfishing_ctrl
	vjog_ctrl
]

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
				if (<other_band_number> = 0)
					getplayerinfo <player> band out = temp_band_number
					if NOT (<temp_band_number> = <local_band_number>)
						other_band_number = <temp_band_number>
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
			case momentum_plus
			rules = 'momentum_plus'
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
	return type = <type> mode = <mode> rules = <rules>
endscript
g_agora_character_id_array = [
]

script agora_character_id_callback 
	if gotparam \{character_id}
		addarrayelement array = ($g_agora_character_id_array) element = <character_id>
		change g_agora_character_id_array = <array>
	endif
endscript

script agora_output_checksums 
	netsessionfunc \{func = stats_init}
	printf \{qs(0xb0e29719)}
	itemarray = []
	header = here_are_the_list_of_characters
	addarrayelement array = <itemarray> element = (<header>)
	itemarray = <array>
	getarraysize ($g_agora_character_id_array)
	if (<array_size> > 0)
		index = 0
		begin
		item = ($g_agora_character_id_array [<index>])
		addarrayelement array = <itemarray> element = (<item>)
		itemarray = <array>
		index = (<index> + 1)
		repeat <array_size>
	endif
	header = here_are_the_list_of_venues
	addarrayelement array = <itemarray> element = (<header>)
	itemarray = <array>
	index = 0
	begin
	if NOT getnthstructureinstructure struct = $levelzones index = <index> out = venuestruct
		break
	endif
	if structurecontains structure = <venuestruct> zone
		addarrayelement array = <itemarray> element = (<venuestruct>.zone)
		itemarray = <array>
	endif
	<index> = (<index> + 1)
	repeat
	header = here_are_the_list_of_instruments
	addarrayelement array = <itemarray> element = (<header>)
	itemarray = <array>
	getarraysize ($part_priority)
	if (<array_size> > 0)
		index = 0
		begin
		item = ($part_priority [<index>])
		addarrayelement array = <itemarray> element = (<item>)
		itemarray = <array>
		index = (<index> + 1)
		repeat <array_size>
	endif
	netsessionfunc obj = xmlkeyarchive func = agorachecksumdump params = {itemarray = <itemarray>}
	printf \{qs(0x1dbf9751)}
endscript

script agora_update 
endscript

script agora_write_stats 
	requireparams \{[
			song_checksum
		]
		all}
	venue = (($levelzones.$current_level).name)
	getnullchecksum
	online = 'false'
	if NOT (($g_lobby_net_state) = local)
		online = 'true'
	endif
	get_song_prefix song = <song_checksum>
	title = <song_prefix>
	getsongtimems
	songdownloaded = 0
	songpatched = 0
	if is_song_downloaded song = <song_checksum>
		songdownloaded = <download>
		songpatched = <patched>
	endif
	getglobaltags \{progression_band_info}
	band_id = <band_unique_id>
	agora_get_type_mode_rules
	if (<type> = competitive)
		get_goal_results_data \{goal = competitive}
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
		getplayerinfo <index> max_notes
		getplayerinfo <index> best_run
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
		hardwaretype = unknown
		if (<part> = vocals)
			hardwaretype = mic
		else
			if playerinfoequals <index> is_local_client = 1
				getplayerinfo <index> controller
				if getcontrollerhardwaretypechecksum controller_index = <controller> out = <hardwaretype>
				endif
			endif
		endif
		if ((<part> = drum) && (<difficulty> = expert) && (<double_kick_drum> != 0))
			difficulty_text = 'expert+'
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
			elseif (<order_size> > 0)
				if (<band> = <order> [0].band_num)
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
		targetedchallenge = 0
		if (<type> = quickplay)
			if gman_goalisactive \{goal = quickplay}
				gman_getdata \{goal = quickplay
					name = targeted_challenge}
				gman_getdata \{goal = quickplay
					name = targeted_challenge_inst_config}
				if ((<targeted_challenge> != null)
						&& ((<targeted_challenge_inst_config> = <part>)
							|| (<targeted_challenge_inst_config> = band)
							|| (<targeted_challenge_inst_config> = traditional_band)))
					targetedchallenge = 1
				endif
			endif
		endif
		targetedscore = 0
		if (<type> = quickplay)
			if gman_goalisactive \{goal = quickplay}
				gman_getdata \{goal = quickplay
					name = targeted_challenge_friend_index}
				if (<targeted_challenge_friend_index> >= 0)
					<targetedscore> = 1
				endif
			endif
		endif
		getplayerinfo <index> cheat_hyperspeed
		getplayerinfo <index> cheat_hyperspeed_value
		getplayerinfo <index> solo_highway_mode
		getplayerinfo <index> cheat_freedrum
		getplayerinfo <index> cheat_allhopos
		getplayerinfo <index> cheat_autokick
		getplayerinfo <index> cheat_alwaysslide
		new_participant_info = {
			player_id = <net_id>
			score = <score>
			cheat_hyperspeed = <cheat_hyperspeed>
			cheat_hyperspeed_value = <cheat_hyperspeed_value>
			solo_highway_mode = <solo_highway_mode>
			cheat_freedrum = <cheat_freedrum>
			cheat_allhopos = <cheat_allhopos>
			cheat_autokick = <cheat_autokick>
			cheat_alwaysslide = <cheat_alwaysslide>
			hardwaretype = <hardwaretype>
			band_score = <band_score>
			winner = <winner>
			stars = <stars>
			failed_attempts = ($agora_failed_attempts)
			difficulty = <difficulty_text>
			part = <part_text>
			vocals_highway_view = <vocals_highway_view>
			specific_mic_type = <specific_mic_type>
			double_kick_drum = <double_kick_drum>
			usingheadset = <usingheadset>
			character = <agora_character>
			targetedchallenge = <targetedchallenge>
			targetedscore = <targetedscore>
		}
		addarrayelement array = <participants_info> element = <new_participant_info>
		<participants_info> = <array>
		getnextplayer player = <index> out = index
		repeat <num_players>
		<cheat_focus_mode> = ($cheat_focusmode)
		if (<cheat_focus_mode> = 1 && <type> = career)
			cheat_focus_mode = 0
		endif
		net_agora_write_multi_performace {
			participants_info = <participants_info>
			title = <title>
			songlength = <time>
			songdownloaded = <songdownloaded>
			songpatched = <songpatched>
			venue = <venue>
			mode = <mode>
			rules = <rules>
			winner = <winner>
			online = <online>
			cheat_nofail = ($cheat_invincible)
			cheat_focusmode = <cheat_focus_mode>
			cheat_hudfreemode = ($cheat_hudfreemode)
			cheat_airinstruments = ($cheat_airinstruments)
			cheat_invisiblecharacters = ($cheat_invisiblecharacters)
			cheat_performancemode = ($cheat_performancemode)
			cheat_soundcheckmode = ($cheat_soundcheckmode)
		}
		change \{agora_failed_attempts = 0}
	elseif (<num_players> = 1)
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
		getplayerinfo <index> part
		hardwaretype = unknown
		if (<part> = vocals)
			hardwaretype = mic
		else
			if playerinfoequals <index> is_local_client = 1
				getplayerinfo <index> controller
				if getcontrollerhardwaretypechecksum controller_index = <controller> out = hardwaretype
				endif
			endif
		endif
		getplayerinfo <index> stars
		getplayerinfo <index> notes_hit
		getplayerinfo <index> max_notes
		getplayerinfo <index> best_run
		getplayerinfo <index> difficulty
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
		if ((<part> = drum) && (<difficulty> = expert) && (<double_kick_drum> != 0))
			difficulty_text = 'expert+'
		endif
		create_agora_character_struct player = <index>
		targetedchallenge = 0
		if (<type> = quickplay)
			if gman_goalisactive \{goal = quickplay}
				gman_getdata \{goal = quickplay
					name = targeted_challenge}
				gman_getdata \{goal = quickplay
					name = targeted_challenge_inst_config}
				if ((<targeted_challenge> != null)
						&& ((<targeted_challenge_inst_config> = <part>)
							|| (<targeted_challenge_inst_config> = band)
							|| (<targeted_challenge_inst_config> = traditional_band)))
					targetedchallenge = 1
				endif
			endif
		endif
		targetedscore = 0
		if (<type> = quickplay)
			if gman_goalisactive \{goal = quickplay}
				gman_getdata \{goal = quickplay
					name = targeted_challenge_friend_index}
				if (<targeted_challenge_friend_index> >= 0)
					<targetedscore> = 1
				endif
			endif
		endif
		getplayerinfo <index> cheat_hyperspeed
		getplayerinfo <index> cheat_hyperspeed_value
		getplayerinfo <index> solo_highway_mode
		getplayerinfo <index> cheat_freedrum
		getplayerinfo <index> cheat_allhopos
		getplayerinfo <index> cheat_autokick
		getplayerinfo <index> cheat_alwaysslide
		participant_info = {
			player_id = <net_id>
			score = <score>
			cheat_hyperspeed = <cheat_hyperspeed>
			cheat_hyperspeed_value = <cheat_hyperspeed_value>
			solo_highway_mode = <solo_highway_mode>
			cheat_freedrum = <cheat_freedrum>
			cheat_allhopos = <cheat_allhopos>
			cheat_autokick = <cheat_autokick>
			cheat_alwaysslide = <cheat_alwaysslide>
			hardwaretype = <hardwaretype>
			band_score = <band_score>
			winner = 1
			stars = <stars>
			failed_attempts = ($agora_failed_attempts)
			difficulty = <difficulty_text>
			part = <part_text>
			vocals_highway_view = <vocals_highway_view>
			specific_mic_type = <specific_mic_type>
			double_kick_drum = <double_kick_drum>
			usingheadset = <usingheadset>
			character = <agora_character>
			targetedchallenge = <targetedchallenge>
			targetedscore = <targetedscore>
		}
		<cheat_focus_mode> = ($cheat_focusmode)
		if (<cheat_focus_mode> = 1 && <type> = career)
			cheat_focus_mode = 0
		endif
		net_agora_write_performance {
			mode = <mode>
			rules = <rules>
			title = <title>
			songlength = <time>
			songdownloaded = <songdownloaded>
			songpatched = <songpatched>
			participant_info = <participant_info>
			band_id = <band_id>
			venue = <venue>
			online = <online>
			cheat_nofail = ($cheat_invincible)
			cheat_focusmode = <cheat_focus_mode>
			cheat_hudfreemode = ($cheat_hudfreemode)
			cheat_airinstruments = ($cheat_airinstruments)
			cheat_invisiblecharacters = ($cheat_invisiblecharacters)
			cheat_performancemode = ($cheat_performancemode)
			cheat_soundcheckmode = ($cheat_soundcheckmode)
			player_id = <index>
		}
		change \{agora_failed_attempts = 0}
	endif
endscript

script net_agora_write_performance 
	netsessionfunc obj = xmlkeyarchive func = writeagora params = {write_type = writeperformance <...>}
endscript

script net_agora_write_multi_performace 
	netsessionfunc obj = xmlkeyarchive func = writeagora params = {write_type = writemultiplayermatch <...>}
endscript

script agorawriteupdate 
	printf \{qs(0xe5b5e8d3)}
	printstruct <...>
	netsessionfunc obj = xmlkeyarchive func = writeagora params = {write_type = writeupdate <...>}
	printf \{qs(0xc2baa364)}
endscript
