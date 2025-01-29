
script ui_init_options 
	Change \{g_net_leader_player_num = 1}
	Change \{g_leader_player_num = 1}
	marketplacebgmonitorfunc \{func = set_background_download
		On}
endscript

script ui_deinit_options 
	Change \{g_net_leader_player_num = -1}
	Change \{g_leader_player_num = -1}
	marketplacebgmonitorfunc \{func = set_background_download
		OFF}
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
	uistack_createboundscreenelement \{parent = root_window
		id = options_menu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{
				pad_back
				ui_options_pad_back_script
			}
		]}
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
	if CheckForSignIn local controller_index = ($primary_controller)
		mainmenu_setup_option \{choose_script = ui_options_import_songs_choose
			back_script = ui_options_pad_back_script
			menu_item_text = qs(0xe17421b3)
			screen_id = options_menu_id
			helper_text = qs(0xbf7a400e)}
	else
		mainmenu_setup_option {
			menu_item_text = qs(0xe17421b3)
			screen_id = options_menu_id
			helper_text = qs(0xbf7a400e)
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
	mainmenu_setup_option \{choose_state = uistate_example_ui_stack_object
		back_script = ui_options_pad_back_script
		menu_item_text = qs(0xa082c3e9)
		screen_id = options_menu_id
		helper_text = qs(0x03ac90f0)}
	mainmenu_setup_option \{choose_state = uistate_options_audio
		choose_params = {
			from_pause_menu = 0
		}
		back_script = ui_options_pad_back_script
		menu_item_text = qs(0xa0345d1c)
		screen_id = options_menu_id
		helper_text = qs(0xdbc6e6a9)}
	signin_params = {network_platform_only}
	if isps3
		signin_params = {}
	endif
	if CheckForSignIn <signin_params> controller_index = ($primary_controller)
		if isps3
			if NetSessionFunc \{func = is_lobby_available}
				mainmenu_setup_option \{choose_state = uistate_guitarhero_com
					back_script = ui_options_pad_back_script
					menu_item_text = qs(0xb9421287)
					screen_id = options_menu_id
					helper_text = qs(0x81a5615a)}
			else
				mainmenu_setup_option \{choose_state = uistate_vip_invite
					back_script = ui_options_pad_back_script
					menu_item_text = qs(0xb9421287)
					screen_id = options_menu_id
					helper_text = qs(0x81a5615a)}
			endif
		else
			mainmenu_setup_option \{choose_state = uistate_guitarhero_com
				back_script = ui_options_pad_back_script
				menu_item_text = qs(0xb9421287)
				screen_id = options_menu_id
				helper_text = qs(0x81a5615a)}
		endif
	else
		mainmenu_setup_option \{choose_state = uistate_vip_invite
			back_script = ui_options_pad_back_script
			menu_item_text = qs(0xb9421287)
			screen_id = options_menu_id
			helper_text = qs(0x81a5615a)}
	endif
	if NOT CheckForSignIn local controller_index = ($primary_controller)
		mainmenu_setup_option {
			menu_item_text = qs(0x9baf87e5)
			screen_id = options_menu_id
			helper_text = qs(0x3e5d3207)
			<blocked_option_flags>
		}
	else
		mainmenu_setup_option {
			choose_script = generic_event_choose
			choose_params = {no_sound state = uistate_band_name_logo data = {override_base_name = 'none' controller = ($primary_controller) first_time = 1}}
			back_script = ui_options_pad_back_script
			menu_item_text = qs(0x9baf87e5)
			screen_id = options_menu_id
			helper_text = qs(0x3e5d3207)
		}
	endif
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
			menu_item_text = qs(0xd14975ca)
			screen_id = options_menu_id
			helper_text = qs(0x03ac90f0)
			<blocked_option_flags>
		}
	else
		mainmenu_setup_option \{choose_state = uistate_options_data
			back_script = ui_options_pad_back_script
			menu_item_text = qs(0xd14975ca)
			screen_id = options_menu_id
			helper_text = qs(0xedf319fa)}
	endif
	mainmenu_setup_option \{choose_state = uistate_options_cheats_new
		back_script = ui_options_pad_back_script
		menu_item_text = qs(0xe6c0d255)
		screen_id = options_menu_id
		helper_text = qs(0x03ac90f0)}
	get_progression_instrument_user_option part = drum controller = ($primary_controller) option = 'lefty_flip'
	if (<user_option> = 1)
		lefty_icon = Options_Controller_Check
	else
		lefty_icon = Options_Controller_X
	endif
	mainmenu_setup_option {
		choose_state = uistate_options_settings_lefty_warning
		choose_params = {part = drum}
		back_script = ui_options_pad_back_script
		menu_item_text = qs(0x8a2f0b1a)
		icon = <lefty_icon>
		screen_id = options_menu_id
		helper_text = qs(0x03ac90f0)
	}
	get_progression_instrument_user_option part = guitar controller = ($primary_controller) option = 'lefty_flip'
	if (<user_option> = 1)
		lefty_icon = Options_Controller_Check
	else
		lefty_icon = Options_Controller_X
	endif
	mainmenu_setup_option {
		choose_state = uistate_options_settings_lefty_warning
		choose_params = {part = guitar}
		back_script = ui_options_pad_back_script
		menu_item_text = qs(0x284f6ad1)
		icon = <lefty_icon>
		screen_id = options_menu_id
		helper_text = qs(0x03ac90f0)
	}
	get_progression_instrument_user_option part = vocals controller = ($primary_controller) option = 'highway_view'
	if (<user_option> = None)
		save_progression_instrument_user_option {
			part = vocals
			controller = ($primary_controller)
			option = 'highway_view'
			new_value = scrolling
		}
		user_option = scrolling
	endif
	vocals_get_highway_type_text highway_type = <user_option>
	formatText TextName = highway_view_text qs(0xa924fa40) a = <highway_type_text>
	mainmenu_setup_option {
		choose_script = ui_options_change_highway_view
		choose_params = {value = <user_option>}
		back_script = ui_options_pad_back_script
		menu_item_text = <highway_view_text>
		screen_id = options_menu_id
		helper_text = qs(0x3b8f7f34)
	}
	mainmenu_setup_option \{choose_script = choose_calibrate_lag
		back_script = ui_options_pad_back_script
		menu_item_text = qs(0x550b8c8e)
		screen_id = options_menu_id
		helper_text = qs(0xfb6da5bc)}
	if CheckForSignIn local controller_index = ($primary_controller)
		mainmenu_setup_option \{choose_script = ui_options_setlist_warning
			back_script = ui_options_pad_back_script
			menu_item_text = qs(0x323d3e47)
			screen_id = options_menu_id
			helper_text = qs(0xf869b4ee)}
	else
		mainmenu_setup_option {
			menu_item_text = qs(0x323d3e47)
			screen_id = options_menu_id
			helper_text = qs(0xf869b4ee)
			<blocked_option_flags>
		}
	endif
	mainmenu_setup_option \{choose_state = uistate_options_universal_help
		back_script = ui_options_pad_back_script
		menu_item_text = qs(0x971751d9)
		screen_id = options_menu_id
		helper_text = qs(0x03ac90f0)}
	if ($g_enable_facebook = 1)
		if CheckForSignIn local controller_index = ($primary_controller)
			mainmenu_setup_option \{choose_state = uistate_options_facebook
				choose_params = {
					from_options = 1
				}
				back_script = ui_options_pad_back_script
				menu_item_text = qs(0x2c471a67)
				screen_id = options_menu_id
				helper_text = qs(0x6057c6a8)}
		else
			mainmenu_setup_option {
				menu_item_text = qs(0x2c471a67)
				<blocked_option_flags>
			}
		endif
	endif
	if ($g_enable_twitter = 1)
		if CheckForSignIn local controller_index = ($primary_controller)
			mainmenu_setup_option \{choose_state = uistate_options_twitter
				choose_params = {
					from_options = 1
				}
				back_script = ui_options_pad_back_script
				menu_item_text = qs(0x748ac567)
				screen_id = options_menu_id
				helper_text = qs(0x087b84fb)}
		else
			mainmenu_setup_option {
				menu_item_text = qs(0x748ac567)
				<blocked_option_flags>
			}
		endif
	endif
	set_focus_color
	set_unfocus_color
	ui_options_set_settings
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	SpawnScriptNow \{reset_mainmenu_camera}
endscript

