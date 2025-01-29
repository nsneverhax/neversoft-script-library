transition_playing = FALSE
current_playing_transition = None
finalbandintro_transition_playing = 0
setlist_selection_tier = 1
Transition_Types = {
	Intro = {
		textnl = 'intro'
	}
	fastintro = {
		textnl = 'fastintro'
	}
	fastintrotutorial = {
		textnl = 'fastintrotutorial'
	}
	practice = {
		textnl = 'practice'
	}
	preencore = {
		textnl = 'preencore'
	}
	ENCORE = {
		textnl = 'encore'
	}
	restartencore = {
		textnl = 'restartencore'
	}
	songwon = {
		textnl = 'songwon'
	}
	songwonfreeplay = {
		textnl = 'songwonfreeplay'
	}
	songdoneattract = {
		textnl = 'songdoneattract'
	}
	songoutro = {
		textnl = 'songoutro'
	}
	songlost = {
		textnl = 'songlost'
	}
	loading = {
		textnl = 'loading'
	}
	onlineloading = {
		textnl = 'onlineloading'
	}
	loadingintro = {
		textnl = 'loadingintro'
	}
	finalbandintro = {
		textnl = 'finalbandintro'
	}
	finalbandoutro = {
		textnl = 'finalbandoutro'
	}
	celebintro = {
		textnl = 'celebintro'
	}
	careerbandswap = {
		textnl = 'careerbandswap'
	}
	transformationencore = {
		textnl = 'transformationencore'
	}
	rushintro = {
		textnl = 'rushintro'
	}
	rushoutro = {
		textnl = 'rushoutro'
	}
	finalbattleintro = {
		textnl = 'finalbattleintro'
	}
	finalbattleoutro = {
		textnl = 'finalbattleoutro'
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
			time = 0
			Scr = play_win_anims
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
			Scr = audio_crowd_play_intro_applause_and_swell
		}
		{
			time = 0
			Scr = play_intro_anims
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
			Scr = forcecamerachangeforfreeplayintro
		}
		{
			time = 166
			Scr = tutorial_enable_pause
		}
		{
			time = 166
			Scr = Transition_StartRendering
		}
		{
			time = 2000
			Scr = bohemianrhapsody_hack
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
default_fastintrotutorial_transition = {
	time = 3000
	ScriptTable = [
	]
}
common_fastintrotutorial_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			Scr = play_intro
			params = {
				FAST
			}
		}
		{
			time = 0
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
			Scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			Scr = audio_crowd_play_intro_applause_and_swell
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
			time = 0
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
			Scr = bandmanager_setplayingintroanims
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
	time = 20000
	ScriptTable = [
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
			Scr = audio_crowd_play_intro_applause_and_swell
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
			Scr = start_preloaded_intro_stream
		}
		{
			time = 100
			Scr = audio_gameplay_intro_sfx_warmup
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
default_finalbandintro_transition = {
	time = 20000
	ScriptTable = [
	]
}
common_finalbandintro_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_finalbandintro'
				changenow
			}
		}
		{
			time = 60
			Scr = start_preloaded_celeb_intro_stream
		}
		{
			time = 60
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_PreEncore_Transition = {
	time = 10000
	ScriptTable = [
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
			Scr = kill_gem_scroller
			params = {
				Type = outro
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
				prefix = 'cameras_no_band'
				changenow
				transition_time = 5
				extra_params = {
					force_time = 5
				}
			}
		}
		{
			time = 100
			Scr = CameraCuts_EnableChangeCam
			params = {
				enable = FALSE
			}
		}
	]
	EndWithDefaultCamera
}
Default_Encore_Transition = {
	time = 5000
	ScriptTable = [
	]
}
Common_Encore_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				anim = Idle
			}
		}
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_moments'
				changenow
				Name = moment01
			}
		}
		{
			time = 100
			Scr = start_preloaded_encore_event_stream
		}
		{
			time = 366
			Scr = Transition_StartRendering
			params = {
				no_curtain = 1
			}
		}
	]
	endwithscript = end_song_after_transformation
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_SongWon_Transition = {
	time = 7000
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
			Scr = kill_gem_scroller
			params = {
				Type = outro
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
default_songwonfreeplay_transition = {
	time = 5000
	ScriptTable = [
	]
}
common_songwonfreeplay_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				Type = outro
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
		{
			time = 0
			Scr = freeplay_create_stats_ui
			params = {
			}
		}
	]
	EndWithDefaultCamera
}
default_songdoneattract_transition = {
	time = 1000
	ScriptTable = [
	]
}
common_songdoneattract_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				Type = outro
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
				prefix = 'cameras_no_band'
				changenow
				transition_time = 5
				extra_params = {
					force_time = 5
				}
			}
		}
		{
			time = 100
			Scr = CameraCuts_EnableChangeCam
			params = {
				enable = FALSE
			}
		}
	]
}
default_songoutro_transition = {
	time = 60000
	ScriptTable = [
	]
}
common_songoutro_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_moments'
				changenow
				Name = moment01
			}
		}
		{
			time = 0
			Scr = play_song_outro_anims
			params = {
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
			Scr = audio_play_fail_sound_to_animation
			params = {
			}
		}
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				Type = outro
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
			Scr = play_lose_camera
			params = {
			}
		}
		{
			time = 0
			Scr = fadetoblack
			params = {
				OFF
				time = 0.0
				no_wait
			}
		}
	]
	EndWithDefaultCamera
}
default_finalbandoutro_transition = {
	time = 10000
	ScriptTable = [
	]
}
common_finalbandoutro_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				Type = outro
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
				prefix = 'cameras_finalbandoutro'
				changenow
			}
		}
		{
			time = 0
			Scr = start_preloaded_finalbandoutro_stream
		}
	]
	EndWithDefaultCamera
}
default_loading_transition = {
	time = 250
	ScriptTable = [
	]
}
common_loading_transition = {
	ScriptTable = [
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
				prefix = 'cameras_no_band'
				changenow
				transition_time = 5
				extra_params = {
					force_time = 5
				}
			}
		}
		{
			time = 100
			Scr = CameraCuts_EnableChangeCam
			params = {
				enable = FALSE
			}
		}
	]
}
default_onlineloading_transition = {
	time = 500
	ScriptTable = [
	]
}
common_onlineloading_transition = {
	ScriptTable = [
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
				prefix = 'cameras_no_band'
				changenow
				transition_time = 5
				extra_params = {
					force_time = 5
				}
			}
		}
		{
			time = 100
			Scr = CameraCuts_EnableChangeCam
			params = {
				enable = FALSE
			}
		}
	]
}
default_loadingintro_transition = {
	time = 3000
	ScriptTable = [
	]
}
common_loadingintro_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				anim = Idle
			}
		}
		{
			time = 0
			Scr = bandmanager_setplayingintroanims
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
			time = 0
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
default_celebintro_transition = {
	time = 10000
	ScriptTable = [
	]
}
common_celebintro_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
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
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				no_sound = 1
			}
		}
		{
			time = 0
			Scr = celebintro_fx
		}
		{
			time = 100
			Scr = start_preloaded_celeb_intro_stream
		}
		{
			time = 100
			Scr = audio_gameplay_intro_sfx_warmup
		}
		{
			time = 200
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
default_careerbandswap_transition = {
	time = -1
	ScriptTable = [
	]
}
common_careerbandswap_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				Type = outro
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
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 3000
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_no_band'
				changenow
			}
		}
		{
			time = 3000
			Scr = transition_bandswap
			params = {
			}
		}
	]
	EndWithDefaultCamera
}
default_transformationencore_transition = {
	time = 100
	ScriptTable = [
	]
}
common_transformationencore_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = hide_glitch
			params = {
				num_frames = 25
			}
		}
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				Type = outro
				kill_cameracuts_iterator
			}
		}
	]
	EndWithDefaultCamera
}

