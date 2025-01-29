transition_playing = false
current_playing_transition = None
finalbandintro_transition_playing = 0
setlist_selection_tier = 1
transition_song_loading_hack = 1
Transition_Types = {
	intro = {
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
	Encore = {
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
			Scr = Intro_Crowds
		}
		{
			time = 0
			Scr = After_Loading_Screen_Kill_Global
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
			Scr = ForceCameraChangeForFreeplayIntro
		}
		{
			time = 100
			Scr = VenueFastIntro_FX
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
		{
			time = 100
			Scr = tutorial_enable_pause
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_FastIntroTutorial_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_FastIntroTutorial_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = BandManager_SetPlayingIntroAnims
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
			Scr = Intro_Crowds
		}
		{
			time = 0
			Scr = After_Loading_Screen_Kill_Global
		}
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = BandManager_SetPlayingIntroAnims
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
			Scr = BandManager_SetPlayingIntroAnims
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
			time = 0
			Scr = VenueIntro_FX
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
		{
			time = 100
			Scr = Start_Preloaded_Intro_Stream
		}
		{
			time = 100
			Scr = Play_Crowd_For_Hyperspace_Only
		}
		{
			time = 100
			Scr = GH_SFX_Intro_WarmUp
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_FinalBandIntro_Transition = {
	time = 20000
	ScriptTable = [
	]
}
Common_FinalBandIntro_Transition = {
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
			Scr = Start_Preloaded_Celeb_Intro_Stream
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
			Scr = kill_gem_scroller
			params = {
				type = Outro
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
			time = 0
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = good
			}
		}
		{
			time = 100
			Scr = CameraCuts_EnableChangeCam
			params = {
				enable = false
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
			time = 100
			Scr = Start_Preloaded_Encore_Event_Stream
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
				type = Outro
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
Default_SongWonFreeplay_Transition = {
	time = 5000
	ScriptTable = [
	]
}
Common_SongWonFreeplay_Transition = {
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
				type = Outro
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
Default_SongDoneAttract_Transition = {
	time = 1000
	ScriptTable = [
	]
}
Common_SongDoneAttract_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				type = Outro
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
				enable = false
			}
		}
	]
}
Default_SongOutro_Transition = {
	time = 60000
	ScriptTable = [
	]
}
Common_SongOutro_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_moments'
				changenow
				name = Moment01
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
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = bad
			}
		}
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				type = Outro
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
Default_FinalBandOutro_Transition = {
	time = 10000
	ScriptTable = [
	]
}
Common_FinalBandOutro_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				type = Outro
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
			Scr = Start_Preloaded_FinalBandOutro_Stream
		}
	]
	EndWithDefaultCamera
}
Default_Loading_Transition = {
	time = 250
	ScriptTable = [
	]
}
Common_Loading_Transition = {
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
			time = 0
			Scr = CreateInVenueLoadingScreen
			params = {
			}
		}
		{
			time = 100
			Scr = CameraCuts_EnableChangeCam
			params = {
				enable = false
			}
		}
		{
			time = 100
			Scr = PauseInVenueLoadingScreen
			params = {
			}
		}
	]
}
Default_OnlineLoading_Transition = {
	time = 500
	ScriptTable = [
	]
}
Common_OnlineLoading_Transition = {
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
			time = 0
			Scr = CreateInVenueLoadingScreen
			params = {
			}
		}
		{
			time = 100
			Scr = CameraCuts_EnableChangeCam
			params = {
				enable = false
			}
		}
		{
			time = 100
			Scr = PauseInVenueLoadingScreen
			params = {
			}
		}
	]
}
Default_LoadingIntro_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_LoadingIntro_Transition = {
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
			Scr = BandManager_SetPlayingIntroAnims
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
Default_CelebIntro_Transition = {
	time = 10000
	ScriptTable = [
	]
}
Common_CelebIntro_Transition = {
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
			}
		}
		{
			time = 0
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 0
			Scr = CelebIntro_FX
		}
		{
			time = 100
			Scr = Start_Preloaded_Celeb_Intro_Stream
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

script CreateInVenueLoadingScreen 
	GameMode_GetType
	if ($is_network_game = 1 && ((<type> = career) || (<type> = quickplay)))
		ui_event_wait \{event = menu_change
			data = {
				state = UIstate_song_breakdown
				continue_setlist_transition
			}}
	elseif ($is_network_game = 0)
		if ((<type> = pro_faceoff) || (<type> = competitive))
			ui_event_wait \{event = menu_change
				data = {
					state = UIstate_song_breakdown_competitive
					continue_setlist_transition
				}}
		else
			if (<type> = freeplay)
			else
				ui_event_wait \{event = menu_change
					data = {
						state = UIstate_song_breakdown
						continue_setlist_transition
					}}
			endif
		endif
	else
		ui_event_wait \{event = menu_change
			data = {
				state = UIstate_song_breakdown_competitive
				continue_setlist_transition
			}}
	endif
endscript

script PauseInVenueLoadingScreen 
	GameMode_GetType
	if (<type> = freeplay)
		return
	endif
	if ($is_network_game = 1)
		Change \{songtime_paused = 1}
		begin
		if ($use_old_system_setup = 1)
			if ($transition_song_loading_hack = 0)
				if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
					break
				elseif ScreenElementExists \{id = song_breakdown_competitive_id}
					break
				endif
			endif
		else
			if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
				break
			elseif ScreenElementExists \{id = song_breakdown_competitive_id}
				break
			endif
		endif
		wait \{1
			gameframe}
		repeat
		GetNumPlayers
		get_local_players_in_game
		if (<type> = pro_faceoff || <type> = competitive)
			continue_between_net_songs
		elseif (<num_local_players> >= <num_players>)
			if (<type> = quickplay)
				ui_song_breakdown_setup_handler_scripts \{net_transition_not_career}
			else
				ui_song_breakdown_setup_handler_scripts \{end_of_setlist_transition}
			endif
		else
			generic_net_sync \{callback = continue_between_net_songs}
		endif
		return
	endif
	if (($current_transition) = Encore)
		return
	endif
	Change \{songtime_paused = 1}
	begin
	if ($use_old_system_setup = 1)
		if ($transition_song_loading_hack = 0)
			if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
				break
			elseif ScreenElementExists \{id = song_breakdown_competitive_id}
				break
			endif
		endif
	else
		if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
			break
		elseif ScreenElementExists \{id = song_breakdown_competitive_id}
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
	wait \{1
		gameframe}
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		ui_song_breakdown_setup_handler_scripts \{add_setlist_continue_handlers}
	elseif ScreenElementExists \{id = song_breakdown_competitive_id}
		ui_song_breakdown_competitive_setup_handler_scripts \{add_setlist_continue_handlers}
	endif
endscript

script Common_Loading_TransitionEnd 
	printscriptinfo \{'Common_Loading_TransitionEnd'}
	GMan_SongTool_GetCurrentSong
	if GotParam \{current_song}
		if (<current_song> = jamsession)
			return
		endif
	endif
	GameMode_GetType
	if (($is_network_game = 1 && <type> = career) || $is_network_game = 0)
		ui_event \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
		if CompositeObjectExists \{name = Vocalist}
			Vocalist :unhide
			Vocalist :Ragdoll_MarkForReset
		endif
	endif
endscript
debug_celeb_intros = 0

script Transition_SelectTransition \{practice_intro = 0}
	Change \{finalbandintro_transition_playing = 0}
	next_zone = (($LevelZones.$current_level).zone)
	GetPakManCurrent \{map = zones}
	if (<pak> != (($LevelZones.$current_level).zone))
		Change \{encore_transitioned_played = false}
	endif
	if ($debug_encore)
		Change \{current_transition = Encore}
		Change \{debug_encore = 0}
		return
	endif
	if (<practice_intro> = 1)
		return
	endif
	if ($current_transition = debugintro)
		Change \{current_transition = intro}
		return
	endif
	if ($current_transition = forcelongintro)
		Change \{current_transition = intro}
		return
	endif
	if ($game_mode = career)
		GMan_SongTool_GetCurrentSong
		if Transition_SelectCelebTransition
			return
		endif
		if Transition_SelectEncoreTransition
			return
		endif
		if should_play_long_venue_intro
			Change \{current_transition = intro}
			return
		endif
	endif
	if ($encore_transitioned_played = true)
		Change \{current_transition = restartencore}
	else
		Change \{current_transition = fastintro}
	endif
endscript

script Transition_SelectCelebTransition 
	GameMode_GetType
	if ((<type> != career) || InInternetMode)
		return
	endif
	current_challenge = None
	if GMan_GoalIsActive \{goal = career}
		GMan_ChallengeManagerFunc \{goal = career
			tool = challenges
			func = get_current_challenge}
	endif
	if NOT ArrayContains array = $gig_celeb_intros contains = <current_challenge>
		return \{false}
	endif
	GetGlobalTags \{celeb_intro_flags}
	if StructureContains structure = <...> <current_challenge>
		<celeb_flag> = (<...>.<current_challenge>)
		if (<celeb_flag> = 1 && $debug_celeb_intros = 0)
			printf \{qs(0x998615af)}
			return \{false}
		endif
	endif
	AddParam name = <current_challenge> value = 1 structure_name = newValue
	if (<current_challenge> = c_PictureToBurn)
		AddParam \{name = c_YouBelongWithMe
			value = 1
			structure_name = newValue}
	elseif (<current_challenge> = c_YouBelongWithMe)
		AddParam \{name = c_PictureToBurn
			value = 1
			structure_name = newValue}
	endif
	SetGlobalTags celeb_intro_flags params = <newValue>
	Change \{current_transition = celebintro}
	return \{true}
endscript

script is_encore_song 
	GameMode_GetType
	if (<type> != career)
		printf \{channel = marc
			qs(0x879b0189)}
		return \{false}
	endif
	current_challenge = None
	if GMan_GoalIsActive \{goal = career}
		GMan_ChallengeManagerFunc \{goal = career
			tool = challenges
			func = get_current_challenge}
	endif
	if ArrayContains array = $gig_encores contains = <current_challenge>
		return \{true}
	endif
	if ($gig_champion = <current_challenge>)
		return \{true}
	endif
	return \{false}
endscript

script Transition_DoesCurrentVenueSupportEncore 
	GMan_VenueFunc \{goal = career
		tool = venue_handler
		func = get_current_venue}
	switch <current_venue>
		case load_Z_Space
		case load_Z_Cube
		case load_z_visualizer
		return \{false}
		case load_Z_Gorge
		if InInternetMode
			return \{false}
		endif
	endswitch
	return \{true}
endscript
encore_transitioned_played = false

script Transition_SelectEncoreTransition 
	if InInternetMode
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
	if NOT Transition_DoesCurrentVenueSupportEncore
		return
	endif
	printf \{channel = marc
		qs(0x5cd130b4)}
	Change \{current_transition = Encore}
	return \{true}
endscript

script Transition_KillAll 
	killspawnedscript \{id = Transitions}
	Change \{transition_playing = false}
	Change \{current_playing_transition = None}
endscript

script Transition_GetPrefix \{type = intro}
	celeb_intro = 0
	if StructureContains structure = $Transition_Types <type>
		printstruct <...>
		type_textnl = ($Transition_Types.<type>.textnl)
	endif
	if NOT GotParam \{type_textnl}
		printstruct <...>
		ScriptAssert \{qs(0xf6d7c577)}
	endif
	return type_textnl = <type_textnl> celeb_intro = <celeb_intro>
endscript

script Transition_GetProps 
	Transition_GetPrefix <...>
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = Transition_Props '%s_%p_Transition' p = <type_textnl> s = <pakname>
	if NOT GlobalExists name = <Transition_Props>
		FormatText checksumname = Transition_Props 'default_%p_Transition' p = <type_textnl> s = <pakname>
	endif
	if (<celeb_intro> = 1)
		if NOT GlobalExists name = <Transition_Props>
			Transition_Props = Default_Intro_Transition
		endif
	endif
	FormatText checksumname = Common_Transition_Props 'Common_%p_Transition' p = <type_textnl>
	common_type_textnl = <type_textnl>
	if (<celeb_intro> = 1)
		common_type_textnl = 'intro'
		if NOT GlobalExists name = <Common_Transition_Props>
			Common_Transition_Props = Common_Intro_Transition
		endif
	endif
	return type_textnl = <type_textnl> common_type_textnl = <common_type_textnl> Transition_Props = <Transition_Props> Common_Transition_Props = <Common_Transition_Props>
endscript

script Transition_GetTime \{type = intro}
	Transition_GetProps type = <type>
	return transition_time = ($<Transition_Props>.time)
endscript

script Transition_Play \{type = intro}
	printf 'Transition_Play type=%t' t = <type>
	Transition_KillAll
	Change current_playing_transition = <type>
	LightShow_ClearToneMap \{viewport = bg_viewport}
	Change \{lightshow_usetonemap = 0}
	if (<type> = Encore)
		Change \{encore_transitioned_played = true}
	endif
	Transition_GetProps type = <type>
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = event 'Common_%p_TransitionSetup' p = <common_type_textnl> s = <pakname>
	if ScriptExists <event>
		<event>
	endif
	FormatText checksumname = event '%s_%p_TransitionSetup' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		spawnscriptnow <event>
	endif
	spawnscriptnow Transition_Play_Spawned id = Transitions params = {<...>}
	FormatText checksumname = event 'GuitarEvent_Transition%s' s = <type_textnl>
	if ScriptExists <event>
		spawnscriptnow <event>
	endif
endscript

script Transition_Play_Spawned 
	Change \{transition_playing = true}
	GetPakManCurrentName \{map = zones}
	transition_time = ($<Transition_Props>.time)
	spawnscriptnow Transition_Play_Iterator id = Transitions params = {<...>}
	spawnscriptnow Transition_Play_Iterator id = Transitions params = {<...> Transition_Props = <Common_Transition_Props>}
	GetSongTimeMs
	time_offset = (0 - <time>)
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<transition_time> <= <time>)
		Change \{transition_playing = false}
		break
	endif
	wait \{1
		gameframe}
	repeat
	if StructureContains structure = ($<Common_Transition_Props>) EndWithDefaultCamera
		GMan_SongTool_GetCurrentSong
		if ($finalbandintro_transition_playing = 1)
			if ($current_playing_transition = finalbandintro)
				Change \{finalbandintro_transition_playing = 0}
			else
				StopRendering
			endif
		elseif ($game_mode = p2_pro_faceoff)
			CameraCuts_EnableChangeCam \{enable = false}
			GetFPS
			delay_ms = (0.0 - $time_input_offset)
			ms_per_frame = (1000.0 / <fps>)
			frames = (<delay_ms> / <ms_per_frame>)
			CastToInteger \{frames}
			wait <frames> gameframes
			if (<current_song> = jamsession)
				CameraCuts_SetArrayPrefix \{prefix = 'cameras_jam_mode'
					changenow}
			else
				CameraCuts_SetArrayPrefix \{prefix = 'cameras_headtohead'
					changenow}
			endif
		else
			if StructureContains structure = ($<Common_Transition_Props>) SyncWithNoteCameras
				CameraCuts_GetNextNoteCameraTime
				GetSongTimeMs
				if (<camera_time> >= -200 &&
						<camera_time> - <time> < 2000)
					CameraCuts_EnableChangeCam \{enable = false}
				else
					if NOT ($game_mode = tutorial || $game_mode = practice)
						CameraCuts_SetArrayPrefix \{prefix = 'cameras'
							changenow}
					else
						CameraCuts_EnableChangeCam \{enable = false}
					endif
				endif
			else
				if NOT ($game_mode = tutorial || $game_mode = practice)
					CameraCuts_SetArrayPrefix \{prefix = 'cameras'
						changenow}
				else
					CameraCuts_EnableChangeCam \{enable = false}
				endif
			endif
		endif
	endif
	FormatText checksumname = event 'Common_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		spawnscriptnow <event>
	endif
	FormatText checksumname = event '%s_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		spawnscriptnow <event>
	endif
	Change \{current_playing_transition = None}
endscript

script IsTransitionPlaying 
	if GotParam \{type}
		if (<type> = $current_playing_transition)
			return \{true}
		endif
	else
		if NOT (<type> = None)
			return \{true}
		endif
	endif
	return \{false}
endscript

script Transition_Play_Iterator 
	GetSongTimeMs
	time_offset = (0 - <time>)
	GetArraySize ($<Transition_Props>.ScriptTable)
	if (<array_size> = 0)
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
	wait \{1
		gameframe}
	repeat
	if ScriptExists ($<Transition_Props>.ScriptTable [<array_count>].Scr)
		spawnscriptnow ($<Transition_Props>.ScriptTable [<array_count>].Scr) id = Transitions params = {transition_time = <transition_time> ($<Transition_Props>.ScriptTable [<array_count>].params)}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script Transition_Wait 
	begin
	if ($transition_playing = false)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script ClipPlayDrummerCamera 
	if NOT GotParam \{anim}
		ScriptAssert \{qs(0xcdaa0a64)}
	endif
	if NOT GotParam \{index}
		ScriptAssert \{qs(0xd509756d)}
	endif
	if (<index> < 10)
		FormatText checksumname = lock_target qs(0x5dd349ea) i = <index>
	else
		FormatText checksumname = lock_target qs(0x62a45e78) i = <index>
	endif
	MomentCamera_PlayAnim {anim = <anim> $drumcam_params lock_target = <lock_target>}
