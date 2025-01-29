transition_playing = FALSE
current_playing_transition = None
finalbandintro_transition_playing = 0
setlist_selection_tier = 1
transition_song_loading_hack = 1
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
}
celeb_intro_transitions = [
	{
		Intro = 'intro'
		song = ringoffire
		venue = load_z_nashville
		part = vocals
	}
	{
		Intro = 'intro_hayley'
		song = miserybusiness
		venue = load_z_recordstore
		part = vocals
	}
	{
		Intro = 'intro_billy'
		song = today
		venue = load_z_cathedral
		part = guitar_vocals
	}
	{
		Intro = 'intro_travis'
		song = dammit
		venue = load_z_military
		part = drums
	}
	{
		Intro = 'intro_jimi'
		song = windcriesmary
		venue = load_z_ballpark
		part = no_replacements
	}
	{
		Intro = 'intro_sting'
		song = demolitionman
		venue = load_z_castle
		part = bass_vocals
	}
]
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
			Scr = intro_crowds
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
			time = 100
			Scr = venuefastintro_fx
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
			Scr = intro_crowds
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
			Scr = venueintro_fx_spawn
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
			Scr = GH_SFX_Intro_WarmUp
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
			Scr = start_preloaded_encore_event_stream
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
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = bad
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
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_lose'
				changenow
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
			time = 0
			Scr = createinvenueloadingscreen
			params = {
			}
		}
		{
			time = 100
			Scr = CameraCuts_EnableChangeCam
			params = {
				enable = FALSE
			}
		}
		{
			time = 100
			Scr = pauseinvenueloadingscreen
			params = {
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
			time = 0
			Scr = createinvenueloadingscreen
			params = {
			}
		}
		{
			time = 100
			Scr = CameraCuts_EnableChangeCam
			params = {
				enable = FALSE
			}
		}
		{
			time = 100
			Scr = pauseinvenueloadingscreen
			params = {
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
			Scr = celebintro_fx
		}
		{
			time = 100
			Scr = start_preloaded_celeb_intro_stream
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

script createinvenueloadingscreen 
	gamemode_gettype
	if ($is_network_game = 1 && ((<Type> = career) || (<Type> = quickplay)))
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_song_breakdown
				continue_setlist_transition
			}}
	elseif ($is_network_game = 0)
		if ((<Type> = pro_faceoff) || (<Type> = competitive))
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_song_breakdown_competitive
					continue_setlist_transition
				}}
		else
			if (<Type> = freeplay)
			else
				ui_event_wait \{event = menu_change
					data = {
						state = uistate_song_breakdown
						continue_setlist_transition
					}}
			endif
		endif
	else
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_song_breakdown_competitive
				continue_setlist_transition
			}}
	endif
endscript

script pauseinvenueloadingscreen 
	gamemode_gettype
	if (<Type> = freeplay)
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
		Wait \{1
			gameframe}
		repeat
		GetNumPlayers
		get_local_players_in_game
		if (<Type> = pro_faceoff || <Type> = competitive)
			continue_between_net_songs
		elseif (<num_local_players> >= <num_players>)
			if (<Type> = quickplay)
				ui_song_breakdown_setup_handler_scripts \{net_transition_not_career}
			else
				ui_song_breakdown_setup_handler_scripts \{end_of_setlist_transition}
			endif
		else
			generic_net_sync \{callback = continue_between_net_songs}
		endif
		return
	endif
	if (($current_transition) = ENCORE)
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
	Wait \{1
		gameframe}
	repeat
	Wait \{1
		gameframe}
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		ui_song_breakdown_setup_handler_scripts \{add_setlist_continue_handlers}
	elseif ScreenElementExists \{id = song_breakdown_competitive_id}
		ui_song_breakdown_competitive_setup_handler_scripts \{add_setlist_continue_handlers}
	endif
endscript

script common_loading_transitionend 
	printscriptinfo \{'Common_Loading_TransitionEnd'}
	gman_songtool_getcurrentsong
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
			vocalist :Ragdoll_MarkForReset
		endif
	endif
endscript
debug_celeb_intros = 0

script Transition_SelectTransition \{practice_intro = 0}
	Change \{finalbandintro_transition_playing = 0}
	next_zone = (($LevelZones.$current_level).zone)
	GetPakManCurrent \{map = zones}
	if (<pak> != (($LevelZones.$current_level).zone))
		Change \{encore_transitioned_played = FALSE}
	endif
	if ($debug_encore)
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
		gman_songtool_getcurrentsong
		if transition_selectcelebtransition
			return
		endif
		if transition_selectencoretransition
			return
		endif
		if should_play_long_venue_intro
			Change \{current_transition = Intro}
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
	gamemode_gettype
	if ((<Type> != career) || ininternetmode)
		return
	endif
	current_challenge = None
	if GMan_GoalIsActive \{goal = career}
		gman_challengemanagerfunc \{goal = career
			tool = challenges
			func = get_current_challenge}
	endif
	if NOT ArrayContains array = $gig_celeb_intros contains = <current_challenge>
		return \{FALSE}
	endif
	GetGlobalTags \{celeb_intro_flags}
	if StructureContains structure = <...> <current_challenge>
		<celeb_flag> = (<...>.<current_challenge>)
		if (<celeb_flag> = 1 && $debug_celeb_intros = 0)
			printf \{qs(0x998615af)}
			return \{FALSE}
		endif
	endif
	AddParam Name = <current_challenge> value = 1 structure_name = NewValue
	SetGlobalTags celeb_intro_flags params = <NewValue>
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
	current_challenge = None
	if GMan_GoalIsActive \{goal = career}
		gman_challengemanagerfunc \{goal = career
			tool = challenges
			func = get_current_challenge}
	endif
	if ArrayContains array = $gig_encores contains = <current_challenge>
		return \{true}
	endif
	if ($gig_champion = <current_challenge>)
		return \{true}
	endif
	return \{FALSE}
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

script Transition_KillAll 
	KillSpawnedScript \{id = transitions}
	Change \{transition_playing = FALSE}
	Change \{current_playing_transition = None}
endscript

script transition_getprefix \{Type = Intro}
	celeb_intro = 0
	if StructureContains structure = $Transition_Types <Type>
		printstruct <...>
		type_textnl = ($Transition_Types.<Type>.textnl)
	else
		GetArraySize ($celeb_intro_transitions)
		index = 0
		begin
		formatText checksumName = transition '%s' s = ($celeb_intro_transitions [<index>].Intro)
		if (<Type> = <transition>)
			type_textnl = ($celeb_intro_transitions [<index>].Intro)
			celeb_intro = 1
			break
		endif
		index = (<index> + 1)
		repeat <array_Size>
	endif
	if NOT GotParam \{type_textnl}
		printstruct <...>
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

script Transition_Play \{Type = Intro}
	printf 'Transition_Play type=%t' t = <Type>
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
	SpawnScriptNow Transition_Play_Spawned id = transitions params = {<...>}
	formatText checksumName = event 'GuitarEvent_Transition%s' s = <type_textnl>
	if ScriptExists <event>
		SpawnScriptNow <event>
	endif
endscript

script Transition_Play_Spawned 
	Change \{transition_playing = true}
	GetPakManCurrentName \{map = zones}
	transition_time = ($<Transition_Props>.time)
	SpawnScriptNow Transition_Play_Iterator id = transitions params = {<...>}
	SpawnScriptNow Transition_Play_Iterator id = transitions params = {<...> Transition_Props = <common_transition_props>}
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
	if StructureContains structure = ($<common_transition_props>) EndWithDefaultCamera
		gman_songtool_getcurrentsong
		if ($finalbandintro_transition_playing = 1)
			if ($current_playing_transition = finalbandintro)
				Change \{finalbandintro_transition_playing = 0}
			else
				StopRendering
			endif
		elseif ($game_mode = p2_pro_faceoff)
			CameraCuts_EnableChangeCam \{enable = FALSE}
			getfps
			delay_ms = (0.0 - $time_input_offset)
			ms_per_frame = (1000.0 / <fps>)
			frames = (<delay_ms> / <ms_per_frame>)
			CastToInteger \{frames}
			Wait <frames> gameframes
			if (<current_song> = jamsession)
				CameraCuts_SetArrayPrefix \{prefix = 'cameras_jam_mode'
					changenow}
			else
				CameraCuts_SetArrayPrefix \{prefix = 'cameras_headtohead'
					changenow}
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
	if NOT GotParam \{note}
		return
	endif
	if GetNoteMapping section = cameras note = <note>
		clip_get_time_and_frame
		SpawnScriptNow (<note_data>.Scr) params = {(<note_data>.params) length = <length>}
	else
	endif
endscript

