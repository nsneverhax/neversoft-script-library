g_quickplay_extra_levels_interval = 50
g_quickplay_rewards_just_unlocked = [
]

script create_quickplay_rewards_atoms_array \{async = 0}
	getarraysize \{$award_point_progression}
	createlocalarray name = atoms type = struct size = <array_size>
	index = 0
	begin
	formattext checksumname = name 'quickplay_reward_%a_unlock' a = (<index> + 1) addtostringlookup = true
	depends_on = []
	addarrayelement array = <depends_on> element = {
		type = scr
		scr = progression_quickplay_check_reward_unlock
		params = {($award_point_progression [<index>]) savegame = <savegame>}
	}
	depends_on = <array>
	atom = {
		name = <name>
		type = scr
		atom_script = do_atomic_reward_unlock
		atom_params = {atomic_reward_data = ($award_point_progression [<index>]) atomic_reward_index = <index> atom_type = quickplay savegame = <savegame>}
		depends_on = <depends_on>
	}
	setarrayelement arrayname = atoms index = <index> newvalue = <atom>
	index = (<index> + 1)
	conditional_async_wait async = <async> text = qs(0xcfcb3913)
	repeat <array_size>
	return completed_atoms_array = <atoms>
endscript

script progression_quickplay_check_reward_unlock 
	criteria_passed = 0
	getglobaltags quickplay_progression_tags param = total_award_points savegame = <savegame> noassert = 1
	if (<total_award_points> >= <award_points>)
		return \{true}
	endif
	return \{false}
endscript

script progression_award_points_add_just_unlocked_item 
	gamemode_gettype
	if (<type> != quickplay)
		return
	endif
	temp_array = ($g_quickplay_rewards_just_unlocked)
	reward_struct = {<reward_struct> savegame = <player_savegame>}
	addarrayelement array = <temp_array> element = <reward_struct>
	change g_quickplay_rewards_just_unlocked = <array>
endscript

script progression_quickplay_get_rewards_just_unlocked \{player = -1}
	if (<player> = -1)
		return rewards_just_unlocked = ($g_quickplay_rewards_just_unlocked)
	endif
	getplayerinfo <player> controller
	getsavegamefromcontroller controller = <controller>
	array = []
	unlocks = ($g_quickplay_rewards_just_unlocked)
	getarraysize <unlocks>
	if (<array_size> > 0)
		i = 0
		begin
		if ((<unlocks> [<i>]).savegame = <savegame>)
			addarrayelement array = <array> element = (<unlocks> [<i>])
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return rewards_just_unlocked = <array>
endscript

script progression_quickplay_clear_rewards_just_unlocked 
	change \{g_quickplay_rewards_just_unlocked = [
		]}
endscript

