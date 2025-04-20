game_type_round_list_entry_color = [
	0
	0
	0
	255
]
game_type_round_list_entry_disabled_color = [
	88
	88
	88
	255
]
game_type_round_list_entry_focus_color = [
	255
	0
	0
	255
]
game_type_round_list_pos = (650.0, 140.0)
game_type_round_list_item_offset = (10.0, 0.0)
game_type_round_list_shadow_offs = (4.0, 4.0)
game_type_round_list_shadow_rgba = [
	128
	128
	128
	255
]
game_type_popup_bg_color = [
	200
	200
	200
	255
]

script back_to_pause 
	ui_change_state \{state = uistate_pausemenu}
endscript

script back_to_2player_create 
	ui_change_state \{state = UIstate_2player_create_game}
endscript

script back_to_pause_and_apply_settings 
	NetRoundFunc {
		func = set_game_settings
		params = ($net_rounds_settings_struct)
	}
	wait \{5
		gameframes}
	ui_change_state \{state = uistate_pausemenu}
endscript

script ui_net_2p_can_start_game 
	printf \{"--ui_net_2p_can_start_game"}
	getcurrentlevel
	if checksumequals a = graffiti b = <game_type>
		if (<level> = load_z_crib)
			return \{false}
		endif
	endif
	if (<level> = load_z_crib)
		getpreferencechecksum pref_type = <pref_type> score_mode
		if (<checksum> = tag_scoring)
			return \{false}
		endif
	endif
	return \{true}
endscript

script ui_net_2p_can_choose_gametype 
	if checksumequals a = graffiti b = <checksum>
		getcurrentlevel
		if (<level> = load_z_crib)
			return \{false}
		endif
	endif
	return \{true}
endscript

script ui_create_net_gametype 
	printf "UI: ui_create_net_gametype"
	NetRoundFunc {
		func = send_message
		params = {
			message = editing_rounds
		}
	}
	if innetgame
		back_state = uistate_pausemenu
	else
		back_state = UIstate_2player_create_game
	endif
	pad_back_script = back_to_pause
	if NOT innetgame
		pad_back_script = back_to_2player_create
	endif
	if innetgame
		if ($enable_net_rounds = 1)
			pad_back_script = back_to_pause_and_apply_settings
		endif
	endif
	make_cas_menu {
		title = "GAME TYPE"
		menu_id = net_gametype_menu_cont
		vmenu_id = net_gametype_menu_vmenu
		pad_back_script = <pad_back_script>
		pausemenu
		pos = (145.0, 0.0)
		selection_height = 27
		highlight_add = (20.0, 0.0)
	}
	if NOT innetgame
		create_game_type_text parent = current_menu_anchor
	else
		spawnscript game_type_net_rounds_wait_and_refresh
	endif
	if screenelementexists id = current_menu
		setscreenelementprops {
			id = current_menu
			pos = (160.0, 105.0)
		}
	endif
	if screenelementexists id = pause_title_container
		setscreenelementprops {
			id = pause_title_container
			pos = (0.0, 110.0)
		}
	endif
	if screenelementexists id = pausemenu_icon_movie
		doscreenelementmorph {
			id = pausemenu_icon_movie
			scale = (410.0, 230.0)
			pos = (300.0, 0.0)
		}
	endif
	if innetgame
		<game_type_array> = $net_game_type_info
		<pref_type> = network
	else
		<game_type_array> = $mp_game_type_info
		<pref_type> = splitscreen
	endif
	if ($enable_net_rounds = 1)
		if innetgame
			create_messy_white_bg {
				parent = current_menu_anchor
				id = game_type_white_bg
			}
			create_game_type_net_rounds_list
			setscreenelementprops {
				id = current_menu
				event_handlers = [
					{pad_square game_type_round_list_menu_enter}
				]
			}
			arrow_params = {
				id = net_round_settings_score_mode_item
				item_name = score_mode
				array = $net_rounds_score_mode_options
				element = checksum
				type = checksum
				global = net_rounds_settings_struct
				redraw_script = ui_create_net_gametype
			}
			add_cas_menu_item {
				text = "SCORE MODE:"
				extra_text = "null"
				id = net_round_settings_score_mode_item
				option_arrows
				option_arrows_callback = net_gametype_adjust_host_option
				option_arrows_callback_params = <arrow_params>
			}
			net_gametype_adjust_host_option <arrow_params>
			switch (($net_rounds_settings_struct).score_mode)
				case rounds
				arrow_params = {
					id = net_round_settings_score_value_item
					item_name = rounds
					array = $net_rounds_round_num_options
					element = value
					type = int
					global = net_rounds_settings_struct
					apply_script = net_rounds_apply_settings
					default_idx = 2
				}
				add_cas_menu_item {
					text = "ROUNDS:"
					extra_text = "null"
					id = net_round_settings_score_value_item
					option_arrows
					option_arrows_callback = net_gametype_adjust_host_option
					option_arrows_callback_params = <arrow_params>
				}
				net_gametype_adjust_host_option <arrow_params>
				case points
				arrow_params = {
					id = net_round_settings_score_value_item
					item_name = points
					array = $net_rounds_point_num_options
					element = value
					type = int
					global = net_rounds_settings_struct
					apply_script = net_rounds_apply_settings
					default_idx = 3
				}
				add_cas_menu_item {
					text = "POINTS:"
					extra_text = "null"
					id = net_round_settings_score_value_item
					option_arrows
					option_arrows_callback = net_gametype_adjust_host_option
					option_arrows_callback_params = <arrow_params>
				}
				net_gametype_adjust_host_option <arrow_params>
			endswitch
			add_cas_menu_item {
				text = "Choose Round Type:"
				not_focusable
			}
		endif
	endif
	getarraysize <game_type_array>
	<counter> = 0
	begin
	getnextarrayelement <game_type_array>
	if gotparam element
		addparams <element>
		if NOT innetgame
			if NOT ui_net_2p_can_choose_gametype <...>
				<not_focusable> = 1
			endif
			add_cas_menu_item {
				text = <name>
				pad_choose_script = set_gametype
				pad_choose_params = {prefs = <pref_type> <...> field = 'game_type' string = <name>}
				not_focusable = <not_focusable>
				additional_focus_script = net_gametype_focus
				additional_focus_params = {description = <description> name = <name>}
			}
			removeparameter not_focusable
		else
			add_cas_menu_item {
				text = <name>
				pad_choose_script = net_rounds_try_add_round
				pad_choose_params = {mode = <checksum> action = add}
				not_focusable = <not_focusable>
			}
			removeparameter not_focusable
		endif
	else
		break
	endif
	repeat
	if NOT innetgame
		cas_menu_finish helper_text = {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
			]
		}
	else
		cas_menu_finish helper_text = {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
				{text = "\\m5 GO TO ROUND LIST"}
			]
		}
	endif
endscript

script game_type_net_rounds_wait_and_refresh 
	wait \{5
		gameframes}
	game_type_net_rounds_refresh
endscript

script create_game_type_net_rounds_list 
	printf "--- create_game_type_net_rounds_list"
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		id = game_type_round_list_cont
		pos = $game_type_round_list_pos
		just = [left top]
	}
	cont_id = <id>
	createscreenelement {
		type = textelement
		local_id = round_num
		parent = <cont_id>
		font = text_a1
		text = "current rounds"
		rgba = $game_type_round_list_entry_color
		scale = 1
		just = [left top]
		shadow
		shadow_offs = $game_type_round_list_shadow_offs
		shadow_rgba = $game_type_round_list_shadow_rgba
	}
	createscreenelement {
		type = vmenu
		id = game_type_round_list_vmenu
		parent = game_type_round_list_cont
		just = [left top]
		pos = (0.0, 50.0)
		event_handlers = [
			{pad_back game_type_round_list_menu_leave}
		]
	}
endscript

script game_type_net_rounds_refresh 
	if NOT screenelementexists id = game_type_round_list_vmenu
		printf "game_type_round_list_vmenu not up! returning"
		return
	endif
	destroyscreenelement {
		id = game_type_round_list_vmenu
		preserve_parent
	}
	game_type_round_list_vmenu :settags pos_offset = (0.0, 0.0)
	NetRoundFunc func = get_round_list
	round_count = 0
	if gotparam round_list
		getarraysize <round_list>
		if (<array_size> > 0)
			i = 0
			begin
			game_type_round_list_add_item {
				(<round_list> [<i>])
				num = (<i> + 1)
			}
			i = (<i> + 1)
			repeat <array_size>
		endif
		round_count = <array_size>
	endif
	net_rounds_get_max_rounds
	blanks_to_add = (<max_rounds> - <round_count>)
	if (<blanks_to_add> > 0)
		i = <round_count>
		begin
		game_type_round_list_add_item {
			blank
			num = (<i> + 1)
		}
		i = (<i> + 1)
		repeat <blanks_to_add>
	endif
endscript

script game_type_round_list_add_item 
	if NOT gotparam blank
		net_rounds_get_game_mode_info mode = <mode>
	endif
	formattext checksumname = cont_id 'game_type_round_entry_%d' d = <num>
	text_scale = $net_rounds_round_list_text_scale
	game_type_round_list_vmenu :getsingletag pos_offset
	pos_offset = (<pos_offset> + $game_type_round_list_item_offset)
	game_type_round_list_vmenu :settags pos_offset = <pos_offset>
	printf "add item"
	createscreenelement {
		type = containerelement
		id = <cont_id>
		parent = game_type_round_list_vmenu
		just = [left top]
		dims = (50.0, 40.0)
		pos = <pos_offset>
		event_handlers = [
			{focus game_type_round_list_item_focus}
			{unfocus game_type_round_list_item_unfocus}
		]
	}
	if NOT gotparam blank
		if ishost
			setscreenelementprops {
				id = <cont_id>
				event_handlers = [
					{pad_square game_type_round_list_remove_round}
					{pad_choose net_gametype_popup_create_menu_ui params = {mode = <mode> round_id = <round_id> action = edit}}
				]
			}
		else
			setscreenelementprops {
				id = <cont_id>
				event_handlers = [
					{pad_choose net_gametype_popup_create_menu_ui params = {mode = <mode> round_id = <round_id> action = view}}
				]
			}
		endif
	endif
	<cont_id> :settags mode = <mode> round_id = <round_id> num = <num> blank = <blank>
	formattext textname = num_text "%d." d = <num>
	createscreenelement {
		type = textelement
		local_id = round_num
		parent = <cont_id>
		font = text_a1
		text = <num_text>
		rgba = $game_type_round_list_entry_color
		scale = <text_scale>
		just = [left top]
		pos = <pos_offset>
		shadow
		shadow_offs = $game_type_round_list_shadow_offs
		shadow_rgba = $game_type_round_list_shadow_rgba
	}
	getscreenelementprops id = <id>
	text_pos = (<pos> + (30.0, 0.0))
	mode_name = ""
	if NOT gotparam blank
		mode_name = (<mode_info>.name)
	endif
	createscreenelement {
		type = textelement
		local_id = round_name
		parent = <cont_id>
		pos = <text_pos>
		font = text_a1
		text = <mode_name>
		rgba = $game_type_round_list_entry_color
		scale = <text_scale>
		just = [left top]
		shadow
		shadow_offs = $game_type_round_list_shadow_offs
		shadow_rgba = $game_type_round_list_shadow_rgba
	}
endscript

script game_type_round_list_remove_round 
	printf "--- net_rounds_round_list_remove_round"
	obj_getid
	<objid> :gettags
	if gotparam blank
		return
	endif
	if NOT gotparam round_id
		return
	endif
	NetRoundFunc {
		func = remove_round
		params = {
			round_num = <round_id>
		}
	}
	wait 5 gameframes
	game_type_net_rounds_refresh
	launchevent type = focus target = game_type_round_list_vmenu
endscript

