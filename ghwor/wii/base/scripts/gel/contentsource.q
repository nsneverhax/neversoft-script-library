enabled_songs_bitfield = [
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
]
songlist_pak_filename = 'gh5_songlist'
debug_music_store_show_all = 0
musicstore_albumlist_props = {
}
musicstore_packlist_props = {
}
musicstore_songlist_props = {
}
musicstore_importlist_props = {
}
musicstore_patchlist_props = {
}
musicstore_all_props = {
	$musicstore_albumlist_props
	$musicstore_packlist_props
	$musicstore_songlist_props
	$musicstore_importlist_props
	$musicstore_patchlist_props
}

script get_marketplace_pack_struct 
	RequireParams \{[
			pack_name
		]
		all}
	album_pack_props = {
		$download_songpacks_props
	}
	if StructureContains structure = <album_pack_props> <pack_name>
		songprops = (<album_pack_props>.<pack_name>)
		should_include = 0
		if music_store_get_product_code props = <songprops> Name = <pack_name>
			if marketplacefunc func = get_content_info id = <code>
				should_include = 1
			elseif (($debug_music_store_show_all) = 1)
				cost = 0
				cost_fraction = 0
				purchased = 0
				code = 'debug_music_store_show_all'
				should_include = 1
			else
				printf 'No Pack content info for %s' s = (<songprops>.title)
			endif
		else
			if (($debug_music_store_show_all) = 1)
				cost = 0
				cost_fraction = 0
				purchased = 0
				code = 'debug_music_store_show_all'
				should_include = 1
			else
				printf 'Content not on marketplace for pack %s' s = (<songprops>.title)
			endif
		endif
		if (<should_include> = 1)
			music_store_generate_date year = (<songprops>.arrived_year) day = (<songprops>.arrived_day) month = (<songprops>.arrived_month)
			if ((<songprops>.Type) = pack)
				music_store_get_pack_contents_strings pack_contents = (<songprops>.pack_contents)
			endif
			music_store_pack_check_rating pack_contents = (<songprops>.pack_contents)
			if (<songprops>.Type = pack)
				<type_string> = qs(0x5abf8778)
			else
				<type_string> = qs(0x6c9aa626)
			endif
			song_title = (<songprops>.title)
			song_artist = (<songprops>.artist)
			if NOT isnabuild
				if faststructurecontains structure = <songprops> Name = title_eu
					song_title = (<songprops>.title_eu)
				endif
				if faststructurecontains structure = <songprops> Name = artist_eu
					song_artist = (<songprops>.artist_eu)
				endif
			endif
			truncatepacksring ui_string = <song_title> max_characters = ($g_music_store_truncate_track_pack_title_length)
			pack_entry = {
				song_checksum = <pack_name>
				song_title = <trunctated_string>
				song_sort_title = <song_title>
				song_artist = <song_artist>
				Type = (<songprops>.Type)
				type_string = <type_string>
				price = <cost>
				purchased = <purchased>
				patched = 1
				code = <code>
				offer_index = (<songprops>.offer_index)
				song_preview_asset_name = (<songprops>.asset_name)
				pack_list = (<songprops>.pack_contents)
				song_year = (<songprops>.release_year)
				arrived_date = <date>
				title_strings = <title_strings>
				artist_strings = <artist_strings>
				song_rating = <rating>
				eu_savegame_code = (<songprops>.eu_savegame_code)
				na_savegame_code = (<songprops>.na_savegame_code)
				song_is_dlc = 0
				song_on_wii = 0
				song_on_sd = 0
			}
			if music_store_is_new_arrival Name = <pack_name>
				pack_entry = {<pack_entry> new_arrival = 1}
			endif
			if NOT music_store_should_hide_item struct = <songprops>
				return true pack_entry = <pack_entry>
			endif
		else
			printf 'Content not on marketplace for pack %s' s = <pack_name>
		endif
	else
		printf 'Content not in manifest for pack %s' s = <pack_name>
	endif
	return \{FALSE}
endscript

script music_store_pack_check_rating 
	RequireParams \{[
			pack_contents
		]
		all}
	GetArraySize <pack_contents>
	if (<array_Size> > 0)
		<i> = 0
		begin
		if get_marketplace_song_struct song_name = (<pack_contents> [<i>])
			if NOT (<song_entry>.song_rating = None)
				return rating = (<song_entry>.song_rating)
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return \{rating = None}
endscript

script get_marketplace_song_struct 
	RequireParams \{[
			song_name
		]
		all}
	songlist_component :membfunc_songlist_uistack_getlistname
	if contentmanfunc func = get_song_data Name = <list_name> song_name = <song_name>
		return true song_entry = <song_data>
	endif
	return \{FALSE}
endscript

script get_marketplace_song_struct_real 
	RequireParams \{[
			song_name
			songprops
		]
		all}
	if StructureContains structure = <songprops> rating
		if StructureContains structure = <songprops> album_pack_only
			<album_pack_only> = 1
		endif
		<Type> = song
		<song_rating> = (<songprops>.rating)
		<song_year> = (<songprops>.release_year)
		music_store_generate_date year = (<songprops>.arrived_year) day = (<songprops>.arrived_day) month = (<songprops>.arrived_month)
	else
		<album_pack_only> = 1
		<date> = 0
		<Type> = import_song
		<song_rating> = None
		<song_year> = (<songprops>.year)
	endif
	should_include = 0
	if NOT GotParam \{album_pack_only}
		music_store_get_product_code Name = <song_name>
		if marketplacefunc func = get_content_info id = <code>
			should_include = 1
		elseif (($debug_music_store_show_all) = 1)
			cost = 0
			cost_fraction = 0
			purchased = 0
			code = debug_music_store_show_all
			should_include = 1
		else
			printf 'Song not on marketplace for %s %a with code %c' s = (<songprops>.title) a = (<songprops>.artist) c = <code>
		endif
	else
		cost = 99999
		cost_fraction = 0
		purchased = 0
		code = album_pack_only
		should_include = 1
		if (($debug_music_store_show_all) = 0)
			if StructureContains structure = <songprops> pack_list
				if NOT music_store_check_code_exists packages = (<songprops>.pack_list)
					should_include = 0
					printf qs(0x5b38385b) s = (<songprops>.title) a = (<songprops>.artist)
				endif
			endif
		endif
	endif
	if (<should_include> = 1)
		<song_original_artist> = 1
		if StructureContains structure = <songprops> original_artist
			<song_original_artist> = (<songprops>.original_artist)
		endif
		<song_genre> = other
		if StructureContains structure = <songprops> genre
			<song_genre> = (<songprops>.genre)
		endif
		<song_genre_string> = qs(0xae88c5bc)
		if StructureContains structure = $song_genre_list <song_genre>
			<song_genre_string> = (($song_genre_list.<song_genre>).genre_string)
		else
			<song_genre_string> = (($song_genre_list.other).genre_string)
		endif
		<song_duration> = 0
		if StructureContains structure = <songprops> Duration
			<song_duration> = (<songprops>.Duration)
		endif
		<song_guitar_difficulty_rating> = 0
		if StructureContains structure = <songprops> guitar_difficulty_rating
			<song_guitar_difficulty_rating> = (<songprops>.guitar_difficulty_rating)
		endif
		<song_bass_difficulty_rating> = 0
		if StructureContains structure = <songprops> bass_difficulty_rating
			<song_bass_difficulty_rating> = (<songprops>.bass_difficulty_rating)
		endif
		<song_vocals_difficulty_rating> = 0
		if StructureContains structure = <songprops> vocals_difficulty_rating
			<song_vocals_difficulty_rating> = (<songprops>.vocals_difficulty_rating)
		endif
		<song_drums_difficulty_rating> = 0
		if StructureContains structure = <songprops> drums_difficulty_rating
			<song_drums_difficulty_rating> = (<songprops>.drums_difficulty_rating)
		endif
		<song_band_difficulty_rating> = 0
		if StructureContains structure = <songprops> band_difficulty_rating
			<song_band_difficulty_rating> = (<songprops>.band_difficulty_rating)
		endif
		<song_double_kick> = 0
		if StructureContains structure = <songprops> double_kick
			<song_double_kick> = (<songprops>.double_kick)
		endif
		song_title = (<songprops>.title)
		song_artist = (<songprops>.artist)
		if NOT isnabuild
			if faststructurecontains structure = <songprops> Name = title_eu
				song_title = (<songprops>.title_eu)
			endif
			if faststructurecontains structure = <songprops> Name = artist_eu
				song_artist = (<songprops>.artist_eu)
			endif
		endif
		song_entry = {
			song_checksum = <song_name>
			song_title = <song_title>
			song_sort_title = <song_title>
			song_artist = <song_artist>
			Type = <Type>
			type_string = qs(0xb0e5763a)
			album_pack_only = <album_pack_only>
			price = <cost>
			purchased = <purchased>
			patched = 1
			code = <code>
			Duration = (<songprops>.Duration)
			song_genre = <song_genre>
			song_genre_string = <song_genre_string>
			song_preview_asset_name = (<songprops>.asset_name)
			pack_list = (<songprops>.pack_list)
			album = (<songprops>.album_title)
			song_year = <song_year>
			arrived_date = <date>
			song_original_artist = <song_original_artist>
			song_duration = <song_duration>
			song_guitar_difficulty_rating = <song_guitar_difficulty_rating>
			song_bass_difficulty_rating = <song_bass_difficulty_rating>
			song_vocals_difficulty_rating = <song_vocals_difficulty_rating>
			song_drums_difficulty_rating = <song_drums_difficulty_rating>
			song_band_difficulty_rating = <song_band_difficulty_rating>
			song_rating = <song_rating>
			song_double_kick = <song_double_kick>
			patch_id = (<songprops>.patch_id)
			patch_pack = (<songprops>.patch_pack)
			song_is_dlc = 1
			song_on_wii = 0
			song_on_sd = 0
		}
		if music_store_is_new_arrival Name = <song_name>
			song_entry = {<song_entry> new_arrival = 1}
		endif
		if NOT music_store_should_hide_item struct = <songprops>
			return true song_entry = <song_entry>
		else
			printf '%s has been marked as hidden.' s = (<songprops>.title)
		endif
	endif
	return \{FALSE}
endscript

script music_store_get_pack_contents_strings 
	if NOT GotParam \{pack_contents}
		return
	endif
	<title_array> = []
	<artist_array> = []
	GetArraySize <pack_contents>
	if (<array_Size> > 0)
		<i> = 0
		begin
		if get_marketplace_song_struct song_name = (<pack_contents> [<i>])
			if NOT StructureContains structure = <song_entry> song_original_artist
				AddArrayElement array = <title_array> element = (<song_entry>.song_title)
				<title_array> = <array>
				AddArrayElement array = <artist_array> element = (<song_entry>.song_artist)
				<artist_array> = <array>
			else
				if (<song_entry>.song_original_artist = 1)
					AddArrayElement array = <title_array> element = (<song_entry>.song_title)
					<title_array> = <array>
					AddArrayElement array = <artist_array> element = (<song_entry>.song_artist)
					<artist_array> = <array>
				else
					formatText TextName = element qs(0x3b56c7f4) n = (<song_entry>.song_title)
					AddArrayElement array = <title_array> element = <element>
					<title_array> = <array>
					AddArrayElement array = <artist_array> element = qs(0x03ac90f0)
					<artist_array> = <array>
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return title_strings = <title_array> artist_strings = <artist_array>
endscript

script music_store_check_code_exists \{packages = [
		]}
	GetArraySize <packages>
	if (<array_Size> > 0)
		i = 0
		begin
		if music_store_get_product_code Name = (<packages> [<i>])
			if marketplacefunc func = get_content_info id = <code>
				return \{true}
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script music_store_should_hide_item 
	if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
		return
	endif
	return \{FALSE}
endscript

script music_store_generate_date \{year = 9999
		month = 15
		day = 31}
	date = 0
	date = (<date> + (<year> * 512))
	date = (<date> + (<month> * 32))
	date = (<date> + <day>)
	return date = <date>
endscript

script get_songlist_filename 
	songlistfile = ($songlist_pak_filename)
	getterritory
	if French
		songlistfile = (<songlistfile> + '_f')
	elseif Italian
		songlistfile = (<songlistfile> + '_i')
	elseif German
		songlistfile = (<songlistfile> + '_g')
	elseif Spanish
		songlistfile = (<songlistfile> + '_s')
	endif
	return songlist_filename = (<songlistfile> + '.pak')
endscript

script IsSongAvailable \{for_bonus = 0
		savegame = !i1768515945
		song = !q1768515945}
	gamemode_gettype
	if NOT faststructurecontains structure = $gh_songlist_props Name = <song>
		return \{FALSE}
	endif
	<song_props> = {}
	<song_props> = ($gh_songlist_props.<song>)
	<song_name> = 'none'
	if StructureContains structure = <song_props> Name
		<song_name> = (<song_props>.Name)
	endif
	if faststructurecontains structure = <song_props> Name = never_show_in_setlist
		return \{FALSE}
	endif
	if NOT isdownloadedsongenabled song_prefix = (<song_props>.Name)
		return \{FALSE}
	endif
	if (($g_include_debug_songs) = 1)
		if NOT is_song_downloaded song_checksum = <song>
			return \{FALSE}
		endif
		if (<download> = 0)
			return \{true}
		endif
	else
		check_allowed_in_quickplay = 0
		if (($is_network_game = 1) || (<Type> = quickplay) || (<Type> = competitive) || (<Type> = training) || (<Type> = freeplay) || (<Type> = practice))
			check_allowed_in_quickplay = 1
		endif
		if (<check_allowed_in_quickplay> = 1)
			get_song_allowed_in_quickplay song = <song>
			if (<allowed_in_quickplay> = 0)
				return \{FALSE}
			endif
		endif
	endif
	<on_disc_song> = 0
	<global_on_disc_array_name> = ($on_disc_list)
	if ArrayContains array = $<global_on_disc_array_name> contains = <song>
		<on_disc_song> = 1
	endif
	if ($is_network_game = 1)
		if (<on_disc_song> = 0)
			setupdlcsongtag content_name = <song> savegame = 0 song_struct = <song_props>
			if NOT songlistmatch func = is_available_on_other_client Name = (<song_props>.Name)
				return \{FALSE}
			endif
		endif
		get_song_saved_in_globaltags song = <song>
		if (<saved_in_globaltags> = 1)
			return \{true}
		endif
	else
		if dlcmanagerfunc func = get_content_state prefix = <song_name>
			if (<content_state> = present || <content_state> = archived)
				get_savegame_from_controller controller = ($primary_controller)
				GetGlobalTags user_options savegame = <savegame> param = disable_dlc
				if (<disable_dlc> = 0)
					return \{true}
				endif
			endif
		else
			return \{true}
		endif
		return \{FALSE}
	endif
	return \{FALSE}
endscript

script issongselectable \{song = !q1768515945
		savegame = -1}
	if song_is_jamsession song = <song>
		return \{true}
	endif
	get_savegame_from_controller controller = ($primary_controller)
	get_ui_song_struct_items song = <song> savegame = <savegame>
	if (<ui_struct>.song_patched = 0)
		return \{FALSE
			song_not_patched = 1}
	endif
	if (<savegame> = -1)
		get_savegame_from_controller controller = ($primary_controller)
	endif
	if is_song_locked song = <song> savegame = <savegame>
		return \{FALSE
			song_is_locked = 1}
	endif
	if NOT faststructurecontains structure = $gh_songlist_props Name = <song>
		printf 'Song not found in props: %a' a = <song>
		return \{FALSE}
	endif
	if NOT screenelementexistssimpleid \{id = songlist_component}
		return \{true}
	endif
	if GotParam \{check_sd_card}
		if NOT sdcardmanagerfunc func = check_song_is_playable content_name = <song>
			transfer_type = restore
			if wii_dlc_get_error_text <...>
				return FALSE sd_invalid = 1 error_text = <error_text>
			endif
		endif
	endif
	if NOT ScreenElementExists \{id = songlist_component}
		return \{true}
	endif
	if NOT songlist_component :obj_getstructuretag \{tag_name = band_instrument_setup
			assert = 0}
		return \{true}
	endif
	<song_struct> = {}
	<song_struct> = ($gh_songlist_props.<song>)
	<song_guitar_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> Name = guitar_difficulty_rating
		<song_guitar_difficulty_rating> = (<song_struct>.guitar_difficulty_rating)
	endif
	<song_bass_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> Name = bass_difficulty_rating
		<song_bass_difficulty_rating> = (<song_struct>.bass_difficulty_rating)
	endif
	<song_vocals_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> Name = vocals_difficulty_rating
		<song_vocals_difficulty_rating> = (<song_struct>.vocals_difficulty_rating)
	endif
	<song_drums_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> Name = drums_difficulty_rating
		<song_drums_difficulty_rating> = (<song_struct>.drums_difficulty_rating)
	endif
	gamemode_gettype
	if (<Type> = competitive)
		if (<structure_value>.guitar.contains = true && (<song_guitar_difficulty_rating> = 0))
			return \{FALSE}
		endif
		if (<structure_value>.bass.contains = true && (<song_bass_difficulty_rating> = 0))
			return \{FALSE}
		endif
		if (<structure_value>.vocals.contains = true && (<song_vocals_difficulty_rating> = 0))
			return \{FALSE}
		endif
		if (<structure_value>.drum.contains = true && (<song_drums_difficulty_rating> = 0))
			return \{FALSE}
		endif
	else
		<num_players> = 0
		getnumplayersingame
		if (<Type> = quickplay && <num_players> > 1)
			if (<structure_value>.guitar.contains = true && (<song_guitar_difficulty_rating> = 0))
				return \{FALSE}
			endif
			if (<structure_value>.bass.contains = true && (<song_bass_difficulty_rating> = 0))
				return \{FALSE}
			endif
			if (<structure_value>.vocals.contains = true && (<song_vocals_difficulty_rating> = 0))
				return \{FALSE}
			endif
		else
			if (<structure_value>.guitar.Only = true && (<song_guitar_difficulty_rating> = 0))
				return \{FALSE}
			endif
			if (<structure_value>.bass.Only = true && (<song_bass_difficulty_rating> = 0))
				return \{FALSE}
			endif
			if (<structure_value>.vocals.Only = true && (<song_vocals_difficulty_rating> = 0))
				return \{FALSE}
			endif
			if (<structure_value>.drum.Only = true && (<song_drums_difficulty_rating> = 0))
				return \{FALSE}
			endif
		endif
	endif
	return \{true}
endscript

script get_ui_song_struct_items \{song = !q1768515945
		savegame = !i1768515945}
	if NOT GotParam \{song_struct}
		if NOT faststructurecontains structure = $gh_songlist_props Name = <song>
			printf 'Song not found in props: %a' a = <song>
			return \{song_not_found = true}
		endif
		<song_struct> = {}
		<song_struct> = ($gh_songlist_props.<song>)
	endif
	downloaded = 1
	patched = 1
	<song_title> = qs(0x7af5891d)
	if faststructurecontains structure = <song_struct> Name = title
		if getlocalizedstringfromstruct struct = <song_struct> Name = title
			<song_title> = <string>
		endif
		<sort_title> = <song_title>
		if faststructurecontains structure = <song_struct> Name = sort_title
			<sort_title> = (<song_struct>.sort_title)
		endif
	elseif faststructurecontains structure = <song_struct> Name = display_name
		if getlocalizedstringfromstruct struct = <song_struct> Name = display_name
			<song_title> = <string>
		endif
		<sort_title> = <song_title>
		<song> = jamsession
	elseif faststructurecontains structure = <song_struct> Name = FileName
		if getlocalizedstringfromstruct struct = <song_struct> Name = FileName
			<song_title> = <string>
		endif
		<sort_title> = <song_title>
		<song> = jamsession
	endif
	<song_artist> = qs(0xdede583c)
	if faststructurecontains structure = <song_struct> Name = artist
		if getlocalizedstringfromstruct struct = <song_struct> Name = artist
			<song_artist> = <string>
		endif
	endif
	if NOT isnabuild
		if faststructurecontains structure = (<song_struct>) Name = title_eu
			if getlocalizedstringfromstruct struct = <song_struct> Name = title_eu
				song_title = (<song_struct>.title_eu)
				sort_title = <song_title>
			endif
		endif
		if faststructurecontains structure = (<song_struct>) Name = artist_eu
			if getlocalizedstringfromstruct struct = <song_struct> Name = artist_eu
				song_artist = (<song_struct>.artist_eu)
			endif
		endif
	endif
	<song_genre> = other
	if faststructurecontains structure = <song_struct> Name = genre
		<song_genre> = (<song_struct>.genre)
	endif
	<song_genre_string> = qs(0xae88c5bc)
	if faststructurecontains structure = $song_genre_list Name = <song_genre>
		if getlocalizedstringfromstruct struct = ($song_genre_list.<song_genre>) Name = genre_string
			<song_genre_string> = <string>
		endif
	else
		if getlocalizedstringfromstruct struct = ($song_genre_list.other) Name = genre_string
			<song_genre_string> = <string>
		endif
	endif
	<song_year> = 2010
	if faststructurecontains structure = <song_struct> Name = year
		<song_year> = (<song_struct>.year)
	endif
	<song_venue> = 20
	if faststructurecontains structure = <song_struct> Name = venue
		<song_venue> = (<song_struct>.venue)
	endif
	<song_album_title> = qs(0x4d663b3f)
	if faststructurecontains structure = <song_struct> Name = album_title
		if getlocalizedstringfromstruct struct = <song_struct> Name = album_title
			<song_album_title> = <string>
		endif
	endif
	<song_duration> = 0
	if faststructurecontains structure = <song_struct> Name = Duration
		<song_duration> = (<song_struct>.Duration)
	elseif faststructurecontains structure = <song_struct> Name = musicstudio_song_length
		<song_length_float> = 0.0
		<song_length_float> = (<song_struct>.musicstudio_song_length)
		<song_length_float> = (<song_length_float> / 1000.0)
		converttointeger float_value = <song_length_float>
		<song_duration> = <integer_value>
	endif
	<song_guitar_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> Name = guitar_difficulty_rating
		<song_guitar_difficulty_rating> = (<song_struct>.guitar_difficulty_rating)
	endif
	<song_bass_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> Name = bass_difficulty_rating
		<song_bass_difficulty_rating> = (<song_struct>.bass_difficulty_rating)
	endif
	<song_vocals_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> Name = vocals_difficulty_rating
		<song_vocals_difficulty_rating> = (<song_struct>.vocals_difficulty_rating)
	endif
	<song_drums_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> Name = drums_difficulty_rating
		<song_drums_difficulty_rating> = (<song_struct>.drums_difficulty_rating)
	endif
	<song_band_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> Name = band_difficulty_rating
		<song_band_difficulty_rating> = (<song_struct>.band_difficulty_rating)
	endif
	<song_preview_asset_name> = 'placeholder_album'
	if faststructurecontains structure = <song_struct> Name = album_img
		if getnonlocalizedstringfromstruct struct = <song_struct> Name = album_img
			<song_preview_asset_name> = <nl_string>
		endif
	endif
	<song_original_artist> = 1
	if faststructurecontains structure = <song_struct> Name = original_artist
		<song_original_artist> = (<song_struct>.original_artist)
	endif
	<song_double_kick> = 0
	if faststructurecontains structure = <song_struct> Name = double_kick
		<song_double_kick> = (<song_struct>.double_kick)
	endif
	get_song_source song_name = <song>
	<song_is_dlc> = 0
	<song_on_wii> = 0
	<song_on_sd> = 0
	<song_dlc_xen_index> = 0
	if StructureContains structure = <song_struct> Name
		if dlcmanagerfunc func = get_content_flags prefix = (<song_struct>.Name)
			<song_is_dlc> = 1
			if (<content_flags>.owned = 1)
				<song_on_wii> = (<content_flags>.present)
				<song_on_sd> = (<content_flags>.archived)
			endif
			if (<song_on_wii> = 1 || <song_on_sd> = 1)
				<downloaded> = 1
			else
				<downloaded> = 0
			endif
			if StructureContains structure = <song_struct> patch_id
				<patched> = 0
				if dlcmanagerfunc func = get_content_flags content_name = (<song_struct>.patch_id)
					if (<content_flags>.owned = 1)
						if (<content_flags>.present = 1 || <content_flags>.archived = 1)
							<patched> = 1
						endif
					endif
				endif
			endif
			if StructureContains structure = <song_struct> xenindex
				<song_dlc_xen_index> = (<song_struct>.xenindex)
			endif
		endif
	endif
	<song_available_on_other_clients> = 1
	if ($is_network_game = 1)
		if (<song_is_dlc> = 1)
			setupdlcsongtag prefix = (<song_struct>.Name) savegame = 0 song_struct = <song_struct>
			if NOT songlistmatch func = is_available_on_other_client Name = (<song_struct>.Name)
				<song_available_on_other_clients> = 0
			endif
		endif
		<saved_in_globaltags> = 1
		if StructureContains structure = <song_struct> saved_in_globaltags
			<saved_in_globaltags> = (<song_struct>.saved_in_globaltags)
		endif
		if (<saved_in_globaltags> = 0)
			<song_available_on_other_clients> = 0
		endif
	endif
	if (<song_is_dlc> = 1)
		setupdlcsongtag prefix = (<song_struct>.Name) savegame = 0 song_struct = <song_struct>
	endif
	getglobaltagsonguiparams song = <song> savegame = <savegame>
	if is_song_locked song = <song> savegame = <savegame>
		<Source> = guitar_hero_6_locked
		<source_txt> = qs(0xc249dff8)
	else
		<Source> = NULL
		<source_txt> = qs(0x03ac90f0)
		get_song_source song_name = <song>
	endif
	ui_struct = {
		song_checksum = <song>
		song_title = <song_title>
		song_sort_title = <sort_title>
		song_artist = <song_artist>
		song_genre = <song_genre>
		song_genre_string = <song_genre_string>
		song_year = <song_year>
		song_album_title = <song_album_title>
		song_duration = <song_duration>
		song_guitar_difficulty_rating = <song_guitar_difficulty_rating>
		song_bass_difficulty_rating = <song_bass_difficulty_rating>
		song_vocals_difficulty_rating = <song_vocals_difficulty_rating>
		song_drums_difficulty_rating = <song_drums_difficulty_rating>
		song_band_difficulty_rating = <song_band_difficulty_rating>
		song_preview_asset_name = <song_preview_asset_name>
		song_venue = <song_venue>
		song_source = <Source>
		song_source_txt = <source_txt>
		song_original_artist = <song_original_artist>
		song_double_kick = <song_double_kick>
		song_downloaded = <downloaded>
		song_patched = <patched>
		song_num_times_played = <num_times_played>
		song_stars = <song_stars>
		song_available_on_other_clients = <song_available_on_other_clients>
		song_is_dlc = <song_is_dlc>
		song_on_wii = <song_on_wii>
		song_on_sd = <song_on_sd>
		song_dlc_xen_index = <song_dlc_xen_index>
	}
	if faststructurecontains structure = <song_struct> Name = playback_track1
		musicstudio_genre = -1
		if faststructurecontains structure = <song_struct> Name = musicstudio_genre
			musicstudio_genre = (<song_struct>.musicstudio_genre)
		endif
		song_source = ghtunes
		song_source_txt = qs(0x4b3cd73d)
		<additional_props> = {}
		if faststructurecontains structure = <song_struct> Name = additional_props
			additional_props = (<song_struct>.additional_props)
		endif
		musicstudio_genre_text = qs(0xd0ef7f05)
		fastgetarraysize \{array = $jam_genre_list}
		if ((<musicstudio_genre> >= 0) && (<musicstudio_genre> < <array_Size>))
			if getlocalizedstringfromstruct struct = ($jam_genre_list [<musicstudio_genre>]) Name = name_text
				musicstudio_genre_text = <string>
			endif
		else
			musicstudio_genre_text = qs(0xd0ef7f05)
		endif
		extra_jam_data = {
			FileName = (<song_struct>.FileName)
			playback_track1 = (<song_struct>.playback_track1)
			playback_track2 = (<song_struct>.playback_track2)
			playback_track_drums = (<song_struct>.playback_track_drums)
			playback_track_vocals = (<song_struct>.playback_track_vocals)
			musicstudio_genre = <musicstudio_genre>
			song_genre_string = <musicstudio_genre_text>
			song_source = <song_source>
			song_source_txt = <song_source_txt>
			additional_props = <additional_props>
		}
		AddParam structure_name = ui_struct Name = song_genre_string value = <musicstudio_genre_text>
		AddParam structure_name = ui_struct Name = song_source value = <song_source>
		AddParam structure_name = ui_struct Name = song_source_txt value = <song_source_txt>
		AddParam structure_name = ui_struct Name = FileName value = (<song_struct>.FileName)
		AddParam structure_name = ui_struct Name = playback_track1 value = (<song_struct>.playback_track1)
		AddParam structure_name = ui_struct Name = playback_track2 value = (<song_struct>.playback_track2)
		AddParam structure_name = ui_struct Name = playback_track_drums value = (<song_struct>.playback_track_drums)
		AddParam structure_name = ui_struct Name = playback_track_vocals value = (<song_struct>.playback_track_vocals)
		AddParam structure_name = ui_struct Name = musicstudio_genre value = <musicstudio_genre>
		AddParam structure_name = ui_struct Name = additional_props value = <additional_props>
	endif
	return ui_struct = <ui_struct>
endscript

script music_store_is_new_arrival 
	if GlobalExists \{Name = download_newarrivals}
		if StructureContains \{structure = $download_newarrivals
				worldwide}
			if ArrayContains array = ($download_newarrivals.worldwide) contains = <Name>
				return \{true}
			endif
		endif
		if marketplacefunc \{func = get_region_checksum}
			if StructureContains structure = $download_newarrivals <region_checksum>
				if ArrayContains array = ($download_newarrivals.<region_checksum>) contains = <Name>
					return \{true}
				endif
			endif
		endif
	endif
	return \{FALSE}
endscript

script music_store_get_product_code \{props = {
		}}
	return true code = <Name>
endscript

script musicstore_additional_region_check 
	if isps3
		if GlobalExists \{Name = ps3_musicstore_locales_allowed}
			getlocale
			getterritory
			if NOT StructureContains structure = $ps3_musicstore_locales_allowed <territory>
				return \{FALSE}
			endif
			if NOT ArrayContains array = ($ps3_musicstore_locales_allowed.<territory>) contains = <locale>
				return \{FALSE}
			endif
		endif
	endif
	return \{true}
endscript

script songlist_clean_up_spawned_scripts 
	KillSpawnedScript \{Name = songlist_request_page_when_ready}
	KillSpawnedScript \{Name = ui_create_music_store_scan_marketplace_spawned}
	KillSpawnedScript \{Name = ui_create_songlist_options}
endscript

script songlist_unfocus_ui_elements 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if ScreenElementExists \{id = music_store_terms}
		LaunchEvent \{Type = unfocus
			target = music_store_terms}
	endif
	if ScreenElementExists \{id = music_store_hub_vmenu}
		LaunchEvent \{Type = unfocus
			target = music_store_hub_vmenu}
	endif
	if ScreenElementExists \{id = import_legal_dialog_box}
		LaunchEvent \{Type = unfocus
			target = import_legal_dialog_box}
	endif
endscript
g_marketplace_responding_to_error = 0

script create_marketplace_error_dialogue \{body_text = qs(0x1ba51040)
		error_code = 0
		delay_focus_time = 0.0}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	SpawnScriptNow create_marketplace_error_dialogue_worker params = <...>
endscript

script create_marketplace_error_dialogue_worker 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ($g_marketplace_responding_to_error = 1)
		return
	endif
	Change \{g_marketplace_responding_to_error = 1}
	destroy_dialog_box
	songlist_clean_up_spawned_scripts
	songlist_unfocus_ui_elements
	if NOT GotParam \{override_dlc_error}
		music_store_start_saving_net_error
		if wii_dlc_get_error_text <...>
			<body_text> = <error_text>
		endif
	endif
	if NOT CD
		if GotParam \{dev_text}
			formatText TextName = body_text qs(0x05a9e77f) s = <body_text> d = <dev_text>
		endif
	endif
	<error_func> = dlc_error_exit_to_main_menu_part1
	if GotParam \{force_exit}
		<error_func> = dlc_error_exit_to_main_menu_part2
	endif
	create_dialog_box {
		no_background
		heading_text = qs(0xaa163738)
		body_text = <body_text>
		error_code = <error_code>
		options = [
			{
				func = <error_func>
				text = qs(0x0e41fe46)
			}
		]
		no_focus
		dlog_body_dims = (804.0, 190.0)
	}
	waitseconds num_seconds = <delay_focus_time>
	LaunchEvent Type = focus target = <menu_id>
endscript

script callback_marketplace_raf_setup_fail 
	printf \{'MarketPlaceContentSource: failed to setup the RAF.'}
	create_marketplace_error_dialogue body_text = qs(0xec9b1e61) dev_text = qs(0x9223d6f4) error_code = 1 <...>
endscript

script callback_marketplace_raf_get_fail 
	finalprintf \{'MarketPlaceContentSource: failed to retrieve the RAF.'}
	create_marketplace_error_dialogue body_text = qs(0xec9b1e61) dev_text = qs(0xe1c5cc60) error_code = 2 <...>
endscript