script ui_destroy_options 
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
					RemoveComponent \{structure_name = new_user_options
						Name = facebook_info}
					RemoveComponent \{structure_name = user_options
						Name = facebook_info}
					RemoveComponent \{structure_name = new_user_options
						Name = twitter_info}
					RemoveComponent \{structure_name = user_options
						Name = twitter_info}
					if NOT comparestructs struct1 = <new_user_options> struct2 = <user_options>
						SpawnScriptNow \{ui_memcard_autosave_replace}
						return
					endif
				endif
			endif
		endif
	endif
	if NOT (GotParam no_event)
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

script ui_options_setlist_warning 
	se_getparentid
	if ScreenElementExists id = <parent_id>
		LaunchEvent Type = unfocus target = <parent_id>
	endif
	destroy_dialog_box
	create_dialog_box {
		template = extended
		heading_text = qs(0x101b3ea0)
		body_text = qs(0x22101db1)
		player_device = ($primary_controller)
		options = [
			{
				func = ui_options_setlist_warning_ok
				text = qs(0x0e41fe46)
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
		state = uistate_boot_download_scan savegame = <savegame> controller = ($primary_controller) Force = 1
		event_params = {event = menu_back data = {state = uistate_options}}
	}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_options_setlist_warning_cancel \{focus_id = !q1768515945}
	destroy_dialog_box
	if ScreenElementExists id = <focus_id>
		LaunchEvent Type = focus target = <focus_id>
	endif
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
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

script ui_options_import_songs_choose 
	if isps3
		if NOT CheckForSignIn controller_index = ($primary_controller)
			ui_sfx \{menustate = Generic
				uitype = select}
			generic_event_choose state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = uistate_import_setup require_live = 1 jam = 1}
			return
		endif
	endif
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose \{state = uistate_import_setup}
endscript

script ui_options_anim_in 
	if ScreenElementExists \{id = options_menu_id}
		begin
		options_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)}
		options_menu_id :se_waitprops
		options_menu_id :se_setprops \{chain_anim_pos = (-315.0, 233.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.03, 1.03)
			bgrock_anim_pos = (-155.0, -178.0)
			axestone_anim_pos = (330.0, 72.0)
			ampzilla_anim_pos = (10.0, -169.0)
			mainmenu_anim_calcium_fulltop_pos = (79.0, 100.0)
			time = 0.01}
		options_menu_id :se_waitprops
		options_menu_id :se_setprops \{chain_anim_pos = (-305.0, 233.0)
			gor_anim_pos = (-260.0, -20.0)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (310.0, 82.0)
			ampzilla_anim_pos = (25.0, -180.0)
			mainmenu_anim_calcium_fulltop_pos = (90.0, 100.0)
			time = 0.01}
		options_menu_id :se_waitprops
		options_menu_id :se_setprops \{chain_anim_pos = (-315.0, 240.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.06, 1.06)
			bgrock_anim_pos = (-130.0, -180.0)
			axestone_anim_pos = (310.0, 92.0)
			ampzilla_anim_pos = (12.0, -170.0)
			mainmenu_anim_calcium_fulltop_pos = (78.0, 100.0)
			time = 0.01}
		options_menu_id :se_waitprops
		options_menu_id :se_setprops \{chain_anim_pos = (-309.0, 233.0)
			gor_anim_pos = (-255.0, -20.0)
			gor_anim_scale = (1.05, 1.05)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (330.0, 75.0)
			ampzilla_anim_pos = (22.0, -160.0)
			mainmenu_anim_calcium_fulltop_pos = (85.0, 100.0)
			time = 0.01}
		options_menu_id :se_waitprops
		options_menu_id :se_setprops \{chain_anim_pos = (-313.0, 233.0)
			gor_anim_pos = (-271.0, -20.0)
			gor_anim_scale = (1.01, 1.01)
			bgrock_anim_pos = (-150.0, -178.0)
			axestone_anim_pos = (310.0, 90.0)
			ampzilla_anim_pos = (18.0, -179.0)
			mainmenu_anim_calcium_fulltop_pos = (93.0, 100.0)
			time = 0.01}
		options_menu_id :se_waitprops
		options_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)
			time = 0.01}
		options_menu_id :se_waitprops
		repeat 1
	endif
endscript

script ui_options_anim_out 
	printf \{channel = blah
		qs(0x0d1a424d)}
	if ScreenElementExists \{id = options_menu_id}
		begin
		options_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)}
		options_menu_id :se_waitprops
		options_menu_id :se_setprops \{chain_anim_pos = (-315.0, 233.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.03, 1.03)
			bgrock_anim_pos = (-155.0, -178.0)
			axestone_anim_pos = (330.0, 72.0)
			ampzilla_anim_pos = (10.0, -169.0)
			mainmenu_anim_calcium_fulltop_pos = (79.0, 100.0)
			time = 0.01}
		options_menu_id :se_waitprops
		options_menu_id :se_setprops \{chain_anim_pos = (-305.0, 233.0)
			gor_anim_pos = (-260.0, -20.0)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (310.0, 82.0)
			ampzilla_anim_pos = (25.0, -180.0)
			mainmenu_anim_calcium_fulltop_pos = (90.0, 100.0)
			time = 0.01}
		options_menu_id :se_waitprops
		options_menu_id :se_setprops \{chain_anim_pos = (-315.0, 240.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.06, 1.06)
			bgrock_anim_pos = (-130.0, -180.0)
			axestone_anim_pos = (310.0, 92.0)
			ampzilla_anim_pos = (12.0, -170.0)
			mainmenu_anim_calcium_fulltop_pos = (78.0, 100.0)
			time = 0.01}
		options_menu_id :se_waitprops
		options_menu_id :se_setprops \{chain_anim_pos = (-309.0, 233.0)
			gor_anim_pos = (-255.0, -20.0)
			gor_anim_scale = (1.05, 1.05)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (330.0, 75.0)
			ampzilla_anim_pos = (22.0, -160.0)
			mainmenu_anim_calcium_fulltop_pos = (85.0, 100.0)
			time = 0.01}
		options_menu_id :se_waitprops
		options_menu_id :se_setprops \{chain_anim_pos = (-313.0, 233.0)
			gor_anim_pos = (-271.0, -20.0)
			gor_anim_scale = (1.01, 1.01)
			bgrock_anim_pos = (-150.0, -178.0)
			axestone_anim_pos = (310.0, 90.0)
			ampzilla_anim_pos = (18.0, -179.0)
			mainmenu_anim_calcium_fulltop_pos = (93.0, 100.0)
			time = 0.01}
		options_menu_id :se_waitprops
		options_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)
			time = 0.01}
		options_menu_id :se_waitprops
		repeat 1
	endif
endscript