endscript

script Transition_SetCamera 
	if NOT GotParam \{note}
		return
	endif
	if GetNoteMapping section = Cameras note = <note>
		clip_get_time_and_frame
		spawnscriptnow (<note_data>.Scr) params = {(<note_data>.params) length = <length>}
	else
	endif
endscript

script MomentCamera_PlayAnim \{Cycle = 0
		start = 0.0
		BlendDuration = 0.0
		speed = 1.0
		TimerType = tempo}
	if NOT CompositeObjectExists name = <lock_target>
		printf channel = anim_info qs(0xb08c6979) a = <lock_target>
		return
	endif
	SetSearchAllAssetContexts
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	if GotParam \{start_node_crc}
		GetWaypointPos name = <start_node_crc>
		GetWaypointDir name = <start_node_crc>
		<lock_target> :Obj_SetPosition position = <Pos>
		<lock_target> :Obj_SetOrientation Dir = <Dir>
	elseif GotParam \{start_node}
		ExtendCrc <pak> <start_node> out = start_node_id
		GetWaypointPos name = <start_node_id>
		GetWaypointDir name = <start_node_id>
		<lock_target> :Obj_SetPosition position = <Pos>
		<lock_target> :Obj_SetOrientation Dir = <Dir>
	else
		suffix = ('_' + <node>)
		AppendSuffixToChecksum base = <pak> SuffixString = <suffix>
		if CompositeObjectExists name = <appended_id>
			<appended_id> :Obj_GetPosition
			<lock_target> :Obj_SetPosition position = <Pos>
			<appended_id> :Obj_GetOrientation
			Dir = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
			<lock_target> :Obj_SetOrientation Dir = <Dir>
		else
			printf channel = anim_info qs(0xc0212f38) a = <appended_id>
		endif
	endif
	if NOT GotParam \{tempo_anim}
		tempo_anim = <anim>
	endif
	spawnscriptnow MomentCamera_PlayAnim_Spawned params = {name = <lock_target> anim = <anim> TempoAnim = <tempo_anim> Cycle = <Cycle> start = <start> BlendDuration = <BlendDuration> speed = <speed> TimerType = <TimerType>}
	SetSearchAllAssetContexts \{off}
