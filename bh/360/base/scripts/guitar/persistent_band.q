
script get_persistent_band_savegame 
	controller = ($primary_controller)
	if ($primary_controller = -1)
		controller = 0
	endif
	get_savegame_from_controller controller = <controller>
	return savegame = <savegame>
endscript

script persistent_band_create_band 
	set_parts_with_mic
	get_persistent_band_savegame
	CasCancelLoading
	CasBlockForComposite
	CasBlockForLoading
	if GotParam \{startup}
		persistent_band_force_traditional_band \{no_refresh}
	endif
	i = 0
	begin
	player = ($persistent_band_data [<i>].player)
	if (<player> < 0)
		<player> = (<i> + 1)
	endif
	GetPlayerInfo <player> part
	GetPlayerInfo <player> has_mic
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
	repeat 4
	Change \{persistent_band_initialized = 1}
endscript

script persistent_band_create_character \{async = 0}
	FormatText checksumname = name 'musician%i' i = (<index> + 1)
	FormatText checksumname = heap 'heap_musician%i' i = (<index> + 1)
	if NOT GotParam \{refresh}
		if CompositeObjectExists name = <name>
			destroy_band_member name = <name>
		endif
	endif
	if NOT GotParam \{character_id}
		RequireParams \{[
				savegame
				index
			]
			all}
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
	if CharacterProfileGetStruct name = <character_id> savegame = <character_savegame>
		if GotParam \{startup}
			SetPlayerInfo <player> band_member = <name>
			SetPlayerInfo <player> character_id = <character_id>
			SetPlayerInfo <player> character_savegame = <character_savegame>
			SetPlayerInfo <player> stored_character_index = <index>
			if (<player> = 1)
				persistent_band_get_correct_vocals_character startup = 1 player = <player>
			endif
		endif
		if GotParam \{refresh}
			persistent_band_refresh_character {
				index = <index>
				player = <player>
				override = <override>
				savegame = <character_savegame>
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
		<name> :Pause
		SetArrayElement arrayName = cas_queue_player_info GlobalArray index = <index> newValue = {
			player = <player>
			Object = <name>
		}
	else
		ScriptAssert 'Character profile %p not found in savegame %s' p = <character_id> s = <character_savegame>
	endif
endscript

script persistent_band_place_primary_character_on_part 
	RequireParams \{[
			player
			savegame
		]
		all}
	if NOT CD
		if GlobalExists \{type = array
				name = g_debug_controller_array}
			return
		endif
		if ($allow_controller_for_all_instruments = 1)
			return
		endif
	endif
	if IsXenonOrWinDX
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
		repeat <array_size>
	endif
	if (<controller> >= 0)
		if isguitarcontroller controller = <controller>
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
			my_part = Drum
		elseif is_regular_controller controller = <controller>
			my_part = vocals
		else
			my_part = vocals
		endif
		GetPlayerInfo <player> part out = this_part
		if (<this_part> != <my_part>)
			next_player = (<player> + 1)
			begin
			if (<next_player> > 4)
				break
			endif
			GetPlayerInfo <player> part out = this_part
			GetPlayerInfo <next_player> part out = next_part
			printf 'persistent_band_place_primary_character_on_part: switched %a and %b' a = <this_part> b = <next_part>
			SetPlayerInfo <player> part = <next_part>
			SetPlayerInfo <next_player> part = <this_part>
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
			player
			savegame
			index
		]
		all}
	get_saved_band_member savegame = <savegame> index = <index>
	if (<user_changed> = 1)
		return
	endif
	CharacterProfileGetStruct name = <character_id> savegame = <character_savegame>
	if get_is_female_from_appearance appearance = (<profile_struct>.appearance)
		if (<is_female> = 1)
			next_index = (<index> + 1)
			next_player = (<player> + 1)
			begin
			if (<next_index> > 3 || <next_player> > 4)
				break
			endif
			get_saved_band_member savegame = <savegame> index = <next_index>
			if (<user_changed> = 0)
				CharacterProfileGetStruct name = <character_id> savegame = <character_savegame>
				if get_is_female_from_appearance appearance = (<profile_struct>.appearance)
					if (<is_female> = 0)
						printf 'persistent_band_prevent_female_vocalist: switched %a' a = <part>
						GetPlayerInfo <next_player> part
						SetPlayerInfo <player> part = <part>
						printf '... for %a' a = <part>
						SetPlayerInfo <next_player> part = vocals
						break
					endif
				endif
			endif
			next_index = (<next_index> + 1)
			next_player = (<next_player> + 1)
			repeat
		endif
	endif
