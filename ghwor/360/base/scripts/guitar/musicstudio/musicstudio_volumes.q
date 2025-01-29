
script musicstudio_get_track_volume_info 
	if NOT GotParam \{jam_instrument}
		getplayerinfo <Player> jam_instrument
	endif
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	return <...>
endscript

script musicstudio_update_volume 
	if NOT GotParam \{Volume}
		musicstudio_get_track_volume_info <...>
		if NOT GotParam \{Volume}
			return
		endif
	endif
	if musicstudio_mainobj :musicstudio_isplayingsongingame
		musicstudio_update_volume_check_playables <...>
		if GotParam \{Player}
			<temp_volume> = <Volume>
			musicstudio_get_track_volume_info <...>
			musicstudio_mainobj :musicstudio_calcingameplaybackvolumelevel Player = <Player> Volume = <temp_volume> track_volume = <Volume>
		endif
	endif
	musicstudio_update_track_volume instrument = <jam_instrument> Volume = <Volume>
	jam_update_line6_volumes
endscript

script musicstudio_update_track_volume 
	RequireParams \{[
			instrument
			Volume
		]
		all}
	jam_get_volume_from_volume_level Volume = <Volume>
	switch <instrument>
		case 0
		setsoundbussparams {jm_rhythm_line61 = {vol = (($default_BussSet.jm_rhythm_line61.vol) - <Volume>)}}
		setsoundbussparams {jm_rhythm_line62 = {vol = (($default_BussSet.jm_rhythm_line62.vol) - <Volume>)}}
		case 1
		setsoundbussparams {jm_lead_line61 = {vol = (($default_BussSet.jm_lead_line61.vol) - <Volume>)}}
		setsoundbussparams {jm_lead_line62 = {vol = (($default_BussSet.jm_lead_line62.vol) - <Volume>)}}
		case 2
		setsoundbussparams {jammode_bass = {vol = (($default_BussSet.jammode_bass.vol) - <Volume>)}}
		setsoundbussparams {jm_bass_line61 = {vol = (($default_BussSet.jm_bass_line61.vol) - <Volume>)}}
		setsoundbussparams {jm_bass_line62 = {vol = (($default_BussSet.jm_bass_line62.vol) - <Volume>)}}
		case 3
		setsoundbussparams {jammode_drums = {vol = (($default_BussSet.jammode_drums.vol) - <Volume>)}}
		setsoundbussparams {jm_drums_line61 = {vol = (($default_BussSet.jm_drums_line61.vol) - <Volume>)}}
		setsoundbussparams {jm_drums_line62 = {vol = (($default_BussSet.jm_drums_line62.vol) - <Volume>)}}
		case 4
		setsoundbussparams {jammode_vox = {vol = (($default_BussSet.jammode_vox.vol) - <Volume>)}}
		setsoundbussparams {jm_keys_line61 = {vol = (($default_BussSet.jm_keys_line61.vol) - <Volume>)}}
		setsoundbussparams {jm_keys_line62 = {vol = (($default_BussSet.jm_keys_line62.vol) - <Volume>)}}
	endswitch
endscript

script musicstudio_update_volume_check_playables 
	if NOT GotParam \{Player}
		return
	endif
	getplayerinfo <Player> part
	musicstudio_mainobj :musicstudio_getcurrplayables
	if (<part> = guitar)
		switch <musicstudio_curr_playable_guitar>
			case 0
			gettrackinfo track = ($jam_tracks [1].id)
			musicstudio_update_track_volume instrument = 1 Volume = <Volume>
			if (<musicstudio_curr_playable_guitar> > -1)
				<jam_instrument> = <musicstudio_curr_playable_guitar>
			endif
			case 1
			gettrackinfo track = ($jam_tracks [0].id)
			musicstudio_update_track_volume instrument = 0 Volume = <Volume>
			if (<musicstudio_curr_playable_guitar> > -1)
				<jam_instrument> = <musicstudio_curr_playable_guitar>
			endif
		endswitch
	endif
	if (<part> = bass)
		switch <musicstudio_curr_playable_bass>
			case 2
			gettrackinfo track = ($jam_tracks [4].id)
			musicstudio_update_track_volume instrument = 4 Volume = <Volume>
			if (<musicstudio_curr_playable_bass> > -1)
				<jam_instrument> = <musicstudio_curr_playable_bass>
			endif
			case 4
			gettrackinfo track = ($jam_tracks [2].id)
			musicstudio_update_track_volume instrument = 2 Volume = <Volume>
			if (<musicstudio_curr_playable_bass> > -1)
				<jam_instrument> = <musicstudio_curr_playable_bass>
			endif
		endswitch
	endif
	return jam_instrument = <jam_instrument>
