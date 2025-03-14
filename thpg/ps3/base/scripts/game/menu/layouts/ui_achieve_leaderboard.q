
script ui_create_achieve_leaderboard 
	printf \{"UI: ui_create_achieve_leaderboard"}
	pause_menu_fmv_kill
	request_leaderboard
endscript

script ui_destroy_achieve_leaderboard 
	printf \{"UI: ui_destroy_achieve_leaderboard"}
	if screenelementexists \{id = achieve_leaderboard_anchor}
		destroyscreenelement \{id = achieve_leaderboard_anchor}
	endif
endscript
