band_builder_current_setup = [
]
band_builder_current_gig_genre = None
use_worst_band = 0
band_builder_part_constants = {
	guitar = {
		default_name = GUITARIST
		create_func = create_guitarist
		start_anims = guitarist_start_anims
	}
	rhythm = {
		default_name = GUITARIST
		create_func = create_guitarist
		start_anims = guitarist_start_anims
	}
	bass = {
		default_name = BASSIST
		create_func = create_bassist
		start_anims = bassist_start_anims
	}
	drum = {
		default_name = drummer
		create_func = create_drummer
		start_anims = drummer_start_anims
	}
	vocals = {
		default_name = vocalist
		create_func = create_vocalist
		start_anims = vocalist_start_anims
	}
}

script band_builder_clear_setup 
	Change \{band_builder_current_setup = [
		]}
endscript

script band_builder_clear_random_appearances 
	if GotParam \{cpu_only}
		i = 0
		GetArraySize \{$band_builder_random_appearances}
		if (<array_Size> > 0)
			begin
			RemoveParameter \{delete}
			if NOT StructureContains structure = ($band_builder_random_appearances [<i>]) player_status
				delete = 1
			elseif NOT GotParam \{cpu_only}
				delete = 1
			endif
			if GotParam \{delete}
				remove_random_character_from_player_status random_id = (($band_builder_random_appearances [<i>]).character_id)
				RemoveArrayElement array = ($band_builder_random_appearances) index = <i>
				Change band_builder_random_appearances = <array>
				RemoveParameter \{array}
			else
				i = (<i> + 1)
			endif
			repeat <array_Size>
		endif
	else
		Change \{band_builder_random_appearances = [
			]}
	endif
endscript

script remove_random_character_from_player_status 
	getmaxplayers
	Player = 1
	begin
	getplayerinfo <Player> character_id
	if (<character_id> = <random_id>)
		if band_builder_is_finalized_random character_id = <character_id>
			setplayerinfo <Player> character_id = Judy

		endif
	endif
	Player = (<Player> + 1)
	repeat <max_players>
endscript

script band_builder_check_valid_part 
	if ((<part> = bass) || (<part> = rhythm) || (<part> = guitar) || (<part> = drum) || (<part> = vocals))
		return
	endif

endscript

script band_builder_has_part 
	band_builder_check_valid_part part = <part>
	i = 0
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		begin
		if StructureContains structure = (($band_builder_current_setup) [<i>]) part
			if ((($band_builder_current_setup) [<i>]).part = <part>)
				return \{true}
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script band_builder_get_num_each_gender 
	females = 0
	males = 0
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		i = 0
		begin
		character_id = (($band_builder_current_setup [<i>]).character_id)
		if band_builder_is_finalized_character character_id = <character_id>
			savegame = (($band_builder_current_setup [<i>]).savegame)
			get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
			get_is_female_from_appearance appearance = (<profile_struct>.appearance)
			if (<is_female> = 1)
				females = (<females> + 1)
			else
				males = (<males> + 1)
			endif
		else
			if (<character_id> = randomfemale)
				females = (<females> + 1)
			elseif (<character_id> = randommale)
				males = (<males> + 1)
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return females = <females> males = <males>
endscript