script quickplay_get_awards_for_song \{song_name = !q1768515945
		savegame = !i1768515945}
	if song_is_jamsession song = <song_name>
		return
	endif
	fix_song_id_suddendeath_hack song_id = <song_name>
	<song_name> = <song_id>
	<config_idx> = 0
	<challenges_index> = 1
	<awards_total> = 0
	<awards_earned> = 0
	<qp_power_stars> = 0
	<qp_performance_stars> = 0
	<config> = null
	<goal_name> = null
	<difficulty_rating> = 0
	<part_text> = ''
	getglobaltags savegame = <savegame> <song_name>
	gman_getsongchallengeprops song_name = <song_name> instrument = none
	<challenge_configs> = ($g_qp_required_challenge_props_order)
	fastgetarraysize array = <challenge_configs>
	<config_size> = <array_size>
	playlist_getsongprops song = <song_name>
	begin
	<config> = (<challenge_configs> [<config_idx>])
	if faststructurecontains structure = <challenge_props> name = <config>
		fastgetarraysize array = (<challenge_props>.<config>)
		getdifficultyratingchecksumbypart part = <config>
		<difficulty_rating> = (<song_props>.<difficulty_rating_checksum>)
		if (<array_size> > 0 && (<config> = band || <config> = traditional_band || <difficulty_rating> > 0))
			<index> = 0
			begin
			<goal_name> = (<challenge_props>.<config> [<index>].goal_name)
			getchallengegradechecksum challenge_index = <challenges_index>
			getlocalinteger name = <grade_checksum>
			awards_earned = (<awards_earned> + <local_integer>)
			<award_points> = 3
			<awards_total> = (<awards_total> + <award_points>)
			<challenges_index> = (<challenges_index> + 1)
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	<config_idx> = (<config_idx> + 1)
	repeat <config_size>
	<challenge_awards_total> = <awards_total>
	<awards_total> = (<awards_total> + $max_stars_quickplay + 1)
	casttointeger \{awards_total}
	casttointeger \{challenge_awards_total}
	<challenge_awards> = <awards_earned>
	awards_earned = (<awards_earned> + <qp_performance_stars>)
	return {
		num_challenges = (<challenges_index> - 1)
		awards_earned = <awards_earned>
		awards_total = <awards_total>
		challenge_awards = <challenge_awards>
		challenge_awards_total = <challenge_awards_total>
		qp_power_stars = <qp_power_best_stars>
	}
endscript

script quickplay_get_recent_award_points \{player = !i1768515945
		recent_award_points = 0}
	if NOT (<player> = -1)
		getplayerinfo <player> recent_award_points
	endif
	return recent_award_points = <recent_award_points>
endscript

script quickplay_get_overall_awards_progress 
	if gotparam \{player}
		if (<player> = -1)
			get_savegame_from_controller controller = ($primary_controller)
		else
			getplayerinfo <player> controller
			get_savegame_from_controller controller = <controller>
		endif
	else
		get_savegame_from_controller controller = ($primary_controller)
	endif
	get_current_progression_award_points savegame = <savegame>
	quickplay_find_award_point_level award_points = <total_award_points>
	return {
		current_award_points_total = <total_award_points>
		current_award_points_level = <award_point_level>
		next_award_points_threshold = <next_award_points_threshold>
	}
endscript

script quickplay_get_rank_by_controller \{controller = !i1768515945}
	get_savegame_from_controller controller = <controller>
	get_current_progression_award_points savegame = <savegame>
	quickplay_find_award_point_level award_points = <total_award_points>
	return rank = <award_point_level>
endscript

script quickplay_find_award_point_level \{award_points = !i1768515945}
	award_point_level = 1
	next_award_points_threshold = -1
	award_point_level_up = 0
	getarraysize ($award_point_progression)
	num_on_disc_levels = <array_size>
	if (<array_size> > 0)
		index = 0
		begin
		award_struct = ($award_point_progression [<index>])
		if (<award_struct>.award_points > <award_points>)
			next_award_points_threshold = (<award_struct>.award_points)
			break
		endif
		award_point_level = (<award_point_level> + 1)
		index = (<index> + 1)
		repeat <num_on_disc_levels>
		highest_award_requirement = (<award_struct>.award_points)
		if (<award_points> >= <highest_award_requirement>)
			award_point_level = (<index> + 1)
			index = 1
			begin
			next_dlc_award_requirement = (<highest_award_requirement> + (($g_quickplay_extra_levels_interval) * <index>))
			if (<award_points> < <next_dlc_award_requirement>)
				next_award_points_threshold = <next_dlc_award_requirement>
				break
			else
				award_point_level = (<award_point_level> + 1)
			endif
			index = (<index> + 1)
			repeat
		endif
	endif
	if (<award_point_level> = -1)
		<award_point_level> = (<num_on_disc_levels> + 1)
	endif
	at_max_level = 0
	return {
		award_point_level = <award_point_level>
		next_award_points_threshold = <next_award_points_threshold>
		at_max_level = <at_max_level>
	}
endscript