script transition_bandswap 
	change_band_for_song \{override_band = rockerband_gh_rocker_demigod}
	begin
	if persistent_band_finished_building
		break
	endif
	Wait \{1
		gameframe}
	repeat
	play_intro_anims
	Transition_CameraCut \{prefix = 'cameras_fastintro'
		changenow}
	Wait \{3
		Seconds}
	Change \{transition_playing = FALSE}
endscript

script common_loading_transitionend 
	playlist_getcurrentsong
	if GotParam \{current_song}
		if (<current_song> = jamsession)
			return
		endif
	endif
	gamemode_gettype
	if (($is_network_game = 1 && <Type> = career) || $is_network_game = 0)
		ui_event \{event = menu_back
			data = {
				state = Uistate_gameplay
			}}
		if CompositeObjectExists \{Name = vocalist}
			vocalist :unhide
			vocalist :obj_teleport
		endif
	endif
endscript
debug_celeb_intros = 0

script Transition_SelectTransition \{practice_intro = 0
		restarting = 0}
	Change \{finalbandintro_transition_playing = 0}
	next_zone = (($LevelZones.$current_level).zone)
	GetPakManCurrent \{map = zones}
	if (<pak> != (($LevelZones.$current_level).zone))
		Change \{encore_transitioned_played = FALSE}
	endif
	if ($debug_encore = 1 || $debug_career_transformations = 1)
		Change \{current_transition = ENCORE}
		return
	endif
	if (<practice_intro> = 1)
		return
	endif
	if ($current_transition = debugintro)
		Change \{current_transition = Intro}
		return
	endif
	if ($current_transition = forcelongintro)
		Change \{current_transition = Intro}
		return
	endif
	if ($game_mode = career)
		playlist_getcurrentsong
		if select_transformation_transition
			return
		endif
		if use_rush_transition restarting = <restarting>
			return
		endif
		if use_finalbattle_intro_transition restarting = <restarting>
			return
		endif
		if transition_selectcelebtransition
			printf \{channel = marc
				qs(0x2e1da750)}
			return
		endif
	endif
	if ($encore_transitioned_played = true)
		Change \{current_transition = restartencore}
	else
		Change \{current_transition = fastintro}
	endif
endscript

script transition_selectcelebtransition 
	if quest_progression_is_chapter_rush
		return
	endif
	gamemode_gettype
	if ((<Type> != career))
		return
	endif
	if NOT should_play_celeb_intro
		return \{FALSE}
	endif
	Change \{current_transition = celebintro}
	return \{true}
endscript

script is_encore_song 
	gamemode_gettype
	if (<Type> != career)
		printf \{channel = marc
			qs(0x879b0189)}
		return \{FALSE}
	endif
	<current_chapter> = ($current_chapter)
	playlist_getcurrentsong
	if (<current_song> = ($<current_chapter>.ENCORE))
		return \{true}
	endif
	return \{FALSE}
endscript

script get_rocker_intro_name 
	zone = (($LevelZones.$current_level).zone)
	ExtendCrc <zone> 'Intro' out = Name
	return Name = <Name>
endscript

script get_rocker_transformation_name 
	zone = (($LevelZones.$current_level).zone)
	ExtendCrc <zone> 'Tran' out = Name
	return Name = <Name>
endscript
encore_transitioned_played = FALSE

script transition_selectencoretransition 
	if ininternetmode
		return
	endif
	printf \{channel = marc
		qs(0xbce67d3d)}
	if ($encore_transitioned_played = true)
		return
	endif
	if NOT is_encore_song
		return
	endif
	printf \{channel = marc
		qs(0x5cd130b4)}
	Change \{current_transition = ENCORE}
	return \{true}
endscript
g_transformation_dummy_songs = [
	z_egypttran
	z_epicstagetran
	z_mansionstudiotran
	z_punkstagetran
	z_riothousetran
	z_housebandtran
	z_barbariantran
	z_festivaltran
]

script select_transformation_transition 
	printf \{channel = marc
		qs(0xdef8ed58)}
	playlist_getcurrentsong
	if GotParam \{current_song}
		printf channel = marc qs(0x975bcc78) a = <current_song>
		if ArrayContains array = $g_transformation_dummy_songs contains = <current_song>
			printf \{channel = marc
				qs(0x3d31314c)}
			Change \{encore_transitioned_played = FALSE}
			Change \{current_transition = ENCORE}
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Transition_KillAll 
	KillSpawnedScript \{id = transitions}
	Change \{transition_playing = FALSE}
	Change \{current_playing_transition = None}
endscript

script transition_getprefix \{Type = Intro}
	celeb_intro = 0
	if StructureContains structure = $Transition_Types <Type>
		type_textnl = ($Transition_Types.<Type>.textnl)
	endif
	if NOT GotParam \{type_textnl}
		ScriptAssert \{qs(0xf6d7c577)}
	endif
	return type_textnl = <type_textnl> celeb_intro = <celeb_intro>
endscript

script transition_getprops 
	transition_getprefix <...>
	GetPakManCurrentName \{map = zones}
	formatText checksumName = Transition_Props '%s_%p_Transition' p = <type_textnl> s = <pakname>
	if NOT GlobalExists Name = <Transition_Props>
		formatText checksumName = Transition_Props 'default_%p_Transition' p = <type_textnl> s = <pakname>
	endif
	if (<celeb_intro> = 1)
		if NOT GlobalExists Name = <Transition_Props>
			Transition_Props = Default_Intro_Transition
		endif
	endif
	formatText checksumName = common_transition_props 'Common_%p_Transition' p = <type_textnl>
	common_type_textnl = <type_textnl>
	if (<celeb_intro> = 1)
		common_type_textnl = 'intro'
		if NOT GlobalExists Name = <common_transition_props>
			common_transition_props = Common_Intro_Transition
		endif
	endif
	return type_textnl = <type_textnl> common_type_textnl = <common_type_textnl> Transition_Props = <Transition_Props> common_transition_props = <common_transition_props>
endscript

script Transition_GetTime \{Type = Intro}
	transition_getprops Type = <Type>
	return transition_time = ($<Transition_Props>.time)
endscript

script transition_findtimeoffset 
	switch <Type>
		case finalbattleintro
		case rushintro
		case celebintro
		return time_offset = ($time_gem_offset + ($<Transition_Props>.time))
	endswitch
endscript

script Transition_Play \{Type = Intro
		use_song_time = 1}
	Transition_KillAll
	Change current_playing_transition = <Type>
	if (<Type> = ENCORE)
		Change \{encore_transitioned_played = true}
	endif
	transition_getprops Type = <Type>
	GetPakManCurrentName \{map = zones}
	formatText checksumName = event 'Common_%p_TransitionSetup' p = <common_type_textnl> s = <pakname>
	if ScriptExists <event>
		<event>
	endif
	formatText checksumName = event '%s_%p_TransitionSetup' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		SpawnScriptNow <event>
	endif
	transition_findtimeoffset <...>
	SpawnScriptNow Transition_Play_Spawned id = transitions params = {<...>}
	formatText checksumName = event 'GuitarEvent_Transition%s' s = <type_textnl>
	if ScriptExists <event>
		SpawnScriptNow <event>
	endif
endscript

script Transition_Play_Spawned \{use_song_time = 1}
	Change \{transition_playing = true}
	GetPakManCurrentName \{map = zones}
	transition_time = ($<Transition_Props>.time)
	SpawnScriptNow Transition_Play_Iterator id = transitions params = {<...>}
	SpawnScriptNow Transition_Play_Iterator id = transitions params = {<...> Transition_Props = <common_transition_props>}
	formatText checksumName = event '%s_%p_TransitionDeinit' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		OnExitRun <event>
	endif
	<time> = 0.0
	if (<use_song_time> = 1)
		if NOT GotParam \{time_offset}
			GetSongTimeMs
			time_offset = (0 - <time>)
		endif
	endif
	begin
	if (<transition_time> = -1)
		if ($transition_playing = FALSE)
			break
		endif
	else
		if (<use_song_time> = 1)
			GetSongTimeMs time_offset = <time_offset>
		else
			getframelength
			<time> = (<time> + (<frame_length> * 1000.0))
		endif
		if (<transition_time> <= <time>)
			Change \{transition_playing = FALSE}
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	if StructureContains structure = ($<common_transition_props>) endwithscript
		SpawnScriptNow ($<common_transition_props>.endwithscript)
	endif
	if StructureContains structure = ($<common_transition_props>) EndWithDefaultCamera
		playlist_getcurrentsong
		if ($finalbandintro_transition_playing = 1)
			if ($current_playing_transition = finalbandintro)
				Change \{finalbandintro_transition_playing = 0}
			else
				StopRendering
			endif
		else
			if StructureContains structure = ($<common_transition_props>) SyncWithNoteCameras
				CameraCuts_GetNextNoteCameraTime
				GetSongTimeMs
				if (<camera_time> >= -200 &&
						<camera_time> - <time> < 2000)
					CameraCuts_EnableChangeCam \{enable = FALSE}
				else
					if NOT ($game_mode = tutorial || $game_mode = practice)
						CameraCuts_SetArrayPrefix \{prefix = 'cameras'
							changenow}
					else
						CameraCuts_EnableChangeCam \{enable = FALSE}
					endif
				endif
			else
				if NOT ($game_mode = tutorial || $game_mode = practice)
					CameraCuts_SetArrayPrefix \{prefix = 'cameras'
						changenow}
				else
					CameraCuts_EnableChangeCam \{enable = FALSE}
				endif
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

