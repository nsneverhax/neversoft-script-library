
script 0x95fb172c 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_create_top_rockers 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	create_top_rockers_menu <...>
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_top_rockers 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	if GotParam \{for_options}
		if (<for_options> = 1)
			if NOT GotParam \{0xf768bc05}
				create_loading_screen \{spawn}
			endif
		endif
	endif
	destroy_top_rockers_menu
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript
