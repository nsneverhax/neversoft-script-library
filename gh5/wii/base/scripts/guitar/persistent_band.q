use_persistent_band = 1

script persistent_band_reset 
	setplayerinfo \{1
		character_id = gh_rocker_lars}
	setplayerinfo \{2
		character_id = gh_rocker_casey}
	setplayerinfo \{3
		character_id = gh_rocker_clive}
	setplayerinfo \{4
		character_id = gh_rocker_pandora}
endscript

script get_persistent_band_savegame 
	controller = ($primary_controller)
	if ($primary_controller = -1)
		controller = 0
	endif
	get_savegame_from_controller controller = <controller>
	return savegame = <savegame>
endscript

script persistent_band_create_band 
	get_persistent_band_savegame
	cascancelloading
	casblockforcomposite
	casblockforloading
	i = 0
	begin
	Player = ($persistent_band_data [<i>].Player)
	if (<Player> < 0)
		<Player> = (<i> + 1)
	endif
	getplayerinfo <Player> part
	persistent_band_create_character {
		async = <async>
		index = <i>
		part = <part>
		savegame = <savegame>
		Player = <Player>
		startup = <startup>
		refresh = <refresh>
	}
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_create_character \{async = 0}
	formatText checksumName = Name 'musician%i' i = (<index> + 1)
	formatText checksumName = Heap 'heap_musician%i' i = (<index> + 1)
	if CompositeObjectExists Name = <Name>
		destroy_band_member Name = <Name>
	endif
	if NOT GotParam \{character_id}
		RequireParams \{[
				savegame
				index
			]
			all}
		if GotParam \{startup}
			if (<index> = 0)
				persistent_band_place_primary_character_on_part savegame = <savegame> Player = <Player>
			endif
			getplayerinfo <Player> part
			if (<part> = vocals && <Player> < 4)
				persistent_band_prevent_female_vocalist savegame = <savegame> index = <index> Player = <Player>
			endif
		endif
		get_saved_band_member savegame = <savegame> index = <index>
	endif
	persistent_band_maybe_use_worst_case_character
	if NOT GotParam \{override}
		RequireParams \{[
				character_id
				character_savegame
			]
			all}
	endif
	if characterprofilegetstruct Name = <character_id> savegame = <character_savegame>
		if GotParam \{startup}
			setplayerinfo <Player> band_member = <Name>
			setplayerinfo <Player> character_id = <character_id>
			setplayerinfo <Player> character_savegame = <character_savegame>
			setplayerinfo <Player> stored_character_index = <index>
		endif
		if GotParam \{refresh}
			persistent_band_refresh_character {
				index = <index>
				Player = <Player>
				override = <override>
			}
			return
		endif
		persistent_band_set_data index = <index> building = 1
		create_band_member {
			Name = <Name>
			id = <character_id>
			Player = <Player>
			async = <async>
			asset_heap = <Heap>
			savegame = <character_savegame>
			instrument = <part>
			stored_character_index = <stored_character_index>
		}
		<Name> :Pause
		SetArrayElement ArrayName = cas_queue_player_info globalarray index = <index> NewValue = {
			Player = <Player>
			object = <Name>
		}
	else
		ScriptAssert 'Character profile %p not found in savegame %s' p = <character_id> s = <character_savegame>
	endif
endscript

script persistent_band_place_primary_character_on_part 
	RequireParams \{[
			Player
			savegame
		]
		all}
	if isxenonorwindx
		controller = <savegame>
	else
		GetActiveControllers
		GetArraySize <active_controllers>
		i = 0
		controller = -1
		begin
		if (<active_controllers> [<i>] = 1)
			<controller> = <i>
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	if (<controller> >= 0)
		if IsGuitarController controller = <controller>
			get_progression_instrument_user_option controller = <controller> option = 'guitar_bass_flip'
			switch (<user_option>)
				case None
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
		getplayerinfo <Player> part out = this_part
		if (<this_part> != <my_part>)
			next_player = (<Player> + 1)
			begin
			if (<next_player> > 4)
				break
			endif
			getplayerinfo <Player> part out = this_part
			getplayerinfo <next_player> part out = next_part
			setplayerinfo <Player> part = <next_part>
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

script persistent_band_prevent_female_vocalist 
	RequireParams \{[
			Player
			savegame
			index
		]
		all}
	get_saved_band_member savegame = <savegame> index = <index>
	characterprofilegetstruct Name = <character_id> savegame = <character_savegame>
	if get_is_female_from_appearance appearance = (<profile_struct>.appearance)
		if (<is_female> = 1)
			next_index = (<index> + 1)
			next_player = (<Player> + 1)
			begin
			if (<next_index> > 3 || <next_player> > 4)
				break
			endif
			get_saved_band_member savegame = <savegame> index = <next_index>
			characterprofilegetstruct Name = <character_id> savegame = <character_savegame>
			if get_is_female_from_appearance appearance = (<profile_struct>.appearance)
				if (<is_female> = 0)
					getplayerinfo <next_player> part
					setplayerinfo <Player> part = <part>
					setplayerinfo <next_player> part = vocals
					break
				else
					next_index = (<next_index> + 1)
					next_player = (<next_player> + 1)
				endif
			else
				next_index = (<next_index> + 1)
				next_player = (<next_player> + 1)
			endif
			repeat
		endif
	endif
endscript

script persistent_band_setup_new_character 
	RequireParams \{[
			Name
			instrument
			Player
		]
		all}
	if (<instrument> = None)
		return
	endif
	if NOT ObjectExists id = <Name>
		printf qs(0xadf70858) i = <Name> channel = persistent_band
		return
	endif
	if ($is_in_cas = 0)
		<Name> :persistent_band_play_default_anim
	endif
	if get_submenu_index_from_player Player = <Player>
		band_lobby_play_viewport_camera {
			viewport_index = <submenu_index>
			lock_to_target = <Name>
		}
	endif
endscript

script persistent_band_get_alias_from_part 
	RequireParams \{[
			part
		]
		all}
	switch <part>
		case guitar
		case guitar_and_vocals
		alias = GUITARIST
		case vocals
		case vocals_and_guitar
		alias = vocalist
		case drum
		alias = drummer
		case bass
		alias = BASSIST
		default
		ScriptAssert qs(0xa3aa9fb5) p = <part>
	endswitch
	if ObjectExists id = <alias>
		<alias> :Obj_GetID
		printf 'alias %a is already in use by %o' channel = persistent_band a = <alias> o = <objID>
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
	Player = (<player_infos_in_use> [<i>])
	persistent_band_get_index_from_player Player = <Player>
	part = ($persistent_band_data [<index>].instrument)
	switch <part>
		case guitar
		guitarists = (<guitarists> + 1)
		case vocals
		vocalists = (<vocalists> + 1)
		case bass
		bassists = (<bassists> + 1)
		case drum
		drummers = (<drummers> + 1)
	endswitch
	i = (<i> + 1)
	repeat 4
	if (<guitarists> = 0)
		if NOT ObjectExists \{id = GUITARIST}
			return \{alias = GUITARIST}
		endif
	endif
	if (<bassists> = 0)
		if NOT ObjectExists \{id = BASSIST}
			return \{alias = BASSIST}
		endif
	endif
	if (<vocalists> = 0)
		if NOT ObjectExists \{id = vocalist}
			return \{alias = vocalist}
		endif
	endif
	if (<drummers> = 0)
		if NOT ObjectExists \{id = drummer}
			return \{alias = drummer}
		endif
	endif
	persistent_band_print_info
	ScriptAssert \{qs(0xd329ce2d)}
endscript

