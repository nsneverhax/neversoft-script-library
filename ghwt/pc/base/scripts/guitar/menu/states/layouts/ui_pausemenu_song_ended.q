
script ui_create_pausemenu_song_ended 
	if iswinport
		change \{skater_accessory_bones_enabled = 1}
	endif
	kill_intro_celeb_ui
	create_song_ended_menu
endscript

script ui_destroy_pausemenu_song_ended 
	destroy_song_ended_menu
endscript
