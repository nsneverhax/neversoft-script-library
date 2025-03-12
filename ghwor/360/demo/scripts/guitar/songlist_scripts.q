disable_downloaded_songs = 0
artist_text_by = qs(0x84df5648)
artist_text_from = qs(0xb2c93b23)
artist_text_as_made_famous_by = qs(0x85b4481b)
cover_artist_text = qs(0x13c0666a)
cover_artist_text_by = qs(0x00000000)

script get_song_original_artist \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		return original_artist = ($gh_songlist_props.<song>.original_artist)
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_title \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		return song_title = ($gh_songlist_props.<song>.title)
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_prefix \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		return song_prefix = ($gh_songlist_props.<song>.name)
	endif
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_name \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		return song_name = ($gh_songlist_props.<song>.name)
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_name_no_assert \{song = invalid}
	<ret> = false
	if faststructurecontains structure = $gh_songlist_props name = <song>
		addparam structure_name = return_struct name = song_name value = ($gh_songlist_props.<song>.name)
		<ret> = true
	endif
	return <ret> <return_struct>
endscript

script get_song_title_no_assert \{song = invalid}
	<ret> = false
	if faststructurecontains structure = $gh_songlist_props name = <song>
		addparam structure_name = return_struct name = song_name value = ($gh_songlist_props.<song>.title)
		<ret> = true
	endif
	return <ret> <return_struct>
endscript

script get_song_artist \{song = invalid
		with_year = 1}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		if (<with_year>)
			formattext textname = song_artist qs(0x69a0e5e0) a = ($gh_songlist_props.<song>.artist) y = ($gh_songlist_props.<song>.year)
			return song_artist = <song_artist>
		else
			return song_artist = ($gh_songlist_props.<song>.artist)
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_album_img \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		if structurecontains structure = ($gh_songlist_props.<song>) album_img
			return song_album_img = ($gh_songlist_props.<song>.album_img)
		else
			return \{song_album_img = placeholder_album}
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_artist_text \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		return song_artist_text = ($gh_songlist_props.<song>.artist_text)
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_year_text \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		formattext textname = song_year_text qs(0x5ab9cf0a) y = ($gh_songlist_props.<song>.year)
		return song_year_text = <song_year_text>
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_year \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		return year = ($gh_songlist_props.<song>.year)
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_cover_artist_text \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		if structurecontains structure = ($gh_songlist_props.<song>) covered_by
			return cover_artist_text = ($gh_songlist_props.<song>.covered_by)
		else
			return \{cover_artist_text = qs(0x03ac90f0)}
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_covered_by_text \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		if structurecontains structure = ($gh_songlist_props.<song>) covered_by_text
			return covered_by_text = ($gh_songlist_props.<song>.covered_by_text)
		else
			return \{covered_by_text = qs(0x03ac90f0)}
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_genre_text 
	<continue> = 0
	if gotparam \{genre}
		<continue> = 1
		<switch_var> = <genre>
	elseif faststructurecontains structure = $gh_songlist_props name = <song>
		<continue> = 1
		<switch_var> = ($gh_songlist_props.<song>.genre)
	endif
	if (<continue> = 1)
		if NOT structurecontains structure = $song_genre_list <switch_var>
			switch_var = other
		endif
	endif
	if NOT gotparam \{switch_var}
		printstruct <...>
		printf \{qs(0x0ebc33db)}
		switch_var = other
	endif
	return genre = ($song_genre_list.<switch_var>.genre_string + qs(0x03ac90f0))
endscript

script get_unlock_description_text \{song = !q1768515945}
	if faststructurecontains structure = ($gh_songlist_props.<song>) name = unlock_description_text
		<unlock_checksum> = ($gh_songlist_props.<song>.unlock_description_text)
		return unlock_description_text = ($<unlock_checksum>)
	else
		scriptassert qs(0x3e195018) s = ($gh_songlist_props.<song>.title)
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

script is_any_player_on_part 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <player> part = <part>
			return \{true}
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	return \{false}
endscript

script get_song_struct \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		return song_struct = ($gh_songlist_props.<song>)
	endif
	scriptassert \{qs(0x0ebc33db)}
endscript

