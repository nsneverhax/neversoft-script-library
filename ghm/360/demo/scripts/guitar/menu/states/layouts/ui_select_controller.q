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
	createscreenelement \{type = descinterface
		id = current_menu
		parent = root_window
		desc = 'p2_select_controller'}
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
	current_menu :obj_spawnscript ui_select_controller_poll_for_controllers params = {players_children = <players_children>}
	current_menu :obj_spawnscript \{ui_select_controller_ready_motion
		params = {
			name = alias_ready_banner_p1
		}}
	current_menu :obj_spawnscript \{ui_select_controller_ready_motion
		params = {
			name = alias_ready_banner_p2
		}}
	current_menu :obj_spawnscriptnow \{head2head_skull_anim}
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
		case vocals
		printf \{qs(0x204ba8d8)}
		<texture> = vocal_controller
		case vocals_no_mic
		printf \{qs(0x2ce2f4dc)}
		<texture> = vocal_controller
	endswitch
	return texture = <texture>
endscript

script ui_select_controller_anim_in 
	menu_transition_in \{menu = current_menu}
endscript

script ui_select_controller_anim_out 
	menu_transition_out \{menu = current_menu}
endscript

script ui_destroy_select_controller 
	if screenelementexists \{id = current_menu}
		destroyscreenelement \{id = current_menu}
	endif
	change \{in_controller_select_menu = 0}
	if screenelementexists \{id = popup_warning_container}
		destroy_popup_warning_menu
	endif
	killspawnedscript \{name = head2head_skull_anim}
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
				{pad_left ui_select_controller_move params = {left}}
				{pad_up ui_select_controller_move params = {left}}
				{pad_right ui_select_controller_move params = {right}}
				{pad_down ui_select_controller_move params = {right}}
				{pad_choose ui_select_controller_choose}
				{pad_back ui_select_controller_back}
			]
			replace_handlers
			tags = {old_pos = <pos>}
		}
		ui_options_get_controller_type controller = <i>
		if (<type> = vocals)
			get_num_mics_plugged_in
			if (<num_mics_plugged_in> < 2)
				<type> = vocals_no_mic
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

script skull_blur 
	begin
	a = Random (@ 0.0 @ 0.5 @ 1 )
	ui_fx_set_blur amount = <a> time = 0.09
	wait \{0.1
		seconds}
	ui_fx_set_blur \{amount = 0}
	se_waitprops
	<time> = Random (@ 3 @ 1.5 @ 4 )
	wait <time> seconds
	repeat
endscript

script head2head_skull_anim 
	se_getprops \{head_to_head_pos}
	<org_pos> = <head_to_head_pos>
	current_menu :obj_spawnscriptnow \{skull_blur}
	begin
	se_setprops \{sad_but_true_jaw_rot_angle = 0}
	se_setprops \{head_to_head_pos = (584.426, 515.3029)}
	se_setprops \{sad_but_true_jaw_rot_angle = 10
		time = 0.02
		motion = linear}
	se_setprops \{h2h_finger_rot_angle = 0}
	se_setprops \{sbt_skull_top_pos = (-391.184, -68.621346)}
	se_setprops \{sbt_skull_top_rot_angle = 0}
	se_waitprops
	se_setprops \{h2h_finger_rot_angle = -6
		time = 0.02
		motion = linear}
	se_setprops \{sbt_skull_top_rot_angle = 3
		time = 0.02
		motion = ease_in}
	se_waitprops
	se_setprops \{head_to_head_pos = (584.426, 515.3029)
		time = 0.03}
	se_setprops \{h2h_finger_rot_angle = 0
		time = 0.01
		motion = linear}
	se_setprops \{sbt_skull_top_rot_angle = 0
		time = 0.02
		motion = ease_out}
	se_waitprops
	se_setprops \{sad_but_true_jaw_rot_angle = -2
		time = 0.01
		motion = ease_in}
	se_setprops \{h2h_finger_rot_angle = -6
		time = 0.02
		motion = linear}
	se_setprops \{sbt_skull_top_rot_angle = 3
		time = 0.02
		motion = ease_in}
	se_waitprops
	se_setprops \{h2h_finger_rot_angle = 0
		time = 0.01
		motion = linear}
	se_setprops \{sbt_skull_top_rot_angle = 0
		time = 0.02
		motion = ease_out}
	se_waitprops
	se_setprops \{sad_but_true_jaw_rot_angle = 0
		time = 0.02
		motion = ease_in}
	se_waitprops
	se_setprops \{head_to_head_pos = (584.426, 515.3029)}
	se_setprops \{sad_but_true_jaw_rot_angle = -2
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{sad_but_true_jaw_rot_angle = 0
		time = 0.05
		motion = ease_out}
	se_waitprops
	se_setprops \{sad_but_true_jaw_rot_angle = -2
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{sad_but_true_jaw_rot_angle = 0
		time = 0.05
		motion = ease_out}
	se_waitprops
	<time> = Random (@ 2 @ 1.5 @ 4 @ 1.2 @ 0.5 @ 1.8 )
	wait <time> seconds
	repeat
	killspawnedscript \{name = skull_blur}
endscript

script ui_select_controller_poll_for_controllers 
	begin
	getactivecontrollers
	getarraysize <active_controllers>
	<i> = 0
	begin
	ui_options_get_controller_type controller = <i>
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
			se_setprops \{pos = (-350.0, -100.0)
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
			se_setprops \{pos = (350.0, -100.0)
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
		if NOT (<p1_ready> = 1)
			soundevent \{event = checkbox_check_2_sfx}
		endif
	elseif (<p2> = <device_num>)
		<parent_id> :settags p2_ready = 1
		setscreenelementprops id = {<p2_se> child = ready} alpha = 1.0 time = 0.1
		if NOT (<p2_ready> = 1)
			soundevent \{event = checkbox_check_2_sfx}
		endif
	endif
	<parent_id> :gettags
	if ((<p1_ready> = 1) && (<p2_ready> = 1))
		if ((<p1> < 0) || (<p1> >= 4))
			return
		endif
		if ((<p2> < 0) || (<p2> >= 4))
			return
		endif
		ui_options_get_controller_type controller = <p1>
		p1_type = <type>
		ui_options_get_controller_type controller = <p2>
		p2_type = <type>
		if ($allow_controller_for_all_instruments = 0)
			if NOT (<p1_type> = <p2_type>)
				launchevent \{type = unfocus
					target = current_menu}
				create_popup_warning_menu \{title = qs(0x3817b618)
					textblock = {
						text = qs(0x1f2885cb)
					}
					player_device = [
						0
						1
						2
						3
					]
					no_background
					options = [
						{
							func = ui_select_controller_warning_go_back
							text = qs(0x320a8d1c)
						}
					]}
				soundevent \{event = menu_warning_sfx}
				ui_select_controller_back <...>
				return
			endif
			if checksumequals a = <p1_type> b = vocals
				get_num_mics_plugged_in
				if (<num_mics_plugged_in> < 2)
					launchevent \{type = unfocus
						target = current_menu}
					if isxenon
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
		change \{current_num_players = 2}
		ui_event \{event = menu_change
			data = {
				state = uistate_select_mp_mode
			}}
		return
		if isxenon
			data = {device_num = <p2> allow_back = 1 new_state = uistate_select_mp_mode primary = 0}
			set_primary_controller device_num = <p1> state = uistate_signin data = <data> force
		else
			set_primary_controller device_num = <p1> state = uistate_select_mp_mode data = <data>
		endif
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

script ui_select_controller_ready_motion 
	if desc_resolvealias name = <name>
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			prev = 0
			curr = 1
			begin
			prev_id = (<children> [<prev>])
			curr_id = (<children> [<curr>])
			<prev_id> :se_setprops alpha = 0.0
			<curr_id> :se_setprops alpha = 1
			prev = <curr>
			next = RandomInteger (0.0, 2.0)
			if (<next> = <prev>)
				curr = (<curr> + 1)
			else
				curr = <next>
			endif
			if (<curr> >= <array_size>)
				curr = 0
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_v = true
			else
				<curr_id> :se_setprops flip_v = false
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_h = true
			else
				<curr_id> :se_setprops flip_h = false
			endif
			wait \{0.075
				second}
			repeat
		endif
	endif
endscript
