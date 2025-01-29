transition_playing = false
current_playing_transition = none
transition_types = {
	intro = {
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
	encore = {
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
			scr = transition_cameracut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = super_shakin_guitar_unhide
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
	time = 8000
	scripttable = [
		{
			time = 0
			scr = super_shakin_guitar_unhide
		}
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
			scr = transition_cameracut
			params = {
				prefix = 'cameras_intro'
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
			scr = super_shakin_guitar_unhide
		}
		{
			time = 1
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
default_preencore_transition = {
	time = 8000
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
			scr = play_outro
			params = {
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
				prefix = 'cameras_preencore'
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
default_preaerosmith_transition = {
	time = 8000
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
common_preaerosmith_transition = {
	scripttable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = play_outro
			params = {
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
				prefix = 'cameras_preaerosmith'
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
		{
			time = 0
			scr = play_intro
			params = {
			}
		}
	]
}
common_encore_transition = {
	scripttable = [
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
			time = 1
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
default_aerosmith_entrance_transition = {
	time = 13000
	scripttable = [
		{
			time = 0
			scr = play_intro
			params = {
			}
		}
	]
}
common_aerosmith_entrance_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_aerosmith_entrance'
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
			time = 1
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
default_preboss_transition = {
	time = 8000
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
			scr = play_outro
			params = {
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
	time = 9000
	scripttable = [
		{
			time = 1
			scr = band_playsimpleanim
			params = {
				name = bassist
				anim = gh3_guit_joep_boss_intro
			}
		}
	]
}
common_boss_transition = {
	scripttable = [
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
			time = 1
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
	time = 8000
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
			scr = play_outro
			params = {
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
			scr = play_outro
			params = {
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
default_dmcintro_transition = {
	time = 8000
	scripttable = [
	]
}
common_dmcintro_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_intro'
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
			time = 1
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

script transition_selecttransition \{practice_intro = 0}
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
	if ($current_num_players = 1 &&
			$current_song = kingofrock &&
			$current_level = load_z_nine_lives)
		change \{current_transition = dmcintro}
		return
	endif
	if ($game_mode = p1_career)
		get_progression_globals game_mode = ($game_mode) use_current_tab = 1
		career_songs = <tier_global>
		tier = ($setlist_selection_tier)
		formattext checksumname = tier_checksum 'tier%s' s = <tier>
		if NOT structurecontains structure = ($<career_songs>) <tier_checksum>
			change \{current_transition = intro}
			return
		endif
		if progression_isbosssong tier_global = <tier_global> tier = <tier> song = ($current_song)
			if should_play_boss_intro
				if NOT ($current_song = bossdevil)
					change \{current_transition = boss}
				else
					change \{current_transition = fastintro}
				endif
			else
				change \{current_transition = fastintro}
			endif
			return
		endif
		if progression_isencoresong tier_global = <tier_global> tier = <tier> song = ($current_song)
			change \{current_transition = encore}
			return
		endif
		if progression_isfirstaerosmithsong tier_global = <tier_global> tier = <tier> song = ($current_song)
			change \{current_transition = aerosmith_entrance}
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

script transition_killall 
	killspawnedscript \{id = transitions}
	change \{transition_playing = false}
	change \{current_playing_transition = none}
endscript

script transition_gettime \{type = intro}
	if structurecontains structure = $transition_types <type>
		printstruct <...>
		type_textnl = ($transition_types.<type>.textnl)
	else
		printstruct <...>
		scriptassert \{"Unknown transition type"}
	endif
	getpakmancurrentname \{map = zones}
	formattext checksumname = transition_props '%s_%p_Transition' p = <type_textnl> s = <pakname>
	if NOT globalexists name = <transition_props>
		formattext checksumname = transition_props 'default_%p_Transition' p = <type_textnl> s = <pakname>
	endif
	return transition_time = ($<transition_props>.time)
endscript

script transition_play \{type = intro}
	transition_killall
	change current_playing_transition = <type>
	if structurecontains structure = $transition_types <type>
		type_textnl = ($transition_types.<type>.textnl)
	else
		printstruct <...>
		scriptassert \{"Unknown transition type"}
	endif
	getpakmancurrentname \{map = zones}
	formattext checksumname = event 'Common_%p_TransitionSetup' p = <type_textnl> s = <pakname>
	if scriptexists <event>
		<event>
	endif
	formattext checksumname = event '%s_%p_TransitionSetup' p = <type_textnl> s = <pakname>
	if scriptexists <event>
		<event>
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
	formattext checksumname = transition_props '%s_%p_Transition' p = <type_textnl> s = <pakname>
	if NOT globalexists name = <transition_props>
		formattext checksumname = transition_props 'default_%p_Transition' p = <type_textnl>
		if NOT globalexists name = <transition_props>
			printstruct <...>
			scriptassert \{"Default Transition Struct not found"}
		endif
	endif
	transition_time = ($<transition_props>.time)
	spawnscriptnow transition_play_iterator id = transitions params = {<...>}
	formattext checksumname = transition_props 'Common_%p_Transition' p = <type_textnl>
	spawnscriptnow transition_play_iterator id = transitions params = {<...>}
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
	if structurecontains structure = ($<transition_props>) endwithdefaultcamera
		if structurecontains structure = ($<transition_props>) syncwithnotecameras
			cameracuts_getnextnotecameratime
			getsongtimems
			if (<camera_time> >= 0 &&
					<camera_time> - <time> < 2000)
				cameracuts_enablechangecam \{enable = false}
			else
				if NOT ($game_mode = training)
					cameracuts_setarrayprefix \{prefix = 'cameras'
						changenow}
				else
					cameracuts_enablechangecam \{enable = false}
				endif
			endif
		else
			if NOT ($game_mode = training)
				cameracuts_setarrayprefix \{prefix = 'cameras'
					changenow}
			else
				cameracuts_enablechangecam \{enable = false}
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

script specialcamera_playanim \{cycle = 0}
	setsearchallassetcontexts
	getpakmancurrent \{map = zones}
	getpakmancurrentname \{map = zones}
	formattext textname = suffix '_%s' s = <obj>
	appendsuffixtochecksum base = <pak> suffixstring = <suffix>
	cameraname = (<pakname> + <suffix>)
	if compositeobjectexists name = <appended_id>
		<appended_id> :obj_switchscript specialcamera_playanim_spawned params = {anim = <anim> cycle = <cycle> blendduration = <blendduration>}
	else
		printf "Unable to find SpecialCamera %s...." s = <cameraname>
	endif
	setsearchallassetcontexts \{off}
endscript

script specialcamera_playanim_spawned 
	begin
	setsearchallassetcontexts
	gameobj_playanim anim = <anim> blendduration = <blendduration>
	gameobj_waitanimfinished
	setsearchallassetcontexts \{off}
	if (<cycle> = 0)
		break
	endif
	repeat
endscript

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
	cameracuts_setarrayprefix <...> length = <transition_time>
endscript

script transition_stoprendering 
	printf \{"Transition_StopRendering"}
	stoprendering
endscript

script transition_startrendering 
	printf \{"Transition_StartRendering"}
	startrendering
	enable_pause
	change \{is_changing_levels = 0}
	if ($blade_active = 1)
		change \{blade_active = 0}
		gh3_start_pressed
	endif
endscript

script transition_printf 
	printf <...>
endscript

script transitions_resetzone 
	printf \{"Transitions_ResetZone"}
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
	if structurecontains structure = ($<nodearray_checksum> [<array_count>]) createdfromvariable
		resetvalid = false
	endif
	if structurecontains structure = ($<nodearray_checksum> [<array_count>]) createdonprogress
		resetvalid = false
	endif
	if structurecontains structure = ($<nodearray_checksum> [<array_count>]) class
		if NOT ($<nodearray_checksum> [<array_count>].class = gameobject ||
				$<nodearray_checksum> [<array_count>].class = levelgeometry ||
				$<nodearray_checksum> [<array_count>].class = levelobject)
			resetvalid = false
		endif
	else
		resetvalid = false
	endif
	if (<resetvalid> = true)
		printf "Resetting %s" s = ($<nodearray_checksum> [<array_count>].name)
		kill name = ($<nodearray_checksum> [<array_count>].name)
		if structurecontains structure = ($<nodearray_checksum> [<array_count>]) createdatstart
			create name = ($<nodearray_checksum> [<array_count>].name)
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script common_preencore_transitionsetup 
	preencore_crowd_build_sfx
	change_crowd_looping_sfx \{crowd_looping_state = good}
endscript

script common_preencore_transitionend 
endscript

script common_preaerosmith_transitionsetup 
	preaerosmith_crowd_build_sfx
	change_crowd_looping_sfx \{crowd_looping_state = good}
endscript

script common_preaerosmith_transitionend 
endscript

script common_aerosmith_entrance_transitionsetup 
	gh_sfx_play_aerosmith_entrance_audio_from_zone_memory
endscript

script common_dmcintro_transitionsetup 
	gh_sfx_play_dmcintro_audio_from_zone_memory
endscript

script common_encore_transitionsetup 
	gh_sfx_play_encore_audio_from_zone_memory
endscript

script common_boss_transitionsetup 
	gh_sfx_play_boss_audio_from_zone_memory
endscript

script common_aerosmith_entrance_transitionend 
endscript

script common_encore_transitionend 
endscript

script preload_encore_bink_audio \{movie_name = 'z_artdeco_encore_audio'}
endscript
