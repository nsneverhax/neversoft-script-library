
script get_persistent_band_savegame 
	controller = ($primary_controller)
	if ($primary_controller = -1)
		controller = 0
	endif
	get_savegame_from_controller controller = <controller>
	return savegame = <savegame>
endscript

script persistent_band_create_band \{async = 0}
	set_parts_with_mic
	get_persistent_band_savegame
	cascancelloading
	casblockforcomposite
	casblockforloading
	if gotparam \{startup}
		persistent_band_place_primary_character_on_part savegame = <savegame> player = 1
		i = 0
		begin
		player = ($g_persistent_band_data [<i>].player)
		if (<player> < 0)
			<player> = (<i> + 1)
		endif
		getplayerinfo <player> part
		getplayerinfo <player> has_mic
		i = (<i> + 1)
		repeat 4
		copy_parts_to_stored_parts
	endif
	i = 0
	begin
	player = ($g_persistent_band_data [<i>].player)
	if (<player> < 0)
		<player> = (<i> + 1)
	endif
	getplayerinfo <player> part
	persistent_band_create_character {
		async = <async>
		index = <i>
		part = <part>
		savegame = <savegame>
		player = <player>
		startup = <startup>
		refresh = <refresh>
		has_mic = <has_mic>
	}
	i = (<i> + 1)
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	repeat 4
	change \{g_persistent_band_initialized = 1}
endscript

script persistent_band_create_character \{async = !i1768515945
		index = !i1768515945}
	formattext checksumname = name 'musician%i' i = (<index> + 1)
	formattext checksumname = heap 'heap_musician%i' i = (<index> + 1)
	if NOT gotparam \{refresh}
		if compositeobjectexists name = <name>
			destroy_band_member name = <name>
		endif
	endif
	if NOT gotparam \{character_id}
		requireparams \{[
				savegame
				index
			]
			all}
		get_saved_band_member savegame = <savegame> index = <index>
	endif
	persistent_band_maybe_use_worst_case_character
	if NOT gotparam \{override}
		requireparams \{[
				character_id
				character_savegame
			]
			all}
	endif
	if characterprofilegetstruct name = <character_id> savegame = <character_savegame>
		if gotparam \{startup}
			setplayerinfo <player> band_member = <name>
			setplayerinfo <player> character_id = <character_id>
			setplayerinfo <player> character_savegame = <character_savegame>
			setplayerinfo <player> stored_character_index = <index>
			if (<player> = 1)
				persistent_band_get_correct_vocals_character startup = 1 player = <player>
			endif
		else
			if gotparam \{refresh}
				persistent_band_refresh_character {
					index = <index>
					player = <player>
					override = <override>
				}
				return
			endif
			persistent_band_set_data index = <index> building = 1
			create_band_member {
				name = <name>
				id = <character_id>
				player = <player>
				async = <async>
				asset_heap = <heap>
				savegame = <character_savegame>
				instrument = <part>
				stored_character_index = <stored_character_index>
				with_mic = <has_mic>
			}
			<name> :pause
			setarrayelement arrayname = cas_queue_player_info globalarray index = <index> newvalue = {
				player = <player>
				object = <name>
			}
		endif
	else
		scriptassert 'Character profile %p not found in savegame %s' p = <character_id> s = <character_savegame>
	endif
endscript

script persistent_band_place_primary_character_on_part 
	requireparams \{[
			player
			savegame
		]
		all}
	if ($autolaunch_go = 0)
		return
	endif
	if isxenonorwindx
		controller = <savegame>
	else
		getactivecontrollers
		getarraysize <active_controllers>
		i = 0
		controller = -1
		begin
		if (<active_controllers> [<i>] = 1)
			<controller> = <i>
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	if (<controller> >= 0)
		if isguitarcontroller controller = <controller>
			get_progression_instrument_user_option controller = <controller> option = 'guitar_bass_flip'
			switch (<user_option>)
				case none
				case guitar
				my_part = guitar
				case bass
				my_part = bass
				default
				my_part = guitar
			endswitch
		elseif isdrumcontroller controller = <controller>
			my_part = drum
		elseif is_regular_controller controller = <controller>
			my_part = vocals
		else
			my_part = vocals
		endif
		getplayerinfo <player> part out = this_part
		if (<this_part> != <my_part>)
			next_player = (<player> + 1)
			begin
			if (<next_player> > 4)
				break
			endif
			getplayerinfo <player> part out = this_part
			getplayerinfo <next_player> part out = next_part
			setplayerinfo <player> part = <next_part>
			setplayerinfo <next_player> part = <this_part>
			if (<next_part> = <my_part>)
				break
			else
				next_player = (<next_player> + 1)
			endif
			repeat
		endif
	endif
endscript

script persistent_band_setup_new_character 
	requireparams \{[
			name
			instrument
			player
		]
		all}
	if (<instrument> = none)
		return
	endif
	if NOT objectexists id = <name>
		printf qs(0xadf70858) i = <name> channel = persistent_band
		return
	endif
	if ($is_in_cas = 0)
		<name> :persistent_band_play_default_anim
	endif
	if (<instrument> != vocals)
		<name> :hide_mic
	endif
	band_lobby_get_player_submenu_index player_num = <player>
	if (-1 != <submenu_index>)
		band_lobby_play_viewport_camera {
			viewport_index = <submenu_index>
			lock_to_target = <name>
			fix_camera_shudder = 1
		}
	endif
endscript

script persistent_band_get_alias_from_part 
	requireparams \{[
			part
		]
		all}
	switch <part>
		case guitar
		case guitar_and_vocals
		alias = guitarist
		case vocals
		case vocals_and_guitar
		alias = vocalist
		case drum
		alias = drummer
		case bass
		alias = bassist
		default
		scriptassert qs(0xa3aa9fb5) p = <part>
	endswitch
	if objectexists id = <alias>
		<alias> :obj_getid
		printf 'alias %a is already in use by %o' xchannel = persistent_band a = <alias> o = <objid>
		persistent_band_get_unused_alias
	endif
	return alias = <alias>
endscript

