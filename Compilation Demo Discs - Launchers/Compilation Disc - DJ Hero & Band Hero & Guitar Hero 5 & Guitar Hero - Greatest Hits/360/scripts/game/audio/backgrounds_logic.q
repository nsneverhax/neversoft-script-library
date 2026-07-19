
script Skate8_SFX_Backgrounds_New_Area \{immediate = 0
		loading_transition = 0
		restarting = 0}
	printf channel = sfx qs("\LBG SFX Area =  %s") s = <BG_SFX_Area>
	change SFX_Background_Last_Area = <BG_SFX_Area>
	if (<immediate> = 0)
		Wait \{1
			gameframe}
	endif
	change SFX_Background_Requested_Area = <BG_SFX_Area>
	Check_For_Specific_BGs_In_Struct
	spawnscriptnow Skate8_SFX_Background_Play params = {loading_transition = <loading_transition> restarting = <restarting>}
endscript

script Skate8_SFX_Request_Background_Area_Change 
	change SFX_Background_Requested_Area = <BG_SFX_Area>
endscript
SFX_Background_Last_Area = `default`
SFX_Background_Requested_Area = `default`
SFX_Background_Requested_Checksum = `default`
SFX_Background_Requested_Volume = 60
SFX_Background_Current_Area = `default`
SFX_Background_Current_Checksum = `default`
SFX_Background_Current_Volume = 100
SFX_Background_Previous_Area = `default`
SFX_Background_Previous_Checksum = `default`
SFX_Background_FadeIn_Area = `default`
SFX_Background_FadeIn_Checksum = `default`
SFX_Background_FadeIn_Volume_Start = 1.0
SFX_Background_FadeIn_Volume_Target = 100.0
SFX_Background_FadeIn_Volume_Current = 1.0
SFX_Background_FadeIn_Volume_Add = 3.0
SFX_Background_FadingOut_Area = `default`
SFX_Background_FadingOut_Checksum = `default`
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
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	Local_Var_Struct = ($SFX_Background_Requested_Area)
	if StructureContains Structure = $Skate8_SFX_Background_Areas_And_States <Local_Var_Struct>
		Check_For_TOD_BGs_In_Struct <...>
	else
	endif
endscript

script Check_For_TOD_BGs_In_Struct 
	<current_time> = day
	this_current_TOD_name = <current_time>
	if StructureContains Structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>) <this_current_TOD_name>
		change SFX_Background_Requested_Checksum = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>.<this_current_TOD_name>)
	else
		if StructureContains Structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>) Afternoon
			change SFX_Background_Requested_Checksum = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>.Afternoon)
		else
			if StructureContains Structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>) `default`
				change SFX_Background_Requested_Checksum = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>.`default`)
			else
			endif
		endif
	endif
endscript

script Skate8_SFX_Background_Play \{crossfadetime = 0.7
		newvolumepercent = 100
		loading_transition = 0
		restarting = 0}
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	Wait \{2
		gameframes}
	change SFX_Background_FadeIn_Area = ($SFX_Background_Requested_Area)
	change SFX_Background_FadeIn_Checksum = ($SFX_Background_Requested_Checksum)
	change SFX_Background_FadingOut_Area = ($SFX_Background_Current_Area)
	change SFX_Background_FadingOut_Checksum = ($SFX_Background_Current_Checksum)
	Local_Var_Struct_FadeIn_Area = ($SFX_Background_FadeIn_Area)
	Local_Var_Struct_FadeIn_Checksum = ($SFX_Background_FadeIn_Checksum)
	Local_Var_Struct_FadeOut_Area = ($SFX_Background_FadingOut_Area)
	Local_Var_Struct_FadeOut_Checksum = ($SFX_Background_FadingOut_Checksum)
	change \{SFX_Background_CrossFade_Time = 0.75}
	if StructureContains Structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>) Fade_From
		if StructureContains Structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>.Fade_From) <Local_Var_Struct_FadeOut_Area>
			change SFX_Background_CrossFade_Time = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>.Fade_From.<Local_Var_Struct_FadeOut_Area>)
		endif
	endif
	crossfadetime = $SFX_Background_CrossFade_Time
	change \{SFX_Background_FadeIn_Volume_Target = 100}
	if StructureContains Structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>) Volume_Params
		if StructureContains Structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>.Volume_Params) <Local_Var_Struct_FadeIn_Checksum>
			change SFX_Background_FadeIn_Volume_Target = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>.Volume_Params.<Local_Var_Struct_FadeIn_Checksum>)
		endif
	endif
	newvolumepercent = $SFX_Background_FadeIn_Volume_Target
	AppendSuffixToChecksum Base = ($SFX_Background_Current_Checksum) SuffixString = '_FT'
	frontchecksumname = <appended_id>
	AppendSuffixToChecksum Base = ($SFX_Background_Current_Checksum) SuffixString = '_BK'
	backchecksumname = <appended_id>
	if NOT ($SFX_Background_Current_Checksum = $SFX_Background_Requested_Checksum)
		printf \{channel = sfx
			qs("\L**** fading out the old background")}
		Backgrounds_Shared_Logic new_fade_time = <crossfadetime> <...>
		printf \{channel = sfx
			qs("\L******** now starting NEW background looping sound %s")
			s = $SFX_Background_Requested_Checksum}
		PlaySound <frontchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1 priority = 105 buss = Crowd_Beds attack_time = <crossfadetime> attack_function = log_fast num_loops = -1
		if NOT ($crowd_in_jam_mode_song_state = 1)
			printf \{channel = sfx
				qs("\L******** crowd_in_jam_mode_song_state IS NOT equal to 1 - playing the rears")}
			PlaySound <backchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = -1 pan2x = 1 pan2y = -1 priority = 105 buss = Crowd_Beds attack_time = <crossfadetime> attack_function = log_fast num_loops = -1
		else
			printf \{channel = sfx
				qs("\L******** crowd_in_jam_mode_song_state IS equal to 1 - NOT playing the rears")}
		endif
	else
		printf \{channel = sfx
			qs("\L******** just using setsoundparams on currently playing sounds")}
		if issoundplaying <frontchecksumname>
			SetSoundParams <frontchecksumname> vol_percent = <newvolumepercent> time = <crossfadetime>
		else
			printf channel = sfx qs("\L******* Not playing %s, so going to start playing it now ********") s = <frontchecksumname>
			PlaySound <frontchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1 priority = 105 buss = Crowd_Beds attack_time = <crossfadetime> attack_function = log_fast num_loops = -1
		endif
		if issoundplaying <backchecksumname>
			SetSoundParams <backchecksumname> vol_percent = <newvolumepercent> time = <crossfadetime>
		else
			printf channel = sfx qs("\L******* Not playing %s, so going to start playing it now ********") s = <backchecksumname>
			PlaySound <backchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = -1 pan2x = 1 pan2y = -1 priority = 105 buss = Crowd_Beds attack_time = <crossfadetime> attack_function = log_fast num_loops = -1
		endif
	endif
	if ($current_playing_transition = loading)
		printf \{channel = sfx
			qs("\L**** going through the loading transition, and requesting this checksum %s")
			s = $SFX_Background_Requested_Checksum}
		if NOT ($SFX_Background_Requested_Checksum = Silence_Front_End_Crowd_Loop)
			printf \{channel = sfx
				qs("\L******** requested checksum DOES NOT equal Silence_Front_End_Crowd_Loop")}
			printf \{channel = sfx
				qs("\L******** Now killing Surging Scripts")}
			spawnscriptnow \{KillSurgingScripts}
		endif
	else
		if ($Crowd_Transition_Start_Of_Song_Normal = 1)
			printf \{channel = sfx
				qs("\L**** the currently playing transition is NOT loading, but Crowd_Transition_Start_Of_Song_Normal equals 1")}
			if NOT ($SFX_Background_Requested_Checksum = Silence_Front_End_Crowd_Loop)
				printf channel = sfx qs("\L******** requested checksum DOES NOT equal Silence_Front_End_Crowd_Loop fading out current background. front checksumname = %s") s = <frontchecksumname>
				printf \{channel = sfx
					qs("\L******** changing crowd_transition_start_of_song_normal to equal zero")}
				change \{Crowd_Transition_Start_Of_Song_Normal = 0}
				if ScriptExists \{Crowd_Loading_Whistle}
					printf \{channel = sfx
						qs("\L************ script Crowd_Loading_Whistle existed - killing it now")}
					KillSpawnedScript \{name = Crowd_Loading_Whistle}
				endif
				if ScriptExists \{Crowd_Loading_Surge}
					printf \{channel = sfx
						qs("\L************ script Crowd_Loading_Surge existed - killing it now")}
					KillSpawnedScript \{name = Crowd_Loading_Surge}
				endif
			endif
		endif
	endif
	if ($BackgroundSFXDebugPrintToScreen = 1)
		FormatText TextName = my_text qs("\LBG: %n") n = ($SFX_Background_Requested_Checksum) DontAssertForChecksums
		create_panel_message {text = <my_text>
			pos = (300.0, 30.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			id = SFX_BG_PANEL_MESSAGE
		}
	endif
	change SFX_Background_Current_Area = ($SFX_Background_Requested_Area)
	change SFX_Background_Current_Checksum = ($SFX_Background_Requested_Checksum)
	change \{SFX_Background_Requested_Checksum = `default`}
endscript

script Backgrounds_Shared_Logic \{new_fade_time = 3}
	StopSound <frontchecksumname> fade_time = <new_fade_time> fade_type = log_slow
	StopSound <backchecksumname> fade_time = <new_fade_time> fade_type = log_slow
	AppendSuffixToChecksum Base = ($SFX_Background_Requested_Checksum) SuffixString = '_FT'
	frontchecksumname = <appended_id>
	AppendSuffixToChecksum Base = ($SFX_Background_Requested_Checksum) SuffixString = '_BK'
	backchecksumname = <appended_id>
	return <...>
endscript

script One_Shot_SoundEvent \{waittime = 15
		immediate = 0}
	GetPakManCurrent \{map = zones}
	if NOT ((z_studio = <pak>) || (z_studio2 = <pak>) || (z_soundcheck = <pak>) || (z_board_room = <pak>))
		if GotParam \{SoundEvent}
			if ($crowd_in_Front_End_state = 0)
				RequestedSoundEvent = <SoundEvent>
			else
				RequestedSoundEvent = DoNothing_OneShot
			endif
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
	endif
endscript

script DoActualChangeingOfOneShots \{immediate = 0}
	if isSoundEventPlaying <LocalCurrentlyPlaying>
		WaitForOneShotSoundEventToEnd <...>
	endif
	KillSpawnedScript \{name = SpawnedOneShotBeginRepeatLoop}
	spawnscriptnow SpawnedOneShotBeginRepeatLoop params = {myoneshot = <RequestedSoundEvent> waittime = <waittime>}
	change CurrentlyPlayingOneShotSoundEvent = <RequestedSoundEvent>
	change CurrentOneShotWaitTime = <waittime>
endscript

script SpawnedOneShotBeginRepeatLoop \{waittime = 15}
	if NOT (<myoneshot> = DoNothing_OneShot)
		Wait (RandomFloat (0.3, 0.5) * <waittime>) seconds
		begin
		GetPakManCurrent \{map = zones}
		if NOT ((z_studio = <pak>) || (z_studio2 = <pak>) || ($crowd_in_Front_End_state = 1) || (z_soundcheck = <pak>) || (z_board_room = <pak>))
			SoundEvent event = <myoneshot>
			begin
			if isSoundEventPlaying <myoneshot>
				Wait \{1
					gameframe}
			else
				break
			endif
			repeat
			Wait (RandomFloat (0.9, 1.6) * <waittime>) seconds
		else
			break
		endif
		repeat
	else
	endif
endscript

script WaitForOneShotSoundEventToEnd \{immediate = 0}
	if (<immediate> = 1)
		printf \{qs("\LWaitForOneShotSoundEventToEnd IMMEDIATE")}
		if (isSoundEventPlaying <LocalCurrentlyPlaying>)
			StopSoundEvent <LocalCurrentlyPlaying>
		endif
		return
	endif
	begin
	if (isSoundEventPlaying <LocalCurrentlyPlaying>)
	else
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript
