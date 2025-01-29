
script ui_init_band_difficulty 
endscript

script ui_create_band_difficulty 
	SpawnScriptNow \{0xf2d3e5f3
		params = {
			mode = band_difficulty
		}}
endscript

script ui_destroy_band_difficulty 
	0x981ef6bf
endscript

script ui_deinit_band_difficulty 
endscript

script ui_create_band_difficulty_spawned 
	0x93d8d5cf \{qs(0xddd8011e)}
endscript

script ui_band_instrument_check_controllers 
	0x93d8d5cf \{qs(0xddd8011e)}
endscript

script ui_band_difficulty_continue 
	0x93d8d5cf \{qs(0xddd8011e)}
endscript

script ui_band_difficulty_delay_input 
	0x93d8d5cf \{qs(0xddd8011e)}
endscript
