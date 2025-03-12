transition_playing = false
current_playing_transition = none
finalbandintro_transition_playing = 0
setlist_selection_tier = 1
transition_song_loading_hack = 1
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
}
celeb_intro_transitions = [
	{
		intro = 'intro'
		song = ringoffire
		venue = load_z_nashville
		part = vocals
	}
	{
		intro = 'intro_hayley'
		song = miserybusiness
		venue = load_z_recordstore
		part = vocals
	}
	{
		intro = 'intro_billy'
		song = today
		venue = load_z_cathedral
		part = guitar_vocals
	}
	{
		intro = 'intro_travis'
		song = dammit
		venue = load_z_military
		part = drums
	}
	{
		intro = 'intro_jimi'
		song = windcriesmary
		venue = load_z_ballpark
		part = no_replacements
	}
	{
		intro = 'intro_sting'
		song = demolitionman
		venue = load_z_castle
		part = bass_vocals
	}
]
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
			scr = intro_crowds
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
			time = 100
			scr = venuefastintro_fx
		}
		{
			time = 100
			scr = transition_startrendering
		}
		{
			time = 100
			scr = tutorial_enable_pause
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
			scr = intro_crowds
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
			time = 0
			scr = venueintro_fx_spawn
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
			scr = gh_sfx_intro_warmup
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
		{
			time = 0
			scr = change_crowd_looping_sfx
			params = {
				crowd_looping_state = good
			}
		}
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
			time = 0
			scr = change_crowd_looping_sfx
			params = {
				crowd_looping_state = good
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
				prefix = 'cameras_encore'
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
			time = 100
			scr = start_preloaded_encore_event_stream
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
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
			scr = change_crowd_looping_sfx
			params = {
				crowd_looping_state = bad
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
			scr = transition_cameracut
			params = {
				prefix = 'cameras_lose'
				changenow
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
			time = 0
			scr = createinvenueloadingscreen
			params = {
			}
		}
		{
			time = 100
			scr = cameracuts_enablechangecam
			params = {
				enable = false
			}
		}
		{
			time = 100
			scr = pauseinvenueloadingscreen
			params = {
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
			time = 0
			scr = createinvenueloadingscreen
			params = {
			}
		}
		{
			time = 100
			scr = cameracuts_enablechangecam
			params = {
				enable = false
			}
		}
		{
			time = 100
			scr = pauseinvenueloadingscreen
			params = {
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
			}
		}
		{
			time = 0
			scr = play_intro_anims
			params = {
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
			scr = transition_startrendering
		}
		{
			time = 100
			scr = gh_sfx_intro_warmup
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}

script createinvenueloadingscreen 
	gamemode_gettype
	if ($is_network_game = 1 && ((<type> = career) || (<type> = quickplay)))
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_song_breakdown
				continue_setlist_transition
			}}
	elseif ($is_network_game = 0)
		if ((<type> = pro_faceoff) || (<type> = competitive))
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_song_breakdown_competitive
					continue_setlist_transition
				}}
		else
			if (<type> = freeplay)
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
	if (<type> = freeplay)
		return
	endif
	if ($is_network_game = 1)
		change \{songtime_paused = 1}
		begin
		if ($use_old_system_setup = 1)
			if ($transition_song_loading_hack = 0)
				if screenelementexists \{id = song_breakdown_noncompetitive_id}
					break
				elseif screenelementexists \{id = song_breakdown_competitive_id}
					break
				endif
			endif
		else
			if screenelementexists \{id = song_breakdown_noncompetitive_id}
				break
			elseif screenelementexists \{id = song_breakdown_competitive_id}
				break
			endif
		endif
		wait \{1
			gameframe}
		repeat
		getnumplayers
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
	if (($current_transition) = encore)
		return
	endif
	change \{songtime_paused = 1}
	begin
	if ($use_old_system_setup = 1)
		if ($transition_song_loading_hack = 0)
			if screenelementexists \{id = song_breakdown_noncompetitive_id}
				break
			elseif screenelementexists \{id = song_breakdown_competitive_id}
				break
			endif
		endif
	else
		if screenelementexists \{id = song_breakdown_noncompetitive_id}
			break
		elseif screenelementexists \{id = song_breakdown_competitive_id}
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
	wait \{1
		gameframe}
	if screenelementexists \{id = song_breakdown_noncompetitive_id}
		ui_song_breakdown_setup_handler_scripts \{add_setlist_continue_handlers}
	elseif screenelementexists \{id = song_breakdown_competitive_id}
		ui_song_breakdown_competitive_setup_handler_scripts \{add_setlist_continue_handlers}
	endif
endscript

script common_loading_transitionend 
	printscriptinfo \{'Common_Loading_TransitionEnd'}
	gman_songtool_getcurrentsong
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
			vocalist :ragdoll_markforreset
		endif
	endif
endscript
debug_celeb_intros = 0

script transition_selecttransition \{practice_intro = 0}
	change \{finalbandintro_transition_playing = 0}
	next_zone = (($levelzones.$current_level).zone)
	getpakmancurrent \{map = zones}
	if (<pak> != (($levelzones.$current_level).zone))
		change \{encore_transitioned_played = false}
	endif
	if ($debug_encore)
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
		gman_songtool_getcurrentsong
		if transition_selectcelebtransition
			return
		endif
		if transition_selectencoretransition
			return
		endif
		if should_play_long_venue_intro
			change \{current_transition = intro}
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
	gamemode_gettype
	if ((<type> != career) || ininternetmode)
		return
	endif
	current_challenge = none
	if gman_goalisactive \{goal = career}
		gman_challengemanagerfunc \{goal = career
			tool = challenges
			func = get_current_challenge}
	endif
	if NOT arraycontains array = $gig_celeb_intros contains = <current_challenge>
		return \{false}
	endif
	getglobaltags \{celeb_intro_flags}
	if structurecontains structure = <...> <current_challenge>
		<celeb_flag> = (<...>.<current_challenge>)
		if (<celeb_flag> = 1 && $debug_celeb_intros = 0)
			printf \{qs(0x998615af)}
			return \{false}
		endif
	endif
	addparam name = <current_challenge> value = 1 structure_name = newvalue
	setglobaltags celeb_intro_flags params = <newvalue>
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
	current_challenge = none
	if gman_goalisactive \{goal = career}
		gman_challengemanagerfunc \{goal = career
			tool = challenges
			func = get_current_challenge}
	endif
	if arraycontains array = $gig_encores contains = <current_challenge>
		return \{true}
	endif
	if ($gig_champion = <current_challenge>)
		return \{true}
	endif
	return \{false}
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

script transition_killall 
	killspawnedscript \{id = transitions}
	change \{transition_playing = false}
	change \{current_playing_transition = none}
endscript

script transition_getprefix \{type = intro}
	celeb_intro = 0
	if structurecontains structure = $transition_types <type>
		printstruct <...>
		type_textnl = ($transition_types.<type>.textnl)
	else
		getarraysize ($celeb_intro_transitions)
		index = 0
		begin
		formattext checksumname = transition '%s' s = ($celeb_intro_transitions [<index>].intro)
		if (<type> = <transition>)
			type_textnl = ($celeb_intro_transitions [<index>].intro)
			celeb_intro = 1
			break
		endif
		index = (<index> + 1)
		repeat <array_size>
	endif
	if NOT gotparam \{type_textnl}
		printstruct <...>
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

script transition_play \{type = intro}
	printf 'Transition_Play type=%t' t = <type>
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
	spawnscriptnow transition_play_spawned id = transitions params = {<...>}
	formattext checksumname = event 'GuitarEvent_Transition%s' s = <type_textnl>
	if scriptexists <event>
		spawnscriptnow <event>
	endif
endscript

script transition_play_spawned 
	change \{transition_playing = true}
	getpakmancurrentname \{map = zones}
	transition_time = ($<transition_props>.time)
	spawnscriptnow transition_play_iterator id = transitions params = {<...>}
	spawnscriptnow transition_play_iterator id = transitions params = {<...> transition_props = <common_transition_props>}
	getsongtimems
	time_offset = (0 - <time>)
	begin
	getsongtimems time_offset = <time_offset>
	if (<transition_time> <= <time>)
		change \{transition_playing = false}
		break
	endif
	wait \{1
		gameframe}
	repeat
	if structurecontains structure = ($<common_transition_props>) endwithdefaultcamera
		gman_songtool_getcurrentsong
		if ($finalbandintro_transition_playing = 1)
			if ($current_playing_transition = finalbandintro)
				change \{finalbandintro_transition_playing = 0}
			else
				stoprendering
			endif
		elseif ($game_mode = p2_pro_faceoff)
			cameracuts_enablechangecam \{enable = false}
			getfps
			delay_ms = (0.0 - $time_input_offset)
			ms_per_frame = (1000.0 / <fps>)
			frames = (<delay_ms> / <ms_per_frame>)
			casttointeger \{frames}
			wait <frames> gameframes
			if (<current_song> = jamsession)
				cameracuts_setarrayprefix \{prefix = 'cameras_jam_mode'
					changenow}
			else
				cameracuts_setarrayprefix \{prefix = 'cameras_headtohead'
					changenow}
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

script transition_play_iterator 
	getsongtimems
	time_offset = (0 - <time>)
	getarraysize ($<transition_props>.scripttable)
	if (<array_size> = 0)
		return
	endif
	getsongtimems time_offset = <time_offset>
	array_count = 0
	begin
	begin
	getsongtimems time_offset = <time_offset>
	if ($<transition_props>.scripttable [<array_count>].time <= <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if scriptexists ($<transition_props>.scripttable [<array_count>].scr)
		spawnscriptnow ($<transition_props>.scripttable [<array_count>].scr) id = transitions params = {transition_time = <transition_time> ($<transition_props>.scripttable [<array_count>].params)}
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
	if NOT gotparam \{note}
		return
	endif
	if getnotemapping section = cameras note = <note>
		clip_get_time_and_frame
		spawnscriptnow (<note_data>.scr) params = {(<note_data>.params) length = <length>}
	else
	endif
endscript

script momentcamera_playanim \{cycle = 0
		start = 0.0
		blendduration = 0.0}
	if NOT compositeobjectexists name = <lock_target>
		printf channel = anim_info qs(0xb08c6979) a = <lock_target>
		return
	endif
	setsearchallassetcontexts
	getpakmancurrent \{map = zones}
	getpakmancurrentname \{map = zones}
	if gotparam \{start_node}
		extendcrc <pak> <start_node> out = start_node_id
		getwaypointpos name = <start_node_id>
		getwaypointdir name = <start_node_id>
		<lock_target> :obj_setposition position = <pos>
		<lock_target> :obj_setorientation dir = <dir>
	else
		suffix = ('_' + <node>)
		appendsuffixtochecksum base = <pak> suffixstring = <suffix>
		if compositeobjectexists name = <appended_id>
			<appended_id> :obj_getposition
			<lock_target> :obj_setposition position = <pos>
			<appended_id> :obj_getorientation
			dir = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
			<lock_target> :obj_setorientation dir = <dir>
		else
			printf channel = anim_info qs(0xc0212f38) a = <appended_id>
		endif
	endif
	if NOT gotparam \{tempo_anim}
		tempo_anim = <anim>
	endif
	spawnscriptnow momentcamera_playanim_spawned params = {name = <lock_target> anim = <anim> tempoanim = <tempo_anim> cycle = <cycle> start = <start> blendduration = <blendduration>}
	setsearchallassetcontexts \{off}
endscript

script momentcamera_playanim_spawned \{start = 0.0
		speed = 1.0
		blendduration = -1.0}
	printf \{qs(0xc2684cb9)
		channel = animinfo}
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
			timertype = tempo
			start = <start>
			animevents = on
			tempoanim = <tempoanim>
			allowbeatskipping = true
		}
	}
	<name> :anim_command target = bodytimer command = timer_waitanimcomplete
	setsearchallassetcontexts \{off}
	if (<cycle> = 0)
		break
	endif
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
	printf \{qs(0x61460438)}
	if ($game_mode != freeplay)
		stoprendering
	endif
endscript

script transition_startrendering 
	printf \{qs(0xeddd15af)}
	startrendering
	change \{is_changing_levels = 0}
	if ($blade_active = 1)
		if ($game_mode != freeplay)
			change \{blade_active = 0}
			ui_event_wait_for_safe
			gh3_start_pressed
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
	if (<resetvalid> = true)
		printf qs(0x9f03166a) s = ($<nodearray_checksum> [<array_count>].name)
		kill name = ($<nodearray_checksum> [<array_count>].name)
		if structurecontains structure = ($<nodearray_checksum> [<array_count>]) createdatstart
			create name = ($<nodearray_checksum> [<array_count>].name)
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script common_intro_transitionsetup 
	printf \{channel = sfx
		qs(0x0ea33ed5)}
	preload_intro_stream
endscript

script common_preencore_transitionsetup 
	change_crowd_looping_sfx \{crowd_looping_state = good}
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

script common_encore_transitionsetup 
	printf \{channel = sfx
		qs(0x456e2c58)}
	preload_encore_event_stream
endscript

script common_encore_transitionend 
endscript

script preload_encore_bink_audio \{movie_name = 'z_artdeco_encore_audio'}
endscript

script common_loading_transitionsetup 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_metalfest
		printf \{channel = sfx
			qs(0x4c1713bc)}
		default
		printf \{channel = sfx
			qs(0x21a8e0d5)}
	endswitch
endscript
celeb_intro_stream_id = none

script preload_celeb_intro_stream \{celeb_intro_checksum = none}
	printf \{channel = sfx
		qs(0x9f3ca4a3)}
	transition_getprefix type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = none)
		stopsound unique_id = ($celeb_intro_stream_id)
		change \{celeb_intro_stream_id = none}
	endif
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
		getvolumetweakofpreloadedstream streamname = <celeb_intro_vol_name>
		printf \{channel = sfx
			qs(0x75ea046e)}
		startpreloadedstream $celeb_intro_stream_id buss = encore_events forcesafepreload = 1 vol = <volumetweak>
		change \{celeb_intro_stream_id = none}
	endif
endscript
encore_event_stream_id = none

script preload_encore_event_stream 
	printf \{channel = sfx
		qs(0x03f14c32)}
	if NOT ($encore_event_stream_id = none)
		stopsound unique_id = ($encore_event_stream_id)
		change \{encore_event_stream_id = none}
	endif
	getpakmancurrentname \{map = zones}
	formattext checksumname = encore_stream_name '%s_encore' s = <pakname> addtostringlookup = true
	printf channel = sfx qs(0x26698a56) s = <encore_stream_name>
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
	if NOT ($encore_event_stream_id = none)
		stopsoundevent \{$current_crowd_encore
			fade_time = 2.5
			fade_type = log_slow}
		getpakmancurrentname \{map = zones}
		formattext checksumname = encore_stream_vol_name '%s_encore' s = <pakname> addtostringlookup = true
		getvolumetweakofpreloadedstream streamname = <encore_stream_vol_name>
		printf \{channel = sfx
			qs(0xd9aeb1dd)}
		startpreloadedstream $encore_event_stream_id buss = encore_events forcesafepreload = 1 vol = <volumetweak>
		change \{encore_event_stream_id = none}
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
		getvolumetweakofpreloadedstream streamname = <encore_stream_vol_name>
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
		stopsoundevent \{$current_crowd_encore
			fade_time = 2.5
			fade_type = log_slow}
		getvolumetweakofpreloadedstream \{streamname = career_outro}
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
	getglobaltags \{venue_intro_flags}
	if innetgame
		return \{false}
	endif
	if ($encore_transitioned_played = true)
		return \{false}
	endif
	printf qs(0x20f729ca) a = <zone>
	if structurecontains structure = <...> <zone>
		<venue_flag> = (<...>.<zone>)
		if (<venue_flag> = 1)
			printf \{qs(0x85a3eba3)}
			return \{false}
		endif
	endif
	printf \{qs(0xc78ea90b)}
	addparam name = <zone> value = 1 structure_name = newvalue
	setglobaltags venue_intro_flags params = <newvalue>
	return \{true}
endscript
