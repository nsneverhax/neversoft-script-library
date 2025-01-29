stream_config = gh1
0x25bb39f3 = 0
song_fsb_id = -1
song_fsb_name = 'none'
song_stream_id = NULL
song_unique_id = NULL
guitar_player1_stream_id = NULL
guitar_player1_unique_id = NULL
guitar_player2_stream_id = NULL
guitar_player2_unique_id = NULL
extra_stream_id = NULL
extra_unique_id = NULL
0xb65332bc = NULL
0xf7be67eb = 0
band_stream_id = NULL
band_unique_id = NULL
crowd_stream_id = NULL
crowd_unique_id = NULL
0xd5ab88b5 = NULL
song_paused = 0

script preload_song \{starttime = 0
		fadeintime = 0.0
		0x480dcccb = 0}


	Change \{0xf7be67eb = 0}
	if (<0x480dcccb> = 1)
		0x3370db4f = true
	else
		0x3370db4f = FALSE
	endif
	Change \{0x25bb39f3 = 0}
	Change \{song_stream_id = NULL}
	Change \{song_unique_id = NULL}
	Change \{guitar_player1_stream_id = NULL}
	Change \{guitar_player1_unique_id = NULL}
	Change \{guitar_player2_stream_id = NULL}
	Change \{guitar_player2_unique_id = NULL}
	Change \{extra_stream_id = NULL}
	Change \{extra_unique_id = NULL}
	Change \{0xb65332bc = NULL}
	Change \{band_stream_id = NULL}
	Change \{band_unique_id = NULL}
	Change \{crowd_stream_id = NULL}
	Change \{crowd_unique_id = NULL}
	Change \{0xd5ab88b5 = NULL}
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	if StructureContains structure = <song_struct> streamname
		song_prefix = (<song_struct>.streamname)
	endif
	if ((isngc) || ($current_speedfactor = 1.0))
		0x6ff90bdb = <song_prefix>
		if ($game_mode = p2_coop || $game_mode = p2_quickplay ||
				($game_mode = training && ($player1_status.part = rhythm)))
			if StructureContains structure = <song_struct> use_coop_notetracks
				formatText TextName = 0x6ff90bdb '%s_coop' s = <song_prefix> AddToStringLookup
			endif
		endif
		if NOT SongLoadFSB song_prefix = <0x6ff90bdb>
			DownloadContentLost
			return
		endif
	endif
	stream_config = gh1
	get_song_struct song = <song_name>
	if StructureContains structure = <song_struct> Name = version
		stream_config = (<song_struct>.version)
	endif
	SoundBussUnlock \{band_Balance}
	SoundBussUnlock \{Guitar_Balance}
	if (isngc)
		0xc38f174c = 0.0
	else
		0xc38f174c = -1.5
	endif
	if StructureContains structure = <song_struct> Name = band_playback_volume
		setsoundbussparams {band_Balance = {vol = ((<song_struct>.band_playback_volume) + (5.0))}} time = <fadeintime>
	else
		setsoundbussparams {band_Balance = {vol = (5.0)}} time = <fadeinttime>
	endif
	if StructureContains structure = <song_struct> Name = guitar_playback_volume
		setsoundbussparams {Guitar_Balance = {vol = ((<song_struct>.guitar_playback_volume) + <0xc38f174c>)}} time = <fadeintime>
	else
		setsoundbussparams {Guitar_Balance = {vol = <0xc38f174c>}} time = <fadeintime>
	endif
	SoundBussLock \{band_Balance}
	SoundBussLock \{Guitar_Balance}
	Change stream_config = <stream_config>
	formatText checksumName = song_stream '%s_song' s = <song_prefix> AddToStringLookup
	formatText checksumName = guitar_stream '%s_guitar' s = <song_prefix> AddToStringLookup
	formatText checksumName = rhythm_stream '%s_rhythm' s = <song_prefix> AddToStringLookup
	formatText checksumName = crowd_stream '%s_crowd' s = <song_prefix> AddToStringLookup
	formatText TextName = 0xb0035174 '%s_crowd' s = <song_prefix> AddToStringLookup
	if ($game_mode = p2_coop || $game_mode = p2_quickplay ||
			($game_mode = training && ($player1_status.part = rhythm)))
		if StructureContains structure = <song_struct> use_coop_notetracks
			formatText checksumName = song_stream '%s_coop_song' s = <song_prefix> AddToStringLookup
			formatText checksumName = guitar_stream '%s_coop_guitar' s = <song_prefix> AddToStringLookup
			formatText checksumName = rhythm_stream '%s_coop_rhythm' s = <song_prefix> AddToStringLookup
		endif
	endif
	if ($current_speedfactor = 1.0)

		Change song_stream_id = <song_stream>
		if PreloadStream <song_stream> buss = Master position = <starttime> disk_stream = true
			Change song_unique_id = <unique_id>
		else
			ScriptAssert 'Could not load song track for %s' s = <song_prefix>
		endif
	endif
	extra_stream = NULL
	if (<stream_config> = gh3)
		if ($current_speedfactor = 1.0)
			Change 0xd5ab88b5 = <0xb0035174>
		endif
		<extra_stream> = <rhythm_stream>
	endif
	if StructureContains structure = <song_struct> Name = extra_stream
		formatText checksumName = extra_stream '%s_%t' s = <song_prefix> t = (<song_struct>.extra_stream) AddToStringLookup
	endif
	if ($current_num_players = 1)
		if (isps2)
			Change guitar_player1_stream_id = <guitar_stream>
			if ($current_speedfactor = 1.0)
				if (($player1_status.part) = rhythm && (<stream_config> != gh1))
					if NOT PreloadStream <extra_stream> buss = Master 0xa34b4b82 = true position = <starttime> disk_stream = <0x3370db4f>
						ScriptAssert 'Could not load player1 bass track for %s' s = <song_prefix>
					endif
					Change guitar_player1_unique_id = <unique_id>
					Change 0xb65332bc = <unique_id>
					<extra_stream> = <guitar_stream>
				else
					if NOT PreloadStream <guitar_stream> buss = Master 0xa34b4b82 = true position = <starttime>
						ScriptAssert 'Could not load player1 guitar track for %s' s = <song_prefix>
					endif
					Change guitar_player1_unique_id = <unique_id>
					Change 0xb65332bc = <unique_id>
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
					if NOT 0xa55a768d <extra_stream> buss = Master stereo = FALSE 0xa038f783 = <0xa038f783> 0x22b8afbb = <0x22b8afbb> 0x3dd98e8d = 11025 0xa34b4b82 = true position = <starttime> practice = true
						ScriptAssert 'Could not load player1 bass track for %s' s = <song_prefix>
					endif
					Change guitar_player1_unique_id = <unique_id>
					<extra_stream> = <guitar_stream>
				else
					if NOT 0xa55a768d <guitar_stream> buss = Master stereo = FALSE 0xa038f783 = <0xa038f783> 0x22b8afbb = <0x22b8afbb> 0x3dd98e8d = 11025 0xa34b4b82 = true position = <starttime> practice = true
						ScriptAssert 'Could not load player1 guitar track for %s' s = <song_prefix>
					endif
					Change guitar_player1_unique_id = <unique_id>
					<extra_stream> = <rhythm_stream>
				endif
			endif
		else
			if (($player1_status.part) = rhythm && (<stream_config> != gh1))
				if NOT PreloadStream <extra_stream> buss = Master disk_stream = <0x3370db4f>
					ScriptAssert 'Could not load player1 guitar track for %s' s = <song_prefix>
				endif
				Change guitar_player1_unique_id = <unique_id>
				<extra_stream> = <guitar_stream>
			else
				if NOT PreloadStream <guitar_stream> buss = Master disk_stream = <0x3370db4f>
					ScriptAssert 'Could not load player1 guitar track for %s' s = <song_prefix>
				endif
				Change guitar_player1_unique_id = <unique_id>
				<extra_stream> = <rhythm_stream>
			endif
		endif
		if ($current_speedfactor = 1.0)
			if NOT (<extra_stream> = NULL)
				Change extra_stream_id = <extra_stream>
				if PreloadStream <extra_stream> buss = Master position = <starttime> disk_stream = true
					Change extra_unique_id = <unique_id>
				endif
			endif
		endif
	else
		if ((<stream_config> != gh1) && (($player1_status.part) != rhythm) && (($player2_status.part) != rhythm))
			Change extra_stream_id = <extra_stream>
			PreloadStream <extra_stream> buss = Master position = <starttime> disk_stream = true
			if (<unique_id> != 0)
				Change extra_unique_id = <unique_id>
			endif
			PreloadStream <guitar_stream> buss = Master 0xa34b4b82 = true position = <starttime> disk_stream = true
			Change 0xb65332bc = <unique_id>
			Change guitar_player1_stream_id = <guitar_stream>
			Change guitar_player1_unique_id = <unique_id>
			PreloadStream <guitar_stream> buss = Master 0xa34b4b82 = true position = <starttime> disk_stream = true
			Change guitar_player2_stream_id = <guitar_stream>
			Change guitar_player2_unique_id = <unique_id>
		else
			PreloadStream <extra_stream> buss = Master 0xa34b4b82 = true position = <starttime> disk_stream = <0x3370db4f>
			if (<unique_id> = 0)
				ScriptAssert 'Could not load bass track for %s' s = <song_prefix>
			endif
			if (($player1_status.part) = rhythm)
				Change guitar_player1_stream_id = <extra_stream>
				Change guitar_player1_unique_id = <unique_id>
			else
				Change guitar_player2_stream_id = <extra_stream>
				Change guitar_player2_unique_id = <unique_id>
			endif
			PreloadStream <guitar_stream> buss = Master 0xa34b4b82 = true position = <starttime> disk_stream = <0x3370db4f>
			if (<unique_id> = 0)
				ScriptAssert 'Could not load guitar track for %s' s = <song_prefix>
			endif
			Change 0xb65332bc = <unique_id>
			if (($player1_status.part) = rhythm)
				Change guitar_player2_stream_id = <guitar_stream>
				Change guitar_player2_unique_id = <unique_id>
			else
				Change guitar_player1_stream_id = <guitar_stream>
				Change guitar_player1_unique_id = <unique_id>
			endif
		endif
	endif
	GetPlatform
	if (<Platform> = ngc)
		waitforpreload_song <...>
	endif
	Change \{song_paused = 1}
	Change \{structurename = player1_status
		last_guitar_volume = 100}
	Change \{structurename = player2_status
		last_guitar_volume = 100}
	SetLastGuitarVolume \{Player = 1
		last_guitar_volume = 100}
	SetLastGuitarVolume \{Player = 2
		last_guitar_volume = 100}
	if NOT (isps2)
		startpreloadpaused_song
	endif
	if NOT (<starttime> = 0)
		lockdsp
		SetSeekPosition_Song position = <starttime>
		unlockdsp
	endif
	Change 0x25bb39f3 = <starttime>
	if (isngc)
		adjustedtime = <starttime>
	endif
	return adjustedtime = <adjustedtime>
endscript

script SongUnLoadFSBIfDownloaded 
	GetContentFolderIndexFromFile ($song_fsb_name)
	if (<device> = content)
		UnLoadFSB \{fsb_index = $song_fsb_id}
		Downloads_CloseContentFolder content_index = <content_index>
		Change \{song_fsb_id = -1}
		Change \{song_fsb_name = 'none'}
	endif
endscript

script SongUnloadFSB 
	SongUnLoadFSBIfDownloaded
	end_song
	Change \{structurename = player1_status
		guitar_volume = 100}
	Change \{structurename = player2_status
		guitar_volume = 100}
endscript

script SongLoadFSB 
	formatText keep_case TextName = FileName '%n.fsb' n = <song_prefix>
	SongUnloadFSB
	formatText keep_case TextName = fsbfilename '%n' n = <song_prefix>
	GetContentFolderIndexFromFile <FileName>
	if (<device> = content)
		if NOT Downloads_OpenContentFolder content_index = <content_index>
			return \{FALSE}
		endif
	else
		formatText keep_case TextName = fsbfilename 'music/%n' n = <song_prefix>
	endif
	GetPlatform
	if (<Platform> = ngc)
		begin
		LoadFSB FileName = <fsbfilename> numstreams = 10 encryptionkey = '5atu6w4zaw' noWait
		if NOT (<fsb_index> = -1)
			Change song_fsb_id = <fsb_index>
			Change song_fsb_name = <FileName>
			break
		else
			Change \{song_fsb_id = -1}
			Change \{song_fsb_name = 'none'}
		endif
		Wait \{1
			Seconds}
		repeat
	else
		if NOT LoadFSB FileName = <fsbfilename> numstreams = 5 encryptionkey = '5atu6w4zaw' device = <device>
			return \{FALSE}
		endif
		if (<fsb_index> = -1)
			Change \{song_fsb_id = -1}
			Change \{song_fsb_name = 'none'}
		else
			Change song_fsb_id = <fsb_index>
			Change song_fsb_name = <FileName>
		endif
	endif
	return \{true}
endscript

script waitforpreload_song 
	waitforpreload_stream \{Stream = extra_unique_id}
	waitforpreload_stream \{Stream = song_unique_id}
	waitforpreload_stream \{Stream = crowd_unique_id}
	waitforpreload_stream \{Stream = guitar_player1_unique_id}
	waitforpreload_stream \{Stream = guitar_player2_unique_id}
endscript

script waitforpreload_stream \{Stream = None}
	if NOT ($<Stream> = NULL)
		begin
		if PreloadStreamDone $<Stream>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
endscript

script waitforseek_song 
	Wait \{15
		gameframe}
	return
endscript
0xd24c2415 = 0

script setslomo_song 
	if (isps2)
		if ((<slomo> = 1.0) && ($0xd24c2415 = 1))
			0xe45f3263
			Change \{0xd24c2415 = 0}
		endif
		if (<slomo> = 0.0)
			0x4e65c988
			Change \{0xd24c2415 = 1}
		endif
	endif
	if NOT ($song_unique_id = NULL)
		SetSoundParams unique_id = $song_unique_id pitch = (<slomo> * 100)
	endif
	if NOT ($guitar_player1_unique_id = NULL)
		SetSoundParams unique_id = $guitar_player1_unique_id pitch = (<slomo> * 100)
	endif
	if NOT ($extra_unique_id = NULL)
		SetSoundParams unique_id = $extra_unique_id pitch = (<slomo> * 100)
	endif
	if NOT ($crowd_unique_id = NULL)
		SetSoundParams unique_id = $crowd_unique_id pitch = (<slomo> * 100)
	endif
	if NOT ($guitar_player2_unique_id = NULL)
		SetSoundParams unique_id = $guitar_player2_unique_id pitch = (<slomo> * 100)
	endif
endscript
Player1Effects = {
	effect = $PitchShiftEffect1
}
Player2Effects = {
	effect = $PitchShiftEffect2
}
0xbc9810a0 = {
	effect = $HighPass_Default1
	effect2 = $Echo_Default1
	effect3 = $0x466a52de
}
0x257a76a1 = {
	effect = $HighPass_Default1
	effect2 = $Echo_Default1
	effect3 = $0x54dffd30
}
PitchShiftEffect1 = {
	effect = PitchShift
	Name = Guitar1PitchShift
	pitch = 1.0
	fftsize = 2048
	overlap = 4
	maxchannels = 0
}
PitchShiftEffect2 = {
	effect = PitchShift
	Name = Guitar2PitchShift
	pitch = 1.0
	fftsize = 2048
	overlap = 4
	maxchannels = 0
}
0x466a52de = {
	effect = FastPitchShift
	Name = Guitar1PitchShift
	pitch = 1.0
	maxchannels = 0
}
Player1PracticeEffects = {
	effect = $PitchShiftSlow1
	effect2 = $PitchShiftEffect1
}
0xb29cc322 = {
	effect = $0x39ae1d8e
}
PitchShiftSlow1 = {
	effect = PitchShift
	Name = SlowGuitar1PitchShift
	pitch = 1.0
	maxchannels = 2
	fftsize = 2048
}
0x39ae1d8e = {
	effect = FastPitchShift
	Name = 0xa8a061ff
	pitch = 1.0
	maxchannels = 0
}
0x5f96fb31 = {
	effect = PitchShift
	Name = Guitar1PitchShift
	pitch = 1.0
	maxchannels = 0
}
0x54dffd30 = {
	effect = FastPitchShift
	Name = Guitar2PitchShift
	pitch = 1.0
	maxchannels = 0
}

script startpreloadpaused_song 
	both_players_lead = 0
	if (($player1_status.part) = ($player2_status.part))
		both_players_lead = 1
	endif
	if ((isXenon) || (isps2))
		if ($current_num_players = 1)
			if ($game_mode = training && $in_menu_choose_practice_section = 0)
				StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback pitch = ($current_speedfactor * 100) $Player1Effects
			else
				StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback pitch = ($current_speedfactor * 100) $Player1Effects
			endif
		else
			if (<both_players_lead> = 1)
				StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback pitch = ($current_speedfactor * 100) $Player1Effects $Player1Pan volL = 100 volR = 0 0x2a3be6b4 = left
				StartPreLoadedStream $guitar_player2_unique_id startpaused = 1 buss = Second_Player_Lead_Playback pitch = ($current_speedfactor * 100) $Player2Effects $Player2Pan volL = 0 volR = 100 0x2a3be6b4 = right
			else
				StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = Right_Notes_Player1 pitch = ($current_speedfactor * 100) $Player1Effects
				StartPreLoadedStream $guitar_player2_unique_id startpaused = 1 buss = Right_Notes_Player1 pitch = ($current_speedfactor * 100) $Player2Effects
			endif
		endif
	else
		if (isngc)
			if ($current_num_players = 1)
				if ($game_mode = training && $in_menu_choose_practice_section = 0)
					StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback pitch = ($current_speedfactor * 100) $0xb29cc322
				else

					StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback pitch = ($current_speedfactor * 100) $0xbc9810a0
				endif
			else
				if (<both_players_lead> = 1)
					StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback pitch = ($current_speedfactor * 100) $0xbc9810a0 $Player1Pan volL = 100 volR = 0 0x2a3be6b4 = left
					StartPreLoadedStream $guitar_player2_unique_id startpaused = 1 buss = Second_Player_Lead_Playback pitch = ($current_speedfactor * 100) $0x257a76a1 $Player2Pan volL = 0 volR = 100 0x2a3be6b4 = right
				else
					StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback pitch = ($current_speedfactor * 100) $0xbc9810a0
					StartPreLoadedStream $guitar_player2_unique_id startpaused = 1 buss = Second_Player_Rhythm_Playback pitch = ($current_speedfactor * 100) $0x257a76a1
				endif
			endif
		else
			if ($current_num_players = 1 ||
					$is_network_game = 1)
				StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = Right_Notes_Player1 pitch = ($current_speedfactor * 100)
			else
				if (<both_players_lead> = 1)
					StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = Right_Notes_Player1 pitch = ($current_speedfactor * 100) $Player1Pan
					StartPreLoadedStream $guitar_player2_unique_id startpaused = 1 buss = Right_Notes_Player1 pitch = ($current_speedfactor * 100) $Player2Pan
				else
					StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = Right_Notes_Player1 pitch = ($current_speedfactor * 100)
					StartPreLoadedStream $guitar_player2_unique_id startpaused = 1 buss = Right_Notes_Player1 pitch = ($current_speedfactor * 100)
				endif
			endif
		endif
	endif
	StartPreLoadedStream $song_unique_id startpaused = 1 buss = Band_Playback pitch = ($current_speedfactor * 100)
	if NOT ($extra_stream_id = NULL)
		StartPreLoadedStream $extra_unique_id startpaused = 1 buss = Single_Player_Rhythm_Playback pitch = ($current_speedfactor * 100)
	endif
	if NOT ($game_mode = training && $in_menu_choose_practice_section = 0)
		if NOT ($crowd_unique_id = NULL)
			StartPreLoadedStream $crowd_unique_id startpaused = 1 buss = Crowd_Singalong pan1x = -1 pan1y = -0.5 pan2x = 1 pan2y = -0.5 pitch = ($current_speedfactor * 100)
		endif
	endif
endscript

script begin_song \{Pause = 0}
	if (isps2)
		startpreloadpaused_song
		0x92996416
		return
	endif

	lockdsp
	if NOT ($0x25bb39f3 = <starttime>)
		SetSeekPosition_Song position = <starttime>
	endif
	if ($game_mode = training && ($current_speedfactor < 1.0))
		PauseSound unique_id = $guitar_player1_unique_id Pause = <Pause>
	else
		PauseSound unique_id = $guitar_player1_unique_id Pause = <Pause>
		PauseSound unique_id = $song_unique_id Pause = <Pause>
		if NOT ($extra_stream_id = NULL)
			PauseSound unique_id = $extra_unique_id Pause = <Pause>
		endif
		if NOT ($crowd_stream_id = NULL)
			PauseSound unique_id = $crowd_unique_id Pause = <Pause>
		endif
		if NOT ($guitar_player2_stream_id = NULL)
			PauseSound unique_id = $guitar_player2_unique_id Pause = <Pause>
		endif
	endif
	unlockdsp
	Change \{song_paused = 0}
endscript

script SetSeekPosition_Song \{position = 0}
	if NOT ($song_unique_id = NULL)
		SetSoundSeekPosition unique_id = $song_unique_id position = <position>
	endif
	if NOT ($guitar_player1_unique_id = NULL)
		if ($game_mode = training && $in_menu_choose_practice_section = 0)
			SetSoundSeekPosition unique_id = $guitar_player1_unique_id position = (<position> - ($default_practice_mode_pitchshift_offset_song))
		else
			SetSoundSeekPosition unique_id = $guitar_player1_unique_id position = <position>
		endif
	endif
	if NOT ($extra_unique_id = NULL)
		SetSoundSeekPosition unique_id = $extra_unique_id position = <position>
	endif
	if NOT ($crowd_unique_id = NULL)
		SetSoundSeekPosition unique_id = $crowd_unique_id position = <position>
	endif
	if NOT ($guitar_player2_unique_id = NULL)
		SetSoundSeekPosition unique_id = $guitar_player2_unique_id position = <position>
	endif
endscript
Waiting_For_Pitching = 0

script Failed_Song_Pitch_Down 
	SoundBussUnlock \{Guitar_Balance}
	SoundBussUnlock \{band_Balance}
	setsoundbussparams \{band_Balance = {
			vol = -20
			pitch = -8
		}
		time = 3}
	setsoundbussparams \{Guitar_Balance = {
			vol = -20
			pitch = -8
		}
		time = 3}
	Change \{Waiting_For_Pitching = 1}
	SoundBussLock \{band_Balance}
	SoundBussLock \{Guitar_Balance}
	if (isngc)
		Wait \{3
			Seconds}
		SpawnScriptNow \{end_song}
	else
		pitch = 1.0
		Volume = 100.0
		begin
		pitch = (<pitch> -0.004)
		Volume = (<Volume> -0.4)
		if NOT ($guitar_player1_unique_id = NULL)
			0x7c757af0 $guitar_player1_unique_id pitch = <pitch>
			SetSoundParams unique_id = $guitar_player1_unique_id vol = <Volume>
		endif
		if NOT ($song_unique_id = NULL)
			0x7c757af0 $song_unique_id pitch = <pitch>
			SetSoundParams unique_id = $song_unique_id vol = <Volume>
		endif
		Wait \{1
			gameframe}
		repeat 180
		SpawnScriptNow \{end_song
			params = {
				song_failed_pitch_streams = 0
			}}
	endif
endscript

script end_song \{song_failed_pitch_streams = 0
		0xdeb80c0b = 0}

	if ((isps2) && $current_speedfactor != 1.0)
		if NOT ($guitar_player1_unique_id = NULL)
			0xc7acd659 \{unique_id = $guitar_player1_unique_id}
		endif
	else
		if NOT (<song_failed_pitch_streams> = 1)
			KillSpawnedScript \{Name = Failed_Song_Pitch_Down}
			if ($Waiting_For_Pitching = 1)
				Change \{Waiting_For_Pitching = 0}
				SoundBussUnlock \{Guitar_Balance}
				SoundBussUnlock \{band_Balance}
				if (isngc)
					0xc38f174c = 0.0
				else
					0xc38f174c = -2.5
				endif
				setsoundbussparams {band_Balance = {vol = (($default_BussSet.band_Balance.vol) + <0xc38f174c>) pitch = ($default_BussSet.band_Balance.pitch)}}
				setsoundbussparams {Guitar_Balance = {vol = (($default_BussSet.Guitar_Balance.vol) + <0xc38f174c>) pitch = ($default_BussSet.Guitar_Balance.pitch)}}
				SoundBussLock \{band_Balance}
				SoundBussLock \{Guitar_Balance}
			endif
			if NOT ($song_unique_id = NULL)
				StopStream \{unique_id = $song_unique_id}
				Change \{song_unique_id = NULL}
			endif
			if NOT ($guitar_player1_unique_id = NULL)
				StopStream \{unique_id = $guitar_player1_unique_id}
				Change \{guitar_player1_unique_id = NULL}
			endif
			if NOT ($extra_unique_id = NULL)
				StopStream \{unique_id = $extra_unique_id}
				Change \{extra_unique_id = NULL}
			endif
		else

			SpawnScriptNow \{Failed_Song_Pitch_Down}
		endif
	endif
	if NOT ($extra_unique_id = NULL)
		StopStream \{unique_id = $extra_unique_id}
		Change \{extra_unique_id = NULL}
	endif
	if NOT ($crowd_unique_id = NULL)
		StopStream \{unique_id = $crowd_unique_id}
		Change \{crowd_unique_id = NULL}
	endif
	if NOT ($guitar_player2_unique_id = NULL)
		StopStream \{unique_id = $guitar_player2_unique_id}
		Change \{guitar_player2_unique_id = NULL}
	endif
	Change \{song_paused = 0}
	if (isngc)
		if (<0xdeb80c0b> = 1)

			return
		endif
	endif
	if NOT (<song_failed_pitch_streams> = 1)
		if NOT ($song_fsb_id = -1)
			UnLoadFSB \{fsb_index = $song_fsb_id}
			Change \{song_fsb_id = -1}
			Change \{song_fsb_name = 'none'}
		endif
	endif
endscript
p1_whammy_control = 0.0

script set_whammy_pitchshift 
	if ($guitar_player1_unique_id = NULL)
		return
	endif
	if ((isngc) && ($current_speedfactor != 1.0))
		return
	endif
	if ($<player_status>.Player = 1)
		if (isngc)
			setsoundbusseffects effect = {effect = FastPitchShift Name = Guitar1PitchShift pitch = (1 - (<control> * 0.057))}
			setsoundbusseffects effect = {effect = FastPitchShift Name = 0xa8a061ff pitch = (1 - (<control> * 0.057))}
		else
			setsoundbusseffects effect = {effect = PitchShift Name = Guitar1PitchShift pitch = (1 - (<control> * 0.057))}
		endif
		Change p1_whammy_control = <control>
	else
		if (isngc)
			setsoundbusseffects effect = {effect = FastPitchShift Name = Guitar2PitchShift pitch = (1 - (<control> * 0.057))}
		else
			setsoundbusseffects effect = {effect = PitchShift Name = Guitar2PitchShift pitch = (1 - (<control> * 0.057))}
		endif
	endif
endscript

script PauseGh3Sounds 
	lockdsp
	PauseSoundsByBuss \{Master}
	if (isps2)
	endif
	unlockdsp
endscript

script UnPauseGh3Sounds 
	lockdsp
	if (isngc)
		if GotParam \{seek_on_unpause}
			GetSongTimeMs
			CastToInteger \{time}
			if (<time> > $current_starttime)

				SetSeekPosition_Song position = <time>
				waitforseek_song
			endif
		endif
	endif
	if (isps2)
		if ($0xd24c2415 = 1)
			0x4e65c988
		endif
	endif
	if ($song_paused = 0)

		UnpauseSoundsByBuss \{Master}
	else

		UnpauseSoundsByBuss \{UI}
		UnpauseSoundsByBuss \{Crowd_One_Shots}
		UnpauseSoundsByBuss \{Crowd_One_Shots_Negative}
		UnpauseSoundsByBuss \{Crowd_Beds}
		UnpauseSoundsByBuss \{Crowd_Cheers}
		UnpauseSoundsByBuss \{Crowd_Boos}
		UnpauseSoundsByBuss \{Crowd_Nuetral}
		UnpauseSoundsByBuss \{Default}
		UnpauseSoundsByBuss \{Test_Tones}
		UnpauseSoundsByBuss \{Practice_Band_Playback}
		UnpauseSoundsByBuss \{Test_Tones_DSP}
		UnpauseSoundsByBuss \{Right_Notes_Player2}
		UnpauseSoundsByBuss \{Wrong_Notes_Player1}
		UnpauseSoundsByBuss \{Wrong_Notes_Player2}
		UnpauseSoundsByBuss \{User_Vocal}
		UnpauseSoundsByBuss \{User_Music}
		UnpauseSoundsByBuss \{Encore_Events}
		UnpauseSoundsByBuss \{binkcutscenes}
	endif
	unlockdsp
endscript

script 0x4e65c988 
	GetPlatform
	if (<Platform> = PS2)
		if ($stream_config = gh1)
			0x774f034a \{$song_stream_id
				Pause = 1}
			0x774f034a \{$0xd1a38704
				Pause = 1}
			0x6dc26a59 \{$song_unique_id
				Pause = 1}
			0x6dc26a59 \{$guitar_player1_unique_id
				Pause = 1}
		else
			0x774f034a \{$band_stream_id
				Pause = 1}
			0x774f034a \{$crowd_stream_id
				Pause = 1}
			0x774f034a \{$guitar_player1_stream_id
				Pause = 1}
			0x774f034a \{$guitar_player2_stream_id
				Pause = 1}
			0x774f034a \{$extra_stream_id
				Pause = 1}
			0x6dc26a59 \{$song_unique_id
				Pause = 1}
			0x6dc26a59 \{$band_unique_id
				Pause = 1}
			0x6dc26a59 \{$crowd_unique_id
				Pause = 1}
			0x6dc26a59 \{$extra_unique_id
				Pause = 1}
			0x6dc26a59 \{$guitar_player2_unique_id
				Pause = 1}
			0x6dc26a59 \{$guitar_player1_unique_id
				Pause = 1}
		endif
	endif
endscript

script 0xe45f3263 
	GetPlatform
	if (<Platform> = PS2)
		if ($stream_config = gh1)
			0x774f034a \{$song_stream_id
				Pause = 0}
			0x774f034a \{$0xd1a38704
				Pause = 0}
			0x6dc26a59 \{$song_unique_id
				Pause = 0}
			0x6dc26a59 \{$guitar_player1_unique_id
				Pause = 0}
		else
			0x774f034a \{$band_stream_id
				Pause = 0}
			0x774f034a \{$crowd_stream_id
				Pause = 0}
			0x774f034a \{$guitar_player1_stream_id
				Pause = 0}
			0x774f034a \{$guitar_player2_stream_id
				Pause = 0}
			0x774f034a \{$extra_stream_id
				Pause = 0}
			0x6dc26a59 \{$song_unique_id
				Pause = 0}
			0x6dc26a59 \{$band_unique_id
				Pause = 0}
			0x6dc26a59 \{$crowd_unique_id
				Pause = 0}
			0x6dc26a59 \{$extra_unique_id
				Pause = 0}
			0x6dc26a59 \{$guitar_player2_unique_id
				Pause = 0}
			0x6dc26a59 \{$guitar_player1_unique_id
				Pause = 0}
		endif
	endif
endscript
