g_music_store_hub_options = [
	{
		text = qs(0xd3ab69c3)
		plural_text = qs(0xd0aba4ef)
		mode = new_arrivals
		sort_index = 0
		filterspec = [
			{
				key = new_arrival
				value = 1
				comparator = equal
			}
		]
		pad_choose_script = menu_special_offers_setup
		preview_array = [
		]
	}
	{
		text = qs(0x4993146c)
		plural_text = qs(0xd7809370)
		mode = songs
		sort_index = 0
		filterspec = [
			{
				key = type
				value = song
				comparator = equal
			}
		]
		preview_array = [
		]
	}
	{
		text = qs(0xef59c359)
		plural_text = qs(0x6d06b07b)
		mode = track_packs
		sort_index = 0
		filterspec = [
			{
				key = type
				value = pack
				comparator = equal
			}
		]
		preview_array = [
		]
	}
	{
		text = qs(0x23c7a5f6)
		plural_text = qs(0xe04818ae)
		mode = albums
		sort_index = 1
		filterspec = [
			{
				key = type
				value = album
				comparator = equal
			}
		]
		preview_array = [
		]
	}
	{
		text = qs(0x91dd244a)
		plural_text = qs(0x3287f8b6)
		mode = recommendations
		sort_index = 1
		preview_array = [
		]
		no_previews = 1
	}
	{
		text = qs(0x62c91ccb)
		plural_text = qs(0x381d1a36)
		mode = special_offers
		sort_index = 0
		filterspec = [
			{
				key = type
				value = import
				comparator = not_equal
			}
			{
				key = type
				value = patch
				comparator = not_equal
			}
		]
		invert_filterspec = 1
		pad_choose_script = menu_special_offers_setup
		preview_array = [
		]
	}
	{
		text = qs(0xe017a45c)
		plural_text = qs(0xc3a7bf8b)
		mode = items
		not_visible = 1
	}
]
g_music_store_recommendations = [
]
g_music_store_recommendations_complete = 0
g_music_store_recommendations_artist_complete = 0
g_music_store_recommendations_genre_complete = 0
g_music_store_num_recommendations = 20
g_music_store_hub_options_index = 0
g_music_store_hub_ticker_text = qs(0x8943cbb7)
g_music_store_preview_max_size = 10

script music_store_hub_get_index_by_mode \{mode = !q1768515945}
	getarraysize \{$g_music_store_hub_options}
	<index> = 0
	begin
	if (((($g_music_store_hub_options) [<index>]).mode) = <mode>)
		return index = <index>
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	scriptassert \{qs(0x92753e48)}
endscript