script quickplay_get_outro_percentages \{previous_points = !i1768515945
		current_points = !i1768515945
		previous_level = !i1768515945
		current_level = !i1768515945}
	start_percentage = 0.0
	previous_threshold = 0.0
	current_threshold = 1.0
	end_percentage = 1.0
	at_max_level = 0
	getarraysize ($award_point_progression)
	num_on_disc_levels = <array_size>
	if (<current_level> < (<num_on_disc_levels> + 1))
		if (<current_level> < 1)
			current_level = 1
		endif
		if (<current_level> < 2)
			current_threshold = (($award_point_progression [(<current_level> - 1)]).award_points)
		else
			current_threshold = (($award_point_progression [(<current_level> - 2)]).award_points)
		endif
		if (<current_level> = 1)
			previous_threshold = 0
			start_percentage = ((<previous_points> * 1.0) / ((<current_threshold> - <previous_threshold>) * 1.0))
			end_percentage = ((<current_points> * 1.0) / (<current_threshold> * 1.0))
		elseif (<current_level> = 2)
			previous_threshold = (($award_point_progression [0]).award_points)
			if (<previous_level> = 1)
				<previous_threshold_start> = 0
			else
				<previous_threshold_start> = <previous_threshold>
			endif
			current_threshold = (($award_point_progression [(<current_level> - 1)]).award_points)
			start_percentage = (((<previous_points> - <previous_threshold_start>) * 1.0) / ((<current_threshold> - <previous_threshold>) * 1.0))
			end_percentage = (((<current_points> - <previous_threshold>) * 1.0) / ((<current_threshold> - <previous_threshold>) * 1.0))
		else
			if (<previous_level> > <num_on_disc_levels>)
				<start_percentage> = 1.0
				<end_percentage> = 1.0
				<current_threshold> = -1
			else
				previous_threshold = (($award_point_progression [(<previous_level> - 1)]).award_points)
				if (<previous_level> = 1)
					previous_threshold_start = 0
				else
					previous_threshold_start = (($award_point_progression [(<previous_level> - 2)]).award_points)
				endif
				start_percentage = (((<previous_points> - <previous_threshold_start>) * 1.0) / ((<previous_threshold> - <previous_threshold_start>) * 1.0))
				current_threshold = (($award_point_progression [(<current_level> - 1)]).award_points)
				previous_threshold = (($award_point_progression [(<current_level> - 2)]).award_points)
				end_percentage = (((<current_points> - <previous_threshold>) * 1.0) / (<current_threshold> - <previous_threshold> * 1.0))
			endif
		endif
	else
		max_on_disc_level_req = (($award_point_progression [(<num_on_disc_levels> - 1)]).award_points)
		if (<previous_level> <= <num_on_disc_levels>)
			total_dlc_levels_earned = (<current_level> - <num_on_disc_levels>)
			previous_threshold = (($award_point_progression [(<previous_level> - 1)]).award_points)
			if (<previous_level> = 1)
				previous_threshold_start = 0
			else
				previous_threshold_start = (($award_point_progression [(<previous_level> - 2)]).award_points)
			endif
			start_percentage = (((<previous_points> - <previous_threshold_start>) * 1.0) / ((<previous_threshold> - <previous_threshold_start>) * 1.0))
			current_threshold = (<max_on_disc_level_req> + (<total_dlc_levels_earned> * $g_quickplay_extra_levels_interval))
			end_percentage = (((<current_points> - <previous_threshold>) * 1.0) / ((<current_threshold> - <previous_threshold>) * 1.0))
		elseif (<previous_level> = (<num_on_disc_levels> + 1) && <current_level> = (<num_on_disc_levels> + 1))
			previous_dlc_levels_earned = (<previous_level> - <num_on_disc_levels>)
			previous_threshold = (<max_on_disc_level_req> + ((<previous_dlc_levels_earned>) * $g_quickplay_extra_levels_interval))
			previous_threshold_start = (<max_on_disc_level_req> + ((<previous_dlc_levels_earned> - 1) * $g_quickplay_extra_levels_interval))
			start_percentage = (((<previous_points> - <previous_threshold_start>) * 1.0) / ((<previous_threshold> - <previous_threshold_start>) * 1.0))
			current_dlc_levels_earned = (<current_level> - <num_on_disc_levels>)
			previous_threshold = (($award_point_progression [(<previous_level> - 2)]).award_points)
			current_threshold = (<max_on_disc_level_req> + (<current_dlc_levels_earned> * $g_quickplay_extra_levels_interval))
			end_percentage = (((<current_points> - <previous_threshold>) * 1.0) / ((<current_threshold> - <previous_threshold>) * 1.0))
		else
			previous_dlc_levels_earned = (<previous_level> - <num_on_disc_levels>)
			previous_threshold = (<max_on_disc_level_req> + (<previous_dlc_levels_earned> * $g_quickplay_extra_levels_interval))
			previous_threshold_start = (<max_on_disc_level_req> + ((<previous_dlc_levels_earned> - 1) * $g_quickplay_extra_levels_interval))
			start_percentage = (((<previous_points> - <previous_threshold_start>) * 1.0) / ((<previous_threshold> - <previous_threshold_start>) * 1.0))
			current_dlc_levels_earned = (<current_level> - <num_on_disc_levels>)
			previous_threshold = (<max_on_disc_level_req> + ((<current_dlc_levels_earned> - 1) * $g_quickplay_extra_levels_interval))
			current_threshold = (<max_on_disc_level_req> + (<current_dlc_levels_earned> * $g_quickplay_extra_levels_interval))
			end_percentage = (((<current_points> - <previous_threshold>) * 1.0) / ((<current_threshold> - <previous_threshold>) * 1.0))
		endif
	endif
	if (<start_percentage> < 0.0)
		<start_percentage> = 0.0
	endif
	if (<end_percentage> > 1.0)
		<end_percentage> = 1.0
	endif
	return {
		start_percentage = <start_percentage>
		end_percentage = <end_percentage>
		next_threshold = <current_threshold>
		at_max_level = <at_max_level>
	}
endscript

script quickplay_get_next_threshold \{level = !i1768515945}
	getarraysize ($award_point_progression)
	if (<level> < (<array_size> + 1))
		next_threshold = (($award_point_progression [(<level> - 1)]).award_points)
	else
		max_on_disc_requirement = (($award_point_progression [(<array_size> - 1)]).award_points)
		dlc_levels_gained = (<level> - <array_size>)
		next_threshold = (<max_on_disc_requirement> + (<dlc_levels_gained> * $g_quickplay_extra_levels_interval))
	endif
	at_max_level = 0
	return next_threshold = <next_threshold> at_max_level = <at_max_level>
endscript

script quickplay_complete_all_current_challenges 
	getnumplayersingame \{local}
	getfirstplayer \{local}
	begin
	gman_getgoalsbyplayer player = <player>
	if (0 = <goals_by_player_size>)
		return
	endif
	index = 0
	begin
	gman_setpendinggrade goal = (<goals_by_player> [<index>]) grade = 3
	index = (<index> + 1)
	repeat <goals_by_player_size>
	quickplay_calc_challenge_outro_stats player = <player>
	getnextplayer player = <player> local
	repeat <num_players>
	gman_getgoalsbyplayer \{player = 0}
	if (0 = <goals_by_player_size>)
		return
	endif
	index = 0
	begin
	gman_setpendinggrade goal = (<goals_by_player> [<index>]) grade = 3
	index = (<index> + 1)
	repeat <goals_by_player_size>
endscript

script quickplay_get_best_stars_for_song \{song = !q1768515945}
	<best_stars> = 0
	getglobaltags savegame = <savegame> <song>
	return best_stars = <qp_performance_stars>
endscript
