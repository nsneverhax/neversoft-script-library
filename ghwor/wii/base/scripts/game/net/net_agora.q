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
			case momentum_plus
			rules = 'momentum_plus'
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
g_agora_character_id_array = [
]

script agora_character_id_callback 
	if GotParam \{character_id}
		AddArrayElement array = ($g_agora_character_id_array) element = <character_id>
		Change g_agora_character_id_array = <array>
	endif
endscript

script agora_update 
endscript

script agora_write_stats 
	RequireParams \{[
			song_checksum
		]
		all}
	if inroadiebattlemode
		return
	endif
	venue = (($LevelZones.$current_level).Name)
	getnullchecksum
	online = 'false'
	if NOT (($g_lobby_net_state) = local)
		online = 'true'
	endif
	get_song_prefix song = <song_checksum>
	title = <song_prefix>
	GetSongTimeMs
	songdownloaded = 0
	songpatched = 0
	if is_song_downloaded song = <song_checksum>
		songdownloaded = <download>
		songpatched = <patched>
	endif
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
		targetedchallenge = 0
		if (<Type> = quickplay)
			if GMan_GoalIsActive \{goal = quickplay}
				gman_getdata \{goal = quickplay
					Name = targeted_challenge}
				gman_getdata \{goal = quickplay
					Name = targeted_challenge_inst_config}
				if ((<targeted_challenge> != NULL)
						&& ((<targeted_challenge_inst_config> = <part>)
							|| (<targeted_challenge_inst_config> = Band)
							|| (<targeted_challenge_inst_config> = traditional_band)))
					targetedchallenge = 1
				endif
			endif
		endif
		targetedscore = 0
		if (<Type> = quickplay)
			if GMan_GoalIsActive \{goal = quickplay}
				gman_getdata \{goal = quickplay
					Name = targeted_challenge_friend_index}
				if (<targeted_challenge_friend_index> >= 0)
					<targetedscore> = 1
				endif
			endif
		endif
		getplayerinfo <index> Cheat_Hyperspeed
		getplayerinfo <index> cheat_hyperspeed_value
		getplayerinfo <index> solo_highway_mode
		getplayerinfo <index> cheat_freedrum
		getplayerinfo <index> cheat_allhopos
		getplayerinfo <index> cheat_autokick
		getplayerinfo <index> cheat_alwaysslide
		new_participant_info = {
			player_id = <net_id>
			score = <score>
			Cheat_Hyperspeed = <Cheat_Hyperspeed>
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
		AddArrayElement array = <participants_info> element = <new_participant_info>
		<participants_info> = <array>
		getnextplayer Player = <index> out = index
		repeat <num_players>
		<cheat_focus_mode> = ($cheat_focusmode)
		if (<cheat_focus_mode> = 1 && <Type> = career)
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
			Cheat_NoFail = ($cheat_invincible)
			cheat_focusmode = <cheat_focus_mode>
			cheat_hudfreemode = ($cheat_hudfreemode)
			cheat_airinstruments = ($cheat_airinstruments)
			cheat_invisiblecharacters = ($cheat_invisiblecharacters)
			Cheat_PerformanceMode = ($Cheat_PerformanceMode)
			cheat_soundcheckmode = ($cheat_soundcheckmode)
		}
		Change \{agora_failed_attempts = 0}
	elseif (<num_players> = 1)
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
		if ((<part> = drum) && (<difficulty> = expert) && (<double_kick_drum> != 0))
			difficulty_text = 'expert+'
		endif
		create_agora_character_struct Player = <index>
		targetedchallenge = 0
		if (<Type> = quickplay)
			if GMan_GoalIsActive \{goal = quickplay}
				gman_getdata \{goal = quickplay
					Name = targeted_challenge}
				gman_getdata \{goal = quickplay
					Name = targeted_challenge_inst_config}
				if ((<targeted_challenge> != NULL)
						&& ((<targeted_challenge_inst_config> = <part>)
							|| (<targeted_challenge_inst_config> = Band)
							|| (<targeted_challenge_inst_config> = traditional_band)))
					targetedchallenge = 1
				endif
			endif
		endif
		targetedscore = 0
		if (<Type> = quickplay)
			if GMan_GoalIsActive \{goal = quickplay}
				gman_getdata \{goal = quickplay
					Name = targeted_challenge_friend_index}
				if (<targeted_challenge_friend_index> >= 0)
					<targetedscore> = 1
				endif
			endif
		endif
		getplayerinfo <index> Cheat_Hyperspeed
		getplayerinfo <index> cheat_hyperspeed_value
		getplayerinfo <index> solo_highway_mode
		getplayerinfo <index> cheat_freedrum
		getplayerinfo <index> cheat_allhopos
		getplayerinfo <index> cheat_autokick
		getplayerinfo <index> cheat_alwaysslide
		participant_info = {
			player_id = <net_id>
			score = <score>
			Cheat_Hyperspeed = <Cheat_Hyperspeed>
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
		if (<cheat_focus_mode> = 1 && <Type> = career)
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
			Cheat_NoFail = ($cheat_invincible)
			cheat_focusmode = <cheat_focus_mode>
			cheat_hudfreemode = ($cheat_hudfreemode)
			cheat_airinstruments = ($cheat_airinstruments)
			cheat_invisiblecharacters = ($cheat_invisiblecharacters)
			Cheat_PerformanceMode = ($Cheat_PerformanceMode)
			cheat_soundcheckmode = ($cheat_soundcheckmode)
			player_id = <index>
		}
		Change \{agora_failed_attempts = 0}
	endif
endscript

script net_agora_write_performance 
	if ($cheat_soundcheckmode = 1)
		AddParams \{soundcheck_mode}
	endif
	NetSessionFunc Obj = xmlkeyarchive func = writeagora params = {write_type = WritePerformance <...>}
endscript

script net_agora_write_multi_performace 
	NetSessionFunc Obj = xmlkeyarchive func = writeagora params = {write_type = writemultiplayermatch <...>}
endscript
