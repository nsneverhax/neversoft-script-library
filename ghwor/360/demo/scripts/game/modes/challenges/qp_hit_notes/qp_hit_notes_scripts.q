g_qp_hit_notes_core = {
	player_data = {
		current_progress = 0
		section_base_value = 0
		previous_progress = 0
		chord_check = -1
		strum_state = idle
	}
	initial_data = {
		current_progress = 0
	}
	checkpoints = [
		{
			name = 'main'
			tools = [
				{
					name = 'hit_listener'
					type = event_listener
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
					name = 'miss_listener'
					type = event_listener
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
					name = 'progress_watcher'
					type = var_watcher
					var_updated = challenge_qp_evaluate_progress
					vars = [
						{
							source = goalplayerdata
							var = current_progress
							type = float
						}
						{
							source = goaldata
							var = current_progress
							type = float
						}
					]
				}
				{
					name = 'section_watcher'
					type = section_watcher
				}
			]
		}
	]
}

script qp_hit_notes_listener_note_hit 
	if qp_hit_notes_note_is_valid <...>
		challenge_qp_calculate_current_progress goal_id = <goal_id> player = (<event_data>.player) current_value = 1 var_type = incremental
		gman_setdata goal = <goal_id> player = (<event_data>.player) params = {current_progress = <current_progress> previous_progress = <current_progress>}
		if challenge_is_band_subtype goal_id = <goal_id>
			challenge_qp_calculate_total_band_progress goal_id = <goal_id>
			gman_setdata goal = <goal_id> params = {current_progress = <total_band_progress>}
		endif
	else
		return
	endif
endscript

script qp_hit_notes_note_is_valid 
	gman_getconstant goal = <goal_id> name = note_requirements return_name = note_requirements
	<note_valid> = false
	<player> = (<event_data>.player)
	if NOT challenge_qp_current_section_is_valid goal_id = <goal_id>
		return \{false}
	endif
	if structurecontains structure = (<note_requirements>) note_color
		qp_hit_notes_color_check <...>
	elseif structurecontains structure = (<note_requirements>) chord_color_drum
		qp_hit_notes_drum_chord_note_check <...>
	else
		<duplicate_chord> = false
		<ignore_chords> = 0
		if structurecontains structure = (<note_requirements>) special
			if (<note_requirements>.special = drum_accent)
				<ignore_chords> = 1
			endif
		endif
		if (<ignore_chords> = 0)
			if structurecontains \{structure = event_data
					array_entry}
				gman_getdata goal = <goal_id> player = <player> name = chord_check
				<chord_check_old> = <chord_check>
				<chord_check_new> = (<event_data>.array_entry)
				gman_setdata goal = <goal_id> player = <player> params = {chord_check = <chord_check_new>}
				if (<chord_check_new> = <chord_check_old>)
					<duplicate_chord> = true
				endif
			endif
		endif
		getplayerinfo <player> part
		if (<part> = drum && (<goal_string> = 'qp_hit_notes' || <goal_string> = 'qp_hit_notes_band'))
			duplicate_chord = false
		endif
		if (<duplicate_chord> = true)
			<note_valid> = false
		elseif structurecontains structure = (<note_requirements>) chord_color
			qp_hit_notes_guitar_chord_check <...>
		elseif structurecontains structure = (<note_requirements>) special
			qp_hit_notes_special_check <...>
		elseif structurecontains structure = (<note_requirements>) strum
			qp_hit_notes_strum_check <...>
		elseif structurecontains structure = (<note_requirements>) precision
			qp_hit_notes_precision_check <...>
		else
			<note_valid> = true
			if structurecontains structure = <event_data> note_complete
				if (<event_data>.note_complete = 0)
					<note_valid> = false
				endif
			endif
		endif
	endif
	if (<note_valid> = true)
		return \{true}
	else
		return \{false}
	endif
endscript

script qp_hit_notes_color_check 
	if structurecontains \{structure = event_data
			color}
		getplayerinfo <player> part
		if (<part> = drum)
			check = (<event_data>.noflip_color)
		else
			check = (<event_data>.color)
		endif
		getarraysize (<note_requirements>.note_color)
		<i> = 0
		begin
		if ((<note_requirements>.note_color [<i>]) = <check>)
			return \{note_valid = true}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script qp_hit_notes_drum_chord_note_check 
	formattext checksumname = event_name 'drum_multi_hitp%p' p = <player>
	if (<event> = <event_name>)
		<drum_chord_color_list> = (<note_requirements>.chord_color_drum)
		getarraysize <drum_chord_color_list>
		<list_total> = <array_size>
		<chord_notes> = 0
		<chord_total> = (<event_data>.hits)
		<i> = 0
		begin
		<note_check> = (<note_requirements>.chord_color_drum [<i>])
		if structurecontains structure = <event_data> <note_check>
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
	if structurecontains \{structure = event_data
			strum_pattern}
		if qp_hit_notes_chord_check_guitar goal_id = <goal_id> strum_pattern = (<event_data>.strum_pattern) chord_color = (<note_requirements>.chord_color)
			return \{note_valid = true}
		endif
	endif
