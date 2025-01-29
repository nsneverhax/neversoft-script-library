
script Skate8_SFX_Backgrounds_New_Area \{immediate = 0
		fadeintime = 3
		fadeouttime = 3
		fadeouttype = log_slow
		fadeintype = log_fast
		volpercentincrease = 0
		loading_transition = 0
		restarting = 0}
	printf channel = sfx qs(0xa7f0b4b9) s = <BG_SFX_Area>
	GameMode_GetType
	if NOT (($IN_LOADING_SCREEN = 1) || (<type> = tutorial))
		Change SFX_Background_Last_Area = <BG_SFX_Area>
		if (<immediate> = 0)
			wait \{1
				gameframe}
		endif
		Change SFX_Background_Requested_Area = <BG_SFX_Area>
		Check_For_Specific_BGs_In_Struct
		spawnscriptnow Skate8_SFX_Background_Play params = {volpercentincrease = <volpercentincrease> fadeintime = <fadeintime> fadeouttime = <fadeouttime> fadeouttype = <fadeouttype> fadeintype = <fadeintype> loading_transition = <loading_transition> restarting = <restarting>}
	else
		Change \{SFX_Background_Last_Area = FrontEnd}
		if (<immediate> = 0)
			wait \{1
				gameframe}
		endif
		Change \{SFX_Background_Requested_Area = FrontEnd}
		Check_For_Specific_BGs_In_Struct
		spawnscriptnow Skate8_SFX_Background_Play params = {volpercentincrease = <volpercentincrease> fadeintime = <fadeintime> fadeouttime = <fadeouttime> fadeouttype = <fadeouttype> fadeintype = <fadeintype> loading_transition = <loading_transition> restarting = <restarting>}
	endif
endscript

script Skate8_SFX_Request_Background_Area_Change 
	Change SFX_Background_Requested_Area = <BG_SFX_Area>
endscript
SFX_Background_Last_Area = Default
SFX_Background_Requested_Area = Default
SFX_Background_Requested_Checksum = Default
SFX_Background_Requested_Volume = 60
SFX_Background_Current_Area = Default
SFX_Background_current_Checksum = Default
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
SFX_Background_IS_Crossfading = false
CurrentlyPlayingOneShotSoundEvent = DoNothing_OneShot
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
	wait \{2
		gameframes}
	Change SFX_Background_FadeIn_Area = ($SFX_Background_Requested_Area)
	Change SFX_Background_FadeIn_Checksum = ($SFX_Background_Requested_Checksum)
	Change SFX_Background_FadingOut_Area = ($SFX_Background_Current_Area)
	Change SFX_Background_FadingOut_Checksum = ($SFX_Background_current_Checksum)
	Local_Var_Struct_FadeIn_Area = ($SFX_Background_FadeIn_Area)
	Local_Var_Struct_FadeIn_Checksum = ($SFX_Background_FadeIn_Checksum)
	Local_Var_Struct_FadeOut_Area = ($SFX_Background_FadingOut_Area)
	Local_Var_Struct_FadeOut_Checksum = ($SFX_Background_FadingOut_Checksum)
	Change \{SFX_Background_CrossFade_Time = 0.75}
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
			printf \{channel = sfx
				qs(0xe0885199)
				s = $SFX_Background_FadeIn_Volume_Target}
		endif
	endif
	printf channel = sfx qs(0x05d910ec) s = <fadeintype>
	printf channel = sfx qs(0xdb5ca868) s = <fadeouttype>
	if (<volpercentincrease> = 0)
		newvolumepercent = $SFX_Background_FadeIn_Volume_Target
	else
		newvolumepercent = ($SFX_Background_FadeIn_Volume_Target + <volpercentincrease>)
		printf channel = sfx qs(0x8f6c28f0) s = <newvolumepercent>
	endif
	AppendSuffixToChecksum base = ($SFX_Background_current_Checksum) SuffixString = '_FT'
	frontchecksumname = <appended_id>
	AppendSuffixToChecksum base = ($SFX_Background_current_Checksum) SuffixString = '_BK'
	backchecksumname = <appended_id>
	if NOT ($SFX_Background_current_Checksum = $SFX_Background_Requested_Checksum)
		printf \{channel = sfx
			qs(0xf299651b)}
		Backgrounds_Shared_Logic new_fade_time = <fadeouttime> new_fade_type = <fadeouttype> <...>
		printf \{channel = sfx
			qs(0xb9f91bd6)
			s = $SFX_Background_Requested_Checksum}
		PlaySound <frontchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1 Priority = 105 buss = Crowd_beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		if NOT ($crowd_in_jam_mode_song_state = 1)
			printf \{channel = sfx
				qs(0x95d13fb2)}
			PlaySound <backchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = -1 pan2x = 1 pan2y = -1 Priority = 100 buss = Crowd_beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		else
			printf \{channel = sfx
				qs(0x3cad13d5)}
		endif
	else
		printf \{channel = sfx
			qs(0x2e8957c6)}
		if issoundplaying <frontchecksumname>
			SetSoundParams <frontchecksumname> vol_percent = <newvolumepercent> time = <fadeintime> fade_type = <fadeouttype>
		else
			printf channel = sfx qs(0x30987070) s = <frontchecksumname>
			PlaySound <frontchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1 Priority = 105 buss = Crowd_beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		endif
		if issoundplaying <backchecksumname>
			SetSoundParams <backchecksumname> vol_percent = <newvolumepercent> time = <fadeintime> fade_type = <fadeouttype>
		else
			printf channel = sfx qs(0x30987070) s = <backchecksumname>
			PlaySound <backchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = -1 pan2x = 1 pan2y = -1 Priority = 100 buss = Crowd_beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		endif
	endif
	if ($current_playing_transition = loading)
		printf \{channel = sfx
			qs(0x55587d03)
			s = $SFX_Background_Requested_Checksum}
		if NOT ($SFX_Background_Requested_Checksum = Silence_Front_End_Crowd_Loop)
			printf \{channel = sfx
				qs(0xb45f42e4)}
			printf \{channel = sfx
				qs(0x463d3bfa)}
			spawnscriptnow \{KillSurgingScripts}
		endif
	else
		if ($Crowd_Transition_Start_Of_Song_Normal = 1)
			printf \{channel = sfx
				qs(0x077fdfe1)}
			if NOT ($SFX_Background_Requested_Checksum = Silence_Front_End_Crowd_Loop)
				printf channel = sfx qs(0x9daa6935) s = <frontchecksumname>
				printf \{channel = sfx
					qs(0x84edbba2)}
				Change \{Crowd_Transition_Start_Of_Song_Normal = 0}
				if ScriptExists \{Crowd_Loading_Whistle}
					printf \{channel = sfx
						qs(0x50b1ed1f)}
					killspawnedscript \{name = Crowd_Loading_Whistle}
				endif
				if ScriptExists \{Crowd_Loading_Surge}
					printf \{channel = sfx
						qs(0x6cc40f41)}
					killspawnedscript \{name = Crowd_Loading_Surge}
				endif
			endif
		endif
	endif
	if ($BackgroundSFXDebugPrintToScreen = 1)
		FormatText TextName = my_text qs(0xc87eafca) n = ($SFX_Background_Requested_Checksum) DontAssertForChecksums
		create_panel_message {text = <my_text>
			Pos = (300.0, 30.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_A3
			time = 180000
			just = [left left]
			id = SFX_BG_PANEL_MESSAGE
		}
	endif
	Change SFX_Background_Current_Area = ($SFX_Background_Requested_Area)
	Change SFX_Background_current_Checksum = ($SFX_Background_Requested_Checksum)
	Change \{SFX_Background_Requested_Checksum = Default}
endscript

script Backgrounds_Shared_Logic \{new_fade_time = 3
		new_fade_type = log_slow}
	StopSound <frontchecksumname> fade_time = <new_fade_time> fade_type = <new_fade_type>
	StopSound <backchecksumname> fade_time = <new_fade_time> fade_type = <new_fade_type>
	AppendSuffixToChecksum base = ($SFX_Background_Requested_Checksum) SuffixString = '_FT'
	frontchecksumname = <appended_id>
	AppendSuffixToChecksum base = ($SFX_Background_Requested_Checksum) SuffixString = '_BK'
	backchecksumname = <appended_id>
	return <...>
endscript

script One_Shot_SoundEvent \{waittime = 15
		immediate = 0}
	if GotParam \{SoundEvent}
		RequestedSoundEvent = <SoundEvent>
	else
		RequestedSoundEvent = DoNothing_OneShot
	endif
	LocalCurrentlyPlaying = $CurrentlyPlayingOneShotSoundEvent
	if (<LocalCurrentlyPlaying> = <RequestedSoundEvent>)
		if NOT ($CurrentOneShotWaitTime = <waittime>)
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
	killspawnedscript \{name = SpawnedOneShotBeginRepeatLoop}
	spawnscriptnow SpawnedOneShotBeginRepeatLoop params = {myoneshot = <RequestedSoundEvent> waittime = <waittime>}
	Change CurrentlyPlayingOneShotSoundEvent = <RequestedSoundEvent>
	Change CurrentOneShotWaitTime = <waittime>
endscript

script SpawnedOneShotBeginRepeatLoop \{waittime = 15}
	if NOT (<myoneshot> = DoNothing_OneShot || $calibrate_lag_enabled = 1)
		GameMode_GetType
		if NOT (($IN_LOADING_SCREEN = 1) || (<type> = tutorial))
			wait (RandomFloat (0.3, 0.5) * <waittime>) seconds
			begin
			SoundEvent event = <myoneshot>
			begin
			if IsSoundEventPlaying <myoneshot>
				wait \{1
					gameframe}
			else
				break
			endif
			repeat
			wait (RandomFloat (0.9, 1.6) * <waittime>) seconds
			repeat
		endif
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
	wait \{1
		gameframe}
	repeat
endscript
