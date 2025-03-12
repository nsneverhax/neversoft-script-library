gh_songlist = [
	noexcuses
	sadbuttrue
	seekanddestroy
	stonecoldcrazy
]
final_credits_song = thethingthat
final_credits_zone = load_z_icecave
download_songlist = [
]
download_songlist_props = {
}
gh_songlist_props = {
	$download_songlist_props
	$permanent_songlist_props
	$jamsession_songlist_props
}
artist_text_by = qs(0xb169ddd4)
artist_text_from = qs(0x79a5d7df)
artist_text_as_made_famous_by = qs(0x27f85350)
jamsession_songlist_props = {
}
permanent_songlist_props = {
	noexcuses = {
		checksum = noexcuses
		name = 'NoExcuses'
		title = qs(0x07c5643f)
		artist = qs(0x6656a6ea)
		album = qs(0x719dd040)
		year = qs(0x190e1d29)
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'modernrock'
		double_kick = 0
		in_the_round = 0
		parts_with_mic = [
			guitarist
			bassist
		]
	}
	sadbuttrue = {
		checksum = sadbuttrue
		name = 'SadButTrue'
		title = qs(0xada1ad1b)
		artist = qs(0x4b58f1d4)
		album = qs(0x4b58f1d4)
		year = qs(0x6479e96c)
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'hihat01'
		drum_kit = 'blackalbum'
		band = band_metallica
		parts_with_mic = [
			guitarist
			bassist
		]
		mocap_anim_pak = 'pak/anims/songs/SadbutTrue_anims.pak'
		use_alt_anim_structs = 1
		double_kick = 0
		in_the_round = 0
		overall_song_volume = -2.5
	}
	seekanddestroy = {
		checksum = seekanddestroy
		name = 'SeekAndDestroy'
		title = qs(0x95f3e276)
		artist = qs(0x4b58f1d4)
		album = qs(0x48400fda)
		year = qs(0xeef3ec8b)
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'hihat01'
		drum_kit = 'killemall'
		mocap_anim_pak = 'pak/anims/songs/seekanddestroy_anims.pak'
		use_alt_anim_structs = 1
		band = band_metallica
		double_kick = 0
		in_the_round = 1
		vocals_scroll_speed = 1.3
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 160
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
	}
	stonecoldcrazy = {
		vocals_scroll_speed = 1.5
		checksum = stonecoldcrazy
		name = 'StoneColdCrazy'
		title = qs(0xdc39c822)
		artist = qs(0x0b0a8b8a)
		album = qs(0x74152573)
		year = qs(0xf9d16a1a)
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		parts_with_mic = [
			guitarist
			bassist
		]
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		double_kick = 0
		in_the_round = 0
		overall_song_volume = -0.5
	}
}

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
			return song_artist = (($gh_songlist_props.<song>.artist) + ($gh_songlist_props.<song>.year))
		else
			return song_artist = ($gh_songlist_props.<song>.artist)
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
perf2_settings = [
	{
		song = stillborn
		mode = p1_career
		char_type = vocalist
		char_id = randomcharacter
	}
	{
		song = today
		mode = p1_career
		char_type = vocalist
		char_id = randomcharacter
	}
	{
		song = demolitionman
		mode = p1_career
		char_type = vocalist
		char_id = randomcharacter
	}
	{
		song = stillborn
		mode = p1_career
		char_type = bass
		char_id = randomcharacter
	}
	{
		song = stillborn
		mode = p2_career
		char_type = vocalist
		char_id = randomcharacter
	}
	{
		song = today
		mode = p2_career
		char_type = vocalist
		char_id = randomcharacter
	}
	{
		song = demolitionman
		mode = p2_career
		char_type = vocalist
		char_id = randomcharacter
	}
	{
		song = stillborn
		mode = p2_career
		char_type = bass
		char_id = randomcharacter
	}
	{
		song = stillborn
		mode = p3_career
		char_type = vocalist
		char_id = randomcharacter
	}
	{
		song = today
		mode = p3_career
		char_type = vocalist
		char_id = randomcharacter
	}
	{
		song = demolitionman
		mode = p3_career
		char_type = vocalist
		char_id = randomcharacter
	}
	{
		song = stillborn
		mode = p3_career
		char_type = bass
		char_id = randomcharacter
	}
]

script get_song_performance 
	if structurecontains structure = $gh_songlist_props <song>
		if structurecontains structure = ($gh_songlist_props.<song>) performance
			if ($gh_songlist_props.<song>.performance = 1)
				performance = 0
				get_band_name song = <song>
				singing_guitarist = false
				if has_singing_guitarist band = <band>
					singing_guitarist = true
				elseif has_singing_bassist band = <band>
					singing_guitarist = true
				endif
				if (<singing_guitarist> = true)
					if (($<band>.vocalist = jimi) && ($current_num_players = 1))
						performance = 1
					else
						if NOT is_any_player_on_part \{part = vocals}
							performance = 1
						endif
					endif
				endif
				printf channel = band qs(0x013e6ebe) a = (<performance> + 1)
				return song_performance = <performance>
			else
				return song_performance = ($gh_songlist_props.<song>.performance - 1)
			endif
		else
			return \{song_performance = 0}
		endif
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script is_any_player_on_part 
	gamemode_getnumplayersshown
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	if ($<player_status>.part = <part>)
		return \{true}
	endif
	player = (<player> + 1)
	repeat <num_players_shown>
	return \{false}
endscript

script get_song_struct \{song = invalid}
	if structurecontains structure = $gh_songlist_props <song>
		return song_struct = ($gh_songlist_props.<song>)
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script get_songlist_size 
	getarraysize \{$gh_songlist}
	size = (<array_size>)
	if globalexists \{name = gh4_download_songlist
			type = array}
		getarraysize \{$gh4_download_songlist}
		size = (<array_size> + <size>)
	endif
	return array_size = <size>
endscript

script get_songlist_checksum 
	getarraysize \{$gh_songlist}
	if (<index> < <array_size>)
		return song_checksum = ($gh_songlist [<index>])
	else
		return song_checksum = ($gh4_download_songlist [(<index> - <array_size>)])
	endif
endscript

script is_song_downloaded \{song_checksum = schoolsout}
	get_song_struct song = <song_checksum>
	if structurecontains structure = <song_struct> dlc_stream_name
		formattext textname = filename 'a%s_song.pak' s = (<song_struct>.dlc_stream_name)
		getcontentfolderindexfromfile <filename>
		if (<device> = content)
			return \{download = 1
				true}
		else
			return \{download = 1
				false}
		endif
	else
		return \{download = 0
			true}
	endif
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
current_song_version = gh4

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
drum_kit_types = {
	heavyrock = 0
	classicrock = 1
}

script get_song_drum_kit_index \{song = invalid}
	if ($current_song = jamsession)
		return drum_kit_type = ($drum_kits [0].string_id) drum_kit_index = 0
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
			printscriptinfo \{qs(0x7712eea5)}
			scriptassert \{qs(0x547595c8)}
		endif
		return drum_kit_type = <drum_kit_type> drum_kit_index = <drum_kit_index>
	endif
	printstruct <...>
	scriptassert \{qs(0x0ebc33db)}
endscript

script song_uses_mocap_anim_pak 
	if NOT use_alternate_anim_struct song = <song>
		return \{false}
	endif
	if structurecontains structure = $gh_songlist_props <song>
		if structurecontains structure = ($gh_songlist_props.<song>) mocap_anim_pak
			return {
				true
				mocap_anim_pak = ($gh_songlist_props.<song>.mocap_anim_pak)
			}
		endif
	endif
	return \{false}
endscript

script use_alternate_anim_struct 
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($boss_battle = 1))
		return \{false}
	endif
	if structurecontains structure = $gh_songlist_props <song>
		if structurecontains structure = ($gh_songlist_props.<song>) use_alt_anim_structs
			if ($gh_songlist_props.<song>.use_alt_anim_structs = 1)
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script current_song_supports_vocals 
	song_name = ($current_song)
	if structurecontains structure = $gh_songlist_props <song_name>
		if structurecontains structure = ($gh_songlist_props.<song_name>) doesnt_support_vocals
			return \{false}
		endif
	endif
	return \{true}
endscript