script persistent_band_prepare_for_song \{async = 0}
	KillSpawnedScript \{Name = persistent_band_cancel_lobby}
	gman_songtool_getcurrentsong
	get_persistent_band_savegame
	set_parts_with_mic <...>
	celeb_band = 0
	gamemode_gettype
	if (<Type> != freeplay)
		if NOT change_band_for_song <...>
			printf \{'band is being refreshed with no celeb'}
			persistent_band_refresh_changed_characters async = <async>
		else
			printf \{'band is being refreshed with no celeb'}
			celeb_band = 1
		endif
	endif
	cas_queue_wait
	printf \{'characters are ready'
		channel = persistent_band}
	persistent_band_unique_musician_check
	if NOT persistent_band_has_four_musicians
		persistent_band_print_info \{channel = main}
		ScriptAssert \{qs(0xd93a2b88)}
	endif
	persistent_band_update_all_aliases
	pick_random_win_lose_anims <...>
	band_clearanimtempo
	if (<async> = 1)
		Wait \{1
			gameframe}
	endif
	i = 0
	begin
	formatText checksumName = Name 'musician%i' i = (<i> + 1)
	part = ($persistent_band_data [<i>].instrument)
	persistent_band_move_and_orient_band_member Name = <Name>
	if (($persistent_band_data [<i>].microphone) = 1)
		if ($current_persistent_band != default_band)
			persistent_band_get_celeb_part_from_character_id {
				character_id = ($persistent_band_data [<i>].character_id)
			}
			position_part = <celeb_part>
		else
			position_part = <part>
		endif
		if (<position_part> != vocals)
			<Name> :hide_mic
		else
			<Name> :show_mic
		endif
	endif
	<stored_character_index> = ($persistent_band_data [<i>].stored_character_index)
	get_saved_band_member savegame = <savegame> index = <stored_character_index>
	band_load_single_anim_pak {
		character_id = <character_id>
		part = <part>
		Name = <Name>
		savegame = <character_savegame>
		async = <async>
		Player = <Player>
		song = <current_song>
		slot_index = <islotindex>
	}
	<Name> :hero_clear_facial_anim
	<Name> :Anim_Command target = moment_branch Command = DegenerateBlend_AddBranch params = {Tree = $hero_empty_branch BlendDuration = 0.0}
	<Name> :Anim_Command target = Body Command = DegenerateBlend_AddBranch params = {Tree = $hero_empty_branch BlendDuration = 0.0}
	<Name> :Unpause
	band_member_start_anims {
		Name = <Name>
		instrument = <part>
		loading_into_song = <current_song>
		async = <async>
	}
	<Name> :Anim_Command {
		target = moment_blend
		Command = partialswitch_setstate
		params = {
			OFF
			BlendDuration = 0.0
		}
	}
	if (<async> = 1)
		Wait \{1
			gameframe}
	endif
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_cancel_lobby 
	printf \{'persistent_band_cancel_lobby'
		channel = persistent_band}
	persistent_band_force_traditional_band
	begin
	if persistent_band_finished_building
		break
	endif
	Wait \{1
		gameframe}
	repeat
	printf \{'characters are ready'
		channel = persistent_band}
	persistent_band_unique_musician_check
	if NOT persistent_band_has_four_musicians
		return
	endif
	persistent_band_update_all_aliases
	i = 0
	begin
	formatText checksumName = Name 'musician%i' i = (<i> + 1)
	if ObjectExists id = <Name>
		persistent_band_move_and_orient_band_member Name = <Name>
	else
		return
	endif
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_update_all_aliases 
	removealias \{GUITARIST}
	removealias \{BASSIST}
	removealias \{vocalist}
	removealias \{drummer}
	i = 0
	begin
	formatText checksumName = Name 'musician%i' i = (<i> + 1)
	part = ($persistent_band_data [<i>].instrument)
	if ($current_persistent_band != default_band)
		persistent_band_get_celeb_part_from_character_id {
			character_id = ($persistent_band_data [<i>].character_id)
		}
		part = <celeb_part>
	endif
	persistent_band_update_alias Name = <Name> part = <part>
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_update_alias 
	RequireParams \{[
			Name
			part
		]
		all}
	persistent_band_get_alias_from_part part = <part>
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> position = <alias>
	if ObjectExists id = <Name>
		AssignAlias id = <Name> alias = <alias>
	endif
endscript

script persistent_band_get_celeb_part_from_character_id 
	RequireParams \{[
			character_id
		]
		all}
	Band = ($current_persistent_band)
	if (($<Band>.GUITARIST) = <character_id>)
		part = guitar
	elseif (($<Band>.BASSIST) = <character_id>)
		part = bass
	elseif (($<Band>.vocalist) = <character_id>)
		part = vocals
	elseif (($<Band>.drummer) = <character_id>)
		part = drum
	else
		return
	endif
	return celeb_part = <part>
endscript

script reset_parts_with_mic 
	i = 1
	begin
	setplayerinfo <i> has_mic = 0
	i = (<i> + 1)
	repeat 4
endscript

script set_parts_with_mic 
	printf \{qs(0x8a960c6c)}
	reset_parts_with_mic
	if NOT should_play_moments
		printf \{qs(0x40c0aa58)}
		return
	endif
	get_song_struct song = <current_song>
	if NOT StructureContains structure = <song_struct> parts_with_mic
		printf \{qs(0x2dd4ca34)}
		return
	endif
	i = 1
	begin
	formatText checksumName = info_struct 'musician%a_info' a = <i>
	position = ($<info_struct>.position)
	if ArrayContains array = (<song_struct>.parts_with_mic) contains = <position>
		printf qs(0xd052177c) a = <i>
		setplayerinfo <i> has_mic = 1
	endif
	i = (<i> + 1)
	repeat 4
endscript

script using_singing_guitarist 
	gamemode_gettype
	if (<Type> = career)
		gman_songtool_getcurrentsong
		get_band_configuration song = <current_song>
		if (<Band> != default_band)
			if StructureContains structure = $<Band> vocalist_has_guitar
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript
current_persistent_band = default_band

script change_band_for_song 
	Change \{current_persistent_band = default_band}
	gamemode_gettype
	if (<Type> = career)
		get_band_configuration song = <current_song>
		Change current_persistent_band = <Band>
		if (<Band> != default_band)
			i = 0
			begin
			formatText checksumName = Name 'musician%i' i = (<i> + 1)
			ExtendCrc <Name> '_Info' out = info_struct
			position = ($<info_struct>.position)
			band_character = ($<Band>.<position>)
			Player = ($persistent_band_data [<i>].Player)
			if (<Player> < 0)
				<Player> = (<i> + 1)
			endif
			if (<band_character> != savedbandmember)
				character_id = ($<Band>.<position>)
				switch <position>
					case GUITARIST
					part = guitar
					case BASSIST
					part = bass
					case drummer
					part = drum
					case vocalist
					if StructureContains structure = $<Band> vocalist_has_guitar
						part = vocals_and_guitar
					else
						part = vocals
					endif
				endswitch
				override = {
					character_id = <character_id>
					part = <part>
				}
				persistent_band_create_character {
					async = 1
					index = <i>
					Player = <Player>
					savegame = <savegame>
					character_id = <character_id>
					character_savegame = <savegame>
					override = <override>
					refresh = 1
				}
			else
			endif
			i = (<i> + 1)
			repeat 4
		endif
	endif
	if GotParam \{Band}
		if (<Band> != default_band)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript
random_win_lose_anim_current_song = invalid_song

script pick_random_win_lose_anims 
	printf \{channel = marc
		qs(0xa763eaf2)}
	if ($random_win_lose_anim_current_song = <current_song>)
		return
	endif
	Change random_win_lose_anim_current_song = <current_song>
	selected_win_anims = []
	selected_lose_anims = []
	i = 1
	begin
	formatText checksumName = musician 'musician%a' a = <i>
	formatText checksumName = info_struct 'musician%a_info' a = <i>
	part = ($<info_struct>.part)
	if (<part> = vocals)
		if using_singing_guitarist
			part = guitar
		endif
	endif
	gender = male
	if CompositeObjectExists Name = <musician>
		<musician> :GetSingleTag is_female
		if (<is_female> = 1)
			gender = female
		endif
	endif
	GetArraySize ($win_anims.<gender>.<part>)
	win_array_size = <array_Size>
	GetRandomValue Name = win_index a = 0 b = (<array_Size> -1) integer
	GetArraySize ($lose_anims.<gender>.<part>)
	lose_array_size = <array_Size>
	GetRandomValue Name = lose_index a = 0 b = (<array_Size> -1) integer
	if (<i> > 1)
		begin
		used = FALSE
		j = 0
		begin
		if ((<selected_win_anims> [<j>].gender) = <gender> &&
				(<selected_win_anims> [<j>].part) = <part> &&
				(<selected_win_anims> [<j>].index) = <win_index>)
			used = true
			break
		endif
		j = (<j> + 1)
		repeat (<i> -1)
		if (<used> = FALSE)
			break
		endif
		win_index = (<win_index> + 1)
		if (<win_index> >= <win_array_size>)
			win_index = 0
		endif
		repeat <win_array_size>
		begin
		used = FALSE
		j = 0
		begin
		if ((<selected_lose_anims> [<j>].gender) = <gender> &&
				(<selected_lose_anims> [<j>].part) = <part> &&
				(<selected_lose_anims> [<j>].index) = <lose_index>)
			used = true
			break
		endif
		j = (<j> + 1)
		repeat (<i> -1)
		if (<used> = FALSE)
			break
		endif
		lose_index = (<lose_index> + 1)
		if (<lose_index> >= <lose_array_size>)
			lose_index = 0
		endif
		repeat <lose_array_size>
	endif
	printf channel = marc qs(0x1fc3853f) a = <i> b = ($win_anims.<gender>.<part> [<win_index>])
	printf channel = marc qs(0x52c9fb32) a = <i> b = ($lose_anims.<gender>.<part> [<lose_index>])
	win_anim = ($win_anims.<gender>.<part> [<win_index>])
	lose_anim = ($lose_anims.<gender>.<part> [<lose_index>])
	intro_anim = None
	switch <part>
		case guitar
		intro_anim = guit_greg_notempo_01
		case bass
		intro_anim = guit_greg_notempo_02
		case vocals
		intro_anim = sing_greg_notempo
	endswitch
	object_data = ($persistent_band_data [(<i> -1)])
	printf \{channel = marc
		qs(0xfd5e0346)}
	if characterprofilegetstruct Name = (<object_data>.character_id) savegame = <savegame>
		if GotParam \{profile_struct}
			if StructureContains \{structure = profile_struct
					intro_anims}
				printf \{channel = marc
					qs(0xeab6634f)}
				intro_anims = (<profile_struct>.intro_anims)
				GetArraySize <intro_anims>
				GetRandomValue Name = index a = 0 b = (<array_Size> -1) integer
				intro_anim = (<intro_anims> [<index>])
				printf channel = marc qs(0x461c07c6) a = <intro_anim>
			endif
			if StructureContains \{structure = profile_struct
					win_anims}
				printf \{channel = marc
					qs(0xe8aa602c)}
				win_anims = (<profile_struct>.win_anims)
				GetArraySize <win_anims>
				GetRandomValue Name = index a = 0 b = (<array_Size> -1) integer
				win_anim = (<win_anims> [<index>])
				printf channel = marc qs(0x2acc88a8) a = <win_anim>
			endif
			if StructureContains \{structure = profile_struct
					lose_anims}
				printf \{channel = marc
					qs(0x39f23c9c)}
				lose_anims = (<profile_struct>.lose_anims)
				GetArraySize <lose_anims>
				GetRandomValue Name = index a = 0 b = (<array_Size> -1) integer
				lose_anim = (<lose_anims> [<index>])
				printf channel = marc qs(0x0db012e6) a = <lose_anim>
			endif
			RemoveParameter \{profile_struct}
		endif
	endif
	Change structurename = <info_struct> win_anim_name = <win_anim>
	Change structurename = <info_struct> lose_anim_name = <lose_anim>
	Change structurename = <info_struct> intro_anim_name = <intro_anim>
	printf channel = marc qs(0x07cdc4e9) a = <i> b = <intro_anim> c = <part>
	win_anim_info = {
		gender = <gender>
		part = <part>
		index = <win_index>
	}
	AddArrayElement array = <selected_win_anims> element = <win_anim_info>
	selected_win_anims = <array>
	lose_anim_info = {
		gender = <gender>
		part = <part>
		index = <win_index>
	}
	AddArrayElement array = <selected_lose_anims> element = <lose_anim_info>
	selected_lose_anims = <array>
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_move_and_orient_band_member 
	RequireParams \{[
			Name
		]
		all}
	ExtendCrc <Name> '_Info' out = info_struct
	getstartnodeid member = <Name>
	if GotParam \{waypoint_id}
		if DoesWaypointExist Name = <waypoint_id>
			GetWaypointPos Name = <waypoint_id>
			GetWaypointDir Name = <waypoint_id>
			Change structurename = <info_struct> target_node = <waypoint_id>
			printf qs(0xcc5b9da8) i = <Name> p = <waypoint_id> channel = persistent_band
			<Name> :Obj_SetPosition position = <Pos>
			<Name> :Obj_SetOrientation Dir = <Dir>
			return
		endif
	endif
	printf qs(0xa84ca33d) a = <Name>
endscript

script persistent_band_stop_and_unload_anims 
	drummer_kill_spawnscripts
	band_stop_anims
	band_unload_anim_paks
endscript

script persistent_band_get_index_from_object_id 
	RequireParams \{[
			object
		]
		all}
	get_musician_id Name = <object>
	switch <Name>
		case musician1
		index = 0
		case musician2
		index = 1
		case musician3
		index = 2
		case musician4
		index = 3
		default
		ScriptAssert qs(0xc28a3b17) i = <Name>
	endswitch
	return index = <index>
endscript

script persistent_band_get_index_from_player 
	RequireParams \{[
			Player
		]
		all}
	i = 0
	begin
	if (($persistent_band_data [<i>].Player) = <Player>)
		return index = <i>
	endif
	i = (<i> + 1)
	repeat 4
	ScriptAssert 'player %p is not in persistent_band_data' p = <Player>
endscript

script persistent_band_set_data 
	if NOT GotParam \{index}
		RequireParams \{[
				object
			]
			all}
		persistent_band_get_index_from_object_id object = <object>
	endif
	RequireParams \{[
			index
		]
		all}
	obj_data = ($persistent_band_data [<index>])
	printf 'persistent_band_set_data index=%i' channel = persistent_band i = <index>
	if NOT GotParam \{Player}
		Player = (<obj_data>.Player)
	endif
	if NOT GotParam \{building}
		building = (<obj_data>.building)
	else
		getlogicframe
		printf qs(0x82583708) f = <logicframe> i = <index> b = <building> channel = persistent_band
		if (<building> = 0)
			band_lobby_persistent_band_unmask Player = <Player> time = <unmask_time>
		else
			band_lobby_persistent_band_mask Player = <Player>
		endif
	endif
	if NOT GotParam \{instrument}
		instrument = (<obj_data>.instrument)
	endif
	if NOT GotParam \{microphone}
		microphone = (<obj_data>.microphone)
	endif
	if NOT GotParam \{savegame}
		savegame = (<obj_data>.savegame)
	endif
	if NOT GotParam \{character_id}
		character_id = (<obj_data>.character_id)
	endif
	if NOT GotParam \{stored_character_index}
		stored_character_index = (<obj_data>.stored_character_index)
	endif
	if NOT GotParam \{appearance_checksum}
		if GotParam \{appearance}
			get_appearance_checksum {appearance = <appearance> instrument = <instrument> mic = <microphone>}
			appearance_checksum = <new_appearance_checksum>
			RemoveParameter \{appearance}
		endif
		if NOT GotParam \{appearance_checksum}
			appearance_checksum = (<obj_data>.appearance_checksum)
		endif
	endif
	new_data = {
		object = (<obj_data>.object)
		Player = <Player>
		instrument = <instrument>
		savegame = <savegame>
		character_id = <character_id>
		stored_character_index = <stored_character_index>
		appearance_checksum = <appearance_checksum>
		microphone = <microphone>
		building = <building>
	}
	printf 'object = %o index = %i' channel = persistent_band o = (<obj_data>.object) i = <index>
	SetArrayElement {
		ArrayName = persistent_band_data
		globalarray
		index = <index>
		NewValue = <new_data>
	}
endscript

script persistent_band_refresh_changed_characters \{async = 0}
	printf \{qs(0x7d2af742)
		channel = persistent_band}
	printf \{qs(0xb402ee9a)
		channel = persistent_band}
	printf \{qs(0x7d2af742)
		channel = persistent_band}
	get_player_infos_in_use
	count = 0
	begin
	if (<async> = 1)
		Wait \{1
			gameframe}
	endif
	i = (<player_infos_in_use> [<count>])
	refresh = 0
	getplayerinfo <i> band_member
	printf qs(0x4c4053f5) i = <band_member> p = <i> channel = persistent_band
	persistent_band_get_index_from_object_id object = <band_member>
	getplayerinfo <i> part
	getplayerinfo <i> stored_character_index
	getplayerinfo <i> has_mic
	printf qs(0x97b93495) d = <i> e = <part> donotresolve
	printf qs(0xd1933d85) d = <i> e = <stored_character_index>
	printf qs(0x5ff2f682) d = <i> e = <has_mic>
	band_lobby_get_character_id Player = <i>
	printf qs(0x0ff38d28) i = <character_id> p = <character_savegame> channel = persistent_band
	object_data = ($persistent_band_data [<index>])
	if ((<object_data>.character_id) != <character_id>)
		refresh = 1
		printf \{'++ character_id changed'
			channel = persistent_band}
	endif
	if ((<object_data>.instrument) != <part>)
		refresh = 1
		printf \{'++ instrument changed'
			channel = persistent_band}
	endif
	if ((<object_data>.savegame) != <character_savegame>)
		refresh = 1
		printf \{'++ character_savegame changed'
			channel = persistent_band}
	endif
	if ((<object_data>.microphone) != <has_mic>)
		refresh = 1
		printf \{'++ mic changed'
			channel = persistent_band}
	endif
	if (<async> = 1)
		Wait \{1
			gameframe}
	endif
	if characterprofilegetstruct Name = <character_id> savegame = <character_savegame>
		if GotParam \{profile_struct}
			if StructureContains \{structure = profile_struct
					appearance}
				generatechecksumfromstruct struct = (<profile_struct>.appearance)
			endif
			RemoveParameter \{profile_struct}
		endif
		if GotParam \{structure_checksum}
			structure_checksum = (<structure_checksum> + <part>)
			if (<has_mic> > 0)
				structure_checksum = (<structure_checksum> + mic)
			endif
			if ((<object_data>.appearance_checksum) != <structure_checksum>)
				printf \{'++ appearance checksum changed'
					channel = persistent_band}
				refresh = 1
			endif
		endif
		if ((<object_data>.stored_character_index) != <stored_character_index>)
			printf \{'++ character index changed'
				channel = persistent_band}
			refresh = 1
		endif
		if ((<object_data>.Player) != <i>)
			printf \{qs(0xc58fc6aa)}
			persistent_band_set_data object = <band_member> Player = <i>
		endif
		if NOT CompositeObjectExists Name = <band_member>
			printf \{'++ object doesnt exist'
				channel = persistent_band}
			refresh = 1
		endif
		if ((<object_data>.building) = 1)
			printf \{'++ character is still building'
				channel = persistent_band}
			refresh = 1
		endif
		if (<refresh> = 1)
			Change \{random_win_lose_anim_current_song = None}
			persistent_band_refresh_character index = <index> Player = <i>
		else
			if ($in_band_lobby = 1)
				band_lobby_persistent_band_unmask Player = <i>
			endif
		endif
	else
		ScriptAssert 'Character profile %p not found in savegame %s' p = <character_id> s = <character_savegame>
	endif
	if (<async> = 1)
		Wait \{1
			gameframe}
	endif
	count = (<count> + 1)
	repeat 4
	if ($in_band_lobby = 1)
		if ($cas_loading_setup = lobby)
			set_cas_loading_setup \{setup = lobby}
		endif
	endif
	printf \{qs(0x7d2af742)
		channel = persistent_band}
endscript

script persistent_band_refresh_character 
	printf qs(0x72383ba6) i = <index> channel = persistent_band
	RequireParams \{[
			index
			Player
		]
		all}
	Name = (($persistent_band_data [<index>]).object)
	persistent_band_set_data index = <index> building = 1
	if NOT GotParam \{override}
		getplayerinfo <Player> part
		getplayerinfo <Player> stored_character_index
		getplayerinfo <Player> has_mic
		band_lobby_get_character_id Player = <Player>
		persistent_band_maybe_use_worst_case_character
		if characterprofilegetstruct Name = <character_id> savegame = <character_savegame>
			if NOT StructureContains \{structure = profile_struct
					appearance}
				printstruct <profile_struct>
				characterprofiledump
				ScriptAssert \{'profile_struct is missing appearance'}
			endif
			if NOT cas_queue_add_request {
					appearance = (<profile_struct>.appearance)
					Player = <Player>
					index = <index>
					instrument = <part>
					character_id = <character_id>
					savegame = <character_savegame>
					stored_character_index = <stored_character_index>
					has_mic = <has_mic>
				}
				printf \{'persistent_band call to cas_queue_add_request returned false'
					channel = persistent_band}
				if GotParam \{character_is_finished}
					persistent_band_set_data index = <index> building = 0 unmask_time = 0.0
				endif
			endif
		else
			ScriptAssert 'Character profile %p not found in savegame %s' p = <character_id> s = <savegame>
		endif
	else
		character_id = (<override>.character_id)
		part = (<override>.part)
		if (<part> = vocals_and_guitar)
			has_mic = 1
		else
			getplayerinfo <Player> has_mic
		endif
		if characterprofilegetstruct Name = <character_id> savegame = <savegame>
			if NOT cas_queue_add_request {
					appearance = (<profile_struct>.appearance)
					Player = <Player>
					index = <index>
					instrument = <part>
					character_id = <character_id>
					savegame = <savegame>
					stored_character_index = <stored_character_index>
					has_mic = <has_mic>
				}
				printf \{'persistent_band call to cas_queue_add_request returned false'
					channel = persistent_band}
				if GotParam \{character_is_finished}
					persistent_band_set_data index = <index> building = 0 unmask_time = 0.0
				endif
			endif
		endif
	endif
endscript

