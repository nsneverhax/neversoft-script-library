transition_playing = FALSE
current_playing_transition = None
Transition_Types = {
	Intro = {
		textnl = 'intro'
	}
	fastintro = {
		textnl = 'fastintro'
	}
	practice = {
		textnl = 'practice'
	}
	preencore = {
		textnl = 'preencore'
	}
	preaerosmith = {
		textnl = 'preaerosmith'
	}
	ENCORE = {
		textnl = 'encore'
	}
	aerosmith_entrance = {
		textnl = 'aerosmith_entrance'
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
	songwon = {
		textnl = 'songwon'
	}
	songlost = {
		textnl = 'songlost'
	}
	dmcintro = {
		textnl = 'dmcintro'
	}
}
Default_Immediate_Transition = {
	time = 0
	ScriptTable = [
	]
}
Common_Immediate_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras'
				changenow
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
}
Default_FastIntro_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_FastIntro_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = super_shakin_guitar_unhide
		}
		{
			time = 0
			Scr = play_intro
			params = {
				FAST
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
		{
			time = 100
			Scr = enable_tutorial_pause
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_RestartEncore_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_RestartEncore_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				FAST
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_RestartBoss_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_RestartBoss_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				FAST
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_Practice_Transition = {
	time = 5000
	ScriptTable = [
	]
}
Common_Practice_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				practice
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_Intro_Transition = {
	time = 8000
	ScriptTable = [
		{
			time = 0
			Scr = super_shakin_guitar_unhide
		}
	]
}
Common_Intro_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_intro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 0
			Scr = super_shakin_guitar_unhide
		}
		{
			time = 1
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
		{
			time = 100
			Scr = GH_SFX_Intro_WarmUp
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_PreEncore_Transition = {
	time = 8000
	ScriptTable = [
		{
			time = 0
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = good
			}
		}
	]
}
Common_PreEncore_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = play_outro
			params = {
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				anim = Idle
			}
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_preencore'
				changenow
			}
		}
		{
			time = 0
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = good
			}
		}
	]
	EndWithDefaultCamera
}
default_preaerosmith_transition = {
	time = 8000
	ScriptTable = [
		{
			time = 0
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = good
			}
		}
	]
}
common_preaerosmith_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = play_outro
			params = {
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				anim = Idle
			}
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_preaerosmith'
				changenow
			}
		}
		{
			time = 0
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = good
			}
		}
	]
	EndWithDefaultCamera
}
Default_Encore_Transition = {
	time = 5000
	ScriptTable = [
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
	]
}
Common_Encore_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_encore'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 1
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
default_aerosmith_entrance_transition = {
	time = 13000
	ScriptTable = [
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
	]
}
common_aerosmith_entrance_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_aerosmith_entrance'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 1
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_PreBoss_Transition = {
	time = 8000
	ScriptTable = [
	]
}
Common_PreBoss_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = play_outro
			params = {
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				anim = Idle
			}
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_preboss'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
Default_Boss_Transition = {
	time = 9000
	ScriptTable = [
		{
			time = 1
			Scr = Band_PlaySimpleAnim
			params = {
				Name = BASSIST
				anim = gh3_guit_joep_boss_intro
			}
		}
	]
}
Common_Boss_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_boss'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 1
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_SongWon_Transition = {
	time = 8000
	ScriptTable = [
	]
}
Common_SongWon_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = play_outro
			params = {
				kill_cameracuts_iterator
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				anim = Idle
			}
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_win'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
Default_SongLost_Transition = {
	time = 8000
	ScriptTable = [
	]
}
Common_SongLost_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_lose_anims
			params = {
			}
		}
		{
			time = 0
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = bad
			}
		}
		{
			time = 0
			Scr = play_outro
			params = {
				kill_cameracuts_iterator
				song_failed_pitch_streams = 1
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				anim = Idle
			}
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_lose'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
default_dmcintro_transition = {
	time = 8000
	ScriptTable = [
	]
}
common_dmcintro_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_intro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 1
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
		{
			time = 100
			Scr = GH_SFX_Intro_WarmUp
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}

script Transition_SelectTransition \{practice_intro = 0}
	if (<practice_intro> = 1)
		return
	endif
	if ($current_transition = debugintro)
		Change \{current_transition = Intro}
		return
	endif
	if ($coop_dlc_active = 1)
		Change \{current_transition = Intro}
		return
	endif
	if ($current_num_players = 1 &&
			$current_song = kingofrock &&
			$current_level = load_z_nine_lives)
		Change \{current_transition = dmcintro}
		return
	endif
	if ($game_mode = p1_career)
		get_progression_globals game_mode = ($game_mode) use_current_tab = 1
		Career_Songs = <tier_global>
		Tier = ($setlist_selection_tier)
		formatText checksumName = tier_checksum 'tier%s' s = <Tier>
		if NOT StructureContains structure = ($<Career_Songs>) <tier_checksum>
			Change \{current_transition = Intro}
			return
		endif
		if Progression_IsBossSong tier_global = <tier_global> Tier = <Tier> song = ($current_song)
			if should_play_boss_intro
				if NOT ($current_song = bossdevil)
					Change \{current_transition = boss}
				else
					Change \{current_transition = fastintro}
				endif
			else
				Change \{current_transition = fastintro}
			endif
			return
		endif
		if Progression_IsEncoreSong tier_global = <tier_global> Tier = <Tier> song = ($current_song)
			Change \{current_transition = ENCORE}
			return
		endif
		if progression_isfirstaerosmithsong tier_global = <tier_global> Tier = <Tier> song = ($current_song)
			Change \{current_transition = aerosmith_entrance}
			return
		endif
	endif
	if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
		get_progression_globals game_mode = ($game_mode) use_current_tab = 1
		SetList_Songs = <tier_global>
		Tier = ($setlist_selection_tier)
		formatText checksumName = tier_checksum 'tier%s' s = <Tier>
		if NOT StructureContains structure = ($<SetList_Songs>) <tier_checksum>
			Change \{current_transition = Intro}
			return
		endif
	endif
	Change \{current_transition = Intro}
endscript

script Transition_KillAll 
	KillSpawnedScript \{id = transitions}
	Change \{transition_playing = FALSE}
	Change \{current_playing_transition = None}
endscript

script Transition_GetTime \{Type = Intro}
	if StructureContains structure = $Transition_Types <Type>
		printstruct <...>
		type_textnl = ($Transition_Types.<Type>.textnl)
	else
		printstruct <...>
		ScriptAssert \{"Unknown transition type"}
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = Transition_Props '%s_%p_Transition' p = <type_textnl> s = <pakname>
	if NOT GlobalExists Name = <Transition_Props>
		formatText checksumName = Transition_Props 'default_%p_Transition' p = <type_textnl> s = <pakname>
	endif
	return transition_time = ($<Transition_Props>.time)
endscript

script Transition_Play \{Type = Intro}
	Transition_KillAll
	Change current_playing_transition = <Type>
	if StructureContains structure = $Transition_Types <Type>
		type_textnl = ($Transition_Types.<Type>.textnl)
	else
		printstruct <...>
		ScriptAssert \{"Unknown transition type"}
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = event 'Common_%p_TransitionSetup' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		<event>
	endif
	formatText checksumName = event '%s_%p_TransitionSetup' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		<event>
	endif
	SpawnScriptNow Transition_Play_Spawned id = transitions params = {<...>}
	formatText checksumName = event 'GuitarEvent_Transition%s' s = <type_textnl>
	if ScriptExists <event>
		SpawnScriptNow <event>
	endif
endscript

script Transition_Play_Spawned 
	Change \{transition_playing = true}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = Transition_Props '%s_%p_Transition' p = <type_textnl> s = <pakname>
	if NOT GlobalExists Name = <Transition_Props>
		formatText checksumName = Transition_Props 'default_%p_Transition' p = <type_textnl>
		if NOT GlobalExists Name = <Transition_Props>
			printstruct <...>
			ScriptAssert \{"Default Transition Struct not found"}
		endif
	endif
	transition_time = ($<Transition_Props>.time)
	SpawnScriptNow Transition_Play_Iterator id = transitions params = {<...>}
	formatText checksumName = Transition_Props 'Common_%p_Transition' p = <type_textnl>
	SpawnScriptNow Transition_Play_Iterator id = transitions params = {<...>}
	GetSongTimeMs
	time_offset = (0 - <time>)
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<transition_time> <= <time>)
		Change \{transition_playing = FALSE}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if StructureContains structure = ($<Transition_Props>) EndWithDefaultCamera
		if StructureContains structure = ($<Transition_Props>) SyncWithNoteCameras
			CameraCuts_GetNextNoteCameraTime
			GetSongTimeMs
			if (<camera_time> >= 0 &&
					<camera_time> - <time> < 2000)
				CameraCuts_EnableChangeCam \{enable = FALSE}
			else
				if NOT ($game_mode = training)
					CameraCuts_SetArrayPrefix \{prefix = 'cameras'
						changenow}
				else
					CameraCuts_EnableChangeCam \{enable = FALSE}
				endif
			endif
		else
			if NOT ($game_mode = training)
				CameraCuts_SetArrayPrefix \{prefix = 'cameras'
					changenow}
			else
				CameraCuts_EnableChangeCam \{enable = FALSE}
			endif
		endif
	endif
	formatText checksumName = event 'Common_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		SpawnScriptNow <event>
	endif
	formatText checksumName = event '%s_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		SpawnScriptNow <event>
	endif
	Change \{current_playing_transition = None}
