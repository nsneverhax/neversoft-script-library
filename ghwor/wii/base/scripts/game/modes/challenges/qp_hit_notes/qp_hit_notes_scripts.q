g_qp_hit_notes_core = {
	player_data = {
		current_progress = 0
		section_base_value = 0
		previous_progress = 0
		chord_check = -1
		strum_state = Idle
	}
	initial_data = {
		current_progress = 0
	}
	checkpoints = [
		{
			Name = 'main'
			tools = [
				{
					Name = 'hit_listener'
					Type = event_listener
					callback_mode = any
					got_event = qp_hit_notes_listener_note_hit
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
				}
				{
					Name = 'miss_listener'
					Type = event_listener
					callback_mode = any
					got_event = qp_hit_notes_strum_check
					events = [
						missed_notep1
						missed_notep2
						missed_notep3
						missed_notep4
					]
					dont_start_on_enter
				}
				{
					Name = 'progress_watcher'
					Type = var_watcher
					var_updated = challenge_qp_evaluate_progress
					vars = [
						{
							Source = goalplayerdata
							var = current_progress
							Type = float
						}
						{
							Source = goaldata
							var = current_progress
							Type = float
						}
					]
				}
				{
					Name = 'section_watcher'
					Type = section_watcher
				}
			]
		}
	]
}

script qp_hit_notes_listener_note_hit 
	if qp_hit_notes_note_is_valid <...>
		challenge_qp_calculate_current_progress goal_id = <goal_id> Player = (<event_data>.Player) current_value = 1 var_type = incremental
		gman_setdata goal = <goal_id> Player = (<event_data>.Player) params = {current_progress = <current_progress> previous_progress = <current_progress>}
		if challenge_is_band_subtype goal_id = <goal_id>
			challenge_qp_calculate_total_band_progress goal_id = <goal_id>
			gman_setdata goal = <goal_id> params = {current_progress = <total_band_progress>}
		endif
	else
		return
	endif
endscript

script qp_hit_notes_note_is_valid 
	gman_getconstant goal = <goal_id> Name = note_requirements return_name = note_requirements
	<note_valid> = FALSE
	<Player> = (<event_data>.Player)
	if NOT challenge_qp_current_section_is_valid goal_id = <goal_id>
		return \{FALSE}
	endif
	if StructureContains structure = (<note_requirements>) note_color
		qp_hit_notes_color_check <...>
	elseif StructureContains structure = (<note_requirements>) chord_color_drum
		qp_hit_notes_drum_chord_note_check <...>
	else
		<duplicate_chord> = FALSE
		<ignore_chords> = 0
		if StructureContains structure = (<note_requirements>) special
			if (<note_requirements>.special = drum_accent)
				<ignore_chords> = 1
			endif
		endif
		if (<ignore_chords> = 0)
			if StructureContains \{structure = event_data
					array_entry}
				gman_getdata goal = <goal_id> Player = <Player> Name = chord_check
				<chord_check_old> = <chord_check>
				<chord_check_new> = (<event_data>.array_entry)
				gman_setdata goal = <goal_id> Player = <Player> params = {chord_check = <chord_check_new>}
				if (<chord_check_new> = <chord_check_old>)
					<duplicate_chord> = true
				endif
			endif
		endif
		getplayerinfo <Player> part
		if (<part> = drum && (<goal_string> = 'qp_hit_notes' || <goal_string> = 'qp_hit_notes_band'))
			duplicate_chord = FALSE
		endif
		if (<duplicate_chord> = true)
			<note_valid> = FALSE
		elseif StructureContains structure = (<note_requirements>) chord_color
			qp_hit_notes_guitar_chord_check <...>
		elseif StructureContains structure = (<note_requirements>) special
			qp_hit_notes_special_check <...>
		elseif StructureContains structure = (<note_requirements>) strum
			qp_hit_notes_strum_check <...>
		elseif StructureContains structure = (<note_requirements>) precision
			qp_hit_notes_precision_check <...>
		else
			<note_valid> = true
			if StructureContains structure = <event_data> note_complete
				if (<event_data>.note_complete = 0)
					<note_valid> = FALSE
				endif
			endif
		endif
	endif
	if (<note_valid> = true)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script qp_hit_notes_color_check 
	if StructureContains \{structure = event_data
			Color}
		getplayerinfo <Player> part
		if (<part> = drum)
			check = (<event_data>.noflip_color)
		else
			check = (<event_data>.Color)
		endif
		GetArraySize (<note_requirements>.note_color)
		<i> = 0
		begin
		if ((<note_requirements>.note_color [<i>]) = <check>)
			return \{note_valid = true}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script qp_hit_notes_drum_chord_note_check 
	formatText checksumName = event_name 'drum_multi_hitp%p' p = <Player>
	if (<event> = <event_name>)
		<drum_chord_color_list> = (<note_requirements>.chord_color_drum)
		GetArraySize <drum_chord_color_list>
		<list_total> = <array_Size>
		<chord_notes> = 0
		<chord_total> = (<event_data>.hits)
		<i> = 0
		begin
		<note_check> = (<note_requirements>.chord_color_drum [<i>])
		if StructureContains structure = <event_data> <note_check>
			<chord_notes> = (<chord_notes> + 1)
		endif
		<i> = (<i> + 1)
		repeat <list_total>
		if (<chord_notes> = <chord_total>)
			return \{note_valid = true}
		endif
	endif
endscript

script qp_hit_notes_guitar_chord_check 
	if StructureContains \{structure = event_data
			strum_pattern}
		if qp_hit_notes_chord_check_guitar goal_id = <goal_id> strum_pattern = (<event_data>.strum_pattern) chord_color = (<note_requirements>.chord_color)
			return \{note_valid = true}
		endif
	endif
endscript

script qp_hit_notes_chord_check_guitar 
	if ArrayContains array = <chord_color> contains = green
		if ArrayContains array = <chord_color> contains = red
			if (69632 = <strum_pattern>)
				return \{true}
			endif
			if ArrayContains array = <chord_color> contains = yellow
				if (69888 = <strum_pattern>)
					return \{true}
				endif
				if ArrayContains array = <chord_color> contains = blue
					if (69904 = <strum_pattern>)
						return \{true}
					endif
					if ArrayContains array = <chord_color> contains = orange
						if (69905 = <strum_pattern>)
							return \{true}
						endif
					endif
				endif
			endif
		elseif ArrayContains array = <chord_color> contains = yellow
			if (65792 = <strum_pattern>)
				return \{true}
			endif
			if ArrayContains array = <chord_color> contains = blue
				if (65808 = <strum_pattern>)
					return \{true}
				endif
				if ArrayContains array = <chord_color> contains = orange
					if (65809 = <strum_pattern>)
						return \{true}
					endif
				endif
			endif
		elseif ArrayContains array = <chord_color> contains = blue
			if (65552 = <strum_pattern>)
				return \{true}
			endif
			if ArrayContains array = <chord_color> contains = orange
				if (65553 = <strum_pattern>)
					return \{true}
				endif
			endif
		elseif ArrayContains array = <chord_color> contains = orange
			if (65537 = <strum_pattern>)
				return \{true}
			endif
		endif
	elseif ArrayContains array = <chord_color> contains = red
		if ArrayContains array = <chord_color> contains = yellow
			if (4352 = <strum_pattern>)
				return \{true}
			endif
			if ArrayContains array = <chord_color> contains = blue
				if (4368 = <strum_pattern>)
					return \{true}
				endif
				if ArrayContains array = <chord_color> contains = orange
					if (4369 = <strum_pattern>)
						return \{true}
					endif
				endif
			endif
		elseif ArrayContains array = <chord_color> contains = blue
			if (4112 = <strum_pattern>)
				return \{true}
			endif
			if ArrayContains array = <chord_color> contains = orange
				if (4113 = <strum_pattern>)
					return \{true}
				endif
			endif
		elseif ArrayContains array = <chord_color> contains = orange
			if (4097 = <strum_pattern>)
				return \{true}
			endif
		endif
	elseif ArrayContains array = <chord_color> contains = yellow
		if ArrayContains array = <chord_color> contains = blue
			if (272 = <strum_pattern>)
				return \{true}
			endif
			if ArrayContains array = <chord_color> contains = orange
				if (273 = <strum_pattern>)
					return \{true}
				endif
			endif
		endif
	elseif ArrayContains array = <chord_color> contains = blue
		if ArrayContains array = <chord_color> contains = orange
			if (17 = <strum_pattern>)
				return \{true}
			endif
		endif
	elseif ArrayContains array = <chord_color> contains = all
		if ((69632 = <strum_pattern>)
				|| (65792 = <strum_pattern>)
				|| (65552 = <strum_pattern>)
				|| (4352 = <strum_pattern>)
				|| (4112 = <strum_pattern>)
				|| (4097 = <strum_pattern>)
				|| (272 = <strum_pattern>)
				|| (257 = <strum_pattern>)
				|| (65537 = <strum_pattern>)
				|| (17 = <strum_pattern>)
				|| (69888 = <strum_pattern>)
				|| (69648 = <strum_pattern>)
				|| (65808 = <strum_pattern>)
				|| (4368 = <strum_pattern>)
				|| (4353 = <strum_pattern>)
				|| (4113 = <strum_pattern>)
				|| (69633 = <strum_pattern>)
				|| (65793 = <strum_pattern>)
				|| (65553 = <strum_pattern>)
				|| (273 = <strum_pattern>)
				|| (69904 = <strum_pattern>)
				|| (4369 = <strum_pattern>)
				|| (65809 = <strum_pattern>)
				|| (69649 = <strum_pattern>)
				|| (69889 = <strum_pattern>)
				|| (69905 = <strum_pattern>))
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script qp_hit_notes_special_check 
	if ((<note_requirements>.special) = tapping)
		if StructureContains \{structure = event_data
				hammer_strum}
			if StructureContains \{structure = event_data
					is_tapping}
				if ((<event_data>.is_tapping) = 1)
					if ((<event_data>.hammer_strum) = 1)
						return \{note_valid = true}
					endif
				endif
			endif
		endif
	elseif ((<note_requirements>.special) = hopo)
		if StructureContains \{structure = event_data
				hammer_strum}
			if StructureContains \{structure = event_data
					hammer_on}
				if ((<event_data>.hammer_on) = 1)
					if ((<event_data>.hammer_strum) = 1)
						if StructureContains \{structure = event_data
								Color}
							if ((<event_data>.Color) = extra)
								return \{note_valid = true}
							else
								if StructureContains \{structure = event_data
										is_tapping}
									if NOT ((<event_data>.is_tapping) = 1)
										return \{note_valid = true}
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	elseif ((<note_requirements>.special) = drum_accent)
		if StructureContains \{structure = event_data
				drum_accent}
			if ((<event_data>.drum_accent) = 1)
				return \{note_valid = true}
			endif
		endif
	elseif ((<note_requirements>.special) = spoken)
		if StructureContains \{structure = event_data
				vocal_note_type}
			if ((<event_data>.vocal_note_type) = spoken)
				return \{note_valid = true}
			endif
		endif
	endif
endscript

script qp_hit_notes_strum_check 
	if StructureContains \{structure = event_data
			hammer_on}
		if ((<event_data>.hammer_on) = 1)
			qp_hit_notes_reset_strum_check event_data = <event_data> goal_id = <goal_id>
			return \{note_valid = FALSE}
		endif
	endif
	if StructureContains \{structure = event_data
			strum_direction}
		if ((<note_requirements>.strum) = tap_only)
			if ((<event_data>.strum_direction) = 0)
				return \{note_valid = true}
			endif
		elseif ((<note_requirements>.strum) = up_only)
			if qp_hit_notes_strum_is_valid valid_direction = 1 event_data = <event_data> goal_id = <goal_id>
				return \{note_valid = true}
			endif
		elseif ((<note_requirements>.strum) = down_only)
			if qp_hit_notes_strum_is_valid valid_direction = -1 event_data = <event_data> goal_id = <goal_id>
				return \{note_valid = true}
			endif
		elseif ((<note_requirements>.strum) = up_and_down)
			gman_getdata goal = <goal_id> Player = (<event_data>.Player) Name = strum_state
			switch <strum_state>
				case up
				if qp_hit_notes_strum_is_valid valid_direction = -1 event_data = <event_data> goal_id = <goal_id>
					gman_setdata goal = <goal_id> Player = (<event_data>.Player) params = {strum_state = down}
					formatText checksumName = id 'strum_player_timeout_script_%t' t = (<event_data>.Player)
					SpawnScriptNow qp_hit_notes_strum_timeout params = {goal_id = <goal_id> Player = (<event_data>.Player)} id = <id>
					return \{note_valid = true}
				else
					formatText checksumName = id 'strum_player_timeout_script_%t' t = (<event_data>.Player)
					KillSpawnedScript id = <id>
				endif
				case down
				if qp_hit_notes_strum_is_valid valid_direction = 1 event_data = <event_data> goal_id = <goal_id>
					gman_setdata goal = <goal_id> Player = (<event_data>.Player) params = {strum_state = up}
					formatText checksumName = id 'strum_player_timeout_script_%t' t = (<event_data>.Player)
					KillSpawnedScript id = <id>
					SpawnScriptNow qp_hit_notes_strum_timeout params = {goal_id = <goal_id> Player = (<event_data>.Player)} id = <id>
					return \{note_valid = true}
				else
					formatText checksumName = id 'strum_player_timeout_script_%t' t = (<event_data>.Player)
					KillSpawnedScript id = <id>
				endif
				case Idle
				if qp_hit_notes_strum_is_valid valid_direction = 1 event_data = <event_data> goal_id = <goal_id>
					gman_setdata goal = <goal_id> Player = (<event_data>.Player) params = {strum_state = up}
					formatText checksumName = id 'strum_player_timeout_script_%t' t = (<event_data>.Player)
					KillSpawnedScript id = <id>
					SpawnScriptNow qp_hit_notes_strum_timeout params = {goal_id = <goal_id> Player = (<event_data>.Player)} id = <id>
					return \{note_valid = true}
				elseif qp_hit_notes_strum_is_valid valid_direction = -1 event_data = <event_data> goal_id = <goal_id>
					gman_setdata goal = <goal_id> Player = (<event_data>.Player) params = {strum_state = down}
					formatText checksumName = id 'strum_player_timeout_script_%t' t = (<event_data>.Player)
					KillSpawnedScript id = <id>
					SpawnScriptNow qp_hit_notes_strum_timeout params = {goal_id = <goal_id> Player = (<event_data>.Player)} id = <id>
					return \{note_valid = true}
				endif
				case Default
				ScriptAssert 'Invald strum_state set: %s - this will break alt_strum challenges' s = <strum_state>
			endswitch
		endif
	endif
endscript

script qp_hit_notes_strum_is_valid 
	if ((<event_data>.strum_direction) = <valid_direction>)
		if NOT ((<event_data>.hammer_on) = 1)
			if StructureContains \{structure = event_data
					is_tapping}
				if NOT ((<event_data>.is_tapping) = 1)
					return \{true}
				else
					qp_hit_notes_reset_strum_check event_data = <event_data> goal_id = <goal_id>
				endif
			else
				return \{true}
			endif
		else
			qp_hit_notes_reset_strum_check event_data = <event_data> goal_id = <goal_id>
		endif
	endif
	return \{FALSE}
endscript

script qp_hit_notes_strum_timeout 
	Wait \{1
		Seconds}
	if GMan_GoalIsActive goal = <goal_id>
		gman_setdata goal = <goal_id> Player = <Player> params = {strum_state = Idle}
	endif
endscript

script qp_hit_notes_reset_strum_check 
	<Player> = (<event_data>.Player)
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	formatText checksumName = id 'strum_player_timeout_script_%t' t = <Player>
	KillSpawnedScript id = <id>
	gman_setdata goal = <goal_id> Player = <Player> params = {strum_state = Idle}
endscript

script qp_hit_notes_precision_check 
	if StructureContains \{structure = event_data
			off_note}
		absolutevalue value = (<event_data>.off_note)
		if ((<note_requirements>.precision) > (<value>))
			return \{note_valid = true}
		endif
	elseif StructureContains \{structure = event_data
			rolling_accuracy}
		if StructureContains structure = (<note_requirements>) vocal_precision
			if ((<note_requirements>.vocal_precision) < (<event_data>.rolling_accuracy))
				return \{note_valid = true}
			endif
		endif
	endif
endscript
