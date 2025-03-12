
script challenge_set_difficulty \{player = all
		level = 0}
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
		gman_getgrade goal = <goal_id>
		switch <level>
			case 0
			gman_setdata goal = <goal_id> player = <player> params = {current_target = ($<goal_id>.gold_descrip)}
			if (<pending_grade> = 0)
				gman_setpendinggrade goal = <goal_id> grade = 0
			endif
			case 1
			gman_setdata goal = <goal_id> player = <player> params = {current_target = ($<goal_id>.platinum_descrip)}
			if (<pending_grade> < 1)
				gman_setpendinggrade goal = <goal_id> grade = 1
			endif
			case 2
			gman_setdata goal = <goal_id> player = <player> params = {current_target = ($<goal_id>.diamond_descrip)}
			if (<pending_grade> < 2)
				gman_setpendinggrade goal = <goal_id> grade = 2
			endif
			case 3
			if NOT (<pending_grade> < 3)
				gman_setpendinggrade goal = <goal_id> grade = 3
			endif
		endswitch
		if (<player> = all)
			getnextplayer player = <player>
		endif
		repeat <num_players>
	endif
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

script challenge_set_pending_grade 
	gman_getdata goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	gman_getgrade goal = <goal_id>
	if (<level> > <pending_grade>)
		gman_setpendinggrade goal = <goal_id> grade = <level>
	endif
	if NOT gotparam \{player}
		<player> = 1
	endif
	<i> = 0
	begin
	if (($debug_grade_times [<i>].player) = <player>)
		getsongtime
		getplayerinfo <player> current_song_name
		<song_info> = (($gh_songlist_props).<current_song_name>)
		<song_progress> = ((<songtime> / (<song_info>.duration)) * 100)
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
	if NOT gotparam \{goal_id}
		challenge_get_goal_id
	endif
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
			gman_songfunc \{func = get_current_song_playlist_index}
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
			<i> = 0
			begin
			getplayerinfo (<i> + 1) difficulty
			if ((<num_in_band> [<i>]) < (<num_required> [<i>]))
				<band_setup> = missing_part
				break
			elseif (<difficulty> = beginner)
				getarraysize (<required_band>)
				if (<array_size> > 1)
					<band_setup> = beginner_in_band
				endif
			endif
			<i> = (<i> + 1)
			repeat 4
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
		gman_songfunc \{func = get_current_song_playlist_index}
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

script challenge_get_goal_id 
	gman_challengemanagerfunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	<goal_id> = <current_challenge>
	return goal_id = <goal_id>
endscript

script challenge_section_monitor 
	begin
	block \{type = song_section_end}
	<section> = (<event_data>.section)
	spawnscriptnow challenge_section_ended id = <goal_id> params = {section = <section> goal_id = <goal_id>}
	repeat
endscript

script challenge_section_ended 
	gman_songfunc \{func = get_current_song_playlist_index}
	<current_song_index> = (<current_song_index> - 1)
	<required_sections> = ($<goal_id>.song_sections [<current_song_index>])
	getarraysize ($<goal_id>.required_band)
	<required_band_size> = <array_size>
	if arraycontains array = <required_sections> contains = <section>
		if NOT arraycontains array = <required_sections> contains = (<section> + 1)
			if (<required_band_size> > 1)
				getfirstplayer
				gman_getdata goal = <goal_id> player = <player> name = current_section_progress
				gman_getdata goal = <goal_id> player = <player> name = valid_sections_progress
				<new_valid_sections_progress> = (<current_section_progress> + <valid_sections_progress>)
				gman_setdata goal = <goal_id> player = <player> params = {valid_sections_progress = <new_valid_sections_progress> current_section_progress = 0}
			else
				gman_getdata goal = <goal_id> name = valid_players
				getarraysize <valid_players>
				<i> = 0
				begin
				<player> = (<valid_players> [<i>])
				gman_getdata goal = <goal_id> player = <player> name = current_section_progress
				gman_getdata goal = <goal_id> player = <player> name = valid_sections_progress
				<new_valid_sections_progress> = (<current_section_progress> + <valid_sections_progress>)
				gman_setdata goal = <goal_id> player = <player> params = {valid_sections_progress = <new_valid_sections_progress> current_section_progress = 0}
				<i> = (<i> + 1)
				repeat <array_size>
			endif
		endif
	else
		if arraycontains array = <required_sections> contains = (<section> + 1)
			gman_getconstant goal = <goal_id> name = challenge_metric
			if NOT gotparam \{challenge_metric}
				scriptassert 'Section watcher requires challenge metric to be defined in goal constants! %g' g = <goal_id>
			endif
			switch <challenge_metric>
				case score
				gman_getdata goal = <goal_id> name = valid_players
				getarraysize <valid_players>
				<i> = 0
				begin
				<player> = (<valid_players> [<i>])
				if (<required_band_size> > 1)
					getplayerinfo <player> band
					getbandinfo <band> score
				else
					getplayerinfo <player> score
				endif
				gman_setdata goal = <goal_id> player = <player> params = {section_starting_value = <score>}
				<i> = (<i> + 1)
				repeat <array_size>
				case streak
				gman_getdata goal = <goal_id> name = valid_players
				getarraysize <valid_players>
				<i> = 0
				begin
				<player> = (<valid_players> [<i>])
				getplayerinfo <player> current_run
				gman_setdata goal = <goal_id> player = <player> params = {section_starting_value = <current_run>}
				<i> = (<i> + 1)
				repeat <array_size>
				case calculated_value
				gman_getdata goal = <goal_id> name = valid_players
				getarraysize <valid_players>
				<i> = 0
				begin
				<player> = (<valid_players> [<i>])
				gman_getdata goal = <goal_id> player = <player> name = <calculated_value>
				gman_setdata goal = <goal_id> player = <player> params = {section_starting_value = <calculated_value>}
				<i> = (<i> + 1)
				repeat <array_size>
			endswitch
		endif
	endif
endscript

script challenge_update_current_section_progress 
	gman_getdata goal = <goal_id> player = <player> name = section_starting_value
	if (<current_value> < <section_starting_value>)
		gman_setdata goal = <goal_id> player = <player> params = {section_starting_value = 0}
		<current_section_progress> = (<current_value>)
	else
		<current_section_progress> = (<current_value> - <section_starting_value>)
	endif
	gman_setdata goal = <goal_id> player = <player> params = {current_section_progress = <current_section_progress>}
	gman_getdata goal = <goal_id> player = <player> name = valid_sections_progress
	<current_progress> = (<current_section_progress> + <valid_sections_progress>)
	return current_progress = <current_progress>
endscript

script challenge_multi_song_difficulty_check 
	gman_songfunc \{func = get_current_song_playlist_index}
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
	gman_getgrade goal = <goal_id>
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
	gman_setdata goal = <goal_id> player = <player> params = {meter_high = <meter_high_retry>}
	getnextplayer player = <player>
	repeat <num_players>
endscript

script challenge_output_debug_info 
	if NOT gotparam \{goal_id}
		challenge_get_goal_id
		if (<goal_id> = none)
			return
		endif
	elseif NOT gman_goalisactive goal = <goal_id>
		return
	endif
	formattext textname = gold_text '%m%u' m = ($<goal_id>.gold_descrip) u = ($<goal_id>.target_display_units) usecommas
	formattext textname = plat_text '%m%u' m = ($<goal_id>.platinum_descrip) u = ($<goal_id>.target_display_units) usecommas
	formattext textname = dmnd_text '%m%u' m = ($<goal_id>.diamond_descrip) u = ($<goal_id>.target_display_units) usecommas
	<challenge_targets> = {gold = <gold_text> platinum = <plat_text> diamond = <dmnd_text>}
	getarraysize ($<goal_id>.required_band)
	if (<array_size> > 1)
		gman_getdata goal = <goal_id> player = 1 name = meter_high
		<best_attempt> = [{band = 1 meter_high = <meter_high>}]
	else
		<best_attempt> = []
	endif
	getnumplayersingame
	getfirstplayer
	begin
	challenge_validate_player_instrument goal_id = <goal_id> player = <player>
	if (<player_instrument> = valid)
		gman_getdata goal = <goal_id> player = <player> name = meter_high
		formattext textname = high_text '%m%u' m = <meter_high> u = ($<goal_id>.target_display_units) usecommas
		getplayerinfo <player> difficulty
		getplayerinfo <player> part
		<best_attempt> = (<best_attempt> + {player = <player> meter_high = <meter_high> difficulty = <difficulty> instrument = <part>})
	endif
	getnextplayer player = <player>
	repeat <num_players>
	getlocalsystemtime
	formattext textname = system_date '%m/%d/%y' m = (<localsystemtime>.month) d = (<localsystemtime>.dayofmonth) y = (<localsystemtime>.year)
	formattext textname = system_time '%h:%m:%s' h = (<localsystemtime>.hour) m = (<localsystemtime>.minute) s = (<localsystemtime>.second)
	<string_global> = ($<goal_id>.bonus_text)
	challenge_debug_info = {system_date = <system_date> system_time = <system_time> challenge_id = ($<goal_id>.id) challenge_text = ($<string_global>) challenge_targets = <challenge_targets> best_attempt = <best_attempt> achivement_moments = ($debug_grade_times)}
	printf \{channel = challenge_info
		''}
	printf \{channel = challenge_info
		'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'}
	printf \{channel = challenge_info
		'          START CHALLENGE DEBUG INFO'}
	printf \{channel = challenge_info
		'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'}
	printf \{channel = challenge_info
		''}
	printf \{channel = challenge_info
		'Please review this information, making sure it reflects your attempt at the challenge:'}
	printf \{channel = challenge_info
		''}
	printstruct <challenge_debug_info> channel = challenge_info
	printf \{channel = challenge_info
		''}
	printf \{channel = challenge_info
		'Excel-friendly csv format, please EMAIL the next line (with your comments) to gh5designroom@neversoft.com:'}
	getarraysize ($<goal_id>.required_band)
	if (<array_size> > 1)
		<band_text> = ''
		getnumplayersingame
		getfirstplayer
		begin
		getplayerinfo <player> difficulty
		getplayerinfo <player> part
		get_difficulty_text difficulty = <difficulty>
		get_part_text part = <part>
		formattext textname = player_text '%u/%m' m = <difficulty_text> u = <part_text>
		formattext textname = new_text '%u %m' m = <player_text> u = <band_text>
		<band_text> = <new_text>
		getnextplayer player = <player>
		repeat <num_players>
		printf channel = challenge_info 'Band Challenge,%a,%g,%b,%c,%d,%e,%f,%h,%p,%k,%m,%n,%o,YOUR_COMMENTS (ie. felt too easy/too hard/just right)' a = ($<goal_id>.id) b = <system_date> c = <system_time> d = ($<goal_id>.gold_descrip) e = ($<goal_id>.platinum_descrip) f = ($<goal_id>.diamond_descrip) g = <string_global> h = (<best_attempt> [0].meter_high) k = ($debug_grade_times [0].gold) m = ($debug_grade_times [0].platinum) n = ($debug_grade_times [0].diamond) o = <band_text> p = ($<goal_id>.target_display_units)
	else
		getnumplayersingame
		getfirstplayer
		begin
		challenge_validate_player_instrument goal_id = <goal_id> player = <player>
		if (<player_instrument> = valid)
			<i> = 0
			begin
			if ((<best_attempt> [<i>].player) = <player>)
				<player_attempt> = (<best_attempt> [<i>])
				<pi> = (<player> - 1)
				getplayerinfo <player> difficulty
				getplayerinfo <player> part
				get_difficulty_text difficulty = <difficulty>
				get_part_text part = <part>
				formattext textname = player_text '%u/%m' m = <difficulty_text> u = <part_text>
				printf channel = challenge_info 'Individual Challenge,%a,%g,%b,%c,%d,%e,%f,%h,%p,%k,%m,%n,%o,YOUR_COMMENTS (ie. felt too easy/too hard/just right)' a = ($<goal_id>.id) b = <system_date> c = <system_time> d = ($<goal_id>.gold_descrip) e = ($<goal_id>.platinum_descrip) f = ($<goal_id>.diamond_descrip) g = <string_global> h = (<player_attempt>.meter_high) k = ($debug_grade_times [<pi>].gold) m = ($debug_grade_times [<pi>].platinum) n = ($debug_grade_times [<pi>].diamond) o = <player_text> p = ($<goal_id>.target_display_units)
				break
			endif
			<i> = (<i> + 1)
			repeat <num_players>
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	printf \{channel = challenge_info
		''}
	printf \{channel = challenge_info
		'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'}
	printf \{channel = challenge_info
		'          END CHALLENGE DEBUG INFO'}
	printf \{channel = challenge_info
		'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'}
	printf \{channel = challenge_info
		''}
	change \{debug_grade_times = [
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
		]}
endscript
