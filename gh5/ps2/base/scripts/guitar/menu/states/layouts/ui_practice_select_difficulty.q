
script ui_create_practice_select_difficulty 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	ui_create_select_difficulty_spawned
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_practice_select_difficulty 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	ui_destroy_select_difficulty
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript
