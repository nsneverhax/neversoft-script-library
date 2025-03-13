net_matchmaking_container_pos = (300.0, 100.0)
net_matchmaking_text_font = fontgrid_text_a1
net_matchmaking_text_color = [
	200
	200
	200
	255
]
net_matchmaking_text_scale = (0.7, 0.7)
net_matchmaking_sub_text_scale = (0.5, 0.5)
net_matchmaking_sub_squeeze_text_scale = (0.4, 0.5)
net_matchmaking_just = [
	left
	top
]

script net_create_matchmaking_status_window 
	printf \{qs(0xc25f6f5a)}
	if screenelementexists \{id = net_matchmaking_info}
		destroyscreenelement \{id = net_matchmaking_info}
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = net_matchmaking_info
		pos = $net_matchmaking_container_pos
		just = [
			left
			top
		]}
	<cont_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		texture = white
		dims = (1280.0, 720.0)
		just = [left top]
		rgba = [0 0 0 180]
		pos = (-100.0, -100.0)
		z_priority = 9
	}
	net_create_matchmaking_match_headers cont_id = <cont_id>
	net_create_matchmaking_session_menu {
		parent_id = <cont_id>
		cont_id = net_matchmaking_host_session
		vmenu_id = net_matchmaking_host_session_vmenu
		pos = (0.0, 90.0)
		title = qs(0xe0cad609)
	}
	net_create_matchmaking_session_menu {
		parent_id = <cont_id>
		cont_id = net_matchmaking_join_session
		vmenu_id = net_matchmaking_join_session_vmenu
		pos = (0.0, 330.0)
		title = qs(0xb204888a)
	}
	runscriptonscreenelement {
		id = <cont_id>
		params = {obj_id = <cont_id>}
		net_matchmaking_status_window_update_spawned
	}
endscript

script net_matchmaking_status_window_update_spawned 
	printf \{qs(0xd842af37)}
	requireparams \{[
			obj_id
		]
		all}
	wait \{0.1
		seconds}
	begin
	if NOT netsessionfunc \{obj = match
			func = is_matchmaking_active}
		printf \{qs(0x68c883cd)}
		break
	endif
	netsessionfunc \{obj = match
		func = get_matchmaking_status}
	net_matchmaking_status_window_update <...>
	wait \{0.1
		seconds}
	repeat
	wait \{10
		seconds}
	if screenelementexists id = <obj_id>
		destroyscreenelement id = <obj_id>
	endif
endscript

script net_matchmaking_status_window_update 
	requireparams \{[
			mode
			state
		]
		all}
	if NOT gotparam \{num_reserved_spots}
		num_reserved_spots = -1
	endif
	net_integer_to_string int = <num_reserved_spots>
	setscreenelementprops {
		id = net_matchmaking_reserved_spots_text
		text = <display_string>
	}
	if NOT gotparam \{num_session_spots}
		num_session_spots = -1
	endif
	net_integer_to_string int = <num_session_spots>
	setscreenelementprops {
		id = net_matchmaking_max_spots_text
		text = <display_string>
	}
	net_get_matchmaking_mode_string mode = <mode>
	setscreenelementprops {
		id = net_matchmaking_mode_text
		text = <display_string>
	}
	net_get_matchmaking_state_string state = <state>
	setscreenelementprops {
		id = net_matchmaking_state_text
		text = <display_string>
	}
	net_integer_to_string int = <hosting_time_left>
	setscreenelementprops {
		id = net_matchmaking_host_time_text
		text = <display_string>
	}
	if gotparam \{host_session}
		getarraysize \{host_session}
		if (<array_size> > 0)
			<i> = 0
			begin
			net_create_matchmaking_reservation_menu {
				(<host_session> [<i>])
				parent_id = net_matchmaking_host_session_vmenu
			}
			repeat <array_size>
		endif
	endif
	if gotparam \{join_session}
		getarraysize \{join_session}
		if (<array_size> > 0)
			<i> = 0
			begin
			net_create_matchmaking_reservation_menu {
				(<join_session> [<i>])
				parent_id = net_matchmaking_join_session_vmenu
			}
			repeat <array_size>
		endif
	endif
endscript

