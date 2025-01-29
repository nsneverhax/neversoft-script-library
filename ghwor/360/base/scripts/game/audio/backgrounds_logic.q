
script sfx_backgrounds_new_area \{immediate = 0
		fadeintime = 3
		fadeouttime = 3
		fadeouttype = log_slow
		fadeintype = log_fast
		volpercentincrease = 0
		loading_transition = 0
		restarting = 0}
	Change SFX_Background_Last_Area = <BG_SFX_Area>
	if (<immediate> = 0)
		Wait \{1
			gameframe}
	endif
	gamemode_gettype
	if (<Type> = freeplay)
		if (<BG_SFX_Area> = FrontEnd)
			Change SFX_Background_Requested_Area = <BG_SFX_Area>
		else
			Change \{SFX_Background_Requested_Area = $g_current_crowd_looping_bg_area_good}
		endif
	else
		Change SFX_Background_Requested_Area = <BG_SFX_Area>
	endif
	Check_For_Specific_BGs_In_Struct
	SpawnScriptNow Skate8_SFX_Background_Play params = {volpercentincrease = <volpercentincrease> fadeintime = <fadeintime> fadeouttime = <fadeouttime> fadeouttype = <fadeouttype> fadeintype = <fadeintype> loading_transition = <loading_transition> restarting = <restarting>}
endscript

script Skate8_SFX_Request_Background_Area_Change 
	Change SFX_Background_Requested_Area = <BG_SFX_Area>
endscript
SFX_Background_Last_Area = Default
SFX_Background_Requested_Area = Default
SFX_Background_Requested_Checksum = Default
SFX_Background_Requested_Volume = 60
SFX_Background_Current_Area = Default
SFX_Background_Current_Checksum = Default
SFX_Background_Current_Volume = 100
SFX_Background_Previous_Area = Default
SFX_Background_Previous_Checksum = Default
SFX_Background_FadeIn_Area = Default
SFX_Background_FadeIn_Checksum = Default
SFX_Background_FadeIn_Volume_Start = 1.0
SFX_Background_FadeIn_Volume_Target = 100.0
SFX_Background_FadeIn_Volume_Current = 1.0
SFX_Background_FadeIn_Volume_Add = 3.0
SFX_Background_FadingOut_Area = Default
SFX_Background_FadingOut_Checksum = Default
SFX_Background_FadeOut_Volume_Start = 100.0
SFX_Background_FadeOut_Volume_Target = 0.0
SFX_Background_FadeOut_Volume_Current = 100.0
SFX_Background_FadeOut_Volume_Subtract = 3.0
SFX_Background_CrossFade_Time = 0.75
Background_CrossFade_GameFrames = 90
Backgrounds_Master_Volume = 50.0
PleaseDOCrossfade = 1
SFX_Background_IS_Crossfading = FALSE
CurrentlyPlayingOneShotSoundEvent = audio_crowd_oneshots_do_nothing
CurrentOneShotWaitTime = 15

script Check_For_Specific_BGs_In_Struct 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Local_Var_Struct = ($SFX_Background_Requested_Area)
	if StructureContains structure = $Skate8_SFX_Background_Areas_And_States <Local_Var_Struct>
		Check_For_TOD_BGs_In_Struct <...>
	else
	endif
endscript

script Check_For_TOD_BGs_In_Struct 
	<current_time> = day
	this_current_TOD_name = <current_time>
	if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>) <this_current_TOD_name>
		Change SFX_Background_Requested_Checksum = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>.<this_current_TOD_name>)
	else
		if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>) Afternoon
			Change SFX_Background_Requested_Checksum = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>.Afternoon)
		else
			if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>) Default
				Change SFX_Background_Requested_Checksum = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>.Default)
			else
			endif
		endif
	endif
endscript

script Skate8_SFX_Background_Play \{crossfadetime = 0.7
		volpercentincrease = 0
		fadeintime = 0
		fadeouttime = 0
		fadeouttype = log_fast
		fadeintype = log_fast
		newvolumepercent = 100
		loading_transition = 0
		restarting = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait \{2
		gameframes}
	Change SFX_Background_FadeIn_Area = ($SFX_Background_Requested_Area)
	Change SFX_Background_FadeIn_Checksum = ($SFX_Background_Requested_Checksum)
	Change SFX_Background_FadingOut_Area = ($SFX_Background_Current_Area)
	Change SFX_Background_FadingOut_Checksum = ($SFX_Background_Current_Checksum)
	Local_Var_Struct_FadeIn_Area = ($SFX_Background_FadeIn_Area)
	Local_Var_Struct_FadeIn_Checksum = ($SFX_Background_FadeIn_Checksum)
	Local_Var_Struct_FadeOut_Area = ($SFX_Background_FadingOut_Area)
	Local_Var_Struct_FadeOut_Checksum = ($SFX_Background_FadingOut_Checksum)
	Change \{SFX_Background_CrossFade_Time = 0.75}
	printf channel = sfx qs(0x4cfc579c) s = <Local_Var_Struct_FadeIn_Area>
	if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>) Fade_From
		if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>.Fade_From) <Local_Var_Struct_FadeOut_Area>
			Change SFX_Background_CrossFade_Time = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>.Fade_From.<Local_Var_Struct_FadeOut_Area>)
		endif
	endif
	if (<fadeintime> = 0)
		fadeintime = $SFX_Background_CrossFade_Time
	endif
	if (<fadeouttime> = 0)
		fadeouttime = $SFX_Background_CrossFade_Time
	endif
	Change \{SFX_Background_FadeIn_Volume_Target = 100}
	if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>) Volume_Params
		if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>.Volume_Params) <Local_Var_Struct_FadeIn_Checksum>
			Change SFX_Background_FadeIn_Volume_Target = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>.Volume_Params.<Local_Var_Struct_FadeIn_Checksum>)
		endif
	endif
	if (<volpercentincrease> = 0)
		newvolumepercent = $SFX_Background_FadeIn_Volume_Target
	else
		newvolumepercent = ($SFX_Background_FadeIn_Volume_Target + <volpercentincrease>)
	endif
	AppendSuffixToChecksum Base = ($SFX_Background_Current_Checksum) SuffixString = '_FT'
	frontchecksumname = <appended_id>
	AppendSuffixToChecksum Base = ($SFX_Background_Current_Checksum) SuffixString = '_BK'
	backchecksumname = <appended_id>
	if NOT ($SFX_Background_Current_Checksum = $SFX_Background_Requested_Checksum)
		backgrounds_shared_logic new_fade_time = <fadeouttime> new_fade_type = <fadeouttype> <...>
		PlaySound <frontchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1 Priority = 105 buss = Crowd_Beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		if NOT ($g_crowd_in_jam_mode_song_state = 1)
			PlaySound <backchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = -1 pan2x = 1 pan2y = -1 Priority = 100 buss = Crowd_Beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		else
		endif
	else
		if issoundplaying <frontchecksumname>
			SetSoundParams <frontchecksumname> vol_percent = <newvolumepercent> time = <fadeintime> fade_type = <fadeouttype>
		else
			PlaySound <frontchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1 Priority = 105 buss = Crowd_Beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		endif
		if issoundplaying <backchecksumname>
			SetSoundParams <backchecksumname> vol_percent = <newvolumepercent> time = <fadeintime> fade_type = <fadeouttype>
		else
			PlaySound <backchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = -1 pan2x = 1 pan2y = -1 Priority = 100 buss = Crowd_Beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		endif
	endif
	if ($current_playing_transition = loading)
		if NOT ($SFX_Background_Requested_Checksum = Silence_Front_End_Crowd_Loop)
			SpawnScriptNow \{audio_crowd_kill_surging_scripts}
		endif
	else
		if ($g_crowd_transition_start_of_song_normal = 1)
			if NOT ($SFX_Background_Requested_Checksum = Silence_Front_End_Crowd_Loop)
				Change \{g_crowd_transition_start_of_song_normal = 0}
				if ScriptExists \{audio_crowd_loading_whistle}
					KillSpawnedScript \{Name = audio_crowd_loading_whistle}
				endif
				if ScriptExists \{crowd_loading_surge}
					KillSpawnedScript \{Name = crowd_loading_surge}
				endif
			endif
		endif
	endif
	if ($BackgroundSFXDebugPrintToScreen = 1)
		formatText TextName = my_text qs(0xc87eafca) n = ($SFX_Background_Requested_Checksum) DontAssertForChecksums
		create_panel_message {text = <my_text>
			Pos = (300.0, 30.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			id = SFX_BG_PANEL_MESSAGE
		}
	endif
	Change SFX_Background_Current_Area = ($SFX_Background_Requested_Area)
	Change SFX_Background_Current_Checksum = ($SFX_Background_Requested_Checksum)
	Change \{SFX_Background_Requested_Checksum = Default}
endscript

script backgrounds_shared_logic \{new_fade_time = 3
		new_fade_type = log_slow}
	stopsound <frontchecksumname> fade_time = <new_fade_time> fade_type = <new_fade_type>
	stopsound <backchecksumname> fade_time = <new_fade_time> fade_type = <new_fade_type>
	AppendSuffixToChecksum Base = ($SFX_Background_Requested_Checksum) SuffixString = '_FT'
	frontchecksumname = <appended_id>
	AppendSuffixToChecksum Base = ($SFX_Background_Requested_Checksum) SuffixString = '_BK'
	backchecksumname = <appended_id>
	return <...>
endscript

script One_Shot_SoundEvent \{waitTime = 15
		immediate = 0}
	if GotParam \{SoundEvent}
		RequestedSoundEvent = <SoundEvent>
	else
		RequestedSoundEvent = audio_crowd_oneshots_do_nothing
	endif
	LocalCurrentlyPlaying = $CurrentlyPlayingOneShotSoundEvent
	if (<LocalCurrentlyPlaying> = <RequestedSoundEvent>)
		if NOT ($CurrentOneShotWaitTime = <waitTime>)
			DoActualChangeingOfOneShots <...>
		endif
	else
		DoActualChangeingOfOneShots <...>
	endif
endscript

script DoActualChangeingOfOneShots \{immediate = 0}
	if IsSoundEventPlaying <LocalCurrentlyPlaying>
		WaitForOneShotSoundEventToEnd <...>
	endif
	KillSpawnedScript \{Name = SpawnedOneShotBeginRepeatLoop}
	SpawnScriptNow SpawnedOneShotBeginRepeatLoop params = {myoneshot = <RequestedSoundEvent> waitTime = <waitTime>}
	Change CurrentlyPlayingOneShotSoundEvent = <RequestedSoundEvent>
	Change CurrentOneShotWaitTime = <waitTime>
endscript

script SpawnedOneShotBeginRepeatLoop \{waitTime = 15}
	if NOT (<myoneshot> = audio_crowd_oneshots_do_nothing)
		Wait (RandomFloat (0.3, 0.5) * <waitTime>) Seconds
		begin
		if (($game_mode != practice) && ($calibrate_lag_enabled = 0))
			SoundEvent event = <myoneshot>
		else
			break
		endif
		begin
		if IsSoundEventPlaying <myoneshot>
			Wait \{1
				gameframe}
		else
			break
		endif
		repeat
		Wait (RandomFloat (0.9, 1.6) * <waitTime>) Seconds
		repeat
	else
	endif
endscript

script WaitForOneShotSoundEventToEnd \{immediate = 0}
	if (<immediate> = 1)
		printf \{qs(0xc32b16a8)}
		if (IsSoundEventPlaying <LocalCurrentlyPlaying>)
			StopSoundEvent <LocalCurrentlyPlaying>
		endif
		return
	endif
	begin
	if (IsSoundEventPlaying <LocalCurrentlyPlaying>)
	else
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript
