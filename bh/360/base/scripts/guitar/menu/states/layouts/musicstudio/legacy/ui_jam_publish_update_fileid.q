
script ui_create_jam_publish_update_fileid 
	StopRendering
	spawnscriptnow \{ui_create_jam_publish_update_fileid_and_save}
endscript

script ui_create_jam_publish_update_fileid_and_save 
	SetSongInfo \{file_id = {
			file_id = [
				0
				0
			]
		}}
	wait \{1
		second}
	StartRendering
	ui_memcard_save_jam \{event = menu_back
		data = {
			state = UIstate_jam_select_song
			show_popup = 0
		}}
endscript

script ui_destroy_jam_publish_update_fileid 
	StartRendering
endscript
