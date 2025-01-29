band_builder_current_setup = [
]
band_builder_current_gig_genre = None
use_worst_band = 0
band_default_object_names = {
	vocals = musician1
	drum = musician2
	guitar = musician3
	bass = musician4
}
debug_musician1 = None
debug_musician2 = None
debug_musician3 = None
debug_musician4 = None

script band_builder_clear_setup 
	Change \{band_builder_current_setup = [
		]}
endscript

script band_builder_check_valid_part 
	switch <part>
		case bass
		case guitar
		case drum
		case vocals
		return
		default
		ScriptAssert 'Part unknown! %p' p = <part>
	endswitch
endscript

script band_builder_has_part 
	band_builder_check_valid_part part = <part>
	i = 0
	has_this_many = 0
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		begin
		if StructureContains structure = (($band_builder_current_setup) [<i>]) part
			if ((($band_builder_current_setup) [<i>]).part = <part>)
				<has_this_many> = (<has_this_many> + 1)
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if (<has_this_many> > 0)
		return true has_this_many = <has_this_many>
	endif
endscript

script band_is_name_used 
	i = 0
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		begin
		if StructureContains structure = (($band_builder_current_setup) [<i>]) Name
			if ((($band_builder_current_setup) [<i>]).Name = <Name>)
				return \{true}
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script band_get_drummer_id 
	return id = ($band_default_object_names.drum)
endscript

script band_builder_add_member \{Name = unknown}
	RequireParams \{[
			part
			character_id
			character_savegame
		]
		all}
	band_builder_check_valid_part part = <part>
	printf channel = Band qs(0xe9826398) a = <part> c = <Name>
	if GotParam \{song_struct}
		if StructureContains structure = <song_struct> Band
			band_struct = (<song_struct>.Band)
			if StructureContains structure = <band_struct> Name
				specified_character_id = ($<band_struct>.<Name>)
				character_id = <specified_character_id>
				printf channel = AnimInfo qs(0xb2b1b16a) a = <Name> b = <character_id>
			endif
		else
			printf \{channel = AnimInfo
				qs(0x18ec2a4b)}
		endif
	endif
	if ($game_mode = practice || $game_mode = tutorial)
		character_id = emptyguy
	endif
	if NOT characterprofileexists Name = <character_id> savegame = <character_savegame>
		ScriptAssert '%c savegame=%s not found!' c = <character_id> s = <character_savegame>
		cas_get_random_preset_character savegame = <character_savegame> part = <part>
		printf 'Using %c instead' c = <character_id>
		if GotParam \{Player}
			setplayerinfo <Player> character_id = <character_id>
			setplayerinfo <Player> character_savegame = -1
		endif
	endif
	if (<part> = drum)
		if NOT fix_disallowed_character_choice character_id = <character_id> savegame = <character_savegame> part = <part>
			printf channel = Band qs(0x652bf9ad) a = <character_id>
			if GotParam \{Player}
				setplayerinfo <Player> character_id = <character_id>
				setplayerinfo <Player> character_savegame = -1
			endif
		endif
	endif
	band_builder_add_setup_entry {
		part = <part>
		Name = <Name>
		character_id = <character_id>
		Player = <Player>
		savegame = <character_savegame>
	}
endscript

script fix_disallowed_character_choice 
	RequireParams \{[
			character_id
			savegame
			part
		]
		all}
	characterprofilegetstruct Name = <character_id> savegame = <savegame>
	if NOT is_allowed_part profile_struct = <profile_struct> part = <part>
		printf '%s is not allowed to be on the %t, defaulting to someone else...' s = <character_id> t = <part>
		cas_get_random_preset_character savegame = <savegame> part = <part>
		printf 'Chose %s' s = <character_id>
		return FALSE character_id = <character_id>
	endif
	return true character_id = <character_id>
endscript

script band_builder_is_full 
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> = 4)
		return \{true}
	endif
	return \{FALSE}