script game_type_round_list_menu_leave 
	printf "--- game_type_round_list_menu_leave"
	launchevent type = unfocus target = game_type_round_list_vmenu
	launchevent type = focus target = current_menu
	create_helper_text {
		helper_text_elements = [
			{text = "\\m1 BACK"}
			{text = "\\m0 ACCEPT"}
			{text = "\\m5 GO TO ROUND LIST"}
		]
	}
	change in_round_list = 0
endscript

script game_type_round_list_menu_enter 
	printf "--- game_type_round_list_menu_enter"
	launchevent type = unfocus target = current_menu
	launchevent type = focus target = game_type_round_list_vmenu
	if ishost
		create_helper_text {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 EDIT ROUND"}
				{text = "\\m5 REMOVE ROUND"}
			]
		}
	else
		create_helper_text {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 VIEW ROUND"}
			]
		}
	endif
	change in_round_list = 1
endscript
in_round_list = 0

script game_type_round_list_menu_update 
	begin
	wait \{1
		second}
	if ($in_round_list = 0)
		game_type_net_rounds_refresh
	endif
	repeat
endscript

script game_type_round_list_item_focus 
	obj_getid
	setscreenelementprops id = {<objid> child = round_num} rgba = ($game_type_round_list_entry_focus_color)
	setscreenelementprops id = {<objid> child = round_name} rgba = ($game_type_round_list_entry_focus_color)
endscript

script game_type_round_list_item_unfocus 
	obj_getid
	setscreenelementprops id = {<objid> child = round_num} rgba = ($game_type_round_list_entry_color)
	setscreenelementprops id = {<objid> child = round_name} rgba = ($game_type_round_list_entry_color)
endscript

script net_rounds_apply_settings 
	printf \{"--- net_rounds_apply_settings"}
	NetRoundFunc {
		func = set_game_settings
		params = ($net_rounds_settings_struct)
	}
	spawnscript \{game_type_net_rounds_wait_and_refresh}
endscript

script net_rounds_try_add_round 
	printf "--- net_rounds_try_add_round"
	exit_script = net_gametype_popup_create_menu_ui
	NetRoundFunc func = get_round_settings
	switch <score_mode>
		case rounds
		NetRoundFunc func = get_round_count
		if (<round_count> >= <rounds>)
			exit_script = net_rounds_too_many_rounds
		endif
	endswitch
	if checksumequals a = net_line b = <mode>
		isusingbarrier
		getcurrentlevel
		if (<AreUsingBarrier> = 0)
			exit_script = net_line_error_dialog
		elseif (<level> = load_z_crib)
			exit_script = net_line_error_dialog
		endif
	endif
	if checksumequals a = net_nail b = <mode>
		isusingbarrier
		getcurrentlevel
		if (<AreUsingBarrier> = 0)
			exit_script = net_nail_error_dialog
		endif
	endif
	if checksumequals a = netgraffiti b = <mode>
		getcurrentlevel
		if (<level> = load_z_crib)
			exit_script = net_crib_graffiti_error
		endif
	endif
	<exit_script> <...>
endscript

script net_nail_error_dialog 
	create_dialog_box {
		title = "NET NAIL ERROR"
		text = "It is only possible to play net line in DC, Philly, Baltimore, or your Skate Lounge."
		just = [center center]
		z_priority = 1000
		pad_back_script = net_dialog_box_exit
		buttons = [
			{font = text_a1 text = "ok" pad_choose_script = net_gametype_error_dialog_destroy}
		]
	}
endscript

script net_line_error_dialog 
	create_dialog_box {
		title = "NET LINE ERROR"
		text = "It is only possible to play net line in DC, Philly, or Baltimore."
		just = [center center]
		z_priority = 1000
		pad_back_script = net_dialog_box_exit
		buttons = [
			{font = text_a1 text = "ok" pad_choose_script = net_gametype_error_dialog_destroy}
		]
	}
endscript

script net_dialog_box_exit 
	destroy_dialog_box
	restore_start_key_binding
endscript

script net_crib_graffiti_error 
	create_dialog_box {
		title = "NET GRAFFITI ERROR"
		text = "Graffiti is not allowed in the skater lounge."
		just = [center center]
		z_priority = 1000
		pad_back_script = net_dialog_box_exit
		buttons = [
			{font = text_a1 text = "ok" pad_choose_script = net_gametype_error_dialog_destroy}
		]
	}
endscript

script net_gametype_error_dialog_destroy 
	destroy_dialog_box
	restore_start_key_binding
endscript

script net_rounds_get_max_rounds 
	NetRoundFunc \{func = get_round_settings}
	max_rounds = 5
	switch <score_mode>
		case rounds
		max_rounds = <rounds>
	endswitch
	return max_rounds = <max_rounds>
endscript

script net_rounds_too_many_rounds 
	printf "--- net_rounds_too_many_rounds"
	create_dialog_box {
		title = "TOO MANY ROUNDS"
		text = "You have too many rounds in your round list.  Remove some rounds or increase your round count to add others."
		just = [center center]
		z_priority = 1000
		pad_back_script = net_dialog_box_exit
		buttons = [
			{font = text_a1 text = "ok" pad_choose_script = net_dialog_box_exit}
		]
	}
endscript
net_rounds_add_game_type_struct = {
}

script create_game_type_text 
	printf "--- create_game_type_text"
	getarraysize $net_game_type_info
	if innetgame
		currChecksum = ($net_rounds_add_game_type_struct.game_mode)
	else
		getpreferencechecksum pref_type = splitscreen game_type
		currChecksum = <checksum>
	endif
	<counter> = 0
	begin
	getnextarrayelement $net_game_type_info
	if gotparam element
		addparams <element>
		if checksumequals a = <currChecksum> b = <checksum>
			break
		endif
	else
		break
	endif
	repeat
	GetPreferenceString pref_type = network game_type
	create_messy_white_bg {
		id = net_game_info
		parent = <parent>
	}
	extra_z = 0
	createscreenelement {
		type = containerelement
		id = game_description_cont
		parent = net_game_info
		pos = (80.0, 20.0)
		just = [left top]
		dims = (500.0, 720.0)
	}
	cont_id = <id>
	createscreenelement {
		type = containerelement
		parent = <cont_id>
		id = net_game_title_container
		just = [left top]
		z_priority = (0 + <extra_z>)
		pos = {(0.4, 0.2) proportional}
	}
	createscreenelement {
		type = textelement
		parent = net_game_title_container
		id = net_game_title_text
		font = text_a1
		text = <name>
		rgba = [0 0 0 255]
		pos = {(0.4, 0.0) proportional}
		just = [center center]
		font_spacing = 2
		z_priority = (3 + <extra_z>)
	}
	<id> :domorph pos = {(0.0, 100.0) relative}
	createscreenelement {
		type = textblockelement
		parent = <cont_id>
		id = net_game_desc_text
		font = text_a1
		just = [center top]
		pos = {(0.4, 0.0) proportional}
		dims = (600.0, 500.0)
		rgba = [0 0 0 255]
		text = <description>
		scale = 0.7
		z_priority = 20
	}
	<id> :domorph pos = {(0.0, 150.0) relative}
endscript

script net_gametype_add_round_and_return 
	printf \{"--- net_gametype_add_round_and_return"}
	NetRoundFunc {
		func = add_round
		params = ($net_rounds_add_game_type_struct)
	}
	wait \{5
		gameframes}
	generic_ui_destroy
	ui_create_net_gametype
endscript

script net_gametype_back_to_types 
	generic_ui_destroy
	ui_create_net_gametype
endscript

script ui_destroy_net_gametype 
	printf \{"UI: ui_destroy_net_gametype"}
	generic_ui_destroy
	NetRoundFunc \{func = send_message
		params = {
			message = done_editing_rounds
		}}
endscript

script net_gametype_focus 
	printf \{"focus"}
	if screenelementexists \{id = net_game_desc_text}
		setscreenelementprops {
			id = net_game_desc_text text = <description>
		}
		setscreenelementprops {
			id = net_game_title_text text = <name>
		}
		printstruct <...>
	endif
endscript

script net_gametype_adjust_host_option 
	getarraysize <array>
	if gotparam max_index
		<array_size> = (<max_index> + 1)
	endif
	if NOT gotparam global
		global = net_rounds_add_game_type_struct
	endif
	if structurecontains structure = $<global> <item_name>
		curr_value = ($<global>.<item_name>)
	else
		curr_value = (<array> [0].<element>)
	endif
	<currIndex> = 0
	found_value = 0
	printf "the current value is %s" s = <curr_value>
	getarraysize <array>
	begin
	printf "the UI checksum is '%s'" s = <element>
	printf "the array checksum is '%s'" s = (<array> [<currIndex>].<element>)
	if (<curr_value> = (<array> [<currIndex>].<element>))
		found_value = 1
		break
	endif
	<currIndex> = (<currIndex> + 1)
	repeat <array_size>
	if (<found_value> = 0)
		if gotparam default_idx
			if (<default_idx> >= <array_size>)
				softassert "Default index out of range array_size=%s default_idx=%d" s = <array_size> d = <default_idx>
			endif
			currIndex = <default_idx>
		else
			currIndex = 0
		endif
	endif
	if gotparam left
		if (<currIndex> > 0)
			<currIndex> = (<currIndex> - 1)
			soundevent event = Pause_Menu_Scroll_LEFT_SFX
		endif
	else
		if gotparam right
			if (<currIndex> < (<array_size> - 1))
				<currIndex> = (<currIndex> + 1)
				soundevent event = Pause_Menu_Scroll_RIGHT_SFX
			endif
		endif
	endif
	setscreenelementprops {
		id = {<id> child = extra_text}
		text = (<array> [<currIndex>].name)
	}
	if NetRoundFunc func = in_round_mode
		switch <type>
			case checksum
			updatestructelement {
				struct = <global>
				element = <item_name>
				checksum = (<array> [<currIndex>].<element>)
			}
			case int
			updatestructelement {
				struct = <global>
				element = <item_name>
				value = (<array> [<currIndex>].<element>)
			}
			default
			softassert "bad type passed in!"
		endswitch
		change globalname = <global> newvalue = <newstruct>
	endif
	if (<item_name> = score_mode)
		if gotparam left
			printf "!!!Redraw that shit!!!"
			if NOT gotparam redraw_script
				obj_getid
				net_gametype_popup_fill_menu focus_item = <objid> dont_clear
			else
				<redraw_script>
			endif
		else
			if gotparam right
				printf "!!!Redraw that shit!!!"
				if NOT gotparam redraw_script
					obj_getid
					net_gametype_popup_fill_menu focus_item = <objid> dont_clear
				else
					<redraw_script>
				endif
			endif
		endif
	endif
	if gotparam apply_script
		<apply_script>
	endif
endscript

script net_gametype_create_master_adjust_round_bg 
	printf "--- net_gametype_create_master_adjust_round_bg"
	if screenelementexists id = net_adjust_round_cont
		printf "Whoa, looks like we had one of these menus up already, might be worth investigating..."
		destroyscreenelement id = net_adjust_round_cont
	endif
	position_tweak = (52.0, -20.0)
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		id = net_adjust_round_cont
		pos = <position_tweak>
		just = [left top]
		z_priority = <z_priority>
	}
	cont_id = <id>
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		just = [left top]
		texture = white
		pos = (-100.0, 0.0)
		rgba = [20 20 20 120]
	}
	scale_element_to_size {
		id = <id>
		target_width = 1500
		target_height = 720
	}
	net_gametype_create_popup_bg {
		parent = <cont_id>
		pos = (100.0, 100.0)
	}
	return id = <cont_id> z_priority = <z_priority>
endscript

script net_gametype_create_popup_bg pos = (0.0, 0.0)
	printf "--- net_gametype_create_popup_bg"
	if NOT gotparam parent
		printf "didn't get parent! returning..."
		return
	endif
	if screenelementexists id = net_adjust_round_bg_cont
		printf "whoa, looks like another one of these was already up, destroying..."
		destroyscreenelement id = net_adjust_round_bg_cont
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = net_adjust_round_bg_cont
		pos = <pos>
		just = [left top]
		z_priority = <z_priority>
	}
	cont_id = <id>
	bg_rgba = $game_type_popup_bg_color
	if (Random (@ 0 @ 1 )= 0)
		<left> = {texture = menu_sideA}
		if (Random (@ 0 @ 1 )= 0)
			<left> = {<left> flip_h}
		endif
		<right> = {texture = menu_sideB}
		if (Random (@ 0 @ 1 )= 0)
			<right> = {<right> flip_h}
		endif
	else
		<left> = {texture = menu_sideB flip_v}
		if (Random (@ 0 @ 1 )= 0)
			<left> = {<left> flip_h}
		endif
		<right> = {texture = menu_sideA flip_v}
		if (Random (@ 0 @ 1 )= 0)
			<right> = {<right> flip_h}
		endif
	endif
	createscreenelement {
		parent = <cont_id>
		type = spriteelement
		<left>
		just = [left top]
		z_priority = <z_priority>
		rgba = <bg_rgba>
	}
	getscreenelementdims id = <id>
	left_width = <width>
	left_height = <height>
	middle_width = 300
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		texture = white
		pos = ((1.0, 0.0) * <left_width>)
		dims = ((1.0, 0.0) * <middle_width> + (0.0, 1.0) * <left_height>)
		just = [left top]
		rgba = <bg_rgba>
		z_priority = <z_priority>
	}
	getscreenelementdims id = <id>
	getscreenelementprops id = <id>
	middle_width = <width>
	middle_height = <height>
	middle_pos = <pos>
	createscreenelement {
		parent = <cont_id>
		type = spriteelement
		<right>
		pos = (<middle_pos> + (1.0, 0.0) * <middle_width>)
		just = [left top]
		z_priority = <z_priority>
		rgba = <bg_rgba>
	}
	getscreenelementdims id = <id>
	getscreenelementprops id = <id>
	bottom_width = <width>
	bottom_height = <height>
	bottom_pos = <pos>
	cont_dims = ((0.0, 0.0) + <bottom_pos> + (1.0, 0.0) * <bottom_width> + (0.0, 1.0) * <bottom_height>)
	createscreenelement {
		type = spriteelement
		local_id = title_bg
		parent = <cont_id>
		just = [left top]
		texture = menu_highlight
		z_priority = (<z_priority> + 1)
		rgba = [0 0 0 255]
		pos = ((1.0, 0.0) * <left_width> + (0.0, -10.0))
		dims = (<middle_width> * (1.0, 0.0) + (0.0, 70.0))
	}
	setscreenelementprops {
		id = <cont_id>
		dims = <cont_dims>
	}
	return id = <cont_id>
endscript

script net_gametype_popup_create_menu_ui 
	printf "--- net_gametype_popup_create_menu_ui"
	if NOT gotparam action
		printf "did not get action! returning..."
		return
	endif
	z_priority = 501
	net_gametype_create_master_adjust_round_bg z_priority = <z_priority>
	parent = <id>
	if NOT gotparam parent
		printf "didn't get a parent! returning..."
		return
	endif
	if screenelementexists id = gametype_popup_menu_cont
		printf "gametype_popup_menu_cont exists! destroying..."
		destroyscreenelement id = gametype_popup_menu_cont
	endif
	z_priority = (<z_priority> + 10)
	menu_dims = (450.0, 400.0)
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = gametype_popup_menu_cont
		pos = (400.0, 180.0)
		dims = <menu_dims>
		just = [left top]
		z_priority = <z_priority>
	}
	if gotparam action
		gametype_popup_menu_cont :settags action = <action> mode = <mode> round_id = <round_id>
	endif
	cont_id = <id>
	net_gametype_create_popup_bg {
		parent = <cont_id>
		z_priority = (<z_priority> - 8)
		pos = (-50.0, 0.0)
	}
	bg_id = <id>
	switch <action>
		case add
		title = "Add Round"
		case edit
		title = "Edit Round"
		case view
		title = "Round Settings"
		default
		title = "null"
	endswitch
	createscreenelement {
		type = containerelement
		id = net_gametype_popup_title_cont
		parent = <cont_id>
		just = [left top]
	}
	title_cont = <id>
	createscreenelement {
		type = textelement
		parent = <title_cont>
		font = text_a1
		text = <title>
		rgba = $game_type_popup_bg_color
		scale = 0.8
		just = [left top]
	}
	getscreenelementdims id = <id>
	title_text_id = <id>
	title_width = <width>
	title_x = (((1.0, 0.0).<menu_dims> - <title_width>) / 2.0)
	title_y = 0
	title_pos = ((1.0, 0.0) * <title_x> + (0.0, 1.0) * <title_y>)
	setscreenelementprops {
		id = <title_text_id>
		pos = <title_pos>
	}
	createscreenelement {
		type = vmenu
		id = gametype_popup_menu_vmenu
		parent = gametype_popup_menu_cont
		just = [left top]
		pos = (0.0, 50.0)
		event_handlers = [
			{pad_back net_gametype_popup_unfocus_properly}
		]
	}
	menu_width = (<menu_dims>.(1.0, 0.0))
	createscreenelement {
		id = popup_divider_bar
		type = spriteelement
		parent = gametype_popup_menu_cont
		texture = menu_goal_underline
		dims = ((0.0, 10.0) + <menu_width> * (1.0, 0.0))
		rgba = [0 0 0 255]
		pos = (20.0, 280.0)
		just = [left top]
	}
	desc_scale = 0.62
	createscreenelement {
		id = desc_text
		parent = gametype_popup_menu_cont
		type = textblockelement
		font = text_a1
		pos = (0.0, 300.0)
		scale = <desc_scale>
		dims = ((0.0, 300.0) + (<menu_width> * (1.0, 0.0)) / <desc_scale>)
		text = ""
		just = [left top]
		internal_just = [center top]
		shadow
		shadow_offs = $game_type_round_list_shadow_offs
		shadow_rgba = $game_type_round_list_shadow_rgba
		rgba = $game_type_round_list_entry_color
	}
	scale_element_to_size {
		id = <bg_id>
		target_width = (<menu_dims>.(1.0, 0.0) + 100)
		target_height = (<menu_dims>.(0.0, 1.0))
	}
	net_gametype_popup_fill_menu
endscript

script net_gametype_popup_item_add {
		parent = gametype_popup_menu_vmenu
		text = "null"
		extras_pos = (435.0, 0.0)
		text_scale = (0.75, 0.8)
		pad_choose_script = nullscript
	}
	printf "--- net_gametype_popup_item_add"
	item_color = $game_type_round_list_entry_color
	if gotparam not_focusable
		not_focusable = not_focusable
	endif
	if gotparam not_adjustable
		not_focusable = not_focusable
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <id>
		dims = (40.0, 40.0)
		just = [left top]
		event_handlers = [
			{focus net_gametype_popup_item_focus}
			{unfocus net_gametype_popup_item_unfocus}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
		]
		<not_focusable>
	}
	cont_id = <id>
	createscreenelement {
		type = textelement
		local_id = text
		parent = <cont_id>
		font = text_a1
		text = <text>
		rgba = <item_color>
		just = [left top]
		scale = <text_scale>
		shadow
		shadow_offs = $game_type_round_list_shadow_offs
		shadow_rgba = $game_type_round_list_shadow_rgba
	}
	if gotparam extra_text
		createscreenelement {
			type = textelement
			local_id = extra_text
			parent = <cont_id>
			font = text_a1
			text = <extra_text>
			rgba = <item_color>
			just = [right top]
			scale = <text_scale>
			shadow
			shadow_offs = $game_type_round_list_shadow_offs
			shadow_rgba = $game_type_round_list_shadow_rgba
		}
		getscreenelementdims id = <id>
		extra_width = <width>
		setscreenelementprops {
			id = <id>
			pos = <extras_pos>
		}
		if NOT gotparam not_adjustable
			if gotparam option_arrows
				arrow_rgba = [0 0 0 255]
				createscreenelement {
					type = spriteelement
					parent = <cont_id>
					local_id = arrow_left
					just = [center center]
					texture = widget_slider_arrow
					rgba = <arrow_rgba>
				}
				createscreenelement {
					type = spriteelement
					parent = <cont_id>
					local_id = arrow_right
					just = [center center]
					texture = widget_slider_arrow
					rgba = <arrow_rgba>
					rot_angle = 180
					flip_v
				}
				<cont_id> :net_gametype_popup_arrows_reposition
				setscreenelementprops {
					id = <cont_id>
					event_handlers = [
						{pad_left net_gametype_popup_blink_arrows params = {left}}
						{pad_right net_gametype_popup_blink_arrows params = {right}}
					]
				}
				if gotparam option_arrows_callback
					setscreenelementprops {
						id = <cont_id>
						event_handlers = [
							{pad_left <option_arrows_callback> params = {left <option_arrows_callback_params>}}
							{pad_right <option_arrows_callback> params = {right <option_arrows_callback_params>}}
						]
					}
				endif
			endif
		endif
	endif
	return id = <cont_id>
endscript

script net_gametype_popup_arrows_reposition 
	obj_getid
	if NOT screenelementexists id = {<objid> child = arrow_left}
		return
	endif
	tweak_space = 5
	getscreenelementdims id = {<objid> child = arrow_left}
	arrow_width = <width>
	arrow_height = <height>
	getscreenelementprops id = {<objid> child = extra_text}
	extra_pos = <pos>
	getscreenelementdims id = {<objid> child = extra_text}
	extra_width = <width>
	setscreenelementprops {
		id = {<objid> child = arrow_right}
		pos = ((<extra_pos>.(1.0, 0.0) + <arrow_width> + <tweak_space> - <arrow_width> / 2.0) * (1.0, 0.0) + (0.0, 1.0) * ((0.0, 1.0).<extra_pos> + <arrow_height> / 2.0))
	}
	setscreenelementprops {
		id = {<objid> child = arrow_left}
		pos = ((<extra_pos>.(1.0, 0.0) - <extra_width> - <tweak_space> - <arrow_width> / 2.0) * (1.0, 0.0) + (0.0, 1.0) * ((0.0, 1.0).<extra_pos> + <arrow_height> / 2.0))
	}
endscript

script net_gametype_popup_blink_arrows 
	obj_getid
	if gotparam left
		child = arrow_left
	elseif gotparam right
		child = arrow_right
	else
		printf "net_gametype_popup_bink_arrows: didn't get left or right! returning..."
	endif
	<objid> :net_gametype_popup_arrows_reposition
	resolvescreenelementid id = {<objid> child = <child>}
	<resolved_id> :domorph alpha = 0 time = 0
	<resolved_id> :domorph alpha = 1 time = 0.2
endscript

script net_gametype_popup_focus_properly 
	printf "--- net_gametype_popup_focus_properly"
	if NOT screenelementexists id = gametype_popup_menu_cont
		printf "gametype_popup_menu_cont not onscreen to focus! returning..."
		return
	endif
	gametype_popup_menu_cont :getsingletag action
	switch <action>
		case add
		launchevent type = unfocus target = current_menu
		launchevent type = focus target = gametype_popup_menu_vmenu
		case edit
		case view
		launchevent type = unfocus target = game_type_round_list_vmenu
		launchevent type = focus target = gametype_popup_menu_vmenu
	endswitch
	create_helper_text {
		helper_text_elements = [
			{text = "\\m1 BACK"}
			{text = "\\m0 ACCEPT"}
		]
	}
endscript

