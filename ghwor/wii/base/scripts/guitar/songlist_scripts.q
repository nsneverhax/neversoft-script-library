disable_downloaded_songs = 0
artist_text_by = qs(0x84df5648)
artist_text_from = qs(0xb2c93b23)
artist_text_as_made_famous_by = qs(0x85b4481b)
cover_artist_text = qs(0x13c0666a)
cover_artist_text_by = qs(0x00000000)

script get_song_original_artist \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		return original_artist = ($gh_songlist_props.<song>.original_artist)
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script get_song_title \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		return song_title = ($gh_songlist_props.<song>.title)
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script get_song_prefix \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		return song_prefix = ($gh_songlist_props.<song>.Name)
	endif
	if dlcmanagerfunc func = get_content_prefix content_name = <song>
		return song_prefix = <content_prefix>
	endif
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script get_song_name \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		return song_name = ($gh_songlist_props.<song>.Name)
	endif
	if dlcmanagerfunc func = get_content_prefix content_name = <song>
		return song_prefix = <content_prefix>
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script get_song_title_no_assert \{song = invalid}
	<ret> = FALSE
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		AddParam structure_name = return_struct Name = song_name value = ($gh_songlist_props.<song>.title)
		<ret> = true
	endif
	return <ret> <return_struct>
endscript

script get_song_artist \{song = invalid
		with_year = 1}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		if (<with_year>)
			formatText TextName = song_artist qs(0x69a0e5e0) a = ($gh_songlist_props.<song>.artist) y = ($gh_songlist_props.<song>.year)
			return song_artist = <song_artist>
		else
			return song_artist = ($gh_songlist_props.<song>.artist)
		endif
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script get_song_artist_text \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		return song_artist_text = ($gh_songlist_props.<song>.artist_text)
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script get_song_year \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		return year = ($gh_songlist_props.<song>.year)
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script get_cover_artist_text \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		if StructureContains structure = ($gh_songlist_props.<song>) covered_by
			return \{cover_artist_text = qs(0x13c0666a)}
		else
			return \{cover_artist_text = qs(0x03ac90f0)}
		endif
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script get_covered_by_text \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		if StructureContains structure = ($gh_songlist_props.<song>) covered_by_text
			return \{covered_by_text = qs(0x03ac90f0)}
		else
			return \{covered_by_text = qs(0x03ac90f0)}
		endif
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script get_genre_text 
	<continue> = 0
	if GotParam \{genre}
		<continue> = 1
		<switch_var> = <genre>
	elseif faststructurecontains structure = $gh_songlist_props Name = <song>
		<continue> = 1
		<switch_var> = ($gh_songlist_props.<song>.genre)
	endif
	if (<continue> = 1)
		if NOT StructureContains structure = $song_genre_list <switch_var>
			switch_var = other
		endif
	endif
	if NOT GotParam \{switch_var}
		printstruct <...>
		printf \{qs(0x0ebc33db)}
		switch_var = other
	endif
	return genre = ($song_genre_list.<switch_var>.genre_string + qs(0x03ac90f0))
endscript

script get_unlock_description_text \{song = !q1768515945}
	if faststructurecontains structure = ($gh_songlist_props.<song>) Name = unlock_description_text
		<unlock_checksum> = ($gh_songlist_props.<song>.unlock_description_text)
		return unlock_description_text = ($<unlock_checksum>)
	else
		ScriptAssert qs(0x3e195018) s = ($gh_songlist_props.<song>.title)
	endif
endscript
perf2_settings = [
	{
		song = today
		mode = career
		char_type = vocalist
		char_id = billy
	}
	{
		song = demolitionman
		mode = career
		char_type = vocalist
		char_id = randomcharacter
	}
	{
		song = today
		mode = career
		char_type = vocalist
		char_id = billy
	}
	{
		song = demolitionman
		mode = career
		char_type = vocalist
		char_id = randomcharacter
	}
	{
		song = today
		mode = career
		char_type = vocalist
		char_id = billy
	}
	{
		song = demolitionman
		mode = career
		char_type = vocalist
		char_id = randomcharacter
	}
]

script get_song_performance 
	return \{song_performance = 0}
endscript

script get_song_struct \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		return song_struct = ($gh_songlist_props.<song>)
	endif
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script is_song_downloaded \{song_checksum = schoolsout}
	if faststructurecontains structure = ($download_songlist_props) Name = <song_checksum>
		if ($disable_downloaded_songs = 0)
			<song_struct> = ($download_songlist_props.<song_checksum>)
			<song_name> = (<song_struct>.Name)
			if NOT StructureContains structure = (<song_struct>) never_show_in_setlist
				if StructureContains structure = (<song_struct>) patch_id
					<patch_ok> = 0
					if dlcmanagerfunc func = get_content_state content_name = (<song_struct>.patch_id)
						if (<content_state> = present || <content_state> = archived)
							<patch_ok> = 1
							if (<content_state> = archived)
								<patch_on_sd> = 1
							endif
						endif
					endif
				endif
				dlcmanagerfunc func = get_content_state prefix = <song_name>
				if (<content_state> = present || <content_state> = archived)
					if (<content_state> = archived)
						<on_sd> = 1
					endif
					if GotParam \{patch_ok}
						if (<patch_ok> = 1)
							get_savegame_from_controller controller = ($primary_controller)
							GetGlobalTags user_options savegame = <savegame> param = disable_dlc
							if (<disable_dlc> = 1)
								return \{download = 1
									patched = 1
									FALSE}
							endif
							return download = 1 patched = 1 content_on_sd = <on_sd> patch_on_sd = <patch_on_sd> true
						else
							return download = 1 patched = 0 content_on_sd = <on_sd> patch_on_sd = <patch_on_sd> FALSE
						endif
					else
						GetGlobalTags user_options savegame = <savegame> param = disable_dlc
						if (<disable_dlc> = 1)
							return \{download = 1
								patched = 1
								FALSE}
						endif
						return download = 1 patched = 1 content_on_sd = <on_sd> true
					endif
				else
					return download = 1 patched = 0 content_on_sd = <patch_on_sd> FALSE
				endif
			else
				return \{download = 1
					patched = 0
					FALSE}
			endif
		else
			return \{download = 1
				patched = 0
				FALSE}
		endif
	else
		return \{download = 0
			patched = 0
			true}
	endif
endscript

script is_song_locked \{song = !q1768515945
		savegame = !i1768515945}
	<on_disc_song> = 0
	<global_on_disc_array_name> = ($on_disc_list)
	if ArrayContains array = $<global_on_disc_array_name> contains = <song>
		<on_disc_song> = 1
	endif
	if (<on_disc_song> = 1)
		GetGlobalTags <song> savegame = <savegame> param = unlocked
		if NOT InNetGame
			if (<unlocked> = 0)
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script is_song_in_jammode_songlist 
	RequireParams \{[
			song
		]
		all}
	GetArraySize \{$jammode_songlist}
	if (<array_Size> > 0)
		<i> = 0
		begin
		if (<song> = (($jammode_songlist) [<i>]))
			return \{true}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	GetArraySize \{$example_jam_songlist}
	if (<array_Size> > 0)
		<i> = 0
		begin
		if (<song> = (($example_jam_songlist) [<i>]))
			return \{true}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script song_has_delayed_intro 
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		if StructureContains structure = ($gh_songlist_props.<song>) has_delayed_intro
			if (($gh_songlist_props.<song>.has_delayed_intro) = 0)
				return FALSE has_delayed_intro = ($gh_songlist_props.<song>.has_delayed_intro)
			else
				return true has_delayed_intro = ($gh_songlist_props.<song>.has_delayed_intro)
			endif
		else
			return \{FALSE
				has_delayed_intro = 0}
		endif
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script song_alpha_in_highway 
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		if StructureContains structure = ($gh_songlist_props.<song>) alpha_in_highway
			if (($gh_songlist_props.<song>.alpha_in_highway) = 0)
				return \{FALSE}
			else
				return \{true}
			endif
		else
			return \{FALSE}
		endif
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script get_song_difficulty_ratings \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		if (<song> = jamsession)
			getsonginfo
			guitar_difficulty_rating = 1
			bass_difficulty_rating = 1
			vocals_difficulty_rating = 1
			drums_difficulty_rating = 1
			band_difficulty_rating = 1
			if (<playback_track1> < 0)
				guitar_difficulty_rating = 0
			endif
			if (<playback_track2> < 0)
				bass_difficulty_rating = 0
			endif
			if (<playback_track_drums> < 1)
				drums_difficulty_rating = 0
			endif
			if (<playback_track_vocals> < 1)
				vocals_difficulty_rating = 0
			endif
			band_difficulty_rating = 0
		elseif StructureContains structure = ($gh_songlist_props.<song>) guitar_difficulty_rating
			guitar_difficulty_rating = ($gh_songlist_props.<song>.guitar_difficulty_rating)
			bass_difficulty_rating = ($gh_songlist_props.<song>.bass_difficulty_rating)
			vocals_difficulty_rating = ($gh_songlist_props.<song>.vocals_difficulty_rating)
			drums_difficulty_rating = ($gh_songlist_props.<song>.drums_difficulty_rating)
			band_difficulty_rating = ($gh_songlist_props.<song>.band_difficulty_rating)
		else
			guitar_difficulty_rating = 0
			bass_difficulty_rating = 0
			vocals_difficulty_rating = 0
			drums_difficulty_rating = 0
			band_difficulty_rating = 0
		endif
		return {
			guitar_difficulty_rating = <guitar_difficulty_rating>
			bass_difficulty_rating = <bass_difficulty_rating>
			vocals_difficulty_rating = <vocals_difficulty_rating>
			drums_difficulty_rating = <drums_difficulty_rating>
			band_difficulty_rating = <band_difficulty_rating>
		}
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script get_song_saved_in_globaltags \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		if faststructurecontains structure = ($gh_songlist_props.<song>) Name = saved_in_globaltags
			return saved_in_globaltags = ($gh_songlist_props.<song>.saved_in_globaltags)
		else
			return \{saved_in_globaltags = 1}
		endif
	endif
	ScriptAssert qs(0x10788126) s = <song>
