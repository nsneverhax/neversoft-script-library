
script challenge_qp_calculate_current_progress \{goal_id = NULL
		Player = -1
		current_value = 0
		var_type = NULL}
	if gman_sectionwatcherfunc goal = <goal_id> tool = section_watcher func = in_watched_section
		gman_getdata goal = <goal_id> Player = <Player> Name = section_base_value
		gman_getdata goal = <goal_id> Player = <Player> Name = previous_progress
		if (<var_type> = incremental)
			<current_progress> = (<current_value> + <previous_progress>)
		else
			<current_progress> = (<current_value> - <section_base_value> + <previous_progress>)
		endif
	else
		gman_getdata goal = <goal_id> Player = <Player> Name = current_progress
		gman_setdata goal = <goal_id> Player = <Player> params = {section_base_value = <current_value> previous_progress = <current_progress>}
	endif
	return current_progress = <current_progress>
endscript

script challenge_qp_calculate_total_band_progress \{goal_id = NULL}
	<total_band_progress> = 0
	getnumplayersingame
	if (<num_players> > 1)
		getfirstplayer
		begin
		gman_getdata goal = <goal_id> Player = <Player> Name = current_progress
		<total_band_progress> = (<total_band_progress> + <current_progress>)
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	return total_band_progress = <total_band_progress>
endscript

script challenge_qp_current_section_is_valid \{goal_id = NULL}
	if gman_sectionwatcherfunc goal = <goal_id> tool = section_watcher func = in_watched_section
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script challenge_qp_evaluate_progress \{current_value = 0
		goal_id = NULL
		Player = 0}
	gman_getdata goal = <goal_id> Name = calculated_targets
	if (<current_value> >= (<calculated_targets> [2]))
		<new_grade> = 3
	elseif (<current_value> >= (<calculated_targets> [1]))
		<new_grade> = 2
	elseif (<current_value> >= (<calculated_targets> [0]))
		<new_grade> = 1
	else
		<new_grade> = 0
	endif
	if (<new_grade> > 0)
		quickplay_get_grade goal_id = <goal_id>
		if (<new_grade> > <pending_grade>)
			gman_setpendinggrade goal = <goal_id> grade = <new_grade>
			orig_player = <Player>
			if (<Player> < 1)
				Player = ($g_leader_player_num)
			endif
			if (<Player> > 0)
				playlist_getcurrentsong
				gman_getgoalname goal = <goal_id>
				gman_getqpsavechecksums song = <current_song> goal_name = <goal_name> assigned_player = <Player>
				getplayerinfo <Player> bot_play
				if (<bot_play> = 1)
					getplayerinfo <Player> bot_original_controller
					<controller> = <bot_original_controller>
				else
					getplayerinfo <Player> controller
				endif
				getsavegamefromcontroller controller = <controller>
				GetGlobalTags savegame = <savegame> <current_song>
				if (<new_grade> > <...>.<grade_checksum>)
					GetGlobalTags savegame = <savegame> user_options param = show_challenge_icons_save
					if (<show_challenge_icons_save> = 1)
						add_quickplay_challenge_alert {challenge_instance_id = <goal_id> grade = <new_grade>}
					endif
				endif
			else
				printf 'WARNING: Leader Player Number (%p) is INVALID (challenge_qp_evaluate_progress)' p = <Player>
			endif
			if NOT CD
				challenge_store_grade_mark Player = <orig_player> goal_id = <goal_id> grade = <new_grade>
			endif
		endif
	endif
endscript

script challenge_store_grade_mark \{Player = -1
		goal_id = NULL
		grade = 0}
	GetSongTime
	playlist_getcurrentsong
	<song_info> = (($gh_songlist_props).<current_song>)
	<song_progress> = ((<songtime> / (<song_info>.Duration + 5)) * 100)
	if (<Player> > 0)
		switch <grade>
			case 1
			gman_setdata goal = <goal_id> Player = <Player> params = {gold_mark = <song_progress>}
			case 2
			gman_setdata goal = <goal_id> Player = <Player> params = {platinum_mark = <song_progress>}
			case 3
			gman_setdata goal = <goal_id> Player = <Player> params = {diamond_mark = <song_progress>}
			default
			printf \{channel = challenge_info
				'passed invalid grade to challenge_store_grade_time'}
		endswitch
	else
		switch <grade>
			case 1
			gman_setdata goal = <goal_id> params = {gold_mark = <song_progress>}
			case 2
			gman_setdata goal = <goal_id> params = {platinum_mark = <song_progress>}
			case 3
			gman_setdata goal = <goal_id> params = {diamond_mark = <song_progress>}
			default
			printf \{channel = challenge_info
				'passed invalid grade to challenge_store_grade_time'}
		endswitch
	endif
endscript

script challenge_is_band_subtype \{goal_id = NULL}
	gman_getgoalsubtype goal = <goal_id>
	gman_getassignedplayer goal_name = <goal_id>
	if (<goal_subtype> = Band)
		if (<assigned_player> = 0)
			return \{true}
		else
			ScriptAssert 'Quickplay Challenge [%c] assigned to a band that is not a band variant!' c = <goal_id>
		endif
	else
		return \{FALSE}
	endif
endscript
g_qp_autotest_stats = [
]
g_qp_autotest_failed = 0

script challenge_output_grade_marks \{goal_id = NULL
		assigned_player = 1}
	if CD
		return
	endif
	if ($autotest_on = 0)
		return
	endif
	Wait \{1
		Second}
	Player = <assigned_player>
	<gold_mark> = 0
	<platinum_mark> = 0
	<diamond_mark> = 0
	gman_getdata goal = <goal_id> Name = calculated_targets
	<gold_target> = (<calculated_targets> [0])
	<platinum_target> = (<calculated_targets> [1])
	<diamond_target> = (<calculated_targets> [2])
	gman_getassignedplayer goal_name = <goal_id>
	playlist_getcurrentsong
	if (<assigned_player> > 0)
		gman_getdata goal = <goal_id> Player = <assigned_player>
		getplayerinfo <assigned_player> part
		getplayerinfo <assigned_player> difficulty
		getavgmultiplierfromdetailedstats Player = <assigned_player>
		get_percent_notes_hit player_index = <assigned_player>
	else
		gman_getdata goal = <goal_id>
		<part> = Band
		<difficulty> = None
		getfirstplayer
		getplayerinfo <Player> Band
		avg_multiplier = ($song_stats_backup_band [(<Band> - 1)].high_mult)
		get_percent_notes_hit_for_band Band = <Band>
		Player = 0
	endif
	stats_struct = {
		Name = <goal_id>
		Player = <assigned_player>
		current_song = <current_song>
		part = <part>
		difficulty = <difficulty>
		gold_target = <gold_target>
		gold_mark = <gold_mark>
		platinum_target = <platinum_target>
		platinum_mark = <platinum_mark>
		diamond_target = <diamond_target>
		diamond_mark = <diamond_mark>
		final_progress = <current_progress>
		avg_mult = <avg_multiplier>
		percent_notes_hit = <percent_notes_hit>
	}
	printstruct channel = challenge_info <stats_struct>
	printf channel = challenge_info_csv '%s, %r, %y, %p, %c, %g, %a, %n, %b, %d, %e, %t, %j' s = <current_song> r = <part> y = <difficulty> p = <assigned_player> c = <goal_id> g = <gold_target> a = <gold_mark> n = <platinum_target> b = <platinum_mark> d = <diamond_target> e = <diamond_mark> t = <current_progress> j = <percent_notes_hit>
	if ($autotest_on = 1)
		temp_stats = ($g_qp_autotest_stats)
		AddArrayElement array = <temp_stats> element = <stats_struct>
		Change g_qp_autotest_stats = <array>
		if (<difficulty> = easy)
			test_target_progress = 0
		elseif (<difficulty> = medium)
			test_target_progress = <gold_target>
		elseif (<difficulty> = hard)
			test_target_progress = <platinum_target>
		elseif (<difficulty> = expert)
			test_target_progress = <diamond_target>
		else
			test_target_progress = 0
		endif
		if (<current_progress> < <test_target_progress>)
			Change \{g_qp_autotest_failed = 1}
		endif
	endif
endscript

script quickplay_autotest_write_log 
	GetArraySize ($g_qp_autotest_stats)
	if (<array_Size> = 0)
		printf \{'Quickplay Autotest - No challenge stats found, something went horribly wrong!'}
		return
	endif
	first_challenge_stat = ($g_qp_autotest_stats [0])
	current_song = (<first_challenge_stat>.current_song)
	if StructureContains structure = (($gh_songlist_props).<current_song>) allowed_in_quickplay
		if ((($gh_songlist_props).<current_song>).allowed_in_quickplay = 0)
			return
		endif
	endif
	if ($g_qp_autotest_failed = 1)
		formatText TextName = FileName 'qp_autotest_FAIL_%a' a = <song_name> DontAssertForChecksums
		formatText TextName = csv_filename 'qp_autotest_FAIL_%a_CSV' a = <song_name> DontAssertForChecksums
	else
		formatText TextName = FileName 'qp_autotest_PASS_%a' a = <song_name> DontAssertForChecksums
		formatText TextName = csv_filename 'qp_autotest_PASS_%a_CSV' a = <song_name> DontAssertForChecksums
	endif
	TextOutputStart FileName = <FileName>
	if ($g_qp_autotest_failed = 1)
		TextOutput \{text = qs(0x89610145)}
		TextOutput \{text = qs(0x03ac90f0)}
		TextOutput \{text = qs(0x03ac90f0)}
	else
		TextOutput \{text = qs(0xa2689597)}
		TextOutput \{text = qs(0x03ac90f0)}
		TextOutput \{text = qs(0x03ac90f0)}
	endif
	i = 0
	begin
	challenge_stats = ($g_qp_autotest_stats [<i>])
	if ((<challenge_stats>.difficulty) = easy)
		test_target_progress = 0
	elseif ((<challenge_stats>.difficulty) = medium)
		test_target_progress = (<challenge_stats>.gold_target)
	elseif ((<challenge_stats>.difficulty) = hard)
		test_target_progress = (<challenge_stats>.platinum_target)
	elseif ((<challenge_stats>.difficulty) = expert || (<challenge_stats>.difficulty) = None)
		test_target_progress = (<challenge_stats>.diamond_target)
	else
		test_target_progress = 0
	endif
	if ((<challenge_stats>.final_progress) >= <test_target_progress>)
		formatText TextName = temp_text qs(0x3435a984) a = (<challenge_stats>.Name) DontAssertForChecksums
		TextOutput text = <temp_text>
	else
		formatText TextName = temp_text qs(0xc734bd57) a = (<challenge_stats>.Name) DontAssertForChecksums
		TextOutput text = <temp_text>
	endif
	formatText TextName = temp_text qs(0xc1a656dc) a = (<challenge_stats>.Name) DontAssertForChecksums
	TextOutput text = <temp_text>
	formatText TextName = temp_text qs(0x617df3ff) a = (<challenge_stats>.current_song) DontAssertForChecksums
	TextOutput text = <temp_text>
	formatText TextName = temp_text qs(0x46a5881b) a = (<challenge_stats>.part) DontAssertForChecksums
	TextOutput text = <temp_text>
	formatText TextName = temp_text qs(0x0bbe44ff) a = (<challenge_stats>.difficulty) DontAssertForChecksums
	TextOutput text = <temp_text>
	formatText TextName = temp_text qs(0xd6d46fdf) a = (<challenge_stats>.Player) DontAssertForChecksums
	TextOutput text = <temp_text>
	TextOutput \{text = qs(0x03ac90f0)}
	if ((<challenge_stats>.gold_mark) = 0)
		formatText TextName = temp_text qs(0x2ca488f6) a = (<challenge_stats>.gold_target) DecimalPlaces = 2 usecommas
	else
		formatText TextName = temp_text qs(0x748be1d5) a = (<challenge_stats>.gold_target) b = (<challenge_stats>.gold_mark) DecimalPlaces = 2 usecommas
	endif
	TextOutput text = <temp_text>
	if ((<challenge_stats>.platinum_mark) = 0)
		formatText TextName = temp_text qs(0xbc03063b) a = (<challenge_stats>.platinum_target) DecimalPlaces = 2 usecommas
	else
		formatText TextName = temp_text qs(0x2d61cfc4) a = (<challenge_stats>.platinum_target) b = (<challenge_stats>.platinum_mark) DecimalPlaces = 2 usecommas
	endif
	TextOutput text = <temp_text>
	if ((<challenge_stats>.diamond_mark) = 0)
		formatText TextName = temp_text qs(0x97cfee87) a = (<challenge_stats>.diamond_target) DecimalPlaces = 2 usecommas
	else
		formatText TextName = temp_text qs(0x0496dfcf) a = (<challenge_stats>.diamond_target) b = (<challenge_stats>.diamond_mark) DecimalPlaces = 2 usecommas
	endif
	TextOutput text = <temp_text>
	TextOutput \{text = qs(0x03ac90f0)}
	formatText TextName = temp_text qs(0x561df95b) a = (<challenge_stats>.final_progress) usecommas
	TextOutput text = <temp_text>
	if (<challenge_stats>.Player = 0)
		formatText TextName = temp_text qs(0x40fe5221) a = (<challenge_stats>.avg_mult) DecimalPlaces = 2
	else
		formatText TextName = temp_text qs(0x6ecd4547) a = (<challenge_stats>.avg_mult) DecimalPlaces = 2
	endif
	TextOutput text = <temp_text>
	formatText TextName = temp_text qs(0xa15be774) a = (<challenge_stats>.percent_notes_hit)
	TextOutput text = <temp_text>
	TextOutput \{text = qs(0x03ac90f0)}
	TextOutput \{text = qs(0x03ac90f0)}
	i = (<i> + 1)
	repeat <array_Size>
	TextOutputEnd output_text FileName = <FileName>
	TextOutputStart FileName = <csv_filename>
	i = 0
	begin
	challenge_stats = ($g_qp_autotest_stats [<i>])
	formatText TextName = csv_data {
		qs(0x74f6b367)
		a = (<challenge_stats>.Name)
		b = (<challenge_stats>.current_song)
		c = (<challenge_stats>.part)
		d = (<challenge_stats>.difficulty)
		e = (<challenge_stats>.Player)
		f = (<challenge_stats>.gold_target)
		g = (<challenge_stats>.gold_mark)
		h = (<challenge_stats>.platinum_target)
		i = (<challenge_stats>.platinum_mark)
		j = (<challenge_stats>.diamond_target)
		k = (<challenge_stats>.diamond_mark)
		l = (<challenge_stats>.final_progress)
		m = (<challenge_stats>.avg_mult)
		n = (<challenge_stats>.percent_notes_hit)
		DontAssertForChecksums
	}
	TextOutput text = <csv_data>
	i = (<i> + 1)
	repeat <array_Size>
	TextOutputEnd output_text FileName = <csv_filename>
endscript
debug_grade_times = [
	{
		Player = 1
		gold = -1
		platinum = -1
		diamond = -1
	}
	{
		Player = 2
		gold = -1
		platinum = -1
		diamond = -1
	}
	{
		Player = 3
		gold = -1
		platinum = -1
		diamond = -1
	}
	{
		Player = 4
		gold = -1
		platinum = -1
		diamond = -1
	}
]

script challenge_meter_watcher_varupdated 
	gman_getdata goal = <goal_id> Name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	GetArraySize ($<goal_id>.required_band)
	if (<array_Size> > 1)
		getplayerinfo <Player> Band
		gman_meterfunc goal = <goal_id> tool = challenge_meter func = update_progress params = {band_meter band_index = <Band> current_progress = <current_value>}
	else
		gman_meterfunc goal = <goal_id> tool = challenge_meter func = update_progress params = {player_meter player_index = <Player> current_progress = <current_value>}
	endif
endscript

script challenge_validate_band_setup \{goal_id = NULL}
	<required_band> = ($<goal_id>.required_band)
	<instruments> = [lead bass drum vocal]
	<num_required> = [0 0 0 0]
	<num_in_band> = [0 0 0 0]
	<band_setup> = valid
	<valid_players> = []
	GetArraySize (<required_band>)
	getnumplayersingame
	if (<num_players> > 0)
		<num_valid_players> = 0
		getfirstplayer
		begin
		getplayerinfo <Player> difficulty
		if NOT (<difficulty> = beginner)
			getplayerinfo <Player> difficulty
			playlist_getcurrentsongindex
			if (<current_song_index> = 1)
				gman_setdata goal = <goal_id> Player = <Player> params = {difficulty_check = <difficulty>}
			endif
			challenge_validate_player_instrument goal_id = <goal_id> Player = <Player>
			if (<player_instrument> = valid)
				<valid_players> = (<valid_players> + <Player>)
				<num_valid_players> = (<num_valid_players> + 1)
			endif
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
		if (<num_valid_players> >= <array_Size>)
			<i> = 0
			begin
			<ii> = 0
			begin
			if (<required_band> [<i>] = <instruments> [<ii>])
				SetArrayElement ArrayName = num_required index = <ii> NewValue = (<num_required> [<ii>] + 1)
				break
			endif
			<ii> = (<ii> + 1)
			repeat 4
			<i> = (<i> + 1)
			repeat <array_Size>
			getfirstplayer
			begin
			<ii> = 0
			begin
			getplayerinfo <Player> part
			getplayerinfo <Player> difficulty
			if NOT (<difficulty> = beginner)
				<instruments> = [guitar bass drum vocals]
				if (<part> = <instruments> [<ii>])
					SetArrayElement ArrayName = num_in_band index = <ii> NewValue = (<num_in_band> [<ii>] + 1)
					break
				endif
			endif
			<ii> = (<ii> + 1)
			repeat 4
			getnextplayer Player = <Player>
			repeat <num_players>
			getfirstplayer
			begin
			getplayerinfo <Player> difficulty
			if ((<num_in_band> [<Player>]) < (<num_required> [<Player>]))
				<band_setup> = missing_part
				break
			elseif (<difficulty> = beginner)
				GetArraySize (<required_band>)
				if (<array_Size> > 1)
					<band_setup> = beginner_in_band
				endif
			endif
			getnextplayer Player = <Player>
			repeat <num_players>
		else
			<band_setup> = too_small
		endif
	else
		<band_setup> = no_band
	endif
	return band_setup = <band_setup> valid_players = <valid_players>
endscript

script challenge_validate_player_instrument \{goal_id = NULL
		Player = 0}
	<player_instrument> = invalid
	<required_band> = ($<goal_id>.required_band)
	getplayerinfo <Player> difficulty
	if GMan_GoalIsActive goal = <goal_id>
		gman_getdata goal = <goal_id> Player = <Player> Name = difficulty_check
	else
		<difficulty_check> = goal_inactive
	endif
	if NOT (<difficulty_check> = invalid)
		if NOT (<difficulty> = beginner)
			getplayerinfo <Player> part
			switch <part>
				case guitar
				<instrument> = lead
				case vocals
				<instrument> = vocal
				case bass
				case drum
				<instrument> = <part>
			endswitch
			if ((ArrayContains array = <required_band> contains = <instrument>) || (ArrayContains array = <required_band> contains = any))
				<player_instrument> = valid
			endif
		else
			<player_instrument> = invalid_is_beginner
		endif
	else
		<player_instrument> = invalid_was_beginner
	endif
	return player_instrument = <player_instrument>
endscript

script qp_get_score_string \{goal_name = !q1768515945
		score = !i1768515945}
	score_txt = qs(0x4569cb67)
	units_txt = qs(0x00000000)
	ExtendCrc <goal_name> '_info' out = challenge_struct
	if StructureContains structure = ($<challenge_struct>.constants) units_txt
		units_txt = ($<challenge_struct>.constants.units_txt)
	endif
	if StructureContains structure = ($<challenge_struct>.constants) score_converion_script
		conversion_script = ($<challenge_struct>.constants.score_converion_script)
		<conversion_script> score = <score>
	endif
	formatText TextName = score_txt qs(0xc05908d1) s = <score> u = <units_txt> usecommas DecimalPlaces = 2
	return score_text = <score_txt>
endscript

script quickplay_get_grade \{goal_id = !q1768515945}
	<grade> = 0
	<last_grade> = 0
	<previous_grade> = 0
	<pending_grade> = 0
	if GMan_GoalIsActive goal = <goal_id>
		if gman_ispowerscoreenabled
			gman_getassignedplayer goal_name = <goal_id>
			gman_getdata goal = <goal_id> Player = <assigned_player> Name = pending_grade
			gman_getdata goal = <goal_id> Player = <assigned_player> Name = previous_grade
		else
			gman_getgrade goal = <goal_id>
		endif
	endif
	return grade = <grade> last_grade = <last_grade> previous_grade = <previous_grade> pending_grade = <pending_grade>
endscript