endscript

script get_band_member_player \{part = guitar}
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <Player> part = <part>
			return band_member_player = <Player>
		endif
		getnextplayer \{on_screen}
		repeat <num_players_shown>
	endif
endscript

script band_builder_add_players 
	band_builder_get_band_global
	printf channel = AnimInfo qs(0x0b7565a2) a = <Band> donotresolve
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		get_player_part Player = <Player>
		if NOT (<part> = None)
			get_player_character_id Band = <Band> part = <part> Player = <Player>
			if NOT ($use_worst_band = 0)
				if ($use_worst_band = male)
					globalworstname = worst_male_band
				else
					globalworstname = worst_female_band
				endif
				switch <part>
					case rhythm
					case bass
					character_id = ($<globalworstname>.BASSIST)
					case drum
					character_id = ($<globalworstname>.drummer)
					case vocals
					character_id = ($<globalworstname>.vocalist)
					case guitar
					character_id = ($<globalworstname>.GUITARIST)
				endswitch
			endif
			band_builder_add_member {
				part = <part>
				character_id = <character_id>
				Player = <Player>
				Name = unknown
				character_savegame = <savegame>
			}
		endif
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
endscript

script get_player_part 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	gman_songtool_getcurrentsong
	getnumplayersingame \{on_screen}
	if (<part> = vocals)
		get_song_struct song = <current_song>
		if StructureContains structure = <song_struct> singer
			singer = (<song_struct>.singer)
			if (<singer> = None)
				return \{part = None}
			endif
		endif
	endif
	return part = <part>
endscript

script get_player_character_id 
	RequireParams \{[
			Band
			part
			Player
		]}
	getplayerinfo <Player> character_id
	getplayerinfo <Player> character_savegame
	getplayerinfo <Player> stored_character_index
	if (<character_savegame> = -1)
		get_savegame_from_controller \{controller = $primary_controller}
		character_savegame = <savegame>
	endif
	if is_head_to_head_mode
		return character_id = <character_id> savegame = <character_savegame>
	endif
	gman_songtool_getcurrentsong
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 1)
		return character_id = <character_id> savegame = <character_savegame>
	endif
	switch <part>
		case bass
		character_replacing_id = ($<Band>.BASSIST)
		case drum
		character_replacing_id = ($<Band>.drummer)
		case vocals
		character_replacing_id = ($<Band>.vocalist)
		case guitar
		character_replacing_id = ($<Band>.GUITARIST)
	endswitch
	printf qs(0x73d0bcc4) a = <character_replacing_id>
	if (<character_id> = savedbandmember)
		get_savegame_from_controller \{controller = $primary_controller}
		character_savegame = <savegame>
		resolve_saved_band_member character_id = <character_id> index = <stored_character_index> savegame = <savegame>
	endif
	if ($game_mode = p1_quickplay)
	endif
	return character_id = <character_id> savegame = <character_savegame>
endscript

script band_builder_add_cpu_characters 
	band_builder_get_band_global
	getnumplayersingame \{on_screen}
	get_savegame_from_controller \{controller = $primary_controller}
	if NOT band_builder_is_full
		if NOT band_builder_has_part \{part = vocals}
			if has_singing_guitarist <...>
				part = guitar
			elseif has_singing_bassist <...>
				part = bass
			else
				part = vocals
			endif
			if ($jam_mode_band = 1)
				part = guitar
			endif
			if band_builder_get_cpu_singer_id
				resolve_saved_band_member character_id = <singer_id> index = 0 savegame = <savegame>
				band_builder_add_member {
					part = <part>
					character_id = <character_id>
					character_savegame = <savegame>
				}
				added_cpu_vocalist = true
			endif
		endif
	endif
	if NOT band_builder_is_full
		if NOT band_builder_has_part \{part = drum}
			resolve_saved_band_member character_id = ($<Band>.drummer) index = 1 savegame = <savegame>
			band_builder_add_member {
				part = drum
				character_id = <character_id>
				character_savegame = <savegame>
			}
		endif
	endif
	if NOT band_builder_is_full
		if NOT band_builder_has_part \{part = guitar}
			resolve_saved_band_member character_id = ($<Band>.GUITARIST) index = 2 savegame = <savegame>
			band_builder_add_member {
				part = guitar
				character_id = <character_id>
				character_savegame = <savegame>
			}
		endif
	endif
	if NOT band_builder_is_full
		if NOT band_builder_has_part \{part = bass}
			resolve_saved_band_member character_id = ($<Band>.BASSIST) index = 3 savegame = <savegame>
			band_builder_add_member {
				part = bass
				character_id = <character_id>
				character_savegame = <savegame>
			}
		endif
	endif
