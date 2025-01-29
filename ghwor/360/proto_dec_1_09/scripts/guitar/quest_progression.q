
script quest_progression_create_chapter_atoms_array \{savegame = !i1768515945
		async = 0}
	<atoms> = []
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
		Scr = 0x15026426
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
	AddArrayElement array = <atoms> element = <atom>
	<atoms> = <array>
	<chapter_num> = (<chapter_num> + 1)
	<inner_index> = (<inner_index> + 1)
	repeat <array_Size>
	<unlock_index> = (<unlock_index> + 1)
	conditional_async_wait async = <async> text = qs(0x43c3e6a9)
	repeat <unlocks_size>
	return chapter_atoms = <atoms>
endscript

script 0x04d11016 \{savegame = !i1768515945
		async = 0}
	<atoms> = []
	<chapter_num> = 1
	<unlock_index> = 0
	GetArraySize \{$quest_progression_unlocks}
	<unlocks_size> = <array_Size>
	begin
	<inner_index> = 0
	GetArraySize ($quest_progression_unlocks [<unlock_index>])
	begin
	formatText checksumName = Name 'chapter_encore_%a_unlock' a = <chapter_num> AddToStringLookup = true
	depends_on = []
	AddArrayElement array = <depends_on> element = {
		Type = Scr
		Scr = 0x7f0e6656
		params = {chapter = ($quest_progression_unlocks [<unlock_index>] [<inner_index>]) savegame = <savegame>}
	}
	<depends_on> = <array>
	atom = {
		Name = <Name>
		Type = Scr
		atom_script = quest_progression_career_do_chapter_unlock
		atom_params = {chapter = ($quest_progression_unlocks [<unlock_index>] [<inner_index>]) chapter_num = <chapter_num> savegame = <savegame>}
		depends_on = <depends_on>
	}
	AddArrayElement array = <atoms> element = <atom>
	<atoms> = <array>
	<chapter_num> = (<chapter_num> + 1)
	<inner_index> = (<inner_index> + 1)
	repeat <array_Size>
	<unlock_index> = (<unlock_index> + 1)
	conditional_async_wait async = <async> text = qs(0x43c3e6a9)
	repeat <unlocks_size>
	return chapter_atoms = <atoms>
endscript

script 0x15026426 \{unlock_index = !i1768515945
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
	<chapter_name> = ($<chapter>.Name)
	quest_progression_set_chapter_tags savegame = <savegame> chapter_global = <chapter> params = {unlocked = 1}
	<venue_name> = ($LevelZones.($<chapter>.venue).Name)
	formatText checksumName = venue_checksum 'venue_%s' s = <venue_name>
	SetGlobalTags <venue_checksum> savegame = <savegame> params = {unlocked = 1} Progression = true
	if NOT ($<chapter>.rocker_id = gh_rocker_demigod)
		unlock_profile id = ($<chapter>.rocker_id) savegame = <savegame>
	endif
endscript

script 0x7f0e6656 \{unlock_index = !i1768515945
		savegame = !i1768515945}
endscript

script quest_progression_get_number_of_completed_chapters \{savegame = !i1768515945}
	<number_of_unlocked_chapters> = 0
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
	if (<completed> = 1)
		<number_of_unlocked_chapters> = (<number_of_unlocked_chapters> + 1)
	endif
	<inner_index> = (<inner_index> + 1)
	repeat <inner_size>
	<unlock_index> = (<unlock_index> + 1)
	repeat <unlocks_size>
	return number_of_unlocked_chapters = <number_of_unlocked_chapters>
endscript

script quest_progression_get_number_of_stars_earned \{savegame = !i1768515945
		chapter = !q1768515945}
	<chapter_name> = ($<chapter>.Name)
	<songs_array> = ($<chapter>.songs)
	<stars_earned> = 0
	GetArraySize <songs_array>
	<idx> = 0
	begin
	<song> = (<songs_array> [<idx>])
	get_song_name song = <song>
	format_career_song_gigtag chapter_name = <chapter_name> song_name = <song_name>
	GetGlobalTags savegame = <savegame> <song_gigtag> param = stars
	if (<stars> > 0)
		<stars_earned> = (<stars_earned> + <stars>)
	endif
	<idx> = (<idx> + 1)
	repeat <array_Size>
	return stars_earned = <stars_earned>
endscript

script for_each_quest_progression_unlock \{callback = !q1768515945}
	<outer_index> = 0
	<chapter_num> = 1
	GetArraySize \{$quest_progression_unlocks}
	<unlocks_size> = <array_Size>
	begin
	<inner_index> = 0
	GetArraySize ($quest_progression_unlocks [<outer_index>])
	begin
	<chapter> = ($quest_progression_unlocks [<outer_index>] [<inner_index>])
	<callback> chapter_global = <chapter> chapter_num = <chapter_num>
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
	GetGlobalTags savegame = <savegame> <song_gigtag> param = stars
	if (<stars> > 0)
		<total_stars> = (<total_stars> + <stars>)
	endif
	<song_index> = (<song_index> + 1)
	repeat <song_array_size>
	get_song_name song = ($<chapter_global>.ENCORE)
	format_career_song_gigtag chapter_name = <chapter_name> song_name = <song_name>
	GetGlobalTags savegame = <savegame> <song_gigtag> param = stars
	if (<stars> > 0)
		return true total_stars = <total_stars>
	endif
	return FALSE total_stars = <total_stars>
endscript

script quest_progression_set_chapter_tags \{savegame = !i1768515945
		chapter_global = !q1768515945
		params = 0x69696969}
	<chapter_name> = ($<chapter_global>.Name)
	formatText checksumName = chapter_unlock 'quest_chapter_%s' s = <chapter_name>
	SetGlobalTags <chapter_unlock> savegame = <savegame> params = <params> Progression = true
endscript

script quest_progression_get_chapter_tag \{savegame = !i1768515945
		chapter_global = !q1768515945
		param = !q1768515945}
	<chapter_name> = ($<chapter_global>.Name)
	formatText checksumName = chapter_unlock 'quest_chapter_%s' s = <chapter_name>
	GetGlobalTags <chapter_unlock> savegame = <savegame> param = <param>
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
	quest_progression_get_transition_level_name
	playlist_addsong song = <transition_level_name> insert_at = back
	playlist_addsong song = ($<chapter_global>.ENCORE) insert_at = back
endscript

script quest_progression_reset_career_progression_tags {
		savegame = ($primary_controller)
	}
	SetGlobalTags savegame = <savegame> career_progression_tags params = {encore_ready = 0} Progression = true
endscript

script quest_progression_transform_character 
	quest_progression_set_player_score_attribute \{level = 2}
endscript

script quest_progression_set_player_score_attribute \{level = !i1768515945}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <Player> controller
		if (<controller> = $primary_controller)
			setplayerinfo <Player> score_attribute_level = <level>
			break
		endif
		getnextplayer \{local}
		repeat <num_players>
	endif
endscript

script quest_progression_check_for_transformation \{Player = !i1768515945}
	getplayerinfo <Player> controller
	getsavegamefromcontroller controller = <controller>
	GetGlobalTags savegame = <savegame> career_progression_tags param = current_chapter
	<chapter_name> = ($<current_chapter>.Name)
	get_song_name song = ($<current_chapter>.ENCORE)
	format_career_song_gigtag chapter_name = <chapter_name> song_name = <song_name>
	GetGlobalTags savegame = <savegame> <song_gigtag> param = stars
	if (<stars> > 0)
		return \{true}
	endif
	return \{FALSE}
endscript
