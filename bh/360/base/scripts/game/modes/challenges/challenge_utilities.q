
script challenge_set_difficulty \{player = all
		level = 0}
	if (<player> = all)
		GetNumPlayersInGame
	else
		<num_players> = 1
	endif
	if (<num_players> > 0)
		if (<player> = all)
			GetFirstPlayer
		endif
		begin
		GMan_GetGrade goal = <goal_id>
		switch <level>
			case 0
			GMan_SetData goal = <goal_id> player = <player> params = {current_target = ($<goal_id>.gold_descrip)}
			if (<pending_grade> = 0)
				GMan_SetPendingGrade goal = <goal_id> grade = 0
			endif
			case 1
			GMan_SetData goal = <goal_id> player = <player> params = {current_target = ($<goal_id>.platinum_descrip)}
			if (<pending_grade> < 1)
				GMan_SetPendingGrade goal = <goal_id> grade = 1
			endif
			case 2
			GMan_SetData goal = <goal_id> player = <player> params = {current_target = ($<goal_id>.diamond_descrip)}
			if (<pending_grade> < 2)
				GMan_SetPendingGrade goal = <goal_id> grade = 2
			endif
			case 3
			if NOT (<pending_grade> < 3)
				GMan_SetPendingGrade goal = <goal_id> grade = 3
			endif
		endswitch
		if (<player> = all)
			GetNextPlayer player = <player>
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
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	GMan_GetGrade goal = <goal_id>
	if (<level> > <pending_grade>)
		GMan_SetPendingGrade goal = <goal_id> grade = <level>
	endif
	if NOT GotParam \{player}
		<player> = 1
	endif
	<i> = 0
	begin
	if (($debug_grade_times [<i>].player) = <player>)
		GetSongTime
		GetPlayerInfo <player> current_song_name
		<song_info> = (($gh_songlist_props).<current_song_name>)
		<song_progress> = ((<songtime> / (<song_info>.Duration)) * 100)
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
		SetArrayElement GlobalArray arrayName = debug_grade_times index = <i> newValue = <new_entry>
		break
	endif
	<i> = (<i> + 1)
	repeat 4
endscript

script challenge_init_meter 
	<target_list> = []
	<target_list> = ((((<target_list> + ($<goal_id>.gold_descrip)) + ($<goal_id>.platinum_descrip)) + ($<goal_id>.diamond_descrip)))
	if NOT GotParam \{player}
		GetArraySize ($<goal_id>.required_band)
		if (<array_size> > 1)
			<player> = Band
		else
			<player> = all
		endif
	endif
	if (<player> = Band)
		GMan_GetData goal = <goal_id> name = band_setup
		if (<band_setup> = valid)
			GMan_MeterFunc {
				goal = <goal_id>
				tool = challenge_meter
				func = add_challenge_meter
				params = {band_meter band_index = 1 targets = <target_list>}
			}
			GetFirstPlayer
			GetPlayerInfo <player> Band
			GetNumPlayersInGame
			if (<num_players> > 0)
				GetFirstPlayer
				<meter_starting_value> = 0
				begin
				<player_instrument> = valid
				challenge_validate_player_instrument goal_id = <goal_id> player = <player>
				if (<player_instrument> = valid)
					GMan_GetConstant goal = <goal_id> name = challenge_metric
					if NOT GotParam \{challenge_metric}
						ScriptAssert 'Bank Progress requires challenge metric to be defined in goal constants! %g' g = <goal_id>
					endif
					switch <challenge_metric>
						case score
						GMan_GetData goal = <goal_id> player = <player> name = banked_progress
						<meter_starting_value> = <banked_progress>
						break
						case calculated_value
						case streak
						GMan_GetData goal = <goal_id> player = <player> name = banked_progress
						<meter_starting_value> = (<meter_starting_value> + <banked_progress>)
						default
						ScriptAssert 'challenge_bank_progress does not have a case for challenge metric (%m) defined in goal constants! %g ' g = <goal_id> m = <challenge_metric>
					endswitch
				endif
				GetNextPlayer player = <player>
				repeat <num_players>
			endif
			GetFirstPlayer
			challenge_meter_watcher_varUpdated player = <player> current_value = <meter_starting_value>
		endif
	else
		if (<player> = all)
			GetNumPlayersInGame
		else
			<num_players> = 1
		endif
		if (<num_players> > 0)
			if (<player> = all)
				GetFirstPlayer
			endif
			begin
			<player_instrument> = valid
			challenge_validate_player_instrument goal_id = <goal_id> player = <player>
			if (<player_instrument> = valid)
				GMan_MeterFunc {
					goal = <goal_id>
					tool = challenge_meter
					func = add_challenge_meter
					params = {player_meter player_index = <player> targets = <target_list>}
				}
				GMan_GetData goal = <goal_id> player = <player> name = banked_progress
				challenge_meter_watcher_varUpdated player = <player> current_value = <banked_progress>
			endif
			if (<num_players> > 1)
				GetNextPlayer player = <player>
			endif
			repeat <num_players>
		endif
	endif