script is_song_downloaded \{song_checksum = schoolsout}
	if faststructurecontains structure = ($download_songlist_props) name = <song_checksum>
		if ($disable_downloaded_songs = 0)
			formattext textname = filename 'a%s_1.fsb' s = (($download_songlist_props.<song_checksum>).name)
			contentfoldermanager func = get_content_folder_index_from_file file = <filename>
			if (<device> = content && <status> = undamaged)
				formattext textname = filename 'b%s_song.pak' s = (($download_songlist_props.<song_checksum>).name)
				contentfoldermanager func = get_content_folder_index_from_file file = <filename>
				if (<device> = content && <status> = undamaged)
					return \{download = 1
						patched = 1
						true}
				else
					return \{download = 1
						patched = 0
						false}
				endif
			else
				return \{download = 1
					patched = 0
					false}
			endif
		else
			return \{download = 1
				patched = 0
				false}
		endif
	else
		return \{download = 0
			patched = 0
			true}
	endif
endscript

script is_song_locked \{song = !q1768515945
		savegame = !i1768515945}
	if demobuild
		return \{false}
	endif
	<on_disc_song> = 0
	<global_on_disc_array_name> = ($on_disc_list)
	if arraycontains array = $<global_on_disc_array_name> contains = <song>
		<on_disc_song> = 1
	endif
	if (<on_disc_song> = 1)
		getglobaltags <song> savegame = <savegame> param = unlocked
		if NOT innetgame
			if (<unlocked> = 0)
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script is_song_in_jammode_songlist 
	requireparams \{[
			song
		]
		all}
	getarraysize \{$jammode_songlist}
	if (<array_size> > 0)
		<i> = 0
		begin
		if (<song> = (($jammode_songlist) [<i>]))
			return \{true}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	getarraysize \{$example_jam_songlist}
	if (<array_size> > 0)
		<i> = 0
		begin
		if (<song> = (($example_jam_songlist) [<i>]))
			return \{true}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script song_has_ingame_video 
	if faststructurecontains structure = $gh_songlist_props name = <song>
		if structurecontains structure = ($gh_songlist_props.<song>) ingame_video
			return true ingame_video = ($gh_songlist_props.<song>.ingame_video)
		else
			return \{false}
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script song_has_delayed_intro 
	if faststructurecontains structure = $gh_songlist_props name = <song>
		if structurecontains structure = ($gh_songlist_props.<song>) has_delayed_intro
			if (($gh_songlist_props.<song>.has_delayed_intro) = 0)
				return false has_delayed_intro = ($gh_songlist_props.<song>.has_delayed_intro)
			else
				return true has_delayed_intro = ($gh_songlist_props.<song>.has_delayed_intro)
			endif
		else
			return \{false
				has_delayed_intro = 0}
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script song_alpha_in_highway 
	if faststructurecontains structure = $gh_songlist_props name = <song>
		if structurecontains structure = ($gh_songlist_props.<song>) alpha_in_highway
			if (($gh_songlist_props.<song>.alpha_in_highway) = 0)
				return \{false}
			else
				return \{true}
			endif
		else
			return \{false}
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_rhythm_track \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		if structurecontains structure = ($gh_songlist_props.<song>) rhythm_track
			return rhythm_track = ($gh_songlist_props.<song>.rhythm_track)
		else
			return \{rhythm_track = 0}
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_difficulty_ratings \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
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
		elseif structurecontains structure = ($gh_songlist_props.<song>) guitar_difficulty_rating
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
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_saved_in_globaltags \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		if faststructurecontains structure = ($gh_songlist_props.<song>) name = saved_in_globaltags
			return saved_in_globaltags = ($gh_songlist_props.<song>.saved_in_globaltags)
		else
			return \{saved_in_globaltags = 1}
		endif
	endif
	scriptassert qs(0x10788126) s = <song>
endscript

script get_song_allowed_in_quickplay \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		if faststructurecontains structure = ($gh_songlist_props.<song>) name = allowed_in_quickplay
			return allowed_in_quickplay = ($gh_songlist_props.<song>.allowed_in_quickplay)
		else
			return \{allowed_in_quickplay = 1}
		endif
	endif
	scriptassert \{qs(0x0ebc33db)}
endscript
current_song_version = gh6

script get_song_version \{song = invalid}
	if faststructurecontains structure = $gh_songlist_props name = <song>
		if faststructurecontains structure = ($gh_songlist_props.<song>) name = version
			return song_version = ($gh_songlist_props.<song>.version)
		else
			return song_version = ($current_song_version)
		endif
	endif
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_drum_kit_index \{song = invalid}
	if is_current_song_a_jam_session
		return \{drum_kit_index = 0}
	endif
	if faststructurecontains structure = $gh_songlist_props name = <song>
		drum_kit_type = ($gh_songlist_props.<song>.drum_kit)
		getarraysize ($drum_kits)
		drum_kit_index = 0
		begin
		if (<drum_kit_type> = $drum_kits [<drum_kit_index>].string_id)
			break
		endif
		drum_kit_index = (<drum_kit_index> + 1)
		repeat <array_size>
		if (<drum_kit_index> >= <array_size>)
			<drum_kit_index> = 0
			printf \{qs(0x547595c8)}
		endif
		return drum_kit_index = <drum_kit_index>
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_source \{song_name = !q1768515945}
	source = unknown
	source_txt = qs(0xe3f67499)
	getterritory
	fastgetarraysize \{array = $gh_songlist}
	if (<array_size> > 0)
		i = 0
		begin
		props = (($gh_songlist [<i>]).props)
		if faststructurecontains structure = $<props> name = <song_name>
			<source> = (($gh_songlist [<i>]).crc)
			<source_txt> = (($gh_songlist [<i>]).frontend_desc)
			if (<territory> != territory_us)
				if faststructurecontains structure = ($gh_songlist [<i>]) name = frontend_desc_eu
					<source_txt> = (($gh_songlist [<i>]).frontend_desc_eu)
				endif
			endif
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return source = <source> source_txt = <source_txt>
endscript

script find_song_encryption_type 
	requireparams \{[
			song_name
			song_list
		]
		all}
	getarraysize (<song_list>)
	if (0 < <array_size>)
		i = 0
		begin
		props = ((<song_list> [<i>]).props)
		if structurecontains structure = $<props> <song_name>
			if structurecontains structure = (<song_list> [<i>]) encryption_type
				printf qs(0xa5e9b9b0) s = <song_name> f = ((<song_list> [<i>]).frontend_desc) d = ((<song_list> [<i>]).encryption_type)
				return encryption_type = ((<song_list> [<i>]).encryption_type)
			else
				return encryption_type = <encryption_type>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	printf qs(0x28b4620c) s = <song_name>
	return encryption_type = <encryption_type>
endscript

script get_song_encryption_type 
	requireparams \{[
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
	getplayerinfo <player> part
	getsonginfo
	switch (<part>)
		case drum
		if (<drums_difficulty_rating> = 0)
			printf \{qs(0x743c8e0c)}
			setplayerinfo <player> force_freeform = 1
		endif
		case vocals
		if (<vocals_difficulty_rating> = 0)
			printf \{qs(0x0e210b39)}
			setplayerinfo <player> force_freeform = 1
		endif
	endswitch
endscript

script guts_check_song_for_zero_difficulty \{song = invalid}
	getplayerinfo <player> part
	setplayerinfo <player> force_freeform = 0
	if (<song> = jamsession)
		musicstudio_check_song_for_zero_difficulty <...>
	else
		switch (<part>)
			case guitar
			if (<guitar_difficulty_rating> = 0)
				setplayerinfo <player> part = bass
			endif
			case bass
			if (<bass_difficulty_rating> = 0)
				setplayerinfo <player> part = guitar
			endif
			case drum
			if (<drums_difficulty_rating> = 0)
				setplayerinfo <player> force_freeform = 1
			endif
			case vocals
			if (<vocals_difficulty_rating> = 0)
				setplayerinfo <player> force_freeform = 1
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
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script setup_instrument_stored_part 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> part
		setplayerinfo <player> stored_part = <part>
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script restore_player_part_settings 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		setplayerinfo <player> force_freeform = 0
		getplayerinfo <player> stored_part
		setplayerinfo <player> part = <stored_part>
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script copy_parts_to_stored_parts 
	player = 1
	begin
	getplayerinfo <player> part
	setplayerinfo <player> stored_part = <part>
	player = (<player> + 1)
	repeat 4
endscript

script any_song_has_double_kick 
	if demobuild
		if ($g_kiosk_demo = 1)
			return \{false}
		endif
	endif
	getsonglistsize
	i = 0
	begin
	getsonglistchecksum index = <i>
	get_song_struct song = <song_checksum>
	if is_song_downloaded song_checksum = <song_checksum>
		if structurecontains structure = <song_struct> double_kick
			if ((<song_struct>.double_kick) = 1)
				return \{true}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script songevent_display_songname_and_artist \{songchecksum = nothing}
	printf qs(0x73307931) s = <songchecksum>
endscript
