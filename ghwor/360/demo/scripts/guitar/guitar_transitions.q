transition_playing = false
current_playing_transition = none
finalbandintro_transition_playing = 0
setlist_selection_tier = 1
transition_types = {
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
	encore = {
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
default_immediate_transition = {
	time = 0
	scripttable = [
	]
}
common_immediate_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras'
				changenow
			}
		}
		{
			time = 0
			scr = play_win_anims
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
}
default_fastintro_transition = {
	time = 3000
	scripttable = [
	]
}
common_fastintro_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = audio_crowd_play_intro_applause_and_swell
		}
		{
			time = 0
			scr = play_intro_anims
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				fast
			}
		}
		{
			time = 100
			scr = forcecamerachangeforfreeplayintro
		}
		{
			time = 166
			scr = tutorial_enable_pause
		}
		{
			time = 166
			scr = transition_startrendering
		}
		{
			time = 2000
			scr = bohemianrhapsody_hack
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_fastintrotutorial_transition = {
	time = 3000
	scripttable = [
	]
}
common_fastintrotutorial_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			scr = play_intro
			params = {
				fast
			}
		}
		{
			time = 0
			scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_restartencore_transition = {
	time = 3000
	scripttable = [
	]
}
common_restartencore_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			scr = audio_crowd_play_intro_applause_and_swell
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				fast
			}
		}
		{
			time = 0
			scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_practice_transition = {
	time = 5000
	scripttable = [
	]
}
common_practice_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				practice
			}
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_intro_transition = {
	time = 20000
	scripttable = [
	]
}
common_intro_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = audio_crowd_play_intro_applause_and_swell
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
			}
		}
		{
			time = 0
			scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			scr = transition_startrendering
		}
		{
			time = 100
			scr = start_preloaded_intro_stream
		}
		{
			time = 100
			scr = audio_gameplay_intro_sfx_warmup
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_finalbandintro_transition = {
	time = 20000
	scripttable = [
	]
}
common_finalbandintro_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_finalbandintro'
				changenow
			}
		}
		{
			time = 60
			scr = start_preloaded_celeb_intro_stream
		}
		{
			time = 60
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_preencore_transition = {
	time = 10000
	scripttable = [
	]
}
common_preencore_transition = {
	scripttable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
			}
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = transition_cameracut
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
			scr = cameracuts_enablechangecam
			params = {
				enable = false
			}
		}
	]
	endwithdefaultcamera
}
default_encore_transition = {
	time = 5000
	scripttable = [
	]
}
common_encore_transition = {
	scripttable = [
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_moments'
				changenow
				name = moment01
			}
		}
		{
			time = 100
			scr = start_preloaded_encore_event_stream
		}
		{
			time = 366
			scr = transition_startrendering
			params = {
				no_curtain = 1
			}
		}
	]
	endwithscript = end_song_after_transformation
	endwithdefaultcamera
	syncwithnotecameras
}
default_songwon_transition = {
	time = 7000
	scripttable = [
	]
}
common_songwon_transition = {
	scripttable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
			}
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_win'
				changenow
			}
		}
	]
	endwithdefaultcamera
}
default_songwonfreeplay_transition = {
	time = 5000
	scripttable = [
	]
}
common_songwonfreeplay_transition = {
	scripttable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
			}
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_win'
				changenow
			}
		}
		{
			time = 0
			scr = freeplay_create_stats_ui
			params = {
			}
		}
	]
	endwithdefaultcamera
}
default_songdoneattract_transition = {
	time = 1000
	scripttable = [
	]
}
common_songdoneattract_transition = {
	scripttable = [
		{
			time = 0
			scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
			}
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = transition_cameracut
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
			scr = cameracuts_enablechangecam
			params = {
				enable = false
			}
		}
	]
}
default_songoutro_transition = {
	time = 60000
	scripttable = [
	]
}
common_songoutro_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_moments'
				changenow
				name = moment01
			}
		}
		{
			time = 0
			scr = play_song_outro_anims
			params = {
			}
		}
	]
	endwithdefaultcamera
}
default_songlost_transition = {
	time = 8000
	scripttable = [
	]
}
common_songlost_transition = {
	scripttable = [
		{
			time = 0
			scr = play_lose_anims
			params = {
			}
		}
		{
			time = 0
			scr = audio_play_fail_sound_to_animation
			params = {
			}
		}
		{
			time = 0
			scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
				song_failed_pitch_streams = 1
			}
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = play_lose_camera
			params = {
			}
		}
		{
			time = 0
			scr = fadetoblack
			params = {
				off
				time = 0.0
				no_wait
			}
		}
	]
	endwithdefaultcamera
}
default_finalbandoutro_transition = {
	time = 10000
	scripttable = [
	]
}
common_finalbandoutro_transition = {
	scripttable = [
		{
			time = 0
			scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
			}
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_finalbandoutro'
				changenow
			}
		}
		{
			time = 0
			scr = start_preloaded_finalbandoutro_stream
		}
	]
	endwithdefaultcamera
}
default_loading_transition = {
	time = 250
	scripttable = [
	]
}
common_loading_transition = {
	scripttable = [
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = transition_cameracut
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
			scr = cameracuts_enablechangecam
			params = {
				enable = false
			}
		}
	]
}
default_onlineloading_transition = {
	time = 500
	scripttable = [
	]
}
common_onlineloading_transition = {
	scripttable = [
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = transition_cameracut
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
			scr = cameracuts_enablechangecam
			params = {
				enable = false
			}
		}
	]
}
default_loadingintro_transition = {
	time = 3000
	scripttable = [
	]
}
common_loadingintro_transition = {
	scripttable = [
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				fast
			}
		}
		{
			time = 0
			scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_celebintro_transition = {
	time = 10000
	scripttable = [
	]
}
common_celebintro_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				no_sound = 1
			}
		}
		{
			time = 0
			scr = celebintro_fx
		}
		{
			time = 100
			scr = start_preloaded_celeb_intro_stream
		}
		{
			time = 100
			scr = audio_gameplay_intro_sfx_warmup
		}
		{
			time = 200
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_careerbandswap_transition = {
	time = -1
	scripttable = [
	]
}
common_careerbandswap_transition = {
	scripttable = [
		{
			time = 0
			scr = play_intro_anims
			params = {
			}
		}
		{
			time = 0
			scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
			}
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 3000
			scr = transition_cameracut
			params = {
				prefix = 'cameras_no_band'
				changenow
			}
		}
		{
			time = 3000
			scr = transition_bandswap
			params = {
			}
		}
	]
	endwithdefaultcamera
}
default_transformationencore_transition = {
	time = 100
	scripttable = [
	]
}
common_transformationencore_transition = {
	scripttable = [
		{
			time = 0
			scr = hide_glitch
			params = {
				num_frames = 25
			}
		}
		{
			time = 0
			scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
			}
		}
	]
	endwithdefaultcamera
}

script transition_bandswap 
	change_band_for_song \{override_band = rockerband_gh_rocker_demigod}
	begin
	if persistent_band_finished_building
		break
	endif
	wait \{1
		gameframe}
	repeat
	play_intro_anims
	transition_cameracut \{prefix = 'cameras_fastintro'
		changenow}
	wait \{3
		seconds}
	change \{transition_playing = false}
endscript

script common_loading_transitionend 
	playlist_getcurrentsong
	if gotparam \{current_song}
		if (<current_song> = jamsession)
			return
		endif
	endif
	gamemode_gettype
	if (($is_network_game = 1 && <type> = career) || $is_network_game = 0)
		ui_event \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
		if compositeobjectexists \{name = vocalist}
			vocalist :unhide
			vocalist :obj_teleport
		endif
	endif
endscript
debug_celeb_intros = 0

script transition_selecttransition \{practice_intro = 0
		restarting = 0}
	change \{finalbandintro_transition_playing = 0}
	next_zone = (($levelzones.$current_level).zone)
	getpakmancurrent \{map = zones}
	if (<pak> != (($levelzones.$current_level).zone))
		change \{encore_transitioned_played = false}
	endif
	if ($debug_encore = 1 || $debug_career_transformations = 1)
		change \{current_transition = encore}
		return
	endif
	if (<practice_intro> = 1)
		return
	endif
	if ($current_transition = debugintro)
		change \{current_transition = intro}
		return
	endif
	if ($current_transition = forcelongintro)
		change \{current_transition = intro}
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
		change \{current_transition = restartencore}
	else
		change \{current_transition = fastintro}
	endif
endscript

script transition_selectcelebtransition 
	if quest_progression_is_chapter_rush
		return
	endif
	gamemode_gettype
	if ((<type> != career))
		return
	endif
	if NOT should_play_celeb_intro
		return \{false}
	endif
	change \{current_transition = celebintro}
	return \{true}
endscript

script is_encore_song 
	gamemode_gettype
	if (<type> != career)
		printf \{channel = marc
			qs(0x879b0189)}
		return \{false}
	endif
	<current_chapter> = ($current_chapter)
	playlist_getcurrentsong
	if (<current_song> = ($<current_chapter>.encore))
		return \{true}
	endif
	return \{false}
endscript

script get_rocker_intro_name 
	zone = (($levelzones.$current_level).zone)
	extendcrc <zone> 'Intro' out = name
	return name = <name>
endscript

script get_rocker_transformation_name 
	zone = (($levelzones.$current_level).zone)
	extendcrc <zone> 'Tran' out = name
	return name = <name>
endscript
encore_transitioned_played = false

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
	change \{current_transition = encore}
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
	if gotparam \{current_song}
		printf channel = marc qs(0x975bcc78) a = <current_song>
		if arraycontains array = $g_transformation_dummy_songs contains = <current_song>
			printf \{channel = marc
				qs(0x3d31314c)}
			change \{encore_transitioned_played = false}
			change \{current_transition = encore}
			return \{true}
		endif
	endif
	return \{false}
endscript

script transition_killall 
	killspawnedscript \{id = transitions}
	change \{transition_playing = false}
	change \{current_playing_transition = none}
endscript

script transition_getprefix \{type = intro}
	celeb_intro = 0
	if structurecontains structure = $transition_types <type>
		type_textnl = ($transition_types.<type>.textnl)
	endif
	if NOT gotparam \{type_textnl}
		scriptassert \{qs(0xf6d7c577)}
	endif
	return type_textnl = <type_textnl> celeb_intro = <celeb_intro>
endscript