endscript

script musicstudio_init_volumes 
	setsoundbussparams {guitar_jammode = {vol = ($default_BussSet.guitar_jammode.vol)}}
	setsoundbussparams {user_drums = {vol = ($default_BussSet.user_drums.vol)}}
	setsoundbussparams {drums_jammode = {vol = ($default_BussSet.drums_jammode.vol)}}
	setsoundbussparams {jammode_drums_cymbals = {vol = ($default_BussSet.jammode_drums_cymbals.vol)}}
	setsoundbussparams {jammode_drums_toms = {vol = ($default_BussSet.jammode_drums_toms.vol)}}
	setsoundbussparams {jammode_drums_kick = {vol = ($default_BussSet.jammode_drums_kick.vol)}}
	setsoundbussparams {jammode_drums_snare = {vol = ($default_BussSet.jammode_drums_snare.vol)}}
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	if NOT GotParam \{no_tracks}
		gettrackinfo track = ($jam_tracks [<index>].id)
	else
		Volume = 8
	endif
	musicstudio_update_track_volume instrument = <index> Volume = <Volume>
	<index> = (<index> + 1)
	repeat <array_Size>
	jam_update_line6_volumes
endscript

script jam_update_line6_volumes 
	getsonginfo
	jam_get_volume_from_volume_level Volume = <line6_0_volume>
	setsoundbussparams {line61_jammode = {vol = (($default_BussSet.line61_jammode.vol) - <Volume>)}}
	jam_get_volume_from_volume_level Volume = <line6_1_volume>
	setsoundbussparams {line62_jammode = {vol = (($default_BussSet.line62_jammode.vol) - <Volume>)}}
endscript

script jam_debug_volumes 
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	gettrackinfo track = ($jam_tracks [<index>].id)
	printf qs(0xdefac614) s = ($jam_tracks [<index>].name_text) a = <Volume>
	<index> = (<index> + 1)
	repeat (<array_Size> - 1)
	getsonginfo
	printf qs(0x30d5ad50) a = <line6_0_volume>
	printf qs(0x68cb0478) a = <line6_1_volume>
endscript

script jam_get_volume_from_volume_level 
	new_vol = ((10 - <Volume>) * 2)
	if (<Volume> = 0)
		<new_vol> = 100
	endif
	return Volume = <new_vol>
endscript

script musicstudio_update_volume_for_playback \{unnecessarynote = 0}
	if NOT ($current_song_qpak = jamsession)
		return
	endif
	musicstudio_swap_playback_tracks Player = <Player>
	getplayerinfo <Player> part
	if (<part> = guitar)
		inst = <playback_track1>
	elseif (<part> = bass)
		inst = <playback_track2>
	else
		return
	endif
	if GotParam \{OFF}
		musicstudio_update_volume Volume = 0 jam_instrument = <inst> Player = <Player>
	else
		musicstudio_update_volume jam_instrument = <inst> Player = <Player>
	endif
endscript

script musicstudio_update_pan 
	if NOT GotParam \{instrument}
		musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
		<player_object> :musicstudioplayer_getinstrument
	endif
	getsonginfo
	musicstudio_mixer_pan_get_active instrument = <instrument>
	if (<Active> = 1)
		line6_0_pan_scaled = (<line6_0_pan> / 5.0)
		line6_1_pan_scaled = (<line6_1_pan> / 5.0)
	else
		line6_0_pan_scaled = 0
		line6_1_pan_scaled = 0
	endif
	musicstudio_mainobj :musicstudio_gettrackeffectindex track = ($jam_tracks [<instrument>].id)
	switch <effect_type_index>
		case 0
		setdspeffectparams effects = [{effect = pod2reverb Name = pod2reverb_lead prerevpan = <line6_0_pan_scaled>}]
		case 1
		setdspeffectparams effects = [{effect = pod2reverb Name = pod2reverb_rhythm prerevpan = <line6_1_pan_scaled>}]
	endswitch
endscript

script musicstudio_init_pan 
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	musicstudio_update_pan instrument = <index>
	<index> = (<index> + 1)
	repeat <array_Size>
endscript
