
script musicstudio_get_track_volume_info 
	if NOT GotParam \{jam_instrument}
		GetPlayerInfo <player> jam_instrument
	endif
	GetTrackInfo track = ($jam_tracks [<jam_instrument>].id)
	return <...>
endscript

script musicstudio_update_volume 
	if NOT GotParam \{volume}
		musicstudio_get_track_volume_info <...>
		if NOT GotParam \{volume}
			return
		endif
	endif
	if musicstudio_mainobj :MusicStudio_IsPlayingSongInGame
		musicstudio_update_volume_check_playables <...>
		if GotParam \{player}
			<temp_volume> = <volume>
			musicstudio_get_track_volume_info <...>
			musicstudio_mainobj :MusicStudio_CalcInGamePlaybackVolumeLevel player = <player> volume = <temp_volume> track_volume = <volume>
		endif
	endif
	musicstudio_update_track_volume instrument = <jam_instrument> volume = <volume>
	jam_update_line6_volumes
endscript

script musicstudio_update_track_volume 
	RequireParams \{[
			instrument
			volume
		]
		all}
	jam_get_volume_from_volume_level volume = <volume>
	switch <instrument>
		case 0
		SetSoundBussParams {JM_Rhythm_Line61 = {vol = (($default_BussSet.JM_Rhythm_Line61.vol) - <volume>)}}
		SetSoundBussParams {JM_Rhythm_Line62 = {vol = (($default_BussSet.JM_Rhythm_Line62.vol) - <volume>)}}
		case 1
		SetSoundBussParams {JM_Lead_Line61 = {vol = (($default_BussSet.JM_Lead_Line61.vol) - <volume>)}}
		SetSoundBussParams {JM_Lead_Line62 = {vol = (($default_BussSet.JM_Lead_Line62.vol) - <volume>)}}
		case 2
		SetSoundBussParams {JamMode_Bass = {vol = (($default_BussSet.JamMode_Bass.vol) - <volume>)}}
		SetSoundBussParams {JM_Bass_Line61 = {vol = (($default_BussSet.JM_Bass_Line61.vol) - <volume>)}}
		SetSoundBussParams {JM_Bass_Line62 = {vol = (($default_BussSet.JM_Bass_Line62.vol) - <volume>)}}
		case 3
		SetSoundBussParams {JamMode_Drums = {vol = (($default_BussSet.JamMode_Drums.vol) - <volume>)}}
		SetSoundBussParams {JM_Drums_Line61 = {vol = (($default_BussSet.JM_Drums_Line61.vol) - <volume>)}}
		SetSoundBussParams {JM_Drums_Line62 = {vol = (($default_BussSet.JM_Drums_Line62.vol) - <volume>)}}
		case 4
		SetSoundBussParams {JamMode_Vox = {vol = (($default_BussSet.JamMode_Vox.vol) - <volume>)}}
		SetSoundBussParams {JM_Keys_Line61 = {vol = (($default_BussSet.JM_Keys_Line61.vol) - <volume>)}}
		SetSoundBussParams {JM_Keys_Line62 = {vol = (($default_BussSet.JM_Keys_Line62.vol) - <volume>)}}
	endswitch
endscript

script musicstudio_update_volume_check_playables 
	if NOT GotParam \{player}
		return
	endif
	GetPlayerInfo <player> part
	musicstudio_mainobj :MusicStudio_GetCurrPlayables
	if (<part> = guitar)
		switch <musicstudio_curr_playable_guitar>
			case 0
			GetTrackInfo track = ($jam_tracks [1].id)
			musicstudio_update_track_volume instrument = 1 volume = <volume>
			if (<musicstudio_curr_playable_guitar> > -1)
				<jam_instrument> = <musicstudio_curr_playable_guitar>
			endif
			case 1
			GetTrackInfo track = ($jam_tracks [0].id)
			musicstudio_update_track_volume instrument = 0 volume = <volume>
			if (<musicstudio_curr_playable_guitar> > -1)
				<jam_instrument> = <musicstudio_curr_playable_guitar>
			endif
		endswitch
	endif
	if (<part> = bass)
		switch <musicstudio_curr_playable_bass>
			case 2
			GetTrackInfo track = ($jam_tracks [4].id)
			musicstudio_update_track_volume instrument = 4 volume = <volume>
			if (<musicstudio_curr_playable_bass> > -1)
				<jam_instrument> = <musicstudio_curr_playable_bass>
			endif
			case 4
			GetTrackInfo track = ($jam_tracks [2].id)
			musicstudio_update_track_volume instrument = 2 volume = <volume>
			if (<musicstudio_curr_playable_bass> > -1)
				<jam_instrument> = <musicstudio_curr_playable_bass>
			endif
		endswitch
	endif
	return jam_instrument = <jam_instrument>
endscript

script musicstudio_init_volumes 
	SetSoundBussParams {Guitar_JamMode = {vol = ($default_BussSet.Guitar_JamMode.vol)}}
	SetSoundBussParams {User_Drums = {vol = ($default_BussSet.User_Drums.vol)}}
	SetSoundBussParams {Drums_JamMode = {vol = ($default_BussSet.Drums_JamMode.vol)}}
	SetSoundBussParams {JamMode_Drums_Cymbals = {vol = ($default_BussSet.JamMode_Drums_Cymbals.vol)}}
	SetSoundBussParams {JamMode_Drums_Toms = {vol = ($default_BussSet.JamMode_Drums_Toms.vol)}}
	SetSoundBussParams {JamMode_Drums_Kick = {vol = ($default_BussSet.JamMode_Drums_Kick.vol)}}
	SetSoundBussParams {JamMode_Drums_Snare = {vol = ($default_BussSet.JamMode_Drums_Snare.vol)}}
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	if NOT GotParam \{no_tracks}
		GetTrackInfo track = ($jam_tracks [<index>].id)
	else
		volume = 8
	endif
	musicstudio_update_track_volume instrument = <index> volume = <volume>
	<index> = (<index> + 1)
	repeat <array_size>
	jam_update_line6_volumes
endscript

script jam_update_line6_volumes 
	GetSongInfo
	jam_get_volume_from_volume_level volume = <line6_0_volume>
	SetSoundBussParams {Line61_JamMode = {vol = (($default_BussSet.Line61_JamMode.vol) - <volume>)}}
	jam_get_volume_from_volume_level volume = <line6_1_volume>
	SetSoundBussParams {Line62_JamMode = {vol = (($default_BussSet.Line62_JamMode.vol) - <volume>)}}
endscript

script jam_debug_volumes 
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	GetTrackInfo track = ($jam_tracks [<index>].id)
	printf qs(0xdefac614) s = ($jam_tracks [<index>].name_text) a = <volume>
	<index> = (<index> + 1)
	repeat (<array_size> - 1)
	GetSongInfo
	printf qs(0x30d5ad50) a = <line6_0_volume>
	printf qs(0x68cb0478) a = <line6_1_volume>
endscript

script jam_get_volume_from_volume_level 
	new_vol = ((10 - <volume>) * 2)
	if (<volume> = 0)
		<new_vol> = 100
	endif
	return volume = <new_vol>
endscript

script musicstudio_update_volume_for_playback \{unnecessarynote = 0}
	if NOT ($current_song_qpak = jamsession)
		return
	endif
	if notetracker_is_using_stream
		if GotParam \{off}
			single_stream_response_script playerindex = <player> onoff = false unnecessarynote = <unnecessarynote>
		else
			single_stream_response_script playerindex = <player> onoff = true unnecessarynote = <unnecessarynote>
		endif
		return
	endif
	musicstudio_swap_playback_tracks player = <player>
	GetPlayerInfo <player> part
	if (<part> = guitar)
		inst = <playback_track1>
	elseif (<part> = bass)
		inst = <playback_track2>
	else
		return
	endif
	if GotParam \{off}
		musicstudio_update_volume volume = 0 jam_instrument = <inst> player = <player>
	else
		musicstudio_update_volume jam_instrument = <inst> player = <player>
	endif
endscript

script musicstudio_update_pan 
	if NOT GotParam \{instrument}
		musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
		<player_object> :MusicStudioPlayer_GetInstrument
	endif
	GetSongInfo
	musicstudio_mixer_pan_get_active instrument = <instrument>
	if (<active> = 1)
		line6_0_pan_scaled = (<line6_0_pan> / 5.0)
		line6_1_pan_scaled = (<line6_1_pan> / 5.0)
	else
		line6_0_pan_scaled = 0
		line6_1_pan_scaled = 0
	endif
	musicstudio_mainobj :MusicStudio_GetTrackEffectIndex track = ($jam_tracks [<instrument>].id)
	switch <effect_type_index>
		case 0
		SetDSPEffectParams effects = [{Effect = POD2Reverb name = POD2Reverb_Lead PreRevPan = <line6_0_pan_scaled>}]
		case 1
		SetDSPEffectParams effects = [{Effect = POD2Reverb name = POD2Reverb_Rhythm PreRevPan = <line6_1_pan_scaled>}]
	endswitch
endscript

script musicstudio_init_pan 
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	musicstudio_update_pan instrument = <index>
	<index> = (<index> + 1)
	repeat <array_size>
endscript