script transition_getprops 
	transition_getprefix <...>
	getpakmancurrentname \{map = zones}
	formattext checksumname = transition_props '%s_%p_Transition' p = <type_textnl> s = <pakname>
	if NOT globalexists name = <transition_props>
		formattext checksumname = transition_props 'default_%p_Transition' p = <type_textnl> s = <pakname>
	endif
	if (<celeb_intro> = 1)
		if NOT globalexists name = <transition_props>
			transition_props = default_intro_transition
		endif
	endif
	formattext checksumname = common_transition_props 'Common_%p_Transition' p = <type_textnl>
	common_type_textnl = <type_textnl>
	if (<celeb_intro> = 1)
		common_type_textnl = 'intro'
		if NOT globalexists name = <common_transition_props>
			common_transition_props = common_intro_transition
		endif
	endif
	return type_textnl = <type_textnl> common_type_textnl = <common_type_textnl> transition_props = <transition_props> common_transition_props = <common_transition_props>
endscript

script transition_gettime \{type = intro}
	transition_getprops type = <type>
	return transition_time = ($<transition_props>.time)
endscript

script transition_findtimeoffset 
	switch <type>
		case finalbattleintro
		case rushintro
		case celebintro
		return time_offset = ($time_gem_offset + ($<transition_props>.time))
	endswitch
endscript

script transition_play \{type = intro
		use_song_time = 1}
	transition_killall
	change current_playing_transition = <type>
	if (<type> = encore)
		change \{encore_transitioned_played = true}
	endif
	transition_getprops type = <type>
	getpakmancurrentname \{map = zones}
	formattext checksumname = event 'Common_%p_TransitionSetup' p = <common_type_textnl> s = <pakname>
	if scriptexists <event>
		<event>
	endif
	formattext checksumname = event '%s_%p_TransitionSetup' p = <type_textnl> s = <pakname>
	if scriptexists <event>
		spawnscriptnow <event>
	endif
	transition_findtimeoffset <...>
	spawnscriptnow transition_play_spawned id = transitions params = {<...>}
	formattext checksumname = event 'GuitarEvent_Transition%s' s = <type_textnl>
	if scriptexists <event>
		spawnscriptnow <event>
	endif
endscript

script transition_play_spawned \{use_song_time = 1}
	change \{transition_playing = true}
	getpakmancurrentname \{map = zones}
	transition_time = ($<transition_props>.time)
	spawnscriptnow transition_play_iterator id = transitions params = {<...>}
	spawnscriptnow transition_play_iterator id = transitions params = {<...> transition_props = <common_transition_props>}
	formattext checksumname = event '%s_%p_TransitionDeinit' p = <type_textnl> s = <pakname>
	if scriptexists <event>
		onexitrun <event>
	endif
	<time> = 0.0
	if (<use_song_time> = 1)
		if NOT gotparam \{time_offset}
			getsongtimems
			time_offset = (0 - <time>)
		endif
	endif
	begin
	if (<transition_time> = -1)
		if ($transition_playing = false)
			break
		endif
	else
		if (<use_song_time> = 1)
			getsongtimems time_offset = <time_offset>
		else
			getframelength
			<time> = (<time> + (<frame_length> * 1000.0))
		endif
		if (<transition_time> <= <time>)
			change \{transition_playing = false}
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
	if structurecontains structure = ($<common_transition_props>) endwithscript
		spawnscriptnow ($<common_transition_props>.endwithscript)
	endif
	if structurecontains structure = ($<common_transition_props>) endwithdefaultcamera
		playlist_getcurrentsong
		if ($finalbandintro_transition_playing = 1)
			if ($current_playing_transition = finalbandintro)
				change \{finalbandintro_transition_playing = 0}
			else
				stoprendering
			endif
		else
			if structurecontains structure = ($<common_transition_props>) syncwithnotecameras
				cameracuts_getnextnotecameratime
				getsongtimems
				if (<camera_time> >= -200 &&
						<camera_time> - <time> < 2000)
					cameracuts_enablechangecam \{enable = false}
				else
					if NOT ($game_mode = tutorial || $game_mode = practice)
						cameracuts_setarrayprefix \{prefix = 'cameras'
							changenow}
					else
						cameracuts_enablechangecam \{enable = false}
					endif
				endif
			else
				if NOT ($game_mode = tutorial || $game_mode = practice)
					cameracuts_setarrayprefix \{prefix = 'cameras'
						changenow}
				else
					cameracuts_enablechangecam \{enable = false}
				endif
			endif
		endif
	endif
	formattext checksumname = event 'Common_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if scriptexists <event>
		spawnscriptnow <event>
	endif
	formattext checksumname = event '%s_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if scriptexists <event>
		spawnscriptnow <event>
	endif
	change \{current_playing_transition = none}
endscript

script istransitionplaying 
	if gotparam \{type}
		if (<type> = $current_playing_transition)
			return \{true}
		endif
	else
		if NOT (<type> = none)
			return \{true}
		endif
	endif
	return \{false}
endscript

