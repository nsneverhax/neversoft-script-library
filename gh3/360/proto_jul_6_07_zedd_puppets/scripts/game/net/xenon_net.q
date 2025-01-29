xboxlive_num_results = 0

script xboxlive_menu_optimatch_results_stop 
	netsessionfunc \{obj = match
		func = stop_server_list}
	destroy_server_list_searching_dialog
	if gotparam \{xboxlive_num_results}
		xboxlive_menu_optimatch_results_end xboxlive_num_results = <xboxlive_num_results>
	else
		xboxlive_menu_optimatch_results_end \{xboxlive_num_results = 0}
	endif
endscript

script xboxlive_menu_optimatch_results_end 
	if gotparam \{xboxlive_num_results}
		change xboxlive_num_results = <xboxlive_num_results>
	endif
	printf "xboxlive_menu_optimatch_results_end : %d" d = ($xboxlive_num_results)
	if (($xboxlive_num_results) = 0)
		if checkforsignin
			create_server_list_create_match_dialog
		endif
	else
		spawnscript \{xboxlive_menu_optimatch_results_wait_and_focus}
	endif
endscript

script xboxlive_menu_optimatch_results_wait_and_focus 
	wait \{1
		gameframes}
	if screenelementexists \{id = search_results_vmenu}
		launchevent \{type = focus
			target = search_results_vmenu}
		setscreenelementprops \{id = search_results_vmenu
			enable_pad_handling}
	endif
endscript

script xboxlive_menu_optimatch_results_item_add 
	printf "--- xboxlive_menu_optimatch_results_item_add"
	printstruct <...>
	if (<num_players> < 2)
		change xboxlive_num_results = (($xboxlive_num_results) + 1)
		if NOT screenelementexists id = search_results_vmenu
			printf "Warning! tried to add a server when results menu not up"
			return
		endif
		if ($match_type = ranked)
			<host_text> = "HOST"
		else
			<host_text> = <server_name>
		endif
		createscreenelement {
			type = textelement
			parent = search_results_vmenu
			id = <server_id>
			font = text_a5
			scale = 0.75
			rgba = [128 128 128 250]
			text = <host_text>
			just = [left top]
			internal_just = [left top]
			z_priority = 10.0
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose net_choose_server params = {id = <server_id>}}
			]
		}
		createscreenelement {
			type = textelement
			parent = <server_id>
			font = text_a5
			scale = 1.0
			rgba = [128 128 128 250]
			text = <level>
			pos = (400.0, 0.0)
			just = [left top]
			internal_just = [left top]
			z_priority = 10.0
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
			]
		}
		createscreenelement {
			type = textelement
			parent = <server_id>
			font = text_a5
			scale = 1.0
			rgba = [128 128 128 250]
			text = <game_type>
			pos = (675.0, 0.0)
			just = [left top]
			internal_just = [left top]
			z_priority = 10.0
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
			]
		}
		formattext textname = text "%n" n = <qos>
		createscreenelement {
			type = textelement
			parent = <server_id>
			font = text_a5
			scale = 0.75
			rgba = [128 128 128 250]
			text = <text>
			pos = (900.0, 0.0)
			just = [left top]
			internal_just = [left top]
			z_priority = 10.0
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
			]
		}
	endif
endscript
