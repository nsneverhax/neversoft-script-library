
script ui_create_gh_tunes_share 
	createscreenelement \{parent = root_window
		id = myinterfaceelement
		type = descinterface
		desc = 'gh_tunes_share'}
endscript

script ui_destroy_gh_tunes_share 
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :die
	endif
endscript
