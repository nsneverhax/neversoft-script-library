stream_config = gh1
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
band_stream_id = NULL
band_unique_id = NULL
crowd_stream_id = NULL
crowd_unique_id = NULL
song_paused = 0

script preload_song \{StartTime = 0
		fadeintime = 0.0}
	Printf "song %s" S = <song_name>
	Change \{song_stream_id = NULL}
	Change \{song_unique_id = NULL}
	Change \{guitar_player1_stream_id = NULL}
	Change \{guitar_player1_unique_id = NULL}
	Change \{guitar_player2_stream_id = NULL}
	Change \{guitar_player2_unique_id = NULL}
	Change \{extra_stream_id = NULL}
	Change \{extra_unique_id = NULL}
	Change \{band_stream_id = NULL}
	Change \{band_unique_id = NULL}
	Change \{crowd_stream_id = NULL}
	Change \{crowd_unique_id = NULL}
	get_song_prefix Song = <song_name>
	get_song_struct Song = <song_name>
	if StructureContains Structure = <song_struct> streamname
		song_prefix = (<song_struct>.streamname)
	endif
	if NOT SongLoadFSB song_prefix = <song_prefix>
		DownloadContentLost
		return
	endif
	stream_config = gh1
	get_song_struct Song = <song_name>
	if StructureContains Structure = <song_struct> Name = version
		stream_config = (<song_struct>.version)
	endif
	SoundBussUnlock \{Band_Balance}
	SoundBussUnlock \{Guitar_Balance}
	if StructureContains Structure = <song_struct> Name = band_playback_volume
		SetSoundBussParams {Band_Balance = {vol = ((<song_struct>.band_playback_volume) - 1.5)}} Time = <fadeintime>
	else
		SetSoundBussParams {Band_Balance = {vol = -1.5}} Time = <fadeinttime>
	endif
	if StructureContains Structure = <song_struct> Name = guitar_playback_volume
		SetSoundBussParams {Guitar_Balance = {vol = ((<song_struct>.guitar_playback_volume) - 1.5)}} Time = <fadeintime>
	else
		SetSoundBussParams {Guitar_Balance = {vol = -1.5}} Time = <fadeintime>
	endif
	SoundBussLock \{Band_Balance}
	SoundBussLock \{Guitar_Balance}
	Change stream_config = <stream_config>
	FormatText ChecksumName = song_stream '%s_song' S = <song_prefix> AddToStringLookup
	FormatText ChecksumName = Guitar_Stream '%s_guitar' S = <song_prefix> AddToStringLookup
	FormatText ChecksumName = rhythm_stream '%s_rhythm' S = <song_prefix> AddToStringLookup
	FormatText ChecksumName = crowd_stream '%s_crowd' S = <song_prefix> AddToStringLookup
	if ($game_mode = p2_career || $game_mode = p2_coop ||
			($game_mode = training && ($player1_status.part = RHYTHM)))
		if StructureContains Structure = <song_struct> use_coop_notetracks
			FormatText ChecksumName = song_stream '%s_coop_song' S = <song_prefix> AddToStringLookup
			FormatText ChecksumName = Guitar_Stream '%s_coop_guitar' S = <song_prefix> AddToStringLookup
			FormatText ChecksumName = rhythm_stream '%s_coop_rhythm' S = <song_prefix> AddToStringLookup
		endif
	endif
	Change song_stream_id = <song_stream>
	if PreLoadStream <song_stream> buss = Master
		Change song_unique_id = <unique_id>
	else
		ScriptAssert "Could not load song track for %s" S = <song_prefix>
	endif
	extra_stream = NULL
	if (<stream_config> = gh3)
		Change crowd_stream_id = <crowd_stream>
		if PreLoadStream <crowd_stream> buss = Master
			Change crowd_unique_id = <unique_id>
		endif
		<extra_stream> = <rhythm_stream>
	endif
	if StructureContains Structure = <song_struct> Name = extra_stream
		FormatText ChecksumName = extra_stream '%s_%t' S = <song_prefix> T = (<song_struct>.extra_stream) AddToStringLookup
	endif
	if ($current_num_players = 1)
		if (($player1_status.part) = RHYTHM && (<stream_config> != gh1))
			if NOT PreLoadStream <extra_stream> buss = Master
				ScriptAssert "Could not load player1 guitar track for %s" S = <song_prefix>
			endif
			Change guitar_player1_unique_id = <unique_id>
			<extra_stream> = <Guitar_Stream>
		else
			if NOT PreLoadStream <Guitar_Stream> buss = Master
				ScriptAssert "Could not load player1 guitar track for %s" S = <song_prefix>
			endif
			Change guitar_player1_unique_id = <unique_id>
			<extra_stream> = <rhythm_stream>
		endif
		if NOT (<extra_stream> = NULL)
			Change extra_stream_id = <extra_stream>
			if PreLoadStream <extra_stream> buss = Master
				Change extra_unique_id = <unique_id>
			endif
		endif
	else
		if (($player1_status.part) = RHYTHM && (<stream_config> != gh1))
			Change guitar_player1_stream_id = <extra_stream>
			if NOT PreLoadStream <extra_stream> buss = Master
				ScriptAssert "Could not load player1 guitar track for %s" S = <song_prefix>
			endif
		else
			Change guitar_player1_stream_id = <Guitar_Stream>
			if NOT PreLoadStream <Guitar_Stream> buss = Master
				ScriptAssert "Could not load player1 guitar track for %s" S = <song_prefix>
			endif
		endif
		Change guitar_player1_unique_id = <unique_id>
		if (($player2_status.part) = RHYTHM && (<stream_config> != gh1))
			Change guitar_player2_stream_id = <extra_stream>
			if NOT PreLoadStream <extra_stream> buss = Master
				ScriptAssert "Could not load player2 guitar track for %s" S = <song_prefix>
			endif
		else
			Change guitar_player2_stream_id = <Guitar_Stream>
			if NOT PreLoadStream <Guitar_Stream> buss = Master
				ScriptAssert "Could not load player2 guitar track for %s" S = <song_prefix>
			endif
		endif
		Change guitar_player2_unique_id = <unique_id>
		if (<stream_config> != gh1)
			if NOT ((($player1_status.part) = RHYTHM) || (($player2_status.part) = RHYTHM))
				Change extra_stream_id = <extra_stream>
				if PreLoadStream <extra_stream> buss = Master
					Change extra_unique_id = <unique_id>
				endif
			endif
		endif
	endif
	waitforpreload_song <...>
	Change \{song_paused = 1}
	SetLastGuitarVolume \{Player = 1
		last_guitar_volume = 100}
	SetLastGuitarVolume \{Player = 2
		last_guitar_volume = 100}
	startpreloadpaused_song
	SetSeekPosition_Song Position = <StartTime>
