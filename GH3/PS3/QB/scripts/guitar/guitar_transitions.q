transition_playing = FALSE
current_playing_transition = NONE
Transition_Types = {
	INTRO = {
		textnl = 'intro'
	}
	FASTINTRO = {
		textnl = 'fastintro'
	}
	PRACTICE = {
		textnl = 'practice'
	}
	PREENCORE = {
		textnl = 'preencore'
	}
	ENCORE = {
		textnl = 'encore'
	}
	restartencore = {
		textnl = 'restartencore'
	}
	preboss = {
		textnl = 'preboss'
	}
	boss = {
		textnl = 'boss'
	}
	restartboss = {
		textnl = 'restartboss'
	}
	songWon = {
		textnl = 'songwon'
	}
	songlost = {
		textnl = 'songlost'
	}
}
Default_Immediate_Transition = {
	Time = 0
	ScriptTable = [
	]
}
Common_Immediate_Transition = {
	ScriptTable = [
		{
			Time = 0
			Scr = Transition_CameraCut
			Params = {
				prefix = 'cameras'
				changenow
			}
		}
		{
			Time = 100
			Scr = Transition_StartRendering
		}
	]
}
Default_FastIntro_Transition = {
	Time = 3000
	ScriptTable = [
	]
}
Common_FastIntro_Transition = {
	ScriptTable = [
		{
			Time = 0
			Scr = Transition_StopRendering
		}
		{
			Time = 0
			Scr = Transition_CameraCut
			Params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			Time = 0
			Scr = play_intro
			Params = {
				FAST
			}
		}
		{
			Time = 100
			Scr = Transition_StartRendering
		}
		{
			Time = 100
			Scr = enable_tutorial_pause
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_RestartEncore_Transition = {
	Time = 3000
	ScriptTable = [
	]
}
Common_RestartEncore_Transition = {
	ScriptTable = [
		{
			Time = 0
			Scr = Transition_StopRendering
		}
		{
			Time = 0
			Scr = Transition_CameraCut
			Params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			Time = 0
			Scr = play_intro
			Params = {
				FAST
			}
		}
		{
			Time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_RestartBoss_Transition = {
	Time = 3000
	ScriptTable = [
	]
}
Common_RestartBoss_Transition = {
	ScriptTable = [
		{
			Time = 0
			Scr = Transition_StopRendering
		}
		{
			Time = 0
			Scr = Transition_CameraCut
			Params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			Time = 0
			Scr = play_intro
			Params = {
				FAST
			}
		}
		{
			Time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_Practice_Transition = {
	Time = 5000
	ScriptTable = [
	]
}
Common_Practice_Transition = {
	ScriptTable = [
		{
			Time = 0
			Scr = Transition_StopRendering
		}
		{
			Time = 0
			Scr = Transition_CameraCut
			Params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			Time = 0
			Scr = play_intro
			Params = {
				PRACTICE
			}
		}
		{
			Time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_Intro_Transition = {
	Time = 8000
	ScriptTable = [
	]
}
Common_Intro_Transition = {
	ScriptTable = [
		{
			Time = 0
			Scr = Transition_StopRendering
		}
		{
			Time = 0
			Scr = Transition_CameraCut
			Params = {
				prefix = 'cameras_intro'
				changenow
			}
		}
		{
			Time = 0
			Scr = play_intro
			Params = {
			}
		}
		{
			Time = 1
			Scr = play_intro_anims
			Params = {
			}
		}
		{
			Time = 100
			Scr = Transition_StartRendering
		}
		{
			Time = 100
			Scr = GH_SFX_Intro_WarmUp
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_PreEncore_Transition = {
	Time = 8000
	ScriptTable = [
		{
			Time = 0
			Scr = Change_Crowd_Looping_SFX
			Params = {
				crowd_looping_state = GOOD
			}
		}
	]
}
Common_PreEncore_Transition = {
	ScriptTable = [
		{
			Time = 0
			Scr = play_win_anims
			Params = {
			}
		}
		{
			Time = 0
			Scr = play_outro
			Params = {
			}
		}
		{
			Time = 0
			Scr = Crowd_AllPlayAnim
			Params = {
				Anim = IDLE
			}
		}
		{
			Time = 0
			Scr = Transition_CameraCut
			Params = {
				prefix = 'cameras_preencore'
				changenow
			}
		}
		{
			Time = 0
			Scr = Change_Crowd_Looping_SFX
			Params = {
				crowd_looping_state = GOOD
			}
		}
	]
	EndWithDefaultCamera
}
Default_Encore_Transition = {
	Time = 5000
	ScriptTable = [
		{
			Time = 0
			Scr = play_intro
			Params = {
			}
		}
	]
}
Common_Encore_Transition = {
	ScriptTable = [
		{
			Time = 0
			Scr = Transition_StopRendering
		}
		{
			Time = 0
			Scr = Transition_CameraCut
			Params = {
				prefix = 'cameras_encore'
				changenow
			}
		}
		{
			Time = 0
			Scr = play_intro
			Params = {
			}
		}
		{
			Time = 1
			Scr = play_intro_anims
			Params = {
			}
		}
		{
			Time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_PreBoss_Transition = {
	Time = 8000
	ScriptTable = [
	]
}
Common_PreBoss_Transition = {
	ScriptTable = [
		{
			Time = 0
			Scr = play_win_anims
			Params = {
			}
		}
		{
			Time = 0
			Scr = play_outro
			Params = {
			}
		}
		{
			Time = 0
			Scr = Crowd_AllPlayAnim
			Params = {
				Anim = IDLE
			}
		}
		{
			Time = 0
			Scr = Transition_CameraCut
			Params = {
				prefix = 'cameras_preboss'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
Default_Boss_Transition = {
	Time = 8000
	ScriptTable = [
	]
}
Common_Boss_Transition = {
	ScriptTable = [
		{
			Time = 0
			Scr = Transition_StopRendering
		}
		{
			Time = 0
			Scr = Transition_CameraCut
			Params = {
				prefix = 'cameras_boss'
				changenow
			}
		}
		{
			Time = 0
			Scr = play_intro
			Params = {
			}
		}
		{
			Time = 1
			Scr = play_intro_anims
			Params = {
			}
		}
		{
			Time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_SongWon_Transition = {
	Time = 8000
	ScriptTable = [
	]
}
Common_SongWon_Transition = {
	ScriptTable = [
		{
			Time = 0
			Scr = play_win_anims
			Params = {
			}
		}
		{
			Time = 0
			Scr = play_outro
			Params = {
				kill_cameracuts_iterator
			}
		}
		{
			Time = 0
			Scr = Crowd_AllPlayAnim
			Params = {
				Anim = IDLE
			}
		}
		{
			Time = 0
			Scr = Transition_CameraCut
			Params = {
				prefix = 'cameras_win'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
Default_SongLost_Transition = {
	Time = 8000
	ScriptTable = [
	]
}
Common_SongLost_Transition = {
	ScriptTable = [
		{
			Time = 0
			Scr = play_lose_anims
			Params = {
			}
		}
		{
			Time = 0
			Scr = Change_Crowd_Looping_SFX
			Params = {
				crowd_looping_state = Bad
			}
		}
		{
			Time = 0
			Scr = play_outro
			Params = {
				kill_cameracuts_iterator
				song_failed_pitch_streams = 1
			}
		}
		{
			Time = 0
			Scr = Crowd_AllPlayAnim
			Params = {
				Anim = IDLE
			}
		}
		{
			Time = 0
			Scr = Transition_CameraCut
			Params = {
				prefix = 'cameras_lose'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}

script Transition_SelectTransition \{practice_intro = 0}
	if (<practice_intro> = 1)
		return
	endif
	if ($current_transition = debugintro)
		Change \{current_transition = INTRO}
		return
	endif
	if ($game_mode = p1_career ||
			$game_mode = p2_career)
		get_progression_globals game_mode = ($game_mode) use_current_tab = 1
		Career_Songs = <tier_global>
		Tier = ($setlist_selection_tier)
		FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
		if NOT StructureContains Structure = ($<Career_Songs>) <tier_checksum>
			Change \{current_transition = INTRO}
			return
		endif
		if Progression_IsBossSong tier_global = <tier_global> Tier = <Tier> Song = ($current_song)
			if should_play_boss_intro
				if NOT ($current_song = bossdevil)
					Change \{current_transition = boss}
				else
					Change \{current_transition = FASTINTRO}
				endif
			else
				Change \{current_transition = FASTINTRO}
			endif
			return
		endif
		if Progression_IsEncoreSong tier_global = <tier_global> Tier = <Tier> Song = ($current_song)
			Change \{current_transition = ENCORE}
			return
		endif
	endif
	if ($game_mode = p1_quickplay)
		get_progression_globals game_mode = ($game_mode) use_current_tab = 1
		SetList_Songs = <tier_global>
		Tier = ($setlist_selection_tier)
		FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
		if NOT StructureContains Structure = ($<SetList_Songs>) <tier_checksum>
			Change \{current_transition = INTRO}
			return
		endif
	endif
	Change \{current_transition = INTRO}
endscript

script Transition_KillAll 
	KillSpawnedScript \{Id = Transitions}
	Change \{transition_playing = FALSE}
	Change \{current_playing_transition = NONE}
endscript

script Transition_GetTime \{Type = INTRO}
	if StructureContains Structure = $Transition_Types <Type>
		PrintStruct <...>
		type_textnl = ($Transition_Types.<Type>.textnl)
	else
		PrintStruct <...>
		ScriptAssert \{"Unknown transition type"}
	endif
	GetPakManCurrentName \{map = Zones}
	FormatText ChecksumName = Transition_Props '%s_%p_Transition' P = <type_textnl> S = <pakname>
	if NOT GlobalExists Name = <Transition_Props>
		FormatText ChecksumName = Transition_Props 'default_%p_Transition' P = <type_textnl> S = <pakname>
	endif
	return transition_time = ($<Transition_Props>.Time)
endscript

script Transition_Play \{Type = INTRO}
	Transition_KillAll
	Change current_playing_transition = <Type>
	if StructureContains Structure = $Transition_Types <Type>
		type_textnl = ($Transition_Types.<Type>.textnl)
	else
		PrintStruct <...>
		ScriptAssert \{"Unknown transition type"}
	endif
	GetPakManCurrentName \{map = Zones}
	FormatText ChecksumName = Event 'Common_%p_TransitionSetup' P = <type_textnl> S = <pakname>
	if ScriptExists <Event>
		<Event>
	endif
	FormatText ChecksumName = Event '%s_%p_TransitionSetup' P = <type_textnl> S = <pakname>
	if ScriptExists <Event>
		<Event>
	endif
	SpawnScriptNow Transition_Play_Spawned Id = Transitions Params = {<...>}
	FormatText ChecksumName = Event 'GuitarEvent_Transition%s' S = <type_textnl>
	if ScriptExists <Event>
		SpawnScriptNow <Event>
	endif
endscript

script Transition_Play_Spawned 
	Change \{transition_playing = TRUE}
	GetPakManCurrentName \{map = Zones}
	FormatText ChecksumName = Transition_Props '%s_%p_Transition' P = <type_textnl> S = <pakname>
	if NOT GlobalExists Name = <Transition_Props>
		FormatText ChecksumName = Transition_Props 'default_%p_Transition' P = <type_textnl>
		if NOT GlobalExists Name = <Transition_Props>
			PrintStruct <...>
			ScriptAssert \{"Default Transition Struct not found"}
		endif
	endif
	transition_time = ($<Transition_Props>.Time)
	SpawnScriptNow Transition_Play_Iterator Id = Transitions Params = {<...>}
	FormatText ChecksumName = Transition_Props 'Common_%p_Transition' P = <type_textnl>
	SpawnScriptNow Transition_Play_Iterator Id = Transitions Params = {<...>}
	GetSongTimeMS
	time_offset = (0 - <Time>)
	begin
	GetSongTimeMS time_offset = <time_offset>
	if (<transition_time> <= <Time>)
		Change \{transition_playing = FALSE}
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	if StructureContains Structure = ($<Transition_Props>) EndWithDefaultCamera
		if StructureContains Structure = ($<Transition_Props>) SyncWithNoteCameras
			CameraCuts_GetNextNoteCameraTime
			GetSongTimeMS
			if (<camera_time> >= 0 &&
					<camera_time> - <Time> < 2000)
				CameraCuts_EnableChangeCam \{Enable = FALSE}
			else
				if NOT ($game_mode = training)
					CameraCuts_SetArrayPrefix \{prefix = 'cameras'
						changenow}
				else
					CameraCuts_EnableChangeCam \{Enable = FALSE}
				endif
			endif
		else
			if NOT ($game_mode = training)
				CameraCuts_SetArrayPrefix \{prefix = 'cameras'
					changenow}
			else
				CameraCuts_EnableChangeCam \{Enable = FALSE}
			endif
		endif
	endif
	FormatText ChecksumName = Event 'Common_%p_TransitionEnd' P = <type_textnl> S = <pakname>
	if ScriptExists <Event>
		SpawnScriptNow <Event>
	endif
	FormatText ChecksumName = Event '%s_%p_TransitionEnd' P = <type_textnl> S = <pakname>
	if ScriptExists <Event>
		SpawnScriptNow <Event>
	endif
	Change \{current_playing_transition = NONE}
endscript

script Transition_Play_Iterator 
	GetSongTimeMS
	time_offset = (0 - <Time>)
	GetArraySize ($<Transition_Props>.ScriptTable)
	if (<array_Size> = 0)
		return
	endif
	GetSongTimeMS time_offset = <time_offset>
	array_count = 0
	begin
	begin
	GetSongTimeMS time_offset = <time_offset>
	if ($<Transition_Props>.ScriptTable [<array_count>].Time <= <Time>)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	if ScriptExists ($<Transition_Props>.ScriptTable [<array_count>].Scr)
		SpawnScriptNow ($<Transition_Props>.ScriptTable [<array_count>].Scr) Id = Transitions Params = {transition_time = <transition_time> ($<Transition_Props>.ScriptTable [<array_count>].Params)}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script Transition_Wait 
	begin
	if ($transition_playing = FALSE)
		return
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script Transition_PlayAnim \{CYCLE = 0}
	<Obj> :Obj_SwitchScript Transition_PlayAnim_Spawned Params = {Anim = <Anim> CYCLE = <CYCLE> BlendDuration = <BlendDuration>}
endscript

script Transition_PlayAnim_Spawned 
	begin
	GameObj_PlayAnim Anim = <Anim> BlendDuration = <BlendDuration>
	GameObj_WaitAnimFinished
	if (<CYCLE> = 0)
		break
	endif
	repeat
endscript

script Transition_CameraCut 
	CameraCuts_SetArrayPrefix <...> Length = <transition_time>
endscript

script Transition_StopRendering 
	Printf \{"Transition_StopRendering"}
	StopRendering
endscript

script Transition_StartRendering 
	Printf \{"Transition_StartRendering"}
	StartRendering
	enable_pause
	Change \{is_changing_levels = 0}
	if ($blade_active = 1)
		gh3_start_pressed
	endif
endscript

script Transition_Printf 
	Printf <...>
endscript

script Transitions_ResetZone 
	Printf \{"Transitions_ResetZone"}
	GetPakManCurrentName \{map = Zones}
	FormatText ChecksumName = reset_func '%s_ResetTransition' S = <pakname>
	if ScriptExists <reset_func>
		<reset_func>
	endif
	FormatText ChecksumName = nodearray_checksum '%s_NodeArray' S = <pakname>
	if NOT GlobalExists Name = <nodearray_checksum> Type = Array
		return
	endif
	GetArraySize $<nodearray_checksum>
	array_count = 0
	begin
	resetvalid = TRUE
	if StructureContains Structure = ($<nodearray_checksum> [<array_count>]) CreatedFromVariable
		resetvalid = FALSE
	endif
	if StructureContains Structure = ($<nodearray_checksum> [<array_count>]) CreatedOnProgress
		resetvalid = FALSE
	endif
	if StructureContains Structure = ($<nodearray_checksum> [<array_count>]) Class
		if NOT ($<nodearray_checksum> [<array_count>].Class = GameObject ||
				$<nodearray_checksum> [<array_count>].Class = LevelGeometry)
			resetvalid = FALSE
		endif
	else
		resetvalid = FALSE
	endif
	if (<resetvalid> = TRUE)
		Printf "Resetting %s" S = ($<nodearray_checksum> [<array_count>].Name)
		Kill Name = ($<nodearray_checksum> [<array_count>].Name)
		if StructureContains Structure = ($<nodearray_checksum> [<array_count>]) CreatedAtStart
			Create Name = ($<nodearray_checksum> [<array_count>].Name)
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script Common_PreEncore_TransitionSetup 
	PreEncore_Crowd_Build_SFX
	Change_Crowd_Looping_SFX \{crowd_looping_state = GOOD}
endscript

script Common_PreEncore_TransitionEnd 
endscript

script Common_Encore_TransitionSetup 
	GH_SFX_Play_Encore_Audio_From_Zone_Memory
endscript

script Common_Boss_TransitionSetup 
	GH_SFX_Play_Boss_Audio_From_Zone_Memory
endscript

script Common_Encore_TransitionEnd 
endscript

script Preload_Encore_Bink_Audio \{movie_name = 'z_artdeco_encore_audio'}
endscript