endscript

script challenge_update_meter 
	if (<player> = Band)
		<Band> = 1
		GMan_GetData goal = <goal_id> name = band_setup
		if (<band_setup> = valid)
			GetFirstPlayer
			GMan_SetData goal = <goal_id> player = <player> params = {meter_displayed = <current_progress>}
			GMan_GetData goal = <goal_id> player = <player> name = meter_high
			if GotParam \{meter_high}
				if (<meter_high> < <current_progress>)
					GMan_SetData goal = <goal_id> player = <player> params = {meter_high = <current_progress>}
				endif
			else
				GMan_SetData goal = <goal_id> player = <player> params = {meter_high = 0}
			endif
		endif
	else
		if (<player> = all)
			GetNumPlayersInGame
		else
			<num_players> = 1
		endif
		if (<num_players> > 0)
			if (<player> = all)
				GetFirstPlayer
			endif
			begin
			<player_instrument> = valid
			challenge_validate_player_instrument goal_id = <goal_id> player = <player>
			if (<player_instrument> = valid)
				GMan_SetData goal = <goal_id> player = <player> params = {meter_displayed = <current_progress>}
				GMan_GetData goal = <goal_id> player = <player> name = meter_high
				if GotParam \{meter_high}
					if (<meter_high> < <current_progress>)
						GMan_SetData goal = <goal_id> player = <player> params = {meter_high = <current_progress>}
					endif
				else
					GMan_SetData goal = <goal_id> player = <player> params = {meter_high = 0}
				endif
			endif
			if (<player> = all)
				GetNextPlayer player = <player>
			endif
			repeat <num_players>
		endif
	endif
endscript

script challenge_meter_watcher_varUpdated 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	GetArraySize ($<goal_id>.required_band)
	if (<array_size> > 1)
		GetPlayerInfo <player> Band
		GMan_MeterFunc goal = <goal_id> tool = challenge_meter func = update_progress params = {band_meter band_index = <Band> current_progress = <current_value>}
	else
		GMan_MeterFunc goal = <goal_id> tool = challenge_meter func = update_progress params = {player_meter player_index = <player> current_progress = <current_value>}
	endif
endscript

script challenge_get_lowest_band_difficulty_setting 
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		<difficulties> = [beginner easy medium hard expert]
		<diff_index> = 4
		begin
		GetPlayerInfo <player> difficulty
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
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	lowest_difficulty = (<difficulties> [<diff_index>])
	return lowest_band_difficulty_setting = <lowest_difficulty>
endscript

script challenge_display_message \{text = qs(0x7223952e)
		time = 3
		Pos = (640.0, 250.0)}
	if ScreenElementExists \{id = challenge_text_container}
		DestroyScreenElement \{id = challenge_text_container}
	endif
	CreateScreenElement \{id = challenge_text_container
		type = ContainerElement
		parent = root_window}
	CreateScreenElement {
		id = challenge_text
		type = TextElement
		parent = challenge_text_container
		font = debug
		text = <text>
		scale = 1.0
		Pos = <Pos>
		just = [center center]
		rgba = [150 185 200 255]
		z_priority = 80
	}
	CreateScreenElement {
		id = challenge_text_shadow
		type = TextElement
		parent = challenge_text_container
		font = debug
		text = <text>
		scale = 1.0
		Pos = (<Pos> + (1.0, 1.0))
		just = [center center]
		rgba = [0 0 0 255]
		z_priority = 79
	}
	challenge_text :SE_SetProps \{alpha = 0}
	challenge_text_shadow :SE_SetProps \{alpha = 0}
	challenge_text :SE_SetProps \{alpha = 1}
	challenge_text_shadow :SE_SetProps \{alpha = 1}
	challenge_text :SE_WaitProps
endscript

script challenge_validate_band_setup \{goal_id = null}
	<required_band> = ($<goal_id>.required_band)
	<instruments> = [lead bass Drum vocal]
	<num_required> = [0 0 0 0]
	<num_in_band> = [0 0 0 0]
	<band_setup> = valid
	<valid_players> = []
	GetArraySize (<required_band>)
	GetNumPlayersInGame
	if (<num_players> > 0)
		<num_valid_players> = 0
		GetFirstPlayer
		begin
		GetPlayerInfo <player> difficulty
		if NOT (<difficulty> = beginner)
			GetPlayerInfo <player> difficulty
			GMan_SongFunc \{func = get_current_song_playlist_index}
			if (<current_song_index> = 1)
				GMan_SetData goal = <goal_id> player = <player> params = {difficulty_check = <difficulty>}
			endif
			challenge_validate_player_instrument goal_id = <goal_id> player = <player>
			if (<player_instrument> = valid)
				<valid_players> = (<valid_players> + <player>)
				<num_valid_players> = (<num_valid_players> + 1)
			endif
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
		if (<num_valid_players> >= <array_size>)
			<i> = 0
			begin
			<ii> = 0
			begin
			if (<required_band> [<i>] = <instruments> [<ii>])
				SetArrayElement arrayName = num_required index = <ii> newValue = (<num_required> [<ii>] + 1)
				break
			endif
			<ii> = (<ii> + 1)
			repeat 4
			<i> = (<i> + 1)
			repeat <array_size>
			GetFirstPlayer
			begin
			<ii> = 0
			begin
			GetPlayerInfo <player> part
			GetPlayerInfo <player> difficulty
			if NOT (<difficulty> = beginner)
				<instruments> = [guitar bass Drum vocals]
				if (<part> = <instruments> [<ii>])
					SetArrayElement arrayName = num_in_band index = <ii> newValue = (<num_in_band> [<ii>] + 1)
					break
				endif
			endif
			<ii> = (<ii> + 1)
			repeat 4
			GetNextPlayer player = <player>
			repeat <num_players>
			GetFirstPlayer
			begin
			GetPlayerInfo <player> difficulty
			if ((<num_in_band> [<player>]) < (<num_required> [<player>]))
				<band_setup> = missing_part
				break
			elseif (<difficulty> = beginner)
				GetArraySize (<required_band>)
				if (<array_size> > 1)
					<band_setup> = beginner_in_band
				endif
			endif
			GetNextPlayer player = <player>
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
	GetPlayerInfo <player> difficulty
	if GMan_GoalIsActive goal = <goal_id>
		GMan_GetData goal = <goal_id> player = <player> name = difficulty_check
	else
		<difficulty_check> = GOAL_INACTIVE
	endif
	if NOT (<difficulty_check> = invalid)
		if NOT (<difficulty> = beginner)
			GetPlayerInfo <player> part
			switch <part>
				case guitar
				<instrument> = lead
				case vocals
				<instrument> = vocal
				case bass
				case Drum
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

script challenge_section_valid 
	if StructureContains structure = ($<goal_id>) song_sections
		GMan_GetData goal = <goal_id> name = current_section
		GMan_SongFunc \{func = get_current_song_playlist_index}
		<current_song_index> = (<current_song_index> - 1)
		<required_sections> = ($<goal_id>.song_sections [<current_song_index>])
		if ArrayContains array = <required_sections> contains = <current_section>
			return \{true}
		else
			return \{false}
		endif
	else
		return \{true}
	endif
endscript

script challenge_bank_progress 
	GetArraySize ($<goal_id>.required_band)
	<required_band_size> = <array_size>
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		<player_instrument> = valid
		challenge_validate_player_instrument goal_id = <goal_id> player = <player>
		if (<player_instrument> = valid)
			GMan_GetConstant goal = <goal_id> name = challenge_metric
			if NOT GotParam \{challenge_metric}
				ScriptAssert 'Bank Progress requires challenge metric to be defined in goal constants! %g' g = <goal_id>
			endif
			switch <challenge_metric>
				case score
				if StructureContains structure = ($<goal_id>) song_sections
					GetPlayerInfo <player> Band
					GMan_GetData goal = <goal_id> player = <Band>
					<current_progress> = (<current_section_progress> + <valid_sections_progress>)
				else
					if (<required_band_size> > 1)
						GetPlayerInfo <player> Band
						GetBandInfo <Band> score
						<current_progress> = <score>
					else
						GetPlayerInfo <player> score
						<current_progress> = <score>
					endif
				endif
				case calculated_value
				GMan_GetConstant goal = <goal_id> name = calculated_value
				GMan_GetData goal = <goal_id> player = <player> name = <calculated_value>
				<current_progress> = (<...>.<calculated_value>)
				case streak
				if StructureContains structure = ($<goal_id>) song_sections
					GMan_GetData goal = <goal_id> player = <player>
					<current_progress> = (<current_section_progress> + <valid_sections_progress>)
				else
					GetPlayerInfo <player> current_run
					<current_progress> = (<current_run>)
				endif
				default
				ScriptAssert 'challenge_bank_progress does not have a case for challenge metric (%m) defined in goal constants! %g ' g = <goal_id> m = <challenge_metric>
			endswitch
			GMan_GetData goal = <goal_id> player = <player> name = banked_progress
			<current_progress> = (<current_progress> + <banked_progress>)
			GMan_SetData goal = <goal_id> player = <player> params = {banked_progress = <current_progress> reset_progress = <banked_progress>}
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
endscript

script challenge_get_goal_id 
	GMan_ChallengeManagerFunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	<goal_id> = <current_challenge>
	return goal_id = <goal_id>
endscript

script challenge_section_monitor 
	begin
	Block \{type = song_section_end}
	<section> = (<event_data>.section)
	spawnscriptnow challenge_section_ended id = <goal_id> params = {section = <section> goal_id = <goal_id>}
	repeat
endscript

script challenge_section_ended 
	GMan_SongFunc \{func = get_current_song_playlist_index}
	<current_song_index> = (<current_song_index> - 1)
	GetArraySize ($<goal_id>.song_sections)
	if (<array_size> = 0 || (<current_song_index> < 0) || (<current_song_index> >= <array_size>))
		return
	endif
	<required_sections> = ($<goal_id>.song_sections [<current_song_index>])
	GetArraySize ($<goal_id>.required_band)
	if (<array_size> = 0)
		return
	endif
	<required_band_size> = <array_size>
	if ArrayContains array = <required_sections> contains = <section>
		if NOT ArrayContains array = <required_sections> contains = (<section> + 1)
			if (<required_band_size> > 1)
				GetFirstPlayer
				GMan_GetData goal = <goal_id> player = <player> name = current_section_progress
				GMan_GetData goal = <goal_id> player = <player> name = valid_sections_progress
				<new_valid_sections_progress> = (<current_section_progress> + <valid_sections_progress>)
				GMan_SetData goal = <goal_id> player = <player> params = {valid_sections_progress = <new_valid_sections_progress> current_section_progress = 0}
			else
				GMan_GetData goal = <goal_id> name = valid_players
				GetArraySize <valid_players>
				if (<array_size> = 0)
					return
				endif
				<i> = 0
				begin
				<player> = (<valid_players> [<i>])
				GMan_GetData goal = <goal_id> player = <player> name = current_section_progress
				GMan_GetData goal = <goal_id> player = <player> name = valid_sections_progress
				<new_valid_sections_progress> = (<current_section_progress> + <valid_sections_progress>)
				GMan_SetData goal = <goal_id> player = <player> params = {valid_sections_progress = <new_valid_sections_progress> current_section_progress = 0}
				<i> = (<i> + 1)
				repeat <array_size>
			endif
		endif
	else
		if ArrayContains array = <required_sections> contains = (<section> + 1)
			GMan_GetConstant goal = <goal_id> name = challenge_metric
			if NOT GotParam \{challenge_metric}
				ScriptAssert 'Section watcher requires challenge metric to be defined in goal constants! %g' g = <goal_id>
			endif
			GMan_GetData goal = <goal_id> name = valid_players
			GetArraySize <valid_players>
			if (<array_size> = 0)
				return
			endif
			switch <challenge_metric>
				case score
				<i> = 0
				begin
				<player> = (<valid_players> [<i>])
				if (<required_band_size> > 1)
					GetPlayerInfo <player> Band
					GetBandInfo <Band> score
				else
					GetPlayerInfo <player> score
				endif
				GMan_SetData goal = <goal_id> player = <player> params = {section_starting_value = <score>}
				<i> = (<i> + 1)
				repeat <array_size>
				case streak
				<i> = 0
				begin
				<player> = (<valid_players> [<i>])
				GetPlayerInfo <player> current_run
				GMan_SetData goal = <goal_id> player = <player> params = {section_starting_value = <current_run>}
				<i> = (<i> + 1)
				repeat <array_size>
				case calculated_value
				<i> = 0
				begin
				<player> = (<valid_players> [<i>])
				GMan_GetData goal = <goal_id> player = <player> name = <calculated_value>
				GMan_SetData goal = <goal_id> player = <player> params = {section_starting_value = <calculated_value>}
				<i> = (<i> + 1)
				repeat <array_size>
			endswitch
		endif
	endif
endscript

script challenge_update_current_section_progress 
	GMan_GetData goal = <goal_id> player = <player> name = section_starting_value
	if (<current_value> < <section_starting_value>)
		GMan_SetData goal = <goal_id> player = <player> params = {section_starting_value = 0}
		<current_section_progress> = (<current_value>)
	else
		<current_section_progress> = (<current_value> - <section_starting_value>)
	endif
	GMan_SetData goal = <goal_id> player = <player> params = {current_section_progress = <current_section_progress>}
	GMan_GetData goal = <goal_id> player = <player> name = valid_sections_progress
	<current_progress> = (<current_section_progress> + <valid_sections_progress>)
	return current_progress = <current_progress>
endscript

script challenge_multi_song_difficulty_check 
	GMan_SongFunc \{func = get_current_song_playlist_index}
	if (<current_song_index> > 1)
		GetNumPlayersInGame
		GetFirstPlayer
		begin
		GMan_GetData goal = <goal_id> player = <player> name = difficulty_check
		if NOT (<difficulty_check> = invalid)
			GetPlayerInfo <player> difficulty
			if NOT (<difficulty_check> = <difficulty>)
				GetArraySize ($<goal_id>.required_band)
				if (<array_size> > 1)
					GMan_SetData goal = <goal_id> params = {band_setup = invalid}
					break
				else
					GMan_SetData goal = <goal_id> player = <player> params = {banked_progress = 0}
					GMan_SetData goal = <goal_id> player = <player> params = {difficulty_check = invalid}
					GMan_SetPendingGrade goal = <goal_id> grade = 0
				endif
			endif
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
endscript

script challenge_store_meter_high_and_grade 
	GMan_GetGrade goal = <goal_id>
	GMan_SetData goal = <goal_id> params = {retry_grade = <pending_grade>}
	GetNumPlayersInGame
	GetFirstPlayer
	begin
	GMan_GetData goal = <goal_id> player = <player> name = meter_high
	GMan_SetData goal = <goal_id> player = <player> params = {meter_high_retry = <meter_high>}
	GetNextPlayer player = <player>
	repeat <num_players>
endscript

script challenge_restore_meter_high_and_grade 
	GMan_GetData goal = <goal_id> name = retry_grade
	GMan_SetPendingGrade goal = <goal_id> grade = <retry_grade>
	GetNumPlayersInGame
	GetFirstPlayer
	begin
	GMan_GetData goal = <goal_id> player = <player> name = meter_high_retry
	GMan_SetData goal = <goal_id> player = <player> params = {meter_high = <meter_high_retry>}
	GMan_SetData goal = <goal_id> player = <player> params = {meter_displayed = <meter_high_retry>}
	GMan_SetData goal = <goal_id> player = <player> params = {valid_sections_progress = 0}
	GetNextPlayer player = <player>
	repeat <num_players>
endscript

script challenge_output_debug_info 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
		if (<goal_id> = None)
			return
		endif
	elseif NOT GMan_GoalIsActive goal = <goal_id>
		return
	endif
	FormatText TextName = gold_text '%m%u' m = ($<goal_id>.gold_descrip) U = ($<goal_id>.target_display_units) UseCommas
	FormatText TextName = plat_text '%m%u' m = ($<goal_id>.platinum_descrip) U = ($<goal_id>.target_display_units) UseCommas
	FormatText TextName = dmnd_text '%m%u' m = ($<goal_id>.diamond_descrip) U = ($<goal_id>.target_display_units) UseCommas
	<challenge_targets> = {gold = <gold_text> platinum = <plat_text> diamond = <dmnd_text>}
	GetArraySize ($<goal_id>.required_band)
	if (<array_size> > 1)
		GMan_GetData goal = <goal_id> player = 1 name = meter_high
		<best_attempt> = [{Band = 1 meter_high = <meter_high>}]
	else
		<best_attempt> = []
	endif
	GetNumPlayersInGame
	GetFirstPlayer
	begin
	challenge_validate_player_instrument goal_id = <goal_id> player = <player>
	if (<player_instrument> = valid)
		GMan_GetData goal = <goal_id> player = <player> name = meter_high
		FormatText TextName = high_text '%m%u' m = <meter_high> U = ($<goal_id>.target_display_units) UseCommas
		GetPlayerInfo <player> difficulty
		GetPlayerInfo <player> part
		<best_attempt> = (<best_attempt> + {player = <player> meter_high = <meter_high> difficulty = <difficulty> instrument = <part>})
	endif
	GetNextPlayer player = <player>
	repeat <num_players>
	GetLocalSystemTime
	FormatText TextName = system_date '%m/%d/%y' m = (<LocalSystemTime>.month) d = (<LocalSystemTime>.dayofmonth) y = (<LocalSystemTime>.year)
	FormatText TextName = system_time '%h:%m:%s' H = (<LocalSystemTime>.hour) m = (<LocalSystemTime>.minute) s = (<LocalSystemTime>.second)
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
	GetArraySize ($<goal_id>.required_band)
	if (<array_size> > 1)
		<band_text> = ''
		GetNumPlayersInGame
		GetFirstPlayer
		begin
		GetPlayerInfo <player> difficulty
		GetPlayerInfo <player> part
		get_difficulty_text difficulty = <difficulty>
		get_part_text part = <part>
		FormatText TextName = player_text '%u/%m' m = <difficulty_text> U = <part_text>
		FormatText TextName = new_text '%u %m' m = <player_text> U = <band_text>
		<band_text> = <new_text>
		GetNextPlayer player = <player>
		repeat <num_players>
		printf channel = challenge_info 'Band Challenge,%a,%g,%b,%c,%d,%e,%f,%h,%p,%k,%m,%n,%o,YOUR_COMMENTS (ie. felt too easy/too hard/just right)' a = ($<goal_id>.id) b = <system_date> c = <system_time> d = ($<goal_id>.gold_descrip) e = ($<goal_id>.platinum_descrip) f = ($<goal_id>.diamond_descrip) g = <string_global> H = (<best_attempt> [0].meter_high) k = ($debug_grade_times [0].gold) m = ($debug_grade_times [0].platinum) n = ($debug_grade_times [0].diamond) o = <band_text> p = ($<goal_id>.target_display_units)
		printf channel = challenge_data 'Band Challenge,%a,%g,%b,%c,%d,%e,%f,%h,%p,%k,%m,%n,%o,YOUR_COMMENTS (ie. felt too easy/too hard/just right)' a = ($<goal_id>.id) b = <system_date> c = <system_time> d = ($<goal_id>.gold_descrip) e = ($<goal_id>.platinum_descrip) f = ($<goal_id>.diamond_descrip) g = <string_global> H = (<best_attempt> [0].meter_high) k = ($debug_grade_times [0].gold) m = ($debug_grade_times [0].platinum) n = ($debug_grade_times [0].diamond) o = <band_text> p = ($<goal_id>.target_display_units)
	else
		GetNumPlayersInGame
		GetFirstPlayer
		begin
		challenge_validate_player_instrument goal_id = <goal_id> player = <player>
		if (<player_instrument> = valid)
			<i> = 0
			begin
			if ((<best_attempt> [<i>].player) = <player>)
				<player_attempt> = (<best_attempt> [<i>])
				<pi> = (<player> - 1)
				GetPlayerInfo <player> difficulty
				GetPlayerInfo <player> part
				get_difficulty_text difficulty = <difficulty>
				get_part_text part = <part>
				FormatText TextName = player_text '%u/%m' m = <difficulty_text> U = <part_text>
				printf channel = challenge_info 'Individual Challenge,%a,%g,%b,%c,%d,%e,%f,%h,%p,%k,%m,%n,%o,YOUR_COMMENTS (ie. felt too easy/too hard/just right)' a = ($<goal_id>.id) b = <system_date> c = <system_time> d = ($<goal_id>.gold_descrip) e = ($<goal_id>.platinum_descrip) f = ($<goal_id>.diamond_descrip) g = <string_global> H = (<player_attempt>.meter_high) k = ($debug_grade_times [<pi>].gold) m = ($debug_grade_times [<pi>].platinum) n = ($debug_grade_times [<pi>].diamond) o = <player_text> p = ($<goal_id>.target_display_units)
				printf channel = challenge_data 'Individual Challenge,%a,%g,%b,%c,%d,%e,%f,%h,%p,%k,%m,%n,%o,YOUR_COMMENTS (ie. felt too easy/too hard/just right)' a = ($<goal_id>.id) b = <system_date> c = <system_time> d = ($<goal_id>.gold_descrip) e = ($<goal_id>.platinum_descrip) f = ($<goal_id>.diamond_descrip) g = <string_global> H = (<player_attempt>.meter_high) k = ($debug_grade_times [<pi>].gold) m = ($debug_grade_times [<pi>].platinum) n = ($debug_grade_times [<pi>].diamond) o = <player_text> p = ($<goal_id>.target_display_units)
				break
			endif
			<i> = (<i> + 1)
			repeat <num_players>
		endif
		GetNextPlayer player = <player>
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
endscript

script challenge_reset_debug_info 
	Change \{debug_grade_times = [
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
