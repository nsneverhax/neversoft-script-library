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
0xb65332bc = null
band_stream_id = null
band_unique_id = null
crowd_stream_id = null
crowd_unique_id = null
song_paused = 0

script preload_song \{starttime = 0
		fadeintime = 0.0}

	change \{song_stream_id = null}
	change \{song_unique_id = null}
	change \{guitar_player1_stream_id = null}
	change \{guitar_player1_unique_id = null}
	change \{guitar_player2_stream_id = null}
	change \{guitar_player2_unique_id = null}
	change \{extra_stream_id = null}
	change \{extra_unique_id = null}
	change \{0xb65332bc = null}
	change \{band_stream_id = null}
	change \{band_unique_id = null}
	change \{crowd_stream_id = null}
	change \{crowd_unique_id = null}
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	if structurecontains structure = <song_struct> streamname
		song_prefix = (<song_struct>.streamname)
	endif
	if ($current_speedfactor = 1.0)
		0x6ff90bdb = <song_prefix>
		if ($game_mode = p2_career || $game_mode = p2_coop ||
				($game_mode = training && ($player1_status.part = rhythm)))
			if structurecontains structure = <song_struct> use_coop_notetracks
				formattext textname = 0x6ff90bdb '%s_coop' s = <song_prefix> addtostringlookup
			endif
		endif
		if NOT songloadfsb song_prefix = <0x6ff90bdb>
			downloadcontentlost
			return
		endif
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
		setsoundbussparams {band_balance = {vol = -1.5}} time = <fadeinttime>
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
	if ($game_mode = p2_career || $game_mode = p2_coop ||
			($game_mode = training && ($player1_status.part = rhythm)))
		if structurecontains structure = <song_struct> use_coop_notetracks
			formattext checksumname = song_stream '%s_coop_song' s = <song_prefix> addtostringlookup
			formattext checksumname = guitar_stream '%s_coop_guitar' s = <song_prefix> addtostringlookup
			formattext checksumname = rhythm_stream '%s_coop_rhythm' s = <song_prefix> addtostringlookup
		endif
	endif
	if ($current_speedfactor = 1.0)

		change song_stream_id = <song_stream>
		if preloadstream <song_stream> buss = master position = <starttime>
			change song_unique_id = <unique_id>
		else
			scriptassert 'Could not load song track for %s' s = <song_prefix>
		endif
	endif
	extra_stream = null
	if (<stream_config> = gh3)
		if ($current_speedfactor = 1.0)
		endif
		<extra_stream> = <rhythm_stream>
	endif
	if structurecontains structure = <song_struct> name = extra_stream
		formattext checksumname = extra_stream '%s_%t' s = <song_prefix> t = (<song_struct>.extra_stream) addtostringlookup
	endif
	if ($current_num_players = 1)
		change guitar_player1_stream_id = <guitar_stream>
		if ($current_speedfactor = 1.0)
			if (($player1_status.part) = rhythm && (<stream_config> != gh1))
				if NOT preloadstream <extra_stream> buss = master 0xa34b4b82 = true position = <starttime>
					scriptassert 'Could not load player1 bass track for %s' s = <song_prefix>
				endif
				change guitar_player1_unique_id = <unique_id>
				change 0xb65332bc = <unique_id>
				<extra_stream> = <guitar_stream>
			else
				if NOT preloadstream <guitar_stream> buss = master 0xa34b4b82 = true position = <starttime>
					scriptassert 'Could not load player1 guitar track for %s' s = <song_prefix>
				endif
				change guitar_player1_unique_id = <unique_id>
				change 0xb65332bc = <unique_id>
				<extra_stream> = <rhythm_stream>
			endif
		else
			if ($current_speedfactor >= 0.75)
				0xa038f783 = '125'
				0x22b8afbb = 125
			elseif ($current_speedfactor >= 0.6)
				0xa038f783 = '150'
				0x22b8afbb = 150
			else
				0xa038f783 = '200'
				0x22b8afbb = 200
			endif
			if (($player1_status.part) = rhythm && (<stream_config> != gh1))
				if NOT 0xa55a768d <extra_stream> buss = master stereo = false 0xa038f783 = <0xa038f783> 0x22b8afbb = <0x22b8afbb> 0x3dd98e8d = 11025 0xa34b4b82 = true position = <starttime> practice = true
					scriptassert 'Could not load player1 bass track for %s' s = <song_prefix>
				endif
				change guitar_player1_unique_id = <unique_id>
				<extra_stream> = <guitar_stream>
			else
				if NOT 0xa55a768d <guitar_stream> buss = master stereo = false 0xa038f783 = <0xa038f783> 0x22b8afbb = <0x22b8afbb> 0x3dd98e8d = 11025 0xa34b4b82 = true position = <starttime> practice = true
					scriptassert 'Could not load player1 guitar track for %s' s = <song_prefix>
				endif
				change guitar_player1_unique_id = <unique_id>
				<extra_stream> = <rhythm_stream>
			endif
		endif
		if ($current_speedfactor = 1.0)
			if NOT (<extra_stream> = null)
				change extra_stream_id = <extra_stream>
				if preloadstream <extra_stream> buss = master position = <starttime>
					change extra_unique_id = <unique_id>
				endif
			endif
		endif
	else
		if ((<stream_config> != gh1) && (($player1_status.part) != rhythm) && (($player2_status.part) != rhythm))
			change extra_stream_id = <extra_stream>
			preloadstream <extra_stream> buss = master position = <starttime>
			if (<unique_id> != 0)
				change extra_unique_id = <unique_id>
			endif
			preloadstream <guitar_stream> buss = master 0xa34b4b82 = true position = <starttime>
			change 0xb65332bc = <unique_id>
			change guitar_player1_stream_id = <guitar_stream>
			change guitar_player1_unique_id = <unique_id>
			change guitar_player2_stream_id = <guitar_stream>
			change guitar_player2_unique_id = <unique_id>
		else
			preloadstream <extra_stream> buss = master 0xa34b4b82 = true position = <starttime>
			if (<unique_id> = 0)
				scriptassert 'Could not load bass track for %s' s = <song_prefix>
			endif
			if (($player1_status.part) = rhythm)
				change guitar_player1_stream_id = <extra_stream>
				change guitar_player1_unique_id = <unique_id>
			else
				change guitar_player2_stream_id = <extra_stream>
				change guitar_player2_unique_id = <unique_id>
			endif
			preloadstream <guitar_stream> buss = master 0xa34b4b82 = true position = <starttime>
			if (<unique_id> = 0)
				scriptassert 'Could not load guitar track for %s' s = <song_prefix>
			endif
			change 0xb65332bc = <unique_id>
			if (($player1_status.part) = rhythm)
				change guitar_player2_stream_id = <guitar_stream>
				change guitar_player2_unique_id = <unique_id>
			else
				change guitar_player1_stream_id = <guitar_stream>
				change guitar_player1_unique_id = <unique_id>
			endif
		endif
	endif
	waitforpreload_song <...>
	change \{song_paused = 1}
	change \{structurename = player1_status
		last_guitar_volume = 100}
	change \{structurename = player2_status
		last_guitar_volume = 100}
	setlastguitarvolume \{player = 1
		last_guitar_volume = 100}
	setlastguitarvolume \{player = 2
		last_guitar_volume = 100}
	setseekposition_song position = <starttime>
	return adjustedtime = <adjustedtime>
