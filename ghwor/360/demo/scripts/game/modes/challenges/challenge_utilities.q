
script challenge_qp_calculate_current_progress \{goal_id = null
		player = -1
		current_value = 0
		var_type = null}
	if gman_sectionwatcherfunc goal = <goal_id> tool = section_watcher func = in_watched_section
		gman_getdata goal = <goal_id> player = <player> name = section_base_value
		gman_getdata goal = <goal_id> player = <player> name = previous_progress
		if (<var_type> = incremental)
			<current_progress> = (<current_value> + <previous_progress>)
		else
			<current_progress> = (<current_value> - <section_base_value> + <previous_progress>)
		endif
	else
		gman_getdata goal = <goal_id> player = <player> name = current_progress
		gman_setdata goal = <goal_id> player = <player> params = {section_base_value = <current_value> previous_progress = <current_progress>}
	endif
	return current_progress = <current_progress>
endscript

script challenge_qp_calculate_total_band_progress \{goal_id = null}
	<total_band_progress> = 0
	getnumplayersingame
	if (<num_players> > 1)
		getfirstplayer
		begin
		gman_getdata goal = <goal_id> player = <player> name = current_progress
		<total_band_progress> = (<total_band_progress> + <current_progress>)
		getnextplayer player = <player>
		repeat <num_players>
	endif
	return total_band_progress = <total_band_progress>
endscript

script challenge_qp_current_section_is_valid \{goal_id = null}
	if gman_sectionwatcherfunc goal = <goal_id> tool = section_watcher func = in_watched_section
		return \{true}
	else
		return \{false}
	endif
endscript

script challenge_qp_evaluate_progress \{current_value = 0
		goal_id = null
		player = 0}
	gman_getdata goal = <goal_id> name = calculated_targets
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
			orig_player = <player>
			if (<player> < 1)
				player = ($g_leader_player_num)
			endif
			if (<player> > 0)
				playlist_getcurrentsong
				gman_getgoalname goal = <goal_id>
				gman_getqpsavechecksums song = <current_song> goal_name = <goal_name> assigned_player = <player>
				getplayerinfo <player> bot_play
				if (<bot_play> = 1)
					getplayerinfo <player> bot_original_controller
					<controller> = <bot_original_controller>
				else
					getplayerinfo <player> controller
				endif
				getsavegamefromcontroller controller = <controller>
				getglobaltags savegame = <savegame> <current_song>
				if (<new_grade> > <...>.<grade_checksum>)
					getglobaltags savegame = <savegame> user_options param = show_challenge_icons_save
					if (<show_challenge_icons_save> = 1)
						add_quickplay_challenge_alert {challenge_instance_id = <goal_id> grade = <new_grade>}
					endif
				endif
			else
				printf 'WARNING: Leader Player Number (%p) is INVALID (challenge_qp_evaluate_progress)' p = <player>
			endif
			if NOT cd
				challenge_store_grade_mark player = <orig_player> goal_id = <goal_id> grade = <new_grade>
			endif
		endif
	endif
endscript

script challenge_store_grade_mark \{player = -1
		goal_id = null
		grade = 0}
	getsongtime
	playlist_getcurrentsong
	<song_info> = (($gh_songlist_props).<current_song>)
	<song_progress> = ((<songtime> / (<song_info>.duration + 5)) * 100)
	if (<player> > 0)
		switch <grade>
			case 1
			gman_setdata goal = <goal_id> player = <player> params = {gold_mark = <song_progress>}
			case 2
			gman_setdata goal = <goal_id> player = <player> params = {platinum_mark = <song_progress>}
			case 3
			gman_setdata goal = <goal_id> player = <player> params = {diamond_mark = <song_progress>}
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

script challenge_is_band_subtype \{goal_id = null}
	gman_getgoalsubtype goal = <goal_id>
	gman_getassignedplayer goal_name = <goal_id>
	if (<goal_subtype> = band)
		if (<assigned_player> = 0)
			return \{true}
		else
			scriptassert 'Quickplay Challenge [%c] assigned to a band that is not a band variant!' c = <goal_id>
		endif
	else
		return \{false}
	endif
endscript
g_qp_autotest_stats = [
]
g_qp_autotest_failed = 0

script challenge_output_grade_marks \{goal_id = null
		assigned_player = 1}
	if cd
		return
	endif
	if ($autotest_on = 0)
		return
	endif
	wait \{1
		second}
	player = <assigned_player>
	<gold_mark> = 0
	<platinum_mark> = 0
	<diamond_mark> = 0
	gman_getdata goal = <goal_id> name = calculated_targets
	<gold_target> = (<calculated_targets> [0])
	<platinum_target> = (<calculated_targets> [1])
	<diamond_target> = (<calculated_targets> [2])
	gman_getassignedplayer goal_name = <goal_id>
	playlist_getcurrentsong
	if (<assigned_player> > 0)
		gman_getdata goal = <goal_id> player = <assigned_player>
		getplayerinfo <assigned_player> part
		getplayerinfo <assigned_player> difficulty
		getavgmultiplierfromdetailedstats player = <assigned_player>
		get_percent_notes_hit player_index = <assigned_player>
	else
		gman_getdata goal = <goal_id>
		<part> = band
		<difficulty> = none
		getfirstplayer
		getplayerinfo <player> band
		avg_multiplier = ($song_stats_backup_band [(<band> - 1)].high_mult)
		get_percent_notes_hit_for_band band = <band>
		player = 0
	endif
	stats_struct = {
		name = <goal_id>
		player = <assigned_player>
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
		addarrayelement array = <temp_stats> element = <stats_struct>
		change g_qp_autotest_stats = <array>
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
			change \{g_qp_autotest_failed = 1}
		endif
	endif
endscript

script quickplay_autotest_write_log 
	getarraysize ($g_qp_autotest_stats)
	if (<array_size> = 0)
		printf \{'Quickplay Autotest - No challenge stats found, something went horribly wrong!'}
		return
	endif
	first_challenge_stat = ($g_qp_autotest_stats [0])
	current_song = (<first_challenge_stat>.current_song)
	if structurecontains structure = (($gh_songlist_props).<current_song>) allowed_in_quickplay
		if ((($gh_songlist_props).<current_song>).allowed_in_quickplay = 0)
			return
		endif
	endif
	if ($g_qp_autotest_failed = 1)
		formattext textname = filename '%a' a = <song_name> dontassertforchecksums
		formattext textname = csv_filename '%a_CSV' a = <song_name> dontassertforchecksums
	else
		formattext textname = filename '%a' a = <song_name> dontassertforchecksums
		formattext textname = csv_filename '%a_CSV' a = <song_name> dontassertforchecksums
	endif
	textoutputstart filename = <filename>
	getlocalsystemtime
	formattext {
		textname = temp_text
		qs(0x1085b745)
		a = (<localsystemtime>.month + 1)
		b = (<localsystemtime>.dayofmonth)
		c = (<localsystemtime>.year)
		d = (<localsystemtime>.hour)
		e = (<localsystemtime>.minute)
	}
	textoutput text = <temp_text>
	if ($g_qp_autotest_failed = 1)
		textoutput \{text = qs(0x89610145)}
		textoutput \{text = qs(0x03ac90f0)}
		textoutput \{text = qs(0x03ac90f0)}
	else
		textoutput \{text = qs(0xa2689597)}
		textoutput \{text = qs(0x03ac90f0)}
		textoutput \{text = qs(0x03ac90f0)}
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
	elseif ((<challenge_stats>.difficulty) = expert || (<challenge_stats>.difficulty) = none)
		test_target_progress = (<challenge_stats>.diamond_target)
	else
		test_target_progress = 0
	endif
	if ((<challenge_stats>.final_progress) >= <test_target_progress>)
		formattext textname = temp_text qs(0x3435a984) a = (<challenge_stats>.name) dontassertforchecksums
		textoutput text = <temp_text>
	else
		formattext textname = temp_text qs(0xc734bd57) a = (<challenge_stats>.name) dontassertforchecksums
		textoutput text = <temp_text>
	endif
	formattext textname = temp_text qs(0xc1a656dc) a = (<challenge_stats>.name) dontassertforchecksums
	textoutput text = <temp_text>
	formattext textname = temp_text qs(0x617df3ff) a = (<challenge_stats>.current_song) dontassertforchecksums
	textoutput text = <temp_text>
	formattext textname = temp_text qs(0x46a5881b) a = (<challenge_stats>.part) dontassertforchecksums
	textoutput text = <temp_text>
	formattext textname = temp_text qs(0x0bbe44ff) a = (<challenge_stats>.difficulty) dontassertforchecksums
	textoutput text = <temp_text>
	formattext textname = temp_text qs(0xd6d46fdf) a = (<challenge_stats>.player) dontassertforchecksums
	textoutput text = <temp_text>
	textoutput \{text = qs(0x03ac90f0)}
	if ((<challenge_stats>.gold_mark) = 0)
		formattext textname = temp_text qs(0x2ca488f6) a = (<challenge_stats>.gold_target) decimalplaces = 2 usecommas
	else
		formattext textname = temp_text qs(0x748be1d5) a = (<challenge_stats>.gold_target) b = (<challenge_stats>.gold_mark) decimalplaces = 2 usecommas
	endif
	textoutput text = <temp_text>
	if ((<challenge_stats>.platinum_mark) = 0)
		formattext textname = temp_text qs(0xbc03063b) a = (<challenge_stats>.platinum_target) decimalplaces = 2 usecommas
	else
		formattext textname = temp_text qs(0x2d61cfc4) a = (<challenge_stats>.platinum_target) b = (<challenge_stats>.platinum_mark) decimalplaces = 2 usecommas
	endif
	textoutput text = <temp_text>
	if ((<challenge_stats>.diamond_mark) = 0)
		formattext textname = temp_text qs(0x97cfee87) a = (<challenge_stats>.diamond_target) decimalplaces = 2 usecommas
	else
		formattext textname = temp_text qs(0x0496dfcf) a = (<challenge_stats>.diamond_target) b = (<challenge_stats>.diamond_mark) decimalplaces = 2 usecommas
	endif
	textoutput text = <temp_text>
	textoutput \{text = qs(0x03ac90f0)}
	formattext textname = temp_text qs(0x561df95b) a = (<challenge_stats>.final_progress) usecommas
	textoutput text = <temp_text>
	if (<challenge_stats>.player = 0)
		formattext textname = temp_text qs(0x40fe5221) a = (<challenge_stats>.avg_mult) decimalplaces = 2
	else
		formattext textname = temp_text qs(0x6ecd4547) a = (<challenge_stats>.avg_mult) decimalplaces = 2
	endif
	textoutput text = <temp_text>
	formattext textname = temp_text qs(0xa15be774) a = (<challenge_stats>.percent_notes_hit)
	textoutput text = <temp_text>
	textoutput \{text = qs(0x03ac90f0)}
	textoutput \{text = qs(0x03ac90f0)}
	i = (<i> + 1)
	repeat <array_size>
	textoutputend output_text filename = <filename>
	textoutputstart filename = <csv_filename>
	getlocalsystemtime
	i = 0
	begin
	challenge_stats = ($g_qp_autotest_stats [<i>])
	formattext textname = csv_data {
		qs(0x3ee47ae3)
		p = (<localsystemtime>.month + 1)
		q = (<localsystemtime>.dayofmonth)
		r = (<localsystemtime>.year)
		s = (<localsystemtime>.hour)
		t = (<localsystemtime>.minute)
		a = (<challenge_stats>.name)
		b = (<challenge_stats>.current_song)
		c = (<challenge_stats>.part)
		d = (<challenge_stats>.difficulty)
		e = (<challenge_stats>.player)
		f = (<challenge_stats>.gold_target)
		g = (<challenge_stats>.gold_mark)
		h = (<challenge_stats>.platinum_target)
		i = (<challenge_stats>.platinum_mark)
		j = (<challenge_stats>.diamond_target)
		k = (<challenge_stats>.diamond_mark)
		l = (<challenge_stats>.final_progress)
		m = (<challenge_stats>.avg_mult)
		n = (<challenge_stats>.percent_notes_hit)
		dontassertforchecksums
	}
	textoutput text = <csv_data>
	i = (<i> + 1)
	repeat <array_size>
	textoutputend output_text filename = <csv_filename>
endscript

script career_autotest_write_log 
	playlist_getcurrentsong
	formattext textname = filename '%a' a = <current_song> dontassertforchecksums
	formattext textname = csv_filename '%a_CSV' a = <current_song> dontassertforchecksums
	textoutputstart filename = <filename>
	getlocalsystemtime
	formattext {
		textname = temp_text
		qs(0x1085b745)
		a = (<localsystemtime>.month + 1)
		b = (<localsystemtime>.dayofmonth)
		c = (<localsystemtime>.year)
		d = (<localsystemtime>.hour)
		e = (<localsystemtime>.minute)
	}
	textoutput text = <temp_text>
	textoutput \{text = qs(0xcfdd656c)}
	textoutput \{text = qs(0x03ac90f0)}
	textoutput \{text = qs(0x03ac90f0)}
	formattext textname = temp_text qs(0x617df3ff) a = <current_song> dontassertforchecksums
	textoutput text = <temp_text>
	textoutput \{text = qs(0x03ac90f0)}
	judy_stars_cur = 0
	judy_stars_max = 0
	axel_stars_cur = 0
	axel_stars_max = 0
	casey_stars_cur = 0
	casey_stars_max = 0
	johny_stars_cur = 0
	johny_stars_max = 0
	autotest_powers = ($g_autotest_career_powers)
	getarraysize <autotest_powers> param = num_powers
	power_index = 0
	textoutput \{text = qs(0xb12af73a)}
	textoutput \{text = qs(0x8e59c26b)}
	textoutput \{text = qs(0x03ac90f0)}
	getfirstplayer
	begin
	getplayerinfo <player> band
	current_power = (<autotest_powers> [<power_index>])
	if (<current_power>.level != 0)
		formattext textname = temp_text qs(0x97393b35) a = (<current_power>.power) b = (<current_power>.level) dontassertforchecksums
		textoutput text = <temp_text>
		switch (<current_power>.power)
			case gh_rocker_judy
			getbandinfo <band> crowd_meter_bonus_stars
			judy_stars_cur = <crowd_meter_bonus_stars>
			if (<current_power>.level = 1)
				judy_stars_max = ($g_crowd_meter_star_bonus_max_1)
				formattext textname = temp_text qs(0xa9d5efbb) a = <crowd_meter_bonus_stars> b = ($g_crowd_meter_star_bonus_max_1)
			else
				judy_stars_max = ($g_crowd_meter_star_bonus_max_2)
				formattext textname = temp_text qs(0xa9d5efbb) a = <crowd_meter_bonus_stars> b = ($g_crowd_meter_star_bonus_max_2)
			endif
			textoutput text = <temp_text>
			case gh_rocker_axel
			getbandinfo <band> used_resurrection_lives
			getbandinfo <band> max_resurrection_lives
			axel_stars_cur = (<max_resurrection_lives> - <used_resurrection_lives>)
			axel_stars_max = <max_resurrection_lives>
			formattext textname = temp_text qs(0x78298375) a = <axel_stars_cur> b = <max_resurrection_lives>
			textoutput text = <temp_text>
			case gh_rocker_casey
			getbandinfo <band> streak_bonus_stars
			casey_stars_cur = <streak_bonus_stars>
			if (<current_power>.level = 1)
				getarraysize ($g_casey_notestreak_thresholds_1)
				casey_stars_max = <array_size>
			else
				getarraysize ($g_casey_notestreak_thresholds_2)
				casey_stars_max = <array_size>
			endif
			formattext textname = temp_text qs(0xd6af51ed) a = <streak_bonus_stars> b = <array_size>
			textoutput text = <temp_text>
			case gh_rocker_casey_2
			getbandinfo <band> streak_bonus_stars
			getarraysize ($g_casey_notestreak_thresholds_2)
			casey_stars_cur = <streak_bonus_stars>
			casey_stars_max = <array_size>
			case gh_rocker_johnny
			getbandinfo <band> mult_timer_bonus_stars
			johny_stars_cur = <mult_timer_bonus_stars>
			if (<current_power>.level = 1)
				johny_stars_max = ($g_multiplier_star_bonus_max_1)
				formattext textname = temp_text qs(0x83322d2e) a = <mult_timer_bonus_stars> b = ($g_multiplier_star_bonus_max_1)
			else
				johny_stars_max = ($g_multiplier_star_bonus_max_2)
				formattext textname = temp_text qs(0x83322d2e) a = <mult_timer_bonus_stars> b = ($g_multiplier_star_bonus_max_2)
			endif
			textoutput text = <temp_text>
		endswitch
		textoutput \{text = qs(0x03ac90f0)}
	endif
	power_index = (<power_index> + 1)
	repeat <num_powers>
	textoutput \{text = qs(0x03ac90f0)}
	textoutput \{text = qs(0x03ac90f0)}
	if ($g_autotest_career_target_stars > 0)
		textoutput \{text = qs(0xb12af73a)}
		if ($g_autotest_career_target_hit > 0)
			formattext textname = temp_text qs(0xecc3e979) a = ($g_autotest_career_target_stars) b = ($g_autotest_career_target_hit * 100) decimalplaces = 0
		else
			formattext textname = temp_text qs(0xf8a80ba2) a = ($g_autotest_career_target_stars)
		endif
		textoutput text = <temp_text>
		textoutput \{text = qs(0x03ac90f0)}
		textoutput \{text = qs(0x03ac90f0)}
	endif
	getnumplayersingame
	getfirstplayer
	textoutput \{text = qs(0xb12af73a)}
	textoutput \{text = qs(0xc8e84f5a)}
	textoutput \{text = qs(0x03ac90f0)}
	getplayerinfo <player> band
	band_score = ($song_stats_backup_band [(<band> - 1)].score)
	casttointeger \{band_score}
	formattext textname = temp_text qs(0x02af8dde) a = <band_score> usecommas
	textoutput text = <temp_text>
	formattext textname = temp_text qs(0xf85aef1a) a = ($song_stats_backup_band [(<band> - 1)].stars)
	textoutput text = <temp_text>
	formattext textname = temp_text qs(0x6367938c) a = ($song_stats_backup_band [(<band> - 1)].high_mult) decimalplaces = 1
	textoutput text = <temp_text>
	formattext textname = temp_text qs(0xa6d78276) a = ($song_stats_backup_band [(<band> - 1)].band_moments_hit) b = ($song_stats_backup_band [(<band> - 1)].band_moments_possible)
	textoutput text = <temp_text>
	textoutput \{text = qs(0x03ac90f0)}
	textoutput \{text = qs(0x03ac90f0)}
	player_data = [
		{
			part = none
			diff = none
			score = 0
			stars = 0
			mult = 0
			acc = 0
		}
		{
			part = none
			diff = none
			score = 0
			stars = 0
			mult = 0
			acc = 0
		}
		{
			part = none
			diff = none
			score = 0
			stars = 0
			mult = 0
			acc = 0
		}
		{
			part = none
			diff = none
			score = 0
			stars = 0
			mult = 0
			acc = 0
		}
	]
	textoutput \{text = qs(0xb12af73a)}
	textoutput \{text = qs(0xa52fef73)}
	textoutput \{text = qs(0x03ac90f0)}
	begin
	data = (<player_data> [<player> -1])
	song_stats = ($song_stats_backup [<player> - 1])
	formattext textname = temp_text qs(0xd6d46fdf) a = <player>
	textoutput text = <temp_text>
	getplayerinfo <player> part
	formattext textname = temp_text qs(0x46a5881b) a = <part> dontassertforchecksums
	textoutput text = <temp_text>
	getplayerinfo <player> difficulty
	formattext textname = temp_text qs(0x0bbe44ff) a = <difficulty> dontassertforchecksums
	textoutput text = <temp_text>
	formattext textname = temp_text qs(0x374c819b) a = (<song_stats>.score) usecommas
	textoutput text = <temp_text>
	getplayerinfo <player> projected_song_stars
	formattext textname = temp_text qs(0x7eca0126) a = <projected_song_stars> decimalplaces = 1
	textoutput text = <temp_text>
	formattext textname = temp_text qs(0x6ecd4547) a = (<song_stats>.avg_multiplier) decimalplaces = 1
	textoutput text = <temp_text>
	get_percent_notes_hit player_index = <player>
	formattext textname = temp_text qs(0xa15be774) a = <percent_notes_hit>
	textoutput text = <temp_text>
	textoutput \{text = qs(0x03ac90f0)}
	textoutput \{text = qs(0x03ac90f0)}
	data = {
		part = <part>
		diff = <difficulty>
		score = (<song_stats>.score)
		stars = <projected_song_stars>
		mult = (<song_stats>.avg_multiplier)
		acc = <percent_notes_hit>
	}
	setarrayelement arrayname = player_data index = (<player> -1) newvalue = <data>
	getnextplayer player = <player>
	repeat <num_players>
	textoutputend output_text filename = <filename>
	textoutputstart filename = <csv_filename>
	getlocalsystemtime
	formattext {
		textname = temp_date
		qs(0x9c5b8f4e)
		a = (<localsystemtime>.month + 1)
		b = (<localsystemtime>.dayofmonth)
		c = (<localsystemtime>.year)
		d = (<localsystemtime>.hour)
		e = (<localsystemtime>.minute)
	}
	getfirstplayer
	getplayerinfo <player> band
	band_score = ($song_stats_backup_band [(<band> - 1)].score)
	casttointeger \{band_score}
	formattext textname = csv_data1 {
		qs(0x5c660f08)
		a = <current_song>
		b = (<autotest_powers> [0].level)
		c = (<autotest_powers> [1].level)
		d = (<autotest_powers> [2].level)
		e = <johny_stars_cur>
		f = <johny_stars_max>
		g = (<autotest_powers> [3].level)
		h = <axel_stars_cur>
		i = <axel_stars_max>
		j = (<autotest_powers> [4].level)
		k = <judy_stars_cur>
		l = <judy_stars_max>
		m = (<autotest_powers> [5].level)
		n = (<autotest_powers> [6].level)
		o = (<autotest_powers> [7].level)
		p = <casey_stars_cur>
		q = <casey_stars_max>
		r = ($g_autotest_career_target_stars)
		s = ($g_autotest_career_target_hit * 100)
		t = <band_score>
		u = ($song_stats_backup_band [(<band> - 1)].stars)
		v = ($song_stats_backup_band [(<band> - 1)].high_mult)
		dontassertforchecksums
	}
	formattext textname = csv_data2 {
		qs(0x8249614d)
		a = (<player_data> [0].part)
		b = (<player_data> [0].diff)
		c = (<player_data> [0].score)
		d = (<player_data> [0].stars)
		e = (<player_data> [0].mult)
		f = (<player_data> [0].acc)
		g = (<player_data> [1].part)
		h = (<player_data> [1].diff)
		i = (<player_data> [1].score)
		j = (<player_data> [1].stars)
		k = (<player_data> [1].mult)
		l = (<player_data> [1].acc)
		dontassertforchecksums
	}
	formattext textname = csv_data3 {
		qs(0xfe150ca5)
		m = (<player_data> [2].part)
		n = (<player_data> [2].diff)
		o = (<player_data> [2].score)
		p = (<player_data> [2].stars)
		q = (<player_data> [2].mult)
		r = (<player_data> [2].acc)
		s = (<player_data> [3].part)
		t = (<player_data> [3].diff)
		u = (<player_data> [3].score)
		v = (<player_data> [3].stars)
		w = (<player_data> [3].mult)
		x = (<player_data> [3].acc)
		dontassertforchecksums
	}
	csv_data = (<temp_date> + <csv_data1> + <csv_data2> + <csv_data3>)
	textoutput text = <csv_data>
	textoutputend output_text filename = <csv_filename>
endscript
debug_grade_times = [
	{
		player = 1
		gold = -1
		platinum = -1
		diamond = -1
	}
	{
		player = 2
		gold = -1
		platinum = -1
		diamond = -1
	}
	{
		player = 3
		gold = -1
		platinum = -1
		diamond = -1
	}
	{
		player = 4
		gold = -1
		platinum = -1
		diamond = -1
	}
]

script challenge_store_grade_time 
	if NOT gotparam \{player}
		<player> = 1
	endif
	<i> = 0
	begin
	if (($debug_grade_times [<i>].player) = <player>)
		getsongtime
		getplayerinfo <player> current_song_name
		<song_info> = (($gh_songlist_props).<current_song_name>)
		<song_progress> = ((<songtime> / (<song_info>.duration + 5)) * 100)
		switch <level>
			case 2
			<new_entry> = {player = <player> gold = <song_progress> platinum = ($debug_grade_times [<i>].platinum) diamond = ($debug_grade_times [<i>].diamond)}
			case 3
			<new_entry> = {player = <player> gold = ($debug_grade_times [<i>].gold) platinum = <song_progress> diamond = ($debug_grade_times [<i>].diamond)}
			case 4
			<new_entry> = {player = <player> gold = ($debug_grade_times [<i>].gold) platinum = ($debug_grade_times [<i>].platinum) diamond = <song_progress>}
			default
			<new_entry> = {invalid_level_passed = <level>}
		endswitch
		setarrayelement globalarray arrayname = debug_grade_times index = <i> newvalue = <new_entry>
		break
	endif
	<i> = (<i> + 1)
	repeat 4
endscript

script challenge_init_meter 
	<target_list> = []
	<target_list> = ((((<target_list> + ($<goal_id>.gold_descrip)) + ($<goal_id>.platinum_descrip)) + ($<goal_id>.diamond_descrip)))
	if NOT gotparam \{player}
		getarraysize ($<goal_id>.required_band)
		if (<array_size> > 1)
			<player> = band
		else
			<player> = all
		endif
	endif
	if (<player> = band)
		gman_getdata goal = <goal_id> name = band_setup
		if (<band_setup> = valid)
			gman_meterfunc {
				goal = <goal_id>
				tool = challenge_meter
				func = add_challenge_meter
				params = {band_meter band_index = 1 targets = <target_list>}
			}
			getfirstplayer
			getplayerinfo <player> band
			getnumplayersingame
			if (<num_players> > 0)
				getfirstplayer
				<meter_starting_value> = 0
				begin
				<player_instrument> = valid
				challenge_validate_player_instrument goal_id = <goal_id> player = <player>
				if (<player_instrument> = valid)
					gman_getconstant goal = <goal_id> name = challenge_metric
					if NOT gotparam \{challenge_metric}
						scriptassert 'Bank Progress requires challenge metric to be defined in goal constants! %g' g = <goal_id>
					endif
					switch <challenge_metric>
						case score
						gman_getdata goal = <goal_id> player = <player> name = banked_progress
						<meter_starting_value> = <banked_progress>
						break
						case calculated_value
						case streak
						gman_getdata goal = <goal_id> player = <player> name = banked_progress
						<meter_starting_value> = (<meter_starting_value> + <banked_progress>)
						default
						scriptassert 'challenge_bank_progress does not have a case for challenge metric (%m) defined in goal constants! %g ' g = <goal_id> m = <challenge_metric>
					endswitch
				endif
				getnextplayer player = <player>
				repeat <num_players>
			endif
			getfirstplayer
			challenge_meter_watcher_varupdated player = <player> current_value = <meter_starting_value>
		endif
	else
		if (<player> = all)
			getnumplayersingame
		else
			<num_players> = 1
		endif
		if (<num_players> > 0)
			if (<player> = all)
				getfirstplayer
			endif
			begin
			<player_instrument> = valid
			challenge_validate_player_instrument goal_id = <goal_id> player = <player>
			if (<player_instrument> = valid)
				gman_meterfunc {
					goal = <goal_id>
					tool = challenge_meter
					func = add_challenge_meter
					params = {player_meter player_index = <player> targets = <target_list>}
				}
				gman_getdata goal = <goal_id> player = <player> name = banked_progress
				challenge_meter_watcher_varupdated player = <player> current_value = <banked_progress>
			endif
			if (<num_players> > 1)
				getnextplayer player = <player>
			endif
			repeat <num_players>
		endif
	endif
endscript

script challenge_update_meter 
	if (<player> = band)
		<band> = 1
		gman_getdata goal = <goal_id> name = band_setup
		if (<band_setup> = valid)
			getfirstplayer
			gman_setdata goal = <goal_id> player = <player> params = {meter_displayed = <current_progress>}
			gman_getdata goal = <goal_id> player = <player> name = meter_high
			if gotparam \{meter_high}
				if (<meter_high> < <current_progress>)
					gman_setdata goal = <goal_id> player = <player> params = {meter_high = <current_progress>}
				endif
			else
				gman_setdata goal = <goal_id> player = <player> params = {meter_high = 0}
			endif
		endif
	else
		if (<player> = all)
			getnumplayersingame
		else
			<num_players> = 1
		endif
		if (<num_players> > 0)
			if (<player> = all)
				getfirstplayer
			endif
			begin
			<player_instrument> = valid
			challenge_validate_player_instrument goal_id = <goal_id> player = <player>
			if (<player_instrument> = valid)
				gman_setdata goal = <goal_id> player = <player> params = {meter_displayed = <current_progress>}
				gman_getdata goal = <goal_id> player = <player> name = meter_high
				if gotparam \{meter_high}
					if (<meter_high> < <current_progress>)
						gman_setdata goal = <goal_id> player = <player> params = {meter_high = <current_progress>}
					endif
				else
					gman_setdata goal = <goal_id> player = <player> params = {meter_high = 0}
				endif
			endif
			if (<player> = all)
				getnextplayer player = <player>
			endif
			repeat <num_players>
		endif
	endif
endscript

script challenge_meter_watcher_varupdated 
	gman_getdata goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	getarraysize ($<goal_id>.required_band)
	if (<array_size> > 1)
		getplayerinfo <player> band
		gman_meterfunc goal = <goal_id> tool = challenge_meter func = update_progress params = {band_meter band_index = <band> current_progress = <current_value>}
	else
		gman_meterfunc goal = <goal_id> tool = challenge_meter func = update_progress params = {player_meter player_index = <player> current_progress = <current_value>}
	endif
endscript

script challenge_get_lowest_band_difficulty_setting 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		<difficulties> = [beginner easy medium hard expert]
		<diff_index> = 4
		begin
		getplayerinfo <player> difficulty
		switch <difficulty>
			case beginner
			diff_index = 0
			break
			case easy
			diff_index = 1
			case medium
			if (<diff_index> > 1)
				diff_index = 2
			endif
			case hard
			if (<diff_index> > 2)
				diff_index = 3
			endif
			case expert
			if (<diff_index> > 3)
				diff_index = 4
			endif
		endswitch
		getnextplayer player = <player>
		repeat <num_players>
	endif
	lowest_difficulty = (<difficulties> [<diff_index>])
	return lowest_band_difficulty_setting = <lowest_difficulty>
endscript

script challenge_display_message \{text = qs(0x7223952e)
		time = 3
		pos = (640.0, 250.0)}
	if screenelementexists \{id = challenge_text_container}
		destroyscreenelement \{id = challenge_text_container}
	endif
	createscreenelement \{id = challenge_text_container
		type = containerelement
		parent = root_window}
	createscreenelement {
		id = challenge_text
		type = textelement
		parent = challenge_text_container
		font = debug
		text = <text>
		scale = 1.0
		pos = <pos>
		just = [center center]
		rgba = [150 185 200 255]
		z_priority = 80
	}
	createscreenelement {
		id = challenge_text_shadow
		type = textelement
		parent = challenge_text_container
		font = debug
		text = <text>
		scale = 1.0
		pos = (<pos> + (1.0, 1.0))
		just = [center center]
		rgba = [0 0 0 255]
		z_priority = 79
	}
	challenge_text :se_setprops \{alpha = 0}
	challenge_text_shadow :se_setprops \{alpha = 0}
	challenge_text :se_setprops \{alpha = 1}
	challenge_text_shadow :se_setprops \{alpha = 1}
	challenge_text :se_waitprops
endscript

script challenge_validate_band_setup \{goal_id = null}
	<required_band> = ($<goal_id>.required_band)
	<instruments> = [lead bass drum vocal]
	<num_required> = [0 0 0 0]
	<num_in_band> = [0 0 0 0]
	<band_setup> = valid
	<valid_players> = []
	getarraysize (<required_band>)
	getnumplayersingame
	if (<num_players> > 0)
		<num_valid_players> = 0
		getfirstplayer
		begin
		getplayerinfo <player> difficulty
		if NOT (<difficulty> = beginner)
			getplayerinfo <player> difficulty
			playlist_getcurrentsongindex
			if (<current_song_index> = 1)
				gman_setdata goal = <goal_id> player = <player> params = {difficulty_check = <difficulty>}
			endif
			challenge_validate_player_instrument goal_id = <goal_id> player = <player>
			if (<player_instrument> = valid)
				<valid_players> = (<valid_players> + <player>)
				<num_valid_players> = (<num_valid_players> + 1)
			endif
		endif
		getnextplayer player = <player>
		repeat <num_players>
		if (<num_valid_players> >= <array_size>)
			<i> = 0
			begin
			<ii> = 0
			begin
			if (<required_band> [<i>] = <instruments> [<ii>])
				setarrayelement arrayname = num_required index = <ii> newvalue = (<num_required> [<ii>] + 1)
				break
			endif
			<ii> = (<ii> + 1)
			repeat 4
			<i> = (<i> + 1)
			repeat <array_size>
			getfirstplayer
			begin
			<ii> = 0
			begin
			getplayerinfo <player> part
			getplayerinfo <player> difficulty
			if NOT (<difficulty> = beginner)
				<instruments> = [guitar bass drum vocals]
				if (<part> = <instruments> [<ii>])
					setarrayelement arrayname = num_in_band index = <ii> newvalue = (<num_in_band> [<ii>] + 1)
					break
				endif
			endif
			<ii> = (<ii> + 1)
			repeat 4
			getnextplayer player = <player>
			repeat <num_players>
			getfirstplayer
			begin
			getplayerinfo <player> difficulty
			if ((<num_in_band> [<player>]) < (<num_required> [<player>]))
				<band_setup> = missing_part
				break
			elseif (<difficulty> = beginner)
				getarraysize (<required_band>)
				if (<array_size> > 1)
					<band_setup> = beginner_in_band
				endif
			endif
			getnextplayer player = <player>
			repeat <num_players>
		else
			<band_setup> = too_small
		endif
	else
		<band_setup> = no_band
	endif
	return band_setup = <band_setup> valid_players = <valid_players>
endscript

script challenge_validate_player_instrument \{goal_id = null
		player = 0}
	<player_instrument> = invalid
	<required_band> = ($<goal_id>.required_band)
	getplayerinfo <player> difficulty
	if gman_goalisactive goal = <goal_id>
		gman_getdata goal = <goal_id> player = <player> name = difficulty_check
	else
		<difficulty_check> = goal_inactive
	endif
	if NOT (<difficulty_check> = invalid)
		if NOT (<difficulty> = beginner)
			getplayerinfo <player> part
			switch <part>
				case guitar
				<instrument> = lead
				case vocals
				<instrument> = vocal
				case bass
				case drum
				<instrument> = <part>
			endswitch
			if ((arraycontains array = <required_band> contains = <instrument>) || (arraycontains array = <required_band> contains = any))
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

script challenge_section_valid 
	if structurecontains structure = ($<goal_id>) song_sections
		gman_getdata goal = <goal_id> name = current_section
		playlist_getcurrentsongindex
		<current_song_index> = (<current_song_index> - 1)
		<required_sections> = ($<goal_id>.song_sections [<current_song_index>])
		if arraycontains array = <required_sections> contains = <current_section>
			return \{true}
		else
			return \{false}
		endif
	else
		return \{true}
	endif
endscript

script challenge_bank_progress 
	getarraysize ($<goal_id>.required_band)
	<required_band_size> = <array_size>
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		<player_instrument> = valid
		challenge_validate_player_instrument goal_id = <goal_id> player = <player>
		if (<player_instrument> = valid)
			gman_getconstant goal = <goal_id> name = challenge_metric
			if NOT gotparam \{challenge_metric}
				scriptassert 'Bank Progress requires challenge metric to be defined in goal constants! %g' g = <goal_id>
			endif
			switch <challenge_metric>
				case score
				if structurecontains structure = ($<goal_id>) song_sections
					getplayerinfo <player> band
					gman_getdata goal = <goal_id> player = <band>
					<current_progress> = (<current_section_progress> + <valid_sections_progress>)
				else
					if (<required_band_size> > 1)
						getplayerinfo <player> band
						getbandinfo <band> score
						<current_progress> = <score>
					else
						getplayerinfo <player> score
						<current_progress> = <score>
					endif
				endif
				case calculated_value
				gman_getconstant goal = <goal_id> name = calculated_value
				gman_getdata goal = <goal_id> player = <player> name = <calculated_value>
				<current_progress> = (<...>.<calculated_value>)
				case streak
				if structurecontains structure = ($<goal_id>) song_sections
					gman_getdata goal = <goal_id> player = <player>
					<current_progress> = (<current_section_progress> + <valid_sections_progress>)
				else
					getplayerinfo <player> current_run
					<current_progress> = (<current_run>)
				endif
				default
				scriptassert 'challenge_bank_progress does not have a case for challenge metric (%m) defined in goal constants! %g ' g = <goal_id> m = <challenge_metric>
			endswitch
			gman_getdata goal = <goal_id> player = <player> name = banked_progress
			<current_progress> = (<current_progress> + <banked_progress>)
			gman_setdata goal = <goal_id> player = <player> params = {banked_progress = <current_progress> reset_progress = <banked_progress>}
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script challenge_multi_song_difficulty_check 
	playlist_getcurrentsongindex
	if (<current_song_index> > 1)
		getnumplayersingame
		getfirstplayer
		begin
		gman_getdata goal = <goal_id> player = <player> name = difficulty_check
		if NOT (<difficulty_check> = invalid)
			getplayerinfo <player> difficulty
			if NOT (<difficulty_check> = <difficulty>)
				getarraysize ($<goal_id>.required_band)
				if (<array_size> > 1)
					gman_setdata goal = <goal_id> params = {band_setup = invalid}
					break
				else
					gman_setdata goal = <goal_id> player = <player> params = {banked_progress = 0}
					gman_setdata goal = <goal_id> player = <player> params = {difficulty_check = invalid}
					gman_setpendinggrade goal = <goal_id> grade = 0
				endif
			endif
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script challenge_store_meter_high_and_grade 
	quickplay_get_grade goal = <goal_id>
	gman_setdata goal = <goal_id> params = {retry_grade = <pending_grade>}
	getnumplayersingame
	getfirstplayer
	begin
	gman_getdata goal = <goal_id> player = <player> name = meter_high
	gman_setdata goal = <goal_id> player = <player> params = {meter_high_retry = <meter_high>}
	getnextplayer player = <player>
	repeat <num_players>
endscript

script challenge_restore_meter_high_and_grade 
	gman_getdata goal = <goal_id> name = retry_grade
	gman_setpendinggrade goal = <goal_id> grade = <retry_grade>
	getnumplayersingame
	getfirstplayer
	begin
	gman_getdata goal = <goal_id> player = <player> name = meter_high_retry
	gman_setdata goal = <goal_id> player = <player> params = {meter_displayed = <meter_high_retry>}
	gman_setdata goal = <goal_id> player = <player> params = {meter_high = <meter_high_retry>}
	gman_setdata goal = <goal_id> player = <player> params = {valid_sections_progress = 0}
	getnextplayer player = <player>
	repeat <num_players>
endscript

script qp_get_score_string \{goal_name = !q1768515945
		score = !i1768515945}
	score_txt = qs(0x4569cb67)
	units_txt = qs(0x00000000)
	extendcrc <goal_name> '_info' out = challenge_struct
	if structurecontains structure = ($<challenge_struct>.constants) units_txt
		units_txt = ($<challenge_struct>.constants.units_txt)
	endif
	if structurecontains structure = ($<challenge_struct>.constants) score_converion_script
		conversion_script = ($<challenge_struct>.constants.score_converion_script)
		<conversion_script> score = <score>
	endif
	formattext textname = score_txt qs(0xc05908d1) s = <score> u = <units_txt> usecommas decimalplaces = 2
	return score_text = <score_txt>
endscript

script quickplay_get_grade \{goal_id = !q1768515945}
	<grade> = 0
	<last_grade> = 0
	<previous_grade> = 0
	<pending_grade> = 0
	if gman_goalisactive goal = <goal_id>
		if gman_ispowerscoreenabled
			gman_getassignedplayer goal_name = <goal_id>
			gman_getdata goal = <goal_id> player = <assigned_player> name = pending_grade
			gman_getdata goal = <goal_id> player = <assigned_player> name = previous_grade
		else
			gman_getgrade goal = <goal_id>
		endif
	endif
	return grade = <grade> last_grade = <last_grade> previous_grade = <previous_grade> pending_grade = <pending_grade>
endscript
