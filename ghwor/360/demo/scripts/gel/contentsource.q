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
songlist_pak_filename = 'gh6_musicstore'
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
	requireparams \{[
			pack_name
		]
		all}
	album_pack_props = {
		($musicstore_albumlist_props)
		($musicstore_packlist_props)
	}
	if structurecontains structure = <album_pack_props> <pack_name>
		songprops = (<album_pack_props>.<pack_name>)
		should_include = 0
		if music_store_get_product_code props = <songprops>
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
			if ((<songprops>.type) = pack)
				music_store_get_pack_contents_strings pack_contents = (<songprops>.pack_list)
			endif
			music_store_pack_check_patched pack_contents = (<songprops>.pack_list)
			music_store_pack_check_rating pack_contents = (<songprops>.pack_list)
			if (<songprops>.type = pack)
				<type_string> = qs(0x5abf8778)
			else
				<type_string> = qs(0x6c9aa626)
			endif
			truncatepacksring ui_string = (<songprops>.title) max_characters = ($g_music_store_truncate_track_pack_title_length)
			pack_entry = {
				song_checksum = <pack_name>
				song_title = <trunctated_string>
				song_sort_title = (<songprops>.title)
				song_artist = (<songprops>.artist)
				type = (<songprops>.type)
				type_string = <type_string>
				price = <cost>
				purchased = <purchased>
				patched = <patched>
				code = <code>
				song_preview_asset_name = (<songprops>.asset_name)
				pack_list = (<songprops>.pack_list)
				song_year = (<songprops>.release_year)
				arrived_date = <date>
				title_strings = <title_strings>
				artist_strings = <artist_strings>
				song_rating = <rating>
			}
			if music_store_is_new_arrival name = <pack_name>
				pack_entry = {<pack_entry> new_arrival = 1}
			endif
			if scriptexists \{hack_get_marketplace_pack_struct_edit}
				hack_get_marketplace_pack_struct_edit <...>
			endif
			if NOT music_store_should_hide_item struct = <songprops>
				return true pack_entry = <pack_entry>
			endif
		else
			printf 'Content not on marketplace for pack %s' s = <pack_name>
		endif
	endif
	return \{false}
endscript

script music_store_pack_check_patched 
	requireparams \{[
			pack_contents
		]
		all}
	getarraysize <pack_contents>
	if (<array_size> > 0)
		<i> = 0
		begin
		if get_marketplace_song_struct song_name = (<pack_contents> [<i>])
			if (<song_entry>.patched = 0)
				return \{patched = 0}
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{patched = 1}
endscript

script music_store_pack_check_rating 
	requireparams \{[
			pack_contents
		]
		all}
	getarraysize <pack_contents>
	if (<array_size> > 0)
		<i> = 0
		begin
		if get_marketplace_song_struct song_name = (<pack_contents> [<i>])
			if NOT (<song_entry>.song_rating = none)
				return rating = (<song_entry>.song_rating)
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{rating = none}
endscript

script get_marketplace_song_struct 
	requireparams \{[
			song_name
		]
		all}
	if structurecontains structure = $musicstore_songlist_props <song_name>
		songprops = (($musicstore_songlist_props).<song_name>)
		should_include = 0
		if music_store_get_product_code props = <songprops>
			if marketplacefunc func = get_content_info id = <code>
				should_include = 1
			elseif (($debug_music_store_show_all) = 1)
				cost = 0
				cost_fraction = 0
				purchased = 0
				code = 'debug_music_store_show_all'
				should_include = 1
			else
				printf 'Song not on marketplace for %s %a with code %c' s = (<songprops>.title) a = (<songprops>.artist) c = <code>
			endif
		else
			if structurecontains structure = <songprops> album_pack_only
				cost = 99999
				cost_fraction = 0
				purchased = 0
				code = 'album_pack_only'
				should_include = 1
				if (($debug_music_store_show_all) = 0)
					if structurecontains structure = <songprops> pack_list
						if NOT music_store_check_code_exists packages = (<songprops>.pack_list)
							should_include = 0
							printf qs(0x5b38385b) s = (<songprops>.title) a = (<songprops>.artist)
						endif
					endif
				endif
			elseif (($debug_music_store_show_all) = 1)
				cost = 0
				cost_fraction = 0
				purchased = 0
				code = 'debug_music_store_show_all'
				should_include = 1
			else
				printf 'No product code for song %s %a' s = (<songprops>.title) a = (<songprops>.artist)
			endif
		endif
		if (<should_include> = 1)
			music_store_generate_date year = (<songprops>.arrived_year) day = (<songprops>.arrived_day) month = (<songprops>.arrived_month)
			song_checksum = null
			song_checksum = (<songprops>.checksum)
			if structurecontains structure = $gh4_dlc_songlist_props <song_checksum>
				musicstoresongdownloadedandpatched song_checksum = <song_checksum>
			else
				patched = 1
			endif
			<song_original_artist> = 1
			if structurecontains structure = <songprops> original_artist
				<song_original_artist> = (<songprops>.original_artist)
			endif
			<song_genre> = other
			if structurecontains structure = <songprops> genre
				<song_genre> = (<songprops>.genre)
			endif
			<song_genre_string> = qs(0xae88c5bc)
			if structurecontains structure = $song_genre_list <song_genre>
				<song_genre_string> = (($song_genre_list.<song_genre>).genre_string)
			else
				<song_genre_string> = (($song_genre_list.other).genre_string)
			endif
			<song_duration> = 0
			if structurecontains structure = <songprops> duration
				<song_duration> = (<songprops>.duration)
			endif
			<song_guitar_difficulty_rating> = 0
			if structurecontains structure = <songprops> guitar_difficulty_rating
				<song_guitar_difficulty_rating> = (<songprops>.guitar_difficulty_rating)
			endif
			<song_bass_difficulty_rating> = 0
			if structurecontains structure = <songprops> bass_difficulty_rating
				<song_bass_difficulty_rating> = (<songprops>.bass_difficulty_rating)
			endif
			<song_vocals_difficulty_rating> = 0
			if structurecontains structure = <songprops> vocals_difficulty_rating
				<song_vocals_difficulty_rating> = (<songprops>.vocals_difficulty_rating)
			endif
			<song_drums_difficulty_rating> = 0
			if structurecontains structure = <songprops> drums_difficulty_rating
				<song_drums_difficulty_rating> = (<songprops>.drums_difficulty_rating)
			endif
			<song_band_difficulty_rating> = 0
			if structurecontains structure = <songprops> band_difficulty_rating
				<song_band_difficulty_rating> = (<songprops>.band_difficulty_rating)
			endif
			<song_rating> = none
			if structurecontains structure = <songprops> rating
				<song_rating> = (<songprops>.rating)
			endif
			<song_double_kick> = 0
			if structurecontains structure = <songprops> double_kick
				<song_double_kick> = (<songprops>.double_kick)
			endif
			song_entry = {
				song_checksum = <song_name>
				song_title = (<songprops>.title)
				song_sort_title = (<songprops>.title)
				song_artist = (<songprops>.artist)
				type = song
				type_string = qs(0xb0e5763a)
				album_pack_only = (<songprops>.album_pack_only)
				price = <cost>
				purchased = <purchased>
				patched = <patched>
				code = <code>
				duration = (<songprops>.duration)
				song_genre = <song_genre>
				song_genre_string = <song_genre_string>
				song_preview_asset_name = (<songprops>.asset_name)
				pack_list = (<songprops>.pack_list)
				album = (<songprops>.album_title)
				song_year = (<songprops>.year)
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
			}
			if music_store_is_new_arrival name = <song_name>
				song_entry = {<song_entry> new_arrival = 1}
			endif
			if scriptexists \{hack_get_marketplace_song_struct_edit}
				hack_get_marketplace_song_struct_edit <...>
			endif
			if NOT music_store_should_hide_item struct = <songprops>
				return true song_entry = <song_entry>
			else
				printf '%s has been marked as hidden.' s = (<songprops>.title)
			endif
		endif
	else
		printf 'No song props for song %s' s = <song_name>
	endif
	return \{false}
endscript

script get_marketplace_import_struct 
	requireparams \{[
			import_name
		]
		all}
	if structurecontains structure = $musicstore_importlist_props <import_name>
		songprops = (($musicstore_importlist_props).<import_name>)
		should_include = 0
		if music_store_get_product_code props = <songprops>
			if marketplacefunc func = get_content_info id = <code>
				should_include = 1
			elseif isxenonorwindx
				cost = 0
				cost_fraction = 0
				purchased = 0
				should_include = 1
			elseif (($debug_music_store_show_all) = 1)
				cost = 0
				cost_fraction = 0
				purchased = 0
				code = 'debug_music_store_show_all'
				should_include = 1
			else
				printf 'import not on marketplace for %s with code %c' s = (<songprops>.title) c = <code>
			endif
		else
			if (($debug_music_store_show_all) = 1)
				cost = 0
				cost_fraction = 0
				purchased = 0
				code = 'debug_music_store_show_all'
				should_include = 1
			else
				printf 'No product code for import %s' s = (<songprops>.title)
			endif
		endif
		if (<should_include> = 1)
			music_store_generate_date year = (<songprops>.arrived_year) day = (<songprops>.arrived_day) month = (<songprops>.arrived_month)
			<song_rating> = none
			if structurecontains structure = <songprops> rating
				<song_rating> = (<songprops>.rating)
			endif
			song_title = (<songprops>.title)
			hack_modify_hits_string title = (<songprops>.title) code = <code>
			import_entry = {
				song_checksum = <import_name>
				song_title = <song_title>
				song_sort_title = <song_title>
				type = import
				type_string = qs(0xca5f1833)
				price = <cost>
				purchased = <purchased>
				code = <code>
				song_preview_asset_name = (<songprops>.asset_name)
				contents = (<songprops>.contents)
				arrived_date = <date>
				song_rating = <song_rating>
				offering_id = (<songprops>.offering_id)
			}
			if music_store_is_new_arrival name = <import_name>
				import_entry = {<import_entry> new_arrival = 1}
			endif
			if scriptexists \{hack_get_marketplace_import_struct_edit}
				hack_get_marketplace_import_struct_edit <...>
			endif
			if NOT music_store_should_hide_item struct = <songprops>
				return true import_entry = <import_entry>
			else
				printf '%s has been marked as hidden.' s = (<songprops>.title)
			endif
		endif
	else
		printf 'No import props for import %s' s = <song_name>
	endif
	return \{false}
endscript
g_smash_hits_import_string = qs(0xed421180)
g_greatest_hits_import_string = qs(0x16fcc2b4)

script hack_modify_hits_string 
	song_title = <title>
	if (<code> = '41560840_CCF0029' || <code> = 'EP0002-BLES00576_00-GHTHFCCPATCH0001-E001' || <code> = 'UP0002-BLUS30292_00-GHTHFCCPATCH0001-UA01')
		getterritory
		if (<territory> = territory_us)
			song_title = $g_smash_hits_import_string
		else
			song_title = $g_greatest_hits_import_string
		endif
	endif
	return song_title = <song_title>
endscript

script get_marketplace_patch_struct 
	requireparams \{[
			patch_name
		]
		all}
	if structurecontains structure = $musicstore_patchlist_props <patch_name>
		songprops = (($musicstore_patchlist_props).<patch_name>)
		should_include = 0
		if music_store_get_product_code props = <songprops>
			if marketplacefunc func = get_content_info id = <code>
				should_include = 1
			elseif isxenonorwindx
				cost = 0
				cost_fraction = 0
				purchased = 0
				should_include = 1
			elseif (($debug_music_store_show_all) = 1)
				cost = 0
				cost_fraction = 0
				purchased = 0
				code = 'debug_music_store_show_all'
				should_include = 1
			else
				printf 'patch not on marketplace for %s with code %c' s = (<songprops>.title) c = <code>
			endif
		else
			if (($debug_music_store_show_all) = 1)
				cost = 0
				cost_fraction = 0
				purchased = 0
				code = 'debug_music_store_show_all'
				should_include = 1
			else
				printf 'No product code for patch %s' s = (<songprops>.title)
			endif
		endif
		if (<should_include> = 1)
			music_store_generate_date year = (<songprops>.arrived_year) day = (<songprops>.arrived_day) month = (<songprops>.arrived_month)
			patch_entry = {
				song_checksum = <patch_name>
				song_title = (<songprops>.title)
				song_sort_title = (<songprops>.title)
				type = patch
				type_string = qs(0xe27944a1)
				price = <cost>
				purchased = <purchased>
				code = <code>
				song_preview_asset_name = (<songprops>.asset_name)
				arrived_date = <date>
			}
			if music_store_is_new_arrival name = <patch_name>
				patch_entry = {<patch_entry> new_arrival = 1}
			endif
			if scriptexists \{hack_get_marketplace_patch_struct_edit}
				hack_get_marketplace_patch_struct_edit <...>
			endif
			if NOT music_store_should_hide_item struct = <songprops>
				return true patch_entry = <patch_entry>
			else
				printf '%s has been marked as hidden.' s = (<songprops>.title)
			endif
		endif
	else
		printf 'No props for patch %s' s = <song_name>
	endif
	return \{false}
endscript

script music_store_get_pack_contents_strings 
	if NOT gotparam \{pack_contents}
		return
	endif
	<title_array> = []
	<artist_array> = []
	getarraysize <pack_contents>
	if (<array_size> > 0)
		<i> = 0
		begin
		if get_marketplace_song_struct song_name = (<pack_contents> [<i>])
			if NOT structurecontains structure = <song_entry> song_original_artist
				addarrayelement array = <title_array> element = (<song_entry>.song_title)
				<title_array> = <array>
				addarrayelement array = <artist_array> element = (<song_entry>.song_artist)
				<artist_array> = <array>
			else
				if (<song_entry>.song_original_artist = 1)
					addarrayelement array = <title_array> element = (<song_entry>.song_title)
					<title_array> = <array>
					addarrayelement array = <artist_array> element = (<song_entry>.song_artist)
					<artist_array> = <array>
				else
					formattext textname = element qs(0x3b56c7f4) n = (<song_entry>.song_title)
					addarrayelement array = <title_array> element = <element>
					<title_array> = <array>
					addarrayelement array = <artist_array> element = qs(0x03ac90f0)
					<artist_array> = <array>
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return title_strings = <title_array> artist_strings = <artist_array>
endscript

script music_store_check_code_exists \{packages = [
		]}
	package_structs = {$musicstore_albumlist_props $musicstore_packlist_props $musicstore_songlist_props}
	getarraysize <packages>
	if (<array_size> > 0)
		i = 0
		begin
		package_props = (<package_structs>.(<packages> [<i>]))
		if music_store_get_product_code props = <package_props>
			if marketplacefunc func = get_content_info id = <code>
				return \{true}
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script music_store_should_hide_item 
	if NOT checkforsignin network_platform_only controller_index = ($primary_controller)
		return
	endif
	getlocale
	if structurecontains structure = <struct> hide_for_locale
		if arraycontains array = (<struct>.hide_for_locale) contains = <locale>
			return \{true}
		endif
	endif
	return \{false}
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
	return songlist_filename = (<songlistfile> + '.pak')
endscript

script issongavailable \{for_bonus = 0
		savegame = !i1768515945
		song = !q1768515945}
	gamemode_gettype
	if NOT faststructurecontains structure = $gh_songlist_props name = <song>
		return \{false}
	endif
	<song_props> = {}
	<song_props> = ($gh_songlist_props.<song>)
	if faststructurecontains structure = <song_props> name = never_show_in_setlist
		return \{false}
	endif
	if NOT isdownloadedsongenabled song_prefix = (<song_props>.name)
		return \{false}
	endif
	if (($g_include_debug_songs) = 1)
		if NOT is_song_downloaded song_checksum = <song>
			return \{false}
		endif
		if (<download> = 0)
			return \{true}
		endif
	else
		check_allowed_in_quickplay = 0
		if (($is_network_game = 1) || (<type> = quickplay) || (<type> = competitive) || (<type> = training) || (<type> = freeplay) || (<type> = practice))
			check_allowed_in_quickplay = 1
		endif
		if (<check_allowed_in_quickplay> = 1)
			get_song_allowed_in_quickplay song = <song>
			if (<allowed_in_quickplay> = 0)
				return \{false}
			endif
		endif
	endif
	<on_disc_song> = 0
	<global_on_disc_array_name> = ($on_disc_list)
	if arraycontains array = $<global_on_disc_array_name> contains = <song>
		<on_disc_song> = 1
	endif
	if ($is_network_game = 1)
		if (<on_disc_song> = 0)
			if NOT songlistmatch func = is_available_on_other_client name = (<song_props>.name)
				return \{false}
			endif
		endif
		get_song_saved_in_globaltags song = <song>
		if (<saved_in_globaltags> = 1)
			return \{true}
		endif
	else
		if faststructurecontains structure = $download_songlist_props name = <song>
			musicstoresongdownloadedandpatched song_checksum = <song>
			if (<downloaded> = 1)
				return \{true}
			endif
		else
			return \{true}
		endif
		return \{false}
	endif
	return \{false}
endscript

script issongselectable \{song = !q1768515945
		savegame = -1}
	if (<song> = 0x00000000)
		return \{false}
	endif
	if song_is_jamsession song = <song>
		return \{true}
	endif
	if (<savegame> = -1)
		get_savegame_from_controller controller = ($primary_controller)
	endif
	if is_song_locked song = <song> savegame = <savegame>
		return \{false
			song_is_locked = 1}
	endif
	<downloaded> = 1
	<patched> = 1
	if faststructurecontains structure = $download_songlist_props name = <song>
		musicstoresongdownloadedandpatched song_checksum = <song>
	endif
	if (<patched> = 0)
		return \{false
			song_not_patched = 1}
	endif
	if NOT faststructurecontains structure = $gh_songlist_props name = <song>
		printf 'Song not found in props: %a' a = <song>
		return \{false}
	endif
	if NOT screenelementexistssimpleid \{id = songlist_component}
		return \{true}
	endif
	if NOT songlist_component :obj_getstructuretag \{tag_name = band_instrument_setup
			assert = 0}
		return \{true}
	endif
	<song_struct> = {}
	<song_struct> = ($gh_songlist_props.<song>)
	<song_guitar_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> name = guitar_difficulty_rating
		<song_guitar_difficulty_rating> = (<song_struct>.guitar_difficulty_rating)
	endif
	<song_bass_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> name = bass_difficulty_rating
		<song_bass_difficulty_rating> = (<song_struct>.bass_difficulty_rating)
	endif
	<song_vocals_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> name = vocals_difficulty_rating
		<song_vocals_difficulty_rating> = (<song_struct>.vocals_difficulty_rating)
	endif
	<song_drums_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> name = drums_difficulty_rating
		<song_drums_difficulty_rating> = (<song_struct>.drums_difficulty_rating)
	endif
	gamemode_gettype
	if (<type> = competitive)
		if (<structure_value>.guitar.contains = true && (<song_guitar_difficulty_rating> = 0))
			return \{false}
		endif
		if (<structure_value>.bass.contains = true && (<song_bass_difficulty_rating> = 0))
			return \{false}
		endif
		if (<structure_value>.vocals.contains = true && (<song_vocals_difficulty_rating> = 0))
			return \{false}
		endif
		if (<structure_value>.drum.contains = true && (<song_drums_difficulty_rating> = 0))
			return \{false}
		endif
	else
		<num_players> = 0
		getnumplayersingame
		if (<type> = quickplay && <num_players> > 1)
			if (<structure_value>.guitar.contains = true && (<song_guitar_difficulty_rating> = 0))
				return \{false}
			endif
			if (<structure_value>.bass.contains = true && (<song_bass_difficulty_rating> = 0))
				return \{false}
			endif
		else
			if (<structure_value>.guitar.only = true && (<song_guitar_difficulty_rating> = 0))
				return \{false}
			endif
			if (<structure_value>.bass.only = true && (<song_bass_difficulty_rating> = 0))
				return \{false}
			endif
			if (<structure_value>.vocals.only = true && (<song_vocals_difficulty_rating> = 0))
				return \{false}
			endif
			if (<structure_value>.drum.only = true && (<song_drums_difficulty_rating> = 0))
				return \{false}
			endif
		endif
	endif
	return \{true}