script net_create_matchmaking_reservation_menu 
	requireparams \{[
			parent_id
			id
		]
		all}
	destroyscreenelement id = <parent_id> preserve_parent
	<res_id> = <id>
	<text_color> = $net_matchmaking_text_color
	<text_scale> = $net_matchmaking_sub_text_scale
	<default_just> = $net_matchmaking_just
	<z_priority> = 10
	createscreenelement {
		type = containerelement
		parent = <parent_id>
		pos = <pos>
		just = [left top]
	}
	<cont_id> = <id>
	if NOT gotparam \{res_id}
		res_id = -1
	endif
	formattext textname = display_string qs(0x7bba07da) d = <res_id> t = <ticket>
	createscreenelement {
		type = textelement
		local_id = id_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = <display_string>
		scale = <text_scale>
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	get_stacked_element_pos id = <id>
	net_get_reservation_mode_string mode = <mode>
	createscreenelement {
		type = textelement
		local_id = id_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = <display_string>
		scale = <text_scale>
		just = [left top]
		pos = <stacked_pos>
		z_priority = <z_priority>
		rgba = <text_color>
	}
	get_stacked_element_pos id = <id>
	net_get_reservation_state_string state = <state>
	createscreenelement {
		type = textelement
		local_id = id_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = <display_string>
		scale = <text_scale>
		just = [left top]
		pos = <stacked_pos>
		z_priority = <z_priority>
		rgba = <text_color>
	}
	get_stacked_element_pos id = <id>
	cont_size = <stacked_pos>
	setscreenelementprops {
		id = <cont_id>
		dims = <cont_size>
	}
	createscreenelement {
		type = vmenu
		parent = <cont_id>
		just = [left top]
		pos = (0.0, 10.0)
	}
	connection_vmenu_id = <id>
	getarraysize \{connections}
	if (<array_size> > 0)
		i = 0
		begin
		net_create_reservation_connection_entry {
			(<connections> [<i>])
			parent_id = <connection_vmenu_id>
		}
		repeat <array_size>
	endif
endscript

script net_create_reservation_connection_entry 
	createscreenelement {
		type = containerelement
		parent = <parent_id>
		just = [left top]
	}
	cont_id = <id>
	default_params = {
		type = textelement
		parent = <cont_id>
		rgba = $net_matchmaking_text_color
		scale = $net_matchmaking_sub_squeeze_text_scale
		just = $net_matchmaking_just
		z_priority = 10
		font = $net_matchmaking_text_font
	}
	get_reservation_client_state_string state = <test_state>
	<test_state_string> = <display_string>
	if gotparam \{instrument}
		get_reservation_player_instrument_string instrument = <instrument>
		<instrument_string> = <display_string>
	else
		<instrument_string> = qs(0x4b8729ef)
	endif
	formattext {
		textname = display_string
		qs(0x1a95c29f)
		d = <finished>
		e = <has_conn_handle>
		f = <ready>
		g = <retrieved>
		h = <test_conn>
		i = <test_state_string>
		j = <instrument_string>
	}
	createscreenelement {
		<default_params>
		text = <display_string>
		pos = (110.0, 0.0)
	}
	get_stacked_element_pos id = <id>
	cont_size = <stacked_pos>
	setscreenelementprops {
		id = <cont_id>
		dims = <cont_size>
	}
endscript

script get_stacked_element_pos 
	requireparams \{[
			id
		]
		all}
	getscreenelementdims id = <id>
	getscreenelementprops id = <id>
	return stacked_pos = (<pos> + <height> * (0.0, 1.0))
endscript

script net_integer_to_string 
	formattext textname = display_string qs(0x48c6d14c) d = <int>
	return display_string = <display_string>
endscript

script net_create_matchmaking_session_menu 
	printf \{qs(0xdf58169b)}
	requireparams \{[
			parent_id
			cont_id
			vmenu_id
			pos
		]
		all}
	<text_color> = $net_matchmaking_text_color
	<text_scale> = $net_matchmaking_text_scale
	<default_just> = $net_matchmaking_just
	<z_priority> = 10
	createscreenelement {
		type = containerelement
		parent = <parent_id>
		id = <cont_id>
		pos = <pos>
		just = [left top]
	}
	createscreenelement {
		type = textelement
		local_id = net_matchmaking_session_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = <title>
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	createscreenelement {
		type = vmenu
		id = <vmenu_id>
		parent = <cont_id>
		just = [left top]
		pos = (0.0, 30.0)
	}
endscript

script net_create_matchmaking_match_headers 
	printf \{qs(0xba3793d3)}
	requireparams \{[
			cont_id
		]
		all}
	<text_color> = $net_matchmaking_text_color
	<text_scale> = $net_matchmaking_text_scale
	<default_just> = $net_matchmaking_just
	<z_priority> = 10
	createscreenelement {
		type = textelement
		id = net_matchmaking_mode_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x845fd7c5)
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	createscreenelement {
		type = textelement
		id = net_matchmaking_state_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x166e42ae)
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (300.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	createscreenelement {
		type = containerelement
		parent = <cont_id>
		id = net_matchmaking_host_time_cont
		pos = (0.0, 60.0)
		just = [left top]
	}
	<sub_cont_id> = <id>
	createscreenelement {
		type = textelement
		local_id = label
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs(0xbcc4efde)
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	createscreenelement {
		type = textelement
		id = net_matchmaking_host_time_text
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x4abe50b2)
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (200.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	createscreenelement {
		type = containerelement
		parent = <cont_id>
		id = net_matchmaking_host_max_spots_cont
		pos = (300.0, 30.0)
		just = [left top]
	}
	<sub_cont_id> = <id>
	createscreenelement {
		type = textelement
		local_id = label
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x62fcc959)
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	createscreenelement {
		type = textelement
		id = net_matchmaking_max_spots_text
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x4abe50b2)
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (180.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	createscreenelement {
		type = containerelement
		parent = <cont_id>
		id = net_matchmaking_host_reserved_spots_cont
		pos = (0.0, 30.0)
		just = [left top]
	}
	<sub_cont_id> = <id>
	createscreenelement {
		type = textelement
		local_id = label
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x45d37bd5)
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	createscreenelement {
		type = textelement
		id = net_matchmaking_reserved_spots_text
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x4abe50b2)
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (250.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
endscript

script net_get_matchmaking_state_string 
	requireparams \{[
			state
		]
		all}
	display_string = qs(0x00000000)
	switch (<state>)
		case eidle
		display_string = qs(0x56106345)
		case ewaiting_for_lobby
		display_string = qs(0x2c025484)
		case ecreating
		display_string = qs(0x678349b4)
		case ehosting
		display_string = qs(0xedb81eb5)
		case esearching
		display_string = qs(0x9b97c7b2)
		case efinished_searching
		display_string = qs(0xa3d7caf5)
		case efailed_searching
		display_string = qs(0x165e34e1)
		case efailed_hosting
		display_string = qs(0x66054d33)
		case eingame
		display_string = qs(0x87d5f72e)
		case ecreating_ranked_session
		display_string = qs(0x0fd153cb)
		case enothing
		display_string = qs(0xdcb26a1e)
		default
		printstruct <...>
		display_string = qs(0x54ddb253)
	endswitch
	return display_string = <display_string>
endscript

script net_get_matchmaking_mode_string 
	requireparams \{[
			mode
		]
		all}
	display_string = qs(0x00000000)
	switch (<mode>)
		case vmode_automatch
		display_string = qs(0x9cea38f2)
		case vmode_optimatch
		display_string = qs(0x6114e414)
		case vmode_quickmatch
		display_string = qs(0x0cfb9975)
		default
		display_string = qs(0x54ddb253)
	endswitch
	return display_string = <display_string>
endscript

script net_get_reservation_mode_string 
	requireparams \{[
			mode
		]
		all}
	display_string = qs(0x00000000)
	switch (<mode>)
		case ejoiner
		display_string = qs(0x9239f003)
		case ehosting
		display_string = qs(0xedb81eb5)
		case eclient
		display_string = qs(0x0f3ba1d5)
		case einvalid_reservation_mode
		default
		printstruct <...>
		display_string = qs(0x54ddb253)
	endswitch
	return display_string = <display_string>
endscript

script net_get_reservation_state_string 
	requireparams \{[
			state
		]
		all}
	display_string = qs(0x00000000)
	switch (<state>)
		case ereserving_spots
		display_string = qs(0x41e810ef)
		case ereservation_cancel
		display_string = qs(0x8ea34f8a)
		case eclients_testing_new_host
		display_string = qs(0x67ca7e71)
		case eclients_joining_new_host
		display_string = qs(0x6fd5154b)
		case ejoining_reserved_session
		display_string = qs(0xd9218470)
		case ewaiting_for_joins
		display_string = qs(0xf5527a70)
		case ereserved_spots
		display_string = qs(0xdee61621)
		case ereservation_canceled
		display_string = qs(0x8ea34f8a)
		case ereservation_complete
		display_string = qs(0x37c1b949)
		case ereservation_rejected
		display_string = qs(0xf8b2add7)
		case ewaiting_command
		display_string = qs(0x4232fad3)
		case epreparing_test_session
		display_string = qs(0x586f3c02)
		case etesting_connection
		display_string = qs(0x3aaf4f0c)
		case ereservation_join
		display_string = qs(0x2a99d09f)
		case ejoin_game
		display_string = qs(0xd9aee37f)
		case efailed
		display_string = qs(0xd8aa99ed)
		case esucceeded
		display_string = qs(0xddca3e98)
		case eready_for_delete
		display_string = qs(0xd5cf8f53)
		case einvalid_reservation_state
		default
		display_string = qs(0xd3da77ba)
	endswitch
	return display_string = <display_string>
endscript

script get_reservation_client_state_string 
	requireparams \{[
			state
		]
		all}
	display_string = qs(0x00000000)
	switch (<state>)
		case enot_tested
		display_string = qs(0xa42a61f4)
		case etesting
		display_string = qs(0xbb126885)
		case esuccess
		display_string = qs(0x88d23d1f)
		case efailed
		display_string = qs(0xd8aa99ed)
		default
		display_string = qs(0x54ddb253)
		printstruct <...>
	endswitch
	return display_string = <display_string>
endscript

script get_reservation_player_instrument_string 
	requireparams \{[
			instrument
		]
		all}
	display_string = qs(0x00000000)
	switch (<instrument>)
		case eguitar
		display_string = qs(0x11355666)
		case emicrophone
		display_string = qs(0xe293335b)
		case edrums
		display_string = qs(0xf3e03f27)
		default
		display_string = qs(0x54ddb253)
		printstruct <...>
	endswitch
	return display_string = <display_string>
endscript
