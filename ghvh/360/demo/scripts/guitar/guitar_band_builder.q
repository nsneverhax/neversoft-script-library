band_builder_current_setup = [
]
band_builder_current_gig_genre = none
use_worst_band = 0
band_builder_part_constants = {
	guitar = {
		default_name = guitarist
		create_func = create_guitarist
		start_anims = guitarist_start_anims
	}
	rhythm = {
		default_name = guitarist
		create_func = create_guitarist
		start_anims = guitarist_start_anims
	}
	bass = {
		default_name = bassist
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
	change \{band_builder_current_setup = [
		]}
endscript

script band_builder_clear_random_appearances 
	if gotparam \{cpu_only}
		i = 0
		getarraysize \{$band_builder_random_appearances}
		if (<array_size> > 0)
			begin
			removeparameter \{delete}
			if NOT structurecontains structure = ($band_builder_random_appearances [<i>]) player_status
				delete = 1
			elseif NOT gotparam \{cpu_only}
				delete = 1
			endif
			if gotparam \{delete}
				remove_random_character_from_player_status random_id = (($band_builder_random_appearances [<i>]).character_id)
				removearrayelement array = ($band_builder_random_appearances) index = <i>
				change band_builder_random_appearances = <array>
				removeparameter \{array}
			else
				i = (<i> + 1)
			endif
			repeat <array_size>
		endif
	else
		change \{band_builder_random_appearances = [
			]}
	endif
endscript

script remove_random_character_from_player_status 
	getmaxplayers
	player = 1
	begin
	getplayerinfo <player> character_id
	if (<character_id> = <random_id>)
		if band_builder_is_finalized_random character_id = <character_id>
			setplayerinfo <player> character_id = judy
			printf 'DT17649 player %d back to judy' d = <player>
		endif
	endif
	player = (<player> + 1)
	repeat <max_players>
endscript

script band_builder_check_valid_part 
	if ((<part> = bass) || (<part> = rhythm) || (<part> = guitar) || (<part> = drum) || (<part> = vocals))
		return
	endif
	scriptassert 'Part unknown! %p' p = <part>
endscript

script band_builder_has_part 
	band_builder_check_valid_part part = <part>
	i = 0
	getarraysize \{$band_builder_current_setup}
	if (<array_size> > 0)
		begin
		if structurecontains structure = (($band_builder_current_setup) [<i>]) part
			if ((($band_builder_current_setup) [<i>]).part = <part>)
				return \{true}
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script band_builder_get_num_each_gender 
	females = 0
	males = 0
	getarraysize \{$band_builder_current_setup}
	if (<array_size> > 0)
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
		repeat <array_size>
	endif
	return females = <females> males = <males>
endscript

script band_builder_add_member 
	requireparams \{[
			part
			character_id
		]
		all}
	if NOT gotparam \{real_part}
		real_part = <part>
	endif
	band_builder_check_valid_part part = <part>
	band_builder_check_valid_part part = <real_part>
	if band_builder_is_full
		scriptassert \{'band too big!'}
	endif
	name = ($band_builder_part_constants.<part>.default_name)
	create_func = ($band_builder_part_constants.<real_part>.create_func)
	printf channel = band qs(0x67bde711) a = <part> b = <real_part> c = <name>
	if band_builder_has_part part = <part>
		extendcrc <name> '2' out = name
	endif
	if gotparam \{song_struct}
		if structurecontains structure = <song_struct> band
			band_struct = (<song_struct>.band)
			if structurecontains structure = <band_struct> name
				specified_character_id = ($<band_struct>.<name>)
				if (<specified_character_id> != randomcharacter)
					character_id = <specified_character_id>
					printf channel = animinfo qs(0xb2b1b16a) a = <name> b = <character_id>
				endif
			endif
		else
			printf \{channel = animinfo
				qs(0x18ec2a4b)}
		endif
	endif
	if ($game_mode = training || $game_mode = tutorial)
		character_id = emptyguy
	endif
	if gotparam \{player_status}
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
			printf '%c savegame=%s not found!' c = <character_id> s = <savegame>
			cas_get_random_preset_character savegame = <savegame> part = <part>
			printf 'Using %c instead' c = <character_id>
			if gotparam \{player_status}
				change structurename = <player_status> character_id = <character_id>
			endif
		endif
	endif
	if (<part> = drum)
		if NOT fix_disallowed_character_choice character_id = <character_id> savegame = <savegame> part = <part>
			printf channel = band qs(0x652bf9ad) a = <character_id>
			if gotparam \{player_status}
				change structurename = <player_status> character_id = <character_id>
			endif
		endif
	endif
	entry = {
		part = <part>
		real_part = <real_part>
		name = <name>
		create_func = <create_func>
		character_id = <character_id>
		player_status = <player_status>
		savegame = <savegame>
	}
	addarrayelement array = ($band_builder_current_setup) element = <entry>
	change band_builder_current_setup = <array>
endscript

script fix_disallowed_character_choice 
	requireparams \{[
			character_id
			savegame
			part
		]
		all}
	if NOT band_builder_is_random character_id = <character_id>
		get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
		if NOT is_allowed_part profile_struct = <profile_struct> part = <part>
			printf '%s is not allowed to be on the %t, defaulting to someone else...' s = <character_id> t = <part>
			cas_get_random_preset_character savegame = <savegame> part = <part>
			printf 'Chose %s' s = <character_id>
			return false character_id = <character_id>
		endif
	endif
	return true character_id = <character_id>
endscript

script band_builder_is_full 
	getarraysize \{$band_builder_current_setup}
	if (<array_size> = 4)
		return \{true}
	endif
	return \{false}
endscript

script get_band_member_player_status \{part = guitar}
	gamemode_getnumplayersshown
	i = 1
	begin
	formattext checksumname = player_status 'player%d_status' d = <i>
	if (($<player_status>.part) = <part>)
		return band_member_player_status = <player_status>
	endif
	i = (<i> + 1)
	repeat <num_players_shown>
endscript

script band_builder_add_players 
	band_builder_get_band_global
	printf channel = animinfo qs(0x0b7565a2) a = <band> donotresolve
	gamemode_getnumplayersshown
	printf qs(0x6a6f7806) a = <num_players_shown>
	printf \{qs(0x83825fb5)
		a = $current_num_players}
	i = 0
	begin
	formattext checksumname = player_status 'player%d_status' d = (<i> + 1)
	character_id = ($<player_status>.character_id)
	get_player_part <...>
	if NOT (<part> = none)
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
					character_id = ($<globalworstname>.bassist)
					case drum
					character_id = ($<globalworstname>.drummer)
					case vocals
					character_id = ($<globalworstname>.vocalist)
					case guitar
					character_id = ($<globalworstname>.guitarist)
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
		printf channel = band qs(0xa5cbc8a8) a = <character_id> b = <part> c = <real_part>
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
			if structurecontains structure = <song_struct> singer
				singer = (<song_struct>.singer)
				if (<singer> = none)
					return \{part = none
						real_part = none}
				endif
			endif
		endif
		is_head_to_head = false
		switch $game_mode
			case p2_battle
			case p2_faceoff
			case p2_pro_faceoff
			is_head_to_head = true
		endswitch
		if NOT is_current_band_vanhalen band = <band>
			return part = <part> real_part = <real_part>
		endif
		if (<is_head_to_head> = true)
			return part = <part> real_part = <real_part>
		endif
	endif
	printf qs(0x67a3dcdd) a = <band> b = <part> donotresolve
	switch <part>
		case rhythm
		case bass
		character_replacing_id = ($<band>.bassist)
		case drum
		character_replacing_id = ($<band>.drummer)
		case vocals
		character_replacing_id = ($<band>.vocalist)
		case guitar
		character_replacing_id = ($<band>.guitarist)
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
	printf qs(0x73d0bcc4) a = <character_replacing_id>
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
				character_id = ($<band>.drummer)
			}
			printf channel = band qs(0x96d977ed) a = ($<band>.drummer)
		endif
	endif
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
		return
	endif
	if ($boss_battle = 1)
		return
	endif
	added_cpu_vocalist = false
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
				printf channel = band qs(0xed8adc31) a = <singer_id>
				added_cpu_vocalist = true
			endif
		endif
	endif
	if NOT band_builder_is_full
		if NOT band_builder_has_part \{part = bass}
			random_bassist = false
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
				bassist_id = ($<band>.bassist)
			endif
			band_builder_add_member {
				part = bass
				real_part = bass
				character_id = <bassist_id>
			}
			printf channel = band qs(0xc7bea81d) a = <bassist_id>
		endif
	endif
	if NOT band_builder_is_full
		if NOT band_builder_has_part \{part = guitar}
			random_guitarist = false
			if has_singing_guitarist <...>
				if ($<band>.guitarist = jimi)
					if ($current_transition = intro_jimi)
						random_guitarist = true
					else
						return
					endif
				else
					if gotparam \{singer_id}
						if (<singer_id> = ($<band>.guitarist))
							random_guitarist = true
						endif
					endif
				endif
			endif
			if (<random_guitarist> = true)
				guitarist_id = randomcharacter
			else
				guitarist_id = ($<band>.guitarist)
			endif
			band_builder_add_member {
				part = guitar
				real_part = guitar
				character_id = <guitarist_id>
			}
			printf channel = band qs(0xd9dcf4e2) a = <guitarist_id>
		endif
	endif
endscript

script has_singing_guitarist 
	guitarist = ($<band>.guitarist)
	vocalist = ($<band>.vocalist)
	switch <vocalist>
		case dlr_guitar
		case dlr_alt_guitar
		return \{true}
	endswitch
	if (<guitarist> != <vocalist>)
		return \{false}
	endif
	if (<guitarist> = randomcharacter || <guitarist> = randommale || <guitarist> = randomfemale)
		return \{false}
	endif
	if (<vocalist> = randomcharacter || <vocalist> = randommale || <vocalist> = randomfemale)
		return \{false}
	endif
	return \{true}
endscript

script has_singing_bassist 
	bassist = ($<band>.bassist)
	vocalist = ($<band>.vocalist)
	if (<vocalist> = lemmy)
		return \{true}
	endif
	if (<bassist> != <vocalist>)
		return \{false}
	endif
	if (<bassist> = randomcharacter || <bassist> = randommale || <bassist> = randomfemale)
		return \{false}
	endif
	if (<vocalist> = randomcharacter || <vocalist> = randommale || <vocalist> = randomfemale)
		return \{false}
	endif
	return \{true}
endscript

script is_current_band_vanhalen 
	if NOT gotparam \{band}
		get_band_name song = ($current_song)
	endif
	switch <band>
		case band_vanhalen
		case band_vanhalen_dlr_guitar
		case band_vanhalen_eddie_drill
		case band_vanhalen_wolf_drill
		case band_vanhalen_alt
		case band_vanhalen_eddie_alt_drill
		case band_vanhalen_dlr_alt_guitar
		return \{true}
	endswitch
	return \{false}
endscript

script is_vanhalen_song 
	if NOT gotparam \{song}
		song = ($current_song)
	endif
	get_song_struct song = <song>
	if structurecontains structure = <song_struct> band
		band = (<song_struct>.band)
		switch <band>
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
	return \{false}
endscript

script is_guitaronly_song 
	if NOT gotparam \{song}
		song = ($current_song)
	endif
	get_song_struct song = <song>
	if structurecontains structure = ($gh_songlist_props.<song>) guitar_only
		if ($gh_songlist_props.<song>.guitar_only = guitar)
			return \{true}
		endif
	endif
	return \{false}
endscript

script band_builder_get_band_global 
	if ($jam_mode_band = 1)
		return \{band = jam_mode_band_profiles}
	endif
	if is_current_band_vanhalen
		get_band_name song = ($current_song)
		return band = <band>
	endif
	if NOT ($use_worst_band = 0)
		if ($use_worst_band = male)
			return \{band = worst_male_band}
		else
			return \{band = worst_female_band}
		endif
	endif
	get_band_name song = ($current_song)
	return band = <band>
endscript

script get_band_name 
	get_song_struct song = <song>
	if structurecontains structure = <song_struct> band
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
			band = default_band
			if is_vanhalen_song
				if ($cheat_altband = 1)
					band = band_alex_headtohead_alt
				else
					band = band_alex_headtohead
				endif
			endif
			return band = <band>
		else
			band = (<song_struct>.band)
			if is_vanhalen_song song = <song>
				if (($cheat_altband = 1) || (($current_gig_number) = 10))
					switch (<band>)
						case band_vanhalen_eddie_drill
						band = band_vanhalen_eddie_alt_drill
						case band_vanhalen_dlr_guitar
						band = band_vanhalen_dlr_alt_guitar
						default
						band = band_vanhalen_alt
					endswitch
				endif
			endif
			return band = <band>
		endif
	else
		return \{band = default_band}
	endif
endscript

script band_builder_get_cpu_singer_id \{always_random = false}
	get_song_struct song = ($current_song)
	band_builder_get_band_global
	singer = male
	if structurecontains structure = <song_struct> singer
		singer = (<song_struct>.singer)
	endif
	if (<singer> = none)
		return \{false}
	endif
	singer_id = ($<band>.vocalist)
	if (<singer_id> = none)
		return \{false}
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
	printf \{channel = kim
		qs(0x44466f76)}
	getstarttime
	band_builder_clear_setup
	band_builder_add_players
	band_builder_fixup_random_human_player_names
	band_builder_add_cpu_characters
	band_builder_fill_in_random_characters
	band_builder_decide_on_heaps
	printstruct ($band_builder_current_setup)
	getarraysize \{$band_builder_current_setup}
	if (<array_size> > 0)
		i = 0
		begin
		band_builder_create_character index = <i> async = <async>
		i = (<i> + 1)
		repeat <array_size>
	endif
	band_load_anim_paks async = <async>
	getelapsedtime starttime = <starttime>
	elapsedtime = (<elapsedtime> / 1000.0)
	printf 'band_builder_create_band took %f seconds' f = <elapsedtime>
	if (<async> = 1)
		if gotparam \{min_time}
			timeleft = (<min_time> - <elapsedtime>)
			if (<timeleft> > 0.0)
				printf 'Waiting an extra %f seconds...' f = <timeleft>
				wait <timeleft> seconds
			endif
		endif
	endif
	get_song_prefix \{song = $current_song}
	formattext checksumname = fretbar_array '%s_fretbars' s = <song_prefix> addtostringlookup
	if globalexists name = <fretbar_array> type = array
		getarraysize $<fretbar_array>
		if (<array_size> > 0)
			change structurename = player1_status current_song_beat_time = ($<fretbar_array> [1])
		endif
	endif
	band_start_anims
endscript

script band_builder_create_character \{async = 0}
	create_func = (($band_builder_current_setup [<index>]).create_func)
	character_id = (($band_builder_current_setup [<index>]).character_id)
	name = (($band_builder_current_setup [<index>]).name)
	asset_heap = (($band_builder_current_setup [<index>]).asset_heap)
	savegame = (($band_builder_current_setup [<index>]).savegame)
	if structurecontains structure = ($band_builder_current_setup [<index>]) player_status
		player_status = (($band_builder_current_setup [<index>]).player_status)
	else
		removeparameter \{player_status}
	endif
	if gotparam \{player_status}
		change structurename = <player_status> band_member = <name>
	endif
	printf qs(0x7d803982) a = <name>
	<create_func> {
		name = <name>
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
	getarraysize \{$band_builder_current_setup}
	if (<array_size> > 0)
		i = 0
		begin
		if structurecontains structure = ($band_builder_current_setup [<i>]) player_status
			addarrayelement array = <array> element = (($band_builder_current_setup [<i>]).part)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return human_players = <array>
endscript

script maybe_use_song_or_venue_specific_instrument 
	if is_current_band_vanhalen
		switch <name>
			case eddie_van_halen_alt2
			name = eddie_van_halen2
			case wolfgang_van_halen_alt2
			name = wolfgang_van_halen2
			case alex_van_halen_alt2
			name = alex_van_halen2
			case david_lee_roth_alt2
			name = david_lee_roth2
		endswitch
		if structurecontains structure = $venue_specific_instrument_data <venue>
			if structurecontains structure = ($venue_specific_instrument_data.<venue>) <name>
				printf channel = bort qs(0x52018272) a = <venue> b = <name>
				instrument_struct_venue = ($venue_specific_instrument_data.<venue>.<name>)
				appearance = {<appearance> <instrument_struct_venue>}
			endif
		endif
		if structurecontains structure = $song_specific_instrument_data <song>
			if structurecontains structure = ($song_specific_instrument_data.<song>) <name>
				printf qs(0x37c5b70d) a = <song> b = <name>
				instrument_struct_song = ($song_specific_instrument_data.<song>.<name>)
				appearance = {<appearance> <instrument_struct_song>}
				alt_set_guitar_string_props info_struct = guitarist_info new_instrument = <instrument_struct_song>
			endif
		endif
	endif
	return appearance = <appearance>
endscript