endscript

script is_part_supported 
	requireparams \{[
			part
		]
		all}
	support_part = <part>
	getnumplayersingame
	if NOT gamemode_iscooperative
		if (<num_players> = 1)
			getfirstplayer
			begin
			getplayerinfo <player> part
			if (<part> = <support_part>)
				return \{false}
			endif
			getnextplayer player = <player>
			repeat <num_players>
		endif
	endif
	return \{true}
endscript

script get_ui_song_struct_items \{song = !q1768515945
		savegame = !i1768515945}
	if NOT faststructurecontains structure = $gh_songlist_props name = <song>
		printf 'Song not found in props: %a' a = <song>
		return \{song_not_found = true}
	endif
	<song_struct> = {}
	<song_struct> = ($gh_songlist_props.<song>)
	downloaded = 1
	patched = 1
	if faststructurecontains structure = $download_songlist_props name = <song>
		musicstoresongdownloadedandpatched song_checksum = <song>
	endif
	<song_title> = qs(0x7af5891d)
	if faststructurecontains structure = <song_struct> name = title
		if getlocalizedstringfromstruct struct = <song_struct> name = title
			<song_title> = <string>
		endif
		<sort_title> = <song_title>
		if faststructurecontains structure = <song_struct> name = sort_title
			<sort_title> = (<song_struct>.sort_title)
		endif
	elseif faststructurecontains structure = <song_struct> name = display_name
		if getlocalizedstringfromstruct struct = <song_struct> name = display_name
			<song_title> = <string>
		endif
		<sort_title> = <song_title>
		<song> = jamsession
	elseif faststructurecontains structure = <song_struct> name = filename
		if getlocalizedstringfromstruct struct = <song_struct> name = filename
			<song_title> = <string>
		endif
		<sort_title> = <song_title>
		<song> = jamsession
	endif
	<song_artist> = qs(0xdede583c)
	if faststructurecontains structure = <song_struct> name = artist
		if getlocalizedstringfromstruct struct = <song_struct> name = artist
			<song_artist> = <string>
		endif
	endif
	<song_genre> = other
	if faststructurecontains structure = <song_struct> name = genre
		<song_genre> = (<song_struct>.genre)
	endif
	<song_genre_string> = qs(0xae88c5bc)
	if faststructurecontains structure = $song_genre_list name = <song_genre>
		if getlocalizedstringfromstruct struct = ($song_genre_list.<song_genre>) name = genre_string
			<song_genre_string> = <string>
		endif
	else
		if getlocalizedstringfromstruct struct = ($song_genre_list.other) name = genre_string
			<song_genre_string> = <string>
		endif
	endif
	<song_year> = 2010
	if faststructurecontains structure = <song_struct> name = year
		<song_year> = (<song_struct>.year)
	endif
	<song_venue> = 20
	if faststructurecontains structure = <song_struct> name = venue
		<song_venue> = (<song_struct>.venue)
	endif
	<song_album_title> = qs(0x4d663b3f)
	if faststructurecontains structure = <song_struct> name = album_title
		if getlocalizedstringfromstruct struct = <song_struct> name = album_title
			<song_album_title> = <string>
		endif
	endif
	<song_duration> = 0
	if faststructurecontains structure = <song_struct> name = duration
		<song_duration> = (<song_struct>.duration)
	elseif faststructurecontains structure = <song_struct> name = musicstudio_song_length
		<song_length_float> = 0.0
		<song_length_float> = (<song_struct>.musicstudio_song_length)
		<song_length_float> = (<song_length_float> / 1000.0)
		converttointeger float_value = <song_length_float>
		<song_duration> = <integer_value>
	endif
	<song_guitar_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> name = guitar_difficulty_rating
		<song_guitar_difficulty_rating> = (<song_struct>.guitar_difficulty_rating)
	endif
	<song_bass_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> name = bass_difficulty_rating
		<song_bass_difficulty_rating> = (<song_struct>.bass_difficulty_rating)
	endif
	<song_vocals_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> name = vocals_difficulty_rating
		<song_vocals_difficulty_rating> = (<song_struct>.vocals_difficulty_rating)
	endif
	<song_drums_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> name = drums_difficulty_rating
		<song_drums_difficulty_rating> = (<song_struct>.drums_difficulty_rating)
	endif
	<song_band_difficulty_rating> = 11
	if faststructurecontains structure = <song_struct> name = band_difficulty_rating
		<song_band_difficulty_rating> = (<song_struct>.band_difficulty_rating)
	endif
	<song_preview_asset_name> = 'placeholder_album'
	if faststructurecontains structure = <song_struct> name = album_img
		if getnonlocalizedstringfromstruct struct = <song_struct> name = album_img
			<song_preview_asset_name> = <nl_string>
		endif
	endif
	<song_original_artist> = 1
	if faststructurecontains structure = <song_struct> name = original_artist
		<song_original_artist> = (<song_struct>.original_artist)
	endif
	<song_double_kick> = 0
	if faststructurecontains structure = <song_struct> name = double_kick
		<song_double_kick> = (<song_struct>.double_kick)
	endif
	getglobaltagsonguiparams song = <song> savegame = <savegame>
	if is_song_locked song = <song> savegame = <savegame>
		<source> = guitar_hero_6_locked
		<source_txt> = qs(0x3d2956c8)
	else
		<source> = null
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
		song_source = <source>
		song_source_txt = <source_txt>
		song_original_artist = <song_original_artist>
		song_double_kick = <song_double_kick>
		song_downloaded = <downloaded>
		song_patched = <patched>
		song_num_times_played = <num_times_played>
		song_stars = <song_stars>
	}
	if faststructurecontains structure = <song_struct> name = playback_track1
		musicstudio_genre = -1
		if faststructurecontains structure = <song_struct> name = musicstudio_genre
			musicstudio_genre = (<song_struct>.musicstudio_genre)
		endif
		song_source = ghtunes
		song_source_txt = qs(0x4b3cd73d)
		<additional_props> = {}
		if faststructurecontains structure = <song_struct> name = additional_props
			additional_props = (<song_struct>.additional_props)
		endif
		musicstudio_genre_text = qs(0xd0ef7f05)
		fastgetarraysize \{array = $jam_genre_list}
		if ((<musicstudio_genre> >= 0) && (<musicstudio_genre> < <array_size>))
			if getlocalizedstringfromstruct struct = ($jam_genre_list [<musicstudio_genre>]) name = name_text
				musicstudio_genre_text = <string>
			endif
		endif
		addparam structure_name = ui_struct name = song_genre_string value = <musicstudio_genre_text>
		addparam structure_name = ui_struct name = song_source value = <song_source>
		addparam structure_name = ui_struct name = song_source_txt value = <song_source_txt>
		addparam structure_name = ui_struct name = filename value = (<song_struct>.filename)
		addparam structure_name = ui_struct name = playback_track1 value = (<song_struct>.playback_track1)
		addparam structure_name = ui_struct name = playback_track2 value = (<song_struct>.playback_track2)
		addparam structure_name = ui_struct name = playback_track_drums value = (<song_struct>.playback_track_drums)
		addparam structure_name = ui_struct name = playback_track_vocals value = (<song_struct>.playback_track_vocals)
		addparam structure_name = ui_struct name = musicstudio_genre value = <musicstudio_genre>
		addparam structure_name = ui_struct name = additional_props value = <additional_props>
	endif
	return ui_struct = <ui_struct>
endscript

script music_store_is_new_arrival 
	if globalexists \{name = musicstore_new_arrivals}
		if structurecontains \{structure = $musicstore_new_arrivals
				worldwide}
			if arraycontains array = ($musicstore_new_arrivals.worldwide) contains = <name>
				return \{true}
			endif
		endif
		if marketplacefunc \{func = get_region_checksum}
			if structurecontains structure = $musicstore_new_arrivals <region_checksum>
				if arraycontains array = ($musicstore_new_arrivals.<region_checksum>) contains = <name>
					return \{true}
				endif
			endif
		endif
	endif
	return \{false}
endscript

script music_store_get_product_code \{props = {
		}}
	if structurecontains structure = <props> product_codes
		product_codes = (<props>.product_codes)
		if isxenon
			if structurecontains structure = <product_codes> worldwide
				return true code = (<product_codes>.worldwide)
			endif
		endif
		if marketplacefunc \{func = get_region_checksum}
			if structurecontains structure = <product_codes> <region_checksum>
				return true code = (<product_codes>.<region_checksum>)
			endif
		endif
	endif
	return \{false}
endscript

script musicstore_additional_region_check 
	if isps3
		if globalexists \{name = ps3_musicstore_locales_allowed}
			getlocale
			getterritory
			if NOT structurecontains structure = $ps3_musicstore_locales_allowed <territory>
				return \{false}
			endif
			if NOT arraycontains array = ($ps3_musicstore_locales_allowed.<territory>) contains = <locale>
				return \{false}
			endif
		endif
	endif
	return \{true}