endscript

script songunloadfsbifdownloaded 
	getcontentfolderindexfromfile ($song_fsb_name)
	if (<device> = content)
		unloadfsb \{fsb_index = $song_fsb_id}
		downloads_closecontentfolder content_index = <content_index>
		change \{song_fsb_id = -1}
		change \{song_fsb_name = 'none'}
	endif
endscript

script songunloadfsb 
	songunloadfsbifdownloaded
	end_song
endscript

script songloadfsb 
	formattext keep_case textname = filename '%n.fsb' n = <song_prefix>
	if NOT (isps2)
		if ($song_fsb_name = <filename>)
			return \{true}
		endif
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
		scriptassert 'could not load FSB for: %s' s = <song_prefix>
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
		repeat
	endif
endscript

script waitforseek_song 
	wait \{15
		gameframe}
	return
endscript
0xd24c2415 = 0

script setslomo_song 
	if ((<slomo> = 1.0) && ($0xd24c2415 = 1))
		0xe45f3263
		change \{0xd24c2415 = 0}
	endif
	if (<slomo> = 0.0)
		0x4e65c988
		change \{0xd24c2415 = 1}
	endif
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
	effect2 = $flange_default1
	effect3 = $chorus_default1
	effect4 = $echo_default1
	effect5 = $highpass_default1
	effect6 = $lowpass_default1
	effect7 = $eq_default1
}
player2effects = {
	effect = $pitchshifteffect2
	effect2 = $flange_default1
	effect3 = $chorus_default1
	effect4 = $echo_default1
	effect5 = $highpass_default1
	effect6 = $lowpass_default1
	effect7 = $eq_default1
}
pitchshifteffect1 = {
	effect = pitchshift
	name = guitar1pitchshift
	pitch = 1.0
	fftsize = 2048
	overlap = 4
	maxchannels = 0
}
pitchshifteffect2 = {
	effect = pitchshift
	name = guitar2pitchshift
	pitch = 1.0
	fftsize = 2048
	overlap = 4
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
	fftsize = 2048
}