script transition_play_iterator \{use_song_time = 1}
	<time> = 0
	if (<use_song_time> = 1)
		if NOT gotparam \{time_offset}
			getsongtimems
			time_offset = (0 - <time>)
		endif
	endif
	getarraysize ($<transition_props>.scripttable)
	if (<array_size> = 0)
		return
	endif
	array_count = 0
	begin
	current_time = ($<transition_props>.scripttable [<array_count>].time)
	fixtimerounding \{current_time}
	begin
	if (<use_song_time> = 1)
		getsongtimems time_offset = <time_offset>
	else
		getframelength
		<time> = (<time> + (<frame_length> * 1000.0))
	endif
	if (<current_time> <= <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	printf qs(0x14d64d1b) s = ($<transition_props>.scripttable [<array_count>].scr) t = ($<transition_props>.scripttable [<array_count>].time)
	if scriptexists ($<transition_props>.scripttable [<array_count>].scr)
		spawnscriptnow ($<transition_props>.scripttable [<array_count>].scr) id = transitions params = {transition_time = <transition_time> ($<transition_props>.scripttable [<array_count>].params) from_scriptevent = 1}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script transition_wait 
	begin
	if ($transition_playing = false)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script clipplaydrummercamera 
	if NOT gotparam \{anim}
		scriptassert \{qs(0xcdaa0a64)}
	endif
	if NOT gotparam \{index}
		scriptassert \{qs(0xd509756d)}
	endif
	if (<index> < 10)
		formattext checksumname = lock_target qs(0x5dd349ea) i = <index>
	else
		formattext checksumname = lock_target qs(0x62a45e78) i = <index>
	endif
	momentcamera_playanim {anim = <anim> $drumcam_params lock_target = <lock_target>}
endscript

script transition_setcamera 
	if NOT gotparam \{note_value}
		return
	endif
	if getnotemapping section = cameras note_value = <note_value>
		clip_get_time_and_frame
		spawnscriptnow (<note_data>.scr) params = {(<note_data>.params) length = <length>}
	else
	endif
endscript

script momentcamera_playanim \{cycle = 0
		start = 0.0
		blendduration = 0.0
		speed = 1.0
		timertype = tempo}
	if NOT compositeobjectexists name = <lock_target>
		printf channel = anim_info qs(0xb08c6979) a = <lock_target>
		return
	endif
	setsearchallassetcontexts
	getpakmancurrent \{map = zones}
	getpakmancurrentname \{map = zones}
	<lock_target> :obj_getintegertag tag_name = disable_unlock assert = 0
	disable_unlock = <integer_value>
	if gotparam \{start_node_crc}
		getwaypointpos name = <start_node_crc>
		getwaypointquat name = <start_node_crc>
		if (<disable_unlock> = 0)
			<lock_target> :obj_locktoobject off
		endif
		<lock_target> :obj_setposition position = <pos>
		<lock_target> :obj_setorientation quat = <quat>
	elseif gotparam \{start_node}
		extendcrc <pak> <start_node> out = start_node_id
		getwaypointpos name = <start_node_id>
		getwaypointquat name = <start_node_id>
		if (<disable_unlock> = 0)
			<lock_target> :obj_locktoobject off
		endif
		<lock_target> :obj_setposition position = <pos>
		<lock_target> :obj_setorientation quat = <quat>
	else
		suffix = ('_' + <node>)
		appendsuffixtochecksum base = <pak> suffixstring = <suffix>
		if compositeobjectexists name = <appended_id>
			<lock_target> :obj_locktoobject objectname = <appended_id>
		else
			printf channel = anim_info qs(0xc0212f38) a = <appended_id>
		endif
	endif
	if NOT gotparam \{tempo_anim}
		tempo_anim = <anim>
	endif
	spawnscriptnow momentcamera_playanim_spawned params = {name = <lock_target> anim = <anim> tempoanim = <tempo_anim> cycle = <cycle> start = <start> blendduration = <blendduration> speed = <speed> timertype = <timertype>}
	setsearchallassetcontexts \{off}
endscript

script momentcamera_playanim_spawned \{start = 0.0
		speed = 1.0
		blendduration = -1.0
		timertype = tempo}
	if NOT compositeobjectexists name = <name>
		printf qs(0x9e08b783) a = <name>
		return
	endif
	begin
	setsearchallassetcontexts
	if NOT gotparam \{anim}
		<name> :anim_getdefaultanimname
		anim = <defaultanimname>
	endif
	if NOT gotparam \{tempoanim}
		tempoanim = anim
	endif
	<name> :removetags [animrequestedfovradians]
	<name> :anim_enable
	<name> :anim_command target = body command = degenerateblend_addbranch params = {
		tree = $specialcamera_standardanimbranch
		blendduration = <blendduration>
		params = {
			anim = <anim>
			speed = <speed>
			timertype = <timertype>
			start = <start>
			animevents = on
			tempoanim = <tempoanim>
			allowbeatskipping = true
		}
	}
	<name> :anim_update active_camera_override = true
	<name> :anim_command target = bodytimer command = timer_waitanimcomplete
	setsearchallassetcontexts \{off}
	if (<cycle> = 0)
		break
	endif
	start = 0.0
	repeat
endscript

script specialcamera_playanim \{cycle = 0
		start = 0.0}
	setsearchallassetcontexts
	getpakmancurrent \{map = zones}
	getpakmancurrentname \{map = zones}
	formattext textname = suffix '_%s' s = <obj>
	appendsuffixtochecksum base = <pak> suffixstring = <suffix>
	cameraname = (<pakname> + <suffix>)
	if compositeobjectexists name = <appended_id>
		<appended_id> :obj_switchscript specialcamera_playanim_spawned params = {anim = <anim> cycle = <cycle> start = <start> blendduration = <blendduration>}
	else
		printf qs(0x5f796dcf) s = <cameraname>
	endif
	setsearchallassetcontexts \{off}
endscript

script specialcamera_playanim_spawned \{start = 0.0
		speed = 1.0
		blendduration = -1.0}
	begin
	setsearchallassetcontexts
	if NOT gotparam \{anim}
		anim_getdefaultanimname
		anim = <defaultanimname>
	endif
	if NOT gotparam \{tempoanim}
		tempoanim = anim
	endif
	printf qs(0x0c017022) a = <anim> b = <tempoanim>
	removetags \{[
			animrequestedfovradians
		]}
	anim_enable
	anim_command target = body command = degenerateblend_addbranch params = {
		tree = $specialcamera_standardanimbranch
		blendduration = <blendduration>
		params = {
			anim = <anim>
			speed = <speed>
			timertype = tempo
			start = <start>
			animevents = on
			tempoanim = <tempoanim>
			allowbeatskipping = true
		}
	}
	specialcamera_waitanimfinished
	setsearchallassetcontexts \{off}
	if (<cycle> = 0)
		break
	endif
	repeat
endscript

script specialcamera_waitanimfinished \{timer = bodytimer}
	anim_command target = <timer> command = timer_waitanimcomplete
endscript
specialcamera_standardanimbranch = {
	type = timertype
	id = bodytimer
	anim = anim
	tempo_anim = tempoanim
	anim_events = animevents
	allow_beat_skipping = allowbeatskipping
	speed = speed
	start = start
	[
		{
			type = source
			anim = anim
		}
	]
}

script transition_playanim \{cycle = 0}
	<obj> :obj_switchscript transition_playanim_spawned params = {anim = <anim> cycle = <cycle> blendduration = <blendduration>}
endscript

script transition_playanim_spawned 
	begin
	gameobj_playanim anim = <anim> blendduration = <blendduration>
	gameobj_waitanimfinished
	if (<cycle> = 0)
		break
	endif
	repeat
endscript

script transition_cameracut 
	if gotparam \{prefix}
		if gotparam \{extra_params}
			change \{cameracuts_nextextraparamsset = 1}
			change cameracuts_nextextraparams = <extra_params>
		endif
		disablechangecam = false
		if (<prefix> = 'cameras_moments')
			disablechangecam = true
		endif
		cameracuts_setarrayprefix <...> length = <transition_time>
	else
		if NOT ($current_playing_transition = none)
			transition_getprefix type = ($current_playing_transition)
		else
			transition_getprefix \{type = intro}
		endif
		getpakmancurrentname \{map = zones}
		formattext checksumname = cameras_array 'default_cameras_%t' t = <type_textnl>
		formattext textname = prefix 'cameras_%t' t = <type_textnl>
		if NOT globalexists name = <cameras_array>
			formattext checksumname = cameras_array '%s_cameras_%t' s = <pakname> t = <type_textnl>
			if NOT globalexists name = <cameras_array>
				prefix = 'cameras_intro'
			endif
		endif
		cameracuts_setarrayprefix <...> length = <transition_time>
	endif
endscript

script transition_stoprendering 
	if ($game_mode != freeplay)
		stoprendering
	endif
endscript

script transition_startrendering \{no_curtain = 0}
	startrendering
	change \{is_changing_levels = 0}
	if ($blade_active = 1 && $signin_change_happening = 0)
		if ($game_mode != freeplay)
			ui_event_wait_for_safe
			begin
			if NOT scriptisrunning \{sysnotify_handle_unpause}
				break
			endif
			wait \{1
				gameframe}
			repeat
			if ($blade_active = 1 && $signin_change_happening = 0)
				change \{blade_active = 0}
				gh_start_pressed no_curtain = <no_curtain>
			endif
		endif
	endif
endscript

script transition_printf 
	printf <...>
endscript

script transitions_resetzone 
	printf \{qs(0x119c40dd)}
	getpakmancurrentname \{map = zones}
	formattext checksumname = reset_func '%s_ResetTransition' s = <pakname>
	if scriptexists <reset_func>
		<reset_func>
	endif
	formattext checksumname = nodearray_checksum '%s_NodeArray' s = <pakname>
	if NOT globalexists name = <nodearray_checksum> type = array
		return
	endif
	getarraysize $<nodearray_checksum>
	array_count = 0
	yield_count = 40
	begin
	resetvalid = true
	if gotparam \{profile}
		resetvalid = false
		if structurecontains structure = ($<nodearray_checksum> [<array_count>]) profile
			if comparestructs struct1 = ($<nodearray_checksum> [<array_count>].profile) struct2 = (<profile>)
				resetvalid = true
			endif
		endif
	endif
	if structurecontains structure = ($<nodearray_checksum> [<array_count>]) createdfromvariable
		resetvalid = false
	endif
	if structurecontains structure = ($<nodearray_checksum> [<array_count>]) createdonprogress
		resetvalid = false
	endif
	if structurecontains structure = ($<nodearray_checksum> [<array_count>]) class
		if NOT ($<nodearray_checksum> [<array_count>].class = gameobject ||
				$<nodearray_checksum> [<array_count>].class = levelgeometry)
			resetvalid = false
		endif
	else
		resetvalid = false
	endif
	yield_count = (<yield_count> - 1)
	if (<yield_count> = 0)
		yield \{'Transitions_ResetZone break'}
		yield_count = 40
	endif
	if (<resetvalid> = true)
		kill name = ($<nodearray_checksum> [<array_count>].name)
		if structurecontains structure = ($<nodearray_checksum> [<array_count>]) createdatstart
			create name = ($<nodearray_checksum> [<array_count>].name)
		endif
		yield \{'Transitions_ResetZone'}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script common_celebintro_transitionsetup 
	printf \{channel = sfx
		qs(0x683ba7ad)}
	preload_celeb_intro_stream
endscript

script common_finalbattleintro_transitionsetup 
	printf \{channel = sfx
		qs(0x683ba7ad)}
	<current_song> = none
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

script common_preencore_transitionsetup 
endscript

script common_preencore_transitionend 
endscript

script finalbandintro_transitionsetup 
	printf \{channel = sfx
		qs(0x86acca66)}
	transition_getprefix type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = none)
		stopsound unique_id = ($celeb_intro_stream_id)
		change \{celeb_intro_stream_id = none}
	endif
	preloadstream \{intro_finalgig}
	change celeb_intro_stream_id = <unique_id>
endscript

script common_finalbandoutro_transitionsetup 
	printf \{channel = sfx
		qs(0x52f3ee09)}
	if NOT ($celeb_intro_stream_id = none)
		stopsound unique_id = ($celeb_intro_stream_id)
		change \{celeb_intro_stream_id = none}
	endif
	preloadstream \{encore_finalgig}
	change celeb_intro_stream_id = <unique_id>
	begin
	printf \{qs(0xb1fb7278)}
	if preloadstreamdone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script common_rushintro_transitionsetup 
endscript

script common_rushintro_transitionend 
endscript

script common_rushoutro_transitionsetup 
	change_crowd_looping_sfx \{crowd_looping_state = good}
	<prev_song> = $last_song_played
	if (<prev_song> = rush2112p7)
		preload_encore_event_stream
	endif
endscript

script common_rushoutro_transitionend 
endscript

script common_encore_transitionsetup 
	printf \{channel = sfx
		qs(0x456e2c58)}
	preload_encore_event_stream
endscript

script common_encore_transitionend 
	spawnscriptlater \{common_encore_spawned_waiting_then_playing_music_for_ui_screen}
endscript

script common_encore_spawned_waiting_then_playing_music_for_ui_screen \{music_screen_volume = -10
		waittime = 2.0}
	soundname = nothing
	get_ui_screen_music_file_from_zone
	wait <waittime> seconds
	printf channel = sfx qs(0xdf830cf8) s = <music_screen_volume>
	playsound <ui_music_soundname_checksum> vol = <music_screen_volume> buss = binkcutscenes
	spawnscriptnow \{audio_play_surges_during_encore_waiting_screen}
endscript

script stop_music_post_encore_when_load_is_done 
	if (issoundplaying $g_ui_screen_music_playing_checksum)
		stopsound \{$g_ui_screen_music_playing_checksum
			fade_time = 1.5
			fade_type = linear}
	endif
	spawnscriptnow \{audio_kill_play_surges_during_encore_waiting_screen}
endscript

script start_crowd_surging_sfx_over_preencore_ministats_screen 
	getpakmancurrentname \{map = zones}
	formattext checksumname = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> addtostringlookup = true
	if scriptexists <scriptgetvenuesize>
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
	formattext checksumname = preencoretemp 'PreEncore_%s' s = <newvenuesize> addtostringlookup = true
	change g_current_preencore = <preencoretemp>
	if ((<pakname> != 'z_mansionstudio') && (<pakname> != 'z_modular') && (<pakname> != 'z_credits') && (<pakname> != 'z_visualizer') && (<pakname> != 'z_finalbattle') && (<pakname> != 'z_cube'))
		printf \{channel = sfx
			qs(0x9147ba66)
			s = $g_current_preencore}
		playsound \{$g_current_preencore
			vol = 9
			buss = crowd_preencore_building}
	endif
endscript

script stop_crowd_surging_sfx_over_preencore_ministats_screen 
	stopsound \{$g_current_preencore
		fade_time = 3.0
		fade_type = log_slow}
endscript

script get_ui_screen_music_file_from_zone \{local_var_volume = -10
		waittime = 2.0}
	getpakmancurrentname \{map = zones}
	printf channel = sfx qs(0x8f4988d7) s = <pakname>
	formattext checksumname = pakname_checksum '%a' a = <pakname> addtostringlookup = true
	switch <pakname_checksum>
		case z_egypt
		case z_barbarian
		case z_punkstage
		case z_houseband
		case z_festival
		case z_riothouse
		case z_mansionstudio
		case z_epicstage
		formattext checksumname = ui_music '%a_music' a = <pakname> addtostringlookup = true
		default
		printf \{channel = sfx
			qs(0x28223746)}
	endswitch
	switch <pakname_checksum>
		case z_punkstage
		waittime = 1.2
		local_var_volume = -7.0
		case z_riothouse
		waittime = 1.0
		local_var_volume = -6.5
		case z_houseband
		waittime = 1.0
		local_var_volume = -3.5
		case z_mansionstudio
		waittime = 0.5
		local_var_volume = -8.0
		case z_epicstage
		waittime = 1.0
		local_var_volume = -4.5
		case z_festival
		waittime = 2.0
		local_var_volume = -4.1
		case z_barbarian
		waittime = 1.5
		local_var_volume = -5.0
		case z_egypt
		waittime = 2.0
		local_var_volume = -7.5
		default
		printf \{channel = sfx
			qs(0x28223746)}
	endswitch
	change g_ui_screen_music_playing_checksum = <ui_music>
	return ui_music_soundname_checksum = <ui_music> music_screen_volume = <local_var_volume> waittime = <waittime>
endscript

script preload_encore_bink_audio \{movie_name = 'z_artdeco_encore_audio'}
endscript

script common_loading_transitionsetup 
	getpakmancurrent \{map = zones}
endscript
celeb_intro_stream_id = none
g_celeb_outro_stream_id = none

script get_rocker_name_from_current_zone 
	getpakmancurrentname \{map = zones}
	printf channel = sfx qs(0x8f4988d7) s = <pakname>
	formattext checksumname = pakname_checksum '%a' a = <pakname> addtostringlookup = true
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

script preload_celeb_intro_stream \{celeb_intro_checksum = none}
	printf \{channel = sfx
		qs(0x9f3ca4a3)}
	spawnscriptnow \{audio_change_crowd_to_celeb_state
		params = {
			celeb_state = intro
		}}
	transition_getprefix type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = none)
		stopsound unique_id = ($celeb_intro_stream_id)
		change \{celeb_intro_stream_id = none}
	endif
	get_rocker_name_from_current_zone
	printf channel = sfx qs(0xa99cc6ce) s = <rocker>
	tutorial_system_get_language_prefix
	printf channel = sfx qs(0xb5abb1d8) s = <language_prefix>
	formattext checksumname = celeb_intro_checksum '%l_%s_intro' l = <language_prefix> s = <rocker> addtostringlookup = true
	printf channel = sfx qs(0x59271fbd) s = <celeb_intro_checksum>
	preloadstream <celeb_intro_checksum>
	change celeb_intro_stream_id = <unique_id>
	begin
	printf \{qs(0x50818c55)}
	if preloadstreamdone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script start_preloaded_celeb_intro_stream \{celeb_intro_vol_name = none}
	printf \{channel = sfx
		qs(0x9ff5df66)}
	if NOT ($celeb_intro_stream_id = none)
		transition_getprefix type = ($current_playing_transition)
		audio_cutscene_get_vol_tweak_of_preloaded_stream streamname = <celeb_intro_vol_name>
		printf \{channel = sfx
			qs(0x75ea046e)}
		startpreloadedstream $celeb_intro_stream_id buss = encore_events forcesafepreload = 1 vol = <volumetweak>
		change \{celeb_intro_stream_id = none}
		vocals_mute_all_mics \{mute = true}
	endif
endscript
encore_event_stream_id = none

script preload_encore_event_stream 
	printf \{channel = sfx
		qs(0x03f14c32)}
	spawnscriptnow \{audio_change_crowd_to_celeb_state
		params = {
			celeb_state = encore
		}}
	if NOT ($encore_event_stream_id = none)
		stopsound unique_id = ($encore_event_stream_id)
		change \{encore_event_stream_id = none}
	endif
	get_rocker_name_from_current_zone
	tutorial_system_get_language_prefix
	if NOT (<rocker> = 'rush')
		formattext checksumname = encore_stream_name '%l_%s_transformation' l = <language_prefix> s = <rocker> addtostringlookup = true
	else
		formattext checksumname = encore_stream_name '%l_%s_outro' l = <language_prefix> s = <rocker> addtostringlookup = true
	endif
	printf channel = sfx qs(0x83093de2) s = <encore_stream_name>
	preloadstream <encore_stream_name>
	change encore_event_stream_id = <unique_id>
	begin
	printf \{channel = sfx
		qs(0x93305209)}
	if preloadstreamdone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script start_preloaded_encore_event_stream 
	printf \{channel = sfx
		qs(0x72abc744)}
	spawnscriptnow \{stop_crowd_surging_sfx_over_preencore_ministats_screen}
	if NOT ($encore_event_stream_id = none)
		getpakmancurrentname \{map = zones}
		formattext checksumname = encore_stream_vol_name '%s_encore' s = <pakname> addtostringlookup = true
		audio_cutscene_get_vol_tweak_of_preloaded_stream streamname = <encore_stream_vol_name>
		printf \{channel = sfx
			qs(0xd9aeb1dd)}
		startpreloadedstream $encore_event_stream_id buss = encore_events forcesafepreload = 1 vol = <volumetweak>
		change \{encore_event_stream_id = none}
	endif
endscript

script preload_celeb_outro_stream \{celeb_outro_checksum = none}
	printf \{channel = sfx
		qs(0x06cd37f2)}
	spawnscriptnow \{audio_change_crowd_to_celeb_state
		params = {
			celeb_state = outro
		}}
	transition_getprefix type = ($current_playing_transition)
	if NOT ($g_celeb_outro_stream_id = none)
		stopsound unique_id = ($g_celeb_outro_stream_id)
		change \{g_celeb_outro_stream_id = none}
	endif
	tutorial_system_get_language_prefix
	formattext checksumname = celeb_outro_checksum '%l_%s_intro' l = <language_prefix> s = <rocker> addtostringlookup = true
	printf channel = sfx qs(0x59271fbd) s = <celeb_outro_checksum>
	preloadstream <celeb_outro_checksum>
	change g_celeb_outro_stream_id = <unique_id>
	begin
	printf \{qs(0xc9701f04)}
	if preloadstreamdone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script start_preloaded_celeb_outro_stream \{celeb_intro_vol_name = none}
	printf \{channel = sfx
		qs(0x06044c37)}
	if NOT ($g_celeb_outro_stream_id = none)
		transition_getprefix type = ($current_playing_transition)
		audio_cutscene_get_vol_tweak_of_preloaded_stream streamname = <celeb_outro_vol_name>
		printf \{channel = sfx
			qs(0x309e144a)}
		startpreloadedstream $g_celeb_outro_stream_id buss = encore_events forcesafepreload = 1 vol = <volumetweak>
		change \{g_celeb_outro_stream_id = none}
		vocals_mute_all_mics \{mute = true}
	endif
endscript
intro_stream_id = none

script preload_intro_stream 
	printf \{channel = sfx
		qs(0x3de5a017)}
	if NOT ($intro_stream_id = none)
		stopsound unique_id = ($intro_stream_id)
		change \{intro_stream_id = none}
	endif
	getpakmancurrentname \{map = zones}
	formattext checksumname = intro_stream_name '%s_intro' s = <pakname> addtostringlookup = true
	preloadstream <intro_stream_name>
	change intro_stream_id = <unique_id>
	begin
	printf \{channel = sfx
		qs(0xb183e60b)}
	if preloadstreamdone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script start_preloaded_intro_stream 
	printf \{channel = sfx
		qs(0x8071fc13)}
	if NOT ($intro_stream_id = none)
		getpakmancurrentname \{map = zones}
		formattext checksumname = encore_stream_vol_name '%s_intro' s = <pakname> addtostringlookup = true
		audio_cutscene_get_vol_tweak_of_preloaded_stream streamname = <encore_stream_vol_name>
		printf channel = sfx qs(0x917a0c22) y = <volumetweak>
		printf \{channel = sfx
			qs(0x5488a3ac)}
		startpreloadedstream $intro_stream_id buss = encore_events vol = <volumetweak> forcesafepreload = 1
		change \{intro_stream_id = none}
	endif
endscript

script start_preloaded_finalbandoutro_stream 
	printf \{channel = sfx
		qs(0x12d0a014)}
	if NOT ($celeb_intro_stream_id = none)
		audio_cutscene_get_vol_tweak_of_preloaded_stream \{streamname = career_outro}
		printf \{channel = sfx
			qs(0x88b63883)}
		startpreloadedstream $celeb_intro_stream_id buss = encore_events forcesafepreload = 1 vol = <volumetweak>
		change \{celeb_intro_stream_id = none}
	endif
endscript

script kill_transition_preload_streams 
	printf \{channel = sfx
		qs(0x6bbf6407)}
	killspawnedscript \{name = preload_encore_event_stream}
	killspawnedscript \{name = preload_celeb_intro_stream}
	killspawnedscript \{name = preload_intro_stream}
	change \{encore_event_stream_id = none}
	change \{celeb_intro_stream_id = none}
	change \{intro_stream_id = none}
endscript

script should_play_long_venue_intro 
	zone = (($levelzones.$current_level).zone)
	if console_is_net_career_client
		addparams ($g_net_career_progression.venue_intro_flags)
	else
		getglobaltags \{venue_intro_flags}
	endif
	if ($encore_transitioned_played = true)
		return \{false}
	endif
	if structurecontains structure = <...> <zone>
		<venue_flag> = (<...>.<zone>)
		if (<venue_flag> = 1)
			return \{false}
		endif
	endif
	addparam name = <zone> value = 1 structure_name = newvalue
	if console_is_net_career_client
		temp_struct = ($g_net_career_progression.venue_intro_flags + <newvalue>)
		appendstruct struct = g_net_career_progression field = venue_intro_flags params = <temp_struct> globalstruct
	else
		setglobaltags venue_intro_flags params = <newvalue> progression = true
	endif
	return \{true}
endscript

script should_play_celeb_intro 
	zone = (($levelzones.$current_level).zone)
	if console_is_net_career_client
		addparams ($g_net_career_progression.celeb_intro_flags)
	else
		getglobaltags \{celeb_intro_flags}
	endif
	if structurecontains structure = <...> <zone>
		<venue_flag> = (<...>.<zone>)
		if (<venue_flag> = 1)
			if quest_progression_is_chapter_finale
				set_chapter_venue_intro_flags
			endif
			return \{false}
		endif
	endif
	if NOT quest_progression_is_chapter_finale
		set_chapter_venue_intro_flags \{value = 1}
	endif
	return \{true}
endscript

script set_chapter_venue_intro_flags \{value = 0}
	if gotparam \{level}
		zone = ((($levelzones).<level>).zone)
	else
		zone = (($levelzones.$current_level).zone)
	endif
	addparam name = <zone> value = <value> structure_name = newvalue
	if console_is_net_career_client
		temp_struct = ($g_net_career_progression.celeb_intro_flags + <newvalue>)
		appendstruct struct = g_net_career_progression field = celeb_intro_flags params = <temp_struct> globalstruct
	else
		setglobaltags celeb_intro_flags params = <newvalue> progression = true
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