script persistent_band_get_unused_alias 
	guitarists = 0
	vocalists = 0
	bassists = 0
	drummers = 0
	get_player_infos_in_use
	i = 0
	begin
	player = (<player_infos_in_use> [<i>])
	persistent_band_get_index_from_player player = <player>
	part = ($g_persistent_band_data [<index>].instrument)
	switch <part>
		case guitar
		guitarists = (<guitarists> + 1)
		case vocals
		vocalists = (<vocalists> + 1)
		case bass
		bassists = (<bassists> + 1)
		case drum
		drummers = (<drummers> + 1)
		default
		scriptassert 'persistent_band_get_unused_alias has unknown part %p' p = <part>
	endswitch
	i = (<i> + 1)
	repeat 4
	if (<guitarists> = 0)
		if NOT objectexists \{id = guitarist}
			return \{alias = guitarist}
		endif
	endif
	if (<bassists> = 0)
		if NOT objectexists \{id = bassist}
			return \{alias = bassist}
		endif
	endif
	if (<vocalists> = 0)
		if NOT objectexists \{id = vocalist}
			return \{alias = vocalist}
		endif
	endif
	if (<drummers> = 0)
		if NOT objectexists \{id = drummer}
			return \{alias = drummer}
		endif
	endif
	persistent_band_print_info
	printstruct ($g_current_band)
	scriptassert \{qs(0x8a111b79)}
endscript

script persistent_band_prepare_for_song \{async = 0}
	killspawnedscript \{name = persistent_band_cancel_lobby}
	printscriptinfo \{'persistent_band_prepare_for_song'}
	onexitrun \{persistent_band_prepare_for_song_exit}
	change \{g_suppress_menu_stack_loop_check = 1}
	playlist_getcurrentsong
	get_persistent_band_savegame
	set_parts_with_mic <...>
	should_use_alt_positions
	persistent_band_unique_musician_check
	celeb_band = 0
	change \{g_current_band = default_band}
	if NOT gotparam \{startup}
		if NOT change_band_for_song
			gamemode_gettype
			if (<type> = freeplay || $in_sing_a_long = true)
				get_player_infos_in_use
				i = 0
				begin
				persistent_band_get_correct_vocals_character player = (<player_infos_in_use> [<i>])
				i = (<i> + 1)
				repeat 4
			else
				persistent_band_refresh_changed_characters async = <async>
			endif
		else
			celeb_band = 1
		endif
	endif
	cas_queue_wait
	begin
	if persistent_band_finished_building
		break
	endif
	wait \{1
		gameframe}
	repeat
	persistent_band_pause_all_characters
	if NOT persistent_band_has_four_musicians
		persistent_band_print_info \{channel = main}
		scriptassert \{qs(0xd93a2b88)}
	endif
	persistent_band_update_all_aliases
	pick_random_win_lose_anims <...>
	if NOT quest_progression_is_chapter_rush
		bandmanager_airguitarcheat
	endif
	band_clearanimtempo
	prepare_for_pending_animpaks
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	animloadbeginrequests \{group = loop_anims
		heap = heap_musician_anim
		slop_heap = heap_musician_anim
		asset_context = loop_anims}
	animloadbeginrequests \{group = win_lose_anims
		heap = heap_win_lose_anim
		slop_heap = heap_win_lose_anim
		asset_context = win_lose_anims}
	i = 0
	begin
	formattext checksumname = name 'musician%i' i = (<i> + 1)
	part = ($g_persistent_band_data [<i>].instrument)
	persistent_band_move_and_orient_band_member name = <name>
	if ($g_current_band != default_band)
		persistent_band_get_celeb_part_from_character_id {
			character_id = ($g_persistent_band_data [<i>].character_id)
		}
		position_part = <celeb_part>
	else
		position_part = <part>
	endif
	if ($cheat_airinstruments = 0)
		if (<position_part> != vocals)
			<name> :hide_mic
		else
			<name> :show_mic
		endif
	endif
	<stored_character_index> = ($g_persistent_band_data [<i>].stored_character_index)
	get_saved_band_member savegame = <savegame> index = <stored_character_index>
	band_load_single_anim_pak {
		character_id = <character_id>
		part = <part>
		name = <name>
		savegame = <character_savegame>
		async = <async>
		player = <player>
		song = <current_song>
		slot_index = <islotindex>
	}
	band_member_start_anims {
		name = <name>
		instrument = <part>
		loading_into_song = <current_song>
		async = <async>
	}
	<name> :anim_command {
		target = moment_blend
		command = partialswitch_setstate
		params = {
			off
			blendduration = 0.0
		}
	}
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	i = (<i> + 1)
	repeat 4
	animloadendrequestsanddoloading \{group = loop_anims}
	animloadendrequestsanddoloading \{group = win_lose_anims}
	printf \{'Began loading loop anims...'}
	archivewaitloading {
		loop_anims
		async = <async>
	}
	archivewaitloading {
		win_lose_anims
		async = <async>
	}
	printf \{'Finished loading loop anims!'}
	persistent_band_pause_all_characters \{unpause}
	if scriptexists \{z_credits_lock_band_to_ampzilla}
		z_credits_lock_band_to_ampzilla
	endif
endscript

script persistent_band_prepare_for_song_exit 
	change \{g_suppress_menu_stack_loop_check = 0}
endscript

script persistent_band_change_rocker \{use_power_rocker = 0
		transformation = 0}
	change_band_for_song {use_power_rocker = <use_power_rocker> transformation = <transformation>}
	begin
	if persistent_band_finished_building
		break
	endif
	wait \{1
		gameframe}
	repeat
	if NOT persistent_band_has_four_musicians
		persistent_band_print_info \{channel = main}
		scriptassert \{qs(0xd93a2b88)}
	endif
	persistent_band_update_all_aliases
endscript

script persistent_band_cancel_lobby 
	printf \{'persistent_band_cancel_lobby'
		channel = persistent_band}
	persistent_band_unique_musician_check
	persistent_band_force_traditional_band
	begin
	if persistent_band_finished_building
		break
	endif
	wait \{1
		gameframe}
	repeat
	if NOT persistent_band_has_four_musicians
		return
	endif
	persistent_band_update_all_aliases
	i = 0
	begin
	formattext checksumname = name 'musician%i' i = (<i> + 1)
	if objectexists id = <name>
		persistent_band_move_and_orient_band_member name = <name>
	else
		return
	endif
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_update_all_aliases 
	rocker_part = none
	removealias \{guitarist}
	removealias \{bassist}
	removealias \{vocalist}
	removealias \{drummer}
	removealias \{rocker}
	removealias \{power_rocker}
	gamemode_gettype
	if (<type> = career && $g_net_leader_player_num >= 0)
		getplayerinfo \{$g_net_leader_player_num
			part
			out = rocker_part}
	endif
	i = 0
	begin
	formattext checksumname = name 'musician%i' i = (<i> + 1)
	part = ($g_persistent_band_data [<i>].instrument)
	if ($g_current_band != default_band)
		persistent_band_get_celeb_part_from_character_id {
			character_id = ($g_persistent_band_data [<i>].character_id)
		}
		part = <celeb_part>
	endif
	persistent_band_update_alias name = <name> part = <part>
	if (<type> = career)
		if (<part> = <rocker_part>)
			assignalias id = <name> alias = rocker
		elseif (<part> = $g_power_rocker_part)
			assignalias id = <name> alias = power_rocker
		endif
	endif
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_update_alias 
	requireparams \{[
			name
			part
		]
		all}
	persistent_band_get_alias_from_part part = <part>
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> position = <alias>
	if objectexists id = <name>
		assignalias id = <name> alias = <alias>
	endif
	if cas_get_lightgroup position = <alias> id = <name>
		setlightgroups id = <name> lightgroup = <lightgroup>
	endif
endscript

script persistent_band_get_celeb_part_from_character_id 
	requireparams \{[
			character_id
		]
		all}
	band = ($g_current_band)
	<part> = none
	if (($<band>.guitarist) = <character_id>)
		part = guitar
	elseif (($<band>.bassist) = <character_id>)
		part = bass
	elseif (($<band>.vocalist) = <character_id>)
		part = vocals
	elseif (($<band>.drummer) = <character_id>)
		part = drum
	else
		printstruct ($<band>)
		persistent_band_print_info \{channel = main}
		scriptassert qs(0xc69250e3) c = <character_id> b = $g_current_band
		return
	endif
	return celeb_part = <part>
endscript

script reset_parts_with_mic 
	return
	i = 1
	begin
	setplayerinfo <i> has_mic = 0
	i = (<i> + 1)
	repeat 4
endscript

script set_parts_with_mic 
	i = 1
	begin
	setplayerinfo <i> has_mic = 1
	i = (<i> + 1)
	repeat 8
	return
	reset_parts_with_mic
	if (($g_allow_moments = false) || ($g_using_traditional_band_setup = false))
		return
	endif
	get_song_struct song = <current_song>
	if NOT structurecontains structure = <song_struct> parts_with_mic
		return
	endif
	i = 1
	begin
	getplayerinfo <i> part
	switch <part>
		case guitar
		position = guitarist
		case bass
		position = bassist
		case drum
		position = drummer
		case vocals
		position = vocalist
		default
		scriptassert 'set_parts_with_mic has unknown part %p' p = <part>
	endswitch
	if arraycontains array = (<song_struct>.parts_with_mic) contains = <position>
		setplayerinfo <i> has_mic = 1
	endif
	i = (<i> + 1)
	repeat 4
endscript

script using_singing_guitarist 
	gamemode_gettype
	if (<type> = career)
		playlist_getcurrentsong
		get_band_configuration song = <current_song>
		if (<band> != default_band)
			if structurecontains structure = $<band> vocalist_has_guitar
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script venue_should_use_song_performance \{song = none}
	current_zone = (($levelzones.$current_level).zone)
	switch <song>
		case dontspeak
		if (<current_zone> != z_awardshow)
			return \{false}
		endif
		case justagirl
		if (<current_zone> != z_paris)
			return \{false}
		endif
		case lovestory
		if (<current_zone> != z_centralpark)
			return \{false}
		endif
		case picturetoburn
		case youbelongwithme
		if (<current_zone> != z_gorge)
			return \{false}
		endif
		case shewillbeloved
		if (<current_zone> != z_tokyo)
			return \{false}
		endif
		case none
		scriptassert \{'Called venue_should_use_song_performance without passing a song param'}
		default
	endswitch
	return \{true}
endscript

script change_band_for_song \{use_power_rocker = 0
		transformation = 0
		override_band = none}
	change \{g_current_band = default_band}
	<song_is_downloaded> = 0
	playlist_getcurrentsong
	if structurecontains structure = $download_songlist_props <current_song>
		<song_is_downloaded> = 1
	endif
	gamemode_gettype
	if (<type> = career)
		if (<override_band> != none)
			<rocker_band> = <override_band>
		else
			if structurecontains structure = ($levelzones.$current_level) career_band
				<rocker_band> = (($levelzones.$current_level).career_band)
			else
				<rocker_band> = rockerband_gh_rocker_newmale
			endif
		endif
		<player_num> = 1
		if ($g_net_leader_player_num > 0)
			<player_num> = $g_net_leader_player_num
		endif
		getplayerinfo <player_num> part out = rocker_part
		getplayerinfo <player_num> character_savegame
		switch <rocker_part>
			case guitar
			<position> = guitarist
			case bass
			<position> = bassist
			case drum
			<position> = drummer
			case vocals
			<position> = vocalist
			default
			scriptassert 'change_band_for_song has unknown part %p' p = <part>
		endswitch
		if current_song_has_female_vocalist
			female_vocals = 1
		else
			female_vocals = 0
		endif
		if (<use_power_rocker> = 0 && <transformation> = 0)
			if quest_progression_current_chapter_transformed
				<use_power_rocker> = 1
			else
				if console_is_net_career_client
					<encore_ready> = ($g_net_career_progression.career_progression_tags.encore_ready)
				else
					getglobaltags \{career_progression_tags
						param = encore_ready}
				endif
				if (<encore_ready> = 1)
					if NOT is_encore_song
						<transformation> = 1
					endif
				endif
			endif
		endif
		career_band_update {
			band = <rocker_band>
			rocker_part = <position>
			female_vocals = <female_vocals>
			savegame = <character_savegame>
			use_power_rocker = <use_power_rocker>
			transformation = <transformation>
		}
		change \{g_current_band = g_career_band}
		<band> = g_career_band
		if (<band> != default_band)
			i = 0
			begin
			formattext checksumname = name 'musician%i' i = (<i> + 1)
			extendcrc <name> '_Info' out = info_struct
			position = ($<info_struct>.position)
			band_character = ($<band>.<position>)
			player = ($g_persistent_band_data [<i>].player)
			if (<player> < 0)
				<player> = (<i> + 1)
			endif
			if (<band_character> != savedbandmember)
				character_id = ($<band>.<position>)
				switch <position>
					case guitarist
					part = guitar
					case bassist
					part = bass
					case drummer
					part = drum
					case vocalist
					if structurecontains structure = $<band> vocalist_has_guitar
						part = vocals_and_guitar
					else
						part = vocals
					endif
					default
					scriptassert 'change_band_for_song has unknown position %p' p = <position>
				endswitch
				<refresh> = 0
				object_data = ($g_persistent_band_data [<i>])
				if ((<object_data>.character_id) != <character_id>)
					refresh = 1
				endif
				if ((<object_data>.instrument) != <part>)
					refresh = 1
				endif
				if NOT compositeobjectexists name = (<object_data>.object)
					refresh = 1
				endif
				if ((<object_data>.building) = 1)
					refresh = 1
				endif
				if (<refresh> = 1)
					override = {
						character_id = <character_id>
						part = <part>
					}
					persistent_band_refresh_character {
						index = <i>
						player = <player>
						override = <override>
					}
				endif
			endif
			i = (<i> + 1)
			repeat 4
		endif
		return \{true}
	endif
	return \{false}
endscript

script persistent_band_get_correct_vocals_character 
	requireparams \{[
			player
		]
		all}
	if gotparam \{reset_vocalist}
		return \{false}
	endif
	playlist_getcurrentsong
	if (<current_song> = null || <current_song> = none)
		return \{false}
	endif
	if ($override_band_members = 1)
		return \{false}
	endif
	if NOT gotparam \{startup}
		if playerinfoequals <player> is_local_client = 0
			return \{false}
		endif
		getplayerinfo <player> band_member
		persistent_band_get_index_from_object_id object = <band_member>
		gamemode_gettype
		if (<type> = freeplay || $in_sing_a_long = true)
			name = ($g_persistent_band_data [<index>].object)
			extendcrc <name> '_Info' out = info_struct
			position = ($<info_struct>.position)
			if (<position> = vocalist)
				proceed = 1
			endif
		else
			getplayerinfo <player> part
			if (<part> = vocals)
				getplayerinfo <player> in_game
				if (<in_game> = 0)
					proceed = 1
				endif
			endif
		endif
	else
		proceed = 1
	endif
	if gotparam \{proceed}
		get_song_struct song = <current_song>
		if NOT structurecontains structure = <song_struct> singer
			return \{false}
		endif
		gender = (<song_struct>.singer)
		if NOT gotparam \{startup}
			if NOT (<type> = freeplay)
				getplayerinfo <player> in_game
				if (<in_game> = 1 && $in_sing_a_long = false)
					return \{false}
				endif
			endif
		endif
		if NOT (<gender> = male || <gender> = female)
			return \{false}
		endif
		removeparameter \{song_struct}
		get_savegame_from_player player = <player>
		getplayerinfo <player> character_id
		getplayerinfo <player> character_savegame
		if (<character_savegame> < 0)
			get_persistent_band_savegame
			setplayerinfo <player> character_savegame = <savegame>
			getplayerinfo <player> character_savegame
		endif
		if get_is_female_from_character_id character_id = <character_id> savegame = <character_savegame>
			if (<gender> = male && <is_female> = 1)
				random_character = male
			elseif (<gender> = female && <is_female> = 0)
				random_character = female
			endif
			removeparameter \{is_female}
		endif
		if gotparam \{random_character}
			if gotparam \{index}
				if get_is_female_from_character_id character_id = ($g_persistent_band_data [<index>].character_id) savegame = ($g_persistent_band_data [<index>].savegame)
					if (<gender> = male && <is_female> = 0)
						character_id = ($g_persistent_band_data [<index>].character_id)
						character_savegame = ($g_persistent_band_data [<index>].savegame)
						removeparameter \{random_character}
					elseif (<gender> = female && <is_female> = 1)
						character_id = ($g_persistent_band_data [<index>].character_id)
						character_savegame = ($g_persistent_band_data [<index>].savegame)
						removeparameter \{random_character}
					endif
				endif
			endif
		endif
		if gotparam \{random_character}
			cas_get_random_character savegame = <character_savegame> part = vocals categories = [ghrockers presetcars cars] <random_character>
			removeparameter \{random_character}
		endif
		if gotparam \{character_id}
			override = {character_id = <character_id> savegame = <character_savegame>}
			if NOT gotparam \{startup}
				if (<type> = freeplay || $in_sing_a_long = true)
					object_data = ($g_persistent_band_data [<index>])
					override = {<override> part = (<object_data>.instrument)}
					if NOT ((<object_data>.character_id) = <character_id> && (<object_data>.savegame) = <character_savegame>)
						persistent_band_refresh_character {
							index = <index>
							player = <player>
							override = <override>
							savegame = <character_savegame>
						}
						return \{true}
					endif
					return \{false}
				endif
			endif
			return true {character_id = <character_id> character_savegame = <character_savegame> override = <override>}
		endif
	endif
	return \{false}
endscript

script pick_random_win_lose_anims 
	if ($g_random_win_lose_anim_current_song = <current_song>)
		return
	endif
	change g_random_win_lose_anim_current_song = <current_song>
	get_persistent_band_savegame
	selected_win_anims = []
	selected_lose_anims = []
	i = 1
	begin
	formattext checksumname = musician 'musician%a' a = <i>
	formattext checksumname = info_struct 'musician%a_info' a = <i>
	part = ($<info_struct>.part)
	if (<part> = vocals)
		if using_singing_guitarist
			part = guitar
		endif
	endif
	gender = male
	if compositeobjectexists name = <musician>
		<musician> :getsingletag is_female
		if (<is_female> = 1)
			gender = female
		endif
	endif
	getarraysize ($win_anims.<gender>.<part>)
	win_array_size = <array_size>
	getrandomvalue name = win_index a = 0 b = (<array_size> -1) integer
	getarraysize ($lose_anims.<gender>.<part>)
	lose_array_size = <array_size>
	getrandomvalue name = lose_index a = 0 b = (<array_size> -1) integer
	if (<i> > 1)
		begin
		used = false
		j = 0
		begin
		if ((<selected_win_anims> [<j>].gender) = <gender>
				&& (<selected_win_anims> [<j>].part) = <part>
				&& (<selected_win_anims> [<j>].index) = <win_index>)
			used = true
			break
		endif
		j = (<j> + 1)
		repeat (<i> -1)
		if (<used> = false)
			break
		endif
		win_index = (<win_index> + 1)
		if (<win_index> >= <win_array_size>)
			win_index = 0
		endif
		repeat <win_array_size>
		begin
		used = false
		j = 0
		begin
		if ((<selected_lose_anims> [<j>].gender) = <gender>
				&& (<selected_lose_anims> [<j>].part) = <part>
				&& (<selected_lose_anims> [<j>].index) = <lose_index>)
			used = true
			break
		endif
		j = (<j> + 1)
		repeat (<i> -1)
		if (<used> = false)
			break
		endif
		lose_index = (<lose_index> + 1)
		if (<lose_index> >= <lose_array_size>)
			lose_index = 0
		endif
		repeat <lose_array_size>
	endif
	win_anim = ($win_anims.<gender>.<part> [<win_index>])
	lose_anim = ($lose_anims.<gender>.<part> [<lose_index>])
	if ($g_use_largest_lose_win_anims = 1)
		animloadgetfourlargestassets \{struct = $win_anims}
		win_anim = (<largest_assets> [(<i> - 1)])
		animloadgetfourlargestassets \{struct = $lose_anims}
		lose_anim = (<largest_assets> [(<i> - 1)])
	endif
	intro_anim = none
	switch <part>
		case guitar
		intro_anim = guit_greg_notempo_01
		case bass
		intro_anim = guit_greg_notempo_02
		case vocals
		intro_anim = sing_greg_notempo
		case drum
		intro_anim = none
		default
		scriptassert 'pick_random_win_lose_anims has unknown part %p' p = <part>
	endswitch
	object_data = ($g_persistent_band_data [(<i> -1)])
	if characterprofilegetstruct name = (<object_data>.character_id) savegame = <savegame>
		if gotparam \{profile_struct}
			if structurecontains \{structure = profile_struct
					intro_anims}
				intro_anims = (<profile_struct>.intro_anims)
				getarraysize <intro_anims>
				getrandomvalue name = index a = 0 b = (<array_size> -1) integer
				intro_anim = (<intro_anims> [<index>])
				scriptassert \{'Come talk to Gavin if you hit this - We need to ensure these anims fit within budget'}
			endif
			if structurecontains \{structure = profile_struct
					win_anims}
				win_anims = (<profile_struct>.win_anims)
				getarraysize <win_anims>
				getrandomvalue name = index a = 0 b = (<array_size> -1) integer
				win_anim = (<win_anims> [<index>])
				scriptassert \{'Come talk to Gavin if you hit this - We need to ensure these anims fit within budget'}
			endif
			if structurecontains \{structure = profile_struct
					lose_anims}
				lose_anims = (<profile_struct>.lose_anims)
				getarraysize <lose_anims>
				getrandomvalue name = index a = 0 b = (<array_size> -1) integer
				lose_anim = (<lose_anims> [<index>])
				scriptassert \{'Come talk to Gavin if you hit this - We need to ensure these anims fit within budget'}
			endif
			removeparameter \{profile_struct}
		endif
	endif
	change structurename = <info_struct> win_anim_name = <win_anim>
	change structurename = <info_struct> lose_anim_name = <lose_anim>
	change structurename = <info_struct> intro_anim_name = <intro_anim>
	win_anim_info = {
		gender = <gender>
		part = <part>
		index = <win_index>
	}
	addarrayelement array = <selected_win_anims> element = <win_anim_info>
	selected_win_anims = <array>
	lose_anim_info = {
		gender = <gender>
		part = <part>
		index = <win_index>
	}
	addarrayelement array = <selected_lose_anims> element = <lose_anim_info>
	selected_lose_anims = <array>
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_move_and_orient_band_member 
	requireparams \{[
			name
		]
		all}
	extendcrc <name> '_Info' out = info_struct
	get_start_node_id member = <name>
	if gotparam \{waypoint_id}
		if doeswaypointexist name = <waypoint_id>
			getwaypointpos name = <waypoint_id>
			getwaypointquat name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
			<name> :obj_setposition position = <pos>
			<name> :obj_setorientation quat = <quat>
			return
		endif
	endif
endscript

script persistent_band_stop_and_unload_anims 
	drummer_kill_spawnscripts
	vocalist_reset_globals
	autolook_kill_spawnscripts
	crowd_kill_spawnscripts
	band_stop_anims
	band_unload_anim_paks
endscript

script persistent_band_get_index_from_object_id 
	requireparams \{[
			object
		]
		all}
	get_musician_id name = <object>
	switch <name>
		case musician1
		index = 0
		case musician2
		index = 1
		case musician3
		index = 2
		case musician4
		index = 3
		default
		scriptassert qs(0xc28a3b17) i = <name>
	endswitch
	return index = <index>
endscript

script persistent_band_get_index_from_player 
	requireparams \{[
			player
		]
		all}
	i = 0
	begin
	if (($g_persistent_band_data [<i>].player) = <player>)
		return index = <i>
	endif
	i = (<i> + 1)
	repeat 4
	scriptassert 'player %p is not in g_persistent_band_data' p = <player>
endscript

script persistent_band_get_musician_from_part \{part = !q1768515945}
	i = 0
	begin
	if (($g_persistent_band_data [<i>].instrument) = <part>)
		return index = <i>
	endif
	i = (<i> + 1)
	repeat 4
	scriptassert 'Instrument %p is not in g_persistent_band_data' p = <part>
endscript

script persistent_band_set_data 
	if NOT gotparam \{index}
		requireparams \{[
				object
			]
			all}
		persistent_band_get_index_from_object_id object = <object>
	endif
	requireparams \{[
			index
		]
		all}
	obj_data = ($g_persistent_band_data [<index>])
	if NOT gotparam \{player}
		player = (<obj_data>.player)
	endif
	if NOT gotparam \{building}
		building = (<obj_data>.building)
	else
		getlogicframe
		if (<building> = 0)
			band_lobby_persistent_band_unmask player = <player> time = <unmask_time>
		else
			band_lobby_persistent_band_mask player = <player>
		endif
	endif
	if NOT gotparam \{instrument}
		instrument = (<obj_data>.instrument)
	endif
	if NOT gotparam \{microphone}
		microphone = (<obj_data>.microphone)
	endif
	if NOT gotparam \{savegame}
		savegame = (<obj_data>.savegame)
	endif
	if NOT gotparam \{character_id}
		character_id = (<obj_data>.character_id)
	endif
	if NOT gotparam \{stored_character_index}
		stored_character_index = (<obj_data>.stored_character_index)
	endif
	if NOT gotparam \{appearance_checksum}
		if gotparam \{appearance}
			get_appearance_checksum {appearance = <appearance> instrument = <instrument> mic = <microphone>}
			appearance_checksum = <new_appearance_checksum>
			removeparameter \{appearance}
		endif
		if NOT gotparam \{appearance_checksum}
			appearance_checksum = (<obj_data>.appearance_checksum)
		endif
	endif
	new_data = {
		object = (<obj_data>.object)
		player = <player>
		instrument = <instrument>
		savegame = <savegame>
		character_id = <character_id>
		stored_character_index = <stored_character_index>
		appearance_checksum = <appearance_checksum>
		microphone = <microphone>
		building = <building>
	}
	setarrayelement {
		arrayname = g_persistent_band_data
		globalarray
		index = <index>
		newvalue = <new_data>
	}
endscript

script persistent_band_refresh_changed_characters \{async = 0}
	if ($g_persistent_band_initialized = 0)
		return
	endif
	get_player_infos_in_use
	count = 0
	begin
	persistent_band_refresh_changed_character async = <async> player = (<player_infos_in_use> [<count>]) reset_vocalist = <reset_vocalist>
	count = (<count> + 1)
	repeat 4
	if ($in_band_lobby = 1)
		if ($cas_loading_setup = lobby)
			set_cas_loading_setup \{setup = lobby}
		endif
		player = 1
		begin
		formattext checksumname = object_name 'musician%i' i = <player>
		if compositeobjectexists name = <object_name>
			<object_name> :unpause
		endif
		player = (<player> + 1)
		repeat 4
	endif
endscript

script persistent_band_refresh_changed_character 
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	refresh = 0
	getplayerinfo <player> band_member
	persistent_band_get_index_from_object_id object = <band_member>
	getplayerinfo <player> part
	getplayerinfo <player> stored_character_index
	getplayerinfo <player> has_mic
	band_lobby_get_character_id player = <player>
	persistent_band_get_correct_vocals_character player = <player> reset_vocalist = <reset_vocalist>
	object_data = ($g_persistent_band_data [<index>])
	if ((<object_data>.character_id) != <character_id>)
		refresh = 1
	endif
	if ((<object_data>.instrument) != <part>)
		refresh = 1
	endif
	if ((<object_data>.savegame) != <character_savegame>)
		refresh = 1
	endif
	if ((<object_data>.microphone) != <has_mic>)
		refresh = 1
	endif
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	if characterprofilegetstruct name = <character_id> savegame = <character_savegame>
		if gotparam \{profile_struct}
			if fix_profile_struct_for_career profile_struct = <profile_struct>
				profile_struct = <new_profile_struct>
			endif
			if structurecontains \{structure = profile_struct
					appearance}
				generatechecksumfromstruct struct = (<profile_struct>.appearance)
			endif
			removeparameter \{profile_struct}
		endif
		if gotparam \{structure_checksum}
			structure_checksum = (<structure_checksum> + <part>)
			if (<has_mic> > 0)
				structure_checksum = (<structure_checksum> + mic)
			endif
			if ((<object_data>.appearance_checksum) != <structure_checksum>)
				refresh = 1
			endif
		endif
		if ((<object_data>.stored_character_index) != <stored_character_index>)
			refresh = 1
		endif
		if ((<object_data>.player) != <player>)
			persistent_band_set_data object = <band_member> player = <player>
		endif
		if NOT compositeobjectexists name = <band_member>
			refresh = 1
		endif
		if ((<object_data>.building) = 1)
			refresh = 1
		endif
		if (<refresh> = 1)
			change \{g_random_win_lose_anim_current_song = none}
			persistent_band_refresh_character index = <index> player = <player> override = <override>
		else
			if ($in_band_lobby = 1)
				band_lobby_persistent_band_unmask player = <player>
			endif
		endif
	else
		scriptassert 'Character profile %p not found in savegame %s' p = <character_id> s = <character_savegame>
	endif
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
endscript

script persistent_band_refresh_character 
	requireparams \{[
			index
			player
		]
		all}
	name = (($g_persistent_band_data [<index>]).object)
	persistent_band_set_data index = <index> building = 1
	if NOT gotparam \{override}
		getplayerinfo <player> part
		getplayerinfo <player> stored_character_index
		getplayerinfo <player> has_mic
		band_lobby_get_character_id player = <player>
		persistent_band_maybe_use_worst_case_character
		if characterprofilegetstruct name = <character_id> savegame = <character_savegame>
			if fix_profile_struct_for_career profile_struct = <profile_struct>
				profile_struct = <new_profile_struct>
			endif
			if NOT structurecontains \{structure = profile_struct
					appearance}
				printstruct <profile_struct>
				characterprofiledump
				scriptassert \{'profile_struct is missing appearance'}
			endif
			if NOT cas_queue_add_request {
					appearance = (<profile_struct>.appearance)
					player = <player>
					index = <index>
					instrument = <part>
					character_id = <character_id>
					savegame = <character_savegame>
					stored_character_index = <stored_character_index>
					has_mic = <has_mic>
					persistent_band = 1
				}
				if gotparam \{character_is_finished}
					persistent_band_set_data index = <index> building = 0 unmask_time = 0.0
				endif
			endif
		else
			scriptassert 'Character profile %p not found in savegame %s' p = <character_id> s = <savegame>
		endif
	else
		if structurecontains structure = <override> character_id
			character_id = (<override>.character_id)
		endif
		if structurecontains structure = <override> savegame
			savegame = (<override>.savegame)
		endif
		if structurecontains structure = <override> part
			part = (<override>.part)
		else
			getplayerinfo <player> part
		endif
		if (<part> = vocals_and_guitar)
			has_mic = 1
		else
			getplayerinfo <player> has_mic
		endif
		if characterprofilegetstruct name = <character_id> savegame = <savegame>
			if fix_profile_struct_for_career profile_struct = <profile_struct>
				profile_struct = <new_profile_struct>
			endif
			if NOT cas_queue_add_request {
					appearance = (<profile_struct>.appearance)
					player = <player>
					index = <index>
					instrument = <part>
					character_id = <character_id>
					savegame = <savegame>
					stored_character_index = <stored_character_index>
					has_mic = <has_mic>
				}
				printf \{'persistent_band call to cas_queue_add_request returned false'
					channel = persistent_band}
				if gotparam \{character_is_finished}
					persistent_band_set_data index = <index> building = 0 unmask_time = 0.0
				endif
			endif
		endif
	endif
endscript

script persistent_band_play_all_default_anims 
	i = 0
	begin
	name = ($g_persistent_band_data [<i>].object)
	if objectexists id = <name>
		<name> :persistent_band_play_default_anim
	endif
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_play_default_anim 
	obj_getid
	persistent_band_get_index_from_object_id object = <objid>
	instrument = ($g_persistent_band_data [<index>].instrument)
	if getsingletag \{body_checksum}
		if (<body_checksum> = silhouette_net)
			if (<instrument> != drum)
				instrument = none
			endif
		endif
	endif
	switch <instrument>
		case guitar
		anim = guit_greg_notempo_01
		case bass
		anim = guit_greg_notempo_02
		case vocals
		anim = sing_greg_notempo
		case drum
		anim = drumdroid_waiting_inout_full
		case none
		anim = guit_greg_notempo_01
		default
		scriptassert 'persistent_band_play_default_anim has unknown instrument %i' i = <instrument>
	endswitch
	if gotparam \{anim}
		anim_command \{target = moment_blend
			command = partialswitch_setstate
			params = {
				on
				blendduration = 0.0
			}}
		start_time = 0
		switch <objid>
			case musician1
			start_time = 0
			case musician2
			start_time = 0.25
			case musician3
			start_time = 0.5
			case musician4
			start_time = 0.75
			default
			scriptassert 'persistent_band_play_default_anim has unknown objId %o' o = <objid>
		endswitch
		anim_command {
			target = moment_branch
			command = degenerateblend_addbranch
			params = {
				tree = $hero_cycle_branch
				blendduration = 0
				params = {
					anim_name = <anim>
					timer_id = momenttimer
					start_time = <start_time>
				}
			}
		}
	endif
	band_setikchain name = <objid> chain = slave
	<objid> :obj_teleport
endscript

script persistent_band_print_info \{channel = persistent_band}
	if (<channel> = main)
		removeparameter \{channel}
	endif
	get_player_infos_in_use
	count = 0
	begin
	i = (<player_infos_in_use> [<count>])
	getplayerinfo <i> band_member
	printf qs(0x65ddfbeb) i = <band_member> channel = <channel>
	persistent_band_get_index_from_object_id object = <band_member>
	getplayerinfo <i> character_id
	getplayerinfo <i> part
	getplayerinfo <i> character_savegame
	getplayerinfo <i> stored_character_index
	getplayerinfo <i> has_mic
	object_data = ($g_persistent_band_data [<index>])
	printstruct <...> channel = <channel>
	count = (<count> + 1)
	repeat 4
endscript

script persistent_band_maybe_use_worst_case_character 
	if NOT ($use_worst_band = 0)
		if ($use_worst_band = male)
			return \{character_id = worstmalecharacter}
		else
			return \{character_id = worstfemalecharacter}
		endif
	endif
endscript

script persistent_band_force_traditional_band 
	if gotparam \{test}
		setplayerinfo \{1
			part = bass}
		setplayerinfo \{2
			part = drum}
		setplayerinfo \{3
			part = drum}
		setplayerinfo \{4
			part = bass}
	endif
	used_parts = [0 0 0 0]
	ok_players = [0 0 0 0]
	part_checksums = [guitar vocals bass drum]
	get_player_infos_in_use
	i = 0
	begin
	player = (<player_infos_in_use> [<i>])
	getplayerinfo <player> part
	switch <part>
		case guitar
		index = 0
		case vocals
		index = 1
		case bass
		index = 2
		case drum
		index = 3
		default
		scriptassert 'persistent_band_force_traditional_band has unknown part %p' p = <part>
	endswitch
	if ((<used_parts> [<index>]) = 0)
		setarrayelement arrayname = used_parts index = <index> newvalue = 1
		setarrayelement arrayname = ok_players index = <i> newvalue = 1
	endif
	i = (<i> + 1)
	repeat 4
	i = 0
	begin
	if ((<ok_players> [<i>]) = 0)
		z = 0
		begin
		if ((<used_parts> [<z>]) = 0)
			setarrayelement arrayname = used_parts index = <z> newvalue = 1
			break
		endif
		z = (<z> + 1)
		repeat 4
		player = (<player_infos_in_use> [<i>])
		setplayerinfo <player> part = (<part_checksums> [<z>])
	endif
	i = (<i> + 1)
	repeat 4
	copy_parts_to_stored_parts
	persistent_band_refresh_changed_characters
	if gotparam \{test}
		getplayerinfo \{1
			part
			out = part1}
		getplayerinfo \{2
			part
			out = part2}
		getplayerinfo \{3
			part
			out = part3}
		getplayerinfo \{4
			part
			out = part4}
		printstruct <...> channel = persistent_band
	endif
endscript

script persistent_band_hide_nonvocalist_mics 
	get_player_infos_in_use
	i = 0
	begin
	player = (<player_infos_in_use> [<i>])
	getplayerinfo <player> part
	getplayerinfo <player> band_member
	if (<part> != vocals)
		if objectexists id = <band_member>
			<band_member> :hide_mic
		endif
	endif
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_destroy_other_characters 
	requireparams \{[
			player
		]
		all}
	i = 0
	begin
	this_player = (($g_persistent_band_data [<i>]).player)
	name = (($g_persistent_band_data [<i>]).object)
	if (<this_player> != <player>)
		cas_queue_kill_player player = <this_player>
		destroy_band_member name = <name>
	endif
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_unique_musician_check 
	obj_1 = 0
	obj_2 = 0
	obj_3 = 0
	obj_4 = 0
	get_player_infos_in_use
	i = 0
	begin
	getplayerinfo (<player_infos_in_use> [<i>]) band_member out = obj_id
	switch <obj_id>
		case musician1
		obj_1 = (<obj_1> + 1)
		case musician2
		obj_2 = (<obj_2> + 1)
		case musician3
		obj_3 = (<obj_3> + 1)
		case musician4
		obj_4 = (<obj_4> + 1)
		default
		scriptassert 'persistent_band_unique_musician_check has unknown obj_id %o' o = <obj_id>
	endswitch
	i = (<i> + 1)
	repeat 4
	if (<obj_1> > 1 || <obj_2> > 1 || <obj_3> > 1 || <obj_4> > 1)
		persistent_band_print_info \{channel = main}
		scriptassert \{'Two or more players have the same object id'}
		persistent_band_force_unique_musicians
	endif
endscript

script persistent_band_force_unique_musicians 
	if gotparam \{test}
		setplayerinfo \{1
			band_member = musician3}
		setplayerinfo \{2
			band_member = musician3}
		setplayerinfo \{3
			band_member = musician3}
		setplayerinfo \{4
			band_member = musician3}
	endif
	used_musicians = [0 0 0 0]
	ok_players = [0 0 0 0]
	musician_checksums = [musician1 musician2 musician3 musician4]
	get_player_infos_in_use
	i = 0
	begin
	player = (<player_infos_in_use> [<i>])
	getplayerinfo <player> band_member
	switch <band_member>
		case musician1
		index = 0
		case musician2
		index = 1
		case musician3
		index = 2
		case musician4
		index = 3
		default
		scriptassert 'persistent_band_force_unique_musicians has unknown band_member %b' b = <band_member>
	endswitch
	if ((<used_musicians> [<index>]) = 0)
		setarrayelement arrayname = used_musicians index = <index> newvalue = 1
		setarrayelement arrayname = ok_players index = <i> newvalue = 1
	endif
	i = (<i> + 1)
	repeat 4
	i = 0
	begin
	if ((<ok_players> [<i>]) = 0)
		z = 0
		begin
		if ((<used_musicians> [<z>]) = 0)
			setarrayelement arrayname = used_musicians index = <z> newvalue = 1
			break
		endif
		z = (<z> + 1)
		repeat 4
		player = (<player_infos_in_use> [<i>])
		setplayerinfo <player> band_member = (<musician_checksums> [<z>])
	endif
	i = (<i> + 1)
	repeat 4
	if gotparam \{test}
		getplayerinfo \{1
			band_member
			out = band_member1}
		getplayerinfo \{2
			band_member
			out = band_member2}
		getplayerinfo \{3
			band_member
			out = band_member3}
		getplayerinfo \{4
			band_member
			out = band_member4}
		printstruct <...> channel = persistent_band
	endif
endscript

script persistent_band_pause_all_characters 
	i = 0
	begin
	formattext checksumname = name 'musician%i' i = (<i> + 1)
	if objectexists id = <name>
		if NOT gotparam \{unpause}
			<name> :pause
		else
			<name> :unpause
		endif
	endif
	i = (<i> + 1)
	repeat 4
endscript

script get_player_infos_in_use 
	player_infos_in_use = [0 0 0 0]
	getfirstplayer \{on_screen}
	i = 0
	non_player = 1
	begin
	if (<player> > 0)
		setarrayelement arrayname = player_infos_in_use index = <i> newvalue = <player>
		getnextplayer on_screen player = <player>
	else
		begin
		if (
				<non_player> = <player_infos_in_use> [0]
				||
				<non_player> = <player_infos_in_use> [1]
				||
				<non_player> = <player_infos_in_use> [2]
				||
				<non_player> = <player_infos_in_use> [3]
			)
			non_player = (<non_player> + 1)
		else
			break
		endif
		repeat
		setarrayelement arrayname = player_infos_in_use index = <i> newvalue = <non_player>
		non_player = (<non_player> + 1)
	endif
	i = (<i> + 1)
	repeat 4
	return player_infos_in_use = <player_infos_in_use>
endscript

script persistent_band_get_unused_musician 
	obj_1 = 0
	obj_2 = 0
	obj_3 = 0
	obj_4 = 0
	get_player_infos_in_use
	i = 0
	begin
	getplayerinfo (<player_infos_in_use> [<i>]) band_member out = obj_id
	switch <obj_id>
		case musician1
		obj_1 = (<obj_1> + 1)
		case musician2
		obj_2 = (<obj_2> + 1)
		case musician3
		obj_3 = (<obj_3> + 1)
		case musician4
		obj_4 = (<obj_4> + 1)
		default
	endswitch
	i = (<i> + 1)
	repeat 4
	if (<obj_1> = 0)
		unused_musician = musician1
	elseif (<obj_2> = 0)
		unused_musician = musician2
	elseif (<obj_3> = 0)
		unused_musician = musician3
	elseif (<obj_4> = 0)
		unused_musician = musician4
	else
		unused_musician = none
	endif
	return unused_musician = <unused_musician>
endscript

script persistent_band_force_create_and_wait 
	pushunsafeforshutdown \{context = persistent_band_force_create_and_wait}
	cascancelloading
	cas_destroy_all_characters
	persistent_band_create_band \{refresh = 1}
	if NOT gotparam \{no_wait}
		if gotparam \{no_block}
			cas_queue_wait
		else
			cas_queue_block
		endif
	endif
	popunsafeforshutdown \{context = persistent_band_force_create_and_wait}
endscript

script persistent_band_has_four_musicians 
	if NOT objectexists \{id = musician1}
		return \{false}
	elseif NOT objectexists \{id = musician2}
		return \{false}
	elseif NOT objectexists \{id = musician3}
		return \{false}
	elseif NOT objectexists \{id = musician4}
		return \{false}
	endif
	return \{true}
endscript

script persistent_band_finished_building \{assert = 0}
	i = 0
	begin
	if (($g_persistent_band_data [<i>].building) = 1)
		if (<assert> = 0)
			return \{false}
		else
			persistent_band_print_info \{channel = main}
			scriptassert qs(0x19b8fc19) i = <i>
		endif
	endif
	i = (<i> + 1)
	repeat 4
	return \{true}
endscript

script should_use_alt_positions 
	use_alt_positions = 0
	getpakmancurrent \{map = zones}
	if (<pak> = z_gorge)
		if getnodeflag \{ls_encore_post}
			use_alt_positions = 1
		endif
	endif
	change g_band_use_alt_positions = <use_alt_positions>
endscript

script current_song_has_female_vocalist 
	playlist_getcurrentsong
	get_song_struct song = <current_song>
	if structurecontains structure = <song_struct> singer
		if ((<song_struct>.singer) = female)
			return \{true}
		endif
	endif
	return \{false}
endscript
