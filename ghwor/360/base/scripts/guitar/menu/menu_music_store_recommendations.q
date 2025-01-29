
script music_store_recommendations_process \{song_checksum = NULL}
	Change \{g_music_store_recommendations = [
		]}
	Change \{g_music_store_recommendations_complete = 0}
	Change \{g_music_store_recommendations_artist_complete = 0}
	Change \{g_music_store_recommendations_genre_complete = 0}
	get_savegame_from_controller controller = ($primary_controller)
	if NOT (<song_checksum> = NULL)
		get_ui_song_struct_items song = <song_checksum> savegame = <savegame>
		ms_rec_find_similar_songs_by_artist song_struct = <ui_struct>
		begin
		if ($g_music_store_recommendations_artist_complete = 1)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		ms_rec_find_similar_songs_by_genre song_struct = <ui_struct>
		begin
		if ($g_music_store_recommendations_genre_complete = 1)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		Change \{g_music_store_recommendations_complete = 1}
	else
		songlist_component :membfunc_songlist_uistack_setmode \{mode = play_song}
		songlist_component :membfunc_songlist_uistack_setlistname \{list_name = gh_songlist}
		songlist_component :SetTags \{content_source = local_song_list}
		songlist_content_source_init
		songlist_component :membfunc_songlist_uistack_setmode \{mode = music_store}
		songlist_component :membfunc_songlist_uistack_setlistname \{list_name = marketplace}
		songlist_component :SetTags \{content_source = marketplace}
		begin
		if contentmanfunc \{func = is_ready
				Name = gh_songlist}
			contentmanfunc \{func = request_page
				Name = gh_songlist
				current_page
				callback = ms_rec_callback_have_most_played_page
				sortspec = {
					key = song_num_times_played
					alt_key = song_title
					ascending
				}}
			return
		endif
		Wait \{0.1
			Seconds}
		repeat 150
		callback_marketplace_content_general_timedout
	endif
endscript

script ms_rec_callback_have_most_played_page 
	<end_index> = 2
	if (<page_size> < 3)
		<end_index> = (<page_size> - 1)
	endif
	contentmanfunc {
		func = request_data
		Name = gh_songlist
		start_index = 0
		end_index = <end_index>
		callback = ms_rec_callback_have_most_played_range
	}
endscript

script ms_rec_callback_have_most_played_range 
	<num_songs_to_use> = 3
	GetArraySize <Range>
	if (<array_Size> < 3)
		<num_songs_to_use> = <array_Size>
	endif
	<i> = 0
	begin
	Change \{g_music_store_recommendations_artist_complete = 0}
	Change \{g_music_store_recommendations_genre_complete = 0}
	ms_rec_find_similar_songs_by_artist song_struct = (<Range> [<i>])
	begin
	if ($g_music_store_recommendations_artist_complete = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	ms_rec_find_similar_songs_by_genre song_struct = (<Range> [<i>])
	begin
	if ($g_music_store_recommendations_genre_complete = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	<i> = (<i> + 1)
	repeat <num_songs_to_use>
	ms_rec_fabricate_random_list
	Change \{g_music_store_recommendations_complete = 1}
endscript

script ms_rec_find_similar_songs_by_artist \{song_struct = 0x69696969}
	songlist_component :membfunc_songlist_uistack_getlistname
	begin
	if NOT contentmanfunc func = content_source_registered Name = <list_name>
		break
	endif
	if contentmanfunc func = is_ready Name = <list_name>
		filterspec = [
			{
				key = song_artist
				value = (<song_struct>.song_artist)
				comparator = equal
			}
			{
				key = purchased
				value = 0
				comparator = equal
			}
			{
				key = Type
				union_list = [pack album song]
				comparator = equal
			}
		]
		GetArraySize \{$g_music_store_recommendations}
		if (<array_Size> > 0)
			<i> = 0
			begin
			<extra_filter> = {
				key = song_checksum
				value = (($g_music_store_recommendations) [<i>])
				comparator = not_equal
			}
			AddArrayElement array = <filterspec> element = <extra_filter>
			<filterspec> = <array>
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
		contentmanfunc {
			func = request_page
			Name = <list_name>
			current_page
			callback = ms_rec_callback_artist_page
			filterspec = <filterspec>
			sortspec = {key = song_artist alt_key = song_genre ascending}
		}
		return
	endif
	Wait \{0.1
		Seconds}
	repeat 150
	callback_marketplace_content_general_timedout
endscript

script ms_rec_find_similar_songs_by_genre \{song_struct = 0x69696969}
	songlist_component :membfunc_songlist_uistack_getlistname
	begin
	if contentmanfunc func = is_ready Name = <list_name>
		<filterspec> = [
			{
				key = song_genre
				value = (<song_struct>.song_genre)
				comparator = equal
			}
			{
				key = purchased
				value = 0
				comparator = equal
			}
			{
				key = Type
				union_list = [pack album song]
				comparator = equal
			}
		]
		GetArraySize \{$g_music_store_recommendations}
		if (<array_Size> > 0)
			<i> = 0
			begin
			<extra_filter> = {
				key = song_checksum
				value = (($g_music_store_recommendations) [<i>])
				comparator = not_equal
			}
			AddArrayElement array = <filterspec> element = <extra_filter>
			<filterspec> = <array>
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
		contentmanfunc {
			func = request_page
			Name = <list_name>
			current_page
			callback = ms_rec_callback_genre_page
			filterspec = <filterspec>
			sortspec = {key = song_genre alt_key = song_year}
		}
		return
	endif
	Wait \{1
		gameframe}
	repeat 1000
endscript

script ms_rec_callback_artist_page 
	songlist_component :membfunc_songlist_uistack_getlistname
	<num_artist_songs> = 5
	if (<page_size> = 0)
		Change \{g_music_store_recommendations_artist_complete = 1}
		return
	elseif (<page_size> > <num_artist_songs>)
		<start_index> = 0
		<end_index> = (<num_artist_songs> - 1)
	else
		<start_index> = 0
		<end_index> = (<page_size> - 1)
	endif
	contentmanfunc {
		func = request_data
		Name = <list_name>
		start_index = <start_index>
		end_index = <end_index>
		callback = ms_rec_callback_artist_range
	}
endscript

script ms_rec_callback_artist_range 
	GetArraySize <Range>
	<i> = 0
	begin
	AddArrayElement array = $g_music_store_recommendations element = ((<Range> [<i>]).song_checksum)
	Change g_music_store_recommendations = <array>
	<i> = (<i> + 1)
	repeat <array_Size>
	Change \{g_music_store_recommendations_artist_complete = 1}
endscript

script ms_rec_callback_genre_page 
	songlist_component :membfunc_songlist_uistack_getlistname
	if (<page_size> = 0)
		Change \{g_music_store_recommendations_genre_complete = 1}
		return
	else
		<start_index> = 0
		<end_index> = (<page_size> - 1)
	endif
	contentmanfunc {
		func = request_data
		Name = <list_name>
		start_index = <start_index>
		end_index = <end_index>
		callback = ms_rec_callback_genre_range
	}
endscript

script ms_rec_callback_genre_range 
	GetArraySize \{$g_music_store_recommendations}
	<total_size> = <array_Size>
	GetArraySize <Range>
	<genre_size> = <array_Size>
	Mod a = <total_size> b = ($g_music_store_num_recommendations)
	if (<genre_size> <= (($g_music_store_num_recommendations) - <Mod>))
		<i> = 0
		begin
		AddArrayElement array = $g_music_store_recommendations element = ((<Range> [<i>]).song_checksum)
		Change g_music_store_recommendations = <array>
		<i> = (<i> + 1)
		repeat <genre_size>
	else
		<i> = 0
		begin
		getrandominteger a = 0 b = (<genre_size> - 1)
		<index> = <random_integer>
		AddArrayElement array = $g_music_store_recommendations element = ((<Range> [<index>]).song_checksum)
		Change g_music_store_recommendations = <array>
		RemoveArrayElement array = <Range> index = <index>
		<Range> = <array>
		<genre_size> = (<genre_size> - 1)
		<i> = (<i> + 1)
		repeat (($g_music_store_num_recommendations) - <Mod>)
	endif
	Change \{g_music_store_recommendations_genre_complete = 1}
endscript

script ms_rec_fabricate_random_list 
	GetArraySize \{$g_music_store_recommendations}
	if (<array_Size> > ($g_music_store_num_recommendations))
		<num_to_remove> = (<array_Size> - ($g_music_store_num_recommendations))
		<i> = 0
		begin
		getrandominteger a = 0 b = (<array_Size> - 1)
		<index> = <random_integer>
		RemoveArrayElement array = ($g_music_store_recommendations) index = <index>
		Change g_music_store_recommendations = <array>
		<array_Size> = (<array_Size> - 1)
		<i> = (<i> + 1)
		repeat <num_to_remove>
	endif
endscript
