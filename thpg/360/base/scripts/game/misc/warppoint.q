
script warpskater 
	SpawnSkaterScript TeleportSkaterToNode params = {<...>}
	unpausegame
	input_debounce \{x
		time = 0.3}
	runscriptonscreenelement \{id = main_menu_anchor
		menu_offscreen}
endscript