script startpreloadpaused_song 
	both_players_lead = 0
	if (($player1_status.part) = ($player2_status.part))
		both_players_lead = 1
	endif
	if ($current_num_players = 1)
		if ($game_mode = training && $in_menu_choose_practice_section = 0)
			startpreloadedstream $guitar_player1_unique_id startpaused = 1 buss = first_player_lead_playback pitch = ($current_speedfactor * 100) $player1effects
		else
			startpreloadedstream $guitar_player1_unique_id startpaused = 1 buss = first_player_lead_playback pitch = ($current_speedfactor * 100) $player1effects
		endif
	else
		if (<both_players_lead> = 1)
			startpreloadedstream $guitar_player1_unique_id startpaused = 1 buss = first_player_lead_playback pitch = ($current_speedfactor * 100) $player1effects $player1pan voll = 100 volr = 0 0x2a3be6b4 = left
			startpreloadedstream $guitar_player2_unique_id startpaused = 1 buss = second_player_lead_playback pitch = ($current_speedfactor * 100) $player2effects $player2pan voll = 0 volr = 100 0x2a3be6b4 = right
		else
			startpreloadedstream $guitar_player1_unique_id startpaused = 1 buss = first_player_lead_playback pitch = ($current_speedfactor * 100) $player1effects
			startpreloadedstream $guitar_player2_unique_id startpaused = 1 buss = second_player_rhythm_playback pitch = ($current_speedfactor * 100) $player2effects
		endif
	endif
	startpreloadedstream $song_unique_id startpaused = 1 buss = band_playback pitch = ($current_speedfactor * 100)
	if NOT ($extra_stream_id = null)
		startpreloadedstream $extra_unique_id startpaused = 1 buss = single_player_rhythm_playback pitch = ($current_speedfactor * 100)
	endif
	if NOT ($crowd_unique_id = null)
		startpreloadedstream $crowd_unique_id startpaused = 1 buss = crowd_singalong pan1x = -1 pan1y = -0.5 pan2x = 1 pan2y = -0.5 pitch = ($current_speedfactor * 100)
	endif
endscript

script begin_song \{pause = 0}
	startpreloadpaused_song
	0x92996416
endscript

script setseekposition_song \{position = 0}
	if NOT ($song_unique_id = null)
		setsoundseekposition unique_id = $song_unique_id position = <position>
	endif
	if NOT ($guitar_player1_unique_id = null)
		if ($game_mode = training && $in_menu_choose_practice_section = 0)
			setsoundseekposition unique_id = $guitar_player1_unique_id position = (<position> + 64)
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
	pitch = 1.0
	volume = 100.0
	begin
	pitch = (<pitch> -0.004)
	volume = (<volume> -0.4)
	if NOT ($guitar_player1_unique_id = null)
		0x7c757af0 $guitar_player1_unique_id pitch = <pitch>
		setsoundparams unique_id = $guitar_player1_unique_id vol = <volume>
	endif
	if NOT ($song_unique_id = null)
		0x7c757af0 $song_unique_id pitch = <pitch>
		setsoundparams unique_id = $song_unique_id vol = <volume>
	endif
	wait \{1
		gameframe}
	repeat 180
	spawnscriptnow \{end_song
		params = {
			song_failed_pitch_streams = 0
		}}
endscript

script end_song \{song_failed_pitch_streams = 0}
	if ((isps2) && $current_speedfactor != 1.0)
		if NOT ($guitar_player1_unique_id = null)
			0xc7acd659 \{unique_id = $guitar_player1_unique_id}
		endif
	else
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
			if NOT ($song_unique_id = null)
				stopstream \{unique_id = $song_unique_id}
				change \{song_unique_id = null}
			endif
			if NOT ($guitar_player1_unique_id = null)
				stopstream \{unique_id = $guitar_player1_unique_id}
				change \{guitar_player1_unique_id = null}
			endif
		else

			spawnscriptnow \{failed_song_pitch_down}
		endif
	endif
	if NOT ($extra_unique_id = null)
		stopstream \{unique_id = $extra_unique_id}
		change \{extra_unique_id = null}
	endif
	if NOT ($crowd_unique_id = null)
		stopstream \{unique_id = $crowd_unique_id}
		change \{crowd_unique_id = null}
	endif
	if NOT ($guitar_player2_unique_id = null)
		stopstream \{unique_id = $guitar_player2_unique_id}
		change \{guitar_player2_unique_id = null}
	endif
	if NOT (<song_failed_pitch_streams> = 1)
		if NOT ($song_fsb_id = -1)
			unloadfsb \{fsb_index = $song_fsb_id}
			change \{song_fsb_id = -1}
			change \{song_fsb_name = 'none'}
		endif
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
endscript

script unpausegh3sounds 
	lockdsp
	if ($0xd24c2415 = 1)
		0x4e65c988
	endif
	if ($song_paused = 0)
		unpausesoundsbybuss \{master}
	else
		unpausesoundsbybuss \{ui}
		unpausesoundsbybuss \{crowd_one_shots}
		unpausesoundsbybuss \{crowd_one_shots_negative}
		unpausesoundsbybuss \{crowd_beds}
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

script 0x4e65c988 
	getplatform
	if (<platform> = ps2)
		if ($stream_config = gh1)
			0x774f034a \{$song_stream_id
				pause = 1}
			0x774f034a \{$0xd1a38704
				pause = 1}
			0x6dc26a59 \{$song_unique_id
				pause = 1}
			0x6dc26a59 \{$guitar_player1_unique_id
				pause = 1}
		else
			0x774f034a \{$band_stream_id
				pause = 1}
			0x774f034a \{$crowd_stream_id
				pause = 1}
			0x774f034a \{$guitar_player1_stream_id
				pause = 1}
			0x774f034a \{$guitar_player2_stream_id
				pause = 1}
			0x774f034a \{$extra_stream_id
				pause = 1}
			0x6dc26a59 \{$song_unique_id
				pause = 1}
			0x6dc26a59 \{$band_unique_id
				pause = 1}
			0x6dc26a59 \{$crowd_unique_id
				pause = 1}
			0x6dc26a59 \{$extra_unique_id
				pause = 1}
			0x6dc26a59 \{$guitar_player2_unique_id
				pause = 1}
			0x6dc26a59 \{$guitar_player1_unique_id
				pause = 1}
		endif
	endif
endscript

script 0xe45f3263 
	getplatform
	if (<platform> = ps2)
		if ($stream_config = gh1)
			0x774f034a \{$song_stream_id
				pause = 0}
			0x774f034a \{$0xd1a38704
				pause = 0}
			0x6dc26a59 \{$song_unique_id
				pause = 0}
			0x6dc26a59 \{$guitar_player1_unique_id
				pause = 0}
		else
			0x774f034a \{$band_stream_id
				pause = 0}
			0x774f034a \{$crowd_stream_id
				pause = 0}
			0x774f034a \{$guitar_player1_stream_id
				pause = 0}
			0x774f034a \{$guitar_player2_stream_id
				pause = 0}
			0x774f034a \{$extra_stream_id
				pause = 0}
			0x6dc26a59 \{$song_unique_id
				pause = 0}
			0x6dc26a59 \{$band_unique_id
				pause = 0}
			0x6dc26a59 \{$crowd_unique_id
				pause = 0}
			0x6dc26a59 \{$extra_unique_id
				pause = 0}
			0x6dc26a59 \{$guitar_player2_unique_id
				pause = 0}
			0x6dc26a59 \{$guitar_player1_unique_id
				pause = 0}
		endif
	endif
endscript
