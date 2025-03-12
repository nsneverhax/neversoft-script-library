
script ui_create_character_select 
	spawnscriptnow create_character_select_menu params = <...>
endscript

script ui_destroy_character_select \{player = 1}
	destroy_character_select_menu <...>
	generic_ui_destroy
endscript
