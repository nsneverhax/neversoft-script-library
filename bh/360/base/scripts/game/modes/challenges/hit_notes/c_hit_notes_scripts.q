c_HIT_NOTES_GLOBAL_REF = {
	goal_type = challenge
	initial_data = {
		band_moment_count = 0
	}
	results_screen_goal_data = {
		column_title = qs(0x83b2be80)
		data_source = player_goal_data
		var_name = meter_high
		ranking_method = highest_to_lowest
	}
	player_data = {
		banked_progress = 0
		reset_progress = 0
		section_starting_value = 0
		current_section_progress = 0
		valid_sections_progress = 0
		meter_high = 0
		meter_displayed = 0
		value_banked = 0
		strum_state = Idle
		drum_chord_notes = 0
		difficulty_check = null
		chord_check = 10000
	}
	constants = {
		pre_activate = c_hit_notes_pre_activate
		song_started = c_hit_notes_song_started
		song_complete = c_hit_notes_song_complete
		challenge_metric = calculated_value
		calculated_value = value_banked
	}
	checkpoints = [
		{
			name = 'main'
			enter = c_hit_notes_main_enter
			exit = c_hit_notes_main_exit
			tools = [
				{
					$goal_debug_bot_struct
				}
				{
					name = 'meter_watcher'
					type = var_watcher
					var_updated = challenge_meter_watcher_varUpdated
					vars = [
						{
							Source = goalplayerdata
							var = meter_displayed
							type = float
						}
					]
				}
				{
					name = 'challenge_meter'
					target_reached = c_hit_notes_meter_target_reached
					type = meter
				}
				{
					name = 'hit_listener'
					type = event_listener
					callback_mode = any
					got_event = c_hit_notes_hit_note
					events = [
						hit_notep1
						hit_notep2
						hit_notep3
						hit_notep4
						vocals_note_hit_eventp1
						vocals_note_hit_eventp2
						vocals_note_hit_eventp3
						vocals_note_hit_eventp4
					]
					dont_start_on_enter
				}
				{
					name = 'miss_listener'
					type = event_listener
					callback_mode = any
					got_event = c_hit_notes_reset_strum_check
					events = [
						missed_notep1
						missed_notep2
						missed_notep3
						missed_notep4
					]
					dont_start_on_enter
				}
			]
		}
	]
}

script c_hit_notes_pre_activate 
	challenge_validate_band_setup goal_id = <goal_id>
	GMan_SetData goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
endscript

script c_hit_notes_main_enter 
	challenge_validate_band_setup goal_id = <goal_id>
	GMan_SetData goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
	if GotParam \{retry}
		challenge_restore_meter_high_and_grade goal_id = <goal_id>
		challenge_multi_song_difficulty_check goal_id = <goal_id>
		GetNumPlayersInGame
		GetFirstPlayer
		begin
		GetPlayerInfo <player> is_local_client
		if (<is_local_client> = 1)
			GMan_GetData goal = <goal_id> player = <player> name = banked_progress
			GMan_SetData goal = <goal_id> player = <player> params = {value_banked = <banked_progress>}
			GMan_SetData goal = <goal_id> player = <player> params = {chord_check = 10000}
			GetNextPlayer player = <player>
		endif
		repeat <num_players>
	else
		challenge_store_meter_high_and_grade goal_id = <goal_id>
	endif
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	challenge_init_meter goal_id = <goal_id>
endscript

script c_hit_notes_hit_note 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	<player> = (<event_data>.player)
	GetPlayerInfo <player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if NOT challenge_section_valid goal_id = <goal_id>
		return
	endif
	GMan_GetData goal = <goal_id> player = <player> name = temp_banked_progress
	GetArraySize ($<goal_id>.required_band)
	if (<array_size> > 1)
		<player> = Band
	endif
	if NOT c_hit_notes_note_valid <...>
		return
	endif
	c_hit_notes_calculate_total_progress <...>
	challenge_update_meter goal_id = <goal_id> player = <player> current_progress = <total_progress>
	GMan_GetData player = <player> goal = <goal_id>
endscript

script c_hit_notes_reset_strum_check 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	<player> = (<event_data>.player)
	GetPlayerInfo <player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	FormatText checksumname = id 'strum_player_timeout_script_%t' t = <player>
	killspawnedscript id = <id>
	GMan_SetData goal = <goal_id> player = <player> params = {strum_state = Idle}
endscript

script c_hit_notes_note_valid 
	<note_valid> = false
	if StructureContains structure = ($<goal_id>) note_color
		<color_index> = 0
		GetPlayerInfo <player> part
		switch <part>
			case Drum
			<event_color> = noflip_color
			case guitar
			case bass
			<event_color> = Color
		endswitch
		if GotParam \{event_color}
			if StructureContains structure = event_data <event_color>
				GetArraySize ($<goal_id>.note_color)
				begin
				if (($<goal_id>.note_color [<color_index>]) = (<event_data>.<event_color>))
					<note_valid> = true
					break
				endif
				<color_index> = (<color_index> + 1)
				repeat <array_size>
			endif
		endif
	elseif StructureContains structure = ($<goal_id>) chord_color
		if StructureContains \{structure = event_data
				strum_pattern}
			if c_hit_notes_color_check_guitar goal_id = <goal_id> strum_pattern = (<event_data>.strum_pattern)
				if (<number> = 2)
					<note_valid> = true
				elseif (<number> = 3)
					<note_valid> = TRUE_TRIPLE
				elseif (<number> = 4)
					<note_valid> = TRUE_QUAD
				endif
			endif
		endif
	elseif StructureContains structure = ($<goal_id>) chord_color_drum
		if StructureContains \{structure = event_data
				strum_pattern}
			if StructureContains \{structure = event_data
					kick}
				if c_hit_notes_color_check_drum goal_id = <goal_id> strum_pattern = (<event_data>.strum_pattern) goal_id = <goal_id> player = (<event_data>.player) kick = (<event_data>.kick)
					<note_valid> = true
					FormatText checksumname = id 'drum_player_timeout_script_%t' t = (<event_data>.player)
					killspawnedscript id = <id>
				endif
			else
				if c_hit_notes_color_check_drum goal_id = <goal_id> strum_pattern = (<event_data>.strum_pattern) goal_id = <goal_id> player = (<event_data>.player)
					<note_valid> = true
					FormatText checksumname = id 'drum_player_timeout_script_%t' t = (<event_data>.player)
					killspawnedscript id = <id>
				endif
			endif
		endif
	elseif StructureContains structure = ($<goal_id>) special
		if StructureContains \{structure = event_data
				array_entry}
			GMan_GetData goal = <goal_id> player = (<event_data>.player) name = chord_check
			<chord_check_old> = <chord_check>
			<chord_check_new> = (<event_data>.array_entry)
			GMan_SetData goal = <goal_id> player = (<event_data>.player) params = {chord_check = <chord_check_new>}
			if (($<goal_id>.special) = drum_accent)
				if StructureContains \{structure = event_data
						drum_accent}
					if ((<event_data>.drum_accent) = 1)
						<note_valid> = true
					endif
				endif
			elseif (<chord_check_new> = <chord_check_old>)
				<note_valid> = false
			else
				if (($<goal_id>.special) = tapping)
					if StructureContains \{structure = event_data
							hammer_strum}
						if StructureContains \{structure = event_data
								is_tapping}
							if ((<event_data>.is_tapping) = 1)
								if ((<event_data>.hammer_strum) = 1)
									<note_valid> = true
								endif
							endif
						endif
					endif
				elseif (($<goal_id>.special) = hopo)
					if StructureContains \{structure = event_data
							hammer_strum}
						if StructureContains \{structure = event_data
								hammer_on}
							if ((<event_data>.hammer_on) = 1)
								if ((<event_data>.hammer_strum) = 1)
									if StructureContains \{structure = event_data
											Color}
										if ((<event_data>.Color) = extra)
											<note_valid> = true
										else
											if StructureContains \{structure = event_data
													is_tapping}
												if NOT ((<event_data>.is_tapping) = 1)
													<note_valid> = true
												endif
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				elseif (($<goal_id>.special) = guitar_accent)
					if StructureContains \{structure = event_data
							guitar_accent}
						if ((<event_data>.guitar_accent) = 1)
							<note_valid> = true
						endif
					endif
				endif
			endif
		endif
	elseif StructureContains structure = ($<goal_id>) Strum
		if StructureContains \{structure = event_data
				array_entry}
			GMan_GetData goal = <goal_id> player = (<event_data>.player) name = chord_check
			<chord_check_old> = <chord_check>
			<chord_check_new> = (<event_data>.array_entry)
			GMan_SetData goal = <goal_id> player = (<event_data>.player) params = {chord_check = <chord_check_new>}
			if (<chord_check_new> = <chord_check_old>)
				<note_valid> = false
			else
				if StructureContains \{structure = event_data
						strum_direction}
					if (($<goal_id>.Strum) = up_only)
						if c_hit_notes_strum_is_valid valid_direction = 1 event_data = <event_data>
							<note_valid> = true
						endif
					elseif (($<goal_id>.Strum) = down_only)
						if c_hit_notes_strum_is_valid valid_direction = -1 event_data = <event_data>
							<note_valid> = true
						endif
					elseif (($<goal_id>.Strum) = up_and_down)
						GMan_GetData goal = <goal_id> player = (<event_data>.player) name = strum_state
						if (<strum_state> = up)
							if c_hit_notes_strum_is_valid valid_direction = -1 event_data = <event_data>
								<note_valid> = true
								GMan_SetData goal = <goal_id> player = (<event_data>.player) params = {strum_state = down}
								FormatText checksumname = id 'strum_player_timeout_script_%t' t = (<event_data>.player)
								spawnscriptnow c_hit_notes_strum_timeout params = {goal_id = <goal_id> player = (<event_data>.player)} id = <id>
							else
								FormatText checksumname = id 'strum_player_timeout_script_%t' t = (<event_data>.player)
								killspawnedscript id = <id>
							endif
						elseif (<strum_state> = down)
							if c_hit_notes_strum_is_valid valid_direction = 1 event_data = <event_data>
								<note_valid> = true
								GMan_SetData goal = <goal_id> player = (<event_data>.player) params = {strum_state = up}
								FormatText checksumname = id 'strum_player_timeout_script_%t' t = (<event_data>.player)
								killspawnedscript id = <id>
								spawnscriptnow c_hit_notes_strum_timeout params = {goal_id = <goal_id> player = (<event_data>.player)} id = <id>
							else
								FormatText checksumname = id 'strum_player_timeout_script_%t' t = (<event_data>.player)
								killspawnedscript id = <id>
							endif
						else
							if c_hit_notes_strum_is_valid valid_direction = 1 event_data = <event_data>
								GMan_SetData goal = <goal_id> player = (<event_data>.player) params = {strum_state = up}
								FormatText checksumname = id 'strum_player_timeout_script_%t' t = (<event_data>.player)
								killspawnedscript id = <id>
								spawnscriptnow c_hit_notes_strum_timeout params = {goal_id = <goal_id> player = (<event_data>.player)} id = <id>
							elseif c_hit_notes_strum_is_valid valid_direction = -1 event_data = <event_data>
								GMan_SetData goal = <goal_id> player = (<event_data>.player) params = {strum_state = down}
								FormatText checksumname = id 'strum_player_timeout_script_%t' t = (<event_data>.player)
								killspawnedscript id = <id>
								spawnscriptnow c_hit_notes_strum_timeout params = {goal_id = <goal_id> player = (<event_data>.player)} id = <id>
							endif
						endif
					endif
				elseif StructureContains structure = ($<goal_id>) precision
					if StructureContains \{structure = event_data
							off_note}
						AbsoluteValue value = (<event_data>.off_note)
						if (($<goal_id>.precision) > (<value>))
							<note_valid> = true
						endif
					elseif StructureContains \{structure = event_data
							rolling_accuracy}
						if StructureContains structure = ($<goal_id>) vocal_precision
							if (($<goal_id>.vocal_precision) < (<event_data>.rolling_accuracy))
								<note_valid> = true
							endif
						endif
					endif
				endif
			endif
		endif
	else
		if StructureContains \{structure = event_data
				array_entry}
			GMan_GetData goal = <goal_id> player = (<event_data>.player) name = chord_check
			<chord_check_old> = <chord_check>
			<chord_check_new> = (<event_data>.array_entry)
			GMan_SetData goal = <goal_id> player = (<event_data>.player) params = {chord_check = <chord_check_new>}
			if (<chord_check_new> = <chord_check_old>)
				<note_valid> = false
			else
				<note_valid> = true
			endif
		endif
	endif
	if (<note_valid> = true)
		return \{true}
	elseif (<note_valid> = TRUE_TRIPLE)
		return \{true
			chord_triple = true}
	elseif (<note_valid> = TRUE_QUAD)
		return \{true
			chord_quad = true}
	else
		return \{false}
	endif
endscript

script c_hit_notes_strum_is_valid 
	if ((<event_data>.strum_direction) = <valid_direction>)
		if NOT ((<event_data>.hammer_on) = 1)
			if StructureContains \{structure = event_data
					is_tapping}
				if NOT ((<event_data>.is_tapping) = 1)
					return \{true}
				else
					c_hit_notes_reset_strum_check event_data = <event_data>
				endif
			else
				return \{true}
			endif
		else
			c_hit_notes_reset_strum_check event_data = <event_data>
		endif
	endif
	return \{false}
endscript

script c_hit_notes_color_check_guitar 
	if (($<goal_id>.chord_color) = gr)
		if (69632 = <strum_pattern>)
			return \{true
				number = 2}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = gry)
		if (69888 = <strum_pattern>)
			return \{true
				number = 3}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = grb)
		if (69648 = <strum_pattern>)
			return \{true
				number = 3}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = gy)
		if (65792 = <strum_pattern>)
			return \{true
				number = 2}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = gyb)
		if (65808 = <strum_pattern>)
			return \{true
				number = 3}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = gb)
		if (65552 = <strum_pattern>)
			return \{true
				number = 2}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = go)
		if (65537 = <strum_pattern>)
			return \{true
				number = 2}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = gro)
		if (69633 = <strum_pattern>)
			return \{true
				number = 3}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = gyo)
		if (65793 = <strum_pattern>)
			return \{true
				number = 3}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = gbo)
		if (65553 = <strum_pattern>)
			return \{true
				number = 3}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = ry)
		if (4352 = <strum_pattern>)
			return \{true
				number = 2}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = ryb)
		if (4368 = <strum_pattern>)
			return \{true
				number = 3}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = ryo)
		if (4353 = <strum_pattern>)
			return \{true
				number = 3}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = RB)
		if (4112 = <strum_pattern>)
			return \{true
				number = 2}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = rbo)
		if (4113 = <strum_pattern>)
			return \{true
				number = 3}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = ro)
		if (4097 = <strum_pattern>)
			return \{true
				number = 2}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = yb)
		if (272 = <strum_pattern>)
			return \{true
				number = 2}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = ybo)
		if (273 = <strum_pattern>)
			return \{true
				number = 3}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = yo)
		if (257 = <strum_pattern>)
			return \{true
				number = 2}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = bo)
		if (17 = <strum_pattern>)
			return \{true
				number = 2}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = gryb)
		if (69904 = <strum_pattern>)
			return \{true
				number = 4}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = rybo)
		if (4369 = <strum_pattern>)
			return \{true
				number = 4}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = gybo)
		if (65809 = <strum_pattern>)
			return \{true
				number = 4}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = grbo)
		if (69649 = <strum_pattern>)
			return \{true
				number = 4}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = gryo)
		if (69889 = <strum_pattern>)
			return \{true
				number = 4}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color) = all)
		if ((69632 = <strum_pattern>)
				|| (65792 = <strum_pattern>)
				|| (65552 = <strum_pattern>)
				|| (4352 = <strum_pattern>)
				|| (4112 = <strum_pattern>)
				|| (4097 = <strum_pattern>)
				|| (272 = <strum_pattern>)
				|| (257 = <strum_pattern>)
				|| (65537 = <strum_pattern>)
				|| (17 = <strum_pattern>))
			return \{true
				number = 2}
		elseif ((69888 = <strum_pattern>)
				|| (69648 = <strum_pattern>)
				|| (65808 = <strum_pattern>)
				|| (4368 = <strum_pattern>)
				|| (4353 = <strum_pattern>)
				|| (4113 = <strum_pattern>)
				|| (69633 = <strum_pattern>)
				|| (65793 = <strum_pattern>)
				|| (65553 = <strum_pattern>)
				|| (273 = <strum_pattern>))
			return \{true
				number = 3}
		elseif ((69904 = <strum_pattern>)
				|| (4369 = <strum_pattern>)
				|| (65809 = <strum_pattern>)
				|| (69649 = <strum_pattern>)
				|| (69889 = <strum_pattern>))
			return \{true
				number = 4}
		else
			return \{false}
		endif
	endif
endscript

script c_hit_notes_color_check_drum 
	if (($<goal_id>.chord_color_drum) = gr)
		if c_hit_notes_drum_chord_creator note_1 = 65536 note_2 = 4096 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = gy)
		if c_hit_notes_drum_chord_creator note_1 = 65536 note_2 = 256 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = gb)
		if c_hit_notes_drum_chord_creator note_1 = 65536 note_2 = 16 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = go)
		if c_hit_notes_drum_chord_creator note_1 = 65536 note_2 = 1 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = ry)
		if c_hit_notes_drum_chord_creator note_1 = 4096 note_2 = 256 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = RB)
		if c_hit_notes_drum_chord_creator note_1 = 4096 note_2 = 16 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = ro)
		if c_hit_notes_drum_chord_creator note_1 = 4096 note_2 = 1 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = yb)
		if c_hit_notes_drum_chord_creator note_1 = 256 note_2 = 16 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = yo)
		if c_hit_notes_drum_chord_creator note_1 = 256 note_2 = 1 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = bo)
		if c_hit_notes_drum_chord_creator note_1 = 16 note_2 = 1 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = gre)
		if c_hit_notes_drum_chord_creator note_1 = 65536 note_2 = 4096 kick_check = 1 num_notes = 3 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = gye)
		if c_hit_notes_drum_chord_creator note_1 = 65536 note_2 = 256 kick_check = 1 num_notes = 3 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = gbe)
		if c_hit_notes_drum_chord_creator note_1 = 65536 note_2 = 16 kick_check = 1 num_notes = 3 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = goe)
		if c_hit_notes_drum_chord_creator note_1 = 65536 note_2 = 1 kick_check = 1 num_notes = 3 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = rye)
		if c_hit_notes_drum_chord_creator note_1 = 4096 note_2 = 256 kick_check = 1 num_notes = 3 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = rbe)
		if c_hit_notes_drum_chord_creator note_1 = 4096 note_2 = 16 kick_check = 1 num_notes = 3 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = roe)
		if c_hit_notes_drum_chord_creator note_1 = 4096 note_2 = 1 kick_check = 1 num_notes = 3 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = ybe)
		if c_hit_notes_drum_chord_creator note_1 = 256 note_2 = 16 kick_check = 1 num_notes = 3 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = yoe)
		if c_hit_notes_drum_chord_creator note_1 = 256 note_2 = 1 kick_check = 1 num_notes = 3 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = boe)
		if c_hit_notes_drum_chord_creator note_1 = 16 note_2 = 1 kick_check = 1 num_notes = 3 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = ge)
		if c_hit_notes_drum_chord_creator note_1 = 65536 kick_check = 1 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = re)
		if c_hit_notes_drum_chord_creator note_1 = 4096 kick_check = 1 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = ye)
		if c_hit_notes_drum_chord_creator note_1 = 256 kick_check = 1 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = be)
		if c_hit_notes_drum_chord_creator note_1 = 16 kick_check = 1 <...>
			return \{true}
		else
			return \{false}
		endif
	elseif (($<goal_id>.chord_color_drum) = oe)
		if c_hit_notes_drum_chord_creator note_1 = 1 kick_check = 1 <...>
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script c_hit_notes_drum_chord_check 
	wait \{8
		gameframes}
	GMan_SetData goal = <goal_id> player = <player> params = {drum_chord_notes = 0}
endscript

script c_hit_notes_strum_timeout 
	wait \{1
		seconds}
	GMan_SetData goal = <goal_id> player = <player> params = {strum_state = Idle}
endscript

script c_hit_notes_drum_chord_creator \{kick_check = 0
		num_notes = 2}
	GMan_GetData goal = <goal_id> player = <player> name = drum_chord_notes
	if NOT (<drum_chord_notes> = 1)
		if (<note_1> = <strum_pattern>)
			GMan_SetData goal = <goal_id> player = <player> params = {drum_chord_notes = (<drum_chord_notes> + 1)}
			if NOT ScriptIsRunning <id>
				FormatText checksumname = id 'drum_player_timeout_script_%t' t = <player>
				spawnscriptnow c_hit_notes_drum_chord_check id = <id> params = {goal_id = <goal_id> player = <player>}
			endif
		endif
	endif
	if GotParam \{note_2}
		if NOT ((<drum_chord_notes> = 2) || (<drum_chord_notes> = 3))
			if (<note_2> = <strum_pattern>)
				GMan_SetData goal = <goal_id> player = <player> params = {drum_chord_notes = (<drum_chord_notes> + 2)}
				if NOT ScriptIsRunning <id>
					FormatText checksumname = id 'drum_player_timeout_script_%t' t = <player>
					spawnscriptnow c_hit_notes_drum_chord_check params = {goal_id = <goal_id> player = <player>} id = <id>
				endif
			endif
		endif
	endif
	if GotParam \{kick}
		if NOT ((<drum_chord_notes> = 100) || (<drum_chord_notes> = 101) || (<drum_chord_notes> = 102) || (<drum_chord_notes> = 103))
			if (<kick_check> = <kick>)
				GMan_SetData goal = <goal_id> player = <player> params = {drum_chord_notes = (<drum_chord_notes> + 100)}
				if NOT ScriptIsRunning <id>
					FormatText checksumname = id 'drum_player_timeout_script_%t' t = <player>
					spawnscriptnow c_hit_notes_drum_chord_check params = {goal_id = <goal_id> player = <player>} id = <id>
				endif
			endif
		endif
	endif
	GMan_GetData goal = <goal_id> player = <player> name = drum_chord_notes
	if (<num_notes> = 2)
		if ((<drum_chord_notes> = 3) || (<drum_chord_notes> = 101))
			GMan_SetData goal = <goal_id> player = <player> params = {drum_chord_notes = 0}
			FormatText checksumname = id 'drum_player_timeout_script_%t' t = <player>
			killspawnedscript id = <id>
			return \{true}
		else
			return \{false}
		endif
	else
		if (<drum_chord_notes> = 103)
			GMan_SetData goal = <goal_id> player = <player> params = {drum_chord_notes = 0}
			FormatText checksumname = id 'drum_player_timeout_script_%t' t = <player>
			killspawnedscript id = <id>
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script c_hit_notes_song_started 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if StructureContains structure = ($<goal_id>) song_sections
		goal_start_section_watcher goal_id = <goal_id>
		spawnscriptnow challenge_section_monitor params = {goal_id = <goal_id>}
		challenge_section_ended goal_id = <goal_id> section = -1
		section_fret_display goal_id = <goal_id>
	endif
	GMan_EventListenerFunc goal = <goal_id> tool = hit_listener checkpoint = main func = start params = {}
	if StructureContains structure = ($<goal_id>) Strum
		if (($<goal_id>.Strum) = up_and_down)
			GMan_EventListenerFunc goal = <goal_id> tool = miss_listener checkpoint = main func = start params = {}
		endif
	endif
endscript

script c_hit_notes_calculate_total_progress 
	<total_progress> = 0
	if (<player> = Band)
		softassert \{'hit_notes goals do not currently support band setups'}
	else
		<player_instrument> = valid
		challenge_validate_player_instrument goal_id = <goal_id> player = <player>
		if (<player_instrument> = valid)
			GMan_GetData goal = <goal_id> player = <player>
			if StructureContains structure = ($<goal_id>) chord_color
				if GotParam \{chord_triple}
					<total_progress> = (0.33333302 + <value_banked> + <valid_sections_progress>)
				elseif GotParam \{chord_quad}
					<total_progress> = (0.25 + <value_banked> + <valid_sections_progress>)
				else
					<total_progress> = (0.5 + <value_banked> + <valid_sections_progress>)
				endif
			else
				<total_progress> = (1 + <value_banked> + <valid_sections_progress>)
			endif
			GMan_SetData goal = <goal_id> player = <player> params = {value_banked = <total_progress>}
		endif
	endif
	return total_progress = <total_progress>
endscript

script c_hit_notes_song_complete 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if (<event> = song_won)
		challenge_bank_progress goal_id = <goal_id>
	endif
endscript

script c_hit_notes_meter_target_reached 
	level = (<level> + 1)
	challenge_set_pending_grade level = <level> goal_id = <goal_id> player = <player>
endscript

script c_hit_notes_main_exit 
	killspawnedscript \{name = challenge_section_monitor}
	killspawnedscript id = <goal_id>
	killspawnedscript \{name = c_hit_notes_drum_chord_check}
endscript