endscript

script songlist_clean_up_spawned_scripts 
	killspawnedscript \{name = songlist_request_page_when_ready}
	killspawnedscript \{name = ui_create_music_store_scan_marketplace_spawned}
	killspawnedscript \{name = ui_create_songlist_options}
endscript

script songlist_unfocus_ui_elements 
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if screenelementexists \{id = music_store_terms}
		launchevent \{type = unfocus
			target = music_store_terms}
	endif
	if screenelementexists \{id = music_store_hub_vmenu}
		launchevent \{type = unfocus
			target = music_store_hub_vmenu}
	endif
	if screenelementexists \{id = songlist_options_vmenu}
		launchevent \{type = unfocus
			target = songlist_options_vmenu}
	endif
	if screenelementexists \{id = import_legal_dialog_box}
		launchevent \{type = unfocus
			target = import_legal_dialog_box}
	endif
endscript
g_marketplace_responding_to_error = 0

script create_marketplace_error_dialogue \{body_text = qs(0x1ba51040)
		error_code = 0}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	spawnscriptnow create_marketplace_error_dialogue_worker params = <...>
endscript

script create_marketplace_error_dialogue_worker 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if ($g_marketplace_responding_to_error = 1)
		return
	endif
	change \{g_marketplace_responding_to_error = 1}
	destroy_dialog_box
	songlist_clean_up_spawned_scripts
	songlist_unfocus_ui_elements
	if NOT cd
		if gotparam \{dev_text}
			formattext textname = body_text qs(0x05a9e77f) s = <body_text> d = <dev_text>
		endif
	endif
	create_dialog_box {
		no_background
		heading_text = qs(0xaa163738)
		body_text = <body_text>
		error_code = <error_code>
		options = [
			{
				func = songlist_marketplace_error_go_back
				text = qs(0x0e41fe46)
			}
		]
	}
endscript

script songlist_marketplace_error_go_back 
	destroy_dialog_box
	change \{g_marketplace_responding_to_error = 0}
	songlist_component :getsingletag \{tab_enabled}
	if (<tab_enabled> = 1)
		if ui_event_exists_in_stack \{name = 'music_store_scan_marketplace'}
			generic_event_back \{state = uistate_band_lobby}
		else
			change \{g_songlist_refresh_menus = 1}
			songlist_go_to_song_library_tab \{skip_scan = 1}
		endif
	else
		if ui_event_exists_in_stack \{name = 'band_lobby'}
			<back_state> = uistate_band_lobby
		else
			<back_state> = uistate_mainmenu
		endif
		ui_event event = menu_back data = {state = <back_state>}
	endif
endscript

script callback_marketplace_raf_setup_fail 
	printf \{'MarketPlaceContentSource: failed to setup the RAF.'}
	create_marketplace_error_dialogue \{body_text = qs(0xf676fb05)
		dev_text = qs(0x9223d6f4)
		error_code = 1}
endscript

script callback_marketplace_raf_get_fail 
	finalprintf \{'MarketPlaceContentSource: failed to retrieve the RAF.'}
	create_marketplace_error_dialogue \{body_text = qs(0xf676fb05)
		dev_text = qs(0xe1c5cc60)
		error_code = 2}
endscript

script callback_marketplace_retrieve_manifest_fail 
	finalprintf \{'MarketPlaceContentSource: CDN failed to retrieve the manifest.'}
	create_marketplace_error_dialogue \{body_text = qs(0xf4be4e2f)
		dev_text = qs(0x1cc3c608)
		error_code = 3}
endscript

script callback_marketplace_connecting_to_lsp_fail 
	finalprintf \{'MarketPlaceContentSource: CDN failed to connect to the LSP server.'}
	create_marketplace_error_dialogue \{body_text = qs(0xf4be4e2f)
		dev_text = qs(0x3b4882aa)
		error_code = 4}
endscript

script callback_marketplace_cdn_is_down 
	finalprintf \{'MarketPlaceContentSource: CDN is down.'}
	create_marketplace_error_dialogue \{body_text = qs(0xf4be4e2f)
		dev_text = qs(0x5dc00207)
		error_code = 5}
endscript

script callback_marketplace_songlist_pak_request_fail 
	finalprintf \{'MarketPlaceContentSource: failed to request the songlist pak.'}
	create_marketplace_error_dialogue \{body_text = qs(0x17082ce4)
		dev_text = qs(0x4df46e28)
		error_code = 6}
endscript

script callback_marketplace_songlist_pak_download_fail 
	finalprintf \{'MarketPlaceContentSource: failed to download the songlist pak.'}
	create_marketplace_error_dialogue \{body_text = qs(0xb63d2914)
		dev_text = qs(0xa13222f1)
		error_code = 7}
endscript

script callback_marketplace_market_init_settings_fail 
	finalprintf \{'MarketPlaceContentSource: failed to retrieve the marketplace init settings from the songlist pak.'}
	create_marketplace_error_dialogue \{body_text = qs(0xe50550eb)
		dev_text = qs(0xc9840d4d)
		error_code = 8}
endscript

script callback_marketplace_market_init_fail 
	finalprintf \{'MarketPlaceContentSource: failed to init the marketplace.'}
	create_marketplace_error_dialogue \{body_text = qs(0xf676fb05)
		dev_text = qs(0x45966566)
		error_code = 9}
endscript

script callback_marketplace_market_state_fail 
	finalprintf \{'MarketPlaceContentSource: failed to enumerate marketplace content, the marketplace is not idle.'}
	create_marketplace_error_dialogue \{body_text = qs(0xf676fb05)
		dev_text = qs(0x58bdb77e)
		error_code = 10}
endscript

script callback_marketplace_market_begin_enum_fail 
	finalprintf \{'MarketPlaceContentSource: failed to begin enumerating marketplace content.'}
	create_marketplace_error_dialogue \{body_text = qs(0xf676fb05)
		dev_text = qs(0x89fad2ea)
		error_code = 11}
endscript

script callback_marketplace_market_enum_validity_fail 
	finalprintf \{'MarketPlaceContentSource: failed the marketplace enumeration validity check.'}
	if isps3
		dev_text = qs(0x02ac0e72)
	else
		dev_text = qs(0xa898095a)
	endif
	create_marketplace_error_dialogue body_text = qs(0xf676fb05) dev_text = <dev_text> error_code = 12
endscript

script callback_marketplace_not_signed_in 
	finalprintf 'MarketPlaceContentSource: controller %c not signed in.' c = ($primary_controller)
	if isps3
		body_text = qs(0x2aa76f36)
	else
		body_text = qs(0x680a3a16)
	endif
	create_marketplace_error_dialogue body_text = <body_text> dev_text = qs(0xc1ec24e1)
endscript

script callback_marketplace_no_guest_account 
	finalprintf 'MarketPlaceContentSource: controller %c is a guest account, not allowed in the music store.' c = ($primary_controller)
	create_marketplace_error_dialogue \{body_text = qs(0xb9fd7c2c)}
	if isps3
		scriptassert \{qs(0xe5cf7db1)}
	endif
endscript

script callback_marketplace_non_xbl_account 
	finalprintf 'MarketPlaceContentSource: controller %c is not an XBL enabled account, or not connected to XBL.' c = ($primary_controller)
	if isps3
		body_text = qs(0x2aa76f36)
	else
		body_text = qs(0xd1dc3d89)
	endif
	create_marketplace_error_dialogue body_text = <body_text>
endscript

script callback_marketplace_connection_lost 
	finalprintf \{'MarketPlaceContentSource: connection lost.'}
	create_marketplace_error_dialogue \{body_text = qs(0xa76a52e8)
		error_code = 12}
endscript

script callback_marketplace_cannot_purchase_content 
	finalprintf \{'MarketPlaceContentSource: profile is not allowed to purchase content'}
	if isps3
		body_text = qs(0xb0311ad6)
	else
		body_text = qs(0x6bc7c154)
	endif
	create_marketplace_error_dialogue body_text = <body_text>
endscript

script callback_marketplace_region_not_supported 
	finalprintf \{'MarketPlaceContentSource: region not supported'}
	create_marketplace_error_dialogue \{body_text = qs(0x2628f160)}
endscript

script callback_marketplace_content_list_download_failed 
	finalprintf \{'Imports failed to download content list.'}
	create_marketplace_error_dialogue \{body_text = qs(0xf4be4e2f)
		error_code = 14}
endscript

script callback_marketplace_content_list_download_timedout 
	finalprintf \{'Imports timed out to download content list.'}
	create_marketplace_error_dialogue \{body_text = qs(0xf4be4e2f)
		error_code = 15}
endscript

script callback_marketplace_content_general_timedout 
	finalprintf \{'Marketplace timed out to download Product Long Description.'}
	printscriptinfo
	create_marketplace_error_dialogue \{body_text = qs(0xe58d4b79)}
endscript

script callback_marketplace_detailed_description_request_failed 
	if NOT isps3
		scriptassert \{'callback_marketplace_detailed_description_request_failed called from non ps3 sku. This is incorrect.'}
	endif
	finalprintf \{'Failed to make a request for the detailed descrition.'}
	printscriptinfo
	create_marketplace_error_dialogue \{body_text = qs(0xf676fb05)
		dev_text = qs(0xa48c2d1d)
		error_code = 13}
endscript

script callback_marketplace_detailed_description_retrieve_failed 
	if NOT isps3
		scriptassert \{'callback_marketplace_detailed_description_retrieve_failed called from non ps3 sku. This is incorrect.'}
	endif
	finalprintf \{'Failed to retrieve the detailed descrition.'}
	printscriptinfo
	create_marketplace_error_dialogue \{body_text = qs(0xf676fb05)
		dev_text = qs(0x61db3621)
		error_code = 14}
endscript
