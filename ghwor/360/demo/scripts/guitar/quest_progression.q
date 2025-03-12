current_chapter = none

script quest_progression_create_chapter_atoms_array \{savegame = !i1768515945
		async = 0}
	chapter_atoms = []
	<chapter_num> = 1
	<unlock_index> = 0
	getarraysize \{$quest_progression_unlocks}
	<unlocks_size> = <array_size>
	begin
	<inner_index> = 0
	getarraysize ($quest_progression_unlocks [<unlock_index>])
	begin
	formattext checksumname = name 'chapter_%a_unlock' a = <chapter_num> addtostringlookup = true
	depends_on = []
	addarrayelement array = <depends_on> element = {
		type = scr
		scr = quest_progression_check_for_chapter_unlock
		params = {unlock_index = <unlock_index> savegame = <savegame>}
	}
	<depends_on> = <array>
	atom = {
		name = <name>
		type = scr
		atom_script = quest_progression_career_do_chapter_unlock
		atom_params = {chapter = ($quest_progression_unlocks [<unlock_index>] [<inner_index>]) chapter_num = <chapter_num> savegame = <savegame>}
		depends_on = <depends_on>
	}
	addarrayelement array = <chapter_atoms> element = <atom>
	chapter_atoms = <array>
	<chapter_num> = (<chapter_num> + 1)
	<inner_index> = (<inner_index> + 1)
	repeat <array_size>
	<unlock_index> = (<unlock_index> + 1)
	conditional_async_wait async = <async> text = qs(0x43c3e6a9)
	repeat <unlocks_size>
	return chapter_atoms = <chapter_atoms>
endscript

script quest_progression_check_for_chapter_unlock \{unlock_index = !i1768515945
		savegame = !i1768515945}
	quest_progression_get_number_of_completed_chapters savegame = <savegame>
	if ($g_e3_demo_flow = 1 || $g_kiosk_demo = 1)
		<required_unlocked> = ($g_e3_quest_progression_thresholds [<unlock_index>])
	else
		<required_unlocked> = ($quest_progression_thresholds [<unlock_index>])
	endif
	if (<number_of_unlocked_chapters> >= <required_unlocked>)
		return \{true}
	endif
	return \{false}
endscript

script quest_progression_career_do_chapter_unlock \{chapter = !q1768515945
		savegame = !i1768515945}
	chapter_name = ($<chapter>.name)
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
	getarraysize ($quest_progression_unlocks) param = num_chapter_tiers
	if (<num_chapter_tiers> = 0)
		return \{chapter_reward_atoms = [
			]}
	endif
	reward_atoms = []
	begin
	chapter_tier = ($quest_progression_unlocks [<chapter_tier_num>])
	chapter_num = 0
	getarraysize <chapter_tier> param = chapters_in_tier
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

script quest_progression_check_chapter_unlocked \{chapter = !q1768515945
		savegame = !i1768515945}
	quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <chapter> param = unlocked
	if (<unlocked> = 1)
		return \{true}
	endif
	return \{false}
endscript

script quest_progression_check_encore_unlocked \{chapter = !q1768515945
		savegame = !i1768515945}
	quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <chapter> param = encore_unlocked
	if (<encore_unlocked> = 1)
		return \{true}
	endif
	return \{false}
endscript

script quest_progression_check_encore_complete \{chapter = !q1768515945
		savegame = !i1768515945}
	quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <chapter> param = completed
	if (<completed> = 1)
		return \{true}
	endif
	return \{false}
endscript

script quest_progression_check_chapter_dominated \{chapter = !q1768515945
		savegame = !i1768515945
		this_session_only = 0}
	quest_progression_get_number_of_stars_earned savegame = <savegame> chapter_global = <chapter>
	if (<stars_earned> >= $<chapter>.stars_for_reward)
		if console_is_net_career_client
			<chapter_name> = ($<chapter>.name)
			formattext checksumname = chapter_unlock '%s' s = <chapter_name>
			if ($g_net_song_won_update = 1)
				temp_struct = ($g_net_career_progression.<chapter_unlock> + {chapter_dominated_this_session = 1})
				appendstruct struct = g_net_career_progression field = <chapter_unlock> params = <temp_struct> globalstruct
			endif
			if (<this_session_only> = 1)
				if ($g_net_career_progression.<chapter_unlock>.chapter_dominated_this_session = 1)
					return \{true}
				else
					return \{false}
				endif
			else
				return \{true}
			endif
		else
			return \{true}
		endif
	endif
	return \{false}
endscript

script quest_progression_check_domination_unlocked \{savegame = !i1768515945}
	domination_unlock_chapter = quest_chapter_finale
	return \{false}
	if ($g_e3_demo_flow = 1)
		first_tier = ($quest_progression_unlocks [0])
		first_chapter = (<first_tier> [0])
		domination_unlock_chapter = <first_chapter>
	endif
	quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <domination_unlock_chapter> param = completed
	if (<completed> = 1)
		return \{true}
	endif
	return \{false}
endscript

script quest_progression_get_number_of_completed_chapters \{savegame = !i1768515945}
	<number_of_chapters> = 0
	<number_of_unlocked_chapters> = 0
	<number_of_dominated_chapters> = 0
	<number_of_dominated_regular_chapters> = 0
	<unlock_index> = 0
	getarraysize \{$quest_progression_unlocks}
	<unlocks_size> = <array_size>
	begin
	<inner_index> = 0
	getarraysize ($quest_progression_unlocks [<unlock_index>])
	<inner_size> = <array_size>
	begin
	<chapter> = ($quest_progression_unlocks [<unlock_index>] [<inner_index>])
	<chapter_name> = ($<chapter>.name)
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

script quest_progression_unlock_gig_songs \{savegame = !i1768515945}
	<unlock_index> = 0
	getarraysize \{$quest_progression_unlocks}
	<unlocks_size> = <array_size>
	begin
	<inner_index> = 0
	getarraysize ($quest_progression_unlocks [<unlock_index>])
	<inner_size> = <array_size>
	begin
	<chapter> = ($quest_progression_unlocks [<unlock_index>] [<inner_index>])
	<chapter_name> = ($<chapter>.name)
	quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <chapter> param = completed
	if (<completed> = 1)
		if (<chapter> = quest_chapter_midboss || <chapter> = quest_chapter_finale)
			<songs_array> = ($<chapter>.songs)
			getarraysize <songs_array>
			<song_array_size> = <array_size>
			<song_index> = 0
			<array> = ($g_quest_recent_unlocked_awards)
			begin
			<song> = (<songs_array> [<song_index>])
			setglobaltags savegame = <savegame> <song> params = {unlocked = 1}
			<song_index> = (<song_index> + 1)
			if NOT quest_progression_check_if_reward_added type = song value = <song>
				addarrayelement {
					array = <array>
					element = {
						reward_type = song
						song = <song>
					}
				}
			endif
			repeat <song_array_size>
			change g_quest_recent_unlocked_awards = <array>
		endif
	endif
	<inner_index> = (<inner_index> + 1)
	repeat <inner_size>
	<unlock_index> = (<unlock_index> + 1)
	repeat <unlocks_size>
endscript

script for_each_quest_progression_unlock \{callback = !q1768515945
		spawned = 0
		params = {
		}}
	<outer_index> = 0
	<chapter_num> = 1
	getarraysize \{$quest_progression_unlocks}
	<unlocks_size> = <array_size>
	begin
	<inner_index> = 0
	getarraysize ($quest_progression_unlocks [<outer_index>])
	begin
	<chapter> = ($quest_progression_unlocks [<outer_index>] [<inner_index>])
	if (<spawned> = 1)
		spawnscriptnow <callback> params = {chapter_global = <chapter> chapter_num = <chapter_num> <params>}
	else
		<callback> chapter_global = <chapter> chapter_num = <chapter_num> <params>
	endif
	<chapter_num> = (<chapter_num> + 1)
	<inner_index> = (<inner_index> + 1)
	repeat <array_size>
	<outer_index> = (<outer_index> + 1)
	repeat <unlocks_size>
endscript

script quest_progression_get_num_tags 
	<num_gigtags> = 0
	<num_gigsongtags> = 0
	getarraysize ($quest_progression_unlocks)
	<progression_unlocks_size> = <array_size>
	<index> = 0
	begin
	<chapter_array> = ($quest_progression_unlocks [<index>])
	getarraysize <chapter_array>
	<chapter_array_size> = <array_size>
	<num_gigtags> = (<num_gigtags> + <array_size>)
	<chapter_index> = 0
	begin
	<songs_struct> = (<chapter_array> [<chapter_index>])
	getarraysize ($<songs_struct>.songs)
	<num_gigsongtags> = (<num_gigsongtags> + <array_size>)
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
	<chapter_name> = ($<chapter_global>.name)
	<songs_array> = ($<chapter_global>.songs)
	getarraysize <songs_array>
	<song_array_size> = <array_size>
	<song_index> = 0
	begin
	format_career_song_gigtag chapter_name = <chapter_name> song = (<songs_array> [<song_index>])
	if console_is_net_career_client
		stars = ($g_net_career_progression.<song_gigtag>.stars)
	else
		getglobaltags savegame = <savegame> <song_gigtag> param = stars
	endif
	if (<stars> > 0)
		<total_stars> = (<total_stars> + <stars>)
	endif
	<song_index> = (<song_index> + 1)
	repeat <song_array_size>
	if (($<chapter_global>.encore) = none)
		return true total_stars = <total_stars>
	endif
	format_career_song_gigtag chapter_name = <chapter_name> song = ($<chapter_global>.encore)
	if console_is_net_career_client
		stars = ($g_net_career_progression.<song_gigtag>.stars)
	else
		getglobaltags savegame = <savegame> <song_gigtag> param = stars
	endif
	if (<stars> > 0)
		return true total_stars = <total_stars>
	endif
	return false total_stars = <total_stars>
endscript

script quest_progression_set_chapter_tags \{savegame = !i1768515945
		chapter_global = !q1768515945
		params = 0x69696969}
	<chapter_name> = ($<chapter_global>.name)
	formattext checksumname = chapter_unlock '%s' s = <chapter_name>
	if console_is_net_career_client
		temp_struct = ($g_net_career_progression.<chapter_unlock> + <params>)
		appendstruct struct = g_net_career_progression field = <chapter_unlock> params = <temp_struct> globalstruct
	else
		setglobaltags <chapter_unlock> savegame = <savegame> params = <params> progression = true
	endif
endscript

script quest_progression_get_chapter_tag \{savegame = !i1768515945
		chapter_global = !q1768515945
		param = !q1768515945
		this_session_param = none}
	<chapter_name> = ($<chapter_global>.name)
	formattext checksumname = chapter_unlock '%s' s = <chapter_name>
	if console_is_net_career_client
		if (<this_session_param> = none)
			addparam name = <param> value = ($g_net_career_progression.<chapter_unlock>.<param>)
		else
			addparam name = <param> value = ($g_net_career_progression.<chapter_unlock>.<this_session_param>)
		endif
	else
		getglobaltags <chapter_unlock> savegame = <savegame> param = <param>
	endif
	<struct> = {}
	addparam structure_name = struct name = <param> value = (<...>.<param>)
	return <struct>
endscript

script quest_progression_get_encore_stars_required \{chapter_global = !q1768515945}
	return encore_stars_required = ($<chapter_global>.stars_for_encore)
endscript

script quest_progression_get_transition_level_name 
	formattext checksumname = transition_level_name '%aTran' a = ($levelzones.$current_level.name)
	return transition_level_name = <transition_level_name>
endscript

script quest_is_first_chapter_unlocked 
	getsavegamefromcontroller controller = ($primary_controller)
	quest_progression_get_number_of_completed_chapters savegame = <savegame>
	if (<number_of_unlocked_chapters> = 1)
		return \{true}
	endif
	return \{false}
endscript

script quest_progression_is_chapter_finale 
	gamemode_gettype
	if NOT (<type> = career)
		return \{false}
	endif
	if NOT ($current_chapter = quest_chapter_finale)
		return \{false}
	endif
	return \{true}
endscript

script quest_progression_is_chapter_rush 
	gamemode_gettype
	if NOT (<type> = career)
		return \{false}
	endif
	if NOT ($current_chapter = quest_chapter_midboss)
		return \{false}
	endif
	return \{true}
endscript

script quest_progression_is_chapter_credits 
	gamemode_gettype
	if NOT (<type> = career)
		return \{false}
	endif
	if NOT ($current_chapter = quest_chapter_demigod)
		return \{false}
	endif
	return \{true}
endscript

script quest_progression_is_song_transformation \{song = !q1768515945}
	quest_progression_get_transition_level_name
	if (<song> = <transition_level_name>)
		return \{true}
	endif
	return \{false}
endscript

script quest_progression_check_for_transformation_encore 
	playlist_getcurrentsong
	if quest_progression_is_song_transformation song = <current_song>
		return \{true}
	endif
	return \{false}
endscript

script quest_progression_add_transformation_songs \{chapter_global = !q1768515945}
	if ($g_chapter_encore_anim_flag = 0)
		quest_progression_get_transition_level_name
		playlist_addsong song = <transition_level_name> insert_at = back
		change \{g_chapter_encore_anim_flag = 1}
		if ($g_e3_demo_flow = 1)
			change \{g_chapter_encore_anim_flag = 0}
		endif
	endif
	playlist_addsong song = ($<chapter_global>.encore) insert_at = back
endscript

script quest_progression_reset_career_progression_tags {
		controller = ($primary_controller)
	}
	if ($debug_career_transformations = 0)
		getsavegamefromcontroller controller = <controller>
		<current_chapter> = ($current_chapter)
		playlist_getcurrentsong
		quest_progression_get_transition_level_name
		if (<current_song> != $<current_chapter>.encore && <current_song> != <transition_level_name>)
			if console_is_net_career_client
				temp_struct = ($g_net_career_progression.career_progression_tags + {encore_ready = 0})
				appendstruct struct = g_net_career_progression field = career_progression_tags params = <temp_struct> globalstruct
			else
				setglobaltags savegame = <savegame> career_progression_tags params = {encore_ready = 0} progression = true
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
		setplayerinfo <player> score_attribute_level = <level>
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script quest_progression_check_for_transformation {
		savegame = ($primary_controller)
	}
	<current_chapter> = ($current_chapter)
	<chapter_name> = ($<current_chapter>.name)
	format_career_song_gigtag chapter_name = <chapter_name> song = ($<current_chapter>.encore)
	getglobaltags savegame = <savegame> <song_gigtag> param = stars
	if (<stars> > 0)
		return \{true}
	endif
	return \{false}
endscript

script quest_progression_find_chapter_from_venue \{venue = !q1768515945}
	getarraysize ($quest_progression_unlocks)
	<quest_progression_unlocks_size> = <array_size>
	<unlock_index> = 0
	begin
	getarraysize ($quest_progression_unlocks [<unlock_index>])
	<inner_unlock_size> = <array_size>
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
	return \{false}
endscript

script quest_progression_demigod_hide_rest_of_band 
	if NOT quest_progression_check_for_demigod_playing
		return
	endif
	band_hide \{name = drummer}
	band_hide \{name = vocalist}
	band_hide \{name = bassist}
endscript

script quest_progression_current_chapter_transformed 
	if console_is_net_career_client
		<encore_ready> = ($g_net_career_progression.career_progression_tags.encore_ready)
	else
		getglobaltags savegame = ($primary_controller) career_progression_tags param = encore_ready
	endif
	if (<encore_ready> = 1)
		if is_encore_song
			return \{true}
		else
			return \{false}
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
	return \{false}
endscript

script quest_progression_get_recent_unlocks_by_type \{type = !q1768515945}
	if ((<type> != venue) && (<type> != song) && (<type> != hero))
		scriptassert 'No such career unlock type: %t' t = <type>
	endif
	getarraysize ($g_quest_recent_unlocked_awards)
	<array> = []
	if (<array_size> > 0)
		<i> = 0
		begin
		if (($g_quest_recent_unlocked_awards [<i>].reward_type) = <type>)
			addarrayelement {
				array = <array>
				element = ($g_quest_recent_unlocked_awards [<i>])
			}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return unlocks = <array>
endscript

script quest_progression_check_if_reward_added \{type = !q1768515945
		value = !q1768515945}
	<param> = <type>
	if (<type> = hero)
		<param> = rocker_id
	endif
	<array> = ($g_quest_recent_unlocked_awards)
	<add_to_reward_struct> = 1
	getarraysize <array>
	if (<array_size> > 0)
		<i> = 0
		begin
		if ((<array> [<i>].reward_type) = <type>)
			if ((<array> [<i>].<param>) = <value>)
				return \{true}
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script quest_hud_setup_final_battle 
	if ($current_chapter = quest_chapter_finale)
		quest_progression_get_current_song_num
		formattext checksumname = stars_for_song 'stars_for_song%d' d = <song_num>
		if NOT structurecontains structure = $quest_chapter_finale name = <stars_for_song>
			scriptassert 'Missing %a in structure %b!' a = <stars_for_song> b = ($quest_chapter_finale.name)
		endif
		if ($quest_chapter_finale.<stars_for_song> > 0)
			change \{is_ampzilla_battle = 1}
		endif
	endif
endscript

script quest_progression_get_current_song_num 
	if NOT gotparam \{current_song}
		playlist_getcurrentsong
	endif
	<current_chapter> = ($current_chapter)
	<songs> = ($<current_chapter>.songs)
	getarraysize <songs>
	<song_index> = 0
	begin
	<song> = (<songs> [<song_index>])
	if (<song> = <current_song>)
		return song_num = (<song_index> + 1)
	endif
	<song_index> = (<song_index> + 1)
	repeat <array_size>
	return \{song_num = -1}
endscript

script quest_progression_get_song_stars_for_domination \{chapter = !q1768515945}
	stars_req_per_song = 5
	chapter_data = ($<chapter>)
	stars_for_reward = (<chapter_data>.stars_for_reward)
	songs = (<chapter_data>.songs)
	getarraysize <songs> param = num_songs
	if (<songs> < 1 || <stars_for_reward> < 1)
		return stars_req_per_song = <stars_req_per_song>
	endif
	stars_req_per_song = (<stars_for_reward> / (<num_songs>))
	mod a = <stars_req_per_song> b = <num_songs>
	if (<mod> != 0)
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
	getarraysize <songs> param = num_songs
	num_songs = (<num_songs> -1)
	if (<num_songs> < 1 || <stars_for_encore> < 1)
		return stars_req_per_song = <stars_req_per_song>
	endif
	stars_req_per_song = (<stars_for_encore> / (<num_songs>))
	mod a = <stars_req_per_song> b = <num_songs>
	if (<mod> != 0)
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
