
script ui_create_jam_publish_update_fileid 
	StopRendering
	SpawnScriptNow \{ui_create_jam_publish_update_fileid_and_save}
endscript

script ui_create_jam_publish_update_fileid_and_save 
	setsonginfo \{file_id = {
			file_id = [
				0
				0
			]
		}}
	Wait \{1
		Second}
	StartRendering
	ui_memcard_save_jam \{event = menu_back
		data = {
			state = uistate_jam_select_song
			show_popup = 0
		}}
endscript

script ui_destroy_jam_publish_update_fileid 
	StartRendering
endscript
