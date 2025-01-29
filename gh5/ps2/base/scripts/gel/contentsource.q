
script get_marketplace_pack_struct 

	if StructureContains structure = $0x66fb467a <pack_name>
		songprops = (($0x66fb467a).<pack_name>)
		if music_store_get_product_code Name = <pack_name>
			if marketplacefunc func = get_content_info id = <code>
				music_store_generate_date year = (<songprops>.arrived_year) day = (<songprops>.arrived_day) month = (<songprops>.arrived_month)
				if ((<songprops>.Type) = pack)
					music_store_get_pack_contents_strings pack_contents = (<songprops>.pack_contents)
				endif
				pack_entry = {
					song_checksum = <pack_name>
					song_title = (<songprops>.title)
					song_artist = (<songprops>.artist)
					Type = (<songprops>.Type)
					price = <cost>
					purchased = <purchased>
					code = <code>
					song_preview_asset_name = (<songprops>.asset_name)
					pack_contents = (<songprops>.pack_contents)
					song_year = (<songprops>.release_year)
					arrived_date = <date>
					contents_strings = <contents_strings>
				}
				if music_store_is_new_arrival Name = <pack_name>
					pack_entry = {<pack_entry> new_arrival = 1}
				endif
				if NOT music_store_should_hide_item struct = <songprops>
					return true pack_entry = <pack_entry>
				endif
			else

			endif
		else

		endif
	endif
	return \{FALSE}
endscript

script get_marketplace_song_struct 

	if StructureContains structure = $download_songlist_props <song_name>
		if StructureContains structure = $0x0a285732 <song_name>
			songprops = (($download_songlist_props).<song_name>)
			songprops = {<songprops> (($0x0a285732).<song_name>)}
			if music_store_get_product_code Name = <song_name>
				if marketplacefunc func = get_content_info id = <code>
					music_store_generate_date year = (<songprops>.arrived_year) day = (<songprops>.arrived_day) month = (<songprops>.arrived_month)
					song_entry = {
						song_checksum = <song_name>
						song_title = (<songprops>.title)
						song_artist = (<songprops>.artist)
						Type = song
						album_pack_only = (<songprops>.album_pack_only)
						price = <cost>
						purchased = <purchased>
						code = <code>
						song_preview_asset_name = (<songprops>.asset_name)
						pack_list = (<songprops>.pack_list)
						album = (<songprops>.album)
						song_year = (<songprops>.release_year)
						arrived_date = <date>
					}
					if music_store_is_new_arrival Name = <song_name>
						song_entry = {<song_entry> new_arrival = 1}
					endif
					if NOT music_store_should_hide_item struct = <songprops>
						return true song_entry = <song_entry>
					endif
				else

				endif
			else

			endif
		else

		endif
	else

	endif
	return \{FALSE}
endscript

script music_store_should_hide_item 
	if StructureContains structure = <struct> hide_on_platforms
		if isps3
			if ArrayContains array = (<struct>.hide_on_platforms) contains = PS3
				return \{true}
			endif
		else
			if ArrayContains array = (<struct>.hide_on_platforms) contains = xen
				return \{true}
			endif
		endif
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