script band_builder_add_member 

	if NOT GotParam \{real_part}
		real_part = <part>
	endif
	band_builder_check_valid_part part = <part>
	band_builder_check_valid_part part = <real_part>
	if band_builder_is_full

	endif
	Name = ($band_builder_part_constants.<part>.default_name)
	create_func = ($band_builder_part_constants.<real_part>.create_func)

	if band_builder_has_part part = <part>
		ExtendCrc <Name> '2' out = Name
	endif
	if GotParam \{song_struct}
		if StructureContains structure = <song_struct> Band
			band_struct = (<song_struct>.Band)
			if StructureContains structure = <band_struct> Name
				specified_character_id = ($<band_struct>.<Name>)
				if (<specified_character_id> != randomcharacter)
					character_id = <specified_character_id>

				endif
			endif
		else

		endif
	endif
	if ($game_mode = training || $game_mode = tutorial)
		character_id = emptyguy
	endif
	if GotParam \{player_status}
		if ($<player_status>.is_local_client = 1)
			get_savegame_from_player_status player_status = <player_status>
		else
			get_savegame_from_controller controller = ($primary_controller)
		endif
	else
		get_savegame_from_controller controller = ($primary_controller)
	endif
	if NOT band_builder_is_random character_id = <character_id>
		if NOT profile_exists id = <character_id> savegame = <savegame>

			cas_get_random_preset_character savegame = <savegame> part = <part>

			if GotParam \{player_status}
				Change structurename = <player_status> character_id = <character_id>
			endif
		endif
	endif
	if (<part> = drum)
		if NOT fix_disallowed_character_choice character_id = <character_id> savegame = <savegame> part = <part>

			if GotParam \{player_status}
				Change structurename = <player_status> character_id = <character_id>
			endif
		endif
	endif
	entry = {
		part = <part>
		real_part = <real_part>
		Name = <Name>
		create_func = <create_func>
		character_id = <character_id>
		player_status = <player_status>
		savegame = <savegame>
	}
	AddArrayElement array = ($band_builder_current_setup) element = <entry>
	Change band_builder_current_setup = <array>
endscript

script fix_disallowed_character_choice 

	if NOT band_builder_is_random character_id = <character_id>
		get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
		if NOT is_allowed_part profile_struct = <profile_struct> part = <part>

			cas_get_random_preset_character savegame = <savegame> part = <part>

			return FALSE character_id = <character_id>
		endif
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

script get_band_member_player_status \{part = guitar}
	gamemode_getnumplayersshown
	i = 1
	begin
	<player_status> = ($0x2994109a [<i>])
	if (($<player_status>.part) = <part>)
		return band_member_player_status = <player_status>
	endif
	i = (<i> + 1)
	repeat <num_players_shown>
endscript

script band_builder_add_players 
	band_builder_get_band_global

	gamemode_getnumplayersshown


	i = 0
	begin
	<player_status> = ($0x2994109a [<i> + 1])
	character_id = ($<player_status>.character_id)
	get_player_part <...>
	if NOT (<part> = None)
		if NOT ($<player_status>.part = drum || $<player_status>.part = vocals)
			if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
				if (<i> = 0)
					part = guitar
				elseif (<i> = 1)
					part = bass
				endif
			endif
		endif
		if band_builder_has_part \{part = guitar}
			if (<part> = guitar)
				part = bass
			endif
		endif
		if band_builder_has_part \{part = bass}
			if (<part> = bass)
				part = guitar
			endif
		endif
		if ($boss_battle = 1)
			real_part = guitar
		endif
		if NOT ($use_worst_band = 0)
			if NOT is_current_band_vanhalen
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
		endif
		if (<part> = vocals)
			if ($game_mode = p1_quickplay)
			endif
			if (<character_id> = randomcharacter)
				if band_builder_get_cpu_singer_id \{always_random = true}
					character_id = <singer_id>
				endif
			endif
		endif

		band_builder_add_member {
			part = <part>
			real_part = <real_part>
			character_id = <character_id>
			player_status = <player_status>
		}
	endif
	i = (<i> + 1)
	repeat <num_players_shown>
endscript

