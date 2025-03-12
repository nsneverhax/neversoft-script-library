stream_config = gh1
song_fsb_id = -1
song_fsb_name = 'none'
song_stream_id = null
song_unique_id = null
guitar_player1_stream_id = null
guitar_player1_unique_id = null
guitar_player2_stream_id = null
guitar_player2_unique_id = null
extra_stream_id = null
extra_unique_id = null
band_stream_id = null
band_unique_id = null
crowd_stream_id = null
crowd_unique_id = null
song_paused = 0

script preload_song \{starttime = 0
		fadeintime = 0.0}
	printf "song %s" s = <song_name>
	change \{song_stream_id = null}
	change \{song_unique_id = null}
	change \{guitar_player1_stream_id = null}
	change \{guitar_player1_unique_id = null}
	change \{guitar_player2_stream_id = null}
	change \{guitar_player2_unique_id = null}
	change \{extra_stream_id = null}
	change \{extra_unique_id = null}
	change \{band_stream_id = null}
	change \{band_unique_id = null}
	change \{crowd_stream_id = null}
	change \{crowd_unique_id = null}
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	if structurecontains structure = <song_struct> streamname
		song_prefix = (<song_struct>.streamname)
	endif
	if NOT songloadfsb song_prefix = <song_prefix>
		downloadcontentlost
		return
	endif
	stream_config = gh1
	get_song_struct song = <song_name>
	if structurecontains structure = <song_struct> name = version
		stream_config = (<song_struct>.version)
	endif
	soundbussunlock \{band_balance}
	soundbussunlock \{guitar_balance}
	if structurecontains structure = <song_struct> name = band_playback_volume
		setsoundbussparams {band_balance = {vol = ((<song_struct>.band_playback_volume) - 1.5)}} time = <fadeintime>
	else
		setsoundbussparams {band_balance = {vol = -1.5}} time = <fadeintime>
	endif
	if structurecontains structure = <song_struct> name = guitar_playback_volume
		setsoundbussparams {guitar_balance = {vol = ((<song_struct>.guitar_playback_volume) - 1.5)}} time = <fadeintime>
	else
		setsoundbussparams {guitar_balance = {vol = -1.5}} time = <fadeintime>
	endif
	soundbusslock \{band_balance}
	soundbusslock \{guitar_balance}
	change stream_config = <stream_config>
	formattext checksumname = song_stream '%s_song' s = <song_prefix> addtostringlookup
	formattext checksumname = guitar_stream '%s_guitar' s = <song_prefix> addtostringlookup
	formattext checksumname = rhythm_stream '%s_rhythm' s = <song_prefix> addtostringlookup
	formattext checksumname = crowd_stream '%s_crowd' s = <song_prefix> addtostringlookup
	if ($game_mode = p2_coop || $game_mode = p2_quickplay ||
			($game_mode = training && ($player1_status.part = rhythm)))
		if structurecontains structure = <song_struct> use_coop_notetracks
			formattext checksumname = song_stream '%s_coop_song' s = <song_prefix> addtostringlookup
			formattext checksumname = guitar_stream '%s_coop_guitar' s = <song_prefix> addtostringlookup
			formattext checksumname = rhythm_stream '%s_coop_rhythm' s = <song_prefix> addtostringlookup
		endif
	endif
	change song_stream_id = <song_stream>
	if preloadstream <song_stream> buss = master
		change song_unique_id = <unique_id>
	else
		scriptassert "Could not load song track for %s" s = <song_prefix>
	endif
	extra_stream = null
	if (<stream_config> = gh3)
		change crowd_stream_id = <crowd_stream>
		if preloadstream <crowd_stream> buss = master
			change crowd_unique_id = <unique_id>
		endif
		<extra_stream> = <rhythm_stream>
	endif
	if structurecontains structure = <song_struct> name = extra_stream
		formattext checksumname = extra_stream '%s_%t' s = <song_prefix> t = (<song_struct>.extra_stream) addtostringlookup
	endif
	if ($current_num_players = 1)
		if (($player1_status.part) = rhythm && (<stream_config> != gh1))
			if NOT preloadstream <extra_stream> buss = master
				scriptassert "Could not load player1 guitar track for %s" s = <song_prefix>
			endif
			change guitar_player1_unique_id = <unique_id>
			<extra_stream> = <guitar_stream>
		else
			if NOT preloadstream <guitar_stream> buss = master
				scriptassert "Could not load player1 guitar track for %s" s = <song_prefix>
			endif
			change guitar_player1_unique_id = <unique_id>
			<extra_stream> = <rhythm_stream>
		endif
		if NOT (<extra_stream> = null)
			change extra_stream_id = <extra_stream>
			if preloadstream <extra_stream> buss = master
				change extra_unique_id = <unique_id>
			endif
		endif
	else
		if (($player1_status.part) = rhythm && (<stream_config> != gh1))
			change guitar_player1_stream_id = <extra_stream>
			if NOT preloadstream <extra_stream> buss = master
				scriptassert "Could not load player1 guitar track for %s" s = <song_prefix>
			endif
		else
			change guitar_player1_stream_id = <guitar_stream>
			if NOT preloadstream <guitar_stream> buss = master
				scriptassert "Could not load player1 guitar track for %s" s = <song_prefix>
			endif
		endif
		change guitar_player1_unique_id = <unique_id>
		if (($player2_status.part) = rhythm && (<stream_config> != gh1))
			change guitar_player2_stream_id = <extra_stream>
			if NOT preloadstream <extra_stream> buss = master
				scriptassert "Could not load player2 guitar track for %s" s = <song_prefix>
			endif
		else
			change guitar_player2_stream_id = <guitar_stream>
			if NOT preloadstream <guitar_stream> buss = master
				scriptassert "Could not load player2 guitar track for %s" s = <song_prefix>
			endif
		endif
		change guitar_player2_unique_id = <unique_id>
		if (<stream_config> != gh1)
			if NOT ((($player1_status.part) = rhythm) || (($player2_status.part) = rhythm))
				change extra_stream_id = <extra_stream>
				if preloadstream <extra_stream> buss = master
					change extra_unique_id = <unique_id>
				endif
			endif
		endif
	endif
	waitforpreload_song <...>
	change \{song_paused = 1}
	setlastguitarvolume \{player = 1
		last_guitar_volume = 100}
	setlastguitarvolume \{player = 2
		last_guitar_volume = 100}
	startpreloadpaused_song
	setseekposition_song position = <starttime>
endscript

script songunloadfsbifdownloaded 
	getcontentfolderindexfromfile ($song_fsb_name)
	if NOT ($song_fsb_id = -1)
		if (<device> = content)
			unloadfsb \{fsb_index = $song_fsb_id}
			spawnscriptnow downloads_closecontentfolder params = {content_index = <content_index>}
			change \{song_fsb_id = -1}
			change \{song_fsb_name = 'none'}
		endif
	endif
endscript

script songunloadfsb 
	songunloadfsbifdownloaded
	if NOT ($song_fsb_id = -1)
		unloadfsb \{fsb_index = $song_fsb_id}
		change \{song_fsb_id = -1}
		change \{song_fsb_name = 'none'}
	endif
endscript

script songloadfsb 
	formattext keep_case textname = filename '%n.fsb' n = <song_prefix>
	if ($song_fsb_name = <filename>)
		return \{true}
	endif
	songunloadfsb
	formattext keep_case textname = fsbfilename '%n' n = <song_prefix>
	getcontentfolderindexfromfile <filename>
	if (<device> = content)
		if NOT downloads_opencontentfolder content_index = <content_index>
			return \{false}
		endif
	else
		formattext keep_case textname = fsbfilename 'music/%n' n = <song_prefix>
	endif
	if NOT loadfsb filename = <fsbfilename> numstreams = 5 encryptionkey = '5atu6w4zaw' device = <device>
		return \{false}
	endif
	if (<fsb_index> = -1)
		change \{song_fsb_id = -1}
		change \{song_fsb_name = 'none'}
		scriptassert "could not load FSB for: %s" s = <song_prefix>
	else
		change song_fsb_id = <fsb_index>
		change song_fsb_name = <filename>
	endif
	return \{true}
endscript

script waitforpreload_song 
	waitforpreload_stream \{stream = extra_unique_id}
	waitforpreload_stream \{stream = song_unique_id}
	waitforpreload_stream \{stream = crowd_unique_id}
	waitforpreload_stream \{stream = guitar_player1_unique_id}
	waitforpreload_stream \{stream = guitar_player2_unique_id}
endscript

script waitforpreload_stream \{stream = none}
	if NOT ($<stream> = null)
		begin
		if preloadstreamdone $<stream>
			break
		endif
		wait \{1
			gameframe}
		printf "Waiting for preload %s" s = <stream>
		repeat
	endif
endscript

script waitforseek_song 
	wait \{15
		gameframe}
	return
endscript

script setslomo_song 
	if NOT ($song_unique_id = null)
		setsoundparams unique_id = $song_unique_id pitch = (<slomo> * 100)
	endif
	if NOT ($guitar_player1_unique_id = null)
		setsoundparams unique_id = $guitar_player1_unique_id pitch = (<slomo> * 100)
	endif
	if NOT ($extra_unique_id = null)
		setsoundparams unique_id = $extra_unique_id pitch = (<slomo> * 100)
	endif
	if NOT ($crowd_unique_id = null)
		setsoundparams unique_id = $crowd_unique_id pitch = (<slomo> * 100)
	endif
	if NOT ($guitar_player2_unique_id = null)
		setsoundparams unique_id = $guitar_player2_unique_id pitch = (<slomo> * 100)
	endif
endscript
player1effects = {
	effect = $pitchshifteffect1
}
player2effects = {
	effect = $pitchshifteffect2
}
pitchshifteffect1 = {
	effect = fastpitchshift
	name = guitar1pitchshift
	pitch = 1.0
	maxchannels = 0
}
pitchshifteffect2 = {
	effect = fastpitchshift
	name = guitar2pitchshift
	pitch = 1.0
	maxchannels = 0
}
player1practiceeffects = {
	effect = $pitchshiftslow1
	effect2 = $pitchshifteffect1
}
pitchshiftslow1 = {
	effect = pitchshift
	name = slowguitar1pitchshift
	pitch = 1.0
	maxchannels = 2
	fftsize = 4096
}

script startpreloadpaused_song 
	both_players_lead = 0
	if (($player1_status.part) = ($player2_status.part))
		both_players_lead = 1
	endif
	if ($current_num_players = 1)
		if ($game_mode = training && $in_menu_choose_practice_section = 0)
			startpreloadedstream $guitar_player1_unique_id startpaused = 1 buss = first_player_lead_playback pitch = ($current_speedfactor * 100) $player1practiceeffects
			if ($game_mode != training || $current_speedfactor = 1.0)
				startpreloadedstream $song_unique_id startpaused = 1 buss = band_playback pitch = ($current_speedfactor * 100)
			endif
			if ($game_mode != training || $current_speedfactor = 1.0)
				if NOT ($extra_stream_id = null)
					startpreloadedstream $extra_unique_id startpaused = 1 buss = single_player_rhythm_playback pitch = ($current_speedfactor * 100)
				endif
			endif
			if ($game_mode != training)
				if NOT ($crowd_unique_id = null)
					startpreloadedstream $crowd_unique_id startpaused = 1 buss = crowd_singalong pan1x = -1 pan1y = -0.5 pan2x = 1 pan2y = -0.5 pitch = ($current_speedfactor * 100)
				endif
			endif
		elseif ($game_mode = training)
			startpreloadedstream $guitar_player1_unique_id vol = 40 startpaused = 1 buss = first_player_lead_playback pitch = ($current_speedfactor * 100) $player1effects
			if ($game_mode != training || $current_speedfactor = 1.0)
				startpreloadedstream $song_unique_id vol = 40 startpaused = 1 buss = band_playback pitch = ($current_speedfactor * 100)
			endif
			if ($game_mode != training || $current_speedfactor = 1.0)
				if NOT ($extra_stream_id = null)
					startpreloadedstream $extra_unique_id vol = 40 startpaused = 1 buss = single_player_rhythm_playback pitch = ($current_speedfactor * 100)
				endif
			endif
			if ($game_mode != training)
				if NOT ($crowd_unique_id = null)
					startpreloadedstream $crowd_unique_id vol = 40 startpaused = 1 buss = crowd_singalong pan1x = -1 pan1y = -0.5 pan2x = 1 pan2y = -0.5 pitch = ($current_speedfactor * 100)
				endif
			endif
		else
			startpreloadedstream $guitar_player1_unique_id startpaused = 1 buss = first_player_lead_playback pitch = ($current_speedfactor * 100) $player1effects
			if ($game_mode != training || $current_speedfactor = 1.0)
				startpreloadedstream $song_unique_id startpaused = 1 buss = band_playback pitch = ($current_speedfactor * 100)
			endif
			if ($game_mode != training || $current_speedfactor = 1.0)
				if NOT ($extra_stream_id = null)
					startpreloadedstream $extra_unique_id startpaused = 1 buss = single_player_rhythm_playback pitch = ($current_speedfactor * 100)
				endif
			endif
			if ($game_mode != training)
				if NOT ($crowd_unique_id = null)
					startpreloadedstream $crowd_unique_id startpaused = 1 buss = crowd_singalong pan1x = -1 pan1y = -0.5 pan2x = 1 pan2y = -0.5 pitch = ($current_speedfactor * 100)
				endif
			endif
		endif
	else
		if (<both_players_lead> = 1)
			startpreloadedstream $guitar_player1_unique_id startpaused = 1 buss = first_player_lead_playback pitch = ($current_speedfactor * 100) $player1effects $player1pan voll = 100 volr = 0
			startpreloadedstream $guitar_player2_unique_id startpaused = 1 buss = second_player_lead_playback pitch = ($current_speedfactor * 100) $player2effects $player2pan voll = 0 volr = 100
			if ($game_mode != training || $current_speedfactor = 1.0)
				startpreloadedstream $song_unique_id startpaused = 1 buss = band_playback pitch = ($current_speedfactor * 100)
			endif
			if ($game_mode != training || $current_speedfactor = 1.0)
				if NOT ($extra_stream_id = null)
					startpreloadedstream $extra_unique_id startpaused = 1 buss = single_player_rhythm_playback pitch = ($current_speedfactor * 100)
				endif
			endif
			if ($game_mode != training)
				if NOT ($crowd_unique_id = null)
					startpreloadedstream $crowd_unique_id startpaused = 1 buss = crowd_singalong pan1x = -1 pan1y = -0.5 pan2x = 1 pan2y = -0.5 pitch = ($current_speedfactor * 100)
				endif
			endif
		else
			startpreloadedstream $guitar_player1_unique_id startpaused = 1 buss = first_player_lead_playback pitch = ($current_speedfactor * 100) $player1effects
			startpreloadedstream $guitar_player2_unique_id startpaused = 1 buss = second_player_rhythm_playback pitch = ($current_speedfactor * 100) $player2effects
			if ($game_mode != training || $current_speedfactor = 1.0)
				startpreloadedstream $song_unique_id startpaused = 1 buss = band_playback pitch = ($current_speedfactor * 100)
			endif
			if ($game_mode != training || $current_speedfactor = 1.0)
				if NOT ($extra_stream_id = null)
					startpreloadedstream $extra_unique_id startpaused = 1 buss = single_player_rhythm_playback pitch = ($current_speedfactor * 100)
				endif
			endif
			if ($game_mode != training)
				if NOT ($crowd_unique_id = null)
					startpreloadedstream $crowd_unique_id startpaused = 1 buss = crowd_singalong pan1x = -1 pan1y = -0.5 pan2x = 1 pan2y = -0.5 pitch = ($current_speedfactor * 100)
				endif
			endif
		endif
	endif
endscript

script begin_song \{pause = 0}
	lockdsp
	pausesound unique_id = $song_unique_id pause = <pause>
	pausesound unique_id = $guitar_player1_unique_id pause = <pause>
	if NOT ($extra_stream_id = null)
		pausesound unique_id = $extra_unique_id pause = <pause>
	endif
	if NOT ($crowd_stream_id = null)
		pausesound unique_id = $crowd_unique_id pause = <pause>
	endif
	if NOT ($guitar_player2_stream_id = null)
		pausesound unique_id = $guitar_player2_unique_id pause = <pause>
	endif
	unlockdsp
	change \{song_paused = 0}
endscript

script setseekposition_song \{position = 0}
	if NOT ($song_unique_id = null)
		setsoundseekposition unique_id = $song_unique_id position = <position>
	endif
	if NOT ($guitar_player1_unique_id = null)
		if ($game_mode = training && $in_menu_choose_practice_section = 0)
			setsoundseekposition unique_id = $guitar_player1_unique_id position = (<position> - ($default_practice_mode_pitchshift_offset_song))
		else
			setsoundseekposition unique_id = $guitar_player1_unique_id position = <position>
		endif
	endif
	if NOT ($extra_unique_id = null)
		setsoundseekposition unique_id = $extra_unique_id position = <position>
	endif
	if NOT ($crowd_unique_id = null)
		setsoundseekposition unique_id = $crowd_unique_id position = <position>
	endif
	if NOT ($guitar_player2_unique_id = null)
		setsoundseekposition unique_id = $guitar_player2_unique_id position = <position>
	endif
endscript
waiting_for_pitching = 0

script failed_song_pitch_down 
	soundbussunlock \{guitar_balance}
	soundbussunlock \{band_balance}
	setsoundbussparams \{band_balance = {
			vol = -20
			pitch = -8
		}
		time = 3}
	setsoundbussparams \{guitar_balance = {
			vol = -20
			pitch = -8
		}
		time = 3}
	change \{waiting_for_pitching = 1}
	soundbusslock \{band_balance}
	soundbusslock \{guitar_balance}
	wait \{3
		seconds}
	spawnscriptnow \{end_song}
endscript

script end_song \{song_failed_pitch_streams = 0}
	if NOT (<song_failed_pitch_streams> = 1)
		killspawnedscript \{name = failed_song_pitch_down}
		if ($waiting_for_pitching = 1)
			change \{waiting_for_pitching = 0}
			soundbussunlock \{guitar_balance}
			soundbussunlock \{band_balance}
			setsoundbussparams {band_balance = {vol = (($default_bussset.band_balance.vol) - 2.5) pitch = ($default_bussset.band_balance.pitch)}}
			setsoundbussparams {guitar_balance = {vol = (($default_bussset.guitar_balance.vol) - 2.5) pitch = ($default_bussset.guitar_balance.pitch)}}
			soundbusslock \{band_balance}
			soundbusslock \{guitar_balance}
		endif
		stopstream \{unique_id = $song_unique_id}
		stopstream \{unique_id = $guitar_player1_unique_id}
	else
		printf \{channel = sfx
			"We are pitching the stream down because we failed"}
		spawnscriptnow \{failed_song_pitch_down}
	endif
	if NOT ($extra_unique_id = null)
		stopstream \{unique_id = $extra_unique_id}
	endif
	if NOT ($crowd_unique_id = null)
		stopstream \{unique_id = $crowd_unique_id}
	endif
	if NOT ($guitar_player2_unique_id = null)
		stopstream \{unique_id = $guitar_player2_unique_id}
	endif
	change \{song_paused = 0}
endscript
p1_whammy_control = 0.0

script set_whammy_pitchshift 
	if ($<player_status>.player = 1)
		setsoundbusseffects effect = {effect = pitchshift name = guitar1pitchshift pitch = (1 - (<control> * 0.057))}
		change p1_whammy_control = <control>
	else
		setsoundbusseffects effect = {effect = pitchshift name = guitar2pitchshift pitch = (1 - (<control> * 0.057))}
	endif
endscript

script pausegh3sounds 
	lockdsp
	pausesoundsbybuss \{master}
	unlockdsp
	if NOT gotparam \{no_seek}
		getsongtimems
		casttointeger \{time}
		if (<time> > $current_starttime)
			if NOT gotparam \{seek_on_unpause}
				setseekposition_song position = <time>
			endif
		endif
	endif
endscript

script unpausegh3sounds 
	if gotparam \{seek_on_unpause}
		getsongtimems
		casttointeger \{time}
		if (<time> > $current_starttime)
			setseekposition_song position = <time>
		endif
	endif
	lockdsp
	if ($song_paused = 0)
		unpausesoundsbybuss \{master}
	else
		unpausesoundsbybuss \{ui}
		unpausesoundsbybuss \{crowd_one_shots}
		unpausesoundsbybuss \{crowd_one_shots_negative}
		unpausesoundsbybuss \{crowd_beds}
		unpausesoundsbybuss \{crowd_presong_intro}
		unpausesoundsbybuss \{crowd_cheers}
		unpausesoundsbybuss \{crowd_boos}
		unpausesoundsbybuss \{crowd_nuetral}
		unpausesoundsbybuss \{`default`}
		unpausesoundsbybuss \{test_tones}
		unpausesoundsbybuss \{practice_band_playback}
		unpausesoundsbybuss \{test_tones_dsp}
		unpausesoundsbybuss \{right_notes_player2}
		unpausesoundsbybuss \{wrong_notes_player1}
		unpausesoundsbybuss \{wrong_notes_player2}
		unpausesoundsbybuss \{user_vocal}
		unpausesoundsbybuss \{user_music}
		unpausesoundsbybuss \{encore_events}
		unpausesoundsbybuss \{binkcutscenes}
	endif
	unlockdsp
endscript