endscript

script qp_hit_notes_chord_check_guitar 
	if arraycontains array = <chord_color> contains = green
		if arraycontains array = <chord_color> contains = red
			if (69632 = <strum_pattern>)
				return \{true}
			endif
			if arraycontains array = <chord_color> contains = yellow
				if (69888 = <strum_pattern>)
					return \{true}
				endif
				if arraycontains array = <chord_color> contains = blue
					if (69904 = <strum_pattern>)
						return \{true}
					endif
					if arraycontains array = <chord_color> contains = orange
						if (69905 = <strum_pattern>)
							return \{true}
						endif
					endif
				endif
			endif
		elseif arraycontains array = <chord_color> contains = yellow
			if (65792 = <strum_pattern>)
				return \{true}
			endif
			if arraycontains array = <chord_color> contains = blue
				if (65808 = <strum_pattern>)
					return \{true}
				endif
				if arraycontains array = <chord_color> contains = orange
					if (65809 = <strum_pattern>)
						return \{true}
					endif
				endif
			endif
		elseif arraycontains array = <chord_color> contains = blue
			if (65552 = <strum_pattern>)
				return \{true}
			endif
			if arraycontains array = <chord_color> contains = orange
				if (65553 = <strum_pattern>)
					return \{true}
				endif
			endif
		elseif arraycontains array = <chord_color> contains = orange
			if (65537 = <strum_pattern>)
				return \{true}
			endif
		endif
	elseif arraycontains array = <chord_color> contains = red
		if arraycontains array = <chord_color> contains = yellow
			if (4352 = <strum_pattern>)
				return \{true}
			endif
			if arraycontains array = <chord_color> contains = blue
				if (4368 = <strum_pattern>)
					return \{true}
				endif
				if arraycontains array = <chord_color> contains = orange
					if (4369 = <strum_pattern>)
						return \{true}
					endif
				endif
			endif
		elseif arraycontains array = <chord_color> contains = blue
			if (4112 = <strum_pattern>)
				return \{true}
			endif
			if arraycontains array = <chord_color> contains = orange
				if (4113 = <strum_pattern>)
					return \{true}
				endif
			endif
		elseif arraycontains array = <chord_color> contains = orange
			if (4097 = <strum_pattern>)
				return \{true}
			endif
		endif
	elseif arraycontains array = <chord_color> contains = yellow
		if arraycontains array = <chord_color> contains = blue
			if (272 = <strum_pattern>)
				return \{true}
			endif
			if arraycontains array = <chord_color> contains = orange
				if (273 = <strum_pattern>)
					return \{true}
				endif
			endif
		endif
	elseif arraycontains array = <chord_color> contains = blue
		if arraycontains array = <chord_color> contains = orange
			if (17 = <strum_pattern>)
				return \{true}
			endif
		endif
	elseif arraycontains array = <chord_color> contains = all
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
	return \{false}
endscript

