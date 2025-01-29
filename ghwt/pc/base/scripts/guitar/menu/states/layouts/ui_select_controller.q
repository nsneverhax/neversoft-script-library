g_head_to_head_instrument_type = none
g_head_to_head_active_controllers = [
]

script ui_create_select_controller \{player = 2}
	clear_exclusive_devices
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_all_players = 0}
	change \{respond_to_signin_changed_func = main_menu_signin_changed}
	change \{in_controller_select_menu = 1}
	getactivecontrollers
	change g_head_to_head_active_controllers = <active_controllers>
	make_menu_frontend \{screen = bassist
		title = qs(0x5cf43a27)
		no_menu
		use_all_controllers}
	if <desc_id> :desc_resolvealias name = alias_body
		getscreenelementdims id = <resolved_id>
		createscreenelement {
			type = descinterface
			id = current_menu
			parent = <resolved_id>
			desc = 'p2_select_controller'
			pos = (-75.0, -10.0)
			autosizedims = true
		}
		if french
			current_menu :se_setprops \{ready_banner_texture = ready_banner_french}
		elseif german
			current_menu :se_setprops \{ready_banner_texture = ready_banner_german}
		elseif italian
			current_menu :se_setprops \{ready_banner_texture = ready_banner_italian}
		elseif spanish
			current_menu :se_setprops \{ready_banner_texture = ready_banner_spanish}
		endif
	endif
	if current_menu :desc_resolvealias \{name = alias_all_controllers}
		<alias_players> = <resolved_id>
		<alias_players> :settags {p1 = -1 p2 = -1 p1_ready = 0 p2_ready = 0}
		getscreenelementchildren id = <alias_players>
		<players_children> = <children>
		printstruct <...>
		getarraysize <players_children>
		if NOT (<array_size> = 4)
			scriptassert \{'array size needs to be four, we have four controller slots'}
		endif
		i = 0
		begin
		ui_select_controller_hide_or_unhide_icons i = <i> players_children = <players_children> active_controllers = <active_controllers>
		i = (<i> + 1)
		repeat <array_size>
	endif
	spawnscriptnow ui_select_controller_poll_for_controllers params = {players_children = <players_children>}
	ui_return_game_mode
endscript

script get_controller_texture 
	switch <type>
		case guitar
		printf \{qs(0xf7e5acb3)}
		<texture> = guitar_controller
		case drums
		printf \{qs(0x0ddeed7e)}
		<texture> = drum_controller
		case keyboard
		printf \{qs(0x5018b68c)}
		<texture> = 0xe974c02c
	endswitch
	return texture = <texture>
endscript

script ui_destroy_select_controller 
	change \{in_controller_select_menu = 0}
	if screenelementexists \{id = popup_warning_container}
		destroy_popup_warning_menu
	endif
	killspawnedscript \{name = ui_select_controller_poll_for_controllers}
	generic_ui_destroy
endscript

script 0xa257e42b controller = ($primary_controller)
	type = guitar
	if NOT isguitarcontroller controller = <controller>
		type = drums
		if NOT isdrumcontroller controller = <controller>
			type = keyboard
		endif
	endif
	return {type = <type>}
endscript

script ui_select_controller_hide_or_unhide_icons 
	<child_id> = (<players_children> [<i>])
	if ((<active_controllers> [<i>]) = 0)
		<child_id> :se_getparentid
		<parent_id> :gettags
		<child_id> :gettags
		<child_id> :se_setprops hide pos = <old_pos>
		<child_id> :settags hidden = 1
		get_controller_ready_se_objs
		if (<p1> = <i>)
			<parent_id> :settags p1 = -1
			<parent_id> :settags p1_ready = 0
			setscreenelementprops id = {<p1_se> child = ready} alpha = 0.0 time = 0.1
		elseif (<p2> = <i>)
			<parent_id> :settags p2 = -1
			<parent_id> :settags p2_ready = 0
			setscreenelementprops id = {<p2_se> child = ready} alpha = 0.0 time = 0.1
		endif
		printf 'ui_select_controller_hide_or_unhide_icons controller %c HIDE' c = <i>
	else
		printf 'ui_select_controller_hide_or_unhide_icons controller %c NOTHIDE' c = <i>
		<child_id> :se_getprops
		<child_id> :se_setprops {
			event_handlers = [] replace_handlers
		}
		<child_id> :se_setprops {
			exclusive_device = <i>
			event_handlers = [
				{pad_up ui_select_controller_move params = {left}}
				{pad_down ui_select_controller_move params = {right}}
				{pad_choose ui_select_controller_choose}
				{pad_back ui_select_controller_back}
			]
			replace_handlers
			tags = {old_pos = <pos>}
		}
		if iswinport
			0xa257e42b controller = <i>
		else
			ui_options_get_controller_type controller = <i>
		endif
		if NOT iswinport
			if (<type> = vocals)
				get_num_mics_plugged_in
				if (<num_mics_plugged_in> < 2)
					<type> = vocals_no_mic
				endif
			endif
		endif
		get_controller_texture type = <type>
		<child_id> :se_setprops {
			texture = <texture>
			unhide
		}
		<child_id> :settags hidden = 0
		launchevent type = focus target = <child_id>
	endif
endscript

script ui_select_controller_poll_for_controllers 
	begin
	getactivecontrollers
	getarraysize <active_controllers>
	<i> = 0
	begin
	if iswinport
		0xa257e42b controller = <i>
	else
		ui_options_get_controller_type controller = <i>
	endif
	if NOT (($g_head_to_head_active_controllers [<i>]) = (<active_controllers> [<i>]))
		ui_select_controller_hide_or_unhide_icons i = <i> players_children = <players_children> active_controllers = <active_controllers>
		setarrayelement arrayname = g_head_to_head_active_controllers globalarray index = <i> newvalue = (<active_controllers> [<i>])
	elseif isps3
		<child_id> = (<players_children> [<i>])
		<child_id> :se_getprops
		<my_texture> = <texture>
		<child_id> :gettags
		if (<hidden> = 0)
			ui_options_get_controller_type controller = <i>
			if (<type> = vocals)
				get_num_mics_plugged_in
				if (<num_mics_plugged_in> < 2)
					<type> = vocals_no_mic
				endif
			endif
			get_controller_texture type = <type>
			<new_texture> = <texture>
			if NOT (<my_texture> = <new_texture>)
				<child_id> :se_setprops {
					texture = <new_texture>
					unhide
				}
				<child_id> :settags hidden = 0
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	wait \{1
		gameframe}
	repeat
endscript

script ui_select_controller_move 
	se_getparentid
	obj_getid
	<parent_id> :gettags
	gettags
	if iswinport
		if (<device_num> > 0)
			if is_regular_controller controller = <device_num>
				launchevent \{type = unfocus
					target = current_menu}
				text = qs(0xb31a37ce)
				create_popup_warning_menu {
					textblock = {
						text = <text>
					}
					player_device = <device_num>
					no_background
					options = [
						{
							func = ui_select_controller_warning_go_back
							text = qs(0x320a8d1c)
						}
					]
				}
				soundevent \{event = menu_warning_sfx}
				return
			endif
		endif
	endif
	<play_sound> = 1
	if gotparam \{left}
		<dir> = {up}
		if (<p2> = <device_num>)
			if (<p2_ready> = 1)
				return
			endif
			<parent_id> :settags p2 = -1
			se_setprops pos = <old_pos> time = 0.1
		elseif (<p1> = -1)
			<parent_id> :settags p1 = <device_num>
			se_setprops \{pos = (-200.0, -250.0)
				time = 0.1}
		else
			<play_sound> = 0
		endif
	else
		<dir> = {down}
		if (<p1> = <device_num>)
			if (<p1_ready> = 1)
				return
			endif
			<parent_id> :settags p1 = -1
			se_setprops pos = <old_pos> time = 0.1
		elseif (<p2> = -1)
			<parent_id> :settags p2 = <device_num>
			se_setprops \{pos = (180.0, 50.0)
				time = 0.1}
		else
			<play_sound> = 0
		endif
	endif
	if (<play_sound>)
		generic_menu_up_or_down_sound <dir>
	endif
endscript

script get_controller_ready_se_objs 
	current_menu :desc_resolvealias \{name = alias_players}
	<alias_players> = <resolved_id>
	getscreenelementchildren id = <alias_players>
	return p1_se = (<children> [0]) p2_se = (<children> [1])
endscript

script ui_select_controller_choose 
	get_controller_ready_se_objs
	se_getparentid
	obj_getid
	<parent_id> :gettags
	if (<p1> = <device_num>)
		<parent_id> :settags p1_ready = 1
		setscreenelementprops id = {<p1_se> child = ready} alpha = 1.0 time = 0.1
		soundevent \{event = box_check_sfx}
	elseif (<p2> = <device_num>)
		<parent_id> :settags p2_ready = 1
		setscreenelementprops id = {<p2_se> child = ready} alpha = 1.0 time = 0.1
		soundevent \{event = box_check_sfx}
	endif
	<parent_id> :gettags
	if ((<p1_ready> = 1) && (<p2_ready> = 1))
		if ((<p1> < 0) || (<p1> >= 4))
			return
		endif
		if ((<p2> < 0) || (<p2> >= 4))
			return
		endif
		if iswinport
			0xa257e42b controller = <p1>
		else
			ui_options_get_controller_type controller = <p1>
		endif
		p1_type = <type>
		if iswinport
			0xa257e42b controller = <p2>
		else
			ui_options_get_controller_type controller = <p2>
		endif
		p2_type = <type>
		if iswinport
			if 0x1c708d82 controller = <p1>
				printf \{qs(0x20a6a33d)}
				p1_type = <p2_type>
			endif
			if 0x1c708d82 controller = <p2>
				printf \{qs(0x189d284e)}
				p2_type = <p1_type>
			endif
		endif
		if ($allow_controller_for_all_instruments = 0)
			if NOT (<p1_type> = <p2_type>)
				launchevent \{type = unfocus
					target = current_menu}
				create_popup_warning_menu {
					title = qs(0x3817b618)
					textblock = {
						text = qs(0x1f2885cb)
					}
					player_device = <device_num>
					no_background
					options = [
						{
							func = ui_select_controller_warning_go_back
							text = qs(0x320a8d1c)
						}
					]
				}
				soundevent \{event = menu_warning_sfx}
				ui_select_controller_back <...>
				return
			endif
			if checksumequals a = <p1_type> b = vocals
				get_num_mics_plugged_in
				if (<num_mics_plugged_in> < 2)
					launchevent \{type = unfocus
						target = current_menu}
					if iswinport
						<text> = qs(0x4e60df69)
					elseif isxenon
						<text> = qs(0x11391a52)
					else
						<text> = qs(0x4e60df69)
					endif
					create_popup_warning_menu {
						textblock = {
							text = <text>
						}
						player_device = <device_num>
						no_background
						options = [
							{
								func = ui_select_controller_warning_go_back
								text = qs(0x320a8d1c)
							}
						]
					}
					soundevent \{event = menu_warning_sfx}
					ui_select_controller_back <...>
					return
				endif
			endif
		endif
		change g_head_to_head_instrument_type = <p1_type>
		launchevent \{type = unfocus
			target = current_menu}
		if (<p1> != ($player1_status.controller))
			swap_player_status_elements \{player_a = 1
				player_b = 2
				lefty_flip}
		endif
		change structurename = player1_status controller = <p1>
		change structurename = player2_status controller = <p2>
		change player1_device = <p1>
		change player2_device = <p2>
		add_exclusive_device device = <p1>
		add_exclusive_device device = <p2>
		printstruct <...>
		if checksumequals a = <p1_type> b = vocals
			change \{structurename = player1_status
				part = vocals}
			change \{structurename = player2_status
				part = vocals}
			vocals_distribute_mics
		endif
		wait \{0.25
			seconds}
		data = {device_num = <p2> allow_back = 1 new_state = uistate_select_mp_mode primary = 0}
		set_primary_controller device_num = <p1> state = uistate_signin data = <data>
	endif
endscript

script ui_select_controller_warning_go_back 
	destroy_popup_warning_menu
	ui_destroy_select_controller
	ui_create_select_controller
endscript

script ui_select_controller_back 
	get_controller_ready_se_objs
	se_getparentid
	obj_getid
	<parent_id> :gettags
	if ((<p1_ready> = 0) && (<p2_ready> = 0))
		generic_event_back
	endif
	if (<p1> = <device_num>)
		<parent_id> :settags p1_ready = 0
		setscreenelementprops id = {<p1_se> child = ready} alpha = 0.0 time = 0.1
		generic_menu_pad_back_sound
	elseif (<p2> = <device_num>)
		<parent_id> :settags p2_ready = 0
		setscreenelementprops id = {<p2_se> child = ready} alpha = 0.0 time = 0.1
		generic_menu_pad_back_sound
	endif
endscript

script swap_player_status_elements \{player_a = 1
		player_b = 2}
	formattext checksumname = player_status_a 'player%n_status' n = <player_a>
	formattext checksumname = player_status_b 'player%n_status' n = <player_b>
	if gotparam \{lefty_flip}
		<temp_value> = ($<player_status_a>.lefty_flip)
		change structurename = <player_status_a> lefty_flip = ($<player_status_b>.lefty_flip)
		get_savegame_from_controller controller = ($<player_status_a>.controller)
		setglobaltags savegame = <savegame> user_options params = {lefty_flip_save = ($<player_status_b>.lefty_flip)}
		change structurename = <player_status_b> lefty_flip = <temp_value>
		get_savegame_from_controller controller = ($<player_status_b>.controller)
		setglobaltags savegame = <savegame> user_options params = {lefty_flip_save = <temp_value>}
	endif
endscript
