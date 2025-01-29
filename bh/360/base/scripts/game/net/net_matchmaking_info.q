net_matchmaking_container_pos = (300.0, 100.0)
net_matchmaking_text_font = fontgrid_text_A1
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
	if ScreenElementExists \{id = net_matchmaking_info}
		DestroyScreenElement \{id = net_matchmaking_info}
	endif
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = net_matchmaking_info
		Pos = $net_matchmaking_container_pos
		just = [
			left
			top
		]}
	<cont_id> = <id>
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		texture = white
		dims = (1280.0, 720.0)
		just = [left top]
		rgba = [0 0 0 180]
		Pos = (-100.0, -100.0)
		z_priority = 9
	}
	net_create_matchmaking_match_headers cont_id = <cont_id>
	net_create_matchmaking_session_menu {
		parent_id = <cont_id>
		cont_id = net_matchmaking_host_session
		vmenu_id = net_matchmaking_host_session_vmenu
		Pos = (0.0, 90.0)
		Title = qs(0xe0cad609)
	}
	net_create_matchmaking_session_menu {
		parent_id = <cont_id>
		cont_id = net_matchmaking_join_session
		vmenu_id = net_matchmaking_join_session_vmenu
		Pos = (0.0, 330.0)
		Title = qs(0xb204888a)
	}
	RunScriptOnScreenElement {
		id = <cont_id>
		params = {obj_id = <cont_id>}
		net_matchmaking_status_window_update_spawned
	}
endscript

script net_matchmaking_status_window_update_spawned 
	printf \{qs(0xd842af37)}
	RequireParams \{[
			obj_id
		]
		all}
	wait \{0.1
		seconds}
	begin
	if NOT NetSessionFunc \{Obj = match
			func = is_matchmaking_active}
		printf \{qs(0x68c883cd)}
		break
	endif
	NetSessionFunc \{Obj = match
		func = get_matchmaking_status}
	net_matchmaking_status_window_update <...>
	wait \{0.1
		seconds}
	repeat
	wait \{10
		seconds}
	if ScreenElementExists id = <obj_id>
		DestroyScreenElement id = <obj_id>
	endif
endscript

script net_matchmaking_status_window_update 
	RequireParams \{[
			mode
			state
		]
		all}
	if NOT GotParam \{num_reserved_spots}
		num_reserved_spots = -1
	endif
	net_integer_to_string int = <num_reserved_spots>
	SetScreenElementProps {
		id = net_matchmaking_reserved_spots_text
		text = <display_string>
	}
	if NOT GotParam \{num_session_spots}
		num_session_spots = -1
	endif
	net_integer_to_string int = <num_session_spots>
	SetScreenElementProps {
		id = net_matchmaking_max_spots_text
		text = <display_string>
	}
	net_get_matchmaking_mode_string mode = <mode>
	SetScreenElementProps {
		id = net_matchmaking_mode_text
		text = <display_string>
	}
	net_get_matchmaking_state_string state = <state>
	SetScreenElementProps {
		id = net_matchmaking_state_text
		text = <display_string>
	}
	net_integer_to_string int = <hosting_time_left>
	SetScreenElementProps {
		id = net_matchmaking_host_time_text
		text = <display_string>
	}
	if GotParam \{host_session}
		GetArraySize \{host_session}
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
	if GotParam \{join_session}
		GetArraySize \{join_session}
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
	RequireParams \{[
			parent_id
			id
		]
		all}
	DestroyScreenElement id = <parent_id> preserve_parent
	<res_id> = <id>
	<text_color> = $net_matchmaking_text_color
	<text_scale> = $net_matchmaking_sub_text_scale
	<default_just> = $net_matchmaking_just
	<z_priority> = 10
	CreateScreenElement {
		type = ContainerElement
		parent = <parent_id>
		Pos = <Pos>
		just = [left top]
	}
	<cont_id> = <id>
	if NOT GotParam \{res_id}
		res_id = -1
	endif
	FormatText TextName = display_string qs(0x7bba07da) d = <res_id> t = <ticket>
	CreateScreenElement {
		type = TextElement
		local_id = id_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = <display_string>
		scale = <text_scale>
		just = [left top]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	get_stacked_element_pos id = <id>
	net_get_reservation_mode_string mode = <mode>
	CreateScreenElement {
		type = TextElement
		local_id = id_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = <display_string>
		scale = <text_scale>
		just = [left top]
		Pos = <stacked_pos>
		z_priority = <z_priority>
		rgba = <text_color>
	}
	get_stacked_element_pos id = <id>
	net_get_reservation_state_string state = <state>
	CreateScreenElement {
		type = TextElement
		local_id = id_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = <display_string>
		scale = <text_scale>
		just = [left top]
		Pos = <stacked_pos>
		z_priority = <z_priority>
		rgba = <text_color>
	}
	get_stacked_element_pos id = <id>
	cont_size = <stacked_pos>
	SetScreenElementProps {
		id = <cont_id>
		dims = <cont_size>
	}
	CreateScreenElement {
		type = vmenu
		parent = <cont_id>
		just = [left top]
		Pos = (0.0, 10.0)
	}
	connection_vmenu_id = <id>
	GetArraySize \{connections}
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
	CreateScreenElement {
		type = ContainerElement
		parent = <parent_id>
		just = [left top]
	}
	cont_id = <id>
	default_params = {
		type = TextElement
		parent = <cont_id>
		rgba = $net_matchmaking_text_color
		scale = $net_matchmaking_sub_squeeze_text_scale
		just = $net_matchmaking_just
		z_priority = 10
		font = $net_matchmaking_text_font
	}
	get_reservation_client_state_string state = <test_state>
	<test_state_string> = <display_string>
	if GotParam \{instrument}
		get_reservation_player_instrument_string instrument = <instrument>
		<instrument_string> = <display_string>
	else
		<instrument_string> = qs(0x4b8729ef)
	endif
	FormatText {
		TextName = display_string
		qs(0x1a95c29f)
		d = <finished>
		e = <has_conn_handle>
		f = <ready>
		g = <retrieved>
		H = <test_conn>
		i = <test_state_string>
		j = <instrument_string>
	}
	CreateScreenElement {
		<default_params>
		text = <display_string>
		Pos = (110.0, 0.0)
	}
	get_stacked_element_pos id = <id>
	cont_size = <stacked_pos>
	SetScreenElementProps {
		id = <cont_id>
		dims = <cont_size>
	}
endscript

script get_stacked_element_pos 
	RequireParams \{[
			id
		]
		all}
	GetScreenElementDims id = <id>
	GetScreenElementProps id = <id>
	return stacked_pos = (<Pos> + <height> * (0.0, 1.0))
endscript

script net_integer_to_string 
	FormatText TextName = display_string qs(0x48c6d14c) d = <int>
	return display_string = <display_string>
endscript

script net_create_matchmaking_session_menu 
	printf \{qs(0xdf58169b)}
	RequireParams \{[
			parent_id
			cont_id
			vmenu_id
			Pos
		]
		all}
	<text_color> = $net_matchmaking_text_color
	<text_scale> = $net_matchmaking_text_scale
	<default_just> = $net_matchmaking_just
	<z_priority> = 10
	CreateScreenElement {
		type = ContainerElement
		parent = <parent_id>
		id = <cont_id>
		Pos = <Pos>
		just = [left top]
	}
	CreateScreenElement {
		type = TextElement
		local_id = net_matchmaking_session_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = <Title>
		scale = $net_matchmaking_text_scale
		just = [left top]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = vmenu
		id = <vmenu_id>
		parent = <cont_id>
		just = [left top]
		Pos = (0.0, 30.0)
	}
endscript

script net_create_matchmaking_match_headers 
	printf \{qs(0xba3793d3)}
	RequireParams \{[
			cont_id
		]
		all}
	<text_color> = $net_matchmaking_text_color
	<text_scale> = $net_matchmaking_text_scale
	<default_just> = $net_matchmaking_just
	<z_priority> = 10
	CreateScreenElement {
		type = TextElement
		id = net_matchmaking_mode_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x845fd7c5)
		scale = $net_matchmaking_text_scale
		just = [left top]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = TextElement
		id = net_matchmaking_state_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x166e42ae)
		scale = $net_matchmaking_text_scale
		just = [left top]
		Pos = (300.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = ContainerElement
		parent = <cont_id>
		id = net_matchmaking_host_time_cont
		Pos = (0.0, 60.0)
		just = [left top]
	}
	<sub_cont_id> = <id>
	CreateScreenElement {
		type = TextElement
		local_id = label
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs(0xbcc4efde)
		scale = $net_matchmaking_text_scale
		just = [left top]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = TextElement
		id = net_matchmaking_host_time_text
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x4abe50b2)
		scale = $net_matchmaking_text_scale
		just = [left top]
		Pos = (200.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = ContainerElement
		parent = <cont_id>
		id = net_matchmaking_host_max_spots_cont
		Pos = (300.0, 30.0)
		just = [left top]
	}
	<sub_cont_id> = <id>
	CreateScreenElement {
		type = TextElement
		local_id = label
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x62fcc959)
		scale = $net_matchmaking_text_scale
		just = [left top]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = TextElement
		id = net_matchmaking_max_spots_text
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x4abe50b2)
		scale = $net_matchmaking_text_scale
		just = [left top]
		Pos = (180.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = ContainerElement
		parent = <cont_id>
		id = net_matchmaking_host_reserved_spots_cont
		Pos = (0.0, 30.0)
		just = [left top]
	}
	<sub_cont_id> = <id>
	CreateScreenElement {
		type = TextElement
		local_id = label
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x45d37bd5)
		scale = $net_matchmaking_text_scale
		just = [left top]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = TextElement
		id = net_matchmaking_reserved_spots_text
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs(0x4abe50b2)
		scale = $net_matchmaking_text_scale
		just = [left top]
		Pos = (250.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
endscript

script net_get_matchmaking_state_string 
	RequireParams \{[
			state
		]
		all}
	display_string = qs(0x00000000)
	switch (<state>)
		case eIDLE
		display_string = qs(0x56106345)
		case eWAITING_FOR_LOBBY
		display_string = qs(0x2c025484)
		case eCREATING
		display_string = qs(0x678349b4)
		case eHOSTING
		display_string = qs(0xedb81eb5)
		case eSEARCHING
		display_string = qs(0x9b97c7b2)
		case eFINISHED_SEARCHING
		display_string = qs(0xa3d7caf5)
		case eFAILED_SEARCHING
		display_string = qs(0x165e34e1)
		case eFAILED_HOSTING
		display_string = qs(0x66054d33)
		case eINGAME
		display_string = qs(0x87d5f72e)
		case eCREATING_RANKED_SESSION
		display_string = qs(0x0fd153cb)
		case eNOTHING
		display_string = qs(0xdcb26a1e)
		default
		printstruct <...>
		display_string = qs(0x54ddb253)
	endswitch
	return display_string = <display_string>
endscript

script net_get_matchmaking_mode_string 
	RequireParams \{[
			mode
		]
		all}
	display_string = qs(0x00000000)
	switch (<mode>)
		case vMODE_AUTOMATCH
		display_string = qs(0x9cea38f2)
		case vMODE_OPTIMATCH
		display_string = qs(0x6114e414)
		case vMODE_QUICKMATCH
		display_string = qs(0x0cfb9975)
		default
		display_string = qs(0x54ddb253)
	endswitch
	return display_string = <display_string>
endscript

script net_get_reservation_mode_string 
	RequireParams \{[
			mode
		]
		all}
	display_string = qs(0x00000000)
	switch (<mode>)
		case eJOINER
		display_string = qs(0x9239f003)
		case eHOSTING
		display_string = qs(0xedb81eb5)
		case eCLIENT
		display_string = qs(0x0f3ba1d5)
		case eINVALID_RESERVATION_MODE
		default
		printstruct <...>
		display_string = qs(0x54ddb253)
	endswitch
	return display_string = <display_string>
endscript

script net_get_reservation_state_string 
	RequireParams \{[
			state
		]
		all}
	display_string = qs(0x00000000)
	switch (<state>)
		case eRESERVING_SPOTS
		display_string = qs(0x41e810ef)
		case eRESERVATION_CANCEL
		display_string = qs(0x8ea34f8a)
		case eCLIENTS_TESTING_NEW_HOST
		display_string = qs(0x67ca7e71)
		case eCLIENTS_JOINING_NEW_HOST
		display_string = qs(0x6fd5154b)
		case eJOINING_RESERVED_SESSION
		display_string = qs(0xd9218470)
		case eWAITING_FOR_JOINS
		display_string = qs(0xf5527a70)
		case eRESERVED_SPOTS
		display_string = qs(0xdee61621)
		case eRESERVATION_CANCELED
		display_string = qs(0x8ea34f8a)
		case eRESERVATION_COMPLETE
		display_string = qs(0x37c1b949)
		case eRESERVATION_REJECTED
		display_string = qs(0xf8b2add7)
		case eWAITING_COMMAND
		display_string = qs(0x4232fad3)
		case ePREPARING_TEST_SESSION
		display_string = qs(0x586f3c02)
		case eTESTING_CONNECTION
		display_string = qs(0x3aaf4f0c)
		case eRESERVATION_JOIN
		display_string = qs(0x2a99d09f)
		case eJOIN_GAME
		display_string = qs(0xd9aee37f)
		case eFAILED
		display_string = qs(0xd8aa99ed)
		case eSUCCEEDED
		display_string = qs(0xddca3e98)
		case eREADY_FOR_DELETE
		display_string = qs(0xd5cf8f53)
		case eINVALID_RESERVATION_STATE
		default
		display_string = qs(0xd3da77ba)
	endswitch
	return display_string = <display_string>
endscript

script get_reservation_client_state_string 
	RequireParams \{[
			state
		]
		all}
	display_string = qs(0x00000000)
	switch (<state>)
		case eNOT_TESTED
		display_string = qs(0xa42a61f4)
		case eTESTING
		display_string = qs(0xbb126885)
		case eSUCCESS
		display_string = qs(0x88d23d1f)
		case eFAILED
		display_string = qs(0xd8aa99ed)
		default
		display_string = qs(0x54ddb253)
		printstruct <...>
	endswitch
	return display_string = <display_string>
endscript

script get_reservation_player_instrument_string 
	RequireParams \{[
			instrument
		]
		all}
	display_string = qs(0x00000000)
	switch (<instrument>)
		case eGUITAR
		display_string = qs(0x11355666)
		case eMICROPHONE
		display_string = qs(0xe293335b)
		case eDRUMS
		display_string = qs(0xf3e03f27)
		default
		display_string = qs(0x54ddb253)
		printstruct <...>
	endswitch
	return display_string = <display_string>
endscript
