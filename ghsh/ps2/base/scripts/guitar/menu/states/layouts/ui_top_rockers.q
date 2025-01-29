
script 0x95fb172c 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	if songispreviewplaying
		songstoppreview
	endif
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_create_top_rockers 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	create_top_rockers_menu <...>
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_top_rockers 
	destroy_top_rockers_menu
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript
