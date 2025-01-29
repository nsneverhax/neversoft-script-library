transition_playing = FALSE
current_playing_transition = None
finalbandintro_transition_playing = 0
skipping_jimmy_encore_anim = 0
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
	loading = {
		textnl = 'loading'
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
}
celeb_intro_transitions = [
	{
		Intro = 'intro_ozzy'
		song = mrcrowley
		venue = load_z_metalfest
		part = vocals
	}
	{
		Intro = 'intro_zakk'
		song = bosszakk
		venue = load_z_bayou
		part = guitar_vocals
		boss_song = true
		show_boss_helper_screen
	}
	{
		Intro = 'intro_zakk'
		song = stillborn
		venue = load_z_bayou
		part = guitar_vocals
		boss_song = FALSE
	}
	{
		Intro = 'intro_hayley'
		song = miserybusiness
		venue = load_z_recordstore
		part = vocals
	}
	{
		Intro = 'intro_ted'
		song = bossted
		venue = load_z_fairgrounds
		part = guitar
		boss_song = true
		show_boss_helper_screen
	}
	{
		Intro = 'intro_ted'
		song = stranglehold
		venue = load_z_fairgrounds
		part = guitar
		boss_song = FALSE
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
			Scr = bandmanager_setplayingintroanims
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
			Scr = band_playtransitionidles
			params = {
				from_restart = true
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
			Scr = training_setup_camera
			params = {
				Name = CameraCutCam
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
			Scr = band_playtransitionidles
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
			Scr = band_playtransitionidles
			params = {
				from_restart = true
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
			Scr = band_playtransitionidles
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
			Scr = start_preloaded_celeb_intro_stream
		}
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
default_finalbandintro_transition = {
	time = 20000
	ScriptTable = [
	]
}
common_finalbandintro_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = start_preloaded_celeb_intro_stream
		}
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
			Scr = 0x86ce76d8
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
		{
			time = 0
			Scr = 0x8c046839
			params = {
			}
		}
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
			Scr = start_preloaded_encore_event_stream
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
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_PreBoss_Transition = {
	time = 10000
	ScriptTable = [
	]
}
Common_PreBoss_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = 0x86ce76d8
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
				prefix = 'cameras_preboss'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
Default_Boss_Transition = {
	time = 8000
	ScriptTable = [
	]
}
Common_Boss_Transition = {
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
Default_SongWon_Transition = {
	time = 10000
	ScriptTable = [
	]
}
Common_SongWon_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = 0x86ce76d8
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
			Scr = 0x86ce76d8
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
	time = 12000
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
			}
		}
		{
			time = 0
			Scr = createinvenueloadingscreen
			params = {
			}
		}
	]
}
default_loadingintro_transition = {
	time = 12000
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
			Scr = band_playtransitionidles
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}

script createinvenueloadingscreen 
	gamemode_gettype
	if NOT (($current_transition) = ENCORE)
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_song_breakdown
			}}
	else
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_encore_confirmation
			}}
	endif
endscript
0xa3ce893c = 0

script pauseinvenueloadingscreen 
	begin
	if ScreenElementExists \{id = my_breakdown_id}
		break
	elseif ScreenElementExists \{id = encoreinterface}
		0x4fe76d9d
		break
	else
		WaitOneGameFrame
	endif
	repeat
	Change \{0xa3ce893c = 0}
	begin
	if ($0xa3ce893c = 1)
		if ScreenElementExists \{id = 0x6bb63ae6}
			DestroyScreenElement \{id = 0x6bb63ae6}
		endif
		create_loading_screen
		break
	else
		WaitOneGameFrame
	endif
	repeat
	if ScreenElementExists \{id = my_breakdown_id}
		DestroyScreenElement \{id = my_breakdown_id}
	elseif ScreenElementExists \{id = encoreinterface}
		DestroyScreenElement \{id = encoreinterface}
	endif
	if ScreenElementExists \{id = my_breakdown_id}
		DestroyScreenElement \{id = my_breakdown_id}
	endif
	if ScreenElementExists \{id = user_control_container}
		DestroyScreenElement \{id = user_control_container}
	endif
endscript

script common_loading_transitionend 

	gamemode_gettype
	if (($is_network_game = 1 && <Type> = career) || $is_network_game = 0)
		ui_event \{event = menu_back
			data = {
				state = Uistate_gameplay
			}}
		if CompositeObjectExists \{Name = vocalist}
			vocalist :unhide
		endif
	endif
endscript

script Transition_SelectTransition \{practice_intro = 0
		force_encore = 0}
	Change \{finalbandintro_transition_playing = 0}
	Change \{show_boss_helper_screen = 0}
	Change \{skipping_jimmy_encore_anim = 0}
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
	if ($game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		get_progression_globals ($current_progression_flag) use_current_tab = 1
		Career_Songs = <tier_global>
		Tier = ($current_gig_number)
		formatText checksumName = tier_checksum 'tier%s' s = <Tier>
		if NOT StructureContains structure = ($<Career_Songs>) <tier_checksum>
			Change \{current_transition = Intro}
			return
		endif
		if StructureContains structure = ($<Career_Songs>.<tier_checksum>) play_finalbandintro_transition_type
			if ($current_level = load_z_newyork)
				get_current_band_info
				bandname_id = <band_info>
				Type = ($<Career_Songs>.<tier_checksum>.play_finalbandintro_transition_type)
				GetGlobalTags <bandname_id> param = <Type>
				if (<...>.<Type> = 0)
					AddParam structure_name = new_params Name = <Type> value = 1
					SetGlobalTags <bandname_id> params = <new_params>
					Change \{current_transition = Intro}
					Change \{finalbandintro_transition_playing = 1}
					return
				endif
			endif
		endif
		if Progression_IsEncoreSong tier_global = <tier_global> Tier = <Tier> song = ($current_song)
			band_builder_get_band_global
			if (<Band> = band_hendrix && $current_level != load_z_ballpark)
				Change \{skipping_jimmy_encore_anim = 1}
			else
				Change \{current_transition = ENCORE}
				return
			endif
		endif
		if (<force_encore> = 1)
			Change \{current_transition = ENCORE}
			return
		endif
		if transition_selectcelebtransition
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

script 0x4b275644 
	valid = 1
	if StructureContains structure = ($celeb_intro_transitions [<index>]) song
		if NOT ($current_song = $celeb_intro_transitions [<index>].song)
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
	if StructureContains structure = ($celeb_intro_transitions [<index>]) venue
		if NOT ($current_level = $celeb_intro_transitions [<index>].venue)
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
	if (<num_players_shown> > 1)
		part = ($celeb_intro_transitions [<index>].part)
		switch <part>
			case guitar
			if is_any_player_on_part \{part = guitar}
				return \{FALSE}
			endif
			case guitar_vocals
			if is_any_player_on_part \{part = guitar}
				if is_any_player_on_part \{part = vocals}
					return \{FALSE}
				endif
			endif
			case bass_vocals
			if is_any_player_on_part \{part = bass}
				if is_any_player_on_part \{part = vocals}
					return \{FALSE}
				endif
			endif
			case vocals
			if is_any_player_on_part \{part = vocals}
				return \{FALSE}
			endif
			case drums
			if is_any_player_on_part \{part = drum}
				return \{FALSE}
			endif
			case no_replacements
			valid = <valid>
			default
			return \{FALSE}
		endswitch
	endif
	if StructureContains structure = ($celeb_intro_transitions [<index>]) boss_song
		boss_song = ($celeb_intro_transitions [<index>].Intro)
		gamemode_getnumplayersshown
		if ((<num_players_shown> = 1) && ($player1_status.part = guitar))
			if (<boss_song> = FALSE)
				return \{FALSE}
			endif
		else
			if (<boss_song> = true)
				return \{FALSE}
			endif
		endif
	endif
	return \{true}
endscript

script 0xc982aa27 
	GetArraySize ($celeb_intro_transitions)
	index = 0
	gamemode_getnumplayersshown
	begin
	if 0x4b275644 index = <index> num_players_shown = <num_players_shown>
		return true index = <index>
	endif
	index = (<index> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script transition_selectcelebtransition 
	if 0xc982aa27
		formatText checksumName = transition '%s' s = ($celeb_intro_transitions [<index>].Intro) AddToStringLookup = true
		Change current_transition = <transition>
		if StructureContains structure = ($celeb_intro_transitions [<index>]) show_boss_helper_screen
			Change \{show_boss_helper_screen = 1}
		endif
		return \{true}
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

	Transition_KillAll
	Change current_playing_transition = <Type>
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
	WaitOneGameFrame
	repeat
	if StructureContains structure = ($<common_transition_props>) EndWithDefaultCamera
		if ($finalbandintro_transition_playing = 1)
			if ($current_playing_transition = finalbandintro)
				Change \{finalbandintro_transition_playing = 0}
			else
				StopRendering
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
	if NOT ($0xc5b024f4 = None)
		0xc7acd659 unique_id = ($0xc5b024f4)
		Change \{0xc5b024f4 = None}
	endif
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
	WaitOneGameFrame
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
		0x8dbdaee4 \{qs(0x55ed0195)}
		return
	endif
	WaitOneGameFrame
	repeat
endscript

script momentcamera_playanim \{cycle = 0
		start = 0.0
		BlendDuration = 0.0}
	if NOT CompositeObjectExists Name = <lock_target>

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

	if NOT CompositeObjectExists Name = <Name>

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

script Transition_PlayAnim_Spawned \{cycle = 0}
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

	StopRendering
endscript

script Transition_StartRendering 

	StartRendering
	Change \{is_changing_levels = 0}
	if ($blade_active = 1)
		Change \{blade_active = 0}
		gh3_start_pressed \{from_handler}
	endif
endscript

script Transition_Printf 

endscript

script Transitions_ResetZone 

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

		kill Name = ($<nodearray_checksum> [<array_count>].Name)
		if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedAtStart
			create Name = ($<nodearray_checksum> [<array_count>].Name)
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script common_intro_transitionsetup 

	preload_celeb_intro_stream
endscript

script Common_PreEncore_TransitionSetup 
	Change_Crowd_Looping_SFX \{crowd_looping_state = good}
endscript

script Common_PreEncore_TransitionEnd 
endscript

script finalbandintro_transitionsetup 

	transition_getprefix Type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = None)
		0xc7acd659 unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
	if NOT ($0xc5b024f4 = None)
		0xc7acd659 unique_id = ($0xc5b024f4)
		Change \{0xc5b024f4 = None}
	endif
	return
	PreloadStream \{intro_finalgig}
	Change celeb_intro_stream_id = <unique_id>
endscript

script common_finalbandoutro_transitionsetup 

	if NOT ($celeb_intro_stream_id = None)
		0xc7acd659 unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
	if NOT ($0xc5b024f4 = None)
		0xc7acd659 unique_id = ($0xc5b024f4)
		Change \{0xc5b024f4 = None}
	endif
	return
	PreloadStream \{encore_finalgig}
	Change celeb_intro_stream_id = <unique_id>
	begin

	if PreloadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script Common_Encore_TransitionSetup 

	preload_encore_event_stream
endscript

script Common_Boss_TransitionSetup 
endscript

script Common_Encore_TransitionEnd 
endscript

script Preload_Encore_Bink_Audio \{movie_name = 'z_artdeco_encore_audio'}
	return
endscript

script common_loading_transitionsetup 
endscript
celeb_intro_stream_id = None
0xc5b024f4 = None

script preload_celeb_intro_stream 

	transition_getprefix Type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = None)
		0xc7acd659 unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
	if NOT ($0xc5b024f4 = None)
		0xc7acd659 unique_id = ($0xc5b024f4)
		Change \{0xc5b024f4 = None}
	endif
	if ($current_song = jamsession)
		return
	endif
	if (<celeb_intro> = 0)
		if NOT ($celeb_intro_stream_id = None)
			0xc7acd659 unique_id = ($celeb_intro_stream_id)
			Change \{celeb_intro_stream_id = None}
		endif
		GetPakManCurrentName \{map = zones}
		formatText checksumName = intro_stream_name '%s_intro' s = <pakname> AddToStringLookup = true
		if NOT 0x810401fe filename_crc = <intro_stream_name> 0x3dd98e8d = 22050 stereo = true 0xadfe5540 = true
			return
		endif
		if NOT (<unique_id> = 0x00000000)
			Change celeb_intro_stream_id = <unique_id>
		endif
		if NOT ($celeb_intro_stream_id = None)
			begin

			if PreloadStreamDone <unique_id>
				break
			endif
			Wait \{1
				gameframe}
			repeat
		endif
		return
	endif
	celeb_intro_checksum = ($current_playing_transition)
	if NOT 0x810401fe filename_crc = <celeb_intro_checksum> 0x3dd98e8d = 22050 stereo = true 0xadfe5540 = true
		return
	endif
	if NOT (<unique_id> = 0x00000000)
		Change celeb_intro_stream_id = <unique_id>
	endif
	if NOT ($celeb_intro_stream_id = None)
		begin

		if PreloadStreamDone <unique_id>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
endscript

script start_preloaded_celeb_intro_stream 

	if NOT ($celeb_intro_stream_id = None)
		StartPreLoadedStream \{$celeb_intro_stream_id
			buss = Encore_Events
			forcesafepreload = 1
			pitch = 100}
		Change 0xc5b024f4 = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
endscript
encore_event_stream_id = None

script preload_encore_event_stream 

	if NOT ($encore_event_stream_id = None)
		0xc7acd659 unique_id = ($encore_event_stream_id)
		Change \{encore_event_stream_id = None}
	endif
	if NOT ($0xc5b024f4 = None)
		0xc7acd659 unique_id = ($0xc5b024f4)
		Change \{0xc5b024f4 = None}
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = encore_stream_name '%s_encore' s = <pakname> AddToStringLookup = true
	if NOT 0x810401fe filename_crc = <encore_stream_name> 0x3dd98e8d = 22050 stereo = true 0xadfe5540 = true
		return
	endif
	if NOT (<unique_id> = 0x00000000)
		Change encore_event_stream_id = <unique_id>
	endif
	if NOT ($encore_event_stream_id = None)
		begin

		if PreloadStreamDone <unique_id>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
endscript

script start_preloaded_encore_event_stream 

	if NOT ($encore_event_stream_id = None)
		StopSoundEvent \{$current_crowd_encore
			fade_time = 2.5
			fade_type = log_slow}

		StartPreLoadedStream \{$encore_event_stream_id
			buss = Encore_Events
			forcesafepreload = 1
			pitch = 100}
		Change 0xc5b024f4 = ($encore_event_stream_id)
		Change \{encore_event_stream_id = None}
	endif
endscript

script start_preloaded_finalbandoutro_stream 

	if NOT ($celeb_intro_stream_id = None)
		StopSoundEvent \{$current_crowd_encore
			fade_time = 2.5
			fade_type = log_slow}
		StartPreLoadedStream \{$celeb_intro_stream_id
			buss = Encore_Events
			forcesafepreload = 1
			pitch = 100}
		Change 0xc5b024f4 = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
endscript

script kill_transition_preload_streams 
	KillSpawnedScript \{Name = preload_encore_event_stream}
	KillSpawnedScript \{Name = preload_celeb_intro_stream}
	Change \{encore_event_stream_id = None}
	Change \{celeb_intro_stream_id = None}
endscript

script 0x0ad512cc 
	if ($finalbandintro_transition_playing = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script 0x028d37f2 
	get_progression_globals ($current_progression_flag) game_mode = ($game_mode) use_current_tab = 1
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	GetGlobalTags <gig_name> param = completed

	if (<completed> = 0)
		return \{true}
	else
		return \{FALSE}
	endif
endscript
