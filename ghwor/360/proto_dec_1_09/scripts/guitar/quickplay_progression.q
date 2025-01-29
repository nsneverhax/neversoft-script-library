g_quickplay_rewards_just_unlocked = [
]

script create_quickplay_rewards_atoms_array \{async = 0}
	GetArraySize \{$award_point_progression}
	createlocalarray Name = atoms Type = struct size = <array_Size>
	index = 0
	begin
	formatText checksumName = Name 'quickplay_reward_%a_unlock' a = (<index> + 1) AddToStringLookup = true
	depends_on = []
	AddArrayElement array = <depends_on> element = {
		Type = Scr
		Scr = progression_quickplay_check_reward_unlock
		params = {($award_point_progression [<index>]) savegame = <savegame>}
	}
	depends_on = <array>
	atom = {
		Name = <Name>
		Type = Scr
		atom_script = 0xd60327a2
		atom_params = {reward_data = ($award_point_progression [<index>]) reward_progression_index = <index> Name = <Name> savegame = <savegame>}
		depends_on = <depends_on>
	}
	SetArrayElement ArrayName = atoms index = <index> NewValue = <atom>
	index = (<index> + 1)
	conditional_async_wait async = <async> text = qs(0xb16bb15e)
	repeat <array_Size>
	return completed_atoms_array = <atoms>
endscript

script progression_quickplay_check_reward_unlock 
	criteria_passed = 0
	GetGlobalTags career_progression_tags param = total_award_points savegame = <savegame> noassert = 1
	if (<total_award_points> >= <award_points>)
		return \{true}
	endif
	return \{FALSE}
endscript

script 0xd60327a2 \{reward_data = 0x69696969
		reward_progression_index = !i1768515945
		savegame = !i1768515945}
	rewards_array = (<reward_data>.rewards)
	GetArraySize <rewards_array>
	if (<array_Size> > 0)
		index = 0
		begin
		0xd6692308 reward_struct = (<rewards_array> [<index>]) savegame = <savegame>
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
	reward_data = (<reward_data> + {reward_progression_index = <reward_progression_index>})
	progression_award_points_add_just_unlocked_item reward_struct = <reward_data> player_savegame = <savegame>
endscript

script progression_award_points_add_just_unlocked_item 
	gamemode_gettype
	if (<Type> != quickplay)
		return
	endif
	temp_array = ($g_quickplay_rewards_just_unlocked)
	reward_struct = {<reward_struct> savegame = <player_savegame>}
	AddArrayElement array = <temp_array> element = <reward_struct>
	Change g_quickplay_rewards_just_unlocked = <array>
endscript

script progression_quickplay_get_rewards_just_unlocked \{Player = -1}
	if (<Player> = -1)
		return rewards_just_unlocked = ($g_quickplay_rewards_just_unlocked)
	endif
	printf \{'get rewards just unlocked'
		channel = jrdebug}
	getplayerinfo <Player> controller
	getsavegamefromcontroller controller = <controller>
	array = []
	unlocks = ($g_quickplay_rewards_just_unlocked)
	GetArraySize <unlocks>
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<unlocks> [<i>]).savegame = <savegame>)
			printf \{'adding one'
				channel = jrdebug}
			printstruct <...> channel = jrdebug
			AddArrayElement array = <array> element = (<unlocks> [<i>])
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	printf \{'done'
		channel = jrdebug}
	printstruct <...> channel = jrdebug
	return rewards_just_unlocked = <array>
endscript

script progression_quickplay_clear_rewards_just_unlocked 
	printf \{'CLEARING REWARDS'
		channel = jrdebug}
	Change \{g_quickplay_rewards_just_unlocked = [
		]}
endscript

script quickplay_get_awards_for_song \{song_name = !q1768515945
		Player = !i1768515945}
	if song_is_jamsession song = <song_name>
		return
	endif
	gman_getsongchallengeprops song_name = <song_name>
	instruments = [guitar , bass , drum , vocals , Band]
	GetArraySize <instruments>
	0x664a6c1c = <array_Size>
	num_challenges = 0
	i = 0
	begin
	current_instrument = (<instruments> [<i>])
	challenges = (<challenge_props>.<current_instrument>)
	GetArraySize <challenges>
	<num_challenges> = (<num_challenges> + <array_Size>)
	i = (<i> + 1)
	repeat <0x664a6c1c>
	0xea0673c4 \{grade = 3}
	<awards_total> = (<award_points> * <num_challenges>)
	awards_earned = 0
	if NOT GotParam \{controller}
		getplayerinfo <Player> controller
	endif
	getsavegamefromcontroller controller = <controller>
	GetGlobalTags savegame = <savegame> <song_name>
	i = 1
	begin
	if (<i> < 10)
		formatText checksumName = grade_checksum 'challenge0%s_grade' s = <i>
	else
		formatText checksumName = grade_checksum 'challenge%s_grade' s = <i>
	endif
	grade = (<...>.<grade_checksum>)
	awards_earned = (<awards_earned> + <grade>)
	i = (<i> + 1)
	repeat <num_challenges>
	return num_challenges = <num_challenges> awards_earned = <awards_earned> awards_total = <awards_total>
endscript

script quickplay_get_recent_award_points \{Player = !i1768515945}
	getplayerinfo <Player> recent_award_points
	return recent_award_points = <recent_award_points>
endscript

script quickplay_get_overall_awards_progress \{Player = !i1768515945}
	get_current_progression_award_points savegame = <savegame>
	current_award_points_level = -1
	next_award_points_threshold = -1
	GetArraySize ($award_point_progression)
	if (<array_Size> > 0)
		<index> = 0
		begin
		award_struct = ($award_point_progression [<index>])
		if (<award_struct>.award_points > <total_award_points>)
			current_award_points_level = (<index> + 1)
			next_award_points_threshold = (<award_struct>.award_points)
			break
		endif
		index = (<index> + 1)
		repeat <array_Size>
	endif
	if (<current_award_points_level> = -1)
		current_award_points_level = <array_Size>
		next_award_points_threshold = <total_award_points>
	endif
	return {
		current_award_points_total = <total_award_points>
		current_award_points_level = <current_award_points_level>
		next_award_points_threshold = <next_award_points_threshold>
	}
endscript

script 0xea0673c4 \{grade = !i1768515945}
	return award_points = ($0x084270c2 [<grade> -1])
endscript

script quickplay_complete_all_current_challenges 
	getnumplayersingame \{local}
	getfirstplayer \{local}
	begin
	gman_getgoalsbyplayer Player = <Player>
	if (0 = <goals_by_player_size>)
		return
	endif
	index = 0
	begin
	gman_setpendinggrade goal = (<goals_by_player> [<index>]) grade = 3
	index = (<index> + 1)
	repeat <goals_by_player_size>
	getnextplayer Player = <Player> local
	repeat <num_players>
endscript

script quickplay_get_best_stars_for_song \{song = !q1768515945}
	<best_stars> = 0
	<instrument> = None
	GetArraySize ($difficulty_list) param = difficulty_size
	<difficulty_index> = 0
	<instrument_list> = [guitar bass drum vocals Band]
	get_song_prefix song = <song>
	if (<difficulty_size> > 0)
		begin
		<diff> = ($difficulty_list [<difficulty_index>])
		get_difficulty_text_nl difficulty = <diff>
		GetArraySize <instrument_list> param = instrument_size
		<instrument_index> = 0
		begin
		<part> = (<instrument_list> [<instrument_index>])
		0x4cb6620f {
			song_prefix = <song_prefix>
			difficulty_text_nl = <difficulty_text_nl>
			part = ($instrument_list.<part>.text_nl)
		}
		if (<setlist_beststars> > <best_stars>)
			<best_stars> = <setlist_beststars>
			<instrument> = <part>
		endif
		<instrument_index> = (<instrument_index> + 1)
		repeat <instrument_size>
		<difficulty_index> = (<difficulty_index> + 1)
		repeat <difficulty_size>
	endif
	return best_stars = <best_stars> instrument = <instrument>
endscript
