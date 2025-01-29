
script ui_init_options 
	Change \{g_net_leader_player_num = 1}
	Change \{g_leader_player_num = 1}
endscript

script ui_deinit_options 
	Change \{g_net_leader_player_num = -1}
	Change \{g_leader_player_num = -1}
endscript

script ui_create_options 
	SpawnScriptNow \{menu_music_on}
	blocked_option_flags = {
		not_focusable
		icon = strike
		text_focus_color = [220 30 30 255]
		text_unfocus_color = [220 30 30 255]
	}
	Change \{rich_presence_context = presence_menus}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	CreateScreenElement {
		parent = root_window
		id = options_menu
		Type = descinterface
		desc = 'options_menu'
		title_text = qs(0x976cf9e7)
		exclusive_device = ($primary_controller)
	}
	if NOT options_menu :desc_resolvealias \{Name = 0xa39f6109
			param = 0xd27b45a1}
		SoftAssert \{qs(0xb547c6cd)}
		return
	endif
	AssignAlias id = <0xd27b45a1> alias = current_menu
	current_menu :SetTags \{smooth_morph_time = 0.1}
	current_menu :se_setprops \{event_handlers = [
			{
				pad_up
				0x0c5f870a
				params = {
					desc_id = options_menu
					up
				}
			}
			{
				pad_up
				smoothmenuscroll
				params = {
					Dir = -1
					isvertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_down
				0x0c5f870a
				params = {
					desc_id = options_menu
					down
				}
			}
			{
				pad_down
				smoothmenuscroll
				params = {
					Dir = 1
					isvertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_left
				0x0c5f870a
				params = {
					desc_id = options_menu
					up
				}
			}
			{
				pad_left
				smoothmenuscroll
				params = {
					Dir = -1
					isvertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_right
				0x0c5f870a
				params = {
					desc_id = options_menu
					down
				}
			}
			{
				pad_right
				smoothmenuscroll
				params = {
					Dir = 1
					isvertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_back
				ui_options_pad_back_script
			}
		]}
	add_generic_barrel_menu_text_item \{text = qs(0xbc85b74d)
		helper_text = qs(0xe94236f7)
		choose_state = uistate_online_settings
		additional_focus_script = ui_options_focus
		parent = current_menu}
	add_generic_barrel_menu_text_item \{text = qs(0xa0345d1c)
		helper_text = qs(0xdbc6e6a9)
		additional_focus_script = ui_options_focus
		choose_state = uistate_options_audio
		choose_state_data = {
			from_pause_menu = 0
		}
		parent = current_menu}
	signin_params = {network_platform_only}
	if isps3
		signin_params = {}
	endif
	if CheckForSignIn <signin_params> controller_index = ($primary_controller)
		if ((isps3) || (isngc))
			if NetSessionFunc \{func = is_lobby_available}
				add_generic_barrel_menu_text_item {
					choose_state = uistate_guitarhero_com
					text = qs(0xb9421287)
					helper_text = ($0x4f21f3f5)
					additional_focus_script = ui_options_focus
					parent = current_menu
				}
			else
				add_generic_barrel_menu_text_item {
					text = qs(0xb9421287)
					choose_state = uistate_vip_invite
					helper_text = ($0x4f21f3f5)
					additional_focus_script = ui_options_focus
					parent = current_menu
				}
			endif
		else
			add_generic_barrel_menu_text_item {
				choose_state = uistate_guitarhero_com
				text = qs(0xb9421287)
				helper_text = ($0x4f21f3f5)
				additional_focus_script = ui_options_focus
				parent = current_menu
			}
		endif
	else
		add_generic_barrel_menu_text_item {
			text = qs(0xb9421287)
			helper_text = ($0x4f21f3f5)
			additional_focus_script = ui_options_focus
			choose_state = uistate_vip_invite
			parent = current_menu
		}
	endif
	if NOT CheckForSignIn local controller_index = ($primary_controller)
		add_generic_barrel_menu_text_item {
			text = qs(0x9baf87e5)
			helper_text = qs(0x3e5d3207)
			additional_focus_script = ui_options_focus
			<blocked_option_flags>
			parent = current_menu
		}
	else
		add_generic_barrel_menu_text_item {
			pad_choose_script = generic_event_choose
			pad_choose_params = {no_sound state = uistate_band_name_logo data = {override_base_name = 'none' controller = ($primary_controller) first_time = 1}}
			text = qs(0x9baf87e5)
			helper_text = qs(0x3e5d3207)
			additional_focus_script = ui_options_focus
			parent = current_menu
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
	if ($enable_saving = 0)
		<can_saveload> = 0
	endif
	if (<can_saveload> = 0)
		add_generic_barrel_menu_text_item {
			text = qs(0xd14975ca)
			additional_focus_script = ui_options_focus
			<blocked_option_flags>
			parent = current_menu
		}
	else
		add_generic_barrel_menu_text_item \{choose_state = uistate_options_data
			text = qs(0xd14975ca)
			helper_text = qs(0xedf319fa)
			additional_focus_script = ui_options_focus
			parent = current_menu}
	endif
	add_generic_barrel_menu_text_item \{choose_state = uistate_bonus_videos
		text = qs(0x9560fb22)
		helper_text = qs(0x2ba2c9a2)
		additional_focus_script = ui_options_focus
		parent = current_menu}
	add_generic_barrel_menu_text_item \{choose_state = uistate_options_cheats_new
		text = qs(0xe6c0d255)
		helper_text = qs(0x2ba2c9a2)
		additional_focus_script = ui_options_focus
		parent = current_menu}
	add_generic_barrel_menu_text_item \{pad_choose_script = ui_options_rock_archive_choose
		text = qs(0xc86ed505)
		helper_text = qs(0x45c39ffc)
		additional_focus_script = ui_options_focus
		parent = current_menu}
	get_progression_instrument_user_option part = drum controller = ($primary_controller) option = 'lefty_flip'
	if (<user_option> = 1)
		lefty_icon = Options_Controller_Check
	else
		lefty_icon = Options_Controller_X
	endif
	add_generic_barrel_menu_icon_item {
		choose_state = uistate_options_settings_lefty_warning
		choose_state_data = {part = drum}
		text = qs(0x8a2f0b1a)
		helper_text = qs(0x2ba2c9a2)
		additional_focus_script = ui_options_focus
		icon = <lefty_icon>
		parent = current_menu
	}
	get_progression_instrument_user_option part = guitar controller = ($primary_controller) option = 'lefty_flip'
	if (<user_option> = 1)
		lefty_icon = Options_Controller_Check
	else
		lefty_icon = Options_Controller_X
	endif
	add_generic_barrel_menu_icon_item {
		choose_state = uistate_options_settings_lefty_warning
		choose_state_data = {part = guitar}
		text = qs(0x284f6ad1)
		helper_text = qs(0x2ba2c9a2)
		additional_focus_script = ui_options_focus
		icon = <lefty_icon>
		parent = current_menu
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
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_options_change_highway_view
		pad_choose_params = {value = <user_option>}
		text = <highway_view_text>
		helper_text = qs(0x3b8f7f34)
		additional_focus_script = ui_options_focus
		parent = current_menu
	}
	add_generic_barrel_menu_text_item \{pad_choose_script = choose_calibrate_lag
		text = qs(0x550b8c8e)
		helper_text = qs(0xfb6da5bc)
		additional_focus_script = ui_options_focus
		parent = current_menu}
	GetGlobalTags \{user_options
		param = disable_dlc}
	if (<disable_dlc> = 1)
		0xf2997b6f = Options_Controller_Check
	else
		0xf2997b6f = Options_Controller_X
	endif
	add_generic_barrel_menu_icon_item {
		pad_choose_script = 0x57f16c84
		text = qs(0x14f3938d)
		helper_text = qs(0x2ba2c9a2)
		additional_focus_script = ui_options_focus
		icon = <0xf2997b6f>
		parent = current_menu
	}
	current_menu :SetTags \{0xb4d70fc0 = {
		}
		new_user_options = {
		}}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	SpawnScriptNow \{reset_mainmenu_camera}
endscript

script ui_options_focus 
	GetTags
	if GotParam \{helper_text}
		options_menu :se_setprops helper_text_text = <helper_text>
	endif
endscript

script ui_destroy_options 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = titleupdate_version}
	destroy_generic_barrel_menu
	DestroyScreenElement \{id = options_menu}
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
						generic_menu_pad_back_sound
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

script 0x3445ae81 
	RemoveParameter \{event}
	RemoveParameter \{controller}
	if NOT ($playing_song)
		if CheckForSignIn local controller_index = <device_num>
			RemoveParameter \{device_num}
			if ScreenElementExists \{id = current_menu}
				current_menu :GetSingleTag \{new_user_options}
				current_menu :GetSingleTag \{0xb4d70fc0}
				if GotParam \{new_user_options}
					printstruct <...> channel = what
					if NOT comparestructs struct1 = <new_user_options> struct2 = <0xb4d70fc0>
						generic_menu_pad_back_sound
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
	0x3445ae81 \{no_event}
	if ui_event_exists_in_stack \{Name = 'mainmenu'}
		generic_event_back \{state = uistate_mainmenu
			no_assert}
	else
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

script 0x57f16c84 
	Obj_GetID
	get_savegame_from_controller controller = ($primary_controller)
	GetGlobalTags user_options savegame = <savegame> param = disable_dlc
	current_menu :GetSingleTag \{0xb4d70fc0}
	if NOT StructureContains structure = <0xb4d70fc0> disable_dlc
		current_menu :SetTags 0xb4d70fc0 = {<0xb4d70fc0> disable_dlc = <disable_dlc>}
	endif
	if (<disable_dlc> = 0)
		disable_dlc = 1
		0xf2997b6f = Options_Controller_Check
	else
		disable_dlc = 0
		0xf2997b6f = Options_Controller_X
	endif
	<objID> :SetProps menurow_ico_item_texture = <0xf2997b6f>
	SetGlobalTags user_options savegame = <savegame> params = {disable_dlc = <disable_dlc>}
	current_menu :GetSingleTag \{new_user_options}
	current_menu :SetTags new_user_options = {<new_user_options> disable_dlc = <disable_dlc>}
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
		body_text = qs(0x36f7ba14)
		player_device = ($primary_controller)
		options = [
			{
				func = ui_options_setlist_warning_ok
				text = qs(0x0e41fe46)
			}
			{
				func = ui_options_setlist_warning_cancel
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

script ui_options_setlist_warning_cancel 
	destroy_dialog_box
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = focus
			target = current_menu}
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
		if is_menu_camera_finished
			PlayIGCCam {
				id = cs_view_cam_id
				Name = ch_view_cam
				viewport = bg_viewport
				play_hold = 1
				interrupt_current
				($<camname>.params)
			}
			break
		else
			ScriptAssert \{'Not Good! Get Nick H, Anton B, or Patrick D.'}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ui_options_rock_archive_choose 
	generic_event_choose \{state = uistate_rock_archive}
endscript