endscript

script get_song_allowed_in_quickplay \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		if faststructurecontains structure = ($gh_songlist_props.<song>) Name = allowed_in_quickplay
			return allowed_in_quickplay = ($gh_songlist_props.<song>.allowed_in_quickplay)
		else
			return \{allowed_in_quickplay = 1}
		endif
	endif
	ScriptAssert \{qs(0x0ebc33db)}
endscript
current_song_version = gh6

script get_song_drum_kit_index \{song = invalid}
	if is_current_song_a_jam_session
		return drum_kit_index = 0 drum_kit_type = ($drum_kits [0].string_id)
	endif
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		drum_kit_type = ($gh_songlist_props.<song>.drum_kit)
		GetArraySize ($drum_kits)
		drum_kit_index = 0
		begin
		if stringequals a = <drum_kit_type> b = ($drum_kits [<drum_kit_index>].string_id)
			break
		endif
		drum_kit_index = (<drum_kit_index> + 1)
		repeat <array_Size>
		if (<drum_kit_index> >= <array_Size>)
			<drum_kit_index> = 0
			printf \{qs(0x547595c8)}
		endif
		return drum_kit_index = <drum_kit_index> drum_kit_type = <drum_kit_type>
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script get_song_source \{song_name = !q1768515945}
	Source = unknown
	source_txt = qs(0xe3f67499)
	getterritory
	fastgetarraysize \{array = $gh_songlist}
	if (<array_Size> > 0)
		i = 0
		begin
		props = (($gh_songlist [<i>]).props)
		if faststructurecontains structure = $<props> Name = <song_name>
			<Source> = (($gh_songlist [<i>]).crc)
			<source_txt> = (($gh_songlist [<i>]).frontend_desc)
			if (<territory> != territory_us)
				if faststructurecontains structure = ($gh_songlist [<i>]) Name = frontend_desc_eu
					<source_txt> = (($gh_songlist [<i>]).frontend_desc_eu)
				endif
			endif
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return Source = (<Source>) source_txt = (<source_txt>)
endscript

script find_song_encryption_type 
	RequireParams \{[
			song_name
			song_list
		]
		all}
	GetArraySize (<song_list>)
	if (0 < <array_Size>)
		i = 0
		begin
		props = ((<song_list> [<i>]).props)
		if StructureContains structure = $<props> <song_name>
			if StructureContains structure = (<song_list> [<i>]) encryption_type
				printf qs(0xa5e9b9b0) s = <song_name> f = ((<song_list> [<i>]).frontend_desc) d = ((<song_list> [<i>]).encryption_type)
				return encryption_type = ((<song_list> [<i>]).encryption_type)
			else
				return encryption_type = <encryption_type>
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	printf qs(0x28b4620c) s = <song_name>
	return encryption_type = <encryption_type>
endscript

script get_song_encryption_type 
	RequireParams \{[
			song_name
		]
		all}
	encryption_type = 0
	find_song_encryption_type song_name = <song_name> song_list = $gh_songlist
	if (<encryption_type> = 0)
		encryption_type = 4
		find_song_encryption_type song_name = <song_name> song_list = $additional_songlist
	endif
	return encryption_type = <encryption_type>
endscript

script musicstudio_check_song_for_zero_difficulty 
	getplayerinfo <Player> part
	getsonginfo
	switch (<part>)
		case drum
		if (<drums_difficulty_rating> = 0)
			printf \{qs(0x743c8e0c)}
			setplayerinfo <Player> force_freeform = 1
		endif
		case vocals
		if (<vocals_difficulty_rating> = 0)
			printf \{qs(0x0e210b39)}
			setplayerinfo <Player> force_freeform = 1
		endif
	endswitch
endscript

script guts_check_song_for_zero_difficulty \{song = invalid}
	getplayerinfo <Player> part
	setplayerinfo <Player> force_freeform = 0
	if (<song> = jamsession)
		musicstudio_check_song_for_zero_difficulty <...>
	else
		switch (<part>)
			case guitar
			if (<guitar_difficulty_rating> = 0)
				setplayerinfo <Player> part = bass
			endif
			case bass
			if (<bass_difficulty_rating> = 0)
				setplayerinfo <Player> part = guitar
			endif
			case drum
			if (<drums_difficulty_rating> = 0)
				setplayerinfo <Player> force_freeform = 1
			endif
			case vocals
			if (<vocals_difficulty_rating> = 0)
				setplayerinfo <Player> force_freeform = 1
			endif
		endswitch
	endif
endscript

script single_player_check_song_for_zero_difficulty \{song = invalid}
	if (<song> = invalid)
		playlist_getcurrentsong
		song = <current_song>
	endif
	get_song_difficulty_ratings song = <song>
	guts_check_song_for_zero_difficulty <...>
endscript

script check_song_for_zero_difficulty \{song = invalid}
	get_song_difficulty_ratings song = <song>
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		guts_check_song_for_zero_difficulty <...>
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script setup_instrument_stored_part 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> part
		setplayerinfo <Player> stored_part = <part>
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script restore_player_part_settings 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		setplayerinfo <Player> force_freeform = 0
		getplayerinfo <Player> stored_part
		setplayerinfo <Player> part = <stored_part>
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script get_song_duration_secs 
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		return song_duration_secs = ($gh_songlist_props.<song>.Duration)
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script get_song_genre \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props Name = <song>
		return genre = ($gh_songlist_props.<song>.genre)
	endif
	printstruct <...>
	ScriptAssert \{qs(0x0ebc33db)}
endscript

script is_dlc_enabled 
	get_savegame_from_controller controller = ($primary_controller)
	GetGlobalTags user_options savegame = <savegame> param = disable_dlc
	if (<disable_dlc> = 1)
		return \{FALSE}
	endif
	return \{true}
endscript

script copy_parts_to_stored_parts 
	Player = 1
	begin
	getplayerinfo <Player> part
	setplayerinfo <Player> stored_part = <part>
	Player = (<Player> + 1)
	repeat 4
endscript

script any_song_has_double_kick 
	if demobuild
		if ($g_kiosk_demo = 1)
			return \{FALSE}
		endif
	endif
	getsonglistsize
	i = 0
	begin
	getsonglistchecksum index = <i>
	get_song_struct song = <song_checksum>
	if is_song_downloaded song_checksum = <song_checksum>
		if StructureContains structure = <song_struct> double_kick
			if ((<song_struct>.double_kick) = 1)
				return \{true}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript
