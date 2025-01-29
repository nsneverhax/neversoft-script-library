
script ui_init_options 
	Change \{g_net_leader_player_num = 1}
	Change \{g_leader_player_num = 1}
endscript

script ui_deinit_options 
	Change \{g_net_leader_player_num = -1}
	Change \{g_leader_player_num = -1}
endscript

script ui_create_options 
	SpawnScriptNow \{audio_ui_menu_music_on}
	blocked_option_flags = {
		not_focusable
		icon = strike
		text_focus_color = [220 30 30 255]
		text_unfocus_color = [216 181 117 255]
	}
	Change \{rich_presence_context = presence_menus}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	uistack_createboundscreenelement {
		parent = root_window
		id = options_menu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{pad_back ui_options_pad_back_script}
		]
		exclusive_device = ($primary_controller)
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0x976cf9e7)
	}
	attempt_to_add_friend_feed \{parent_id = options_menu_id
		menu = main_generic}
	mainmenu_setup_physics_elements \{screen_id = options_menu_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = options_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = options_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = options_menu_id
		}}
	if isps3
		if options_menu_id :desc_resolvealias \{Name = alias_mainmenu_up_arrow}
			<resolved_id> :se_setprops {
				Hide
			}
		endif
		if options_menu_id :desc_resolvealias \{Name = alias_mainmenu_down_arrow}
			<resolved_id> :se_setprops {
				Hide
			}
		endif
	endif
	mainmenu_setup_option \{choose_script = ui_options_gameplay_settings
		back_script = ui_options_pad_back_script
		menu_item_text = qs(0xaf9f86e6)
		screen_id = options_menu_id
		helper_text = qs(0x03ac90f0)}
	mainmenu_setup_option \{choose_script = ui_options_choose_calibrate_lag
		back_script = ui_options_pad_back_script
		menu_item_text = qs(0x550b8c8e)
		screen_id = options_menu_id
		helper_text = qs(0xfb6da5bc)}
	mainmenu_setup_option \{choose_script = ui_options_game_setup
		back_script = ui_options_pad_back_script
		menu_item_text = qs(0x9c20d63a)
		screen_id = options_menu_id
		helper_text = qs(0x03ac90f0)}
	<can_saveload> = 1
	if isxenonorwindx
		if NetSessionFunc func = xenonisguest params = {controller_index = ($primary_controller)}
			<can_saveload> = 0
		elseif NOT CheckForSignIn local controller_index = ($primary_controller)
			<can_saveload> = 0
		endif
	elseif NOT CheckForSignIn local controller_index = ($primary_controller)
		<can_saveload> = 0
	endif
	if (<can_saveload> = 0)
		mainmenu_setup_option {
			menu_item_text = qs(0xc20b11fb)
			screen_id = options_menu_id
			helper_text = qs(0x03ac90f0)
			<blocked_option_flags>
		}
	else
		mainmenu_setup_option \{choose_state = uistate_options_data
			back_script = ui_options_pad_back_script
			menu_item_text = qs(0xc20b11fb)
			screen_id = options_menu_id
			helper_text = qs(0xedf319fa)}
	endif
	if isxenonorwindx
		mainmenu_setup_option {
			choose_script = main_menu_select_xbox_party
			back_script = ui_options_pad_back_script
			menu_item_text = ($g_mainmenu_text.xbox_party.menu_item_text)
		}
	endif
	if CheckForSignIn local controller_index = ($primary_controller)
		mainmenu_setup_option \{choose_script = ui_options_setlist_warning
			back_script = ui_options_pad_back_script
			menu_item_text = qs(0xa5d1b2af)
			screen_id = options_menu_id
			helper_text = qs(0xf869b4ee)}
	else
		mainmenu_setup_option {
			menu_item_text = qs(0xa5d1b2af)
			screen_id = options_menu_id
			helper_text = qs(0xf869b4ee)
			<blocked_option_flags>
		}
	endif
	if ($g_prototypes_off = 0)
		mainmenu_setup_option \{choose_script = audio_ui_create_dynamic_audio_modes
			back_script = ui_options_pad_back_script
			menu_item_text = qs(0x9e7925f3)
			screen_id = options_menu_id
			helper_text = qs(0xb2619710)}
	endif
	main_menu_finalize
	set_focus_color
	set_unfocus_color
	ui_options_set_settings
	SpawnScriptNow \{reset_mainmenu_camera}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_options 
	destroy_dialog_box
	clean_up_user_control_helpers
	DestroyScreenElement \{id = titleupdate_version}
	if ScreenElementExists \{id = options_menu_id}
		DestroyScreenElement \{id = options_menu_id}
	endif
endscript

script ui_options_get_controller_type controller = ($primary_controller)
	Type = guitar
	text = qs(0x9504b94a)
	if NOT IsGuitarController controller = <controller>
		Type = drums
		text = qs(0xcf488ba5)
		if NOT isdrumcontroller controller = <controller>
			Type = vocals
			text = qs(0xae6af654)
		endif
	endif
	return {Type = <Type> text = <text>}
endscript

script ui_options_set_settings 
	if ScreenElementExists \{id = current_menu}
		GetGlobalTags \{user_options}
		RemoveParameter \{no_event}
		current_menu :SetTags {user_options = <...>}
	endif
endscript

script ui_options_check_settings 
	RemoveParameter \{event}
	RemoveParameter \{controller}
	if NOT ($playing_song)
		if CheckForSignIn local controller_index = <device_num>
			RemoveParameter \{device_num}
			if ScreenElementExists \{id = current_menu}
				GetGlobalTags \{user_options}
				RemoveParameter \{no_event}
				new_user_options = <...>
				current_menu :GetSingleTag \{user_options}
				if GotParam \{user_options}
					RemoveComponent \{structure_name = new_user_options
						Name = default_tr_name}
					RemoveComponent \{structure_name = user_options
						Name = default_tr_name}
					if NOT comparestructs struct1 = <new_user_options> struct2 = <user_options>
						SpawnScriptNow \{ui_memcard_autosave_replace
							params = {
								show_mainmenu_bg = 1
							}}
						return
					endif
				endif
			endif
		endif
	endif
	if NOT (GotParam no_event)
		ui_sfx \{menustate = Generic
			uitype = back}
		generic_event_back
	endif
endscript

script ui_options_pad_back_script 
	ui_options_check_settings \{no_event}
	if ui_event_exists_in_stack \{Name = 'mainmenu'}
		ui_sfx \{menustate = Generic
			uitype = back}
		generic_event_back \{state = uistate_mainmenu
			no_assert}
	else
		ui_sfx \{menustate = Generic
			uitype = back}
		generic_event_back
	endif
endscript

script ui_options_change_highway_view 
	RequireParams \{[
			value
		]
		all}
	Obj_GetID
	get_savegame_from_controller controller = ($primary_controller)
	get_progression_instrument_user_option part = vocals controller = ($primary_controller) option = 'highway_view'
	GetGlobalTags user_options savegame = <savegame>
	new_option = scrolling
	switch <user_option>
		case None
		new_option = scrolling
		case scrolling
		new_option = static
		case static
		new_option = karaoke
		case karaoke
		new_option = scrolling
		default
		SoftAssert qs(0x8dca25d4) a = <user_option>
	endswitch
	vocals_get_highway_type_text highway_type = <new_option>
	formatText TextName = highway_view_text qs(0xa924fa40) a = <highway_type_text>
	<objID> :SetProps menurow_txt_item_text = <highway_view_text>
	save_progression_instrument_user_option {
		part = vocals
		controller = ($primary_controller)
		option = 'highway_view'
		new_value = <new_option>
	}
endscript

script ui_options_toggle_show_challenge_icons \{savegame = !i1768515945}
	Obj_GetID
	GetGlobalTags savegame = <savegame> user_options param = show_challenge_icons_save
	if (<show_challenge_icons_save> = 0)
		<new_value> = 1
		<show_challenges_icon> = Options_Controller_Check
		ui_sfx \{menustate = Generic
			uitype = toggleon}
	else
		<new_value> = 0
		<show_challenges_icon> = Options_Controller_X
		ui_sfx \{menustate = Generic
			uitype = toggleoff}
	endif
	<objID> :SetProps menurow_ico_item_texture = <show_challenges_icon>
	SetGlobalTags savegame = <savegame> user_options params = {show_challenge_icons_save = <new_value>}
endscript

script ui_options_gameplay_settings 
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose \{state = uistate_options_gameplay}
endscript

script ui_options_game_setup 
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose \{state = uistate_options_game_setup}
endscript

script ui_options_setlist_warning 
	se_getparentid
	if ScreenElementExists id = <parent_id>
		LaunchEvent Type = unfocus target = <parent_id>
	endif
	destroy_dialog_box
	create_dialog_box {
		template = extended
		heading_text = qs(0x87f7b248)
		body_text = qs(0xa0cff1ef)
		player_device = ($primary_controller)
		options = [
			{
				func = ui_options_setlist_warning_ok
				text = qs(0x87f7b248)
			}
			{
				func = ui_options_setlist_warning_cancel
				func_params = {focus_id = <parent_id>}
				text = qs(0xf7723015)
			}
		]
	}
endscript

script ui_options_setlist_warning_ok 
	destroy_dialog_box
	unload_songqpak
	get_savegame_from_controller controller = ($primary_controller)
	ui_event_wait event = menu_change data = {
		state = uistate_boot_download_scan savegame = <savegame> controller = ($primary_controller) Force = 1 show_mainmenu_bg = 1
		event_params = {event = menu_back data = {state = uistate_options}}
	}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
endscript

script ui_options_setlist_warning_cancel \{focus_id = !q1768515945}
	destroy_dialog_box
	if ScreenElementExists id = <focus_id>
		LaunchEvent Type = focus target = <focus_id>
	endif
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
endscript

script reset_mainmenu_camera 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ScriptIsRunning \{kill_gem_scroller}
		Block \{Type = kill_gem_scroller_done}
	endif
	formatText checksumName = camname '%a_ui_mainmenu_camera' a = ($LevelZones.($current_level).Name)
	if NOT GlobalExists Name = <camname>
		return
	endif
	KillCamAnim \{Name = ch_view_cam}
	begin
	if camanimfinished \{Name = ch_view_cam}
		PlayIGCCam {
			id = cs_view_cam_id
			Name = ch_view_cam
			viewport = bg_viewport
			play_hold = 1
			interrupt_current
			($<camname>.params)
		}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ui_options_anim_in 
	mainmenu_animate \{id = options_menu_id}
endscript

script ui_options_anim_out 
	mainmenu_animate \{id = options_menu_id}
endscript

script ui_options_choose_calibrate_lag 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	mainmenu_animate \{id = options_menu_id}
	choose_calibrate_lag
endscript
