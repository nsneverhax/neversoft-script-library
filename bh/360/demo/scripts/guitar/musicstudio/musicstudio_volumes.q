
script musicstudio_get_track_volume_info 
	if NOT gotparam \{jam_instrument}
		getplayerinfo <player> jam_instrument
	endif
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	return <...>
endscript

script musicstudio_update_volume 
	if NOT gotparam \{volume}
		musicstudio_get_track_volume_info <...>
		if NOT gotparam \{volume}
			return
		endif
	endif
	if musicstudio_mainobj :musicstudio_isplayingsongingame
		musicstudio_update_volume_check_playables <...>
		if gotparam \{player}
			<temp_volume> = <volume>
			musicstudio_get_track_volume_info <...>
			musicstudio_mainobj :musicstudio_calcingameplaybackvolumelevel player = <player> volume = <temp_volume> track_volume = <volume>
		endif
	endif
	musicstudio_update_track_volume instrument = <jam_instrument> volume = <volume>
	jam_update_line6_volumes
endscript

script musicstudio_update_track_volume 
	requireparams \{[
			instrument
			volume
		]
		all}
	jam_get_volume_from_volume_level volume = <volume>
	switch <instrument>
		case 0
		setsoundbussparams {jm_rhythm_line61 = {vol = (($default_bussset.jm_rhythm_line61.vol) - <volume>)}}
		setsoundbussparams {jm_rhythm_line62 = {vol = (($default_bussset.jm_rhythm_line62.vol) - <volume>)}}
		case 1
		setsoundbussparams {jm_lead_line61 = {vol = (($default_bussset.jm_lead_line61.vol) - <volume>)}}
		setsoundbussparams {jm_lead_line62 = {vol = (($default_bussset.jm_lead_line62.vol) - <volume>)}}
		case 2
		setsoundbussparams {jammode_bass = {vol = (($default_bussset.jammode_bass.vol) - <volume>)}}
		setsoundbussparams {jm_bass_line61 = {vol = (($default_bussset.jm_bass_line61.vol) - <volume>)}}
		setsoundbussparams {jm_bass_line62 = {vol = (($default_bussset.jm_bass_line62.vol) - <volume>)}}
		case 3
		setsoundbussparams {jammode_drums = {vol = (($default_bussset.jammode_drums.vol) - <volume>)}}
		setsoundbussparams {jm_drums_line61 = {vol = (($default_bussset.jm_drums_line61.vol) - <volume>)}}
		setsoundbussparams {jm_drums_line62 = {vol = (($default_bussset.jm_drums_line62.vol) - <volume>)}}
		case 4
		setsoundbussparams {jammode_vox = {vol = (($default_bussset.jammode_vox.vol) - <volume>)}}
		setsoundbussparams {jm_keys_line61 = {vol = (($default_bussset.jm_keys_line61.vol) - <volume>)}}
		setsoundbussparams {jm_keys_line62 = {vol = (($default_bussset.jm_keys_line62.vol) - <volume>)}}
	endswitch
endscript

script musicstudio_update_volume_check_playables 
	if NOT gotparam \{player}
		return
	endif
	getplayerinfo <player> part
	musicstudio_mainobj :musicstudio_getcurrplayables
	if (<part> = guitar)
		switch <musicstudio_curr_playable_guitar>
			case 0
			gettrackinfo track = ($jam_tracks [1].id)
			musicstudio_update_track_volume instrument = 1 volume = <volume>
			if (<musicstudio_curr_playable_guitar> > -1)
				<jam_instrument> = <musicstudio_curr_playable_guitar>
			endif
			case 1
			gettrackinfo track = ($jam_tracks [0].id)
			musicstudio_update_track_volume instrument = 0 volume = <volume>
			if (<musicstudio_curr_playable_guitar> > -1)
				<jam_instrument> = <musicstudio_curr_playable_guitar>
			endif
		endswitch
	endif
	if (<part> = bass)
		switch <musicstudio_curr_playable_bass>
			case 2
			gettrackinfo track = ($jam_tracks [4].id)
			musicstudio_update_track_volume instrument = 4 volume = <volume>
			if (<musicstudio_curr_playable_bass> > -1)
				<jam_instrument> = <musicstudio_curr_playable_bass>
			endif
			case 4
			gettrackinfo track = ($jam_tracks [2].id)
			musicstudio_update_track_volume instrument = 2 volume = <volume>
			if (<musicstudio_curr_playable_bass> > -1)
				<jam_instrument> = <musicstudio_curr_playable_bass>
			endif
		endswitch
	endif
	return jam_instrument = <jam_instrument>
endscript

script musicstudio_init_volumes 
	setsoundbussparams {guitar_jammode = {vol = ($default_bussset.guitar_jammode.vol)}}
	setsoundbussparams {user_drums = {vol = ($default_bussset.user_drums.vol)}}
	setsoundbussparams {drums_jammode = {vol = ($default_bussset.drums_jammode.vol)}}
	setsoundbussparams {jammode_drums_cymbals = {vol = ($default_bussset.jammode_drums_cymbals.vol)}}
	setsoundbussparams {jammode_drums_toms = {vol = ($default_bussset.jammode_drums_toms.vol)}}
	setsoundbussparams {jammode_drums_kick = {vol = ($default_bussset.jammode_drums_kick.vol)}}
	setsoundbussparams {jammode_drums_snare = {vol = ($default_bussset.jammode_drums_snare.vol)}}
	getarraysize \{$jam_tracks}
	index = 0
	begin
	if NOT gotparam \{no_tracks}
		gettrackinfo track = ($jam_tracks [<index>].id)
	else
		volume = 8
	endif
	musicstudio_update_track_volume instrument = <index> volume = <volume>
	<index> = (<index> + 1)
	repeat <array_size>
	jam_update_line6_volumes
endscript

script jam_update_line6_volumes 
	getsonginfo
	jam_get_volume_from_volume_level volume = <line6_0_volume>
	setsoundbussparams {line61_jammode = {vol = (($default_bussset.line61_jammode.vol) - <volume>)}}
	jam_get_volume_from_volume_level volume = <line6_1_volume>
	setsoundbussparams {line62_jammode = {vol = (($default_bussset.line62_jammode.vol) - <volume>)}}
endscript

script jam_debug_volumes 
	getarraysize \{$jam_tracks}
	index = 0
	begin
	gettrackinfo track = ($jam_tracks [<index>].id)
	printf qs(0xdefac614) s = ($jam_tracks [<index>].name_text) a = <volume>
	<index> = (<index> + 1)
	repeat (<array_size> - 1)
	getsonginfo
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
		if gotparam \{off}
			single_stream_response_script playerindex = <player> onoff = false unnecessarynote = <unnecessarynote>
		else
			single_stream_response_script playerindex = <player> onoff = true unnecessarynote = <unnecessarynote>
		endif
		return
	endif
	musicstudio_swap_playback_tracks player = <player>
	getplayerinfo <player> part
	if (<part> = guitar)
		inst = <playback_track1>
	elseif (<part> = bass)
		inst = <playback_track2>
	else
		return
	endif
	if gotparam \{off}
		musicstudio_update_volume volume = 0 jam_instrument = <inst> player = <player>
	else
		musicstudio_update_volume jam_instrument = <inst> player = <player>
	endif
endscript

script musicstudio_update_pan 
	if NOT gotparam \{instrument}
		musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
		<player_object> :musicstudioplayer_getinstrument
	endif
	getsonginfo
	musicstudio_mixer_pan_get_active instrument = <instrument>
	if (<active> = 1)
		line6_0_pan_scaled = (<line6_0_pan> / 5.0)
		line6_1_pan_scaled = (<line6_1_pan> / 5.0)
	else
		line6_0_pan_scaled = 0
		line6_1_pan_scaled = 0
	endif
	musicstudio_mainobj :musicstudio_gettrackeffectindex track = ($jam_tracks [<instrument>].id)
	switch <effect_type_index>
		case 0
		setdspeffectparams effects = [{effect = pod2reverb name = pod2reverb_lead prerevpan = <line6_0_pan_scaled>}]
		case 1
		setdspeffectparams effects = [{effect = pod2reverb name = pod2reverb_rhythm prerevpan = <line6_1_pan_scaled>}]
	endswitch
endscript

script musicstudio_init_pan 
	getarraysize \{$jam_tracks}
	index = 0
	begin
	musicstudio_update_pan instrument = <index>
	<index> = (<index> + 1)
	repeat <array_size>
endscript
