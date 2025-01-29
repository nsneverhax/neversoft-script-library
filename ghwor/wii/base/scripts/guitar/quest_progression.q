current_chapter = None

script quest_progression_create_chapter_atoms_array \{savegame = !i1768515945
		async = 0}
	chapter_atoms = []
	<chapter_num> = 1
	<unlock_index> = 0
	GetArraySize \{$quest_progression_unlocks}
	<unlocks_size> = <array_Size>
	begin
	<inner_index> = 0
	GetArraySize ($quest_progression_unlocks [<unlock_index>])
	begin
	formatText checksumName = Name 'chapter_%a_unlock' a = <chapter_num> AddToStringLookup = true
	depends_on = []
	AddArrayElement array = <depends_on> element = {
		Type = Scr
		Scr = quest_progression_check_for_chapter_unlock
		params = {unlock_index = <unlock_index> savegame = <savegame>}
	}
	<depends_on> = <array>
	atom = {
		Name = <Name>
		Type = Scr
		atom_script = quest_progression_career_do_chapter_unlock
		atom_params = {chapter = ($quest_progression_unlocks [<unlock_index>] [<inner_index>]) chapter_num = <chapter_num> savegame = <savegame>}
		depends_on = <depends_on>
	}
	AddArrayElement array = <chapter_atoms> element = <atom>
	chapter_atoms = <array>
	<chapter_num> = (<chapter_num> + 1)
	<inner_index> = (<inner_index> + 1)
	repeat <array_Size>
	<unlock_index> = (<unlock_index> + 1)
	conditional_async_wait async = <async> text = qs(0x43c3e6a9)
	repeat <unlocks_size>
	return chapter_atoms = <chapter_atoms>
endscript

script quest_progression_check_for_chapter_unlock \{unlock_index = !i1768515945
		savegame = !i1768515945}
	quest_progression_get_number_of_completed_chapters savegame = <savegame>
	<required_unlocked> = ($quest_progression_thresholds [<unlock_index>])
	if (<number_of_unlocked_chapters> >= <required_unlocked>)
		return \{true}
	endif
	return \{FALSE}
endscript

script quest_progression_career_do_chapter_unlock \{chapter = !q1768515945
		savegame = !i1768515945}
	chapter_name = ($<chapter>.Name)
	params = {unlocked = 1}
	if console_is_net_career_client
		if ($g_net_song_won_update = 1)
			<params> = (<params> + {chapter_unlocked_this_session = 1})
		endif
	endif
	quest_progression_set_chapter_tags savegame = <savegame> chapter_global = <chapter> params = <params>
	if (<chapter> = quest_chapter_demigod)
		demigod_params = {encore_unlocked = 1 completed = 1}
		if console_is_net_career_client
			if ($g_net_song_won_update = 1)
				<demigod_params> = (<demigod_params> + {encore_unlocked_this_session = 1 encore_completed_this_session = 1})
			endif
		endif
		quest_progression_set_chapter_tags savegame = <savegame> chapter_global = <chapter> params = <demigod_params>
	endif
endscript

script quest_progression_create_reward_atoms_array \{savegame = !i1768515945}
	chapter_tier_num = 0
	GetArraySize ($quest_progression_unlocks) param = num_chapter_tiers
	if (<num_chapter_tiers> = 0)
		return \{chapter_reward_atoms = [
			]}
	endif
	reward_atoms = []
	begin
	chapter_tier = ($quest_progression_unlocks [<chapter_tier_num>])
	chapter_num = 0
	GetArraySize <chapter_tier> param = chapters_in_tier
	if (<chapters_in_tier> > 0)
		begin
		chapter_reward_atoms = []
		chapter_name = (<chapter_tier> [<chapter_num>])
		quest_progression_create_reward_atoms_for_chapter {chapter_name = <chapter_name> savegame = <savegame>}
		reward_atoms = (<reward_atoms> + <chapter_reward_atoms>)
		chapter_num = (<chapter_num> + 1)
		repeat <chapters_in_tier>
	endif
	chapter_tier_num = (<chapter_tier_num> + 1)
	repeat <num_chapter_tiers>
	return chapter_reward_atoms = <reward_atoms>
endscript

script quest_progression_create_reward_atoms_for_chapter \{chapter_name = !q1768515945
		savegame = !i1768515945}
	reward_atoms = []
	chapter_unlocks = (($<chapter_name>).chapter_unlocks)
	GetArraySize <chapter_unlocks> param = num_unlocks
	if (<num_unlocks> = 0)
		return \{chapter_atoms = [
			]}
	endif
	unlock_index = 0
	begin
	unlock_struct = (<chapter_unlocks> [<unlock_index>])
	check_script = nullscript
	switch (<unlock_struct>.reward_when)
		case chapter_unlocked
		check_script = quest_progression_check_chapter_unlocked
		case encore_unlocked
		check_script = quest_progression_check_encore_unlocked
		case encore_completed
		check_script = quest_progression_check_encore_complete
		case chapter_dominated
		check_script = quest_progression_check_chapter_dominated
	endswitch
	depends_on = []
	AddArrayElement array = <depends_on> element = {
		Type = Scr
		Scr = <check_script>
		params = {chapter = <chapter_name> savegame = <savegame>}
	}
	depends_on = <array>
	formatText checksumName = atom_name '%a_reward_%c' a = (($<chapter_name>).Name) c = <unlock_index> AddToStringLookup = true
	atom = {
		Name = <atom_name>
		Type = Scr
		atom_script = do_atomic_reward_unlock
		atom_params = {atomic_reward_data = <unlock_struct> atomic_reward_index = <unlock_index> atom_type = career savegame = <savegame>}
		depends_on = <depends_on>
	}
	AddArrayElement array = <reward_atoms> element = <atom>
	reward_atoms = <array>
	unlock_index = (<unlock_index> + 1)
	repeat <num_unlocks>
	return chapter_reward_atoms = <reward_atoms>
endscript

script quest_progression_check_chapter_unlocked \{chapter = !q1768515945
		savegame = !i1768515945}
	quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <chapter> param = unlocked
	if (<unlocked> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script quest_progression_check_encore_unlocked \{chapter = !q1768515945
		savegame = !i1768515945}
	quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <chapter> param = encore_unlocked
	if (<encore_unlocked> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script quest_progression_check_encore_complete \{chapter = !q1768515945
		savegame = !i1768515945}
	quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <chapter> param = completed
	if (<completed> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script quest_progression_check_chapter_dominated \{chapter = !q1768515945
		savegame = !i1768515945
		this_session_only = 0}
	quest_progression_get_number_of_stars_earned savegame = <savegame> chapter_global = <chapter>
	if (<stars_earned> >= $<chapter>.stars_for_reward)
		if console_is_net_career_client
			<chapter_name> = ($<chapter>.Name)
			formatText checksumName = chapter_unlock '%s' s = <chapter_name>
			if ($g_net_song_won_update = 1)
				temp_struct = ($g_net_career_progression.<chapter_unlock> + {chapter_dominated_this_session = 1})
				appendstruct struct = g_net_career_progression Field = <chapter_unlock> params = <temp_struct> globalstruct
			endif
			if (<this_session_only> = 1)
				if ($g_net_career_progression.<chapter_unlock>.chapter_dominated_this_session = 1)
					return \{true}
				else
					return \{FALSE}
				endif
			else
				return \{true}
			endif
		else
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script quest_progression_check_domination_unlocked \{savegame = !i1768515945}
	quest_progression_get_chapter_tag savegame = <savegame> chapter_global = quest_chapter_finale param = completed
	if (<completed> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script quest_progression_get_number_of_completed_chapters \{savegame = !i1768515945}
	<number_of_chapters> = 0
	<number_of_unlocked_chapters> = 0
	<number_of_dominated_chapters> = 0
	<number_of_dominated_regular_chapters> = 0
	<unlock_index> = 0
	GetArraySize \{$quest_progression_unlocks}
	<unlocks_size> = <array_Size>
	begin
	<inner_index> = 0
	GetArraySize ($quest_progression_unlocks [<unlock_index>])
	<inner_size> = <array_Size>
	begin
	<chapter> = ($quest_progression_unlocks [<unlock_index>] [<inner_index>])
	<chapter_name> = ($<chapter>.Name)
	quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <chapter> param = completed
	quest_progression_get_number_of_stars_earned savegame = <savegame> chapter_global = <chapter>
	if (<completed> = 1)
		<number_of_unlocked_chapters> = (<number_of_unlocked_chapters> + 1)
	endif
	if (<stars_earned> >= $<chapter>.stars_for_reward)
		<number_of_dominated_chapters> = (<number_of_dominated_chapters> + 1)
		if (<chapter> != quest_chapter_midboss)
			if (<chapter> != quest_chapter_finale)
				<number_of_dominated_regular_chapters> = (<number_of_dominated_regular_chapters> + 1)
			endif
		endif
	endif
	<number_of_chapters> = (<number_of_chapters> + 1)
	<inner_index> = (<inner_index> + 1)
	repeat <inner_size>
	<unlock_index> = (<unlock_index> + 1)
	repeat <unlocks_size>
	return number_of_chapters = <number_of_chapters> number_of_unlocked_chapters = <number_of_unlocked_chapters> number_of_dominated_chapters = <number_of_dominated_chapters> number_of_dominated_regular_chapters = <number_of_dominated_regular_chapters>
endscript

script quest_progression_get_number_of_stars_earned \{savegame = !i1768515945
		chapter_global = !q1768515945}
	<chapter_name> = ($<chapter_global>.Name)
	<songs_array> = ($<chapter_global>.songs)
	<stars_earned> = 0
	GetArraySize <songs_array>
	<idx> = 0
	begin
	<song> = (<songs_array> [<idx>])
	get_song_name song = <song>
	format_career_song_gigtag chapter_name = <chapter_name> song_name = <song_name>
	if console_is_net_career_client
		stars = ($g_net_career_progression.<song_gigtag>.stars)
	else
		GetGlobalTags savegame = <savegame> <song_gigtag> param = stars
	endif
	if (<stars> > 0)
		<stars_earned> = (<stars_earned> + <stars>)
	endif
	<idx> = (<idx> + 1)
	repeat <array_Size>
	return stars_earned = <stars_earned>
endscript

script for_each_quest_progression_unlock \{callback = !q1768515945
		spawned = 0
		params = {
		}}
	<outer_index> = 0
	<chapter_num> = 1
	GetArraySize \{$quest_progression_unlocks}
	<unlocks_size> = <array_Size>
	begin
	<inner_index> = 0
	GetArraySize ($quest_progression_unlocks [<outer_index>])
	begin
	<chapter> = ($quest_progression_unlocks [<outer_index>] [<inner_index>])
	if (<spawned> = 1)
		SpawnScriptNow <callback> params = {chapter_global = <chapter> chapter_num = <chapter_num> <params>}
	else
		<callback> chapter_global = <chapter> chapter_num = <chapter_num> <params>
	endif
	<chapter_num> = (<chapter_num> + 1)
	<inner_index> = (<inner_index> + 1)
	repeat <array_Size>
	<outer_index> = (<outer_index> + 1)
	repeat <unlocks_size>
endscript

script quest_progression_get_num_tags 
	<num_gigtags> = 0
	<num_gigsongtags> = 0
	GetArraySize ($quest_progression_unlocks)
	<progression_unlocks_size> = <array_Size>
	<index> = 0
	begin
	<chapter_array> = ($quest_progression_unlocks [<index>])
	GetArraySize <chapter_array>
	<chapter_array_size> = <array_Size>
	<num_gigtags> = (<num_gigtags> + <array_Size>)
	<chapter_index> = 0
	begin
	<songs_struct> = (<chapter_array> [<chapter_index>])
	GetArraySize ($<songs_struct>.songs)
	<num_gigsongtags> = (<num_gigsongtags> + <array_Size>)
	<chapter_index> = (<chapter_index> + 1)
	repeat <chapter_array_size>
	<index> = (<index> + 1)
	repeat <progression_unlocks_size>
	return num_gigtags = <num_gigtags> num_gigsongtags = <num_gigsongtags>
endscript

script quest_progression_check_for_chapter_complete \{savegame = !i1768515945
		chapter_global = !q1768515945}
	<num_songs_completed> = 0
	<total_stars> = 0
	<chapter_name> = ($<chapter_global>.Name)
	<songs_array> = ($<chapter_global>.songs)
	GetArraySize <songs_array>
	<song_array_size> = <array_Size>
	<song_index> = 0
	begin
	<song> = (<songs_array> [<song_index>])
	get_song_name song = <song>
	format_career_song_gigtag chapter_name = <chapter_name> song_name = <song_name>
	if console_is_net_career_client
		stars = ($g_net_career_progression.<song_gigtag>.stars)
	else
		GetGlobalTags savegame = <savegame> <song_gigtag> param = stars
	endif
	if (<stars> > 0)
		<total_stars> = (<total_stars> + <stars>)
	endif
	<song_index> = (<song_index> + 1)
	repeat <song_array_size>
	if (($<chapter_global>.ENCORE) = None)
		return true total_stars = <total_stars>
	endif
	get_song_name song = ($<chapter_global>.ENCORE)
	format_career_song_gigtag chapter_name = <chapter_name> song_name = <song_name>
	if console_is_net_career_client
		stars = ($g_net_career_progression.<song_gigtag>.stars)
	else
		GetGlobalTags savegame = <savegame> <song_gigtag> param = stars
	endif
	if (<stars> > 0)
		return true total_stars = <total_stars>
	endif
	return FALSE total_stars = <total_stars>
endscript

script quest_progression_set_chapter_tags \{savegame = !i1768515945
		chapter_global = !q1768515945
		params = 0x69696969}
	<chapter_name> = ($<chapter_global>.Name)
	formatText checksumName = chapter_unlock '%s' s = <chapter_name>
	if console_is_net_career_client
		temp_struct = ($g_net_career_progression.<chapter_unlock> + <params>)
		appendstruct struct = g_net_career_progression Field = <chapter_unlock> params = <temp_struct> globalstruct
	else
		SetGlobalTags <chapter_unlock> savegame = <savegame> params = <params> Progression = true
	endif
endscript

script quest_progression_get_chapter_tag \{savegame = !i1768515945
		chapter_global = !q1768515945
		param = !q1768515945
		this_session_param = None}
	<chapter_name> = ($<chapter_global>.Name)
	formatText checksumName = chapter_unlock '%s' s = <chapter_name>
	if console_is_net_career_client
		if (<this_session_param> = None)
			AddParam Name = <param> value = ($g_net_career_progression.<chapter_unlock>.<param>)
		else
			AddParam Name = <param> value = ($g_net_career_progression.<chapter_unlock>.<this_session_param>)
		endif
	else
		GetGlobalTags <chapter_unlock> savegame = <savegame> param = <param>
	endif
	<struct> = {}
	AddParam structure_name = struct Name = <param> value = (<...>.<param>)
	return <struct>
endscript

script quest_progression_get_encore_stars_required \{chapter_global = !q1768515945}
	return encore_stars_required = ($<chapter_global>.stars_for_encore)
endscript

script quest_progression_get_transition_level_name 
	formatText checksumName = transition_level_name '%aTran' a = ($LevelZones.$current_level.Name)
	return transition_level_name = <transition_level_name>
endscript

script quest_is_first_chapter_unlocked 
	getsavegamefromcontroller controller = ($primary_controller)
	quest_progression_get_number_of_completed_chapters savegame = <savegame>
	if (<number_of_unlocked_chapters> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script quest_progression_is_chapter_finale 
	gamemode_gettype
	if NOT (<Type> = career)
		return \{FALSE}
	endif
	if NOT ($current_chapter = quest_chapter_finale)
		return \{FALSE}
	endif
	return \{true}
endscript

script quest_progression_is_chapter_rush 
	gamemode_gettype
	if NOT (<Type> = career)
		return \{FALSE}
	endif
	if NOT ($current_chapter = quest_chapter_midboss)
		return \{FALSE}
	endif
	return \{true}
endscript

script quest_progression_is_chapter_credits 
	gamemode_gettype
	if NOT (<Type> = career)
		return \{FALSE}
	endif
	if NOT ($current_chapter = quest_chapter_demigod)
		return \{FALSE}
	endif
	return \{true}
endscript

script quest_progression_is_song_transformation \{song = !q1768515945}
	quest_progression_get_transition_level_name
	if (<song> = <transition_level_name>)
		return \{true}
	endif
	return \{FALSE}
endscript

script quest_progression_check_for_transformation_encore 
	playlist_getcurrentsong
	if quest_progression_is_song_transformation song = <current_song>
		return \{true}
	endif
	return \{FALSE}
endscript

script quest_progression_add_transformation_songs \{chapter_global = !q1768515945}
	if ($g_chapter_encore_anim_flag = 0)
		quest_progression_get_transition_level_name
		playlist_addsong song = <transition_level_name> insert_at = back
		Change \{g_chapter_encore_anim_flag = 1}
		if ($g_e3_demo_flow = 1)
			Change \{g_chapter_encore_anim_flag = 0}
		endif
	endif
	playlist_addsong song = ($<chapter_global>.ENCORE) insert_at = back
endscript

script quest_progression_reset_career_progression_tags {
		controller = ($primary_controller)
	}
	if ($debug_career_transformations = 0)
		getsavegamefromcontroller controller = <controller>
		<current_chapter> = ($current_chapter)
		playlist_getcurrentsong
		quest_progression_get_transition_level_name
		if (<current_song> != $<current_chapter>.ENCORE && <current_song> != <transition_level_name>)
			if console_is_net_career_client
				temp_struct = ($g_net_career_progression.career_progression_tags + {encore_ready = 0})
				appendstruct struct = g_net_career_progression Field = career_progression_tags params = <temp_struct> globalstruct
			else
				SetGlobalTags savegame = <savegame> career_progression_tags params = {encore_ready = 0} Progression = true
			endif
		endif
	endif
endscript

script quest_progression_transform_character 
	quest_progression_set_player_score_attribute \{level = 2}
endscript

script quest_progression_set_player_score_attribute \{level = !i1768515945}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		setplayerinfo <Player> score_attribute_level = <level>
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script quest_progression_find_chapter_from_venue \{venue = !q1768515945}
	GetArraySize ($quest_progression_unlocks)
	<quest_progression_unlocks_size> = <array_Size>
	<unlock_index> = 0
	begin
	GetArraySize ($quest_progression_unlocks [<unlock_index>])
	<inner_unlock_size> = <array_Size>
	<inner_unlock_index> = 0
	begin
	<unlock_chapter> = ($quest_progression_unlocks [<unlock_index>] [<inner_unlock_index>])
	if ($<unlock_chapter>.venue = <venue>)
		return chapter = <unlock_chapter>
		break
	endif
	<inner_unlock_index> = (<inner_unlock_index> + 1)
	repeat <inner_unlock_size>
	<unlock_index> = (<unlock_index> + 1)
	repeat <quest_progression_unlocks_size>
	return \{chapter = error}
endscript

script quest_progression_check_for_demigod_playing 
	playlist_getcurrentsong
	if (<current_song> = $quest_chapter_finale.songs [2])
		if quest_progression_is_chapter_finale
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script quest_progression_demigod_hide_rest_of_band 
	if NOT quest_progression_check_for_demigod_playing
		return
	endif
	band_hide \{Name = drummer}
	band_hide \{Name = vocalist}
	band_hide \{Name = BASSIST}
endscript

script quest_progression_current_chapter_transformed 
	if console_is_net_career_client
		<encore_ready> = ($g_net_career_progression.career_progression_tags.encore_ready)
	else
		GetGlobalTags savegame = ($primary_controller) career_progression_tags param = encore_ready
	endif
	if (<encore_ready> = 1)
		if is_encore_song
			return \{true}
		else
			return \{FALSE}
		endif
	endif
	playlist_getcurrentsong
	if NOT quest_progression_is_song_transformation song = <current_song>
		<current_chapter> = ($current_chapter)
		if quest_progression_check_for_chapter_complete savegame = ($primary_controller) chapter_global = <current_chapter>
			quest_progression_get_number_of_stars_earned savegame = ($primary_controller) chapter_global = <current_chapter>
			if (<stars_earned> >= $<current_chapter>.stars_for_encore)
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script quest_hud_setup_final_battle 
	if ($current_chapter = quest_chapter_finale)
		quest_progression_get_current_song_num
		formatText checksumName = stars_for_song 'stars_for_song%d' d = <song_num>
		if NOT StructureContains structure = $quest_chapter_finale Name = <stars_for_song>
			ScriptAssert 'Missing %a in structure %b!' a = <stars_for_song> b = ($quest_chapter_finale.Name)
		endif
		if ($quest_chapter_finale.<stars_for_song> > 0)
			Change \{is_ampzilla_battle = 1}
		endif
	endif
endscript

script quest_progression_get_current_song_num 
	if NOT GotParam \{current_song}
		playlist_getcurrentsong
	endif
	<current_chapter> = ($current_chapter)
	<songs> = ($<current_chapter>.songs)
	GetArraySize <songs>
	<song_index> = 0
	begin
	<song> = (<songs> [<song_index>])
	if (<song> = <current_song>)
		return song_num = (<song_index> + 1)
	endif
	<song_index> = (<song_index> + 1)
	repeat <array_Size>
	return \{song_num = -1}
endscript

script quest_progression_get_song_stars_for_domination \{chapter = !q1768515945}
	stars_req_per_song = 5
	chapter_data = ($<chapter>)
	stars_for_reward = (<chapter_data>.stars_for_reward)
	songs = (<chapter_data>.songs)
	GetArraySize <songs> param = num_songs
	if (<songs> < 1 || <stars_for_reward> < 1)
		return stars_req_per_song = <stars_req_per_song>
	endif
	stars_req_per_song = (<stars_for_reward> / (<num_songs>))
	Mod a = <stars_req_per_song> b = <num_songs>
	if (<Mod> != 0)
		stars_req_per_song = (<stars_for_reward> / (<num_songs>))
	else
		stars_req_per_song = <stars_req_per_song>
	endif
	if (<stars_req_per_song> > 40)
		stars_req_per_song = 40
	endif
	stars_req_per_song_float = (<stars_req_per_song> * 1.0)
	return {
		stars_req_per_song = <stars_req_per_song>
		stars_req_per_song_float = <stars_req_per_song_float>
	}
endscript

script quest_progression_get_song_stars_for_encore \{chapter = !q1768515945}
	stars_req_per_song = 5
	chapter_data = ($<chapter>)
	stars_for_encore = (<chapter_data>.stars_for_encore)
	songs = (<chapter_data>.songs)
	GetArraySize <songs> param = num_songs
	num_songs = (<num_songs> -1)
	if (<num_songs> < 1 || <stars_for_encore> < 1)
		return stars_req_per_song = <stars_req_per_song>
	endif
	stars_req_per_song = (<stars_for_encore> / (<num_songs>))
	Mod a = <stars_req_per_song> b = <num_songs>
	if (<Mod> != 0)
		stars_req_per_song = (<stars_for_encore> / (<num_songs> - 1))
	else
		stars_req_per_song = <stars_req_per_song>
	endif
	if (<stars_req_per_song> > 40)
		stars_req_per_song = 40
	endif
	stars_req_per_song_float = (<stars_req_per_song> * 1.0)
	return {
		stars_req_per_song = <stars_req_per_song>
		stars_req_per_song_float = <stars_req_per_song_float>
	}
endscript
