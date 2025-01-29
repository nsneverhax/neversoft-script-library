permanent_songlist_props = $gh5_songlist_props

script get_song_original_artist \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		return original_artist = ($gh_songlist_props.<song>.original_artist)
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script get_song_title \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		return song_title = ($gh_songlist_props.<song>.title)
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script 0x92cf1447 \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		if StructureContains structure = ($gh_songlist_props.<song>) 0xcd03cf14
			return 0xcb78de9e = ($gh_songlist_props.<song>.0xcd03cf14)
		endif
		return \{0xcb78de9e = qs(0x03ac90f0)}
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script 0x0bc645fd \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		if StructureContains structure = ($gh_songlist_props.<song>) 0x540a9eae
			return 0x52718f24 = ($gh_songlist_props.<song>.0x540a9eae)
		endif
		return \{0x52718f24 = qs(0x03ac90f0)}
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script get_song_prefix \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		return song_prefix = ($gh_songlist_props.<song>.Name)
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script get_song_name \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		return song_name = ($gh_songlist_props.<song>.Name)
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script get_song_artist \{song = invalid
		with_year = 1}
	if StructureContains structure = $gh_songlist_props <song>
		if (<with_year>)
			formatText TextName = song_artist qs(0xfaf915aa) a = ($gh_songlist_props.<song>.artist) y = ($gh_songlist_props.<song>.year)
			return song_artist = <song_artist>
		else
			return song_artist = ($gh_songlist_props.<song>.artist)
		endif
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script get_song_album_img \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		if StructureContains structure = ($gh_songlist_props.<song>) album_img
			return song_album_img = ($gh_songlist_props.<song>.album_img)
		else
			return \{song_album_img = placeholder_album}
		endif
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script get_song_artist_text \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		return song_artist_text = ($gh_songlist_props.<song>.artist_text)
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script get_song_year_text \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		formatText TextName = song_year_text qs(0x5ab9cf0a) y = ($gh_songlist_props.<song>.year)
		return song_year_text = <song_year_text>
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script get_song_year \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		return year = ($gh_songlist_props.<song>.year)
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script get_genre_text 
	<continue> = 0
	if GotParam \{genre}
		<continue> = 1
		<switch_var> = <genre>
	elseif StructureContains structure = $gh_songlist_props <song>
		<continue> = 1
		<switch_var> = ($gh_songlist_props.<song>.genre)
	endif
	if (<continue> = 1)
		if NOT StructureContains structure = $song_genre_list <switch_var>


		endif
		return genre = ($song_genre_list.<switch_var>.genre_string + qs(0x03ac90f0))
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
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
	if StructureContains structure = $gh_songlist_props <song>
		if StructureContains structure = ($gh_songlist_props.<song>) performance
			if ($gh_songlist_props.<song>.performance = 1)
				performance = 0
				get_band_name song = <song>
				singing_guitarist = FALSE
				if has_singing_guitarist Band = <Band>
					singing_guitarist = true
				elseif has_singing_bassist Band = <Band>
					singing_guitarist = true
				endif
				if (<singing_guitarist> = true)
					if (($<Band>.vocalist = jimi) && ($current_num_players = 1))
						performance = 1
					else
						if NOT is_any_player_on_part \{part = vocals}
							performance = 1
						endif
					endif
				endif

				return song_performance = <performance>
			else
				return song_performance = ($gh_songlist_props.<song>.performance - 1)
			endif
		else
			return \{song_performance = 0}
		endif
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script is_any_player_on_part 
	gamemode_getnumplayersshown
	if (<num_players_shown> > 0)
		Player = 1
		begin
		<player_status> = ($0x2994109a [<Player>])
		if ($<player_status>.part = <part>)
			return \{true}
		endif
		Player = (<Player> + 1)
		repeat <num_players_shown>
	endif
	return \{FALSE}
endscript

script get_song_struct \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		return song_struct = ($gh_songlist_props.<song>)
	endif


endscript

script is_song_downloaded \{song_checksum = schoolsout}
	return \{download = 0
		true}
endscript

script is_song_in_jammode_songlist 
	return \{FALSE}
endscript

script song_has_ingame_video 
	if StructureContains structure = $gh_songlist_props <song>
		if StructureContains structure = ($gh_songlist_props.<song>) ingame_video
			return true ingame_video = ($gh_songlist_props.<song>.ingame_video)
		else
			return \{FALSE}
		endif
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script get_song_difficulty_ratings \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
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
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script get_song_saved_in_globaltags \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		if StructureContains structure = ($gh_songlist_props.<song>) saved_in_globaltags
			return saved_in_globaltags = ($gh_songlist_props.<song>.saved_in_globaltags)
		else
			return \{saved_in_globaltags = 1}
		endif
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript

script get_song_allowed_in_quickplay \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		if StructureContains structure = ($gh_songlist_props.<song>) allowed_in_quickplay
			return allowed_in_quickplay = ($gh_songlist_props.<song>.allowed_in_quickplay)
		else
			return \{allowed_in_quickplay = 1}
		endif
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript
current_song_version = gh5

script get_song_version \{song = invalid}
	if StructureContains structure = $gh_songlist_props <song>
		if StructureContains structure = ($gh_songlist_props.<song>) version
			return song_version = ($gh_songlist_props.<song>.version)
		else
			return song_version = ($current_song_version)
		endif
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{qs(0x0ebc33db)}
endscript
drum_kit_types = {
	heavyrock = 0
	classicrock = 1
}

script get_song_drum_kit_index \{song = invalid}
	if ($current_song = jamsession)
		return drum_kit_type = ($drum_kits [0].string_id) drum_kit_index = 0
	endif
	if StructureContains structure = $gh_songlist_props <song>
		drum_kit_type = ($gh_songlist_props.<song>.drum_kit)
		GetArraySize ($drum_kits)
		drum_kit_index = 0
		return drum_kit_type = <drum_kit_type> drum_kit_index = <drum_kit_index>
	endif
	0xe6b61ea6 <...>
	0x93d8d5cf \{'Song not found'}
endscript

script get_song_source 

	Source = unknown
	GetArraySize ($gh5_songlist)
	if (<array_Size> > 0)
		i = 0
		begin
		props = (($gh5_songlist [<i>]).props)
		if StructureContains structure = $<props> <song_name>
			return Source = (($gh5_songlist [<i>]).crc)
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return Source = <Source>
endscript

script musicstudio_check_song_for_zero_difficulty 
	getplayerinfo <Player> part
	getsonginfo
	switch (<part>)
		case drum
		if (<drums_difficulty_rating> = 0)

			setplayerinfo <Player> force_freeform = 1
		else
			setplayerinfo <Player> force_freeform = 0
		endif
		case vocals
		if (<vocals_difficulty_rating> = 0)

			setplayerinfo <Player> force_freeform = 1
			setplayerinfo <Player> vocals_highway_view = scrolling
		else
			setplayerinfo <Player> force_freeform = 0
		endif
	endswitch
endscript

script check_song_for_zero_difficulty \{song = invalid}
	get_song_difficulty_ratings song = <song>
	getplayerinfo <Player> vocals_highway_view
	setplayerinfo <Player> 0x0546e9db = <vocals_highway_view>
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
				setplayerinfo <Player> force_freeform = 1
			else
				setplayerinfo <Player> force_freeform = 0
			endif
			case vocals
			if (<vocals_difficulty_rating> = 0)
				setplayerinfo <Player> force_freeform = 1
				setplayerinfo <Player> vocals_highway_view = scrolling
			else
				setplayerinfo <Player> force_freeform = 0
			endif
		endswitch
	endif
endscript

script restore_player_part_settings 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> 0x0546e9db
		setplayerinfo <Player> vocals_highway_view = <0x0546e9db>
		setplayerinfo <Player> force_freeform = 0
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script current_song_supports_vocals 
	song_name = ($current_song)
	if StructureContains structure = $gh_songlist_props <song_name>
		if StructureContains structure = ($gh_songlist_props.<song_name>) doesnt_support_vocals
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script get_songlist_size 
	GetArraySize \{$gh5_songlist}
	size = (<array_Size>)
	return array_Size = <size>
endscript
