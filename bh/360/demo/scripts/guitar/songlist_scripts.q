disable_downloaded_songs = 0

script get_song_original_artist \{song = invalid}
	if structurecontains structure = $gh_songlist_props <song>
		return original_artist = ($gh_songlist_props.<song>.original_artist)
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_title \{song = invalid}
	if structurecontains structure = $gh_songlist_props <song>
		return song_title = ($gh_songlist_props.<song>.title)
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_prefix \{song = invalid}
	if structurecontains structure = $gh_songlist_props <song>
		return song_prefix = ($gh_songlist_props.<song>.name)
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_name \{song = invalid}
	if structurecontains structure = $gh_songlist_props <song>
		return song_name = ($gh_songlist_props.<song>.name)
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_artist \{song = invalid
		with_year = 1}
	if structurecontains structure = $gh_songlist_props <song>
		if (<with_year>)
			formattext textname = song_artist qs(0xfaf915aa) a = ($gh_songlist_props.<song>.artist) y = ($gh_songlist_props.<song>.year)
			return song_artist = <song_artist>
		else
			return song_artist = ($gh_songlist_props.<song>.artist)
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_album_img \{song = invalid}
	if structurecontains structure = $gh_songlist_props <song>
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
	if structurecontains structure = $gh_songlist_props <song>
		return song_artist_text = ($gh_songlist_props.<song>.artist_text)
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_year_text \{song = invalid}
	if structurecontains structure = $gh_songlist_props <song>
		formattext textname = song_year_text qs(0x5ab9cf0a) y = ($gh_songlist_props.<song>.year)
		return song_year_text = <song_year_text>
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_year \{song = invalid}
	if structurecontains structure = $gh_songlist_props <song>
		return year = ($gh_songlist_props.<song>.year)
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_cover_artist_text \{song = invalid}
	if structurecontains structure = $gh_songlist_props <song>
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
	if structurecontains structure = $gh_songlist_props <song>
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
	elseif structurecontains structure = $gh_songlist_props <song>
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
perf2_settings = [
	{
		song = today
		mode = gh4_p1_career
		char_type = vocalist
		char_id = billy
	}
	{
		song = demolitionman
		mode = gh4_p1_career
		char_type = vocalist
		char_id = randomcharacter
	}
	{
		song = today
		mode = gh4_p2_career
		char_type = vocalist
		char_id = billy
	}
	{
		song = demolitionman
		mode = gh4_p2_career
		char_type = vocalist
		char_id = randomcharacter
	}
	{
		song = today
		mode = gh4_p3_career
		char_type = vocalist
		char_id = billy
	}
	{
		song = demolitionman
		mode = gh4_p3_career
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
	if structurecontains structure = $gh_songlist_props <song>
		return song_struct = ($gh_songlist_props.<song>)
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script is_song_downloaded \{song_checksum = schoolsout}
	if structurecontains structure = ($download_songlist_props) <song_checksum>
		if ($disable_downloaded_songs = 0)
			formattext textname = filename 'a%s_1.fsb' s = (($download_songlist_props.<song_checksum>).name)
			getcontentfolderindexfromfile <filename>
			if (<device> = content)
				formattext textname = filename 'b%s_song.pak' s = (($download_songlist_props.<song_checksum>).name)
				getcontentfolderindexfromfile <filename>
				if (<device> = content)
					get_savegame_from_controller controller = ($primary_controller)
					getglobaltags user_options savegame = <savegame> param = disable_dlc
					if (<disable_dlc> = 1)
						return \{download = 1
							patched = 1
							false}
					endif
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
	if structurecontains structure = $gh_songlist_props <song>
		if structurecontains structure = ($gh_songlist_props.<song>) ingame_video
			return true ingame_video = ($gh_songlist_props.<song>.ingame_video)
		else
			return \{false}
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_rhythm_track \{song = invalid}
	if structurecontains structure = $gh_songlist_props <song>
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
	if structurecontains structure = $gh_songlist_props <song>
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
	if structurecontains structure = $gh_songlist_props <song>
		if structurecontains structure = ($gh_songlist_props.<song>) saved_in_globaltags
			return saved_in_globaltags = ($gh_songlist_props.<song>.saved_in_globaltags)
		else
			return \{saved_in_globaltags = 1}
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_allowed_in_quickplay \{song = invalid}
	if structurecontains structure = $gh_songlist_props <song>
		if structurecontains structure = ($gh_songlist_props.<song>) allowed_in_quickplay
			return allowed_in_quickplay = ($gh_songlist_props.<song>.allowed_in_quickplay)
		else
			return \{allowed_in_quickplay = 1}
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript
current_song_version = 0x86cb6945

script get_song_version \{song = invalid}
	if structurecontains structure = $gh_songlist_props <song>
		if structurecontains structure = ($gh_songlist_props.<song>) version
			return song_version = ($gh_songlist_props.<song>.version)
		else
			return song_version = ($current_song_version)
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_drum_kit_index \{song = invalid}
	if is_current_song_a_jam_session
		return \{drum_kit_index = 0}
	endif
	if structurecontains structure = $gh_songlist_props <song>
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
			printscriptinfo \{qs(0x7712eea5)}
		endif
		return drum_kit_index = <drum_kit_index>
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_song_source 
	requireparams \{[
			song_name
		]
		all}
	source = unknown
	source_txt = qs(0xe3f67499)
	getarraysize ($gh_songlist)
	if (<array_size> > 0)
		i = 0
		begin
		props = (($gh_songlist [<i>]).props)
		if structurecontains structure = $<props> <song_name>
			return source = (($gh_songlist [<i>]).crc) source_txt = (($gh_songlist [<i>]).frontend_desc)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return source = <source> source_txt = <source_txt>
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
			endif
			case bass
			if (<bass_difficulty_rating> = 0)
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
		gman_songtool_getcurrentsong
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

script setup_guitar_bass_stored_part 
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
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script 0x83f4a9b9 
	requireparams \{[
			name
		]
		all}
	if arraycontains array = $debug_songlist contains = <name>
		return \{true}
	endif
	return \{false}
endscript

script any_song_has_double_kick 
	if demobuild \{0x52e0628e}
		if ($kiosk_demo = 1)
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