script IsSongAvailable 

	if NOT StructureContains structure = ($gh_songlist_props) <song>
		return \{FALSE}
	endif
	if StructureContains structure = ($gh_songlist_props.<song>) never_show_in_setlist
		return \{FALSE}
	endif
	if (($g_include_debug_songs) = 1)
		return \{true}
	else
		check_allowed_in_quickplay = 0
		gamemode_gettype
		if (($is_network_game = 1) || (<Type> = quickplay) || (<Type> = training) || (<Type> = freeplay))
			check_allowed_in_quickplay = 1
		elseif ($game_mode = p2_pro_faceoff)
			check_allowed_in_quickplay = 1
		endif
		if (<check_allowed_in_quickplay> = 1)
			get_song_allowed_in_quickplay song = <song>
			if (<allowed_in_quickplay> = 0)
				return \{FALSE}
			endif
		endif
	endif
	if StructureContains structure = ($gh_songlist_props.<song>) doesnt_support_vocals
		if NOT is_part_supported \{part = vocals}
			return \{FALSE}
		endif
	endif
	if StructureContains structure = ($gh_songlist_props.<song>) 0xb4be7506
		if NOT is_part_supported \{part = drum}
			return \{FALSE}
		endif
	endif
	if StructureContains structure = ($gh_songlist_props.<song>) 0x12a4a5e5
		if NOT is_part_supported \{part = guitar}
			return \{FALSE}
		endif
	endif
	if StructureContains structure = ($gh_songlist_props.<song>) 0x2295e99f
		if NOT is_part_supported \{part = bass}
			return \{FALSE}
		endif
	endif
	if StructureContains structure = ($gh_songlist_props.<song>) always_unlocked
		return \{true}
	endif

	get_song_saved_in_globaltags song = <song>
	if (<saved_in_globaltags> = 1)
		getnumplayersingame
		gamemode_gettype
		gamemode_getproperty \{prop = cooperative}
		if ((<Type> = quickplay) && (<cooperative> = true))
			GetGlobalTags <song> param = unlocked
			if (<unlocked> = 1)
				return \{true}
			endif
			if (<num_players> > 0)
				getfirstplayer
				begin
				getplayerinfo <Player> controller
				getsavegamefromcontroller controller = <controller>
				GetGlobalTags <song> savegame = <savegame> param = unlocked
				if (<unlocked> = 1)
					return \{true}
				endif
				getnextplayer Player = <Player>
				repeat <num_players>
			endif
		else
			GetGlobalTags <song> param = unlocked
			if (<unlocked> = 1)
				return \{true}
			endif
		endif
	endif
	if ($g_hack_all_songs_unlocked = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script is_part_supported 

	support_part = <part>
	getnumplayersingame
	gamemode_getproperty \{prop = cooperative}
	if (<cooperative> = FALSE || $practice_enabled = 1)
		if (<num_players> = 1)
			getfirstplayer
			begin
			getplayerinfo <Player> part
			if (<part> = <support_part>)
				return \{FALSE}
			endif
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
	endif
	return \{true}
endscript

script get_ui_song_struct_items 

	if NOT StructureContains structure = ($gh_songlist_props) Name = <song>

		return
	endif
	song_struct = ($gh_songlist_props.<song>)
	<song_title> = qs(0x7af5891d)
	if StructureContains structure = <song_struct> title
		<song_title> = (<song_struct>.title)
	elseif StructureContains structure = <song_struct> display_name
		<song_title> = (<song_struct>.display_name)
		<song> = jamsession
	elseif StructureContains structure = <song_struct> FileName
		<song_title> = (<song_struct>.FileName)
		<song> = jamsession
	endif
	<song_artist> = qs(0xdede583c)
	if StructureContains structure = <song_struct> artist
		<song_artist> = (<song_struct>.artist)
	endif
	<song_genre> = other
	if StructureContains structure = <song_struct> genre
		<song_genre> = (<song_struct>.genre)
	endif
	<song_genre_string> = qs(0xae88c5bc)
	if StructureContains structure = $song_genre_list <song_genre>
		<song_genre_string> = (($song_genre_list.<song_genre>).genre_string)
	else
		<song_genre_string> = (($song_genre_list.other).genre_string)
	endif
	<song_year> = 2009
	if StructureContains structure = <song_struct> year
		<song_year> = (<song_struct>.year)
	endif
	<song_venue> = 20
	if StructureContains structure = <song_struct> venue
		<song_venue> = (<song_struct>.venue)
	endif
	<song_album_title> = qs(0x4d663b3f)
	if StructureContains structure = <song_struct> album_title
		<song_album_title> = (<song_struct>.album_title)
	endif
	<song_duration> = 0
	if StructureContains structure = <song_struct> Duration
		<song_duration> = (<song_struct>.Duration)
	endif
	<song_guitar_difficulty_rating> = 0
	if StructureContains structure = <song_struct> guitar_difficulty_rating
		<song_guitar_difficulty_rating> = (<song_struct>.guitar_difficulty_rating)
	endif
	<song_bass_difficulty_rating> = 0
	if StructureContains structure = <song_struct> bass_difficulty_rating
		<song_bass_difficulty_rating> = (<song_struct>.bass_difficulty_rating)
	endif
	<song_vocals_difficulty_rating> = 0
	if StructureContains structure = <song_struct> vocals_difficulty_rating
		<song_vocals_difficulty_rating> = (<song_struct>.vocals_difficulty_rating)
	endif
	<song_drums_difficulty_rating> = 0
	if StructureContains structure = <song_struct> drums_difficulty_rating
		<song_drums_difficulty_rating> = (<song_struct>.drums_difficulty_rating)
	endif
	<song_band_difficulty_rating> = 0
	if StructureContains structure = <song_struct> band_difficulty_rating
		<song_band_difficulty_rating> = (<song_struct>.band_difficulty_rating)
	endif
	<song_preview_asset_name> = 'placeholder_album'
	if StructureContains structure = <song_struct> album_img
		<song_preview_asset_name> = (<song_struct>.album_img)
	endif
	ui_struct = {
		song_checksum = <song>
		song_title = <song_title>
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
	}
	if StructureContains structure = <song_struct> playback_track1

		extra_jam_data = {
			FileName = (<song_struct>.FileName)
			playback_track1 = (<song_struct>.playback_track1)
			playback_track2 = (<song_struct>.playback_track2)
			playback_track_drums = (<song_struct>.playback_track_drums)
			playback_track_vocals = (<song_struct>.playback_track_vocals)
		}
		song = (<song_struct>.FileName)
		ui_struct = (<ui_struct> + <extra_jam_data>)
	endif
	return ui_struct = <ui_struct> song = <song>
endscript

script music_store_is_new_arrival 
	if StructureContains \{structure = $0x6569703c
			worldwide}
		if ArrayContains array = ($0x6569703c.worldwide) contains = <Name>
			return \{true}
		endif
	endif
	if marketplacefunc \{func = get_region_checksum}
		if StructureContains structure = $0x6569703c <region_checksum>
			if ArrayContains array = ($0x6569703c.<region_checksum>) contains = <Name>
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script music_store_get_product_code 
	if StructureContains structure = $0xd47c5a00 <Name>
		if StructureContains structure = ($0xd47c5a00.<Name>) omit_locales
			getlocale
			omit_list = (($0xd47c5a00.<Name>).omit_locales)
			if ArrayContains array = <omit_list> contains = <locale>
				return \{FALSE}
			endif
		endif
		if isXenon
			if StructureContains structure = ($0xd47c5a00.<Name>) worldwide
				return true code = ($0xd47c5a00.<Name>.worldwide)
			endif
		endif
		if marketplacefunc \{func = get_region_checksum}
			if StructureContains structure = ($0xd47c5a00.<Name>) <region_checksum>
				return true code = ($0xd47c5a00.<Name>.<region_checksum>)
			endif
		endif
	endif
	return \{FALSE}
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

script 0x57be3069 
	if ScriptIsRunning \{songlist_request_page_when_ready}
		KillSpawnedScript \{Name = songlist_request_page_when_ready}
	endif
endscript

script callback_marketplace_raf_setup_fail 

endscript

script callback_marketplace_raf_get_fail 

endscript

script callback_marketplace_raf_init_fail 

endscript

script callback_marketplace_songlist_vram_pak_request_fail 

endscript

script callback_marketplace_songlist_vram_pak_download_fail 

endscript

script callback_marketplace_songlist_pak_request_fail 

endscript

script callback_marketplace_songlist_pak_download_fail 

endscript

script callback_marketplace_market_init_settings_fail 

endscript

script callback_marketplace_market_init_fail 

endscript

script callback_marketplace_market_state_fail 

endscript

script callback_marketplace_market_begin_enum_fail 

endscript

script callback_marketplace_market_enum_validity_fail 

endscript

script callback_marketplace_not_signed_in 

endscript

script callback_marketplace_no_guest_account 

endscript

script callback_marketplace_non_xbl_account 

endscript

script callback_marketplace_connection_lost 

endscript

script callback_marketplace_cannot_purchase_content 

endscript

script callback_marketplace_region_not_supported 

endscript