endscript

script persistent_band_setup_new_character 
	RequireParams \{[
			name
			instrument
			player
		]
		all}
	if (<instrument> = None)
		return
	endif
	if NOT ObjectExists id = <name>
		printf qs(0xadf70858) i = <name> channel = persistent_band
		return
	endif
	if ($is_in_cas = 0)
		<name> :persistent_band_play_default_anim
	endif
	if get_submenu_index_from_player player = <player>
		band_lobby_play_viewport_camera {
			viewport_index = <submenu_index>
			lock_to_target = <name>
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
		alias = Guitarist
		case vocals
		case vocals_and_guitar
		alias = Vocalist
		case Drum
		alias = Drummer
		case bass
		alias = Bassist
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
	player = (<player_infos_in_use> [<i>])
	persistent_band_get_index_from_player player = <player>
	part = ($persistent_band_data [<index>].instrument)
	switch <part>
		case guitar
		guitarists = (<guitarists> + 1)
		case vocals
		vocalists = (<vocalists> + 1)
		case bass
		bassists = (<bassists> + 1)
		case Drum
		drummers = (<drummers> + 1)
	endswitch
	i = (<i> + 1)
	repeat 4
	if (<guitarists> = 0)
		if NOT ObjectExists \{id = Guitarist}
			return \{alias = Guitarist}
		endif
	endif
	if (<bassists> = 0)
		if NOT ObjectExists \{id = Bassist}
			return \{alias = Bassist}
		endif
	endif
	if (<vocalists> = 0)
		if NOT ObjectExists \{id = Vocalist}
			return \{alias = Vocalist}
		endif
	endif
	if (<drummers> = 0)
		if NOT ObjectExists \{id = Drummer}
			return \{alias = Drummer}
		endif
	endif
	persistent_band_print_info
	ScriptAssert \{qs(0xd329ce2d)}
endscript

script persistent_band_prepare_for_song \{async = 0}
	printf \{'persistent_band_prepare_for_song'
		channel = persistent_band}
	killspawnedscript \{name = persistent_band_cancel_lobby}
	GMan_SongTool_GetCurrentSong
	get_persistent_band_savegame
	set_parts_with_mic <...>
	should_use_alt_positions
	persistent_band_unique_musician_check
	celeb_band = 0
	Change \{current_band = default_band}
	if NOT GotParam \{startup}
		if NOT change_band_for_song <...>
			GameMode_GetType
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
	if NOT persistent_band_finished_building
		persistent_band_print_info \{channel = main}
	endif
	begin
	if persistent_band_finished_building
		break
	endif
	wait \{1
		gameframe}
	repeat
	printf \{'characters are ready'
		channel = persistent_band}
	if NOT persistent_band_has_four_musicians
		persistent_band_print_info \{channel = main}
		ScriptAssert \{qs(0xd93a2b88)}
	endif
	persistent_band_update_all_aliases
	pick_random_win_lose_anims <...>
	BandManager_AirGuitarCheat
	Band_ClearAnimTempo
	prepare_for_pending_animpaks
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	i = 0
	begin
	FormatText checksumname = name 'musician%i' i = (<i> + 1)
	part = ($persistent_band_data [<i>].instrument)
	persistent_band_move_and_orient_band_member name = <name>
	position_part = <part>
	if ($current_band != default_band)
		persistent_band_get_celeb_part_from_character_id {
			character_id = ($persistent_band_data [<i>].character_id)
		}
		position_part = <celeb_part>
	endif
	if ($Cheat_AirInstruments = 0)
		if (<position_part> != vocals)
			<name> :hide_mic
		else
			<name> :show_mic
		endif
	endif
	<stored_character_index> = ($persistent_band_data [<i>].stored_character_index)
	get_saved_band_member savegame = <savegame> index = <stored_character_index>
	band_load_single_anim_pak {
		character_id = <character_id>
		part = <part>
		name = <name>
		savegame = <character_savegame>
		async = <async>
		player = <player>
		song = <current_song>
		slot_index = <iSlotIndex>
	}
	<name> :UnPause
	band_member_start_anims {
		name = <name>
		instrument = <part>
		loading_into_song = <current_song>
		async = <async>
	}
	<name> :Anim_Command {
		target = moment_blend
		Command = PartialSwitch_SetState
		params = {
			off
			BlendDuration = 0.0
		}
	}
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	i = (<i> + 1)
	repeat 4
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
	printf \{'characters are ready'
		channel = persistent_band}
	if NOT persistent_band_has_four_musicians
		return
	endif
	persistent_band_update_all_aliases
	i = 0
	begin
	FormatText checksumname = name 'musician%i' i = (<i> + 1)
	if ObjectExists id = <name>
		persistent_band_move_and_orient_band_member name = <name>
	else
		return
	endif
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_update_all_aliases 
	RemoveAlias \{Guitarist}
	RemoveAlias \{Bassist}
	RemoveAlias \{Vocalist}
	RemoveAlias \{Drummer}
	i = 0
	begin
	FormatText checksumname = name 'musician%i' i = (<i> + 1)
	part = ($persistent_band_data [<i>].instrument)
	if ($current_band != default_band)
		persistent_band_get_celeb_part_from_character_id {
			character_id = ($persistent_band_data [<i>].character_id)
		}
		part = <celeb_part>
	endif
	persistent_band_update_alias name = <name> part = <part>
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_update_alias 
	RequireParams \{[
			name
			part
		]
		all}
	persistent_band_get_alias_from_part part = <part>
	ExtendCrc <name> '_Info' out = info_struct
	Change structurename = <info_struct> position = <alias>
	if ObjectExists id = <name>
		AssignAlias id = <name> alias = <alias>
	endif
	cas_get_lightgroup position = <alias>
	if GotParam \{LightGroup}
		SetLightGroups id = <name> LightGroup = <LightGroup>
	endif
endscript

script persistent_band_get_celeb_part_from_character_id 
	RequireParams \{[
			character_id
		]
		all}
	Band = ($current_band)
	if (($<Band>.Guitarist) = <character_id>)
		part = guitar
	elseif (($<Band>.Bassist) = <character_id>)
		part = bass
	elseif (($<Band>.Vocalist) = <character_id>)
		part = vocals
	elseif (($<Band>.Drummer) = <character_id>)
		part = Drum
	else
		return
	endif
	return celeb_part = <part>
endscript

script reset_parts_with_mic 
	return
	i = 1
	begin
	SetPlayerInfo <i> has_mic = 0
	i = (<i> + 1)
	repeat 4
endscript

script set_parts_with_mic 
	printf \{qs(0x8a960c6c)}
	i = 1
	begin
	SetPlayerInfo <i> has_mic = 1
	i = (<i> + 1)
	repeat 8
	return
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
	GetPlayerInfo <i> part
	switch <part>
		case guitar
		position = Guitarist
		case bass
		position = Bassist
		case Drum
		position = Drummer
		case vocals
		position = Vocalist
	endswitch
	if ArrayContains array = (<song_struct>.parts_with_mic) contains = <position>
		printf qs(0xd052177c) a = <i>
		SetPlayerInfo <i> has_mic = 1
	endif
	i = (<i> + 1)
	repeat 4
endscript

script using_singing_guitarist 
	GameMode_GetType
	if (<type> = career)
		GMan_SongTool_GetCurrentSong
		get_band_configuration song = <current_song>
		if (<Band> != default_band)
			if StructureContains structure = $<Band> vocalist_has_guitar
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script ShouldUseSongPerformance 
	current_zone = (($LevelZones.$current_level).zone)
	switch <song>
		case DontSpeak
		if (<current_zone> != Z_AwardShow)
			return \{false}
		endif
		case JustaGirl
		if (<current_zone> != Z_Paris)
			return \{false}
		endif
		case LoveStory
		if (<current_zone> != Z_CentralPark)
			return \{false}
		endif
		case PictureToBurn
		case YouBelongWithMe
		if (<current_zone> != Z_Gorge)
			return \{false}
		endif
		case SheWillBeLoved
		if (<current_zone> != Z_Tokyo)
			return \{false}
		endif
	endswitch
	return \{true}
endscript
current_band = default_band

script change_band_for_song 
	Change \{current_band = default_band}
	<song_is_downloaded> = 0
	if StructureContains structure = $download_songlist_props <current_song>
		<song_is_downloaded> = 1
	endif
	GameMode_GetType
	if (<type> = career && <song_is_downloaded> = 0)
		get_band_configuration song = <current_song>
		if NOT ShouldUseSongPerformance song = <current_song>
			Band = default_band
		endif
		Change current_band = <Band>
		if (<Band> != default_band)
			i = 0
			begin
			FormatText checksumname = name 'musician%i' i = (<i> + 1)
			ExtendCrc <name> '_Info' out = info_struct
			position = ($<info_struct>.position)
			band_character = ($<Band>.<position>)
			player = ($persistent_band_data [<i>].player)
			if (<player> < 0)
				<player> = (<i> + 1)
			endif
			if (<band_character> != SavedBandMember)
				character_id = ($<Band>.<position>)
				switch <position>
					case Guitarist
					part = guitar
					case Bassist
					part = bass
					case Drummer
					part = Drum
					case Vocalist
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
					player = <player>
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
	if (($current_band) != default_band)
		return \{true}
	endif
	return \{false}
endscript

script persistent_band_get_correct_vocals_character 
	RequireParams \{[
			player
		]
		all}
	printf qs(0x9312d242) p = <player> channel = persistent_band
	if GotParam \{reset_vocalist}
		return \{false}
	endif
	GMan_SongTool_GetCurrentSong
	if (<current_song> = null || <current_song> = None)
		return \{false}
	endif
	if NOT GotParam \{startup}
		if PlayerInfoEquals <player> is_local_client = 0
			return \{false}
		endif
		GetPlayerInfo <player> band_member
		persistent_band_get_index_from_object_id Object = <band_member>
		GameMode_GetType
		if (<type> = freeplay || $in_sing_a_long = true)
			name = ($persistent_band_data [<index>].Object)
			ExtendCrc <name> '_Info' out = info_struct
			position = ($<info_struct>.position)
			if (<position> = Vocalist)
				proceed = 1
			endif
		else
			GetPlayerInfo <player> part
			if (<part> = vocals)
				proceed = 1
			endif
		endif
	else
		proceed = 1
	endif
	if GotParam \{proceed}
		get_song_struct song = <current_song>
		if NOT StructureContains structure = <song_struct> singer
			return \{false}
		endif
		gender = (<song_struct>.singer)
		RemoveParameter \{song_struct}
		if NOT GotParam \{startup}
			if NOT (<type> = freeplay)
				GetPlayerInfo <player> in_game
				if (<in_game> = 1 && $in_sing_a_long = false)
					return \{false}
				endif
			endif
		endif
		get_savegame_from_player player = <player>
		GetPlayerInfo <player> character_id
		GetPlayerInfo <player> character_savegame
		if (<character_savegame> < 0)
			get_savegame_from_controller controller = ($primary_controller)
			SetPlayerInfo <player> character_savegame = <savegame>
			GetPlayerInfo <player> character_savegame
		endif
		if get_is_female_from_character_id character_id = <character_id> savegame = <character_savegame>
			if (<gender> = male && <is_female> = 1)
				random_character = male
			elseif (<gender> = female && <is_female> = 0)
				random_character = female
			endif
			RemoveParameter \{is_female}
		endif
		if GotParam \{random_character}
			if GotParam \{index}
				if get_is_female_from_character_id character_id = ($persistent_band_data [<index>].character_id) savegame = ($persistent_band_data [<index>].savegame)
					if (<gender> = male && <is_female> = 0)
						character_id = ($persistent_band_data [<index>].character_id)
						character_savegame = ($persistent_band_data [<index>].savegame)
						RemoveParameter \{random_character}
					elseif (<gender> = female && <is_female> = 1)
						character_id = ($persistent_band_data [<index>].character_id)
						character_savegame = ($persistent_band_data [<index>].savegame)
						RemoveParameter \{random_character}
					endif
				endif
			endif
		endif
		if GotParam \{random_character}
			cas_get_random_character savegame = <character_savegame> part = vocals categories = [ghrockers presetcars cars] <random_character>
			RemoveParameter \{random_character}
		endif
		if GotParam \{character_id}
			part = vocals
			override = {character_id = <character_id> part = <part> savegame = <character_savegame>}
			if NOT GotParam \{startup}
				if (<type> = freeplay || $in_sing_a_long = true)
					object_data = ($persistent_band_data [<index>])
					if NOT ((<object_data>.character_id) = <character_id> && (<object_data>.instrument) = <part> && (<object_data>.savegame) = <character_savegame>)
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
			return true {character_id = <character_id> part = <part> character_savegame = <character_savegame> override = <override>}
		endif
	endif
	return \{false}
endscript

script pick_random_win_lose_anims 
	printf \{channel = marc
		qs(0xa763eaf2)}
	if ($random_win_lose_anim_current_song = <current_song>)
		return
	endif
	Change random_win_lose_anim_current_song = <current_song>
	get_persistent_band_savegame
	selected_win_anims = []
	selected_lose_anims = []
	i = 1
	begin
	FormatText checksumname = musician 'musician%a' a = <i>
	FormatText checksumname = info_struct 'musician%a_info' a = <i>
	part = ($<info_struct>.part)
	if (<part> = vocals)
		if using_singing_guitarist
			part = guitar
		endif
	endif
	gender = male
	if CompositeObjectExists name = <musician>
		<musician> :GetSingleTag is_female
		if (<is_female> = 1)
			gender = female
		endif
	endif
	GetArraySize ($win_anims.<gender>.<part>)
	win_array_size = <array_size>
	GetRandomValue name = win_index a = 0 b = (<array_size> -1) integer
	GetArraySize ($lose_anims.<gender>.<part>)
	lose_array_size = <array_size>
	GetRandomValue name = lose_index a = 0 b = (<array_size> -1) integer
	if (<i> > 1)
		begin
		used = false
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
		if ((<selected_lose_anims> [<j>].gender) = <gender> &&
				(<selected_lose_anims> [<j>].part) = <part> &&
				(<selected_lose_anims> [<j>].index) = <lose_index>)
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
	printf channel = marc qs(0x1fc3853f) a = <i> b = ($win_anims.<gender>.<part> [<win_index>])
	printf channel = marc qs(0x52c9fb32) a = <i> b = ($lose_anims.<gender>.<part> [<lose_index>])
	win_anim = ($win_anims.<gender>.<part> [<win_index>])
	lose_anim = ($lose_anims.<gender>.<part> [<lose_index>])
	intro_anim = None
	switch <part>
		case guitar
		intro_anim = Guit_Greg_NoTempo_01
		case bass
		intro_anim = Guit_Greg_NoTempo_02
		case vocals
		intro_anim = Sing_Greg_NoTempo
	endswitch
	object_data = ($persistent_band_data [(<i> -1)])
	printf \{channel = marc
		qs(0xfd5e0346)}
	if CharacterProfileGetStruct name = (<object_data>.character_id) savegame = <savegame>
		if GotParam \{profile_struct}
			if StructureContains \{structure = profile_struct
					intro_anims}
				printf \{channel = marc
					qs(0xeab6634f)}
				intro_anims = (<profile_struct>.intro_anims)
				GetArraySize <intro_anims>
				GetRandomValue name = index a = 0 b = (<array_size> -1) integer
				intro_anim = (<intro_anims> [<index>])
				printf channel = marc qs(0x461c07c6) a = <intro_anim>
			endif
			if StructureContains \{structure = profile_struct
					win_anims}
				printf \{channel = marc
					qs(0xe8aa602c)}
				win_anims = (<profile_struct>.win_anims)
				GetArraySize <win_anims>
				GetRandomValue name = index a = 0 b = (<array_size> -1) integer
				win_anim = (<win_anims> [<index>])
				printf channel = marc qs(0x2acc88a8) a = <win_anim>
			endif
			if StructureContains \{structure = profile_struct
					lose_anims}
				printf \{channel = marc
					qs(0x39f23c9c)}
				lose_anims = (<profile_struct>.lose_anims)
				GetArraySize <lose_anims>
				GetRandomValue name = index a = 0 b = (<array_size> -1) integer
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
			name
		]
		all}
	ExtendCrc <name> '_Info' out = info_struct
	get_start_node_id member = <name>
	if GotParam \{waypoint_id}
		if DoesWayPointExist name = <waypoint_id>
			GetWaypointPos name = <waypoint_id>
			GetWaypointDir name = <waypoint_id>
			Change structurename = <info_struct> target_node = <waypoint_id>
			printf qs(0xcc5b9da8) i = <name> p = <waypoint_id> channel = persistent_band
			<name> :Obj_SetPosition position = <Pos>
			<name> :Obj_SetOrientation Dir = <Dir>
			return
		endif
	endif
	printf qs(0xa84ca33d) a = <name>
endscript

script persistent_band_stop_and_unload_anims 
	Drummer_Kill_Spawnscripts
	band_stop_anims
	band_unload_anim_paks
endscript

script persistent_band_get_index_from_object_id 
	RequireParams \{[
			Object
		]
		all}
	get_musician_id name = <Object>
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
		ScriptAssert qs(0xc28a3b17) i = <name>
	endswitch
	return index = <index>
endscript

script persistent_band_get_index_from_player 
	RequireParams \{[
			player
		]
		all}
	i = 0
	begin
	if (($persistent_band_data [<i>].player) = <player>)
		return index = <i>
	endif
	i = (<i> + 1)
	repeat 4
	ScriptAssert 'player %p is not in persistent_band_data' p = <player>
endscript

script persistent_band_set_data 
	if NOT GotParam \{index}
		RequireParams \{[
				Object
			]
			all}
		persistent_band_get_index_from_object_id Object = <Object>
	endif
	RequireParams \{[
			index
		]
		all}
	obj_data = ($persistent_band_data [<index>])
	printf 'persistent_band_set_data index=%i' channel = persistent_band i = <index>
	if NOT GotParam \{player}
		player = (<obj_data>.player)
	endif
	if NOT GotParam \{building}
		building = (<obj_data>.building)
	else
		GetLogicFrame
		printf qs(0x82583708) f = <LogicFrame> i = <index> b = <building> channel = persistent_band
		if (<building> = 0)
			band_lobby_persistent_band_unmask player = <player> time = <unmask_time>
		else
			band_lobby_persistent_band_mask player = <player>
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
		Object = (<obj_data>.Object)
		player = <player>
		instrument = <instrument>
		savegame = <savegame>
		character_id = <character_id>
		stored_character_index = <stored_character_index>
		appearance_checksum = <appearance_checksum>
		microphone = <microphone>
		building = <building>
	}
	if GotParam \{building}
		if (<building> = 0)
			if ($in_band_lobby = 1)
				if (<instrument> = vocals)
					(<obj_data>.Object) :show_mic
				else
					(<obj_data>.Object) :hide_mic
				endif
			endif
		endif
	endif
	printf 'object = %o index = %i' channel = persistent_band o = (<obj_data>.Object) i = <index>
	SetArrayElement {
		arrayName = persistent_band_data
		GlobalArray
		index = <index>
		newValue = <new_data>
	}
