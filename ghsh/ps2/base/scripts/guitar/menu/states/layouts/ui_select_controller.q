g_head_to_head_instrument_type = None
g_head_to_head_active_controllers = [
]
back_once = 0

script ui_create_select_controller \{Player = 2}
	SpawnScriptNow ui_create_select_controller_spawned params = {<...>}
endscript

script ui_create_select_controller_spawned 
	Change \{back_once = 0}
	clear_exclusive_devices
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	Change \{in_controller_select_menu = 1}
	GetActiveControllers
	GetArraySize <active_controllers>
	i = 0
	begin
	ui_options_get_controller_type controller = <i>
	if (<Type> = vocals)
		SetArrayElement ArrayName = active_controllers index = <i> NewValue = 0
	endif
	i = (<i> + 1)
	repeat <array_Size>
	Change g_head_to_head_active_controllers = <active_controllers>
	CreateScreenElement \{Type = descinterface
		id = current_menu
		parent = root_window
		desc = 'p2_select_controller_ps2'
		Pos = (0.0, 0.0)
		autosizedims = FALSE}
	current_menu :Obj_SpawnScriptNow \{bg_swap}
	if (French)
		current_menu :se_setprops \{ready_banner_texture = ready_banner_french}
	elseif German
		current_menu :se_setprops \{ready_banner_texture = ready_banner_german}
	elseif Italian
		current_menu :se_setprops \{ready_banner_texture = ready_banner_italian}
	elseif Spanish
		current_menu :se_setprops \{ready_banner_texture = ready_banner_spanish}
	endif
	if current_menu :desc_resolvealias \{Name = alias_all_controllers}
		<alias_players> = <resolved_id>
		<alias_players> :SetTags {p1 = -1 p2 = -1 p1_ready = 0 p2_ready = 0}
		GetScreenElementChildren id = <alias_players>
		<players_children> = <children>
		GetArraySize <players_children>
		i = 0
		begin
		ui_select_controller_hide_or_unhide_icons i = <i> players_children = <players_children> active_controllers = <active_controllers>
		i = (<i> + 1)
		repeat <array_Size>
		Wait \{1
			Seconds}
		i = 0
		begin
		0xa6cc44aa i = <i> players_children = <players_children> active_controllers = <active_controllers>
		i = (<i> + 1)
		repeat <array_Size>
	endif
	SpawnScriptNow ui_select_controller_poll_for_controllers params = {players_children = <players_children>}
	ui_return_game_mode
	Change \{back_once = 1}
endscript

script get_controller_texture 
	switch <Type>
		case guitar

		<texture> = guitar_controller
		case drums

		<texture> = drum_controller
		case vocals

		<texture> = vocal_controller
		case vocals_no_mic

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
	if ScreenElementExists \{id = current_menu}
		DestroyScreenElement \{id = current_menu}
	endif
	Change \{in_controller_select_menu = 0}
	if ScreenElementExists \{id = popup_warning_container}
		destroy_popup_warning_menu
	endif
	KillSpawnedScript \{Name = ui_select_controller_poll_for_controllers}
endscript

script ui_select_controller_hide_or_unhide_icons 
	GetArraySize <players_children>
	if NOT (<i> < <array_Size>)

		return
	endif
	<child_id> = (<players_children> [<i>])
	if ((<active_controllers> [<i>]) = 0)
		<child_id> :se_getparentid
		<parent_id> :GetTags
		<child_id> :GetTags
		<child_id> :se_setprops Hide Pos = <old_pos>
		<child_id> :SetTags hidden = 1
		get_controller_ready_se_objs
		if (<p1> = <i>)
			<parent_id> :SetTags p1 = -1
			<parent_id> :SetTags p1_ready = 0
			SetScreenElementProps id = {<p1_se> child = ready} alpha = 0.0 time = 0.1
		elseif (<p2> = <i>)
			<parent_id> :SetTags p2 = -1
			<parent_id> :SetTags p2_ready = 0
			SetScreenElementProps id = {<p2_se> child = ready} alpha = 0.0 time = 0.1
		endif

	else

		ui_options_get_controller_type controller = <i>
		if (<Type> = vocals)
			get_num_mics_plugged_in
			if (<num_mics_plugged_in> < 2)
				<Type> = vocals_no_mic
			endif
		endif
		get_controller_texture Type = <Type>
		<child_id> :se_setprops {
			texture = <texture>
			unhide
		}
		<child_id> :SetTags hidden = 0
		LaunchEvent Type = focus target = <child_id>
	endif
endscript

script 0xa6cc44aa 
	<child_id> = (<players_children> [<i>])
	if ((<active_controllers> [<i>]) = 0)
		<child_id> :se_getparentid
		<parent_id> :GetTags
		<child_id> :GetTags
		if NOT IsGuitarController controller = <i>
			if NOT isdrumcontroller controller = <i>
				<child_id> :se_setprops {
					exclusive_device = <i>
					event_handlers = [
						{pad_back ui_select_controller_back}
					]
					replace_handlers
				}
				LaunchEvent Type = focus target = <child_id>
			endif
		endif
	else
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
			tags = {old_pos = <Pos>}
		}
	endif
endscript

script ui_select_controller_poll_for_controllers 
	begin
	GetActiveControllers
	GetArraySize <active_controllers>
	<i> = 0
	begin
	ui_options_get_controller_type controller = <i>
	if NOT (($g_head_to_head_active_controllers [<i>]) = (<active_controllers> [<i>]) || (<Type> = vocals))
		ui_select_controller_hide_or_unhide_icons i = <i> players_children = <players_children> active_controllers = <active_controllers>
		SetArrayElement ArrayName = g_head_to_head_active_controllers globalarray index = <i> NewValue = (<active_controllers> [<i>])
	elseif isps3
		<child_id> = (<players_children> [<i>])
		<child_id> :se_getprops
		<my_texture> = <texture>
		<child_id> :GetTags
		if (<hidden> = 0)
			ui_options_get_controller_type controller = <i>
			if (<Type> = vocals)
				get_num_mics_plugged_in
				if (<num_mics_plugged_in> < 2)
					<Type> = vocals_no_mic
				endif
			endif
			get_controller_texture Type = <Type>
			<new_texture> = <texture>
			if NOT (<my_texture> = <new_texture>)
				<child_id> :se_setprops {
					texture = <new_texture>
					unhide
				}
				<child_id> :SetTags hidden = 0
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	Wait \{1
		gameframe}
	repeat
endscript

script ui_select_controller_move 
	se_getparentid
	Obj_GetID
	<parent_id> :GetTags
	GetTags
	<play_sound> = 1
	if GotParam \{left}
		<Dir> = {up}
		if (<p2> = <device_num>)
			if (<p2_ready> = 1)
				return
			endif
			<parent_id> :SetTags p2 = -1
			se_setprops Pos = <old_pos> time = 0.1
		elseif (<p1> = -1)
			<parent_id> :SetTags p1 = <device_num>
			se_setprops \{Pos = (-300.0, 0.0)
				time = 0.1}
		else
			<play_sound> = 0
		endif
	else
		<Dir> = {down}
		if (<p1> = <device_num>)
			if (<p1_ready> = 1)
				return
			endif
			<parent_id> :SetTags p1 = -1
			se_setprops Pos = <old_pos> time = 0.1
		elseif (<p2> = -1)
			<parent_id> :SetTags p2 = <device_num>
			se_setprops \{Pos = (250.0, 0.0)
				time = 0.1}
		else
			<play_sound> = 0
		endif
	endif
	if (<play_sound>)
		generic_menu_up_or_down_sound <Dir>
	endif
endscript

script get_controller_ready_se_objs 
	current_menu :desc_resolvealias \{Name = alias_players}
	<alias_players> = <resolved_id>
	GetScreenElementChildren id = <alias_players>
	return p1_se = (<children> [0]) p2_se = (<children> [1])
endscript

script ui_select_controller_choose 
	get_controller_ready_se_objs
	se_getparentid
	Obj_GetID
	<parent_id> :GetTags
	if (<p1> = <device_num>)
		<parent_id> :SetTags p1_ready = 1
		SetScreenElementProps id = {<p1_se> child = ready} alpha = 1.0 time = 0.1
		if NOT (<p1_ready> = 1)
			SoundEvent \{event = checkbox_check_2_sfx}
		endif
	elseif (<p2> = <device_num>)
		<parent_id> :SetTags p2_ready = 1
		SetScreenElementProps id = {<p2_se> child = ready} alpha = 1.0 time = 0.1
		if NOT (<p2_ready> = 1)
			SoundEvent \{event = checkbox_check_2_sfx}
		endif
	endif
	<parent_id> :GetTags
	if ((<p1_ready> = 1) && (<p2_ready> = 1))
		if ((<p1> < 0) || (<p1> >= 8))
			return
		endif
		if ((<p2> < 0) || (<p2> >= 8))
			return
		endif
		ui_options_get_controller_type controller = <p1>
		p1_type = <Type>
		ui_options_get_controller_type controller = <p2>
		p2_type = <Type>
		if ($allow_controller_for_all_instruments = 0)
			if NOT (<p1_type> = <p2_type>)
				LaunchEvent \{Type = unfocus
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
				SoundEvent \{event = Menu_Warning_SFX}
				ui_select_controller_back <...>
				return
			endif
			if checksumequals a = <p1_type> b = vocals
				get_num_mics_plugged_in
				if (<num_mics_plugged_in> < 2)
					LaunchEvent \{Type = unfocus
						target = current_menu}
					if isXenon
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
					SoundEvent \{event = Menu_Warning_SFX}
					ui_select_controller_back <...>
					return
				endif
			endif
		endif
		Change g_head_to_head_instrument_type = <p1_type>
		LaunchEvent \{Type = unfocus
			target = current_menu}
		if (<p1> != ($player1_status.controller))
			swap_player_status_elements \{player_a = 1
				player_b = 2
				lefty_flip}
		endif
		Change structurename = player1_status controller = <p1>
		Change structurename = player2_status controller = <p2>
		Change player1_device = <p1>
		Change player2_device = <p2>
		add_exclusive_device device = <p1>
		add_exclusive_device device = <p2>
		if checksumequals a = <p1_type> b = vocals
			Change \{structurename = player1_status
				part = vocals}
			Change \{structurename = player2_status
				part = vocals}
			vocals_distribute_mics
		endif
		Wait \{0.25
			Seconds}
		Change \{current_num_players = 2}
		generic_event_choose \{state = uistate_select_mp_mode}
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
	Obj_GetID
	<parent_id> :GetTags
	if ((<p1_ready> = 0) && (<p2_ready> = 0))
		if ($back_once = 1)
			Change \{back_once = 0}
			generic_event_back
		endif
	endif
	if (<p1> = <device_num>)
		<parent_id> :SetTags p1_ready = 0
		SetScreenElementProps id = {<p1_se> child = ready} alpha = 0.0 time = 0.1
		generic_menu_pad_back_sound
	elseif (<p2> = <device_num>)
		<parent_id> :SetTags p2_ready = 0
		SetScreenElementProps id = {<p2_se> child = ready} alpha = 0.0 time = 0.1
		generic_menu_pad_back_sound
	endif
endscript

script swap_player_status_elements \{player_a = 1
		player_b = 2}
	player_status_a = ($0x2994109a [<player_a>])
	player_status_b = ($0x2994109a [<player_b>])
	if GotParam \{lefty_flip}
		<temp_value> = ($<player_status_a>.lefty_flip)
		Change structurename = <player_status_a> lefty_flip = ($<player_status_b>.lefty_flip)
		get_savegame_from_controller controller = ($<player_status_a>.controller)
		SetGlobalTags savegame = <savegame> user_options params = {lefty_flip_save = ($<player_status_b>.lefty_flip)}
		Change structurename = <player_status_b> lefty_flip = <temp_value>
		get_savegame_from_controller controller = ($<player_status_b>.controller)
		SetGlobalTags savegame = <savegame> user_options params = {lefty_flip_save = <temp_value>}
	endif
endscript

script ui_select_controller_ready_motion 
	if desc_resolvealias Name = <Name>
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
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
			if (<curr> >= <array_Size>)
				curr = 0
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_v = true
			else
				<curr_id> :se_setprops flip_v = FALSE
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_h = true
			else
				<curr_id> :se_setprops flip_h = FALSE
			endif
			Wait \{0.075
				Second}
			repeat
		endif
	endif
endscript
