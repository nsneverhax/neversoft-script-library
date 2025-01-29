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

script jam_input_add_player_server \{player = 1
		bot = 0}
	GetPlayerInfo <player> controller
	add_music_studio_player_object player = <player> controller = <controller> spawn_id = <spawn_id> jam_room_player = true
	<new_player> :MusicStudioPlayer_SetInputUpdate on = true
	<new_player> :MusicStudioPlayer_SetUsingSamples using_samples = true
	return new_player = <new_player>
endscript

script jam_input_destroy_player_server 
	printf qs(0x7a98ee70) s = <player>
	if musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
		<player_object> :destroy_jamroom_highway
		<player_object> :MusicStudioPlayer_SetInputUpdate on = false
		musicstudio_mainobj :MusicStudio_GetCurrMainPlayer
		if (<main_player> != <player_object>)
			<player_object> :Die
		else
			musicstudio_mainobj :MusicStudio_ConvertJamRoomPlayerToMusicStudioDefaultPlayer player_index = <player>
		endif
	endif
endscript

script jam_input_whammy \{player = 1}
	GetPlayerInfo <player> resting_whammy_position
	if GuitarGetAnalogueInfo controller = <controller>
		if isguitarcontroller controller = <controller>
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
		GetPlayerInfo <player> jam_instrument
		if musicstudio_mainobj :MusicStudio_IsPlayingSongInGame
			musicstudio_update_whammy_check_playables player = <player>
		endif
		musicstudio_update_whammy_per_track instrument = <jam_instrument> new_pitch = <new_pitch>
	endif
endscript

script musicstudio_update_whammy_per_track \{new_pitch = 0}
	if NOT ($jam_highway_step_recording = 1)
		switch <instrument>
			case 0
			SetSoundBussParams {JamMode_RhythmGuitar = {pitch = <new_pitch>}}
			SetSoundBussParams {JM_Rhythm_Line61 = {pitch = <new_pitch>}}
			SetSoundBussParams {JM_Rhythm_Line62 = {pitch = <new_pitch>}}
			case 1
			SetSoundBussParams {JamMode_LeadGuitar = {pitch = <new_pitch>}}
			SetSoundBussParams {JM_Lead_Line61 = {pitch = <new_pitch>}}
			SetSoundBussParams {JM_Lead_Line62 = {pitch = <new_pitch>}}
			case 2
			SetSoundBussParams {JamMode_Bass = {pitch = <new_pitch>}}
			SetSoundBussParams {JM_Bass_Line61 = {pitch = <new_pitch>}}
			SetSoundBussParams {JM_Bass_Line62 = {pitch = <new_pitch>}}
			case 4
			SetSoundBussParams {JamMode_Vox = {pitch = <new_pitch>}}
			SetSoundBussParams {JM_Keys_Line61 = {pitch = <new_pitch>}}
			SetSoundBussParams {JM_Keys_Line62 = {pitch = <new_pitch>}}
		endswitch
	endif
endscript

script musicstudio_update_whammy_check_playables 
	GetPlayerInfo <player> part
	musicstudio_mainobj :MusicStudio_GetCurrPlayables
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

script jam_input_whammy_spawned \{player = 1}
	GetPlayerInfo <player> controller
	begin
	jam_input_whammy player = <player> controller = <controller>
	wait \{1
		gameframe}
	repeat
endscript

script jam_stop_all_sound 
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	jam_stop_sound jam_instrument = <index>
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script jam_stop_sound \{jam_instrument = 0}
	switch (<jam_instrument>)
		case 0
		StopSound unique_id = ($jam_input_current_chord) fade_type = linear fade_time = $jam_fade_time
		case 1
		StopSound unique_id = ($jam_input_current_lead) fade_type = linear fade_time = $jam_fade_time
		case 2
		StopSound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = $jam_fade_time
		case 4
		StopSound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = $jam_fade_time
	endswitch
endscript

script jam_delete_note 
	if ($jam_highway_recording = 0)
		return
	endif
	tolerance = 24
	GetPlayerInfo <player> jam_instrument
	new_time = <curr_time>
	if musicstudio_mainobj :MusicStudio_IsUsingStream
		musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
		<player_object> :MusicStudioPlayer_GetInstrument
		if (<instrument> = 5)
			refreshvocals = 1
		elseif (<instrument> = 3)
			tolerance = 100
		endif
	endif
	begin
	if FindCustomNote track = ($jam_tracks [<jam_instrument>].id) time = (<new_time> - <tolerance>)
		GetCustomNote track = ($jam_tracks [<jam_instrument>].id) index = <index>
		if (<note_time> >= (<new_time> - <tolerance>) && <note_time> <= (<new_time> + <tolerance>))
			DeleteCustomNote track = ($jam_tracks [<jam_instrument>].id) index = <index>
			jam_delete_note <...>
			if GotParam \{refreshvocals}
				musicstudio_mainobj :MusicStudioGhmix_RefreshGems
			endif
		else
			break
		endif
	else
		break
	endif
	repeat
endscript

script jam_record_note 
	if ($jam_highway_recording = 0)
		return
	endif
	if ($jam_band_recording = 1)
		if ($jam_player_recording_armed [(<player> - 1)] = 0)
			return
		endif
	endif
	if musicstudio_mainobj :MusicStudio_IsUsingStream
		notetracker = 1
		musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
		<player_object> :MusicStudioPlayer_GetInstrument
		if (<instrument> = 5)
			vocal_notetracker = 1
			if (<hold_pattern> = 69904)
				musicstudio_mainobj :MusicStudioGhmix_RefreshGems
				return
			endif
			if NOT (<hold_pattern> = 65536)
				return
			endif
			if GotParam \{hopo}
				return
			endif
		endif
		if (<hold_pattern> = 69904)
			return
		endif
	endif
	FormatText checksumname = update_note_length_spawn 'update_note_length_spawn_%s' s = <player>
	killspawnedscript id = <update_note_length_spawn>
	new_note_string = <note_string>
	new_note_fret = <note_fret>
	new_note_type = <note_type>
	new_note_chord_type = <chord_type>
	new_velocity = <velocity>
	if GotParam \{note_expressive_type}
		if (<note_expressive_type> >= 0)
			musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
			<player_object> :MusicStudioPlayer_GetInstrument
			musicstudio_mainobj :MusicStudio_GetBendSet track = ($jam_tracks [<instrument>].id)
			curr_bend_set = ($musicstudio_bend_sets [<bend_set>].bend_set)
			new_note_expressive_type = ($<curr_bend_set> [<note_expressive_type>])
		else
			new_note_expressive_type = 0
		endif
	else
		new_note_expressive_type = 0
	endif
	CastToInteger \{new_velocity}
	GetPlayerInfo <player> jam_instrument
	CastToInteger \{curr_time}
	if (<curr_time> > ($jam_highway_song_length))
		<curr_time> = ($jam_highway_song_length)
	endif
	musicstudio_mainobj :MusicStudioGhmix_GetQuantizeTime time = <curr_time> snap = ($jam_quantize [$jam_current_quantize].value)
	new_time = <quantize_time>
	musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = (1.0 / 32.0)
	new_length = <note_quantize_ms>
	if ($jam_highway_step_recording = 1)
		musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = ($jam_quantize [$jam_current_quantize].value)
		new_length = <note_quantize_ms>
	endif
	CastToInteger \{new_length}
	update_bitfield = -1
	old_sound_bitfield = -1
	if MusicStudio_InGHMix
		enable_delete = 1
	endif
	musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = (1.0 / 256.0)
	note_search = 0
	if GotParam \{notetracker}
		musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = (1.0 / 64.0)
		if GotParam \{vocal_notetracker}
			note_quantize_ms = ($notetracker_vocal_quantize)
		endif
		enable_delete = 1
		note_search = (<note_quantize_ms> + <note_quantize_ms>)
	endif
	if GotParam \{enable_delete}
		delete_window = 2
		if (<jam_instrument> = 3)
			musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = (1.0 / 64.0)
			CastToInteger <note_quantize_ms>
			<delete_window> = <note_quantize_ms>
		endif
		time = (<new_time> - <delete_window> - <note_search>)
		CastToInteger \{time}
		if FindCustomNote track = ($jam_tracks [<jam_instrument>].id) time = <time>
			printf \{qs(0xd1185c3a)}
			GetCustomNote track = ($jam_tracks [<jam_instrument>].id) index = <index>
			if (<note_time> >= (<new_time> - <delete_window>) && <note_time> <= (<new_time> + <delete_window>))
				printf \{qs(0x7696429f)}
				delete_note = 1
			endif
			if GotParam \{notetracker}
				if (<note_time> >= (<new_time> - <note_search>) && <note_time> <= (<new_time> + <note_search>))
					delete_note = 1
				endif
			endif
			if GotParam \{delete_note}
				if (<jam_instrument> = 3)
					<update_bitfield> = <note_pattern>
					<old_sound_bitfield> = <note_sound_bitfield>
				endif
				DeleteCustomNote track = ($jam_tracks [<jam_instrument>].id) index = <index>
				printf \{qs(0xfae519d4)}
			endif
		endif
	endif
	if NOT (<jam_instrument> = 3)
		AddCustomNote {
			track = ($jam_tracks [<jam_instrument>].id)
			time = <new_time>
			string = <new_note_string>
			Fret = <new_note_fret>
			type = <new_note_type>
			expressive_type = <new_note_expressive_type>
			Effect = 1
			velocity = <new_velocity>
			chord_type = <new_note_chord_type>
			length = <new_length>
			pattern = <hold_pattern>
			update_bitfield = <update_bitfield>
		}
	else
		AddCustomNote {
			track = ($jam_tracks [<jam_instrument>].id)
			time = <new_time>
			length = <new_length>
			pattern = <hold_pattern>
			type = <new_note_type>
			velocity = <new_velocity>
			update_bitfield = <update_bitfield>
			old_sound_bitfield = <old_sound_bitfield>
		}
	endif
	if NOT MusicStudio_InGHMix
		AttachNoteTask {
			task = AgeTracker
			expiry = 1000
			track = ($jam_tracks [<jam_instrument>].id)
			index = <add_custom_note_index>
		}
		if (<jam_instrument> = 3)
			AttachNoteTask {
				task = ChordCreator
				tolerance = 150
				track = ($jam_tracks [<jam_instrument>].id)
				index = <add_custom_note_index>
			}
		endif
		if ($notetracker_record_mode = insert)
		else
			AttachNoteTask {
				task = Overwrite
				behind_time = $notetracker_overwrite_kill_behind_range
				ahead_time = $notetracker_overwrite_kill_ahead_range
				track = ($jam_tracks [<jam_instrument>].id)
				index = <add_custom_note_index>
			}
		endif
		if ($notetracker_strum_mode = disabled)
			AttachNoteTask {
				task = FretTransitionFilter
				tolerance = 200
				track = ($jam_tracks [<jam_instrument>].id)
				index = <add_custom_note_index>
			}
		endif
	endif
	if NOT (<jam_instrument> = 3)
		if (<add_custom_note_index> > 0)
			if GetCustomNote track = ($jam_tracks [<jam_instrument>].id) index = (<add_custom_note_index> - 1)
				if ((<note_time> + <note_length>) > (<new_time> - <note_quantize_ms>))
					new_note_length = ((<new_time> - <note_quantize_ms>) - <note_time>)
					CastToInteger \{new_note_length}
					UpdateCustomNote track = ($jam_tracks [<jam_instrument>].id) index = (<add_custom_note_index> - 1) length = <new_note_length>
				endif
			endif
		endif
		GetTrackSize track = ($jam_tracks [<jam_instrument>].id)
		if ((<add_custom_note_index> + 1) < <track_size>)
			if GetCustomNote track = ($jam_tracks [<jam_instrument>].id) index = (<add_custom_note_index> + 1)
				if ((<new_time> + <new_length>) > (<note_time> - <note_quantize_ms>))
					new_note_length = (<note_time> - <note_quantize_ms> - <new_time>)
					CastToInteger \{new_note_length}
					UpdateCustomNote track = ($jam_tracks [<jam_instrument>].id) index = <add_custom_note_index> length = <new_note_length>
				endif
			endif
		endif
		spawnscriptnow jam_input_update_note_length id = <update_note_length_spawn> params = {
			hold_pattern = <hold_pattern>
			player = <player>
			new_time = <new_time>
			jam_instrument = <jam_instrument>
			add_custom_note_index = <add_custom_note_index>
		}
	endif
	broadcastevent \{type = musicstudio_ghmix_note_recorded}
endscript

script jam_record_note_drum \{percussion = 0}
	GetPlayerInfo <player> jam_instrument
	if NOT (<jam_instrument> = 3)
		return
	endif
	if ($jam_tutorial_status = active)
		broadcastevent type = jam_tutorial_drum_hit data = {hold_pattern = <hold_pattern>}
	endif
	if NOT GotParam \{auto}
		if NOT (<play_back> = 1)
			GetPlayerInfo <player> controller
			if isdrumcontroller controller = <controller>
				spawnscriptnow jam_fretboard_add_note params = {player = <player> gem_pattern = <hold_pattern>}
			else
				spawnscriptnow jam_fretboard_add_note params = {player = <player> gem_pattern = <hold_pattern_color>}
			endif
		endif
	endif
	if (<play_back> = 1)
		return
	endif
	if NOT (<percussion> = 1)
		type = 0
	else
		type = 1
	endif
	CastToInteger \{velocity}
	jam_record_note {
		player = <player>
		note_string = 0
		note_fret = 0
		note_type = <type>
		chord_type = <chord_type>
		velocity = <velocity>
		curr_time = $jam_highway_play_time
		hold_pattern = <hold_pattern>
	}
	broadcastevent \{type = jam_note_hit}
endscript

script jam_input_update_note_length 
	initial_hold_pattern = <hold_pattern>
	musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = (1.0 / 256.0)
	if musicstudio_mainobj :MusicStudio_IsUsingStream
		musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
		<player_object> :MusicStudioPlayer_GetInstrument
		if (<instrument> = 5)
			note_quantize_ms = ($notetracker_vocal_quantize)
		endif
	endif
	if NOT GotParam \{controller}
		GetPlayerInfo <player> controller
	endif
	begin
	new_note_length = ($jam_highway_play_time - <new_time> - <note_quantize_ms>)
	if (<new_note_length> < <note_quantize_ms>)
		<new_note_length> = <note_quantize_ms>
	endif
	CastToInteger \{new_note_length}
	UpdateCustomNote track = ($jam_tracks [<jam_instrument>].id) index = <add_custom_note_index> length = <new_note_length>
	GetTrackSize track = ($jam_tracks [<jam_instrument>].id)
	if ((<add_custom_note_index> + 1) < <track_size>)
		if GetCustomNote track = ($jam_tracks [<jam_instrument>].id) index = (<add_custom_note_index> + 1)
			if ((<new_time> + <new_note_length>) > (<note_time> - <note_quantize_ms>))
				new_note_length = (<note_time> - <note_quantize_ms> - <new_time>)
				CastToInteger \{new_note_length}
				UpdateCustomNote track = ($jam_tracks [<jam_instrument>].id) index = <add_custom_note_index> length = <new_note_length>
				break
			endif
		endif
	endif
	if NOT musicstudio_mainobj :MusicStudio_IsUsingStream
		if NOT is_custom_note_playing jam_instrument = <jam_instrument>
			break
		endif
	endif
	if (<new_note_length> >= 60000)
		jam_stop_sound jam_instrument = <jam_instrument>
		break
	endif
	GetHeldPattern controller = <controller> player = <player>
	if (<jam_instrument> = 1 || <jam_instrument> = 2 || <jam_instrument> = 4)
		jam_input_get_single_note pattern = <hold_pattern>
		<hold_pattern> = <single_note_pattern>
	endif
	if NOT (<initial_hold_pattern> = <hold_pattern>)
		break
	endif
	wait \{1
		gameframes}
	repeat
endscript

script jam_kill_update_note_length \{player = 1}
	FormatText checksumname = update_note_length_spawn 'update_note_length_spawn_%s' s = <player>
	killspawnedscript id = <update_note_length_spawn>
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
	if IsSoundPlayingByID <sample>
		return \{true}
	else
		return \{false}
	endif
endscript

script get_next_snap_time \{time = 0
		snap = 0.25}
	musicstudio_mainobj :MusicStudioGhmix_GetSnapTime time = <time> snap = <snap> direction = 1
	return snap_time = <snap_time>
endscript

script get_prev_snap_time \{time = 0
		snap = 0.25}
	musicstudio_mainobj :MusicStudioGhmix_GetSnapTime time = <time> snap = <snap> direction = -1
	return snap_time = <snap_time>
endscript

script get_minutes_and_seconds_text \{time = 0}
	Mod a = <time> b = 60000
	<seconds> = (<Mod> / 1000)
	<minutes> = (<time> / 60000)
	<sec_check> = (<seconds> / 10)
	if (<sec_check> < 1)
		FormatText TextName = minutes_and_seconds_text qs(0xeacde407) a = <minutes> b = <seconds>
	else
		FormatText TextName = minutes_and_seconds_text qs(0xcc868dda) a = <minutes> b = <seconds>
	endif
	return minutes_and_seconds_text = <minutes_and_seconds_text>
endscript
