freestyle_song_data = {
}

script freestyle_load_song 
	pak_path = ($freestyle_song_data.pak)
	if NOT ispakloaded <pak_path> Heap = quota_song
		LoadPak <pak_path> Heap = quota_song
	endif
	card_set_name = ($freestyle_song_data.card_set)
	song_progression_name = ($freestyle_song_data.song_progression)
	Change freestyle_card_set = $<card_set_name>
	Change freestyle_song_progression = $<song_progression_name>
endscript

script freestyle_unload_song 
	pak_path = ($freestyle_song_data.pak)
	unload_pak_and_wait pak = <pak_path>
	Change \{freestyle_card_set = {
		}}
	Change \{freestyle_song_progression = {
		}}
endscript

script freestyle_loop_song 
	freestyle_loop_event_system
	freestyle_reset_song_progression
endscript