script get_player_part 
	part = ($<player_status>.part)
	real_part = <part>
	gamemode_getnumplayersshown
	if (<num_players_shown> > 1)
		if (<part> = vocals)
			get_song_struct \{song = $current_song}
			if StructureContains structure = <song_struct> singer
				singer = (<song_struct>.singer)
				if (<singer> = None)
					return \{part = None
						real_part = None}
				endif
			endif
		endif
		is_head_to_head = FALSE
		switch $game_mode
			case p2_battle
			case p2_faceoff
			case p2_pro_faceoff
			is_head_to_head = true
		endswitch
		if NOT is_current_band_vanhalen Band = <Band>
			return part = <part> real_part = <real_part>
		endif
		if (<is_head_to_head> = true)
			return part = <part> real_part = <real_part>
		endif
	endif

	switch <part>
		case rhythm
		case bass
		character_replacing_id = ($<Band>.BASSIST)
		case drum
		character_replacing_id = ($<Band>.drummer)
		case vocals
		character_replacing_id = ($<Band>.vocalist)
		case guitar
		character_replacing_id = ($<Band>.GUITARIST)
	endswitch
	if (<character_replacing_id> != randomcharacter)
		replace_with_celeb = true
		switch <part>
			case vocals
			switch <character_replacing_id>
				case dlr_guitar
				case dlr_alt_guitar
				real_part = rhythm
			endswitch
		endswitch
		if (<replace_with_celeb> = true)
			return part = <part> real_part = <real_part> character_id = <character_replacing_id>
		else
			return part = <part> real_part = <real_part>
		endif
	endif

	switch <part>
		case vocals
		switch <character_replacing_id>
			case dlr_guitar
			case dlr_alt_guitar
			real_part = rhythm
		endswitch
	endswitch
	return part = <part> real_part = <real_part> character_id = <character_id>
endscript

script band_builder_add_cpu_characters 
	band_builder_get_band_global
	gamemode_getnumplayersshown
	if NOT band_builder_is_full
		if NOT band_builder_has_part \{part = drum}
			band_builder_add_member {
				part = drum
				real_part = drum
				character_id = ($<Band>.drummer)
			}

		endif
	endif
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
		return
	endif
	if ($boss_battle = 1)
		return
	endif
	added_cpu_vocalist = FALSE
	if NOT band_builder_is_full
		if NOT band_builder_has_part \{part = vocals}
			if has_singing_guitarist <...>
				real_part = rhythm
			elseif has_singing_bassist <...>
				real_part = bass
			else
				real_part = vocals
			endif
			if ($jam_mode_band = 1)
				real_part = guitar
			endif
			if band_builder_get_cpu_singer_id
				switch <singer_id>
					case dlr_guitar
					case dlr_alt_guitar
					real_part = rhythm
				endswitch
				band_builder_add_member {
					part = vocals
					real_part = <real_part>
					character_id = <singer_id>
				}

				added_cpu_vocalist = true
			endif
		endif
	endif
	if NOT band_builder_is_full
		if NOT band_builder_has_part \{part = bass}
			random_bassist = FALSE
			if has_singing_bassist <...>
				if (<num_players_shown> = 1)
					if ($player1_status.part != vocals)
						random_bassist = true
					endif
				elseif (<added_cpu_vocalist> = true)
					random_bassist = true
				endif
			endif
			if (<random_bassist> = true)
				bassist_id = randomcharacter
			else
				bassist_id = ($<Band>.BASSIST)
			endif
			band_builder_add_member {
				part = bass
				real_part = bass
				character_id = <bassist_id>
			}

		endif
	endif
	if NOT band_builder_is_full
		if NOT band_builder_has_part \{part = guitar}
			random_guitarist = FALSE
			if has_singing_guitarist <...>
				if ($<Band>.GUITARIST = jimi)
					if ($current_transition = intro_jimi)
						random_guitarist = true
					else
						return
					endif
				else
					if GotParam \{singer_id}
						if (<singer_id> = ($<Band>.GUITARIST))
							random_guitarist = true
						endif
					endif
				endif
			endif
			if (<random_guitarist> = true)
				guitarist_id = randomcharacter
			else
				guitarist_id = ($<Band>.GUITARIST)
			endif
			band_builder_add_member {
				part = guitar
				real_part = guitar
				character_id = <guitarist_id>
			}

		endif
	endif
endscript

script has_singing_guitarist 
	GUITARIST = ($<Band>.GUITARIST)
	vocalist = ($<Band>.vocalist)
	switch <vocalist>
		case dlr_guitar
		case dlr_alt_guitar
		return \{true}
	endswitch
	if (<GUITARIST> != <vocalist>)
		return \{FALSE}
	endif
	if (<GUITARIST> = randomcharacter || <GUITARIST> = randommale || <GUITARIST> = randomfemale)
		return \{FALSE}
	endif
	if (<vocalist> = randomcharacter || <vocalist> = randommale || <vocalist> = randomfemale)
		return \{FALSE}
	endif
	return \{true}
endscript

script has_singing_bassist 
	BASSIST = ($<Band>.BASSIST)
	vocalist = ($<Band>.vocalist)
	if (<vocalist> = lemmy)
		return \{true}
	endif
	if (<BASSIST> != <vocalist>)
		return \{FALSE}
	endif
	if (<BASSIST> = randomcharacter || <BASSIST> = randommale || <BASSIST> = randomfemale)
		return \{FALSE}
	endif
	if (<vocalist> = randomcharacter || <vocalist> = randommale || <vocalist> = randomfemale)
		return \{FALSE}
	endif
	return \{true}
endscript

script is_current_band_vanhalen 
	if NOT GotParam \{Band}
		get_band_name song = ($current_song)
	endif
	switch <Band>
		case band_vanhalen
		case band_vanhalen_dlr_guitar
		case band_vanhalen_eddie_drill
		case band_vanhalen_wolf_drill
		case band_vanhalen_alt
		case band_vanhalen_eddie_alt_drill
		case band_vanhalen_dlr_alt_guitar
		return \{true}
	endswitch
	return \{FALSE}
endscript

script is_vanhalen_song 
	if NOT GotParam \{song}
		song = ($current_song)
	endif
	get_song_struct song = <song>
	if StructureContains structure = <song_struct> Band
		Band = (<song_struct>.Band)
		switch <Band>
			case band_vanhalen
			case band_vanhalen_dlr_guitar
			case band_vanhalen_eddie_drill
			case band_vanhalen_wolf_drill
			case band_vanhalen_alt
			case band_vanhalen_eddie_alt_drill
			case band_vanhalen_dlr_alt_guitar
			return \{true}
		endswitch
	endif
	return \{FALSE}
endscript

script is_guitaronly_song 
	if NOT GotParam \{song}
		song = ($current_song)
	endif
	get_song_struct song = <song>
	if StructureContains structure = ($gh_songlist_props.<song>) guitar_only
		if ($gh_songlist_props.<song>.guitar_only = guitar)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script band_builder_get_band_global 
	if ($jam_mode_band = 1)
		return \{Band = jam_mode_band_profiles}
	endif
	if is_current_band_vanhalen
		get_band_name song = ($current_song)
		return Band = <Band>
	endif
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
	get_band_name song = ($current_song)
	return Band = <Band>
endscript

script get_band_name 
	get_song_struct song = <song>
	if StructureContains structure = <song_struct> Band
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
			Band = default_band
			if is_vanhalen_song
				if ($cheat_altband = 1)
					Band = band_alex_headtohead_alt
				else
					Band = band_alex_headtohead
				endif
			endif
			return Band = <Band>
		else
			Band = (<song_struct>.Band)
			if is_vanhalen_song song = <song>
				if (($cheat_altband = 1) || (($current_gig_number) = 10))
					switch (<Band>)
						case band_vanhalen_eddie_drill
						Band = band_vanhalen_eddie_alt_drill
						case band_vanhalen_dlr_guitar
						Band = band_vanhalen_dlr_alt_guitar
						default
						Band = band_vanhalen_alt
					endswitch
				endif
			endif
			return Band = <Band>
		endif
	else
		return \{Band = default_band}
	endif
endscript

script band_builder_get_cpu_singer_id \{always_random = FALSE}
	get_song_struct song = ($current_song)
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
	if ((<singer_id> = randomcharacter) || (<always_random> = true))
		if (<singer> = male)
			singer_id = randommale
		elseif (<singer> = female)
			singer_id = randomfemale
		endif
	endif
	return true singer_id = <singer_id>
endscript

script band_builder_create_band \{async = 0}
	GetStartTime
	band_builder_clear_setup
	band_builder_add_players
	band_builder_fixup_random_human_player_names
	band_builder_add_cpu_characters
	band_builder_fill_in_random_characters
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		i = 0
		begin
		band_builder_create_character index = <i> async = <async>
		i = (<i> + 1)
		repeat <array_Size>
	endif
	band_load_anim_paks async = <async>
	getelapsedtime starttime = <starttime>
	ElapsedTime = (<ElapsedTime> / 1000.0)

	if (<async> = 1)
		if GotParam \{min_time}
			timeleft = (<min_time> - <ElapsedTime>)
			if (<timeleft> > 0.0)

				Wait <timeleft> Seconds
			endif
		endif
	endif
	get_song_prefix \{song = $current_song}
	formatText checksumName = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup
	if GlobalExists Name = <fretbar_array> Type = array
		GetArraySize $<fretbar_array>
		if (<array_Size> > 0)
			Change structurename = player1_status current_song_beat_time = ($<fretbar_array> [1])
		endif
	endif
	band_start_anims
	Change \{finished_gig_band_rebuild = 1}
endscript

script band_builder_create_character \{async = 0}
	create_func = (($band_builder_current_setup [<index>]).create_func)
	character_id = (($band_builder_current_setup [<index>]).character_id)
	Name = (($band_builder_current_setup [<index>]).Name)
	ps2_get_musician_context_data Name = <Name>
	savegame = (($band_builder_current_setup [<index>]).savegame)
	if StructureContains structure = ($band_builder_current_setup [<index>]) player_status
		player_status = (($band_builder_current_setup [<index>]).player_status)
	else
		RemoveParameter \{player_status}
	endif
	if GotParam \{player_status}
		Change structurename = <player_status> band_member = <Name>
	endif

	<create_func> {
		Name = <Name>
		profile_id = <character_id>
		player_status = <player_status>
		async = <async>
		loading_into_song = ($current_song)
		asset_heap = <asset_heap>
		savegame = <savegame>
	}
endscript

script band_get_human_players 
	array = []
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		i = 0
		begin
		if StructureContains structure = ($band_builder_current_setup [<i>]) player_status
			AddArrayElement array = <array> element = (($band_builder_current_setup [<i>]).part)
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return human_players = <array>
endscript

script maybe_use_song_or_venue_specific_instrument 
	if is_current_band_vanhalen
		switch <Name>
			case eddie_van_halen_alt2
			Name = eddie_van_halen2
			case wolfgang_van_halen_alt2
			Name = wolfgang_van_halen2
			case alex_van_halen_alt2
			Name = alex_van_halen2
			case david_lee_roth_alt2
			Name = david_lee_roth2
		endswitch
		if StructureContains structure = $venue_specific_instrument_data <venue>
			if StructureContains structure = ($venue_specific_instrument_data.<venue>) <Name>

				instrument_struct_venue = ($venue_specific_instrument_data.<venue>.<Name>)
				appearance = {<appearance> <instrument_struct_venue>}
			endif
		endif
		if NOT GotParam \{song}
			song = ($current_song)
		endif
		if StructureContains structure = $song_specific_instrument_data <song>
			if StructureContains structure = ($song_specific_instrument_data.<song>) <Name>

				instrument_struct_song = ($song_specific_instrument_data.<song>.<Name>)
				appearance = {<appearance> <instrument_struct_song>}
				alt_set_guitar_string_props info_struct = guitarist_info new_instrument = <instrument_struct_song>
			endif
		endif
	endif
	return appearance = <appearance>
endscript