script istransitionplaying 
	if GotParam \{Type}
		if (<Type> = $current_playing_transition)
			return \{true}
		endif
	else
		if NOT (<Type> = None)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Transition_Play_Iterator \{use_song_time = 1}
	<time> = 0
	if (<use_song_time> = 1)
		if NOT GotParam \{time_offset}
			GetSongTimeMs
			time_offset = (0 - <time>)
		endif
	endif
	GetArraySize ($<Transition_Props>.ScriptTable)
	if (<array_Size> = 0)
		return
	endif
	array_count = 0
	begin
	current_time = ($<Transition_Props>.ScriptTable [<array_count>].time)
	fixtimerounding \{current_time}
	begin
	if (<use_song_time> = 1)
		GetSongTimeMs time_offset = <time_offset>
	else
		getframelength
		<time> = (<time> + (<frame_length> * 1000.0))
	endif
	if (<current_time> <= <time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	printf qs(0x14d64d1b) s = ($<Transition_Props>.ScriptTable [<array_count>].Scr) t = ($<Transition_Props>.ScriptTable [<array_count>].time)
	if ScriptExists ($<Transition_Props>.ScriptTable [<array_count>].Scr)
		SpawnScriptNow ($<Transition_Props>.ScriptTable [<array_count>].Scr) id = transitions params = {transition_time = <transition_time> ($<Transition_Props>.ScriptTable [<array_count>].params) from_scriptevent = 1}
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

script clipplaydrummercamera 
	if NOT GotParam \{anim}
		ScriptAssert \{qs(0xcdaa0a64)}
	endif
	if NOT GotParam \{index}
		ScriptAssert \{qs(0xd509756d)}
	endif
	if (<index> < 10)
		formatText checksumName = lock_target qs(0x5dd349ea) i = <index>
	else
		formatText checksumName = lock_target qs(0x62a45e78) i = <index>
	endif
	momentcamera_playanim {anim = <anim> $drumcam_params lock_target = <lock_target>}
endscript

script transition_setcamera 
	if NOT GotParam \{note_value}
		return
	endif
	if GetNoteMapping section = cameras note_value = <note_value>
		clip_get_time_and_frame
		SpawnScriptNow (<note_data>.Scr) params = {(<note_data>.params) length = <length>}
	else
	endif
endscript

script momentcamera_playanim \{cycle = 0
		start = 0.0
		BlendDuration = 0.0
		speed = 1.0
		TimerType = tempo}
	if NOT CompositeObjectExists Name = <lock_target>
		printf channel = anim_info qs(0xb08c6979) a = <lock_target>
		return
	endif
	SetSearchAllAssetContexts
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	<lock_target> :obj_getintegertag tag_name = disable_unlock assert = 0
	disable_unlock = <integer_value>
	if GotParam \{start_node_crc}
		GetWaypointPos Name = <start_node_crc>
		getwaypointquat Name = <start_node_crc>
		if (<disable_unlock> = 0)
			<lock_target> :Obj_LockToObject OFF
		endif
		<lock_target> :Obj_SetPosition position = <Pos>
		<lock_target> :Obj_SetOrientation Quat = <Quat>
	elseif GotParam \{start_node}
		ExtendCrc <pak> <start_node> out = start_node_id
		GetWaypointPos Name = <start_node_id>
		getwaypointquat Name = <start_node_id>
		if (<disable_unlock> = 0)
			<lock_target> :Obj_LockToObject OFF
		endif
		<lock_target> :Obj_SetPosition position = <Pos>
		<lock_target> :Obj_SetOrientation Quat = <Quat>
	else
		suffix = ('_' + <node>)
		AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
		if CompositeObjectExists Name = <appended_id>
			<lock_target> :Obj_LockToObject objectName = <appended_id>
		else
			printf channel = anim_info qs(0xc0212f38) a = <appended_id>
		endif
	endif
	if NOT GotParam \{tempo_anim}
		tempo_anim = <anim>
	endif
	SpawnScriptNow momentcamera_playanim_spawned params = {Name = <lock_target> anim = <anim> tempoanim = <tempo_anim> cycle = <cycle> start = <start> BlendDuration = <BlendDuration> speed = <speed> TimerType = <TimerType>}
	SetSearchAllAssetContexts \{OFF}
endscript

script momentcamera_playanim_spawned \{start = 0.0
		speed = 1.0
		BlendDuration = -1.0
		TimerType = tempo}
	if NOT CompositeObjectExists Name = <Name>
		printf qs(0x9e08b783) a = <Name>
		return
	endif
	begin
	SetSearchAllAssetContexts
	if NOT GotParam \{anim}
		<Name> :Anim_GetDefaultAnimName
		anim = <defaultAnimName>
	endif
	if NOT GotParam \{tempoanim}
		tempoanim = anim
	endif
	<Name> :RemoveTags [animrequestedfovradians]
	<Name> :anim_enable
	<Name> :Anim_Command target = Body Command = DegenerateBlend_AddBranch params = {
		Tree = $specialcamera_standardanimbranch
		BlendDuration = <BlendDuration>
		params = {
			anim = <anim>
			speed = <speed>
			TimerType = <TimerType>
			start = <start>
			AnimEvents = On
			tempoanim = <tempoanim>
			allowbeatskipping = true
		}
	}
	<Name> :anim_update active_camera_override = true
	<Name> :Anim_Command target = BodyTimer Command = Timer_WaitAnimComplete
	SetSearchAllAssetContexts \{OFF}
	if (<cycle> = 0)
		break
	endif
	start = 0.0
	repeat
endscript

script specialcamera_playanim \{cycle = 0
		start = 0.0}
	SetSearchAllAssetContexts
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	formatText TextName = suffix '_%s' s = <Obj>
	AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
	cameraname = (<pakname> + <suffix>)
	if CompositeObjectExists Name = <appended_id>
		<appended_id> :Obj_SwitchScript specialcamera_playanim_spawned params = {anim = <anim> cycle = <cycle> start = <start> BlendDuration = <BlendDuration>}
	else
		printf qs(0x5f796dcf) s = <cameraname>
	endif
	SetSearchAllAssetContexts \{OFF}
endscript

script specialcamera_playanim_spawned \{start = 0.0
		speed = 1.0
		BlendDuration = -1.0}
	begin
	SetSearchAllAssetContexts
	if NOT GotParam \{anim}
		Anim_GetDefaultAnimName
		anim = <defaultAnimName>
	endif
	if NOT GotParam \{tempoanim}
		tempoanim = anim
	endif
	printf qs(0x0c017022) a = <anim> b = <tempoanim>
	RemoveTags \{[
			animrequestedfovradians
		]}
	anim_enable
	Anim_Command target = Body Command = DegenerateBlend_AddBranch params = {
		Tree = $specialcamera_standardanimbranch
		BlendDuration = <BlendDuration>
		params = {
			anim = <anim>
			speed = <speed>
			TimerType = tempo
			start = <start>
			AnimEvents = On
			tempoanim = <tempoanim>
			allowbeatskipping = true
		}
	}
	specialcamera_waitanimfinished
	SetSearchAllAssetContexts \{OFF}
	if (<cycle> = 0)
		break
	endif
	repeat
endscript

script specialcamera_waitanimfinished \{Timer = BodyTimer}
	Anim_Command target = <Timer> Command = Timer_WaitAnimComplete
endscript
specialcamera_standardanimbranch = {
	Type = TimerType
	id = BodyTimer
	anim = anim
	tempo_anim = tempoanim
	anim_events = AnimEvents
	allow_beat_skipping = allowbeatskipping
	speed = speed
	start = start
	[
		{
			Type = Source
			anim = anim
		}
	]
}

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
	if GotParam \{prefix}
		if GotParam \{extra_params}
			Change \{cameracuts_nextextraparamsset = 1}
			Change cameracuts_nextextraparams = <extra_params>
		endif
		disablechangecam = FALSE
		if (<prefix> = 'cameras_moments')
			disablechangecam = true
		endif
		CameraCuts_SetArrayPrefix <...> length = <transition_time>
	else
		if NOT ($current_playing_transition = None)
			transition_getprefix Type = ($current_playing_transition)
		else
			transition_getprefix \{Type = Intro}
		endif
		GetPakManCurrentName \{map = zones}
		formatText checksumName = Cameras_Array 'default_cameras_%t' t = <type_textnl>
		formatText TextName = prefix 'cameras_%t' t = <type_textnl>
		if NOT GlobalExists Name = <Cameras_Array>
			formatText checksumName = Cameras_Array '%s_cameras_%t' s = <pakname> t = <type_textnl>
			if NOT GlobalExists Name = <Cameras_Array>
				prefix = 'cameras_intro'
			endif
		endif
		CameraCuts_SetArrayPrefix <...> length = <transition_time>
	endif
endscript

script Transition_StopRendering 
	if ($game_mode != freeplay)
		StopRendering
	endif
endscript

script Transition_StartRendering \{no_curtain = 0}
	StartRendering
	Change \{is_changing_levels = 0}
	if ($blade_active = 1 && $signin_change_happening = 0)
		if ($game_mode != freeplay)
			ui_event_wait_for_safe
			begin
			if NOT ScriptIsRunning \{sysnotify_handle_unpause}
				break
			endif
			Wait \{1
				gameframe}
			repeat
			if ($blade_active = 1 && $signin_change_happening = 0)
				Change \{blade_active = 0}
				gh_start_pressed no_curtain = <no_curtain>
			endif
		endif
	endif
endscript

script Transition_Printf 
	printf <...>
endscript

script Transitions_ResetZone 
	printf \{qs(0x119c40dd)}
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
	yield_count = 40
	begin
	resetvalid = true
	if GotParam \{Profile}
		resetvalid = FALSE
		if StructureContains structure = ($<nodearray_checksum> [<array_count>]) Profile
			if comparestructs struct1 = ($<nodearray_checksum> [<array_count>].Profile) struct2 = (<Profile>)
				resetvalid = true
			endif
		endif
	endif
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedFromVariable
		resetvalid = FALSE
	endif
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedOnProgress
		resetvalid = FALSE
	endif
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) Class
		if NOT ($<nodearray_checksum> [<array_count>].Class = GameObject ||
				$<nodearray_checksum> [<array_count>].Class = LevelGeometry)
			resetvalid = FALSE
		endif
	else
		resetvalid = FALSE
	endif
	yield_count = (<yield_count> - 1)
	if (<yield_count> = 0)
		yield \{'Transitions_ResetZone break'}
		yield_count = 40
	endif
	if (<resetvalid> = true)
		kill Name = ($<nodearray_checksum> [<array_count>].Name)
		if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedAtStart
			create Name = ($<nodearray_checksum> [<array_count>].Name)
		endif
		yield \{'Transitions_ResetZone'}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script common_celebintro_transitionsetup 
	printf \{channel = sfx
		qs(0x683ba7ad)}
	preload_celeb_intro_stream
endscript

script common_finalbattleintro_transitionsetup 
	printf \{channel = sfx
		qs(0x683ba7ad)}
	<current_song> = None
	playlist_getcurrentsong
	get_finalbattle_song_number song = <current_song>
	if (<song_number> = 0)
		preload_celeb_intro_stream
	endif
endscript

script common_intro_transitionsetup 
	printf \{channel = sfx
		qs(0x0ea33ed5)}
	preload_intro_stream
endscript

script Common_PreEncore_TransitionSetup 
endscript

script Common_PreEncore_TransitionEnd 
endscript

script finalbandintro_transitionsetup 
	printf \{channel = sfx
		qs(0x86acca66)}
	transition_getprefix Type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = None)
		stopsound unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
	PreloadStream \{intro_finalgig}
	Change celeb_intro_stream_id = <unique_id>
endscript

script common_finalbandoutro_transitionsetup 
	printf \{channel = sfx
		qs(0x52f3ee09)}
	if NOT ($celeb_intro_stream_id = None)
		stopsound unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
	PreloadStream \{encore_finalgig}
	Change celeb_intro_stream_id = <unique_id>
	begin
	printf \{qs(0xb1fb7278)}
	if PreloadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script common_rushintro_transitionsetup 
endscript

script common_rushintro_transitionend 
endscript

script common_rushoutro_transitionsetup 
	Change_Crowd_Looping_SFX \{crowd_looping_state = good}
	<prev_song> = $last_song_played
	if (<prev_song> = rush2112p7)
		preload_encore_event_stream
	endif
endscript

script common_rushoutro_transitionend 
endscript

script Common_Encore_TransitionSetup 
	printf \{channel = sfx
		qs(0x456e2c58)}
	preload_encore_event_stream
endscript

script Common_Encore_TransitionEnd 
	SpawnScriptLater \{common_encore_spawned_waiting_then_playing_music_for_ui_screen}
endscript

script common_encore_spawned_waiting_then_playing_music_for_ui_screen \{music_screen_volume = -10
		waitTime = 2.0}
	soundname = nothing
	get_ui_screen_music_file_from_zone
	Wait <waitTime> Seconds
	printf channel = sfx qs(0xdf830cf8) s = <music_screen_volume>
	PlaySound <ui_music_soundname_checksum> vol = <music_screen_volume> buss = binkcutscenes
	SpawnScriptNow \{audio_play_surges_during_encore_waiting_screen}
endscript

script stop_music_post_encore_when_load_is_done 
	if (issoundplaying $g_ui_screen_music_playing_checksum)
		stopsound \{$g_ui_screen_music_playing_checksum
			fade_time = 1.5
			fade_type = linear}
	endif
	SpawnScriptNow \{audio_kill_play_surges_during_encore_waiting_screen}
endscript

script start_crowd_surging_sfx_over_preencore_ministats_screen 
	GetPakManCurrentName \{map = zones}
	formatText checksumName = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		venuesize = medium_ext
	endif
	printf channel = sfx qs(0xc8001373) s = <venuesize>
	switch <venuesize>
		case large_ext
		newvenuesize = 'Large_EXT'
		case medium_int
		newvenuesize = 'Medium_INT'
		case medium_ext
		newvenuesize = 'Medium_EXT'
		case small_int
		newvenuesize = 'Small_INT'
		default
		newvenuesize = 'Medium_EXT'
	endswitch
	formatText checksumName = preencoretemp 'PreEncore_%s' s = <newvenuesize> AddToStringLookup = true
	Change g_current_preencore = <preencoretemp>
	if ((<pakname> != 'z_mansionstudio') && (<pakname> != 'z_modular') && (<pakname> != 'z_credits') && (<pakname> != 'z_visualizer') && (<pakname> != 'z_finalbattle') && (<pakname> != 'z_cube'))
		printf \{channel = sfx
			qs(0x9147ba66)
			s = $g_current_preencore}
		PlaySound \{$g_current_preencore
			vol = 9
			buss = Crowd_PreEncore_Building}
	endif
endscript

script stop_crowd_surging_sfx_over_preencore_ministats_screen 
	stopsound \{$g_current_preencore
		fade_time = 3.0
		fade_type = log_slow}
endscript

script get_ui_screen_music_file_from_zone \{local_var_volume = -10
		waitTime = 2.0}
	GetPakManCurrentName \{map = zones}
	printf channel = sfx qs(0x8f4988d7) s = <pakname>
	formatText checksumName = pakname_checksum '%a' a = <pakname> AddToStringLookup = true
	switch <pakname_checksum>
		case z_egypt
		case z_barbarian
		case z_punkstage
		case z_houseband
		case z_festival
		case z_riothouse
		case z_mansionstudio
		case z_epicstage
		formatText checksumName = ui_music '%a_music' a = <pakname> AddToStringLookup = true
		default
		printf \{channel = sfx
			qs(0x28223746)}
	endswitch
	switch <pakname_checksum>
		case z_punkstage
		waitTime = 1.2
		local_var_volume = -7.0
		case z_riothouse
		waitTime = 1.0
		local_var_volume = -6.5
		case z_houseband
		waitTime = 1.0
		local_var_volume = -3.5
		case z_mansionstudio
		waitTime = 0.5
		local_var_volume = -8.0
		case z_epicstage
		waitTime = 1.0
		local_var_volume = -4.5
		case z_festival
		waitTime = 2.0
		local_var_volume = -4.1
		case z_barbarian
		waitTime = 1.5
		local_var_volume = -5.0
		case z_egypt
		waitTime = 2.0
		local_var_volume = -7.5
		default
		printf \{channel = sfx
			qs(0x28223746)}
	endswitch
	Change g_ui_screen_music_playing_checksum = <ui_music>
	return ui_music_soundname_checksum = <ui_music> music_screen_volume = <local_var_volume> waitTime = <waitTime>
endscript

script Preload_Encore_Bink_Audio \{movie_name = 'z_artdeco_encore_audio'}
endscript

script common_loading_transitionsetup 
	GetPakManCurrent \{map = zones}
endscript
celeb_intro_stream_id = None
g_celeb_outro_stream_id = None

script get_rocker_name_from_current_zone 
	GetPakManCurrentName \{map = zones}
	printf channel = sfx qs(0x8f4988d7) s = <pakname>
	formatText checksumName = pakname_checksum '%a' a = <pakname> AddToStringLookup = true
	switch <pakname_checksum>
		case z_egypt
		<pakname> = 'axel'
		case z_barbarian
		<pakname> = 'casey'
		case z_punkstage
		<pakname> = 'johnny'
		case z_houseband
		<pakname> = 'judy'
		case z_festival
		<pakname> = 'lars'
		case z_riothouse
		<pakname> = 'newgirl'
		case z_mansionstudio
		<pakname> = 'newmale'
		case z_epicstage
		<pakname> = 'pandora'
		case z_modular
		<pakname> = 'rush'
		case z_finalbattle
		<pakname> = 'ampzilla_fb'
		case z_credits
		<pakname> = 'ampzilla'
		default
		printf \{channel = sfx
			qs(0x406e8f97)}
	endswitch
	return rocker = <pakname>
endscript

script preload_celeb_intro_stream \{celeb_intro_checksum = None}
	printf \{channel = sfx
		qs(0x9f3ca4a3)}
	SpawnScriptNow \{audio_change_crowd_to_celeb_state
		params = {
			celeb_state = Intro
		}}
	transition_getprefix Type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = None)
		stopsound unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
	get_rocker_name_from_current_zone
	printf channel = sfx qs(0xa99cc6ce) s = <rocker>
	tutorial_system_get_language_prefix
	printf channel = sfx qs(0xb5abb1d8) s = <language_prefix>
	formatText checksumName = celeb_intro_checksum '%l_%s_intro' l = <language_prefix> s = <rocker> AddToStringLookup = true
	printf channel = sfx qs(0x59271fbd) s = <celeb_intro_checksum>
	PreloadStream <celeb_intro_checksum>
	Change celeb_intro_stream_id = <unique_id>
	begin
	printf \{qs(0x50818c55)}
	if PreloadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script start_preloaded_celeb_intro_stream \{celeb_intro_vol_name = None}
	printf \{channel = sfx
		qs(0x9ff5df66)}
	if NOT ($celeb_intro_stream_id = None)
		transition_getprefix Type = ($current_playing_transition)
		audio_cutscene_get_vol_tweak_of_preloaded_stream streamname = <celeb_intro_vol_name>
		printf \{channel = sfx
			qs(0x75ea046e)}
		StartPreLoadedStream $celeb_intro_stream_id buss = Encore_Events forcesafepreload = 1 vol = <volumetweak>
		Change \{celeb_intro_stream_id = None}
		vocals_mute_all_mics \{mute = true}
	endif
endscript
encore_event_stream_id = None

script preload_encore_event_stream 
	printf \{channel = sfx
		qs(0x03f14c32)}
	SpawnScriptNow \{audio_change_crowd_to_celeb_state
		params = {
			celeb_state = ENCORE
		}}
	if NOT ($encore_event_stream_id = None)
		stopsound unique_id = ($encore_event_stream_id)
		Change \{encore_event_stream_id = None}
	endif
	get_rocker_name_from_current_zone
	tutorial_system_get_language_prefix
	if NOT (<rocker> = 'rush')
		formatText checksumName = encore_stream_name '%l_%s_transformation' l = <language_prefix> s = <rocker> AddToStringLookup = true
	else
		formatText checksumName = encore_stream_name '%l_%s_outro' l = <language_prefix> s = <rocker> AddToStringLookup = true
	endif
	printf channel = sfx qs(0x83093de2) s = <encore_stream_name>
	PreloadStream <encore_stream_name>
	Change encore_event_stream_id = <unique_id>
	begin
	printf \{channel = sfx
		qs(0x93305209)}
	if PreloadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script start_preloaded_encore_event_stream 
	printf \{channel = sfx
		qs(0x72abc744)}
	SpawnScriptNow \{stop_crowd_surging_sfx_over_preencore_ministats_screen}
	if NOT ($encore_event_stream_id = None)
		GetPakManCurrentName \{map = zones}
		formatText checksumName = encore_stream_vol_name '%s_encore' s = <pakname> AddToStringLookup = true
		audio_cutscene_get_vol_tweak_of_preloaded_stream streamname = <encore_stream_vol_name>
		printf \{channel = sfx
			qs(0xd9aeb1dd)}
		StartPreLoadedStream $encore_event_stream_id buss = Encore_Events forcesafepreload = 1 vol = <volumetweak>
		Change \{encore_event_stream_id = None}
	endif
endscript

script preload_celeb_outro_stream \{celeb_outro_checksum = None}
	printf \{channel = sfx
		qs(0x06cd37f2)}
	SpawnScriptNow \{audio_change_crowd_to_celeb_state
		params = {
			celeb_state = outro
		}}
	transition_getprefix Type = ($current_playing_transition)
	if NOT ($g_celeb_outro_stream_id = None)
		stopsound unique_id = ($g_celeb_outro_stream_id)
		Change \{g_celeb_outro_stream_id = None}
	endif
	tutorial_system_get_language_prefix
	formatText checksumName = celeb_outro_checksum '%l_%s_intro' l = <language_prefix> s = <rocker> AddToStringLookup = true
	printf channel = sfx qs(0x59271fbd) s = <celeb_outro_checksum>
	PreloadStream <celeb_outro_checksum>
	Change g_celeb_outro_stream_id = <unique_id>
	begin
	printf \{qs(0xc9701f04)}
	if PreloadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script start_preloaded_celeb_outro_stream \{celeb_intro_vol_name = None}
	printf \{channel = sfx
		qs(0x06044c37)}
	if NOT ($g_celeb_outro_stream_id = None)
		transition_getprefix Type = ($current_playing_transition)
		audio_cutscene_get_vol_tweak_of_preloaded_stream streamname = <celeb_outro_vol_name>
		printf \{channel = sfx
			qs(0x309e144a)}
		StartPreLoadedStream $g_celeb_outro_stream_id buss = Encore_Events forcesafepreload = 1 vol = <volumetweak>
		Change \{g_celeb_outro_stream_id = None}
		vocals_mute_all_mics \{mute = true}
	endif
endscript
intro_stream_id = None

script preload_intro_stream 
	printf \{channel = sfx
		qs(0x3de5a017)}
	if NOT ($intro_stream_id = None)
		stopsound unique_id = ($intro_stream_id)
		Change \{intro_stream_id = None}
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = intro_stream_name '%s_intro' s = <pakname> AddToStringLookup = true
	PreloadStream <intro_stream_name>
	Change intro_stream_id = <unique_id>
	begin
	printf \{channel = sfx
		qs(0xb183e60b)}
	if PreloadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script start_preloaded_intro_stream 
	printf \{channel = sfx
		qs(0x8071fc13)}
	if NOT ($intro_stream_id = None)
		GetPakManCurrentName \{map = zones}
		formatText checksumName = encore_stream_vol_name '%s_intro' s = <pakname> AddToStringLookup = true
		audio_cutscene_get_vol_tweak_of_preloaded_stream streamname = <encore_stream_vol_name>
		printf channel = sfx qs(0x917a0c22) y = <volumetweak>
		printf \{channel = sfx
			qs(0x5488a3ac)}
		StartPreLoadedStream $intro_stream_id buss = Encore_Events vol = <volumetweak> forcesafepreload = 1
		Change \{intro_stream_id = None}
	endif
endscript

script start_preloaded_finalbandoutro_stream 
	printf \{channel = sfx
		qs(0x12d0a014)}
	if NOT ($celeb_intro_stream_id = None)
		audio_cutscene_get_vol_tweak_of_preloaded_stream \{streamname = career_outro}
		printf \{channel = sfx
			qs(0x88b63883)}
		StartPreLoadedStream $celeb_intro_stream_id buss = Encore_Events forcesafepreload = 1 vol = <volumetweak>
		Change \{celeb_intro_stream_id = None}
	endif
endscript

script kill_transition_preload_streams 
	printf \{channel = sfx
		qs(0x6bbf6407)}
	KillSpawnedScript \{Name = preload_encore_event_stream}
	KillSpawnedScript \{Name = preload_celeb_intro_stream}
	KillSpawnedScript \{Name = preload_intro_stream}
	Change \{encore_event_stream_id = None}
	Change \{celeb_intro_stream_id = None}
	Change \{intro_stream_id = None}
endscript

script should_play_long_venue_intro 
	zone = (($LevelZones.$current_level).zone)
	if console_is_net_career_client
		AddParams ($g_net_career_progression.venue_intro_flags)
	else
		GetGlobalTags \{venue_intro_flags}
	endif
	if ($encore_transitioned_played = true)
		return \{FALSE}
	endif
	if StructureContains structure = <...> <zone>
		<venue_flag> = (<...>.<zone>)
		if (<venue_flag> = 1)
			return \{FALSE}
		endif
	endif
	AddParam Name = <zone> value = 1 structure_name = NewValue
	if console_is_net_career_client
		temp_struct = ($g_net_career_progression.venue_intro_flags + <NewValue>)
		appendstruct struct = g_net_career_progression Field = venue_intro_flags params = <temp_struct> globalstruct
	else
		SetGlobalTags venue_intro_flags params = <NewValue> Progression = true
	endif
	return \{true}
endscript

script should_play_celeb_intro 
	zone = (($LevelZones.$current_level).zone)
	if console_is_net_career_client
		AddParams ($g_net_career_progression.celeb_intro_flags)
	else
		GetGlobalTags \{celeb_intro_flags}
	endif
	if StructureContains structure = <...> <zone>
		<venue_flag> = (<...>.<zone>)
		if (<venue_flag> = 1)
			if quest_progression_is_chapter_finale
				set_chapter_venue_intro_flags
			endif
			return \{FALSE}
		endif
	endif
	if NOT quest_progression_is_chapter_finale
		set_chapter_venue_intro_flags \{value = 1}
	endif
	return \{true}
endscript

script set_chapter_venue_intro_flags \{value = 0}
	if GotParam \{level}
		zone = ((($LevelZones).<level>).zone)
	else
		zone = (($LevelZones.$current_level).zone)
	endif
	AddParam Name = <zone> value = <value> structure_name = NewValue
	if console_is_net_career_client
		temp_struct = ($g_net_career_progression.celeb_intro_flags + <NewValue>)
		appendstruct struct = g_net_career_progression Field = celeb_intro_flags params = <temp_struct> globalstruct
	else
		SetGlobalTags celeb_intro_flags params = <NewValue> Progression = true
	endif
endscript

script bohemianrhapsody_hack 
	playlist_getcurrentsong
	if (<current_song> = bohemianrhapsody)
		fadeoutandin \{time = 2.0
			delay = 0.5
			z_priority = 0}
	endif
endscript