endscript

script MomentCamera_PlayAnim_Spawned \{start = 0.0
		speed = 1.0
		BlendDuration = -1.0
		TimerType = tempo}
	printf \{qs(0xc2684cb9)
		channel = AnimInfo}
	if NOT CompositeObjectExists name = <name>
		printf qs(0x9e08b783) a = <name>
		return
	endif
	begin
	SetSearchAllAssetContexts
	if NOT GotParam \{anim}
		<name> :Anim_GetDefaultAnimName
		anim = <defaultAnimName>
	endif
	if NOT GotParam \{TempoAnim}
		TempoAnim = anim
	endif
	<name> :RemoveTags [AnimRequestedFOVRadians]
	<name> :Anim_Enable
	<name> :Anim_Command target = Body Command = DegenerateBlend_AddBranch params = {
		Tree = $SpecialCamera_StandardAnimBranch
		BlendDuration = <BlendDuration>
		params = {
			anim = <anim>
			speed = <speed>
			TimerType = <TimerType>
			start = <start>
			AnimEvents = on
			TempoAnim = <TempoAnim>
			AllowBeatSkipping = true
		}
	}
	<name> :anim_update active_camera_override = true
	<name> :Anim_Command target = BodyTimer Command = Timer_WaitAnimComplete
	SetSearchAllAssetContexts \{off}
	if (<Cycle> = 0)
		break
	endif
	start = 0.0
	repeat
endscript

script SpecialCamera_PlayAnim \{Cycle = 0
		start = 0.0}
	SetSearchAllAssetContexts
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	FormatText TextName = suffix '_%s' s = <Obj>
	AppendSuffixToChecksum base = <pak> SuffixString = <suffix>
	cameraname = (<pakname> + <suffix>)
	if CompositeObjectExists name = <appended_id>
		<appended_id> :Obj_SwitchScript SpecialCamera_PlayAnim_Spawned params = {anim = <anim> Cycle = <Cycle> start = <start> BlendDuration = <BlendDuration>}
	else
		printf qs(0x5f796dcf) s = <cameraname>
	endif
	SetSearchAllAssetContexts \{off}
endscript

script SpecialCamera_PlayAnim_Spawned \{start = 0.0
		speed = 1.0
		BlendDuration = -1.0}
	begin
	SetSearchAllAssetContexts
	if NOT GotParam \{anim}
		Anim_GetDefaultAnimName
		anim = <defaultAnimName>
	endif
	if NOT GotParam \{TempoAnim}
		TempoAnim = anim
	endif
	printf qs(0x0c017022) a = <anim> b = <TempoAnim>
	RemoveTags \{[
			AnimRequestedFOVRadians
		]}
	Anim_Enable
	Anim_Command target = Body Command = DegenerateBlend_AddBranch params = {
		Tree = $SpecialCamera_StandardAnimBranch
		BlendDuration = <BlendDuration>
		params = {
			anim = <anim>
			speed = <speed>
			TimerType = tempo
			start = <start>
			AnimEvents = on
			TempoAnim = <TempoAnim>
			AllowBeatSkipping = true
		}
	}
	SpecialCamera_WaitAnimFinished
	SetSearchAllAssetContexts \{off}
	if (<Cycle> = 0)
		break
	endif
	repeat
endscript

script SpecialCamera_WaitAnimFinished \{timer = BodyTimer}
	Anim_Command target = <timer> Command = Timer_WaitAnimComplete
endscript
SpecialCamera_StandardAnimBranch = {
	type = TimerType
	id = BodyTimer
	anim = anim
	tempo_anim = TempoAnim
	anim_events = AnimEvents
	allow_beat_skipping = AllowBeatSkipping
	speed = speed
	start = start
	[
		{
			type = Source
			anim = anim
		}
	]
}

script Transition_PlayAnim \{Cycle = 0}
	<Obj> :Obj_SwitchScript Transition_PlayAnim_Spawned params = {anim = <anim> Cycle = <Cycle> BlendDuration = <BlendDuration>}
endscript

script Transition_PlayAnim_Spawned 
	begin
	GameObj_PlayAnim anim = <anim> BlendDuration = <BlendDuration>
	GameObj_WaitAnimFinished
	if (<Cycle> = 0)
		break
	endif
	repeat
endscript

script Transition_CameraCut 
	if GotParam \{prefix}
		if GotParam \{extra_params}
			Change \{CameraCuts_NextExtraParamsSet = 1}
			Change CameraCuts_NextExtraParams = <extra_params>
		endif
		CameraCuts_SetArrayPrefix <...> length = <transition_time>
	else
		if NOT ($current_playing_transition = None)
			Transition_GetPrefix type = ($current_playing_transition)
		else
			Transition_GetPrefix \{type = intro}
		endif
		GetPakManCurrentName \{map = zones}
		FormatText checksumname = cameras_array 'default_cameras_%t' t = <type_textnl>
		FormatText TextName = prefix 'cameras_%t' t = <type_textnl>
		if NOT GlobalExists name = <cameras_array>
			FormatText checksumname = cameras_array '%s_cameras_%t' s = <pakname> t = <type_textnl>
			if NOT GlobalExists name = <cameras_array>
				prefix = 'cameras_intro'
			endif
		endif
		CameraCuts_SetArrayPrefix <...> length = <transition_time>
	endif
endscript

script Transition_StopRendering 
	printf \{qs(0x61460438)}
	if ($game_mode != freeplay)
		StopRendering
	endif
endscript

script Transition_StartRendering 
	printf \{qs(0xeddd15af)}
	StartRendering
	Change \{is_changing_levels = 0}
	if ($blade_active = 1 && $signin_change_happening = 0)
		if ($game_mode != freeplay)
			Change \{blade_active = 0}
			ui_event_wait_for_safe
			gh3_start_pressed
		endif
	endif
endscript

script Transition_Printf 
	printf <...>
endscript