script momentcamera_playanim \{cycle = 0
		start = 0.0
		BlendDuration = 0.0}
	if NOT CompositeObjectExists Name = <lock_target>
		printf channel = anim_info qs(0xb08c6979) a = <lock_target>
		return
	endif
	SetSearchAllAssetContexts
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	if GotParam \{start_node}
		ExtendCrc <pak> <start_node> out = start_node_id
		GetWaypointPos Name = <start_node_id>
		GetWaypointDir Name = <start_node_id>
		<lock_target> :Obj_SetPosition position = <Pos>
		<lock_target> :Obj_SetOrientation Dir = <Dir>
	else
		suffix = ('_' + <node>)
		AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
		if CompositeObjectExists Name = <appended_id>
			<appended_id> :Obj_GetPosition
			<lock_target> :Obj_SetPosition position = <Pos>
			<appended_id> :Obj_GetOrientation
			Dir = ((1.0, 0.0, 0.0) * <X> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
			<lock_target> :Obj_SetOrientation Dir = <Dir>
		else
			printf channel = anim_info qs(0xc0212f38) a = <appended_id>
		endif
	endif
	if NOT GotParam \{tempo_anim}
		tempo_anim = <anim>
	endif
	SpawnScriptNow momentcamera_playanim_spawned params = {Name = <lock_target> anim = <anim> tempoanim = <tempo_anim> cycle = <cycle> start = <start> BlendDuration = <BlendDuration>}
	SetSearchAllAssetContexts \{OFF}
endscript

script momentcamera_playanim_spawned \{start = 0.0
		speed = 1.0
		BlendDuration = -1.0}
	printf \{qs(0xc2684cb9)
		channel = AnimInfo}
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
			TimerType = tempo
			start = <start>
			AnimEvents = On
			tempoanim = <tempoanim>
			allowbeatskipping = true
		}
	}
	<Name> :Anim_Command target = BodyTimer Command = Timer_WaitAnimComplete
	SetSearchAllAssetContexts \{OFF}
	if (<cycle> = 0)
		break
	endif
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
	printf \{qs(0x61460438)}
	if ($game_mode != freeplay)
		StopRendering
	endif
endscript

script Transition_StartRendering 
	printf \{qs(0xeddd15af)}
	StartRendering
	Change \{is_changing_levels = 0}
	if ($blade_active = 1)
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
	if (<resetvalid> = true)
		printf qs(0x9f03166a) s = ($<nodearray_checksum> [<array_count>].Name)
		kill Name = ($<nodearray_checksum> [<array_count>].Name)
		if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedAtStart
			create Name = ($<nodearray_checksum> [<array_count>].Name)
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script common_intro_transitionsetup 
	printf \{channel = sfx
		qs(0x0ea33ed5)}
	preload_intro_stream
endscript

script Common_PreEncore_TransitionSetup 
	Change_Crowd_Looping_SFX \{crowd_looping_state = good}
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

script Common_Encore_TransitionSetup 
	printf \{channel = sfx
		qs(0x456e2c58)}
	preload_encore_event_stream
endscript

script Common_Encore_TransitionEnd 
endscript

script Preload_Encore_Bink_Audio \{movie_name = 'z_artdeco_encore_audio'}
endscript

script common_loading_transitionsetup 
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

script preload_celeb_intro_stream \{celeb_intro_checksum = None}
	printf \{channel = sfx
		qs(0x9f3ca4a3)}
	transition_getprefix Type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = None)
		stopsound unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
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
		getvolumetweakofpreloadedstream streamname = <celeb_intro_vol_name>
		printf \{channel = sfx
			qs(0x75ea046e)}
		StartPreLoadedStream $celeb_intro_stream_id buss = Encore_Events forcesafepreload = 1 vol = <volumetweak>
		Change \{celeb_intro_stream_id = None}
	endif
endscript
encore_event_stream_id = None

script preload_encore_event_stream 
	printf \{channel = sfx
		qs(0x03f14c32)}
	if NOT ($encore_event_stream_id = None)
		stopsound unique_id = ($encore_event_stream_id)
		Change \{encore_event_stream_id = None}
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = encore_stream_name '%s_encore' s = <pakname> AddToStringLookup = true
	printf channel = sfx qs(0x26698a56) s = <encore_stream_name>
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
	if NOT ($encore_event_stream_id = None)
		StopSoundEvent \{$current_crowd_encore
			fade_time = 2.5
			fade_type = log_slow}
		GetPakManCurrentName \{map = zones}
		formatText checksumName = encore_stream_vol_name '%s_encore' s = <pakname> AddToStringLookup = true
		getvolumetweakofpreloadedstream streamname = <encore_stream_vol_name>
		printf \{channel = sfx
			qs(0xd9aeb1dd)}
		StartPreLoadedStream $encore_event_stream_id buss = Encore_Events forcesafepreload = 1 vol = <volumetweak>
		Change \{encore_event_stream_id = None}
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
		getvolumetweakofpreloadedstream streamname = <encore_stream_vol_name>
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
		StopSoundEvent \{$current_crowd_encore
			fade_time = 2.5
			fade_type = log_slow}
		getvolumetweakofpreloadedstream \{streamname = career_outro}
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
	GetGlobalTags \{venue_intro_flags}
	if InNetGame
		return \{FALSE}
	endif
	if ($encore_transitioned_played = true)
		return \{FALSE}
	endif
	printf qs(0x20f729ca) a = <zone>
	if StructureContains structure = <...> <zone>
		<venue_flag> = (<...>.<zone>)
		if (<venue_flag> = 1)
			printf \{qs(0x85a3eba3)}
			return \{FALSE}
		endif
	endif
	printf \{qs(0xc78ea90b)}
	AddParam Name = <zone> value = 1 structure_name = NewValue
	SetGlobalTags venue_intro_flags params = <NewValue>
	return \{true}
endscript