script callback_marketplace_raf_init_fail 
	finalprintf \{'MarketPlaceContentSource: failed to init the RAF.'}
	create_marketplace_error_dialogue body_text = qs(0xec9b1e61) dev_text = qs(0xa9eb7cd8) error_code = 3 <...>
endscript

script callback_marketplace_songlist_pak_request_fail 
	printf \{'MarketPlaceContentSource: failed to request the songlist pak.'}
	create_marketplace_error_dialogue body_text = qs(0xb3497ac5) dev_text = qs(0x4df46e28) <...>
endscript

script callback_marketplace_songlist_pak_download_fail 
	finalprintf \{'MarketPlaceContentSource: failed to download the songlist pak.'}
	create_marketplace_error_dialogue body_text = qs(0xd79fcec2) dev_text = qs(0xa13222f1) error_code = 7 <...>
endscript

script callback_marketplace_market_init_settings_fail 
	finalprintf \{'MarketPlaceContentSource: failed to retrieve the marketplace init settings from the songlist pak.'}
	create_marketplace_error_dialogue body_text = qs(0x6d62a910) dev_text = qs(0xc9840d4d) error_code = 8 <...>
endscript

script callback_marketplace_market_init_fail 
	finalprintf \{'MarketPlaceContentSource: failed to init the marketplace.'}
	create_marketplace_error_dialogue body_text = qs(0xec9b1e61) dev_text = qs(0x45966566) error_code = 9 <...>
endscript

script callback_marketplace_market_state_fail 
	printf \{'MarketPlaceContentSource: failed to enumerate marketplace content, the marketplace is not idle.'}
	create_marketplace_error_dialogue body_text = qs(0xec9b1e61) dev_text = qs(0x58bdb77e) <...>
endscript

script callback_marketplace_market_begin_enum_fail 
	printf \{'MarketPlaceContentSource: failed to begin enumerating marketplace content.'}
	create_marketplace_error_dialogue body_text = qs(0xec9b1e61) dev_text = qs(0x89fad2ea) <...>
endscript

script callback_marketplace_market_enum_validity_fail 
	finalprintf \{'MarketPlaceContentSource: failed the marketplace enumeration validity check.'}
	if isps3
		dev_text = qs(0x02ac0e72)
	else
		dev_text = qs(0xa898095a)
	endif
	create_marketplace_error_dialogue body_text = qs(0xec9b1e61) dev_text = <dev_text> error_code = 12 <...>
endscript

script callback_marketplace_not_signed_in 
	finalprintf 'MarketPlaceContentSource: controller %c not signed in.' c = ($primary_controller)
	if ($g_songlist_net_error_handling = save_error)
		Change \{g_songlist_net_saved_error = not_signed_in}
		return
	endif
	if isps3
		body_text = qs(0x2aa76f36)
	elseif isngc
		body_text = qs(0xa76a52e8)
		memcard_check_for_existing_save
		if (<found> = 0)
			wii_memcard_check_for_space
			if (<nospace> = 1 || <noinode> = 1)
				body_text = $wii_rvldwc_message_0002
			endif
		endif
	else
		body_text = qs(0x680a3a16)
	endif
	create_marketplace_error_dialogue body_text = <body_text> dev_text = qs(0xc1ec24e1) delay_focus_time = 1.5 <...> force_exit
endscript

script callback_marketplace_connection_lost 
	finalprintf \{'MarketPlaceContentSource: connection lost.'}
	if ($g_songlist_net_error_handling = save_error)
		Change \{g_songlist_net_saved_error = connection_lost}
		return
	endif
	get_last_connection_error_text \{context = default_lobby}
	create_marketplace_error_dialogue body_text = <error_text> <...> override_dlc_error force_exit
endscript

script callback_marketplace_cannot_purchase_content 
	finalprintf \{'MarketPlaceContentSource: profile is not allowed to purchase content'}
	if PS3
		body_text = qs(0xb0311ad6)
	else
		body_text = qs(0x6bc7c154)
	endif
	create_marketplace_error_dialogue body_text = <body_text> <...>
endscript

script callback_marketplace_region_not_supported 
	finalprintf \{'MarketPlaceContentSource: region not supported'}
	create_marketplace_error_dialogue body_text = qs(0x2628f160) <...>
endscript

script callback_marketplace_content_general_timedout 
	finalprintf \{'Imports timed out to download content list.'}
	printscriptinfo
	create_marketplace_error_dialogue \{body_text = qs(0xa47088ec)}
endscript

script get_code_entry_struct 
	song_entry = {
		song_checksum = ecard_code
		song_title = qs(0x947a8538)
		song_sort_title = qs(0x947a8538)
		song_artist = qs(0x11b40c9c)
		Type = ecard_code
		type_string = qs(0x0d82556f)
		song_rating = qs(0x656d3042)
		album_pack_only = 0
		price = 0
		purchased = 0
		patched = 1
		code = ecard_code
		song_is_dlc = 1
		song_on_wii = 0
		song_on_sd = 0
	}
	return true song_entry = <song_entry>
endscript