script persistent_band_play_all_default_anims 
	i = 0
	begin
	Name = ($persistent_band_data [<i>].object)
	if ObjectExists id = <Name>
		<Name> :persistent_band_play_default_anim
	endif
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_play_default_anim 
	Obj_GetID
	persistent_band_get_index_from_object_id object = <objID>
	instrument = ($persistent_band_data [<index>].instrument)
	if GetSingleTag \{body_checksum}
		if (<body_checksum> = silhouette_m)
			is_special_unlockable_rocker_that_uses_net_silhouette_body = FALSE
			GetSingleTag \{is_special_unlockable_rocker_that_uses_net_silhouette_body}
			if (<is_special_unlockable_rocker_that_uses_net_silhouette_body> = FALSE)
				instrument = None
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
		case None
		anim = guit_greg_notempo_01
	endswitch
	if GotParam \{anim}
		if NOT ($wii_current_mode = bootup)
			Anim_Command \{target = moment_blend
				Command = partialswitch_setstate
				params = {
					On
					BlendDuration = 0.0
				}}
			Anim_Command {
				target = moment_branch
				Command = DegenerateBlend_AddBranch
				params = {
					Tree = $hero_cycle_branch
					BlendDuration = 0
					params = {
						anim_name = <anim>
						timer_id = momenttimer
					}
				}
			}
		endif
	endif
endscript

script persistent_band_print_info \{channel = persistent_band}
	if (<channel> = main)
		RemoveParameter \{channel}
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
	object_data = ($persistent_band_data [<index>])
	count = (<count> + 1)
	repeat 4
endscript

script persistent_band_maybe_use_worst_case_character 
endscript

script persistent_band_force_traditional_band 
	if GotParam \{test}
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
	Player = (<player_infos_in_use> [<i>])
	getplayerinfo <Player> part
	switch <part>
		case guitar
		index = 0
		case vocals
		index = 1
		case bass
		index = 2
		case drum
		index = 3
	endswitch
	if ((<used_parts> [<index>]) = 0)
		SetArrayElement ArrayName = used_parts index = <index> NewValue = 1
		SetArrayElement ArrayName = ok_players index = <i> NewValue = 1
	endif
	i = (<i> + 1)
	repeat 4
	i = 0
	begin
	if ((<ok_players> [<i>]) = 0)
		z = 0
		begin
		if ((<used_parts> [<z>]) = 0)
			SetArrayElement ArrayName = used_parts index = <z> NewValue = 1
			break
		endif
		z = (<z> + 1)
		repeat 4
		Player = (<player_infos_in_use> [<i>])
		setplayerinfo <Player> part = (<part_checksums> [<z>])
	endif
	i = (<i> + 1)
	repeat 4
	persistent_band_refresh_changed_characters
	if GotParam \{test}
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

script persistent_band_destroy_other_characters 
	RequireParams \{[
			Player
		]
		all}
	i = 0
	begin
	this_player = (($persistent_band_data [<i>]).Player)
	Name = (($persistent_band_data [<i>]).object)
	if (<this_player> != <Player>)
		cas_queue_kill_player Player = <this_player>
		destroy_band_member Name = <Name>
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
	endswitch
	i = (<i> + 1)
	repeat 4
	if (<obj_1> > 1 || <obj_2> > 1 || <obj_3> > 1 || <obj_4> > 1)
		persistent_band_print_info \{channel = main}
		ScriptAssert \{'Two or more players have the same object id'}
	endif
endscript

script persistent_band_pause_all_characters 
	i = 0
	begin
	formatText checksumName = Name 'musician%i' i = (<i> + 1)
	if ObjectExists id = <Name>
		if NOT GotParam \{Unpause}
			<Name> :Pause
		else
			<Name> :Unpause
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
	if (<Player> > 0)
		SetArrayElement ArrayName = player_infos_in_use index = <i> NewValue = <Player>
		getnextplayer on_screen Player = <Player>
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
		SetArrayElement ArrayName = player_infos_in_use index = <i> NewValue = <non_player>
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
		unused_musician = None
	endif
	return unused_musician = <unused_musician>
endscript

script persistent_band_force_create_and_wait 
	push_unsafe_for_shutdown \{reason = persistent_band_force_create_and_wait}
	cascancelloading
	cas_destroy_all_characters
	persistent_band_create_band \{refresh = 1}
	if GotParam \{no_block}
		cas_queue_wait
	else
		cas_queue_block
	endif
	pop_unsafe_for_shutdown \{reason = persistent_band_force_create_and_wait}
endscript

script persistent_band_has_four_musicians 
	if NOT ObjectExists \{id = musician1}
		return \{FALSE}
	elseif NOT ObjectExists \{id = musician2}
		return \{FALSE}
	elseif NOT ObjectExists \{id = musician3}
		return \{FALSE}
	elseif NOT ObjectExists \{id = musician4}
		return \{FALSE}
	endif
	return \{true}
endscript

script persistent_band_finished_building 
	i = 0
	begin
	if (($persistent_band_data [<i>].building) = 1)
		return \{FALSE}
	endif
	i = (<i> + 1)
	repeat 4
	return \{true}
endscript