endscript

script Transition_Play_Iterator 
	GetSongTimeMs
	time_offset = (0 - <time>)
	GetArraySize ($<Transition_Props>.ScriptTable)
	if (<array_Size> = 0)
		return
	endif
	GetSongTimeMs time_offset = <time_offset>
	array_count = 0
	begin
	begin
	GetSongTimeMs time_offset = <time_offset>
	if ($<Transition_Props>.ScriptTable [<array_count>].time <= <time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ScriptExists ($<Transition_Props>.ScriptTable [<array_count>].Scr)
		SpawnScriptNow ($<Transition_Props>.ScriptTable [<array_count>].Scr) id = transitions params = {transition_time = <transition_time> ($<Transition_Props>.ScriptTable [<array_count>].params)}
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
		gameframe}
	repeat
endscript

script specialcamera_playanim \{cycle = 0}
	SetSearchAllAssetContexts
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	formatText TextName = suffix '_%s' s = <Obj>
	AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
	cameraname = (<pakname> + <suffix>)
	if CompositeObjectExists Name = <appended_id>
		<appended_id> :Obj_SwitchScript specialcamera_playanim_spawned params = {anim = <anim> cycle = <cycle> BlendDuration = <BlendDuration>}
	else
		printf "Unable to find SpecialCamera %s...." s = <cameraname>
	endif
	SetSearchAllAssetContexts \{OFF}
endscript

script specialcamera_playanim_spawned 
	begin
	SetSearchAllAssetContexts
	GameObj_PlayAnim anim = <anim> BlendDuration = <BlendDuration>
	GameObj_WaitAnimFinished
	SetSearchAllAssetContexts \{OFF}
	if (<cycle> = 0)
		break
	endif
	repeat
endscript

script Transition_PlayAnim \{cycle = 0}
	<Obj> :Obj_SwitchScript Transition_PlayAnim_Spawned params = {anim = <anim> cycle = <cycle> BlendDuration = <BlendDuration>}
endscript

script Transition_PlayAnim_Spawned 
	begin
	GameObj_PlayAnim anim = <anim> BlendDuration = <BlendDuration>
	GameObj_WaitAnimFinished
	if (<cycle> = 0)
		break
	endif
	repeat
endscript

script Transition_CameraCut 
	CameraCuts_SetArrayPrefix <...> length = <transition_time>
endscript

script Transition_StopRendering 
	printf \{"Transition_StopRendering"}
	StopRendering
endscript

script Transition_StartRendering 
	printf \{"Transition_StartRendering"}
	StartRendering
	enable_pause
	Change \{is_changing_levels = 0}
	if ($blade_active = 1)
		Change \{blade_active = 0}
		gh3_start_pressed
	endif
endscript

script Transition_Printf 
	printf <...>
endscript

script Transitions_ResetZone 
	printf \{"Transitions_ResetZone"}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = reset_func '%s_ResetTransition' s = <pakname>
	if ScriptExists <reset_func>
		<reset_func>
	endif
	formatText checksumName = nodearray_checksum '%s_NodeArray' s = <pakname>
	if NOT GlobalExists Name = <nodearray_checksum> Type = array
		return
	endif
	GetArraySize $<nodearray_checksum>
	array_count = 0
	begin
	resetvalid = true
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedFromVariable
		resetvalid = FALSE
	endif
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedOnProgress
		resetvalid = FALSE
	endif
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) Class
		if NOT ($<nodearray_checksum> [<array_count>].Class = GameObject ||
				$<nodearray_checksum> [<array_count>].Class = LevelGeometry ||
				$<nodearray_checksum> [<array_count>].Class = LevelObject)
			resetvalid = FALSE
		endif
	else
		resetvalid = FALSE
	endif
	if (<resetvalid> = true)
		printf "Resetting %s" s = ($<nodearray_checksum> [<array_count>].Name)
		kill Name = ($<nodearray_checksum> [<array_count>].Name)
		if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedAtStart
			create Name = ($<nodearray_checksum> [<array_count>].Name)
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script Common_PreEncore_TransitionSetup 
	PreEncore_Crowd_Build_SFX
	Change_Crowd_Looping_SFX \{crowd_looping_state = good}
endscript

script Common_PreEncore_TransitionEnd 
endscript

script common_preaerosmith_transitionsetup 
	preaerosmith_crowd_build_sfx
	Change_Crowd_Looping_SFX \{crowd_looping_state = good}
endscript

script common_preaerosmith_transitionend 
endscript

script common_aerosmith_entrance_transitionsetup 
	gh_sfx_play_aerosmith_entrance_audio_from_zone_memory
endscript

script common_dmcintro_transitionsetup 
	gh_sfx_play_dmcintro_audio_from_zone_memory
endscript

script Common_Encore_TransitionSetup 
	GH_SFX_Play_Encore_Audio_From_Zone_Memory
endscript

script Common_Boss_TransitionSetup 
	GH_SFX_Play_Boss_Audio_From_Zone_Memory
endscript

script common_aerosmith_entrance_transitionend 
endscript

script Common_Encore_TransitionEnd 
endscript

script Preload_Encore_Bink_Audio \{movie_name = 'z_artdeco_encore_audio'}
endscript
