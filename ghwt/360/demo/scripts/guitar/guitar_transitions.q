transition_playing = false
current_playing_transition = none
finalbandintro_transition_playing = 0
skipping_jimmy_encore_anim = 0
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
		intro = 'intro_ozzy'
		song = mrcrowley
		venue = load_z_metalfest
		part = vocals
	}
	{
		intro = 'intro_zakk'
		song = bosszakk
		venue = load_z_bayou
		part = guitar_vocals
		boss_song = true
		show_boss_helper_screen
	}
	{
		intro = 'intro_zakk'
		song = stillborn
		venue = load_z_bayou
		part = guitar_vocals
		boss_song = false
	}
	{
		intro = 'intro_hayley'
		song = miserybusiness
		venue = load_z_recordstore
		part = vocals
	}
	{
		intro = 'intro_ted'
		song = bossted
		venue = load_z_fairgrounds
		part = guitar
		boss_song = true
		show_boss_helper_screen
	}
	{
		intro = 'intro_ted'
		song = stranglehold
		venue = load_z_fairgrounds
		part = guitar
		boss_song = false
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
			scr = bandmanager_setplayingintroanims
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
	s
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
			scr = band_playtransitionidles
			params = {
				from_restart = true
			}
		}
		{
			time = 100
			scr = transition_startrendering
		}
		{
			time = 100
			scr = enable_tutorial_pause
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
			scr = training_setup_camera
			params = {
				name = cameracutcam
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
			scr = band_playtransitionidles
		}
		{
			time = 100
			scr = transition_startrendering
		}
		{
			time = 100
			scr = enable_tutorial_pause
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
			scr = band_playtransitionidles
			params = {
				from_restart = true
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
default_restartboss_transition = {
	time = 3000
	scripttable = [
	]
}
common_restartboss_transition = {
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
			scr = band_playtransitionidles
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
			scr = start_preloaded_celeb_intro_stream
		}
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
default_finalbandintro_transition = {
	time = 20000
	scripttable = [
	]
}
common_finalbandintro_transition = {
	scripttable = [
		{
			time = 0
			scr = start_preloaded_celeb_intro_stream
		}
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
			}
		}
		{
			time = 0
			scr = change_crowd_looping_sfx
			params = {
				crowd_looping_state = good
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
			scr = start_preloaded_encore_event_stream
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
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_preboss_transition = {
	time = 10000
	scripttable = [
	]
}
common_preboss_transition = {
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
				prefix = 'cameras_preboss'
				changenow
			}
		}
	]
	endwithdefaultcamera
}
default_boss_transition = {
	time = 8000
	scripttable = [
	]
}
common_boss_transition = {
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
				prefix = 'cameras_boss'
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
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_songwon_transition = {
	time = 10000
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
	time = 10000
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
			}
		}
		{
			time = 0
			scr = createinvenueloadingscreen
			params = {
			}
		}
		{
			time = 9900
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
			scr = band_playtransitionidles
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}

script createinvenueloadingscreen 
	gamemode_gettype
	if NOT (($current_transition) = encore)
		if (($skipping_jimmy_encore_anim) = 1)
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_encore_confirmation
				}}
		elseif (($is_network_game = 1 && <type> = career) || $is_network_game = 0)
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_song_breakdown
				}}
		endif
	else
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_encore_confirmation
			}}
	endif
endscript

script pauseinvenueloadingscreen 
	if ($is_network_game = 1)
		gamemode_gettype
		if (<type> = career)
			change \{songtime_paused = 1}
			cleargameover
			syncandlaunchnetgame
			broadcastevent \{type = done_loading}
			begin
			if ($net_ready_to_start)
				printf \{qs(0x8fbf033d)}
				break
			endif
			wait \{1
				gameframe}
			repeat
			change \{songtime_paused = 0}
		endif
		return
	endif
	if (($current_transition) = encore)
		return
	elseif (($skipping_jimmy_encore_anim) = 1)
		change \{skipping_jimmy_encore_anim = 0}
		return
	endif
	change \{songtime_paused = 1}
	begin
	if ($finished_gig_band_rebuild = 0)
		wait \{1
			gameframe}
	else
		break
	endif
	repeat
	ui_song_breakdown_pause_between_songs
endscript

script common_loading_transitionend 
	printscriptinfo \{'Common_Loading_TransitionEnd'}
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

script transition_selecttransition \{practice_intro = 0}
	change \{finalbandintro_transition_playing = 0}
	change \{show_boss_helper_screen = 0}
	change \{skipping_jimmy_encore_anim = 0}
	if (<practice_intro> = 1)
		return
	endif
	if ($current_transition = debugintro)
		change \{current_transition = intro}
		return
	endif
	if ($coop_dlc_active = 1)
		change \{current_transition = intro}
		return
	endif
	if ($game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		get_progression_globals ($current_progression_flag) use_current_tab = 1
		career_songs = <tier_global>
		tier = ($current_gig_number)
		formattext checksumname = tier_checksum 'tier%s' s = <tier>
		if NOT structurecontains structure = ($<career_songs>) <tier_checksum>
			change \{current_transition = intro}
			return
		endif
		if ($is_network_game = 0)
			if structurecontains structure = ($<career_songs>.<tier_checksum>) play_finalbandintro_transition_type
				if ($current_level = load_z_newyork)
					bandname_id = band_info
					type = ($<career_songs>.<tier_checksum>.play_finalbandintro_transition_type)
					getglobaltags <bandname_id> param = <type>
					if (<...>.<type> = 0)
						addparam structure_name = new_params name = <type> value = 1
						setglobaltags <bandname_id> params = <new_params>
						change \{current_transition = intro}
						change \{finalbandintro_transition_playing = 1}
						return
					endif
				endif
			endif
		endif
		if progression_isencoresong tier_global = <tier_global> tier = <tier> song = ($current_song)
			band_builder_get_band_global
			if (<band> = band_hendrix && $current_level != load_z_ballpark)
				change \{skipping_jimmy_encore_anim = 1}
			else
				change \{current_transition = encore}
				return
			endif
		endif
		if transition_selectcelebtransition
			return
		endif
	endif
	if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
		get_progression_globals game_mode = ($game_mode) use_current_tab = 1
		setlist_songs = <tier_global>
		tier = ($setlist_selection_tier)
		formattext checksumname = tier_checksum 'tier%s' s = <tier>
		if NOT structurecontains structure = ($<setlist_songs>) <tier_checksum>
			change \{current_transition = intro}
			return
		endif
	endif
	change \{current_transition = intro}
endscript

script transition_selectcelebtransition 
	getarraysize ($celeb_intro_transitions)
	index = 0
	begin
	valid = 1
	if structurecontains structure = ($celeb_intro_transitions [<index>]) song
		if NOT ($current_song = $celeb_intro_transitions [<index>].song)
			valid = 0
		endif
	else
		valid = 0
	endif
	if structurecontains structure = ($celeb_intro_transitions [<index>]) venue
		if NOT ($current_level = $celeb_intro_transitions [<index>].venue)
			valid = 0
		endif
	else
		valid = 0
	endif
	gamemode_getnumplayersshown
	if (<num_players_shown> > 1)
		part = ($celeb_intro_transitions [<index>].part)
		switch <part>
			case guitar
			if is_any_player_on_part \{part = guitar}
				valid = 0
			endif
			case guitar_vocals
			if is_any_player_on_part \{part = guitar}
				if is_any_player_on_part \{part = vocals}
					valid = 0
				endif
			endif
			case bass_vocals
			if is_any_player_on_part \{part = bass}
				if is_any_player_on_part \{part = vocals}
					valid = 0
				endif
			endif
			case vocals
			if is_any_player_on_part \{part = vocals}
				valid = 0
			endif
			case drums
			if is_any_player_on_part \{part = drum}
				valid = 0
			endif
			case no_replacements
			valid = <valid>
			default
			valid = 0
		endswitch
	endif
	if structurecontains structure = ($celeb_intro_transitions [<index>]) boss_song
		boss_song = ($celeb_intro_transitions [<index>].intro)
		gamemode_getnumplayersshown
		if ((<num_players_shown> = 1) && ($player1_status.part = guitar))
			if (<boss_song> = false)
				valid = 0
			endif
		else
			if (<boss_song> = true)
				valid = 0
			endif
		endif
	endif
	if (<valid> = 1)
		formattext checksumname = transition '%s' s = ($celeb_intro_transitions [<index>].intro) addtostringlookup = true
		change current_transition = <transition>
		if structurecontains structure = ($celeb_intro_transitions [<index>]) show_boss_helper_screen
			change \{show_boss_helper_screen = 1}
		endif
		return \{true}
	endif
	index = (<index> + 1)
	repeat <array_size>
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
		if ($finalbandintro_transition_playing = 1)
			if ($current_playing_transition = finalbandintro)
				change \{finalbandintro_transition_playing = 0}
			else
				stoprendering
			endif
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1 || $current_song = jamsession)
			cameracuts_enablechangecam \{enable = false}
			getfps
			delay_ms = (0.0 - $time_input_offset)
			ms_per_frame = (1000.0 / <fps>)
			frames = (<delay_ms> / <ms_per_frame>)
			casttointeger \{frames}
			wait <frames> gameframes
			if ($current_song = jamsession)
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
					if NOT ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
						cameracuts_setarrayprefix \{prefix = 'cameras'
							changenow}
					else
						cameracuts_enablechangecam \{enable = false}
					endif
				endif
			else
				if NOT ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
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
	printf \{qs(0xc2684cb9)}
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
	stoprendering
endscript

script transition_startrendering 
	printf \{qs(0xeddd15af)}
	startrendering
	change \{is_changing_levels = 0}
	if ($blade_active = 1)
		change \{blade_active = 0}
		gh3_start_pressed \{from_handler}
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
	preload_celeb_intro_stream
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

script common_boss_transitionsetup 
endscript

script common_encore_transitionend 
endscript

script preload_encore_bink_audio \{movie_name = 'z_artdeco_encore_audio'}
endscript

script common_loading_transitionsetup 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_metalfest
		soundevent \{event = large_ext_crowd_song_transition}
		case z_newyork
		soundevent \{event = large_ext_crowd_song_transition}
		case z_goth
		soundevent \{event = medium_int_crowd_song_transition}
		case z_cathedral
		soundevent \{event = medium_int_crowd_song_transition}
		case z_fairgrounds
		soundevent \{event = medium_int_crowd_song_transition}
		case z_ballpark
		soundevent \{event = medium_int_crowd_song_transition}
		case z_castle
		soundevent \{event = medium_int_crowd_song_transition}
		case z_military
		soundevent \{event = medium_int_crowd_song_transition}
		case z_harbor
		soundevent \{event = medium_int_crowd_song_transition}
		case z_scifi
		soundevent \{event = medium_int_crowd_song_transition}
		case z_submarine
		soundevent \{event = medium_int_crowd_song_transition}
		default
		printf \{channel = sfx
			qs(0x21a8e0d5)}
	endswitch
	soundevent \{event = $current_crowd_swell_short_soundevent_l}
	soundevent \{event = $current_crowd_swell_short_soundevent_r}
	soundevent \{event = $current_crowd_swell_med_soundevent_l}
	soundevent \{event = $current_crowd_swell_med_soundevent_r}
	soundevent \{event = $current_crowd_swell_long_soundevent_l}
	soundevent \{event = $current_crowd_swell_long_soundevent_r}
	soundevent \{event = oneshotsbetweensongs}
	soundevent \{event = surgebetweensongs}
endscript
celeb_intro_stream_id = none

script preload_celeb_intro_stream 
	printf \{channel = sfx
		qs(0x9f3ca4a3)}
	transition_getprefix type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = none)
		stopsound unique_id = ($celeb_intro_stream_id)
		change \{celeb_intro_stream_id = none}
	endif
	if (<celeb_intro> = 0)
		return
	endif
	celeb_intro_checksum = ($current_playing_transition)
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

script start_preloaded_celeb_intro_stream 
	printf \{channel = sfx
		qs(0x9ff5df66)}
	if NOT ($celeb_intro_stream_id = none)
		startpreloadedstream \{$celeb_intro_stream_id
			buss = encore_events
			forcesafepreload = 1
			pitch = 100}
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
	preloadstream <encore_stream_name>
	change encore_event_stream_id = <unique_id>
	begin
	printf \{qs(0x93305209)}
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
		printf \{channel = sfx
			qs(0x554dbcd0)}
		startpreloadedstream \{$encore_event_stream_id
			buss = encore_events
			forcesafepreload = 1
			pitch = 100}
		change \{encore_event_stream_id = none}
	endif
endscript

script start_preloaded_finalbandoutro_stream 
	printf \{channel = sfx
		qs(0x12d0a014)}
	if NOT ($celeb_intro_stream_id = none)
		stopsoundevent \{$current_crowd_encore
			fade_time = 2.5
			fade_type = log_slow}
		startpreloadedstream \{$celeb_intro_stream_id
			buss = encore_events
			forcesafepreload = 1
			pitch = 100}
		change \{celeb_intro_stream_id = none}
	endif
endscript

script kill_transition_preload_streams 
	killspawnedscript \{name = preload_encore_event_stream}
	killspawnedscript \{name = preload_celeb_intro_stream}
	change \{encore_event_stream_id = none}
	change \{celeb_intro_stream_id = none}
endscript