endscript

script has_singing_guitarist 
	GUITARIST = ($<Band>.GUITARIST)
	vocalist = ($<Band>.vocalist)
	if (<GUITARIST> = savedbandmember)
		return \{FALSE}
	endif
	if (<vocalist> = savedbandmember)
		return \{FALSE}
	endif
	if (<vocalist> = jimi)
		return \{true}
	endif
	if (<GUITARIST> != <vocalist>)
		return \{FALSE}
	endif
	return \{true}
endscript

script has_singing_bassist 
	BASSIST = ($<Band>.BASSIST)
	vocalist = ($<Band>.vocalist)
	if (<BASSIST> = savedbandmember)
		return \{FALSE}
	endif
	if (<vocalist> = savedbandmember)
		return \{FALSE}
	endif
	if (<BASSIST> != <vocalist>)
		return \{FALSE}
	endif
	return \{true}
endscript

script band_builder_get_band_global 
	if NOT ($use_worst_band = 0)
		if ($use_worst_band = male)
			return \{Band = worst_male_band}
		else
			return \{Band = worst_female_band}
		endif
	endif
	if ($jam_mode_band = 1)
		return \{Band = jam_mode_band_profiles}
	endif
	if ($current_gig_number = 13 || $current_gig_number = 18)
		gman_songtool_getcurrentsong
		get_song_struct song = <current_song>
		if StructureContains structure = <song_struct> singer
			singer = (<song_struct>.singer)
			if (<singer> = female)
				return \{Band = band_finalgig_female_singer}
			else
				return \{Band = band_finalgig_male_singer}
			endif
		endif
		return \{Band = band_finalgig_male_singer}
	endif
	if NOT GotParam \{song}
		gman_songtool_getcurrentsong
		song = <current_song>
	endif
	get_band_configuration song = <song>
	return Band = <Band>
endscript

script get_band_configuration 
	if NOT GotParam \{skip_dlc_check}
		if StructureContains structure = $download_songlist_props <song>
			return \{Band = default_band}
		endif
	endif
	get_song_struct song = <song>
	if StructureContains structure = <song_struct> Band
		if ($game_mode = p2_pro_faceoff || $game_mode = p2_roadie_battle)
			return \{Band = default_band}
		else
			return Band = (<song_struct>.Band)
		endif
	else
		return \{Band = default_band}
	endif
endscript

script band_builder_get_cpu_singer_id 
	gman_songtool_getcurrentsong
	get_song_struct song = <current_song>
	band_builder_get_band_global
	singer = male
	if StructureContains structure = <song_struct> singer
		singer = (<song_struct>.singer)
	endif
	if (<singer> = None)
		return \{FALSE}
	endif
	singer_id = ($<Band>.vocalist)
	if (<singer_id> = None)
		return \{FALSE}
	endif
	return true singer_id = <singer_id>
endscript

script band_builder_create_band \{async = 0}
	printf \{channel = pop
		qs(0x44466f76)}
	GetStartTime
	band_builder_clear_setup
	band_builder_add_players
	band_builder_add_cpu_characters
	band_builder_set_debug_musician_parts
	band_builder_determine_musician_ids
	band_builder_determine_positions
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		i = 0
		wii_timer_start \{label = 'band_meat'}
		begin
		band_builder_create_character index = <i> async = <async>
		i = (<i> + 1)
		repeat <array_Size>
		wii_timer_stop \{label = 'band_meat'}
	endif
	wii_timer_start \{label = 'band_anims'}
	band_load_anim_paks async = <async>
	wii_timer_stop \{label = 'band_anims'}
	GetTrueElapsedTime starttime = <starttime>
	ElapsedTime = (<ElapsedTime> / 1000.0)
	printf 'band_builder_create_band took %f seconds' f = <ElapsedTime>
	if (<async> = 1)
		if GotParam \{min_time}
			timeleft = (<min_time> - <ElapsedTime>)
			if (<timeleft> > 0.0)
				printf 'Waiting an extra %f seconds...' f = <timeleft>
				Wait <timeleft> Seconds
			endif
		endif
	endif
	gman_songtool_getcurrentsong
	songfilemanager func = get_num_fretbar_notes song_name = <current_song>
	if (<num_fretbar_notes> > 0)
		songfilemanager func = get_fretbar_note song_name = <current_song> index = 1
		setplayerinfo 1 current_song_beat_time = <fretbar_time>
	endif
	band_builder_assign_aliases
	band_start_anims
	Change \{finished_gig_band_rebuild = 1}
	wii_save_band_config
endscript

script band_builder_create_character \{async = 0}
	character_id = (($band_builder_current_setup [<index>]).character_id)
	Name = (($band_builder_current_setup [<index>]).Name)
	ps2_get_musician_context_data Name = <Name>
	savegame = (($band_builder_current_setup [<index>]).savegame)
	part = (($band_builder_current_setup [<index>]).part)
	if StructureContains structure = ($band_builder_current_setup [<index>]) Player
		Player = (($band_builder_current_setup [<index>]).Player)
	else
		RemoveParameter \{Player}
	endif
	if GotParam \{Player}
		setplayerinfo <Player> band_member = <Name>
	endif
	printf qs(0x7d803982) a = <Name> donotresolve
	gman_songtool_getcurrentsong
	create_band_member {
		Name = <Name>
		id = <character_id>
		Player = <Player>
		async = <async>
		loading_into_song = <current_song>
		asset_heap = <asset_heap>
		savegame = <savegame>
		instrument = <part>
	}
	cas_queue_external_set_object index = <index> Name = <Name>
endscript

script band_builder_switch_character \{async = 0}
	printf \{'band_builder_switch_character'}
	RequireParams \{[
			part
		]
		all}
	if GotParam \{cpu_only}
		if GotParam \{switch_part}
			<the_part> = <switch_part>
		else
			<the_part> = <part>
		endif
		if get_cpu_band_member_for_swap part = <the_part>
			setup = ($band_builder_current_setup [<index>])
			if NOT GotParam \{new_character_id}
				destroy_band_member Name = (<setup>.Name)
				RemoveArrayElement array = ($band_builder_current_setup) index = <index>
				Change band_builder_current_setup = <array>
				return
			endif
			if StructureContains structure = <setup> old_character_id
				if (<new_character_id> = (<setup>.old_character_id))
					return
				endif
			endif
			SetArrayElement ArrayName = band_builder_current_setup globalarray index = <index> NewValue = {
				<setup>
				character_id = <new_character_id>
				Player = <Player>
			}
			destroy_band_member Name = (<setup>.Name)
		else
			GetArraySize \{$band_builder_current_setup}
			if (<array_Size> >= 4)
				printf \{'No room in band...'}
				return
			endif
			index = <array_Size>
			band_builder_add_member {
				part = <part>
				real_part = <part>
				character_id = <new_character_id>
				Player = <Player>
			}
			destroy_band_member Name = (($band_builder_current_setup) [<index>].Name)
		endif
		band_builder_fill_in_random_characters
		band_builder_create_character index = <index> async = <async>
	else
		ScriptAssert \{'swapping out human players is not supported yet'}
	endif
endscript

script get_cpu_band_member_for_swap 
	i = 0
	GetArraySize \{$band_builder_current_setup}
	begin
	if (<part> = ($band_builder_current_setup [<i>].part))
		if NOT StructureContains structure = ($band_builder_current_setup [<i>]) Player
			return true index = <i>
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script band_get_human_players 
	array = []
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		i = 0
		begin
		if StructureContains structure = ($band_builder_current_setup [<i>]) Player
			AddArrayElement array = <array> element = (($band_builder_current_setup [<i>]).part)
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return human_players = <array>
endscript
part_priority = [
	vocals
	drum
	guitar
	bass
]

script band_builder_determine_musician_ids 
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> = 0)
		return
	endif
	part_index = 0
	begin
	check_part = ($part_priority [<part_index>])
	i = 0
	begin
	if StructureContains structure = ($band_builder_current_setup [<i>]) part
		if ((($band_builder_current_setup [<i>]).part) = <check_part>)
			desired_name = ($band_default_object_names.<check_part>)
			old_setup = ($band_builder_current_setup [<i>])
			SetArrayElement ArrayName = band_builder_current_setup globalarray index = <i> NewValue = {
				<old_setup>
				Name = <desired_name>
			}
			break
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	<part_index> = (<part_index> + 1)
	repeat 4
	id = 4
	part_index = 0
	begin
	check_part = ($part_priority [<part_index>])
	i = 0
	begin
	if StructureContains structure = ($band_builder_current_setup [<i>]) part
		if ((($band_builder_current_setup [<i>]).part) = <check_part>)
			if ((($band_builder_current_setup [<i>]).Name) = unknown)
				begin
				formatText checksumName = desired_id 'musician%a' a = <id>
				if NOT band_is_name_used Name = <desired_id>
					break
				endif
				id = (<id> - 1)
				if (<id> = 0)
					ScriptAssert \{qs(0xa166121d)}
				endif
				repeat
				old_setup = ($band_builder_current_setup [<i>])
				SetArrayElement ArrayName = band_builder_current_setup globalarray index = <i> NewValue = {
					<old_setup>
					Name = <desired_id>
				}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	<part_index> = (<part_index> + 1)
	repeat 4
	i = 0
	GetArraySize \{$band_builder_current_setup}
	begin
	Name = ((($band_builder_current_setup) [<i>]).Name)
	part = ((($band_builder_current_setup) [<i>]).part)
	i = (<i> + 1)
	repeat <array_Size>
endscript

script band_builder_determine_positions 
	i = 0
	GetArraySize \{$band_builder_current_setup}
	begin
	Name = ((($band_builder_current_setup) [<i>]).Name)
	switch <Name>
		case musician1
		position = vocalist
		case musician2
		position = drummer
		case musician3
		position = GUITARIST
		case musician4
		position = BASSIST
		default
		ScriptAssert \{'Unkown musician id'}
	endswitch
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> position = <position>
	i = (<i> + 1)
	repeat <array_Size>
endscript

script band_builder_set_debug_musician_parts 
	i = 0
	GetArraySize \{$band_builder_current_setup}
	begin
	new_part = None
	switch <i>
		case 0
		new_part = $debug_musician1
		case 1
		new_part = $debug_musician2
		case 2
		new_part = $debug_musician3
		case 3
		new_part = $debug_musician4
	endswitch
	if (<new_part> != None)
		old_setup = ($band_builder_current_setup [<i>])
		SetArrayElement ArrayName = band_builder_current_setup globalarray index = <i> NewValue = {
			<old_setup>
			part = <new_part>
		}
	endif
	verify_part = ((($band_builder_current_setup) [<i>]).part)
	i = (<i> + 1)
	repeat <array_Size>
endscript

script is_standard_band_setup 
	gamemode_gettype
	if ($in_sing_a_long = true || <Type> = freeplay)
		return \{true}
	endif
	parts = [guitar bass vocals drum]
	found = [0 0 0 0]
	get_player_infos_in_use
	part_index = 0
	begin
	check_part = (<parts> [<part_index>])
	i = 0
	begin
	Player = (<player_infos_in_use> [<i>])
	getplayerinfo <Player> part
	if (<part> = <check_part>)
		if (<found> [<part_index>] = 1)
			return \{FALSE}
		endif
		SetArrayElement ArrayName = found index = <part_index> NewValue = 1
	endif
	i = (<i> + 1)
	repeat 4
	part_index = (<part_index> + 1)
	repeat 4
	return \{true}
endscript
wii_last_character_ids = [
	None
	None
	None
	None
]
wii_last_character_gender = [
	None
	None
	None
	None
]

script wii_save_band_config 
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		i = 0
		begin
		SetArrayElement {
			ArrayName = wii_last_character_ids
			globalarray
			index = <i>
			NewValue = ($band_builder_current_setup [<i>].character_id)
		}
		wii_get_character_gender index = <i>
		SetArrayElement {
			ArrayName = wii_last_character_gender
			globalarray
			index = <i>
			NewValue = <gender>
		}
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script wii_clear_band_config 
	Change \{wii_last_character_ids = [
			None
			None
			None
			None
		]}
	Change \{wii_last_character_gender = [
			None
			None
			None
			None
		]}
endscript

script wii_get_character_gender 
	RequireParams \{[
			index
		]
		all}
	character_id = (($band_builder_current_setup [<index>]).character_id)
	savegame = (($band_builder_current_setup [<index>]).savegame)
	characterprofilegetstruct Name = <character_id> savegame = <savegame>
	get_is_female_from_appearance appearance = (<profile_struct>.appearance)
	if (<is_female> = 1)
		gender = female
	else
		gender = male
	endif
	return gender = <gender>
endscript

script wii_character_needs_building 
	RequireParams \{[
			index
		]
		all}
	if (($band_builder_current_setup [<index>].character_id) != ($wii_last_character_ids [<index>]))
		return \{true}
	endif
	wii_get_character_gender index = <index>
	if (<gender> != $wii_last_character_gender [<index>])
		return \{true}
	endif
	return \{FALSE}
endscript

script band_builder_remove_setup_entry 
	RequireParams \{[
			Name
		]
		all}
	i = 0
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		begin
		if (($band_builder_current_setup [<i>].Name) = <Name>)
			if GotParam \{found}
				ScriptAssert 'Duplicate %s found' s = <Name>
			endif
			found = <i>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if GotParam \{found}
		RemoveArrayElement array = ($band_builder_current_setup) index = <found>
		Change band_builder_current_setup = <array>
	else
	endif
endscript

script band_builder_add_setup_entry 
	RequireParams \{[
			part
			Name
			character_id
			savegame
		]
		all}
	if band_builder_is_full
		ScriptAssert \{'band too big!'}
	endif
	AddArrayElement array = ($band_builder_current_setup) element = {
		part = <part>
		Name = <Name>
		character_id = <character_id>
		Player = <Player>
		savegame = <savegame>
		asset_heap = <asset_heap>
	}
	Change band_builder_current_setup = <array>
endscript

script band_builder_assign_aliases 
	if CompositeObjectExists \{Name = musician1}
		AssignAlias \{id = musician1
			alias = vocalist}
	endif
	if CompositeObjectExists \{Name = musician2}
		AssignAlias \{id = musician2
			alias = drummer}
	endif
	if CompositeObjectExists \{Name = musician3}
		AssignAlias \{id = musician3
			alias = GUITARIST}
	endif
	if CompositeObjectExists \{Name = musician4}
		AssignAlias \{id = musician4
			alias = BASSIST}
	endif
endscript
