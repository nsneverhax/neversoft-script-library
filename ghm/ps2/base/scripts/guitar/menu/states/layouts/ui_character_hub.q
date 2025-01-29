
script ui_init_character_hub 
endscript

script ui_create_character_hub 
	SpawnScriptNow \{0xf2d3e5f3
		params = {
			mode = character_hub
		}}
endscript

script ui_destroy_character_hub 
	0x981ef6bf
endscript

script ui_deinit_character_hub 
endscript

script ui_create_character_hub_spawned 
	0x93d8d5cf \{qs(0x98ff84b9)}
endscript

script ui_character_hub_continue 
	0x93d8d5cf \{qs(0x98ff84b9)}
endscript