script qp_hit_notes_special_check 
	if ((<note_requirements>.special) = tapping)
		if structurecontains \{structure = event_data
				hammer_strum}
			if structurecontains \{structure = event_data
					is_tapping}
				if ((<event_data>.is_tapping) = 1)
					if ((<event_data>.hammer_strum) = 1)
						return \{note_valid = true}
					endif
				endif
			endif
		endif
	elseif ((<note_requirements>.special) = hopo)
		if structurecontains \{structure = event_data
				hammer_strum}
			if structurecontains \{structure = event_data
					hammer_on}
				if ((<event_data>.hammer_on) = 1)
					if ((<event_data>.hammer_strum) = 1)
						if structurecontains \{structure = event_data
								color}
							if ((<event_data>.color) = extra)
								return \{note_valid = true}
							else
								if structurecontains \{structure = event_data
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
		if structurecontains \{structure = event_data
				drum_accent}
			if ((<event_data>.drum_accent) = 1)
				return \{note_valid = true}
			endif
		endif
	elseif ((<note_requirements>.special) = spoken)
		if structurecontains \{structure = event_data
				vocal_note_type}
			if ((<event_data>.vocal_note_type) = spoken)
				return \{note_valid = true}
			endif
		endif
	endif
endscript

script qp_hit_notes_strum_check 
	if structurecontains \{structure = event_data
			hammer_on}
		if ((<event_data>.hammer_on) = 1)
			printf \{channel = qp_challenge
				'There goes a HOPO'}
			qp_hit_notes_reset_strum_check event_data = <event_data> goal_id = <goal_id>
			return \{note_valid = false}
		endif
	endif
	if structurecontains \{structure = event_data
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
			gman_getdata goal = <goal_id> player = (<event_data>.player) name = strum_state
			printf channel = qp_challenge 'previous strum_state=%s strummed=%d' s = <strum_state> d = (<event_data>.strum_direction)
			switch <strum_state>
				case up
				if qp_hit_notes_strum_is_valid valid_direction = -1 event_data = <event_data> goal_id = <goal_id>
					printf \{channel = qp_challenge
						'down strum has followed up strum, valid hit'}
					gman_setdata goal = <goal_id> player = (<event_data>.player) params = {strum_state = down}
					formattext checksumname = id 'strum_player_timeout_script_%t' t = (<event_data>.player)
					spawnscriptnow qp_hit_notes_strum_timeout params = {goal_id = <goal_id> player = (<event_data>.player)} id = <id>
					return \{note_valid = true}
				else
					printf \{channel = qp_challenge
						'reset strum check, STRUM was WRONG'}
					formattext checksumname = id 'strum_player_timeout_script_%t' t = (<event_data>.player)
					killspawnedscript id = <id>
				endif
				case down
				if qp_hit_notes_strum_is_valid valid_direction = 1 event_data = <event_data> goal_id = <goal_id>
					printf \{channel = qp_challenge
						'up strum has followed down strum, valid hit'}
					gman_setdata goal = <goal_id> player = (<event_data>.player) params = {strum_state = up}
					formattext checksumname = id 'strum_player_timeout_script_%t' t = (<event_data>.player)
					killspawnedscript id = <id>
					spawnscriptnow qp_hit_notes_strum_timeout params = {goal_id = <goal_id> player = (<event_data>.player)} id = <id>
					return \{note_valid = true}
				else
					printf \{channel = qp_challenge
						'reset strum check, STRUM was WRONG'}
					formattext checksumname = id 'strum_player_timeout_script_%t' t = (<event_data>.player)
					killspawnedscript id = <id>
				endif
				case idle
				if qp_hit_notes_strum_is_valid valid_direction = 1 event_data = <event_data> goal_id = <goal_id>
					printf \{channel = qp_challenge
						'up strum has followed strum reset, valid hit'}
					gman_setdata goal = <goal_id> player = (<event_data>.player) params = {strum_state = up}
					formattext checksumname = id 'strum_player_timeout_script_%t' t = (<event_data>.player)
					killspawnedscript id = <id>
					spawnscriptnow qp_hit_notes_strum_timeout params = {goal_id = <goal_id> player = (<event_data>.player)} id = <id>
					return \{note_valid = true}
				elseif qp_hit_notes_strum_is_valid valid_direction = -1 event_data = <event_data> goal_id = <goal_id>
					printf \{channel = qp_challenge
						'down strum has followed strum reset, valid hit'}
					gman_setdata goal = <goal_id> player = (<event_data>.player) params = {strum_state = down}
					formattext checksumname = id 'strum_player_timeout_script_%t' t = (<event_data>.player)
					killspawnedscript id = <id>
					spawnscriptnow qp_hit_notes_strum_timeout params = {goal_id = <goal_id> player = (<event_data>.player)} id = <id>
					return \{note_valid = true}
				endif
				case `default`
				scriptassert 'Invald strum_state set: %s - this will break alt_strum challenges' s = <strum_state>
			endswitch
		endif
	endif
endscript

script qp_hit_notes_strum_is_valid 
	if ((<event_data>.strum_direction) = <valid_direction>)
		if NOT ((<event_data>.hammer_on) = 1)
			if structurecontains \{structure = event_data
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
	return \{false}
endscript

script qp_hit_notes_strum_timeout 
	wait \{1
		seconds}
	if gman_goalisactive goal = <goal_id>
		gman_setdata goal = <goal_id> player = <player> params = {strum_state = idle}
	endif
endscript

script qp_hit_notes_reset_strum_check 
	<player> = (<event_data>.player)
	getplayerinfo <player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	formattext checksumname = id 'strum_player_timeout_script_%t' t = <player>
	killspawnedscript id = <id>
	gman_setdata goal = <goal_id> player = <player> params = {strum_state = idle}
endscript

script qp_hit_notes_precision_check 
	if structurecontains \{structure = event_data
			off_note}
		absolutevalue value = (<event_data>.off_note)
		if ((<note_requirements>.precision) > (<value>))
			return \{note_valid = true}
		endif
	elseif structurecontains \{structure = event_data
			rolling_accuracy}
		if structurecontains structure = (<note_requirements>) vocal_precision
			if ((<note_requirements>.vocal_precision) < (<event_data>.rolling_accuracy))
				return \{note_valid = true}
			endif
		endif
	endif
endscript
