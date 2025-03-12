
script ui_create_net_setlist 
	change \{opponent_gamertag = qs(0x28673bcf)}
	create_setlist_menu device_num = <device_num>
endscript

script ui_destroy_net_setlist 
	destroy_gamertags
	destroy_setlist_menu
endscript
