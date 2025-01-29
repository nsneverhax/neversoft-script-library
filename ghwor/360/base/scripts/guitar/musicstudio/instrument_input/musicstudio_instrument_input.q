jam_quantize = [
	{
		value = 1.0
		name_text = qs(0xf65f8830)
	}
	{
		value = 0.5
		name_text = qs(0xbee028a9)
	}
	{
		value = 0.25
		name_text = qs(0xb6d46724)
	}
	{
		value = 0.16666666
		name_text = qs(0x276e0b01)
	}
	{
		value = 0.125
		name_text = qs(0xb3de2aa5)
	}
	{
		value = 0.08333333
		name_text = qs(0x3b97720b)
	}
	{
		value = 0.0625
		name_text = qs(0x26748eb3)
	}
	{
		value = 0.041666664
		name_text = qs(0xb2b129a1)
	}
	{
		value = 0.03125
		name_text = qs(0xc41c7161)
	}
	{
		value = 0.020833334
		name_text = qs(0x73d7882b)
	}
	{
		value = 0.015625
		name_text = qs(0xaf82baec)
	}
	{
		value = 0.0052083326
		name_text = qs(0x47157885)
	}
]

script jam_input_add_player_server \{Player = 1
		bot = 0}
	getplayerinfo <Player> controller
	add_music_studio_player_object Player = <Player> controller = <controller> spawn_id = <spawn_id> jam_room_player = true
	<new_player> :musicstudioplayer_setinputupdate On = true
	<new_player> :musicstudioplayer_setusingsamples using_samples = true
	return new_player = <new_player>
endscript

script jam_input_destroy_player_server 
	printf qs(0x7a98ee70) s = <Player>
	if musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
		<player_object> :destroy_jamroom_highway
		<player_object> :musicstudioplayer_setinputupdate On = FALSE
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		if (<main_player> != <player_object>)
			<player_object> :Die
		else
			musicstudio_mainobj :musicstudio_convertjamroomplayertomusicstudiodefaultplayer player_index = <Player>
		endif
	endif
endscript

script jam_input_whammy \{Player = 1}
	getplayerinfo <Player> resting_whammy_position
	if GuitarGetAnalogueInfo controller = <controller>
		if IsGuitarController controller = <controller>
			rightx_unscaled = (<rightx_unscaled> / 128.0)
			<len> = (<rightx_unscaled> - <resting_whammy_position> / (1.0 - <resting_whammy_position>))
			if (<len> < 0.0)
				<len> = 0.0
			endif
		else
			if (<leftlength> > 0)
				<len> = <leftlength>
			else
				if (<rightlength> > 0)
					<len> = <rightlength>
				else
					<len> = 0
				endif
			endif
		endif
		new_pitch = ((-1 * (<len> * 2)) * 1.0539999)
		getplayerinfo <Player> jam_instrument
		if musicstudio_mainobj :musicstudio_isplayingsongingame
			musicstudio_update_whammy_check_playables Player = <Player>
		endif
		musicstudio_update_whammy_per_track instrument = <jam_instrument> new_pitch = <new_pitch>
	endif
endscript

script musicstudio_update_whammy_per_track \{new_pitch = 0}
	if NOT ($jam_highway_step_recording = 1)
		switch <instrument>
			case 0
			setsoundbussparams {jammode_rhythmguitar = {pitch = <new_pitch>}}
			setsoundbussparams {jm_rhythm_line61 = {pitch = <new_pitch>}}
			setsoundbussparams {jm_rhythm_line62 = {pitch = <new_pitch>}}
			case 1
			setsoundbussparams {jammode_leadguitar = {pitch = <new_pitch>}}
			setsoundbussparams {jm_lead_line61 = {pitch = <new_pitch>}}
			setsoundbussparams {jm_lead_line62 = {pitch = <new_pitch>}}
			case 2
			setsoundbussparams {jammode_bass = {pitch = <new_pitch>}}
			setsoundbussparams {jm_bass_line61 = {pitch = <new_pitch>}}
			setsoundbussparams {jm_bass_line62 = {pitch = <new_pitch>}}
			case 4
			setsoundbussparams {jammode_vox = {pitch = <new_pitch>}}
			setsoundbussparams {jm_keys_line61 = {pitch = <new_pitch>}}
			setsoundbussparams {jm_keys_line62 = {pitch = <new_pitch>}}
		endswitch
	endif
endscript

