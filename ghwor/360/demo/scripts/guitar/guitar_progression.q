
script reset_progression_atoms \{savegame = !i1768515945
		force_update = 1
		async = 0}
	conditional_async_wait async = <async> text = qs(0x8a973a5a)
	lockglobaltags \{push_progression_writes_only}
	conditional_async_wait async = <async> text = qs(0xa1ba6999)
	completed_atoms_array = []
	create_player_progression_atoms {savegame = <savegame> completed_atoms_array = <completed_atoms_array> async = <async>}
	conditional_async_wait async = <async> text = qs(0xb8a158d8)
	if NOT gotparam \{completed_atoms_array}
		printf \{'setup_progression_atoms Error: No atoms were loaded or created'}
		return
	endif
	conditional_async_wait async = <async> text = qs(0xf7e0ce1f)
	registeratoms savegame = <savegame> atoms = <completed_atoms_array>
	conditional_async_wait async = <async> text = qs(0xeefbff5e)
	lockglobaltags \{pop_progression_writes_only}
	conditional_async_wait async = <async> text = qs(0xc5d6ac9d)
	if (<force_update> = 1)
		updateatoms savegame = <savegame>
	endif
	conditional_async_wait async = <async> text = qs(0xdccd9ddc)
endscript

script update_active_players_atoms \{async = 0}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		get_savegame_from_player player = <player>
		updateatoms savegame = <savegame>
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
		updateatoms savegame = <savegame> global_atoms = 1
		getnextplayer local player = <player>
		repeat <num_players>
	endif
endscript

script create_player_progression_atoms \{savegame = !i1768515945
		completed_atoms_array = !a1768515945
		async = 0}
	conditional_async_wait async = <async> text = qs(0x1780bad2)
	quest_progression_create_chapter_atoms_array savegame = <savegame> async = <async>
	quest_progression_create_reward_atoms_array savegame = <savegame>
	return completed_atoms_array = (<completed_atoms_array> + <chapter_atoms> + <chapter_reward_atoms>)
endscript
career_rewards_just_unlocked = [
]

script do_atomic_reward_unlock \{atomic_reward_data = 0x69696969
		atomic_reward_index = !i1768515945
		atom_type = !q1768515945
		savegame = !i1768515945}
	rewards_array = (<atomic_reward_data>.rewards)
	if NOT gotparam \{rewards_array}
		return
	endif
	if console_is_net_career_client
		if ($g_net_career_ignore_unlock_atoms = 1)
			return
		endif
	endif
	atom_savegame = <savegame>
	getnumplayersingame \{local}
	new_unlock = 0
	getarraysize <rewards_array>
	if (<array_size> > 0)
		index = 0
		begin
		do_single_reward_unlock {reward_atom = <atomic_reward_data> current_reward = (<rewards_array> [<index>]) reward_index = <atomic_reward_index> savegame = <savegame>}
		if (<num_players> > 1 && <atom_type> = career && $g_net_career_ignore_unlock_atoms = 0)
			getfirstplayer \{local}
			begin
			getplayerinfo <player> controller
			get_savegame_from_controller controller = <controller>
			if (<savegame> != <atom_savegame>)
				do_single_reward_unlock {reward_atom = <atomic_reward_data> current_reward = (<rewards_array> [<index>]) reward_index = <atomic_reward_index> savegame = <savegame>}
			endif
			getnextplayer player = <player> local
			repeat <num_players>
			savegame = <atom_savegame>
		endif
		if (<new_item_unlocked> = 1)
			new_unlock = 1
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	reward_data = (<atomic_reward_data> + {reward_index = <atomic_reward_index>})
	gamemode_gettype
	if (<type> = quickplay && <atom_type> = quickplay)
		progression_award_points_add_just_unlocked_item reward_struct = <reward_data> player_savegame = <savegame>
	elseif (<type> = career && <atom_type> = career)
		if structurecontains \{structure = atomic_reward_data
				unlock_text}
			recent_career_unlocks = []
			addarrayelement {
				array = <recent_career_unlocks>
				element = <atomic_reward_data>
			}
			change g_quest_recent_unlocked_awards = <array>
		endif
	endif
endscript

script do_single_reward_unlock \{reward_atom = 0x69696969
		current_reward = 0x69696969
		reward_index = !i1768515945
		savegame = !i1768515945}
	if NOT structurecontains \{structure = current_reward
			reward_type}
		return \{new_item_unlocked = 0}
	endif
	getarraysize ($g_autotest_career_powers) param = career_powers_size
	if ($autotest_on = 1 || $g_autotest_quickplay_challenges = 1 || <career_powers_size> > 0)
		return \{new_item_unlocked = 0}
	endif
	reward_type = (<current_reward>.reward_type)
	gamemode_gettype
	if (<type> = quickplay)
		if get_progression_player_and_controller savegame = <savegame>
			if (cas = <reward_type>)
				if unlock_tracker_sort_cas reward_struct = <current_reward> check_array = cas
					<reward_type> = cas
				elseif unlock_tracker_sort_cas reward_struct = <current_reward> check_array = cai
					<reward_type> = cai
				endif
			endif
			broadcastevent type = unlock_item_type data = {player = <player> controller_index = <controller_index> item_name = (<reward_atom>.name) item_type = <reward_type>}
		endif
	endif
	new_item_unlocked = 0
	switch (<reward_type>)
		case cas
		case cai
		car_pieces = (<current_reward>.car_pieces)
		getarraysize <car_pieces>
		i = 0
		begin
		part = ((<car_pieces> [<i>]).part)
		desc_id = ((<car_pieces> [<i>]).desc_id)
		printf 'Unlocking CAS %a in %b through rewards system' a = <desc_id> b = <part> channel = progression_unlocks
		if set_cas_item_unlocked_flag part = <part> desc_id = <desc_id> savegame = <savegame>
			new_item_unlocked = 1
		endif
		i = (<i> + 1)
		repeat <array_size>
		case venue
		case venue_reward
		venue_checksum = (<current_reward>.venue_checksum)
		if globaltag_unlock_venue venue = <venue_checksum> savegame = <savegame>
			new_item_unlocked = 1
		endif
		case character
		if structurecontains \{structure = current_reward
				profile_idx}
			profile_idx = (<current_reward>.profile_idx)
			if unlock_profile id = ($preset_musician_profiles_locked [<profile_idx>].name) savegame = <savegame>
				new_item_unlocked = 1
			endif
		elseif structurecontains \{structure = current_reward
				profile_name}
			profile_name = (<current_reward>.profile_name)
			if unlock_profile id = (<profile_name>) savegame = <savegame>
				new_item_unlocked = 1
			endif
		endif
		case cheat
		cheat_name = (<current_reward>.cheat_name)
		original_savegame = <savegame>
		getfirstplayer \{local
			out = search_player}
		getnumplayersingame \{local}
		begin
		get_savegame_from_player player = <search_player>
		if (<original_savegame> = <savegame>)
			player = <search_player>
			break
		endif
		getnextplayer player = <search_player> local out = search_player
		repeat <num_players>
		if set_progression_cheat_unlocked cheat_name = <cheat_name> savegame = <savegame>
			new_item_unlocked = 1
		endif
		savegame = <original_savegame>
		case cas_texture
		texture = (<current_reward>.texture)
		if set_cas_texture_unlocked_flag savegame = <savegame> texture = <texture>
			new_item_unlocked = 1
		endif
		case outfit_preset
		outfit_preset = (<current_reward>.outfit_preset)
		printf 'Unlocking Outfit_preset %a through rewards system' a = <outfit_preset> channel = progression_unlocks
		if set_cas_outfit_preset_unlocked_flag savegame = <savegame> outfit_preset = <outfit_preset>
			new_item_unlocked = 1
		endif
		case song
		song = (<current_reward>.song_checksum)
		getglobaltags <song> savegame = <savegame>
		if (<unlocked> = 0)
			setglobaltags <song> params = {unlocked = 1} savegame = <savegame>
			new_item_unlocked = 1
		endif
		case art_gallery
		gallery_name = (<current_reward>.gallery_name)
		getglobaltags <gallery_name> savegame = <savegame>
		if (<unlocked> = 0)
			setglobaltags <gallery_name> params = {unlocked = 1} savegame = <savegame>
			new_item_unlocked = 1
		endif
		case rocker_power
		power_tag = (<current_reward>.power_name)
		new_power_level = (<current_reward>.power_level)
		getglobaltags <power_tag> savegame = <savegame>
		if (<new_power_level> > <power_level>)
			setglobaltags <power_tag> params = {power_level = <new_power_level>} savegame = <savegame>
			new_item_unlocked = 1
		endif
	endswitch
	if structurecontains structure = (<current_reward>) run_career_outro_and_credits
		if NOT innetgame
			change \{end_credits = 1}
		else
			unlock_career_finale_video_and_achievement
		endif
	endif
	return new_item_unlocked = <new_item_unlocked>
endscript

script is_reward_unlocked \{unlock_struct = 0x69696969
		savegame = !i1768515945}
	unlocked = 0
	reward_type = (<unlock_struct>.reward_type)
	switch (<reward_type>)
		case car
		case cas
		case cai
		car_pieces = (<unlock_struct>.car_pieces)
		getarraysize <car_pieces>
		if (<array_size> > 0)
			first_car_piece = (<car_pieces> [0])
			manglechecksums a = (<first_car_piece>.desc_id) b = (<first_car_piece>.part)
			getglobaltags unlocked_cas_items savegame = <savegame>
			if arraycontains array = <unlocked_cas_items> contains = <mangled_id>
				unlocked = 1
			endif
		endif
		case venue
		case venue_reward
		venue_checksum = (<unlock_struct>.venue_checksum)
		formattext checksumname = venue_tag 'venue_%s' s = ($levelzones.<venue_checksum>.name)
		getglobaltags <venue_tag> savegame = <savegame>
		case character
		character_id = (<unlock_struct>.profile_name)
		getglobaltags unlocked_profiles savegame = <savegame>
		if gotparam \{unlocked_profiles}
			if arraycontains array = <unlocked_profiles> contains = <character_id>
				unlocked = 1
			endif
		endif
		case cheat
		cheat_name = (<unlock_struct>.cheat_name)
		if is_cheat_unlocked {cheat_name = <cheat_name> savegame = <savegame>}
			unlocked = 1
		endif
		case cas_texture
		texture = (<unlock_struct>.texture)
		getglobaltags unlocked_cas_textures savegame = <savegame>
		if arraycontains array = <unlocked_cas_textures> contains = <texture>
			unlocked = 1
		endif
		case outfit_preset
		outfit_preset = (<unlock_struct>.outfit_preset)
		getglobaltags unlocked_cas_outfit_presets savegame = <savegame>
		if arraycontains array = <unlocked_cas_outfit_presets> contains = <outfit_preset>
			unlocked = 1
		endif
		case song
		song = (<unlock_struct>.song_checksum)
		getglobaltags <song> savegame = <savegame>
		case art_gallery
		gallery_name = (<unlock_struct>.gallery_name)
		getglobaltags <gallery_name> savegame = <savegame>
	endswitch
	if (<unlocked> = 1)
		return \{true}
	endif
	return \{false}
endscript

script progression_get_rewards_just_unlocked 
	return rewards_just_unlocked = ($career_rewards_just_unlocked)
endscript

script progression_reward_stars 
	if ($end_credits > 0)
		return
	endif
	quickplay_get_grade goal_id = <current_challenge>
	gman_venuefunc \{goal = career
		tool = venue_handler
		func = get_current_venue}
	formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<current_venue>.name)
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <player> controller
		get_savegame_from_controller controller = <controller>
		getglobaltags <current_challenge> savegame = <savegame>
		star_reward = 0
		getsongstatshistory
		getarraysize <song_stats_history>
		getfirstplayer \{local
			out = first_player}
		getplayerinfo <first_player> band
		<star_penalty> = 0
		band = (<band> - 1)
		all_gold = 1
		new_stars = 0
		if (<array_size> >= 1)
			song_index = 0
			earned = ((<song_stats_history> [<song_index>] [<band>].band_stars) - <star_penalty>)
			if (<earned> < 0)
				earned = 0
			endif
			if (<earned> > <song1_stars_earned>)
				setglobaltags <current_challenge> params = {song1_stars_earned = <earned>} savegame = <savegame> progression = true
				new_stars = (<new_stars> + (<earned> - <song1_stars_earned>))
			endif
			if ((<song_stats_history> [<song_index>] [<band>].is_gold_stars) = 0)
				all_gold = 0
			endif
		endif
		if (<all_gold> = 1)
			setglobaltags <current_challenge> params = {earned_gold_stars = 1} savegame = <savegame> progression = true
		endif
		if ((<completed> = 0) && (<pending_grade> >= 1))
			setglobaltags <current_challenge> params = {completed = 1} savegame = <savegame> progression = true
		endif
		if ((<completed_gold> = 0) && (<pending_grade> >= 2))
			setglobaltags <current_challenge> params = {completed_gold = 1} savegame = <savegame> progression = true
			new_stars = (<new_stars> + ($star_reward_gold))
		endif
		if ((<completed_platinum> = 0) && (<pending_grade> >= 3))
			setglobaltags <current_challenge> params = {completed_platinum = 1} savegame = <savegame> progression = true
			new_stars = (<new_stars> + ($star_reward_platinum))
		endif
		if ((<completed_diamond> = 0) && (<pending_grade> >= 4))
			setglobaltags <current_challenge> params = {completed_diamond = 1} savegame = <savegame> progression = true
			new_stars = (<new_stars> + ($star_reward_diamond))
		endif
		get_current_progression_stars savegame = <savegame>
		total_stars = (<total_stars> + <new_stars>)
		set_progression_stars new_total_stars = <total_stars> savegame = <savegame>
		getglobaltags <venue_checksum> param = venue_stars savegame = <savegame>
		setglobaltags <venue_checksum> params = {venue_stars = (<venue_stars> + <new_stars>)} savegame = <savegame> progression = true
		getnextplayer local player = <player>
		repeat <num_players>
	endif
	update_active_players_atoms
	gman_setgrade goal = <current_challenge>
endscript

script get_current_progression_stars 
	if NOT gotparam \{savegame}
		get_savegame_from_controller controller = ($primary_controller)
	endif
	if NOT getglobaltags quickplay_progression_tags param = total_stars savegame = <savegame> noassert = 1
		return \{total_stars = 0}
	endif
	return total_stars = <total_stars>
endscript

script set_progression_stars \{new_total_stars = !i1768515945}
	if NOT gotparam \{savegame}
		get_savegame_from_controller controller = ($primary_controller)
	endif
	setglobaltags savegame = <savegame> quickplay_progression_tags params = {total_stars = <new_total_stars>}
endscript

script get_current_progression_award_points 
	if NOT gotparam \{savegame}
		get_savegame_from_controller controller = ($primary_controller)
	endif
	if NOT getglobaltags quickplay_progression_tags param = total_award_points savegame = <savegame> noassert = 1
		return \{total_award_points = 0}
	endif
	return total_award_points = <total_award_points>
endscript

script set_progression_award_points \{new_total_award_points = !i1768515945}
	if NOT gotparam \{savegame}
		get_savegame_from_controller controller = ($primary_controller)
	endif
	setglobaltags savegame = <savegame> quickplay_progression_tags params = {total_award_points = <new_total_award_points>}
endscript

script progression_songwon \{async = 0
		just_completed = 0}
	update_song_star_rating
	if issingleplayergame
		getfirstplayer \{out = player_one}
		getplayerinfo <player_one> part
	else
		part = band
	endif
	get_highest_difficulty
	get_difficulty_text_nl difficulty = <highest_difficulty>
	playlist_getcurrentsong
	progression_updatedetailedstatsforgig
	<song_event> = song_won
	if innetgame
		if sessionisover
			<song_event> = song_quit
		endif
	endif
	gman_sendcallbacktoallgoals suffix = 'song_complete' callback_data = {event = <song_event>}
	if ($autotest_on = 1)
		if ($g_autotest_quickplay_challenges = true)
			quickplay_autotest_write_log song_name = <current_song>
		else
			career_powers = ($g_autotest_career_powers)
			getarraysize <career_powers>
			if (<array_size> > 0)
				career_autotest_write_log song_name = <current_song>
			endif
		endif
		return just_completed = <just_completed>
	endif
	if NOT ($is_in_debug)
		if (<current_song> != jamsession)
			gamemode_gettype
			<score> = 0
			<stars> = 0
			songlist_get_data_for_songlist_stats
			if (<async> = 1)
				wait \{1
					gameframe}
			endif
			if (<type> = career)
				get_savegame_from_controller controller = ($primary_controller)
				<current_chapter> = ($current_chapter)
				<chapter_name> = ($<current_chapter>.name)
				format_career_song_gigtag chapter_name = <chapter_name> song = <current_song>
				songlist_get_data_for_songlist_stats
				<setup_encore> = 0
				if (<stars> > 0)
					<new_stars> = <stars>
					if console_is_net_career_client
						<stars> = ($g_net_career_progression.<song_gigtag>.stars)
					else
						getglobaltags savegame = <savegame> <song_gigtag> param = stars
					endif
					if (<new_stars> > <stars>)
						if console_is_net_career_client
							temp_struct = ($g_net_career_progression.<song_gigtag> + {stars = <new_stars>})
							appendstruct struct = g_net_career_progression field = <song_gigtag> params = <temp_struct> globalstruct
						else
							setglobaltags savegame = <savegame> <song_gigtag> params = {stars = <new_stars>} progression = true
						endif
						if quest_progression_check_for_chapter_complete savegame = <savegame> chapter_global = <current_chapter>
							broadcastevent type = encore_complete data = {player = ($g_net_leader_player_num) controller_index = ($primary_controller)}
							<params> = {completed = 1}
							if console_is_net_career_client
								<params> = (<params> + {encore_completed_this_session = 1})
							endif
							<just_completed> = 1
							quest_progression_set_chapter_tags savegame = <savegame> chapter_global = <current_chapter> params = <params>
							if ($g_e3_demo_flow = 1)
								first_tier = ($quest_progression_unlocks [0])
								first_chapter = (<first_tier> [0])
								second_chapter = (<first_tier> [1])
								ui_quest_map_debug_beat {
									dominate = 0
									beat_encore = 1
									debugging_from_map = 0
									chapter_name = <first_chapter>
								}
								ui_quest_map_debug_beat {
									dominate = 0
									beat_encore = 1
									debugging_from_map = 0
									chapter_name = <second_chapter>
								}
							endif
						endif
						<check_for_transform> = 1
						if quest_progression_is_chapter_finale
							<check_for_transform> = 0
						endif
						if quest_progression_is_chapter_credits
							<check_for_transform> = 0
						endif
						if quest_progression_is_chapter_rush
							<check_for_transform> = 0
						endif
						if (<check_for_transform> = 1)
							quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <current_chapter> param = encore_unlocked
							if (<encore_unlocked> = 0)
								quest_progression_get_encore_stars_required chapter_global = <current_chapter>
								if (<total_stars> >= <encore_stars_required>)
									<params> = {encore_unlocked = 1}
									if console_is_net_career_client
										<params> = (<params> + {encore_unlocked_this_session = 1})
									endif
									quest_progression_set_chapter_tags savegame = <savegame> chapter_global = <current_chapter> params = <params>
									if console_is_net_career_client
										temp_struct = ($g_net_career_progression.career_progression_tags + {encore_ready = 1})
										appendstruct struct = g_net_career_progression field = career_progression_tags params = <temp_struct> globalstruct
									else
										setglobaltags savegame = <savegame> career_progression_tags params = {encore_ready = 1} progression = true
									endif
									quest_progression_add_transformation_songs chapter_global = <current_chapter>
									<setup_encore> = 1
								endif
							endif
						endif
					endif
				endif
				if ($debug_career_transformations = 1)
					change \{debug_career_transformations = 0}
					if (<setup_encore> = 0)
						quest_progression_set_chapter_tags savegame = <savegame> chapter_global = <current_chapter> params = {encore_unlocked = 1}
						setglobaltags savegame = <savegame> career_progression_tags params = {encore_ready = 1} progression = true
						quest_progression_add_transformation_songs chapter_global = <current_chapter>
					endif
				endif
				change \{g_net_song_won_update = 1}
				if (<async> = 1)
					wait \{1
						gameframe}
				endif
				update_active_players_atoms async = <async>
				if (<async> = 1)
					wait \{1
						gameframe}
				endif
				change \{g_net_song_won_update = 0}
			endif
			if ((<type> = career) || (<type> = quickplay) || (<type> = competitive))
			endif
		endif
		if isxenonorwindx
			if NOT (<current_song> = jamsession)
				writesongdatatofile
			endif
		endif
	endif
	return just_completed = <just_completed>
endscript

script progression_songfailed 
	printf \{qs(0xb3ef858d)}
	if ($game_mode = career)
		update_active_players_atoms
	endif
	if ($current_song != $last_song_failed)
		change last_song_failed = ($current_song)
		change \{current_song_failed_num = 1}
	else
		change current_song_failed_num = ($current_song_failed_num + 1)
	endif
	if ($current_song_failed_num < 3)
		if isxenonorwindx
			if NOT is_current_song_a_jam_session
				writesongdatatofile \{failed = 1}
			endif
		endif
	endif
endscript

script update_song_star_rating 
	getnumplayersingame \{local}
	getfirstplayer \{local}
	if (<num_players> > 0)
		begin
		getplayerinfo <player> projected_song_stars
		getplayerinfo <player> band
		<stars> = <projected_song_stars>
		casttointeger \{stars}
		setplayerinfo <player> stars = <stars>
		getbandinfo <band> projected_song_stars out = band_projected_song_stars
		band_stars = <band_projected_song_stars>
		casttointeger \{band_stars}
		setbandinfo <band> stars = <band_stars>
		getnextplayer player = <player> local
		repeat <num_players>
	endif
endscript

script get_player_percent_accuracy 
	requireparams \{[
			player_index
		]
		all}
	if NOT playerinfoequals <player_index> part = vocals
		getplayerinfo <player_index> notes_hit
		getplayerinfo <player_index> max_notes
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
	else
		getplayerinfo <player_index> vocal_phrase_quality
		getplayerinfo <player_index> vocal_phrase_max_qual
		if (<vocal_phrase_max_qual> > 0)
			<percent_notes_hit> = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
	endif
	mathfloor <percent_notes_hit>
	<percent_notes_hit> = <floor>
	return percent_notes_hit = <percent_notes_hit>
endscript
end_credits = 0

script unlock_career_finale_video_and_achievement 
	getarraysize \{$bonus_videos}
	i = 0
	begin
	video_id = ((($bonus_videos) [<i>]).id)
	if (<video_id> = career_ending)
		getnumplayersingame \{local}
		getfirstplayer \{local}
		begin
		getplayerinfo <player> controller
		getsavegamefromcontroller controller = <controller>
		setglobaltags savegame = <savegame> <video_id> params = {unlocked = 1} packtype = unlockedtags
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script unlock_and_goto_credits 
	unlock_career_finale_video_and_achievement
	if ininternetmode
		band_lobby_career_mark_save_local_players
		ui_event_wait \{event = menu_change
			state = uistate_end_credits}
	else
		ui_memcard_autosave_all_players \{event = menu_change
			state = uistate_end_credits}
	endif
endscript

script progression_endcredits 
	playlist_clear
	sfx_backgrounds_new_area \{bg_sfx_area = frontend
		fadeouttime = 2
		fadeouttype = linear}
	return
	progression_getcreditssong
	playlist_setcurrentsong song = <credits_song>
	audio_final_battle_outro_preload_stream
	if ($g_career_movie_stream != none)
		printf \{qs(0xb15638bb)
			s = $g_career_movie_stream}
		startpreloadedstream \{$g_career_movie_stream
			buss = encore_events
			forcesafepreload = 1
			vol = 0.0}
	endif
	if memheapexists \{name = heap_song}
		destroy_song_and_musicstudio_heaps \{do_unloads}
	endif
	setbinkheap \{heap_cas_cache}
	playmovieandwait \{noblack
		movie = 'career_ending'
		noskip}
	ui_quest_get_vo_array \{chapter_name = quest_chapter_finale}
	recent_unlock_data = ($g_quest_recent_unlocked_awards)
	getarraysize <recent_unlock_data>
	if (<array_size> > 0)
		playmovieandwait \{noblack
			movie = 'credits_movie'}
		setbinkheap \{heap_bink}
		create_song_and_musicstudio_heaps
		if ininternetmode
			band_lobby_career_mark_save_local_players
			ui_event_wait {
				event = menu_change
				state = uistate_quest_unlocks
				data = {
					next_state_name = uistate_quest_map
					next_state_params = {
						play_outro_vo = 1
						outro_vo_strings = <vo_array>
					}
				}
			}
		else
			ui_memcard_autosave {
				event = menu_change
				state = uistate_quest_unlocks
				data = {
					next_state_name = uistate_quest_map
					next_state_params = {play_outro_vo = 1 outro_vo_strings = <vo_array>}
				}
			}
		endif
	else
		setbinkheap \{heap_bink}
		create_song_and_musicstudio_heaps
		next_state_event = menu_back
		next_state_name = uistate_quest_map
		next_state_params = {play_outro_vo = 0 outro_vo_strings = <vo_array>}
		if ininternetmode
			band_lobby_career_mark_save_local_players
			ui_event_wait {
				event = <next_state_event>
				state = <next_state_name>
				data = {
					next_state_name = uistate_quest_map
					next_state_params = <next_state_params>
				}
			}
		else
			ui_memcard_autosave {
				event = <next_state_event>
				state = <next_state_name>
				data = {
					next_state_name = uistate_quest_map
					next_state_params = <next_state_params>
				}
			}
		endif
	endif
	change \{end_credits = 0}
endscript

script progression_endcredits_song \{state_event = menu_replace}
	progression_getcreditsvenue
	change current_level = <credits_venue>
	create_loading_screen
	ui_memcard_autosave_all_players {
		event = <state_event>
		state = uistate_gameplay
	}
	load_venue
	begin
	if NOT ui_event_exists_in_stack \{name = 'memcard'}
		break
	endif
	wait \{1
		gameframe}
	printf \{'waiting for autosave to finish'}
	repeat
	audio_crowd_setup_based_on_zone
	create_song_and_musicstudio_heaps
	if NOT ui_event_exists_in_stack \{name = 'gameplay'}
		if ($is_in_debug = 0)
			return
		else
			playlist_setcurrentsong song = <credits_song>
			generic_event_choose \{state = uistate_play_song}
		endif
	else
		change \{gameplay_restart_song = 1}
		generic_event_back \{nosound
			state = uistate_gameplay}
	endif
	spawnscriptnow \{scrolling_list_begin_credits}
endscript

script progression_endcredits_done 
	destroy_credits_menu
endscript

script progression_getcreditssong 
	<song> = ($quest_chapter_demigod.songs [0])
	return credits_song = <song>
endscript

script progression_getcreditsvenue 
	return \{credits_venue = load_z_credits}
endscript

script progression_setprogressionnodeflags 
	changenodeflag \{ls_always
		1}
	ls_encore = 0
	ls_3_5 = 0
	if ($debug_encore)
		<ls_encore> = 1
	endif
	if ($encore_transitioned_played = true)
		ls_encore = 1
	else
		gamemode_gettype
		if (<type> = career)
			getpakmancurrent \{map = zones}
			if is_encore_song
				ls_encore = 1
			endif
		endif
	endif
	if (<ls_encore> = 1)
		changenodeflag \{ls_3_5_pre
			0}
		changenodeflag \{ls_3_5_post
			1}
		changenodeflag \{ls_encore_pre
			0}
		changenodeflag \{ls_encore_post
			1}
	elseif (<ls_3_5> = 1)
		changenodeflag \{ls_3_5_pre
			0}
		changenodeflag \{ls_3_5_post
			1}
		changenodeflag \{ls_encore_pre
			1}
		changenodeflag \{ls_encore_post
			0}
	else
		changenodeflag \{ls_3_5_pre
			1}
		changenodeflag \{ls_3_5_post
			0}
		changenodeflag \{ls_encore_pre
			1}
		changenodeflag \{ls_encore_post
			0}
	endif
	getpakmancurrentname \{map = zones}
	if gotparam \{pakname}
		formattext checksumname = zone_setup '%s_SetupNodeflags' s = <pakname>
		if scriptexists <zone_setup>
			spawnscriptnow <zone_setup>
		endif
	endif
endscript

script progression_cleardetailedstatsforgig 
	change \{song_stats_backup = [
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
		]}
	change \{song_stats_backup_band = [
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
		]}
endscript

script progression_updatedetailedstatsforgig 
	playlist_getcurrentsong
	progression_cleardetailedstatsforgig
	<default_song_stats> = {
		song = <current_song>
	}
	gamemode_gettype
	if (<type> = career)
		current_chapter = ($current_chapter)
		format_career_song_gigtag chapter_name = ($<current_chapter>.name) song = <current_song>
	endif
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> score
		casttointeger \{score}
		getplayerinfo <player> is_local_client
		previous_stars = 0
		if ((<type> = career) && (<is_local_client> = 1))
			if console_is_net_career_client
				stars = ($g_net_career_progression.<song_gigtag>.stars)
			else
				getplayerinfo <player> controller
				getsavegamefromcontroller controller = <controller>
				getglobaltags savegame = <savegame> <song_gigtag>
			endif
			previous_stars = <stars>
		endif
		getplayerinfo <player> stars
		getplayerinfo <player> notes_hit
		getplayerinfo <player> total_notes
		getplayerinfo <player> notes_created
		getplayerinfo <player> sp_phrases_hit
		getplayerinfo <player> sp_phrases_total
		getplayerinfo <player> best_run
		getplayerinfo <player> max_notes
		getplayerinfo <player> vocal_streak_phrases
		getplayerinfo <player> vocal_phrase_quality
		getplayerinfo <player> vocal_phrase_max_qual
		get_average_multiplier player = <player>
		<avg_multiplier> = <average_multiplier>
		get_song_section_arrays_for_player player = <player>
		<curr_song_stats> = {
			<default_song_stats>
			score = <score>
			stars = <stars>
			previous_stars = <previous_stars>
			notes_hit = <notes_hit>
			best_run = <best_run>
			max_notes = <max_notes>
			total_notes = <total_notes>
			notes_created = <notes_created>
			sp_phrases_hit = <sp_phrases_hit>
			sp_phrases_total = <sp_phrases_total>
			avg_multiplier = <avg_multiplier>
			vocal_streak_phrases = <vocal_streak_phrases>
			vocal_phrase_quality = <vocal_phrase_quality>
			vocal_phrase_max_qual = <vocal_phrase_max_qual>
			detailed_stats = <detailed_stats>
			detailed_stats_max = <detailed_stats_max>
			section_names = <section_names>
		}
		<stats_all> = ($song_stats_backup)
		setarrayelement arrayname = stats_all index = (<player> - 1) newvalue = <curr_song_stats>
		change globalname = song_stats_backup newvalue = <stats_all>
		getnextplayer player = <player>
		repeat <num_players>
	endif
	getbandsstatus
	if gotparam \{bands}
		getarraysize <bands>
		bands_size = <array_size>
		if (<bands_size> > 0)
			band_idx = 0
			begin
			band = (<band_idx> + 1)
			getbandinfo <band> stars
			getbandinfo <band> score
			getbandinfo <band> high_mult
			getbandinfo <band> high_1p_streak
			getbandinfo <band> high_2p_streak
			getbandinfo <band> high_3p_streak
			getbandinfo <band> high_4p_streak
			getbandinfo <band> band_moments_hit
			getbandinfo <band> band_moments_possible
			current_band_stats = {
				stars = <stars>
				score = <score>
				high_mult = <high_mult>
				high_1p_streak = <high_1p_streak>
				high_2p_streak = <high_2p_streak>
				high_3p_streak = <high_3p_streak>
				high_4p_streak = <high_4p_streak>
				band_moments_hit = <band_moments_hit>
				band_moments_possible = <band_moments_possible>
			}
			<band_stats_all> = ($song_stats_backup_band)
			setarrayelement arrayname = band_stats_all index = <band_idx> newvalue = <current_band_stats>
			change globalname = song_stats_backup_band newvalue = <band_stats_all>
			band_idx = (<band_idx> + 1)
			repeat <bands_size>
		endif
	endif
	if NOT gotparam \{failed_or_practice}
		addhistoryforcurrentsong
	endif
endscript

script get_song_section_arrays_for_player 
	requireparams \{[
			player
		]
		all}
	<detailed_stats> = []
	<detailed_stats_max> = []
	<section_names> = []
	formattext checksumname = last_song_stats 'p%p_last_song_detailed_stats' p = <player> addtostringlookup = true
	formattext checksumname = last_song_stats_max 'p%p_last_song_detailed_stats_max' p = <player> addtostringlookup = true
	get_song_section_array player = <player>
	getarraysize <song_section_array>
	if (<array_size> > 0)
		<detailed_stats> = ($<last_song_stats>)
		<detailed_stats_max> = ($<last_song_stats_max>)
		i = 0
		begin
		formattext textname = marker_text qs(0x73307931) s = ((<song_section_array> [<i>]).marker)
		addarrayelement array = <section_names> element = <marker_text>
		<section_names> = <array>
		i = (<i> + 1)
		repeat <array_size>
	endif
	return detailed_stats = <detailed_stats> detailed_stats_max = <detailed_stats_max> section_names = <section_names>
endscript

script get_progression_player_and_controller \{savegame = !i1768515945}
	<target_savegame> = <savegame>
	<num_matches> = 0
	<last_matching_player> = 0
	<ret> = true
	getnumplayersingame \{local}
	if (<num_players> < 1)
		return \{ret = false}
	endif
	getfirstplayer \{local}
	begin
	getplayerinfo <player> controller
	getsavegamefromcontroller controller = <controller>
	if (<target_savegame> = <savegame>)
		<num_matches> = (1 + <num_matches>)
		<last_matching_player> = <player>
	endif
	getnextplayer player = <player> local
	repeat <num_players>
	if (1 = <num_matches>)
		getplayerinfo <last_matching_player> controller
		addparam structure_name = return_struct name = player value = <last_matching_player>
		addparam structure_name = return_struct name = controller_index value = <controller>
	else
		<ret> = false
	endif
	return <ret> <return_struct>
endscript
