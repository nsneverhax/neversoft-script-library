
script ui_create_gh_tunes_share 
	CreateScreenElement \{parent = root_window
		id = myinterfaceelement
		Type = descinterface
		desc = 'gh_tunes_share'}
endscript

script ui_destroy_gh_tunes_share 
	if ScreenElementExists \{id = myinterfaceelement}
		myinterfaceelement :Die
	endif
endscript