script net_gametype_popup_unfocus_properly 
	if NOT screenelementexists id = gametype_popup_menu_cont
		printf "gametype_popup_menu_cont not onscreen to focus! returning..."
		return
	endif
	gametype_popup_menu_cont :getsingletag action
	switch <action>
		case add
		if screenelementexists id = net_adjust_round_cont
			destroyscreenelement id = net_adjust_round_cont
		endif
		launchevent type = focus target = current_menu
		create_helper_text {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
				{text = "\\m5 GO TO ROUND LIST"}
			]
		}
		case edit
		if screenelementexists id = net_adjust_round_cont
			destroyscreenelement id = net_adjust_round_cont
		endif
		launchevent type = focus target = game_type_round_list_vmenu
		create_helper_text {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 EDIT ROUND"}
				{text = "\\m5 REMOVE ROUND"}
			]
		}
		case view
		if screenelementexists id = net_adjust_round_cont
			destroyscreenelement id = net_adjust_round_cont
		endif
		launchevent type = focus target = game_type_round_list_vmenu
		create_helper_text {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 VIEW ROUND"}
			]
		}
	endswitch
endscript

script net_gametype_popup_item_focus 
	obj_getid
	setscreenelementprops id = {<objid> child = text} rgba = ($game_type_round_list_entry_focus_color)
	if screenelementexists id = {<objid> child = extra_text}
		setscreenelementprops id = {<objid> child = extra_text} rgba = ($game_type_round_list_entry_focus_color)
	endif
	if screenelementexists id = {<objid> child = arrow_left}
		<objid> :net_gametype_popup_arrows_reposition
	endif
endscript

script net_gametype_popup_item_unfocus 
	obj_getid
	setscreenelementprops id = {<objid> child = text} rgba = ($game_type_round_list_entry_color)
	if screenelementexists id = {<objid> child = extra_text}
		setscreenelementprops id = {<objid> child = extra_text} rgba = ($game_type_round_list_entry_color)
	endif
	if screenelementexists id = {<objid> child = arrow_left}
		<objid> :net_gametype_popup_arrows_reposition
	endif
endscript

script net_gametype_popup_do_action_round_and_return 
	printf "--- net_gametype_popup_add_round_and_return"
	gametype_popup_menu_cont :getsingletag action
	switch <action>
		case add
		NetRoundFunc {
			func = add_round
			params = ($net_rounds_add_game_type_struct)
		}
		case edit
		gametype_popup_menu_cont :getsingletag round_id
		NetRoundFunc {
			func = edit_round
			params = {
				round_id = <round_id>
				$net_rounds_add_game_type_struct
			}
		}
		case view
		printf "doing nothing for the view case"
	endswitch
	wait 5 gameframes
	game_type_net_rounds_refresh
	net_gametype_popup_unfocus_properly
endscript

script net_gametype_popup_fill_menu 
	printf "--- net_gametype_popup_fill_menu"
	if screenelementexists id = gametype_popup_menu_vmenu
		destroyscreenelement id = gametype_popup_menu_vmenu preserve_parent
	else
		printf "gametype_popup_menu_vmenu not up! returning..."
	endif
	gametype_popup_menu_cont :getsingletag mode
	net_rounds_get_game_mode_info mode = <mode>
	net_gametype_popup_item_add {
		text = "GAME TYPE:"
		extra_text = (<mode_info>.name)
		extras_offset = <the_extras_offset>
		id = menu_network_host_options_game_type
		not_focusable
	}
	setscreenelementprops {
		id = desc_text
		text = (<mode_info>.description)
	}
	gametype_popup_menu_cont :getsingletag action
	switch <action>
		case add
		if NOT gotparam dont_clear
			change net_rounds_add_game_type_struct = {game_mode = <mode>}
		endif
		case edit
		if NOT gotparam dont_clear
			gametype_popup_menu_cont :getsingletag round_id
			NetRoundFunc {
				func = get_round_params
				params = {
					round_id = <round_id>
				}
			}
			change net_rounds_add_game_type_struct = <round_params>
		endif
		case view
		gametype_popup_menu_cont :getsingletag round_id
		NetRoundFunc {
			func = get_round_params
			params = {
				round_id = <round_id>
			}
		}
		change net_rounds_add_game_type_struct = <round_params>
		not_focusable = not_focusable
	endswitch
	switch <mode>
		case net_line
		updatestructelement {
			struct = net_rounds_add_game_type_struct
			element = game_style
			checksum = ClassicMode
		}
		change globalname = net_rounds_add_game_type_struct newvalue = <newstruct>
		arrow_params = {
			id = menu_network_host_options_play_mode
			item_name = play_mode
			array = $ntt_line_play_mode
			element = checksum
			type = checksum
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "PLAY MODE:"
			extra_text = "null"
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_play_mode
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			<not_focusable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
		arrow_params = {
			id = menu_network_host_options_time_limit
			item_name = time_limit
			array = $horse_time_limit_options
			element = time
			type = int
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "TIME LIMIT:"
			extra_text = "null"
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_time_limit
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			<not_focusable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
		case net_nail
		updatestructelement {
			struct = net_rounds_add_game_type_struct
			element = game_style
			checksum = NTTMode
		}
		change globalname = net_rounds_add_game_type_struct newvalue = <newstruct>
		arrow_params = {
			id = menu_network_host_options_play_mode
			item_name = play_mode
			array = $ntt_line_play_mode
			element = checksum
			type = checksum
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "PLAY MODE:"
			extra_text = "null"
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_play_mode
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			<not_focusable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
		arrow_params = {
			id = menu_network_host_options_time_limit
			item_name = time_limit
			array = $horse_time_limit_options
			element = time
			type = int
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "TIME LIMIT:"
			extra_text = "null"
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_time_limit
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			<not_focusable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
		case netscorechallenge
		case netcombochallenge
		getcurrentlevel
		if (<level> = load_z_crib)
			not_adjustable = not_adjustable
		endif
		arrow_params = {
			id = menu_network_host_options_score_mode
			item_name = score_mode
			array = $score_type
			element = checksum
			type = checksum
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "MODE:"
			extra_text = "null"
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_score_mode
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			<not_focusable>
			<not_adjustable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
		switch ($net_rounds_add_game_type_struct.score_mode)
			case point_scoring
			printf "point_scoring"
			arrow_params = {
				id = menu_network_host_options_target_score
				item_name = score
				array = $target_score_options
				element = score
				type = int
				mode = <mode>
			}
			net_gametype_popup_item_add {
				text = "TARGET SCORE:"
				extra_text = "null"
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_target_score
				option_arrows
				option_arrows_callback = net_gametype_adjust_host_option
				option_arrows_callback_params = <arrow_params>
				<not_focusable>
			}
			net_gametype_adjust_host_option <arrow_params>
			<id> :net_gametype_popup_arrows_reposition
			case tag_scoring
			printf "tag_scoring"
			arrow_params = {
				id = menu_network_host_options_target_score
				item_name = target_tags
				array = $target_tags_options
				element = checksum
				type = checksum
				mode = <mode>
			}
			net_gametype_popup_item_add {
				text = "TARGET SCORE:"
				extra_text = "null"
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_target_score
				option_arrows
				option_arrows_callback = net_gametype_adjust_host_option
				option_arrows_callback_params = <arrow_params>
				<not_focusable>
			}
			net_gametype_adjust_host_option <arrow_params>
			<id> :net_gametype_popup_arrows_reposition
		endswitch
		case netgraffiti
		if InTeamGame
			arrow_params = {
				id = menu_network_host_options_scoring_mode
				item_name = team_graffiti_mode
				array = $team_graffiti_mode
				element = checksum
				type = checksum
				mode = <mode>
			}
			net_gametype_popup_item_add {
				text = "SCORING MODE:"
				extra_text = "null"
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_scoring_mode
				option_arrows
				option_arrows_callback = net_gametype_adjust_host_option
				option_arrows_callback_params = <arrow_params>
				<not_focusable>
			}
			net_gametype_adjust_host_option <arrow_params>
			<id> :net_gametype_popup_arrows_reposition
		endif
		arrow_params = {
			id = menu_network_host_options_time_limit
			item_name = time_limit
			array = $time_limit_options
			element = time
			type = int
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "TIME LIMIT:"
			extra_text = "null"
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_time_limit
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			<not_focusable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
		arrow_params = {
			id = menu_network_host_options_stop_at_zero
			item_name = stop_at_zero
			array = $boolean_types
			element = value
			type = int
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "STOP AT ZERO:"
			extra_text = "null"
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_stop_at_zero
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			<not_focusable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
		case netcombomambo
		getcurrentlevel
		if (<level> = load_z_crib)
			not_adjustable = not_adjustable
		endif
		arrow_params = {
			id = menu_network_host_options_score_mode
			item_name = score_mode
			array = $score_type
			element = checksum
			type = checksum
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "MODE:"
			extra_text = "null"
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_score_mode
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			<not_focusable>
			<not_adjustable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
		arrow_params = {
			id = menu_network_host_options_time_limit
			item_name = time_limit
			array = $time_limit_options
			element = time
			type = int
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "TIME LIMIT:"
			extra_text = "null"
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_time_limit
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			<not_focusable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
		arrow_params = {
			id = menu_network_host_options_stop_at_zero
			item_name = stop_at_zero
			array = $boolean_types
			element = value
			type = int
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "STOP AT ZERO:"
			extra_text = "null"
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_stop_at_zero
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			<not_focusable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
		case netwalls
		arrow_params = {
			id = menu_network_host_options_wall_mode
			item_name = score_mode
			array = $walls_mode_type_options
			element = checksum
			type = checksum
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "MODE:"
			extra_text = "null"
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_wall_mode
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			tag_grid_x = 1
			<not_focusable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
		arrow_params = {
			id = menu_network_host_options_time_limit
			item_name = time_limit
			array = $time_limit_options
			element = time
			type = int
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "TIME LIMIT:"
			extra_text = "null"
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_time_limit
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			<not_focusable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
		if (($net_rounds_add_game_type_struct.score_mode) = pointscoring)
			arrow_params = {
				id = menu_network_host_options_wall_points
				item_name = target_tags
				array = $walls_mode_points_options
				element = checksum
				type = checksum
				mode = <mode>
			}
			net_gametype_popup_item_add {
				text = "POINTS:"
				extra_text = "null"
				extras_offset = <the_extras_offset>
				id = menu_network_host_options_wall_points
				option_arrows
				option_arrows_callback = net_gametype_adjust_host_option
				option_arrows_callback_params = <arrow_params>
				<not_focusable>
			}
			net_gametype_adjust_host_option <arrow_params>
			<id> :net_gametype_popup_arrows_reposition
		endif
		default
		arrow_params = {
			id = menu_network_host_options_time_limit
			item_name = time_limit
			array = $time_limit_options
			element = time
			type = int
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "TIME LIMIT:"
			extra_text = ($time_limit_options [0].name)
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_time_limit
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			<not_focusable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
		arrow_params = {
			id = menu_network_host_options_stop_at_zero
			item_name = stop_at_zero
			array = $boolean_types
			element = value
			type = int
			mode = <mode>
		}
		net_gametype_popup_item_add {
			text = "STOP AT ZERO:"
			extra_text = ($boolean_types [0].name)
			extras_offset = <the_extras_offset>
			id = menu_network_host_options_stop_at_zero
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
			<not_focusable>
		}
		net_gametype_adjust_host_option <arrow_params>
		<id> :net_gametype_popup_arrows_reposition
	endswitch
	gametype_popup_menu_cont :getsingletag action
	switch <action>
		case add
		action_button_text = "Add Round"
		case edit
		action_button_text = "Edit Round"
		case view
		action_button_text = "Done"
		default
		action_button_text = "null"
	endswitch
	net_gametype_popup_item_add {
		text = <action_button_text>
		id = menu_network_host_options_ready
		pad_choose_script = net_gametype_popup_do_action_round_and_return
	}
	net_gametype_popup_focus_properly
	if gotparam focus_item
		launchevent type = focus target = <focus_item>
	endif
endscript