script Transitions_ResetZone 
	printf \{qs(0x119c40dd)}
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = reset_func '%s_ResetTransition' s = <pakname>
	if ScriptExists <reset_func>
		<reset_func>
	endif
	FormatText checksumname = nodearray_checksum '%s_NodeArray' s = <pakname>
	if NOT GlobalExists name = <nodearray_checksum> type = array
		return
	endif
	GetArraySize $<nodearray_checksum>
	array_count = 0
	begin
	resetvalid = true
	if GotParam \{Profile}
		resetvalid = false
		if StructureContains structure = ($<nodearray_checksum> [<array_count>]) Profile
			if CompareStructs struct1 = ($<nodearray_checksum> [<array_count>].Profile) struct2 = (<Profile>)
				resetvalid = true
			endif
		endif
	endif
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedFromVariable
		resetvalid = false
	endif
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedOnProgress
		resetvalid = false
	endif
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) Class
		if NOT ($<nodearray_checksum> [<array_count>].Class = GameObject ||
				$<nodearray_checksum> [<array_count>].Class = LevelGeometry)
			resetvalid = false
		endif
	else
		resetvalid = false
	endif
	nodename = ($<nodearray_checksum> [<array_count>].name)
	if checksumequals a = <nodename> b = Z_Gorge_TRG_Ped_Crowd
		resetvalid = false
	endif
	if checksumequals a = <nodename> b = Z_Cabo_Sky_Pano
		resetvalid = false
	endif
	if checksumequals a = <nodename> b = Z_Cabo_G_JG_Clowds_01
		resetvalid = false
	endif
	if (<resetvalid> = true)
		printf qs(0x9f03166a) s = <nodename>
		kill name = <nodename>
		if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedAtStart
			create name = <nodename>
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script Common_Intro_TransitionSetup 
	printf \{channel = sfx
		qs(0x0ea33ed5)}
	Preload_Intro_Stream
endscript

script Common_PreEncore_TransitionSetup 
	Change_Crowd_Looping_SFX \{crowd_looping_state = good}
endscript

script Common_PreEncore_TransitionEnd 
endscript

script FinalBandIntro_TransitionSetup 
	printf \{channel = sfx
		qs(0x86acca66)}
	Transition_GetPrefix type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = None)
		StopSound unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
	PreLoadStream \{Intro_FinalGig}
	Change celeb_intro_stream_id = <unique_id>
endscript

script Common_FinalBandOutro_TransitionSetup 
	printf \{channel = sfx
		qs(0x52f3ee09)}
	if NOT ($celeb_intro_stream_id = None)
		StopSound unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
	PreLoadStream \{Encore_FinalGig}
	Change celeb_intro_stream_id = <unique_id>
	begin
	printf \{qs(0xb1fb7278)}
	if PreLoadStreamDone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script Common_Encore_TransitionSetup 
	printf \{channel = sfx
		qs(0x456e2c58)}
	Preload_Encore_Event_Stream
endscript

script Common_Encore_TransitionEnd 
endscript

script Preload_Encore_Bink_Audio \{movie_name = 'z_artdeco_encore_audio'}
endscript

script Common_Loading_TransitionSetup 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_metalfest
		printf \{channel = sfx
			qs(0x4c1713bc)}
		default
		printf \{channel = sfx
			qs(0x21a8e0d5)}
	endswitch
endscript
celeb_intro_stream_id = None

script Preload_Celeb_Intro_Stream \{celeb_intro_checksum = None}
	printf \{channel = sfx
		qs(0x9f3ca4a3)}
	Transition_GetPrefix type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = None)
		StopSound unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
	PreLoadStream <celeb_intro_checksum>
	Change celeb_intro_stream_id = <unique_id>
	begin
	printf \{qs(0x50818c55)}
	if PreLoadStreamDone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script Start_Preloaded_Celeb_Intro_Stream \{celeb_intro_vol_name = None}
	printf \{channel = sfx
		qs(0x9ff5df66)}
	if NOT ($celeb_intro_stream_id = None)
		Transition_GetPrefix type = ($current_playing_transition)
		GetVolumeTweakOfPreloadedStream streamname = <celeb_intro_vol_name>
		printf \{channel = sfx
			qs(0x75ea046e)}
		StartPreLoadedStream $celeb_intro_stream_id buss = Encore_Events forcesafepreload = 1 vol = <volumetweak>
		Change \{celeb_intro_stream_id = None}
	endif
endscript
encore_event_stream_id = None

script Preload_Encore_Event_Stream 
	printf \{channel = sfx
		qs(0x03f14c32)}
	if NOT ($encore_event_stream_id = None)
		StopSound unique_id = ($encore_event_stream_id)
		Change \{encore_event_stream_id = None}
	endif
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = encore_stream_name '%s_encore' s = <pakname> AddToStringLookup = true
	printf channel = sfx qs(0x26698a56) s = <encore_stream_name>
	PreLoadStream <encore_stream_name>
	Change encore_event_stream_id = <unique_id>
	begin
	printf \{channel = sfx
		qs(0x93305209)}
	if PreLoadStreamDone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script Start_Preloaded_Encore_Event_Stream 
	printf \{channel = sfx
		qs(0x72abc744)}
	if NOT ($encore_event_stream_id = None)
		StopSoundEvent \{$Current_Crowd_Encore
			fade_time = 2.5
			fade_type = log_slow}
		GetPakManCurrentName \{map = zones}
		FormatText checksumname = encore_stream_vol_name '%s_encore' s = <pakname> AddToStringLookup = true
		GetVolumeTweakOfPreloadedStream streamname = <encore_stream_vol_name>
		printf \{channel = sfx
			qs(0xd9aeb1dd)}
		StartPreLoadedStream $encore_event_stream_id buss = Encore_Events forcesafepreload = 1 vol = <volumetweak>
		Change \{encore_event_stream_id = None}
	endif
endscript
intro_stream_id = None

script Preload_Intro_Stream 
	printf \{channel = sfx
		qs(0x3de5a017)}
	if NOT ($intro_stream_id = None)
		StopSound unique_id = ($intro_stream_id)
		Change \{intro_stream_id = None}
	endif
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = intro_stream_name '%s_intro' s = <pakname> AddToStringLookup = true
	PreLoadStream <intro_stream_name>
	Change intro_stream_id = <unique_id>
	begin
	printf \{channel = sfx
		qs(0xb183e60b)}
	if PreLoadStreamDone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script Start_Preloaded_Intro_Stream 
	printf \{channel = sfx
		qs(0x8071fc13)}
	if NOT ($intro_stream_id = None)
		GetPakManCurrentName \{map = zones}
		FormatText checksumname = encore_stream_vol_name '%s_intro' s = <pakname> AddToStringLookup = true
		GetVolumeTweakOfPreloadedStream streamname = <encore_stream_vol_name>
		printf channel = sfx qs(0x917a0c22) y = <volumetweak>
		printf \{channel = sfx
			qs(0x5488a3ac)}
		StartPreLoadedStream $intro_stream_id buss = Encore_Events vol = <volumetweak> forcesafepreload = 1
		Change \{intro_stream_id = None}
	endif
endscript

script Start_Preloaded_FinalBandOutro_Stream 
	printf \{channel = sfx
		qs(0x12d0a014)}
	if NOT ($celeb_intro_stream_id = None)
		StopSoundEvent \{$Current_Crowd_Encore
			fade_time = 2.5
			fade_type = log_slow}
		GetVolumeTweakOfPreloadedStream \{streamname = Career_Outro}
		printf \{channel = sfx
			qs(0x88b63883)}
		StartPreLoadedStream $celeb_intro_stream_id buss = Encore_Events forcesafepreload = 1 vol = <volumetweak>
		Change \{celeb_intro_stream_id = None}
	endif
endscript

script Kill_Transition_Preload_Streams 
	printf \{channel = sfx
		qs(0x6bbf6407)}
	killspawnedscript \{name = Preload_Encore_Event_Stream}
	killspawnedscript \{name = Preload_Celeb_Intro_Stream}
	killspawnedscript \{name = Preload_Intro_Stream}
	Change \{encore_event_stream_id = None}
	Change \{celeb_intro_stream_id = None}
	Change \{intro_stream_id = None}
endscript

script should_play_long_venue_intro 
	zone = (($LevelZones.$current_level).zone)
	GetGlobalTags \{venue_intro_flags}
	if InNetGame
		return \{false}
	endif
	if ($encore_transitioned_played = true)
		return \{false}
	endif
	printf qs(0x20f729ca) a = <zone>
	if StructureContains structure = <...> <zone>
		<venue_flag> = (<...>.<zone>)
		if (<venue_flag> = 1)
			printf \{qs(0x85a3eba3)}
			return \{false}
		endif
	endif
	printf \{qs(0xc78ea90b)}
	AddParam name = <zone> value = 1 structure_name = newValue
	SetGlobalTags venue_intro_flags params = <newValue>
	return \{true}
endscript
