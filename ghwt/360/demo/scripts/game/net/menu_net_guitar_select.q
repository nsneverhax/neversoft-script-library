
script net_select_guitar 
	build_gs_available_guitar_array <...>
	gs_available_instruments = <guitar_select_available_instruments>
	select_guitar_create_finish_menu <...>
endscript

script net_select_guitar_finish_choose 
	build_gs_available_guitar_array <...>
	gs_available_instruments = <guitar_select_available_instruments>
	change \{gs_made_first_selection_bool_p2 = 1}
	get_instrument_brand_and_finish id = (<gs_available_instruments> [<index>])
	select_guitar_build_finish_array {brand = <instrument_brand> gs_available_instruments = <gs_available_instruments>}
	select_guitar_finish_highlight player = <player> id = (<gs_available_finishes> [<finish_index>])
	id = (<gs_available_finishes> [<finish_index>])
	select_guitar_finish_choose <...>
endscript

script net_select_guitar_go_back_from_finish_menu 
	build_gs_available_guitar_array <...>
	select_guitar_go_back_from_finish_menu gs_available_instruments = <guitar_select_available_instruments> player = <player> instrument_type <instrument_type>
endscript

script net_gs_scroll_up_or_down 
	build_gs_available_guitar_array <...>
	select_guitar_build_brand_array instrument_type = guitar gs_available_instruments = <guitar_select_available_instruments> player = <player>
	if (<dir_value> = 0)
		dir = up
	else
		dir = down
	endif
	gs_available_instruments = <guitar_select_available_instruments>
	gs_scroll_up_or_down <...>
endscript
