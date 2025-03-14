
script ui_create_pauselevel 
	printf \{"UI: ui_create_pauselevel"}
	launch_level_select_menu
endscript

script ui_destroy_pauselevel 
	printf "UI: ui_destroy_pauselevel"
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	printf "**** trying to unload levelselect pak"
	unloadpak 'pak/levelselect/levelselect.pak'
	waitunloadpak 'pak/levelselect/levelselect.pak'
endscript
