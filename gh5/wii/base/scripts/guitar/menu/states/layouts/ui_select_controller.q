g_head_to_head_instrument_type = None
g_head_to_head_active_controllers = [
]
back_once = 0

script ui_create_select_controller \{Player = 2}
	SpawnScriptNow ui_create_select_controller_spawned params = {<...>}
endscript

script ui_create_select_controller_spawned 
	Wait \{1
		Seconds}
	Change \{back_once = 0}
	clear_exclusive_devices
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	Change \{in_controller_select_menu = 1}
	GetActiveControllers
	GetArraySize <active_controllers>
	active_controllers_size = <array_Size>
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
		desc = 'p2_select_controller'
		Pos = (300.0, 100.0)
		autosizedims = true}
	if French
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
		printstruct <...>
		GetArraySize <players_children>
		if NOT (<array_Size> = 4)
			ScriptAssert \{'array size needs to be four, we have four controller slots'}
		endif
		i = 0
		begin
		ui_select_controller_hide_or_unhide_icons i = <i> players_children = <players_children> active_controllers = <active_controllers>
		i = (<i> + 1)
		repeat <array_Size>
	endif
	SpawnScriptNow ui_select_controller_poll_for_controllers params = {players_children = <players_children>}
	clean_up_user_control_helpers
	Change \{back_once = 1}
endscript

script get_controller_texture 
	switch <Type>
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

script ui_destroy_select_controller 
	Change \{in_controller_select_menu = 0}
	if ScreenElementExists \{id = dialog_box_container}
		destroy_dialog_box
	endif
	KillSpawnedScript \{Name = ui_select_controller_poll_for_controllers}
	DestroyScreenElement \{id = current_menu}
endscript

script ui_select_controller_hide_or_unhide_icons 
	GetArraySize <players_children>
	if NOT (<i> < <array_Size>)
		printf 'ui_select_controller_hide_or_unhide_icons: index out of range %a %b' a = <i> b = <array_Size>
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
		printf 'ui_select_controller_hide_or_unhide_icons controller %c HIDE' c = <i>
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
			tags = {old_pos = <Pos>}
		}
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
	ui_options_get_controller_type controller = <device_num>
	if (<Type> = vocals)
		return
	endif
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
			se_setprops \{Pos = (-120.0, -355.0)
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
			se_setprops \{Pos = (275.0, 0.0)
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
	ui_options_get_controller_type controller = <device_num>
	if (<Type> = vocals)
		return
	endif
	get_controller_ready_se_objs
	se_getparentid
	Obj_GetID
	<parent_id> :GetTags
	if (<p1> = <device_num>)
		<parent_id> :SetTags p1_ready = 1
		SetScreenElementProps id = {<p1_se> child = ready} alpha = 1.0 time = 0.1
		SoundEvent \{event = Box_Check_SFX}
	elseif (<p2> = <device_num>)
		<parent_id> :SetTags p2_ready = 1
		SetScreenElementProps id = {<p2_se> child = ready} alpha = 1.0 time = 0.1
		SoundEvent \{event = Box_Check_SFX}
	endif
	<parent_id> :GetTags
	if ((<p1_ready> = 1) && (<p2_ready> = 1))
		if ((<p1> < 0) || (<p1> >= 4))
			return
		endif
		if ((<p2> < 0) || (<p2> >= 4))
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
				create_dialog_box {
					heading_text = qs(0x3817b618)
					body_text = qs(0x1f2885cb)
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
					create_dialog_box {
						body_text = <text>
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
		getplayerinfo \{1
			controller}
		if (<p1> != <controller>)
			swap_player_info_elements \{player_a = 1
				player_b = 2
				lefty_flip}
		endif
		setplayerinfo 1 controller = <p1>
		setplayerinfo 2 controller = <p2>
		setplayerinfo 1 device = <p1>
		setplayerinfo 2 device = <p2>
		add_exclusive_device device = <p1>
		add_exclusive_device device = <p2>
		printstruct <...>
		if checksumequals a = <p1_type> b = vocals
			setplayerinfo \{1
				part = vocals}
			setplayerinfo \{2
				part = vocals}
			vocals_distribute_mics
		endif
		Wait \{0.25
			Seconds}
		generic_event_choose \{state = uistate_select_mp_mode}
	endif
endscript

script ui_select_controller_warning_go_back 
	destroy_dialog_box
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

script swap_player_info_elements \{player_a = 1
		player_b = 2}
	if GotParam \{lefty_flip}
		getplayerinfo <player_a> lefty_flip out = lefty_a
		getplayerinfo <player_b> lefty_flip out = lefty_b
		getplayerinfo <player_a> controller out = controller_a
		getplayerinfo <player_b> controller out = controller_b
		setplayerinfo <player_a> lefty_flip out = <lefty_b>
		get_savegame_from_controller controller = <controller_a>
		SetGlobalTags savegame = <savegame> user_options params = {lefty_flip_save = <lefty_b>}
		setplayerinfo <player_b> lefty_flip out = <lefty_a>
		get_savegame_from_controller controller = <controller_b>
		SetGlobalTags savegame = <savegame> user_options params = {lefty_flip_save = <lefty_a>}
	endif
endscript