endscript

script SongUnLoadFSBIfDownloaded 
	GetContentFolderIndexFromFile ($song_fsb_name)
	if (<device> = Content)
		UnLoadFSB \{fsb_index = $song_fsb_id}
		Downloads_CloseContentFolder content_index = <content_index>
		Change \{song_fsb_id = -1}
		Change \{song_fsb_name = 'none'}
	endif
endscript

script SongUnLoadFSB 
	SongUnLoadFSBIfDownloaded
	if NOT ($song_fsb_id = -1)
		UnLoadFSB \{fsb_index = $song_fsb_id}
		Change \{song_fsb_id = -1}
		Change \{song_fsb_name = 'none'}
	endif
endscript

script SongLoadFSB 
	FormatText keep_case TextName = FileName '%n.fsb' N = <song_prefix>
	if ($song_fsb_name = <FileName>)
		return \{TRUE}
	endif
	SongUnLoadFSB
	FormatText keep_case TextName = fsbfilename '%n' N = <song_prefix>
	GetContentFolderIndexFromFile <FileName>
	if (<device> = Content)
		if NOT Downloads_OpenContentFolder content_index = <content_index>
			return \{FALSE}
		endif
	else
		FormatText keep_case TextName = fsbfilename 'music/%n' N = <song_prefix>
	endif
	if NOT LoadFSB FileName = <fsbfilename> numstreams = 5 encryptionkey = '5atu6w4zaw' device = <device>
		return \{FALSE}
	endif
	if (<fsb_index> = -1)
		Change \{song_fsb_id = -1}
		Change \{song_fsb_name = 'none'}
		ScriptAssert "could not load FSB for: %s" S = <song_prefix>
	else
		Change song_fsb_id = <fsb_index>
		Change song_fsb_name = <FileName>
	endif
	return \{TRUE}
endscript

script waitforpreload_song 
	waitforpreload_stream \{Stream = extra_unique_id}
	waitforpreload_stream \{Stream = song_unique_id}
	waitforpreload_stream \{Stream = crowd_unique_id}
	waitforpreload_stream \{Stream = guitar_player1_unique_id}
	waitforpreload_stream \{Stream = guitar_player2_unique_id}
endscript

script waitforpreload_stream \{Stream = NONE}
	if NOT ($<Stream> = NULL)
		begin
		if PreLoadStreamDone $<Stream>
			break
		endif
		Wait \{1
			GameFrame}
		Printf "Waiting for preload %s" S = <Stream>
		repeat
	endif
endscript

script waitforseek_song 
	Wait \{15
		GameFrame}
	return
endscript

script setslomo_song 
	if NOT ($song_unique_id = NULL)
		SetSoundParams unique_id = $song_unique_id Pitch = (<slomo> * 100)
	endif
	if NOT ($guitar_player1_unique_id = NULL)
		SetSoundParams unique_id = $guitar_player1_unique_id Pitch = (<slomo> * 100)
	endif
	if NOT ($extra_unique_id = NULL)
		SetSoundParams unique_id = $extra_unique_id Pitch = (<slomo> * 100)
	endif
	if NOT ($crowd_unique_id = NULL)
		SetSoundParams unique_id = $crowd_unique_id Pitch = (<slomo> * 100)
	endif
	if NOT ($guitar_player2_unique_id = NULL)
		SetSoundParams unique_id = $guitar_player2_unique_id Pitch = (<slomo> * 100)
	endif
endscript
Player1Effects = {
	Effect = $PitchShiftEffect1
	effect2 = $Flange_Default1
	effect3 = $Chorus_Default1
	effect4 = $Echo_Default1
	effect5 = $HighPass_Default1
	effect6 = $LowPass_Default1
	effect7 = $EQ_Default1
}
Player2Effects = {
	Effect = $PitchShiftEffect2
	effect2 = $Flange_Default2
	effect3 = $Chorus_Default2
	effect4 = $Echo_Default2
	effect5 = $HighPass_Default2
	effect6 = $LowPass_Default2
	effect7 = $EQ_Default2
}
PitchShiftEffect1 = {
	Effect = FastPitchShift
	Name = Guitar1PitchShift
	Pitch = 1.0
	MaxChannels = 0
}
PitchShiftEffect2 = {
	Effect = FastPitchShift
	Name = Guitar2PitchShift
	Pitch = 1.0
	MaxChannels = 0
}
Player1PracticeEffects = {
	Effect = $PitchShiftSlow1
	effect2 = $PitchShiftEffect1
}
PitchShiftSlow1 = {
	Effect = PitchShift
	Name = SlowGuitar1PitchShift
	Pitch = 1.0
	MaxChannels = 2
	fftsize = 4096
}

script startpreloadpaused_song 
	both_players_lead = 0
	if (($player1_status.part) = ($player2_status.part))
		both_players_lead = 1
	endif
	if ($current_num_players = 1)
		if ($game_mode = training && $in_menu_choose_practice_section = 0)
			StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback Pitch = ($current_speedfactor * 100) $Player1PracticeEffects
		else
			StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback Pitch = ($current_speedfactor * 100) $Player1Effects
		endif
	else
		if (<both_players_lead> = 1)
			StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback Pitch = ($current_speedfactor * 100) $Player1Effects $Player1Pan volL = 100 volR = 0
			StartPreLoadedStream $guitar_player2_unique_id startpaused = 1 buss = Second_Player_Lead_Playback Pitch = ($current_speedfactor * 100) $Player2Effects $Player2Pan volL = 0 volR = 100
		else
			StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback Pitch = ($current_speedfactor * 100) $Player1Effects
			StartPreLoadedStream $guitar_player2_unique_id startpaused = 1 buss = Second_Player_Rhythm_Playback Pitch = ($current_speedfactor * 100) $Player2Effects
		endif
	endif
	StartPreLoadedStream $song_unique_id startpaused = 1 buss = Band_Playback Pitch = ($current_speedfactor * 100)
	if NOT ($extra_stream_id = NULL)
		StartPreLoadedStream $extra_unique_id startpaused = 1 buss = Single_Player_Rhythm_Playback Pitch = ($current_speedfactor * 100)
	endif
	if NOT ($crowd_unique_id = NULL)
		StartPreLoadedStream $crowd_unique_id startpaused = 1 buss = Crowd_Singalong pan1x = -1 pan1y = -0.5 pan2x = 1 pan2y = -0.5 Pitch = ($current_speedfactor * 100)
	endif
endscript

script begin_song \{Pause = 0}
	lockdsp
	PauseSound unique_id = $song_unique_id Pause = <Pause>
	PauseSound unique_id = $guitar_player1_unique_id Pause = <Pause>
	if NOT ($extra_stream_id = NULL)
		PauseSound unique_id = $extra_unique_id Pause = <Pause>
	endif
	if NOT ($crowd_stream_id = NULL)
		PauseSound unique_id = $crowd_unique_id Pause = <Pause>
	endif
	if NOT ($guitar_player2_stream_id = NULL)
		PauseSound unique_id = $guitar_player2_unique_id Pause = <Pause>
	endif
	unlockdsp
	Change \{song_paused = 0}
endscript

script SetSeekPosition_Song \{Position = 0}
	if NOT ($song_unique_id = NULL)
		SetSoundSeekPosition unique_id = $song_unique_id Position = <Position>
	endif
	if NOT ($guitar_player1_unique_id = NULL)
		if ($game_mode = training && $in_menu_choose_practice_section = 0)
			SetSoundSeekPosition unique_id = $guitar_player1_unique_id Position = (<Position> - ($default_practice_mode_pitchshift_offset_song))
		else
			SetSoundSeekPosition unique_id = $guitar_player1_unique_id Position = <Position>
		endif
	endif
	if NOT ($extra_unique_id = NULL)
		SetSoundSeekPosition unique_id = $extra_unique_id Position = <Position>
	endif
	if NOT ($crowd_unique_id = NULL)
		SetSoundSeekPosition unique_id = $crowd_unique_id Position = <Position>
	endif
	if NOT ($guitar_player2_unique_id = NULL)
		SetSoundSeekPosition unique_id = $guitar_player2_unique_id Position = <Position>
	endif
endscript
Waiting_For_Pitching = 0

script Failed_Song_Pitch_Down 
	SoundBussUnlock \{Guitar_Balance}
	SoundBussUnlock \{Band_Balance}
	SetSoundBussParams \{Band_Balance = {
			vol = -20
			Pitch = -8
		}
		Time = 3}
	SetSoundBussParams \{Guitar_Balance = {
			vol = -20
			Pitch = -8
		}
		Time = 3}
	Change \{Waiting_For_Pitching = 1}
	SoundBussLock \{Band_Balance}
	SoundBussLock \{Guitar_Balance}
	Wait \{3
		Seconds}
	SpawnScriptNow \{end_song}
endscript

script end_song \{song_failed_pitch_streams = 0}
	if NOT (<song_failed_pitch_streams> = 1)
		KillSpawnedScript \{Name = Failed_Song_Pitch_Down}
		if ($Waiting_For_Pitching = 1)
			Change \{Waiting_For_Pitching = 0}
			SoundBussUnlock \{Guitar_Balance}
			SoundBussUnlock \{Band_Balance}
			SetSoundBussParams {Band_Balance = {vol = (($Default_BussSet.Band_Balance.vol) - 2.5) Pitch = ($Default_BussSet.Band_Balance.Pitch)}}
			SetSoundBussParams {Guitar_Balance = {vol = (($Default_BussSet.Guitar_Balance.vol) - 2.5) Pitch = ($Default_BussSet.Guitar_Balance.Pitch)}}
			SoundBussLock \{Band_Balance}
			SoundBussLock \{Guitar_Balance}
		endif
		StopStream \{unique_id = $song_unique_id}
		StopStream \{unique_id = $guitar_player1_unique_id}
	else
		Printf \{Channel = SFX
			"We are pitching the stream down because we failed"}
		SpawnScriptNow \{Failed_Song_Pitch_Down}
	endif
	if NOT ($extra_unique_id = NULL)
		StopStream \{unique_id = $extra_unique_id}
	endif
	if NOT ($crowd_unique_id = NULL)
		StopStream \{unique_id = $crowd_unique_id}
	endif
	if NOT ($guitar_player2_unique_id = NULL)
		StopStream \{unique_id = $guitar_player2_unique_id}
	endif
	Change \{song_paused = 0}
endscript
p1_whammy_control = 0.0

script set_whammy_pitchshift 
	if ($<player_status>.Player = 1)
		SetSoundBussEffects Effect = {Effect = PitchShift Name = Guitar1PitchShift Pitch = (1 - (<control> * 0.057))}
		Change p1_whammy_control = <control>
	else
		SetSoundBussEffects Effect = {Effect = PitchShift Name = Guitar2PitchShift Pitch = (1 - (<control> * 0.057))}
	endif
endscript

script PauseGH3Sounds 
	lockdsp
	PauseSoundsByBuss \{Master}
	unlockdsp
	if NOT GotParam \{no_seek}
		GetSongTimeMS
		CastToInteger \{Time}
		if (<Time> > $current_starttime)
			if NOT GotParam \{seek_on_unpause}
				SetSeekPosition_Song Position = <Time>
			endif
		endif
	endif
endscript

script UnPauseGH3Sounds 
	if GotParam \{seek_on_unpause}
		GetSongTimeMS
		CastToInteger \{Time}
		if (<Time> > $current_starttime)
			SetSeekPosition_Song Position = <Time>
		endif
	endif
	lockdsp
	if ($song_paused = 0)
		UnPauseSoundsByBuss \{Master}
	else
		UnPauseSoundsByBuss \{UI}
		UnPauseSoundsByBuss \{Crowd_One_Shots}
		UnPauseSoundsByBuss \{Crowd_One_Shots_Negative}
		UnPauseSoundsByBuss \{Crowd_Beds}
		UnPauseSoundsByBuss \{Crowd_Cheers}
		UnPauseSoundsByBuss \{Crowd_Boos}
		UnPauseSoundsByBuss \{Crowd_Nuetral}
		UnPauseSoundsByBuss \{DEFAULT}
		UnPauseSoundsByBuss \{Test_Tones}
		UnPauseSoundsByBuss \{Practice_Band_Playback}
		UnPauseSoundsByBuss \{Test_Tones_DSP}
		UnPauseSoundsByBuss \{Right_Notes_Player2}
		UnPauseSoundsByBuss \{Wrong_Notes_Player1}
		UnPauseSoundsByBuss \{Wrong_Notes_Player2}
		UnPauseSoundsByBuss \{User_Vocal}
		UnPauseSoundsByBuss \{User_Music}
		UnPauseSoundsByBuss \{Encore_Events}
		UnPauseSoundsByBuss \{BinkCutScenes}
	endif
	unlockdsp
endscript