endscript

script persistent_band_refresh_changed_characters \{async = 0}
	printf \{qs(0x7d2af742)
		channel = persistent_band}
	printf \{qs(0xb402ee9a)
		channel = persistent_band}
	printf \{qs(0x7d2af742)
		channel = persistent_band}
	if ($persistent_band_initialized = 0)
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
	endif
	printf \{qs(0x7d2af742)
		channel = persistent_band}
endscript

script persistent_band_refresh_changed_character 
	RequireParams \{[
			player
			async
		]
		all}
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	i = <player>
	refresh = 0
	GetPlayerInfo <i> band_member
	printf qs(0x4c4053f5) i = <band_member> p = <i> channel = persistent_band
	persistent_band_get_index_from_object_id Object = <band_member>
	GetPlayerInfo <i> part
	GetPlayerInfo <i> stored_character_index
	GetPlayerInfo <i> has_mic
	band_lobby_get_character_id player = <i>
	persistent_band_get_correct_vocals_character player = <i> reset_vocalist = <reset_vocalist>
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
		wait \{1
			gameframe}
	endif
	if CharacterProfileGetStruct name = <character_id> savegame = <character_savegame>
		if GotParam \{profile_struct}
			if StructureContains \{structure = profile_struct
					appearance}
				GenerateChecksumFromStruct struct = (<profile_struct>.appearance)
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
		if ((<object_data>.player) != <i>)
			persistent_band_set_data Object = <band_member> player = <i>
		endif
		if NOT CompositeObjectExists name = <band_member>
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
			printstruct <...> channel = persistent_band
			persistent_band_refresh_character override = <override> index = <index> player = <i>
		else
			if ($in_band_lobby = 1)
				band_lobby_persistent_band_unmask player = <i>
				if (<part> = vocals)
					(<object_data>.Object) :show_mic
				else
					(<object_data>.Object) :hide_mic
				endif
			endif
		endif
		if (<async> = 1)
			wait \{1
				gameframe}
		endif
	else
		ScriptAssert 'Character profile %p not found in savegame %s' p = <character_id> s = <character_savegame>
	endif
endscript

script persistent_band_refresh_character 
	printf qs(0x72383ba6) i = <index> channel = persistent_band
	RequireParams \{[
			index
			player
		]
		all}
	name = (($persistent_band_data [<index>]).Object)
	persistent_band_set_data index = <index> building = 1
	if NOT GotParam \{override}
		GetPlayerInfo <player> part
		GetPlayerInfo <player> stored_character_index
		GetPlayerInfo <player> has_mic
		band_lobby_get_character_id player = <player>
		persistent_band_maybe_use_worst_case_character
		printstruct <...>
		if CharacterProfileGetStruct name = <character_id> savegame = <character_savegame>
			if NOT StructureContains \{structure = profile_struct
					appearance}
				printstruct <profile_struct>
				CharacterProfileDump
				ScriptAssert \{'profile_struct is missing appearance'}
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
		if StructureContains structure = <override> savegame
			savegame = (<override>.savegame)
		endif
		if (<part> = vocals_and_guitar)
			has_mic = 1
		else
			GetPlayerInfo <player> has_mic
		endif
		if CharacterProfileGetStruct name = <character_id> savegame = <savegame>
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
	name = ($persistent_band_data [<i>].Object)
	if ObjectExists id = <name>
		<name> :persistent_band_play_default_anim
	endif
	i = (<i> + 1)
	repeat 4
endscript

script persistent_band_play_default_anim 
	Obj_GetID
	persistent_band_get_index_from_object_id Object = <objID>
	instrument = ($persistent_band_data [<index>].instrument)
	if GetSingleTag \{body_checksum}
		if (<body_checksum> = Silhouette_M)
			is_special_unlockable_rocker_that_uses_net_silhouette_body = false
			GetSingleTag \{is_special_unlockable_rocker_that_uses_net_silhouette_body}
			if (<is_special_unlockable_rocker_that_uses_net_silhouette_body> = false)
				if (<instrument> != Drum)
					instrument = None
				endif
			endif
		endif
	endif
	switch <instrument>
		case guitar
		anim = Guit_Greg_NoTempo_01
		case bass
		anim = Guit_Greg_NoTempo_02
		case vocals
		anim = Sing_Greg_NoTempo
		case Drum
		anim = DrumDroid_Waiting_InOut_Full
		case None
		anim = Guit_Greg_NoTempo_01
	endswitch
	if GotParam \{anim}
		Anim_Command \{target = moment_blend
			Command = PartialSwitch_SetState
			params = {
				on
				BlendDuration = 0.0
			}}
		start_time = 0
		switch <objID>
			case musician1
			start_time = 0
			case musician2
			start_time = 0.25
			case musician3
			start_time = 0.5
			case musician4
			start_time = 0.75
		endswitch
		Anim_Command {
			target = moment_branch
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_cycle_branch
				BlendDuration = 0
				params = {
					anim_name = <anim>
					timer_id = momenttimer
					start_time = <start_time>
				}
			}
		}
	endif
	Band_SetIKChain name = <objID> Chain = slave
	<objID> :Ragdoll_MarkForReset
endscript

script persistent_band_print_info \{channel = persistent_band}
	if (<channel> = main)
		RemoveParameter \{channel}
	endif
	get_player_infos_in_use
	count = 0
	begin
	i = (<player_infos_in_use> [<count>])
	GetPlayerInfo <i> band_member
	printf qs(0x65ddfbeb) i = <band_member> channel = <channel>
	persistent_band_get_index_from_object_id Object = <band_member>
	GetPlayerInfo <i> character_id
	GetPlayerInfo <i> part
	GetPlayerInfo <i> character_savegame
	GetPlayerInfo <i> stored_character_index
	GetPlayerInfo <i> has_mic
	object_data = ($persistent_band_data [<index>])
	printstruct <...> channel = <channel>
	count = (<count> + 1)
	repeat 4
endscript

script persistent_band_maybe_use_worst_case_character 
	if NOT ($use_worst_band = 0)
		if ($use_worst_band = male)
			return \{character_id = WorstMaleCharacter}
		else
			return \{character_id = WorstFemaleCharacter}
		endif
	endif
endscript

script persistent_band_force_traditional_band 
	if GotParam \{test}
		SetPlayerInfo \{1
			part = bass}
		SetPlayerInfo \{2
			part = Drum}
		SetPlayerInfo \{3
			part = Drum}
		SetPlayerInfo \{4
			part = bass}
	endif
	used_parts = [0 0 0 0]
	ok_players = [0 0 0 0]
	part_checksums = [guitar vocals bass Drum]
	get_player_infos_in_use
	i = 0
	begin
	player = (<player_infos_in_use> [<i>])
	GetPlayerInfo <player> part
	switch <part>
		case guitar
		index = 0
		case vocals
		index = 1
		case bass
		index = 2
		case Drum
		index = 3
	endswitch
	if ((<used_parts> [<index>]) = 0)
		SetArrayElement arrayName = used_parts index = <index> newValue = 1
		SetArrayElement arrayName = ok_players index = <i> newValue = 1
	endif
	i = (<i> + 1)
	repeat 4
	i = 0
	begin
	if ((<ok_players> [<i>]) = 0)
		z = 0
		begin
		if ((<used_parts> [<z>]) = 0)
			SetArrayElement arrayName = used_parts index = <z> newValue = 1
			break
		endif
		z = (<z> + 1)
		repeat 4
		player = (<player_infos_in_use> [<i>])
		SetPlayerInfo <player> part = (<part_checksums> [<z>])
	endif
	i = (<i> + 1)
	repeat 4
	if NOT GotParam \{no_refresh}
		persistent_band_refresh_changed_characters
	endif
	if GotParam \{test}
		GetPlayerInfo \{1
			part
			out = part1}
		GetPlayerInfo \{2
			part
			out = part2}
		GetPlayerInfo \{3
			part
			out = part3}
		GetPlayerInfo \{4
			part
			out = part4}
		printstruct <...> channel = persistent_band
	endif
endscript

script persistent_band_destroy_other_characters 
	RequireParams \{[
			player
		]
		all}
	i = 0
	begin
	this_player = (($persistent_band_data [<i>]).player)
	name = (($persistent_band_data [<i>]).Object)
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
	GetPlayerInfo (<player_infos_in_use> [<i>]) band_member out = obj_id
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
		persistent_band_force_unique_musicians
	endif
endscript

script persistent_band_force_unique_musicians 
	if GotParam \{test}
		SetPlayerInfo \{1
			band_member = musician3}
		SetPlayerInfo \{2
			band_member = musician3}
		SetPlayerInfo \{3
			band_member = musician3}
		SetPlayerInfo \{4
			band_member = musician3}
	endif
	used_musicians = [0 0 0 0]
	ok_players = [0 0 0 0]
	musician_checksums = [musician1 musician2 musician3 musician4]
	get_player_infos_in_use
	i = 0
	begin
	player = (<player_infos_in_use> [<i>])
	GetPlayerInfo <player> band_member
	switch <band_member>
		case musician1
		index = 0
		case musician2
		index = 1
		case musician3
		index = 2
		case musician4
		index = 3
	endswitch
	if ((<used_musicians> [<index>]) = 0)
		SetArrayElement arrayName = used_musicians index = <index> newValue = 1
		SetArrayElement arrayName = ok_players index = <i> newValue = 1
	endif
	i = (<i> + 1)
	repeat 4
	i = 0
	begin
	if ((<ok_players> [<i>]) = 0)
		z = 0
		begin
		if ((<used_musicians> [<z>]) = 0)
			SetArrayElement arrayName = used_musicians index = <z> newValue = 1
			break
		endif
		z = (<z> + 1)
		repeat 4
		player = (<player_infos_in_use> [<i>])
		SetPlayerInfo <player> band_member = (<musician_checksums> [<z>])
	endif
	i = (<i> + 1)
	repeat 4
	if GotParam \{test}
		GetPlayerInfo \{1
			band_member
			out = band_member1}
		GetPlayerInfo \{2
			band_member
			out = band_member2}
		GetPlayerInfo \{3
			band_member
			out = band_member3}
		GetPlayerInfo \{4
			band_member
			out = band_member4}
		printstruct <...> channel = persistent_band
	endif
endscript

script persistent_band_pause_all_characters 
	i = 0
	begin
	FormatText checksumname = name 'musician%i' i = (<i> + 1)
	if ObjectExists id = <name>
		if NOT GotParam \{UnPause}
			<name> :Pause
		else
			<name> :UnPause
		endif
	endif
	i = (<i> + 1)
	repeat 4
endscript

script get_player_infos_in_use 
	player_infos_in_use = [0 0 0 0]
	GetFirstPlayer \{on_screen}
	i = 0
	non_player = 1
	begin
	if (<player> > 0)
		SetArrayElement arrayName = player_infos_in_use index = <i> newValue = <player>
		GetNextPlayer on_screen player = <player>
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
		SetArrayElement arrayName = player_infos_in_use index = <i> newValue = <non_player>
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
	GetPlayerInfo (<player_infos_in_use> [<i>]) band_member out = obj_id
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
	CasCancelLoading
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
		return \{false}
	elseif NOT ObjectExists \{id = musician2}
		return \{false}
	elseif NOT ObjectExists \{id = musician3}
		return \{false}
	elseif NOT ObjectExists \{id = musician4}
		return \{false}
	endif
	return \{true}
endscript

script persistent_band_finished_building 
	i = 0
	begin
	if (($persistent_band_data [<i>].building) = 1)
		return \{false}
	endif
	i = (<i> + 1)
	repeat 4
	return \{true}
endscript

script should_use_alt_positions 
	use_alt_positions = 0
	GetPakManCurrent \{map = zones}
	if (<pak> = Z_Gorge)
		if GetNodeFlag \{LS_ENCORE_POST}
			use_alt_positions = 1
		endif
	endif
	Change use_alt_positions = <use_alt_positions>
endscript
