freestyle_last_controller_to_hit_pad_choose = 0
freestyle_just_exited = FALSE
0x652fb32d = 1.0
0x4294d41c = 0.1
0x59923f57 = 2
0x659f000e = 0.2
0x3d8ad2f1 = 0.2
0x5391bb6d = 0.4
0x13dec31b = 0.1
0x0895cf3a = 1.75
0xdf7e7d7b = 1.2
0x8e24d8eb = 1.2
0xa0682139 = 3
0x6a3b79c1 = 3
0x3bc2c29c = 2
0x33b91df6 = 5
0xe452afb7 = 90
0x97580865 = 100
0x072b188f = 16
0x4a0607a3 = 1
0x58dd0aad = [
	0
	104
	211
	255
]
0xc1d45b17 = [
	0
	40
	211
	255
]
0x71b870a7 = [
	9
	7
	89
	0
]
0xe8b1211d = [
	3
	41
	54
	0
]
0xfca86330 = (-5.0, 0.0)
0x2f36dc3c = (0.0, 0.0)
0xb1aae5dc = (5.0, 0.0)
0x7e33badc = 2
0xaac0b951 = -2
0x945abb7a = 0
0xf4f010be = 0.75
0xd216a1e6 = 0.4
0x34760e07 = 1
0x4d80a68c = 0
0x9a6b14cd = 1

script ui_create_freestyle_mainmenu 
	Change \{0xbc64bd01 = true}
	if GotParam \{from_mainmenu}
		if GotParam \{device_num}
			Change primary_controller = <device_num>
			Change last_start_pressed_device = <device_num>
		endif
	endif
	Change \{freestyle_ds_has_disconnected = FALSE}
	freestyle_mainmenu_config_ds_handler \{main_menu}
	Change \{freestyle_band_lobby_first_pass = true}
	Change \{freestyle_game_from_postgame = 0}
	CreateScreenElement \{parent = root_window
		id = mainmenu_id
		Type = descinterface
		desc = 'freestyle_mainmenu_tree_v2'
		info_font = fontgrid_text_a1}
	mainmenu_id :desc_resolvealias \{Name = alias_mainmenu_up_arrow}
	up_arrow = <resolved_id>
	mainmenu_id :desc_resolvealias \{Name = alias_mainmenu_down_arrow}
	down_arrow = <resolved_id>
	if mainmenu_id :desc_resolvealias \{Name = 0x179e5690
			param = 0xc88ea12d}
		<0xc88ea12d> :se_getprops
		<0xc88ea12d> :obj_spawnscript 0x6407587e params = {time = 30.0 startPos = <0x5eabc0e2>}
	endif
	if ScreenElementExists \{id = mainmenu_id}
		if mainmenu_id :desc_resolvealias \{Name = 0x593ba975}
			if ScreenElementExists id = <resolved_id>
				<resolved_id> :obj_spawnscript 0x206fbd50 params = {}
			endif
		endif
	endif
	mainmenu_id :desc_resolvealias \{Name = 0xf039812b}
	<resolved_id> :obj_spawnscript 0x52ba0d39
	mainmenu_id :desc_resolvealias \{Name = alias_mainmenu_vmenu}
	AssignAlias id = <resolved_id> alias = current_menu
	current_menu :se_setprops {
		event_handlers = [
			{focus freestyle_refresh_menu_helpers params = {state = mainmenu}}
			{pad_up 0xbecf6bba params = {Dir = -1 isvertical = true}}
			{pad_down 0xbecf6bba params = {Dir = 1 isvertical = true}}
			{pad_back ui_freestyle_main_menu_back}
			{pad_up 0xb4b0c6de params = {arrow_id = <up_arrow> direction = up}}
			{pad_down 0xb4b0c6de params = {arrow_id = <down_arrow> direction = down}}
			{menu_selection_changed generic_menu_up_or_down_sound}
		]
	}
	current_menu :SetTags \{smooth_morph_time = 0.1}
	LaunchEvent \{Type = focus
		target = current_menu}
	if is_ds_connected
		Change \{freestyle_stage_manager_ds = true}
		wiidscommunication :sendmessage \{set_lobby_status
			is_joined = 1}
	endif
	mainmenu_id :desc_resolvealias \{Name = alias_freestyle_mainmenu_option_play}
	0x818b49e8 id = <resolved_id> Type = Play
	LaunchEvent Type = unfocus target = <resolved_id>
	mainmenu_id :desc_resolvealias \{Name = 0x3a2ba75a}
	0x818b49e8 id = <resolved_id> Type = Play
	LaunchEvent Type = unfocus target = <resolved_id>
	mainmenu_id :desc_resolvealias \{Name = alias_freestyle_mainmenu_option_manage}
	0x818b49e8 id = <resolved_id> Type = song_library
	LaunchEvent Type = unfocus target = <resolved_id>
	mainmenu_id :desc_resolvealias \{Name = 0xa54c80bd}
	0x818b49e8 id = <resolved_id> Type = song_library
	LaunchEvent Type = unfocus target = <resolved_id>
	mainmenu_id :desc_resolvealias \{Name = alias_freestyle_mainmenu_option_connect}
	if is_ds_connected
		freestyle_mainmenu_refresh_ds_connect_option \{connected}
	else
		freestyle_mainmenu_refresh_ds_connect_option \{disconnected}
	endif
	mainmenu_id :desc_resolvealias \{Name = alias_freestyle_mainmenu_option_tutorials}
	0x818b49e8 id = <resolved_id> Type = tutorials
	LaunchEvent Type = unfocus target = <resolved_id>
	mainmenu_id :desc_resolvealias \{Name = 0x7806b5f3}
	0x818b49e8 id = <resolved_id> Type = tutorials
	LaunchEvent Type = unfocus target = <resolved_id>
	0x61906aac
endscript

script 0x818b49e8 
	RequireParams \{[
			Type
			id
		]
		all}
	event_handlers = [
		{focus 0x043d1bdd}
		{unfocus 0x53bf15bb}
	]
	switch <Type>
		case Play
		0x21c06848 = [
			{focus freestyle_mainmenu_display_info params = {Play}}
			{pad_choose freestyle_mainmenu_play params = {<...>}}
		]
		case song_library
		0x21c06848 = [
			{focus freestyle_mainmenu_display_info params = {library}}
			{pad_choose freestyle_mainmenu_manage}
		]
		case ds
		if is_ds_connected
			0x21c06848 = [
				{focus freestyle_mainmenu_display_info params = {nods}}
				{pad_choose freestyle_mainmenu_ds}
			]
		else
			0x21c06848 = [
				{focus freestyle_mainmenu_display_info params = {ds}}
				{pad_choose freestyle_mainmenu_ds}
			]
		endif
		case tutorials
		0x21c06848 = [
			{focus freestyle_mainmenu_display_info params = {tutorial}}
			{pad_choose freestyle_mainmenu_tutorial}
		]
	endswitch
	event_handlers = (<event_handlers> + <0x21c06848>)
	<id> :se_setprops event_handlers = <event_handlers> replace_handlers
endscript

script 0xb4b0c6de 
	RequireParams \{[
			arrow_id
			direction
		]
		all}
	<arrow_id> :obj_spawnscript mainmenu_do_scroll_glow
	<arrow_id> :obj_spawnscript 0x60966e58 params = {<direction>}
endscript

script 0x60966e58 
	Obj_GetID
	if GotParam \{down}
		<objID> :se_setprops Scale = 1.3 time = 0.01
		<objID> :se_waitprops
		<objID> :se_setprops Scale = 1.0 time = 0.1
		<objID> :se_waitprops
	else
		<objID> :se_setprops Scale = 1.3 time = 0.01
		<objID> :se_waitprops
		<objID> :se_setprops Scale = 1.0 time = 0.1
		<objID> :se_waitprops
	endif
endscript

script 0x043d1bdd \{grow_scale = 1.8}
	Obj_GetID
	id = <objID>
	<id> :se_setprops {
		menurow_scale = <grow_scale>
		0xe2d8d29d = 0
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = ($menu_focus_color)
	}
	<id> :desc_refreshcontentdims
	<id> :SetTags 0x9a010967 = <grow_scale>
	<id> :se_setprops menurow_scale = 1
	<id> :se_setprops menurow_scale = <grow_scale> time = 0.1 motion = ease_in
	0x7924a0f9
endscript

script 0x53bf15bb 
	Obj_GetID
	id = <objID>
	<id> :se_setprops {
		menurow_scale = 1.0
		0xe2d8d29d = 6
		menurow_txt_item_font = fontgrid_text_a1
		menurow_txt_item_rgba = [100 84 164 255]
	}
	<id> :desc_refreshcontentdims
	if <id> :GetSingleTag 0x9a010967
		<id> :se_setprops menurow_scale = <0x9a010967>
		<id> :se_setprops menurow_scale = 1.0 time = 0.1 motion = ease_in
	endif
endscript

script 0x7924a0f9 
	current_menu :menu_getselectedindex
	GetScreenElementChildren \{id = current_menu}
	GetArraySize <children>
	if (<array_Size> > 0)
		i = 0
		begin
		(<children> [<i>]) :se_setprops alpha = 1
		i = (<i> + 1)
		repeat <array_Size>
		0x51a9c37e = (<selected_index> + 2)
		if (<0x51a9c37e> > (<array_Size> -1))
			0x51a9c37e = (<0x51a9c37e> - <array_Size>)
		endif
		(<children> [<0x51a9c37e>]) :se_setprops alpha = 0.5
		0x51a9c37e = (<selected_index> - 2)
		if (<0x51a9c37e> < 0)
			0x51a9c37e = (<0x51a9c37e> + <array_Size>)
		endif
		(<children> [<0x51a9c37e>]) :se_setprops alpha = 0.5
	endif
endscript

script freestyle_mainmenu_play 
	Change primary_controller = <device_num>
	Change last_start_pressed_device = <device_num>
	freestyle_mainmenu_config_ds_handler \{standard}
	Change \{freestyle_game_mode = standard}
	Change \{freestyle_recording_mode = record}
	generic_event_choose state = uistate_band_lobby data = {device_num = <device_num>}
endscript

script freestyle_mainmenu_manage 
	Change primary_controller = <device_num>
	Change last_start_pressed_device = <device_num>
	freestyle_mainmenu_config_ds_handler \{standard}
	menu_transition_stoprender
	generic_event_choose \{state = uistate_freestyle_replay}
endscript

script freestyle_mainmenu_ds 
	Change primary_controller = <device_num>
	Change last_start_pressed_device = <device_num>
	if is_ds_connected
		wiidscommunication :disconnect
		ui_event \{event = menu_refresh}
	else
		freestyle_mainmenu_config_ds_handler \{standard}
		ds_connection_helper \{mode = freestyle
			from = freestyle_mainmenu}
	endif
endscript

script freestyle_mainmenu_tutorial 
	Change primary_controller = <device_num>
	Change last_start_pressed_device = <device_num>
	freestyle_mainmenu_config_ds_handler \{standard}
	generic_event_choose \{state = uistate_freestyle_tutorial_setup}
endscript

script freestyle_mainmenu_refresh_ds_connect_option 
	if GotParam \{connected}
		text = qs(0x0f9b925f)
	else
		text = qs(0x6918149b)
	endif
	mainmenu_id :desc_resolvealias \{Name = alias_freestyle_mainmenu_option_connect}
	<resolved_id> :se_setprops menurow_txt_item_text = <text>
	0x818b49e8 id = <resolved_id> Type = ds
	LaunchEvent Type = unfocus target = <resolved_id>
	mainmenu_id :desc_resolvealias \{Name = 0xc0815517}
	<resolved_id> :se_setprops menurow_txt_item_text = <text>
	0x818b49e8 id = <resolved_id> Type = ds
	LaunchEvent Type = unfocus target = <resolved_id>
endscript

script freestyle_mainmenu_display_info 
	if GotParam \{Play}
		mainmenu_id :se_setprops \{info_text = qs(0x7a6c088a)}
	elseif GotParam \{library}
		mainmenu_id :se_setprops \{info_text = qs(0xe956ff70)}
	elseif GotParam \{ds}
		mainmenu_id :se_setprops \{info_text = qs(0x32d9a259)}
	elseif GotParam \{tutorial}
		mainmenu_id :se_setprops \{info_text = qs(0x6763a336)}
	elseif GotParam \{nods}
		mainmenu_id :se_setprops \{info_text = qs(0x0e1af799)}
	endif
endscript

script ui_destroy_freestyle_mainmenu 
	DestroyScreenElement \{id = mainmenu_id}
	DestroyScreenElement \{id = freestyle_mock_ds_connect}
	KillSpawnedScript \{id = effects_scripts}
	generic_ui_destroy
endscript

script ui_freestyle_main_menu_back 
	if is_ui_event_running
		return
	endif
	if NOT ScreenElementExists \{id = dialog_box_desc_id}
		if is_ds_connected
			mainmenu_id :desc_resolvealias \{Name = alias_mainmenu_vmenu}
			LaunchEvent Type = unfocus target = <resolved_id>
			create_dialog_box {
				use_all_controllers
				heading_text = qs(0xaa163738)
				body_text = qs(0xc77c4e16)
				options = [
					{
						func = destroy_dialog_box
						func_params = {dont_remove_helpers}
						text = qs(0x7c6b3f07)
					}
					{
						func = ui_freestyle_main_menu_back
						text = qs(0xb5dafff1)
					}
				]
				dlog_event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
				]
				on_destroy_script = LaunchEvent
				on_destroy_script_params = {Type = focus target = <resolved_id>}
			}
		else
			generic_menu_pad_back_sound
			freestyle_back_to_gh_main_menu
		endif
	else
		destroy_dialog_box
		generic_menu_pad_back_sound
		freestyle_back_to_gh_main_menu
	endif
endscript

script freestyle_back_to_gh_main_menu 
	if ScreenElementExists \{id = mainmenu_id}
		mainmenu_id :se_setprops \{block_events}
	endif
	if ScreenElementExists \{id = ds_catcher}
		DestroyScreenElement \{id = ds_catcher}
	endif
	Change \{freestyle_just_exited = true}
	Change \{freestyle_loading_screen_type = None}
	create_loading_screen
	generic_event_choose \{no_sound
		state = uistate_freeplay
		data = {
			clear_previous_stack
		}}
endscript

script 0x52ba0d39 
	Obj_GetID
	GetScreenElementChildren id = <objID>
	(<children> [0]) :obj_spawnscript 0xef5b4d5f
	0x87e96a72 = (<children> [0])
	GetScreenElementChildren id = <0x87e96a72>
	(<children> [0]) :obj_spawnscript 0x2368c8cf
	CreateScreenElement {
		Type = ContainerElement
		parent = <objID>
		dims = (1.0, 1.0)
		pos_anchor = [center center]
		just = [center center]
		Pos = (0.0, 0.0)
		id = 0x024348f6
	}
	0x024348f6 :obj_spawnscript 0x74fb5a31 params = {parent = <objID> 0x87e96a72 = <0x87e96a72>}
	begin
	GetRandomValue Name = X a = ($0x072b188f) b = ($0x97580865)
	GetRandomValue Name = y a = ($0x072b188f) b = ($0x97580865)
	0x26fb1f1a = Random (@ 1 @ -1 )
	0x1b9b36aa = Random (@ 1 @ -1 )
	X = (<X> * <0x26fb1f1a>)
	y = (<y> * <0x1b9b36aa>)
	position = (((1.0, 0.0) * <X>) + ((0.0, 1.0) * <y>))
	GetRandomValue Name = time a = ($0x659f000e) b = ($0x59923f57)
	0x024348f6 :se_setprops Pos = <position> time = <time>
	GetRandomValue Name = time a = ($0x4294d41c) b = ($0x652fb32d)
	Wait <time> Seconds
	repeat
endscript

script 0x74fb5a31 
	begin
	GetScreenElementPosition \{id = 0x024348f6}
	<0x87e96a72> :se_getprops
	0x024348f6 :obj_spawnscript 0x07019f58 params = {
		target_pos = <screenelementpos>
		parent = <parent>
		0x8a2ba007 = <rot_angle>
		start_pos = <Pos>
	}
	Wait ($0x3d8ad2f1) Seconds
	repeat
endscript

script 0x07019f58 
	RequireParams \{[
			target_pos
		]
		all}
	GetRandomValue Name = 0x7ee4f213 a = ($0x33b91df6) b = ($0xe452afb7)
	GetRandomValue Name = end_scale a = ($0xdf7e7d7b) b = ($0x0895cf3a)
	0x7ba86797 = Random (@ 1 @ -1 )
	0x7ee4f213 = (<0x7ee4f213> * <0x7ba86797>)
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		Pos = <start_pos>
		just = [center center]
		pos_anchor = [center center]
		dims = (512.0, 256.0)
		Scale = ($0x8e24d8eb)
		texture = 0xf5bb137d
		blend = add
		z_priority = 452
		rgba = ($0x58dd0aad)
		rot_angle = <0x8a2ba007>
	}
	<id> :se_setprops {
		time = ($0xa0682139)
		Pos = <target_pos>
		Scale = <end_scale>
		rot_angle = <0x7ee4f213>
		motion = ease_out
		rgba = ($0x71b870a7)
	}
	Wait ($0xa0682139) Seconds
	DestroyScreenElement id = <id>
endscript

script 0xef5b4d5f 
	Obj_GetID
	begin
	<objID> :se_setprops {
		Pos = ($0xfca86330)
		rot_angle = ($0x7e33badc)
		time = ($0xf4f010be)
		motion = ease_out
	}
	Wait ($0xf4f010be) Seconds
	<objID> :se_setprops {
		Pos = ($0x2f36dc3c)
		rot_angle = ($0x945abb7a)
		time = ($0xf4f010be)
		motion = ease_in
	}
	Wait ($0xf4f010be) Seconds
	<objID> :se_setprops {
		Pos = ($0xb1aae5dc)
		rot_angle = ($0xaac0b951)
		time = ($0xf4f010be)
		motion = ease_out
	}
	Wait ($0xf4f010be) Seconds
	<objID> :se_setprops {
		Pos = ($0x2f36dc3c)
		rot_angle = ($0x945abb7a)
		time = ($0xf4f010be)
		motion = ease_in
	}
	Wait ($0xf4f010be) Seconds
	repeat
endscript

script 0x2368c8cf 
	Obj_GetID
	begin
	GetRandomValue Name = time a = ($0xd216a1e6) b = ($0x34760e07)
	GetRandomValue Name = alpha a = ($0x4d80a68c) b = ($0x9a6b14cd)
	min = ($0x13dec31b)
	Max = ($0x5391bb6d)
	0xeb1f4283 = (<min> + ((<Max> - <min>) * (1 - <alpha>)))
	Change 0x3d8ad2f1 = <0xeb1f4283>
	<objID> :se_setprops alpha = <alpha> time = <time>
	Wait <time> Seconds
	repeat
endscript