script musicstudio_update_whammy_check_playables 
	getplayerinfo <Player> part
	musicstudio_mainobj :musicstudio_getcurrplayables
	if (<part> = guitar)
		switch <musicstudio_curr_playable_guitar>
			case 0
			musicstudio_update_whammy_per_track \{instrument = 1}
			if (<musicstudio_curr_playable_guitar> > -1)
				<jam_instrument> = <musicstudio_curr_playable_guitar>
			endif
			case 1
			musicstudio_update_whammy_per_track \{instrument = 0}
			if (<musicstudio_curr_playable_guitar> > -1)
				<jam_instrument> = <musicstudio_curr_playable_guitar>
			endif
		endswitch
	endif
	if (<part> = bass)
		switch <musicstudio_curr_playable_bass>
			case 2
			musicstudio_update_whammy_per_track \{instrument = 4}
			if (<musicstudio_curr_playable_bass> > -1)
				<jam_instrument> = <musicstudio_curr_playable_bass>
			endif
			case 4
			musicstudio_update_whammy_per_track \{instrument = 2}
			if (<musicstudio_curr_playable_bass> > -1)
				<jam_instrument> = <musicstudio_curr_playable_bass>
			endif
		endswitch
	endif
	return jam_instrument = <jam_instrument>
endscript

script jam_input_whammy_spawned \{Player = 1}
	getplayerinfo <Player> controller
	begin
	jam_input_whammy Player = <Player> controller = <controller>
	Wait \{1
		gameframe}
	repeat
endscript

script jam_stop_all_sound 
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	jam_stop_sound jam_instrument = <index>
	<index> = (<index> + 1)
	repeat <array_Size>
endscript

script jam_stop_sound \{jam_instrument = 0}
	switch (<jam_instrument>)
		case 0
		stopsound unique_id = ($jam_input_current_chord) fade_type = linear fade_time = $jam_fade_time
		case 1
		stopsound unique_id = ($jam_input_current_lead) fade_type = linear fade_time = $jam_fade_time
		case 2
		stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = $jam_fade_time
		case 4
		stopsound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = $jam_fade_time
	endswitch
endscript

script jam_delete_note 
	if ($jam_highway_recording = 0)
		return
	endif
	tolerance = 24
	getplayerinfo <Player> jam_instrument
	new_time = <curr_time>
	begin
	if findcustomnote track = ($jam_tracks [<jam_instrument>].id) time = (<new_time> - <tolerance>)
		getcustomnote track = ($jam_tracks [<jam_instrument>].id) index = <index>
		if (<note_time> >= (<new_time> - <tolerance>) && <note_time> <= (<new_time> + <tolerance>))
			deletecustomnote track = ($jam_tracks [<jam_instrument>].id) index = <index>
			jam_delete_note <...>
			if GotParam \{refreshvocals}
				musicstudio_mainobj :musicstudioghmix_refreshgems
			endif
		else
			break
		endif
	else
		break
	endif
	repeat
endscript
g_num_notes_recorded_this_session = 0

script jam_record_note 
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		Change g_num_notes_recorded_this_session = ($g_num_notes_recorded_this_session + 1)
		if ($g_num_notes_recorded_this_session >= 100)
			getplayerinfo <Player> controller
			fire_achievement Name = achievement_motivatedimproviser controller = <controller>
		endif
	endif
	if ($jam_highway_recording = 0)
		return
	endif
	if ($jam_band_recording = 1)
		if ($jam_player_recording_armed [(<Player> - 1)] = 0)
			return
		endif
	endif
	formatText checksumName = update_note_length_spawn 'update_note_length_spawn_%s' s = <Player>
	KillSpawnedScript id = <update_note_length_spawn>
	new_note_string = <note_string>
	new_note_fret = <note_fret>
	new_note_type = <note_type>
	new_note_chord_type = <chord_type>
	new_velocity = <velocity>
	if GotParam \{note_expressive_type}
		if (<note_expressive_type> >= 0)
			musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
			<player_object> :musicstudioplayer_getinstrument
			musicstudio_mainobj :musicstudio_getbendset track = ($jam_tracks [<instrument>].id)
			curr_bend_set = ($musicstudio_bend_sets [<bend_set>].bend_set)
			new_note_expressive_type = ($<curr_bend_set> [<note_expressive_type>])
		else
			new_note_expressive_type = 0
		endif
	else
		new_note_expressive_type = 0
	endif
	CastToInteger \{new_velocity}
	getplayerinfo <Player> jam_instrument
	CastToInteger \{curr_time}
	if (<curr_time> > ($jam_highway_song_length))
		<curr_time> = ($jam_highway_song_length)
	endif
	musicstudio_mainobj :musicstudioghmix_getquantizetime time = <curr_time> snap = ($jam_quantize [$jam_current_quantize].value)
	new_time = <quantize_time>
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = (1.0 / 32.0)
	new_length = <note_quantize_ms>
	if ($jam_highway_step_recording = 1)
		musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = ($jam_quantize [$jam_current_quantize].value)
		new_length = <note_quantize_ms>
	endif
	CastToInteger \{new_length}
	update_bitfield = -1
	old_sound_bitfield = -1
	enable_delete = 1
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = (1.0 / 256.0)
	if GotParam \{enable_delete}
		delete_window = 2
		if (<jam_instrument> = 3)
			musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = (1.0 / 64.0)
			CastToInteger <note_quantize_ms>
			<delete_window> = <note_quantize_ms>
		endif
		time = (<new_time> - <delete_window>)
		CastToInteger \{time}
		if findcustomnote track = ($jam_tracks [<jam_instrument>].id) time = <time>
			printf \{qs(0xd1185c3a)}
			getcustomnote track = ($jam_tracks [<jam_instrument>].id) index = <index>
			if (<note_time> >= (<new_time> - <delete_window>) && <note_time> <= (<new_time> + <delete_window>))
				printf \{qs(0x7696429f)}
				delete_note = 1
			endif
			if GotParam \{delete_note}
				if (<jam_instrument> = 3)
					<update_bitfield> = <note_pattern>
					<old_sound_bitfield> = <note_sound_bitfield>
				endif
				deletecustomnote track = ($jam_tracks [<jam_instrument>].id) index = <index>
				printf \{qs(0xfae519d4)}
			endif
		endif
	endif
	if NOT (<jam_instrument> = 3)
		addcustomnote {
			track = ($jam_tracks [<jam_instrument>].id)
			time = <new_time>
			string = <new_note_string>
			fret = <new_note_fret>
			Type = <new_note_type>
			expressive_type = <new_note_expressive_type>
			effect = 1
			velocity = <new_velocity>
			chord_type = <new_note_chord_type>
			length = <new_length>
			pattern = <hold_pattern>
			update_bitfield = <update_bitfield>
		}
	else
		addcustomnote {
			track = ($jam_tracks [<jam_instrument>].id)
			time = <new_time>
			length = <new_length>
			pattern = <hold_pattern>
			Type = <new_note_type>
			velocity = <new_velocity>
			update_bitfield = <update_bitfield>
			old_sound_bitfield = <old_sound_bitfield>
		}
	endif
	if NOT (<jam_instrument> = 3)
		if (<add_custom_note_index> > 0)
			if getcustomnote track = ($jam_tracks [<jam_instrument>].id) index = (<add_custom_note_index> - 1)
				if ((<note_time> + <note_length>) > (<new_time> - <note_quantize_ms>))
					new_note_length = ((<new_time> - <note_quantize_ms>) - <note_time>)
					CastToInteger \{new_note_length}
					updatecustomnote track = ($jam_tracks [<jam_instrument>].id) index = (<add_custom_note_index> - 1) length = <new_note_length>
				endif
			endif
		endif
		gettracksize track = ($jam_tracks [<jam_instrument>].id)
		if ((<add_custom_note_index> + 1) < <track_size>)
			if getcustomnote track = ($jam_tracks [<jam_instrument>].id) index = (<add_custom_note_index> + 1)
				if ((<new_time> + <new_length>) > (<note_time> - <note_quantize_ms>))
					new_note_length = (<note_time> - <note_quantize_ms> - <new_time>)
					CastToInteger \{new_note_length}
					updatecustomnote track = ($jam_tracks [<jam_instrument>].id) index = <add_custom_note_index> length = <new_note_length>
				endif
			endif
		endif
		SpawnScriptNow jam_input_update_note_length id = <update_note_length_spawn> params = {
			hold_pattern = <hold_pattern>
			Player = <Player>
			new_time = <new_time>
			jam_instrument = <jam_instrument>
			add_custom_note_index = <add_custom_note_index>
		}
	endif
	broadcastevent \{Type = musicstudio_ghmix_note_recorded}
endscript

script jam_record_note_drum \{percussion = 0}
	getplayerinfo <Player> jam_instrument
	if NOT (<jam_instrument> = 3)
		return
	endif
	if NOT GotParam \{auto}
		if NOT (<play_back> = 1)
			getplayerinfo <Player> controller
			if isdrumcontroller controller = <controller>
				SpawnScriptNow jam_fretboard_add_note params = {Player = <Player> gem_pattern = <hold_pattern>}
			else
				SpawnScriptNow jam_fretboard_add_note params = {Player = <Player> gem_pattern = <hold_pattern_color>}
			endif
		endif
	endif
	if (<play_back> = 1)
		return
	endif
	if NOT (<percussion> = 1)
		Type = 0
	else
		Type = 1
	endif
	CastToInteger \{velocity}
	jam_record_note {
		Player = <Player>
		note_string = 0
		note_fret = 0
		note_type = <Type>
		chord_type = <chord_type>
		velocity = <velocity>
		curr_time = $jam_highway_play_time
		hold_pattern = <hold_pattern>
	}
	broadcastevent \{Type = jam_note_hit}
endscript

script jam_input_update_note_length 
	initial_hold_pattern = <hold_pattern>
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = (1.0 / 256.0)
	if NOT GotParam \{controller}
		getplayerinfo <Player> controller
	endif
	begin
	new_note_length = ($jam_highway_play_time - <new_time> - <note_quantize_ms>)
	if (<new_note_length> < <note_quantize_ms>)
		<new_note_length> = <note_quantize_ms>
	endif
	CastToInteger \{new_note_length}
	updatecustomnote track = ($jam_tracks [<jam_instrument>].id) index = <add_custom_note_index> length = <new_note_length>
	gettracksize track = ($jam_tracks [<jam_instrument>].id)
	if ((<add_custom_note_index> + 1) < <track_size>)
		if getcustomnote track = ($jam_tracks [<jam_instrument>].id) index = (<add_custom_note_index> + 1)
			if ((<new_time> + <new_note_length>) > (<note_time> - <note_quantize_ms>))
				new_note_length = (<note_time> - <note_quantize_ms> - <new_time>)
				CastToInteger \{new_note_length}
				updatecustomnote track = ($jam_tracks [<jam_instrument>].id) index = <add_custom_note_index> length = <new_note_length>
				break
			endif
		endif
	endif
	if NOT is_custom_note_playing jam_instrument = <jam_instrument>
		break
	endif
	if (<new_note_length> >= 60000)
		jam_stop_sound jam_instrument = <jam_instrument>
		break
	endif
	GetHeldPattern controller = <controller> Player = <Player>
	if (<jam_instrument> = 1 || <jam_instrument> = 2 || <jam_instrument> = 4)
		jam_input_get_single_note pattern = <hold_pattern>
		<hold_pattern> = <single_note_pattern>
	endif
	if NOT (<initial_hold_pattern> = <hold_pattern>)
		break
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script jam_kill_update_note_length \{Player = 1}
	formatText checksumName = update_note_length_spawn 'update_note_length_spawn_%s' s = <Player>
	KillSpawnedScript id = <update_note_length_spawn>
endscript

script is_custom_note_playing 
	switch <jam_instrument>
		case 0
		sample = ($jam_input_current_chord)
		case 1
		sample = ($jam_input_current_lead)
		case 2
		sample = ($jam_input_current_bass)
		case 4
		sample = ($jam_input_current_melody)
	endswitch
	if issoundplayingbyid <sample>
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script get_next_snap_time \{time = 0
		snap = 0.25}
	musicstudio_mainobj :musicstudioghmix_getsnaptime time = <time> snap = <snap> direction = 1
	return snap_time = <snap_time>
endscript

script get_prev_snap_time \{time = 0
		snap = 0.25}
	musicstudio_mainobj :musicstudioghmix_getsnaptime time = <time> snap = <snap> direction = -1
	return snap_time = <snap_time>
endscript

script get_minutes_and_seconds_text \{time = 0}
	Mod a = <time> b = 60000
	<Seconds> = (<Mod> / 1000)
	<minutes> = (<time> / 60000)
	<sec_check> = (<Seconds> / 10)
	if (<sec_check> < 1)
		formatText TextName = minutes_and_seconds_text qs(0xeacde407) a = <minutes> b = <Seconds>
	else
		formatText TextName = minutes_and_seconds_text qs(0xcc868dda) a = <minutes> b = <Seconds>
	endif
	return minutes_and_seconds_text = <minutes_and_seconds_text>
endscript
