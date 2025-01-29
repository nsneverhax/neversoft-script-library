roadie_battle_detailed_stat_setup = [
	{
		var = roadie_score
		text = qs(0xe2c7fd3c)
		format_script = roadie_battle_format_integer_stat
		modes = [
			coop
			competitive
		]
	}
	{
		var = popular_buff
		text = qs(0xc47bb83f)
		format_script = roadie_battle_format_equipment_stat
		modes = [
			coop
			competitive
		]
	}
	{
		var = popular_attack
		text = qs(0x2a53ccb7)
		format_script = roadie_battle_format_equipment_stat
		modes = [
			competitive
		]
	}
	{
		var = buffs_launched
		text = qs(0xa6f5f205)
		format_script = roadie_battle_format_integer_stat
		modes = [
			coop
			competitive
		]
	}
	{
		var = attacks_received
		text = qs(0x4487789d)
		format_script = roadie_battle_format_integer_stat
		modes = [
			coop
			competitive
		]
	}
	{
		var = attacks_sent
		text = qs(0x0323ba03)
		format_script = roadie_battle_format_integer_stat
		modes = [
			competitive
		]
	}
	{
		var = imps_killed
		text = qs(0x840d4f8a)
		format_script = roadie_battle_format_integer_stat
		modes = [
			coop
			competitive
		]
	}
]
roadie_battle_roadie_stat_rgba = [
	224
	165
	73
	255
]
roadie_battle_roadie_stat_font = fontgrid_text_a3
roadie_battle_extra_stat_lines = 1
roadie_battle_formatted_stats = [
]
roadie_battle_formatted_stat_count = 0
roadie_battle_stat_titles = [
]
roadie_battle_raw_stats = [
]
roadie_battle_received_stats_count = 0
roadie_battle_targeted_challenge_score = 0

script roadie_battle_reset_stats 
	Change \{roadie_battle_raw_stats = [
			{
			}
			{
			}
			{
			}
			{
			}
		]}
	Change \{roadie_battle_received_stats_count = 0}
endscript

script roadie_battle_get_roadie_stats 
	RequireParams \{[
			roadie
			param
		]
		all}
	if NOT GotParam \{return_param}
		<return_param> = <param>
	endif
	return_params = {}
	if StructureContains structure = ($roadie_battle_raw_stats [<roadie>]) <param>
		<stat_value> = ($roadie_battle_raw_stats [<roadie>].<param>)
	else
		<stat_value> = 0
	endif
	setstructureparam struct_name = return_params param = <return_param> value = <stat_value>
	return <return_params>
endscript

script roadie_battle_save_roadie_stats \{ds_aid = !i1768515945}
	if roadie_battle_find_roadie_by_aid aid = <ds_aid> assert = true
		SetArrayElement globalarray ArrayName = roadie_battle_raw_stats index = <roadie> NewValue = <...>
		roadie_battle_stats_update_top_score
		Change roadie_battle_received_stats_count = ($roadie_battle_received_stats_count + 1)
		if roadie_battle_received_all_roadie_stats
			broadcastevent \{Type = event_roadie_stats_received}
		endif
	endif
endscript

script roadie_battle_received_all_roadie_stats 
	if ($roadie_battle_received_stats_count = $signed_in_roadie_count)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script roadie_battle_wait_for_stats_received 
	if ($ds_debug_skipped_connection = true)
		return
	endif
	if NOT roadie_battle_received_all_roadie_stats
		SpawnScriptNow \{roadie_battle_wait_for_stats_received_timeout}
		Block \{Type = event_roadie_stats_received}
		KillSpawnedScript \{Name = roadie_battle_wait_for_stats_received_timeout}
	endif
endscript

script roadie_battle_wait_for_stats_received_timeout 
	setscriptcannotpause
	Wait \{1
		Second}
	ScriptAssert \{'timed out waiting for roadie battle stats'}
	broadcastevent \{Type = event_roadie_stats_received}
endscript

script roadie_battle_stats_update_top_score 
	<run_top_score> = -1
	<top_roadies> = []
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	if (<signed_in> = true)
		if StructureContains structure = ($roadie_battle_raw_stats [<roadie>]) roadie_score
			<roadie_score> = ($roadie_battle_raw_stats [<roadie>].roadie_score)
			if (<roadie_score> > <run_top_score>)
				<run_top_score> = <roadie_score>
				<top_roadies> = []
				<top_roadies> = (<top_roadies> + <roadie>)
			elseif (<roadie_score> = <run_top_score>)
				<top_roadies> = (<top_roadies> + <roadie>)
			endif
		else
			return
		endif
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
	playlist_getcurrentsong
	GetGlobalTags <current_song> param = top_roadie_score
	if (<run_top_score> > <top_roadie_score>)
		SetGlobalTags <current_song> params = {top_roadie_score = <run_top_score>}
		GetArraySize <top_roadies>
		<i> = 0
		begin
		<roadie> = (<top_roadies> [<i>])
		roadie_battle_get_roadie_info roadie = <roadie> param = ds_aid
		wiidscommunication :sendmessage roadie_high_score destination_aid = <ds_aid>
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script roadie_battle_generate_formatted_roadie_stats 
	GetArraySize \{$roadie_battle_detailed_stat_setup}
	<stat> = 0
	<stat_strings> = []
	<formatted_stats> = [[] [] [] []]
	getnumplayersingame
	begin
	<stat_params> = ($roadie_battle_detailed_stat_setup [<stat>])
	if ArrayContains array = (<stat_params>.modes) contains = ($roadie_battle_mode)
		AddArrayElement array = <stat_strings> element = (<stat_params>.text)
		<stat_strings> = <array>
		getfirstplayer
		begin
		<player_index> = (<Player> - 1)
		if roadie_battle_find_roadie_for_player Player = <Player>
			<stat_var> = (<stat_params>.var)
			if StructureContains structure = ($roadie_battle_raw_stats [<roadie>]) <stat_var>
				<stat_value> = ($roadie_battle_raw_stats [<roadie>].<stat_var>)
				<format_script> = (<stat_params>.format_script)
				<format_script> stat_value = <stat_value>
			else
				<stat_string> = qs(0x03ac90f0)
			endif
		else
			<stat_string> = qs(0x03ac90f0)
		endif
		<player_formatted_stats> = (<formatted_stats> [<player_index>])
		AddArrayElement array = <player_formatted_stats> element = <stat_string>
		SetArrayElement ArrayName = formatted_stats index = <player_index> NewValue = <array>
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	<stat> = (<stat> + 1)
	repeat <array_Size>
	Change roadie_battle_stat_titles = <stat_strings>
	Change roadie_battle_formatted_stats = <formatted_stats>
	GetArraySize \{$roadie_battle_stat_titles}
	Change roadie_battle_formatted_stat_count = <array_Size>
endscript

script roadie_battle_format_integer_stat \{stat_value = !i1768515945}
	formatText TextName = stat_string qs(0x76b3fda7) d = <stat_value> usecommas
	return stat_string = <stat_string>
endscript

script roadie_battle_format_equipment_stat \{stat_value = !i1768515945}
	if (<stat_value> = -1)
		stat_string = qs(0x6a5cf46c)
	else
		stat_string = ($roadie_battle_equipment_names [<stat_value>])
	endif
	return stat_string = <stat_string>
endscript

script roadie_battle_calculate_roadie_assist \{Player = !i1768515945}
	if NOT inroadiebattlemode
		<assist_points> = 0
		<assist_percentage> = 0
	else
		getplayerinfo <Player> score
		getplayerinfo <Player> roadie_battle_unassisted_score
		<assist_points> = (<score> - <roadie_battle_unassisted_score>)
		if (<score> = 0)
			<assist_percentage> = 0
		else
			<assist_percentage> = ((<assist_points> / <score>) * 100)
			CastToInteger \{assist_percentage}
		endif
		CastToInteger \{assist_points}
	endif
	if (<assist_percentage> < 0)
		<assist_percentage> = 0
	elseif (<assist_percentage> > 100)
		<assist_percentage> = 100
	endif
	return assist_percentage = <assist_percentage> assist_points = <assist_points>
endscript

script save_roadie_rock_record_stats 
	get_savegame_from_controller controller = ($primary_controller)
	if NOT inroadiebattlemode
		SetGlobalTags savegame = <savegame> offline_rock_record params = {roadie_versus_matches = 0}
		SetGlobalTags savegame = <savegame> offline_rock_record params = {roadie_coop_matches = 0}
		SetGlobalTags savegame = <savegame> offline_rock_record params = {roadie_total_score = 0}
		SetGlobalTags savegame = <savegame> offline_rock_record params = {roadie_max_score = 0}
	else
		roadie_battle_wait_for_stats_received
		switch ($roadie_battle_mode)
			case coop
			SetGlobalTags savegame = <savegame> offline_rock_record params = {roadie_versus_matches = 0}
			SetGlobalTags savegame = <savegame> offline_rock_record params = {roadie_coop_matches = 1}
			case competitive
			SetGlobalTags savegame = <savegame> offline_rock_record params = {roadie_versus_matches = 1}
			SetGlobalTags savegame = <savegame> offline_rock_record params = {roadie_coop_matches = 0}
			default
			ScriptAssert \{'unhandled roadie battle mode %m'
				m = $roadie_battle_mode}
			SetGlobalTags savegame = <savegame> offline_rock_record params = {roadie_versus_matches = 0}
			SetGlobalTags savegame = <savegame> offline_rock_record params = {roadie_coop_matches = 0}
		endswitch
		<run_top_score> = 0
		<score_summation> = 0
		<roadie> = 0
		begin
		roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
		if (<signed_in> = true)
			if StructureContains structure = ($roadie_battle_raw_stats [<roadie>]) roadie_score
				<roadie_score> = ($roadie_battle_raw_stats [<roadie>].roadie_score)
				<score_summation> = (<score_summation> + <roadie_score>)
				if (<roadie_score> > <run_top_score>)
					<run_top_score> = <roadie_score>
				endif
			endif
		endif
		<roadie> = (<roadie> + 1)
		repeat $max_roadie_count
		SetGlobalTags savegame = <savegame> offline_rock_record params = {roadie_total_score = <score_summation>}
		SetGlobalTags savegame = <savegame> offline_rock_record params = {roadie_max_score = <run_top_score>}
	endif
endscript

script roadie_battle_get_min_assist_percent_all_players 
	<min_assist_percent> = 100
	getnumplayersingame
	getfirstplayer
	begin
	roadie_battle_calculate_roadie_assist Player = <Player>
	if (<assist_percentage> < <min_assist_percent>)
		<min_assist_percent> = <assist_percentage>
	endif
	getnextplayer Player = <Player>
	repeat <num_players>
	return min_assist_percent = <min_assist_percent>
endscript

script roadie_battle_send_match_results 
	getnumplayersingame
	getfirstplayer
	begin
	roadie_battle_calculate_roadie_assist Player = <Player>
	wiidscommunication :sendmessage {
		roadie_assist_score
		Player = <Player>
		assist_percent = <assist_percentage>
	}
	getnextplayer Player = <Player>
	repeat <num_players>
	if ($roadie_battle_mode = coop)
		roadie_battle_send_match_results_coop
	else
		roadie_battle_send_match_results_competitive
	endif
endscript

script roadie_battle_send_match_results_coop 
	gman_getdata \{goal = quickplay
		Name = targeted_challenge}
	<has_targeted_challenge> = 0
	<challenge_passed> = 0
	<stars_earned> = 0
	if (<targeted_challenge> != NULL)
		<has_targeted_challenge> = 1
		playlist_getcurrentsong
		GetGlobalTags <current_song>
		gman_getinstancesofgoal goal_name = <targeted_challenge>
		if (<goal_instances_size> = 0)
			ScriptAssert \{'targeted goal is not running!'}
		endif
		if (<goal_instances_size> > 0)
			<i> = 0
			begin
			<challenge_id> = (<goal_instances> [<i>])
			if GMan_GoalIsActive goal = <challenge_id>
				gman_challengemanagerfunc goal = quickplay tool = challenges func = get_challenge_score params = {challenge_id = <challenge_id>}
				if (<score_value> >= $roadie_battle_targeted_challenge_score)
					<challenge_passed> = 1
				endif
				gman_getassignedplayer goal_name = <challenge_id>
				gman_getqpsavechecksums song = <current_song> goal_name = <targeted_challenge> assigned_player = <assigned_player>
				<previous_saved_grade> = (<...>.<grade_checksum>)
				if (<previous_saved_grade> > <stars_earned>)
					<stars_earned> = <previous_saved_grade>
				endif
				gman_getgrade goal = <challenge_id>
				if (<pending_grade> > <stars_earned>)
					<stars_earned> = <pending_grade>
				endif
			endif
			<i> = (<i> + 1)
			repeat <goal_instances_size>
		endif
	endif
	wiidscommunication :sendmessage {
		roadie_challenge_results
		has_targeted_challenge = <has_targeted_challenge>
		challenge_passed = <challenge_passed>
		stars_earned = <stars_earned>
	}
	if ($failed_song = 1)
		wiidscommunication :sendmessage \{end_mode
			finish_state = 1}
	else
		wiidscommunication :sendmessage \{end_mode
			finish_state = 0}
	endif
endscript

script roadie_battle_send_match_results_competitive 
	song_breakdown_shreddfest_determine_order
	GetArraySize <order>
	getnumplayersingame
	<index> = 0
	<current_place> = 0
	<previous_score> = -1
	begin
	<Band> = (<order> [<index>].band_num)
	<band_score> = (<order> [<index>].band_result)
	CastToInteger \{band_score}
	if (<band_score> < <previous_score>)
		<current_place> = (<current_place> + 1)
	endif
	<previous_score> = <band_score>
	getfirstplayer
	begin
	if playerinfoequals <Player> Band = <Band>
		if roadie_battle_find_roadie_for_player Player = <Player>
			wiidscommunication :sendmessage {
				end_mode
				finish_state = (2 + <current_place>)
				destination_aid = ($roadie_infos [<roadie>].ds_aid)
			}
		endif
	endif
	getnextplayer Player = <Player>
	repeat <num_players>
	<index> = (<index> + 1)
	repeat <array_Size>
endscript
