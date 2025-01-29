freestyle_last_controller_to_hit_pad_choose = 0
freestyle_just_exited = FALSE

script ui_create_freestyle_mainmenu 
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
		id = freestyle_mainmenu_tree
		Type = descinterface
		desc = 'freestyle_mainmenu_tree_v2'
		font = fontgrid_title_a1
		info_font = fontgrid_text_a1}
	create_2d_spring_system \{desc_id = freestyle_mainmenu_tree
		num_springs = 2
		stiffness = 50
		rest_length = 1}
	freestyle_mainmenu_tree :desc_resolvealias \{Name = alias_skull_add_container}
	<resolved_id> :obj_spawnscript ui_shakey
	<resolved_id> :obj_spawnscript ui_frazzmatazz
	freestyle_mainmenu_tree :desc_resolvealias \{Name = alias_freestyle_mainmenu_menu}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_refresh_menu_helpers params = {state = mainmenu}}
			{pad_up generic_menu_up_or_down_sound params = {up = 1}}
			{pad_down generic_menu_up_or_down_sound params = {down = 2}}
			{pad_back ui_freestyle_main_menu_back}
		]
	}
	LaunchEvent Type = focus target = <resolved_id>
	if is_ds_connected
		Change \{freestyle_stage_manager_ds = true}
		wiidscommunication :sendmessage \{set_lobby_status
			is_joined = 1}
	endif
	freestyle_mainmenu_tree :desc_resolvealias \{Name = alias_freestyle_mainmenu_option_play}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_mainmenu_display_info params = {Play}}
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_mainmenu_tree}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_mainmenu_play params = {<...>}}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
	freestyle_mainmenu_tree :desc_resolvealias \{Name = alias_freestyle_mainmenu_option_manage}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_mainmenu_display_info params = {library}}
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_mainmenu_tree}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_mainmenu_manage}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
	freestyle_mainmenu_tree :desc_resolvealias \{Name = alias_freestyle_mainmenu_option_connect}
	if is_ds_connected
		freestyle_mainmenu_refresh_ds_connect_option \{connected}
	else
		freestyle_mainmenu_refresh_ds_connect_option \{disconnected}
	endif
	<resolved_id> :se_setprops {
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
	freestyle_mainmenu_tree :desc_resolvealias \{Name = alias_freestyle_mainmenu_option_tutorials}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_mainmenu_display_info params = {tutorial}}
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_mainmenu_tree}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_mainmenu_tutorial}
		]
		Scale = ($freestyle_unfocus_scale)
		rgba = ($freestyle_unfocus_rgba)
	}
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
	freestyle_mainmenu_tree :desc_resolvealias \{Name = alias_freestyle_mainmenu_option_connect}
	if GotParam \{connected}
		text = qs(0x0f9b925f)
		event_handlers = [
			{focus freestyle_mainmenu_display_info params = {nods}}
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_mainmenu_tree}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_mainmenu_ds}
		]
	elseif GotParam \{disconnected}
		text = qs(0x6918149b)
		event_handlers = [
			{focus freestyle_mainmenu_display_info params = {ds}}
			{focus freestyle_menu_option_focus}
			{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_mainmenu_tree}}
			{unfocus freestyle_menu_option_unfocus}
			{pad_choose freestyle_mainmenu_ds}
		]
	endif
	<resolved_id> :se_setprops {
		text = <text>
		event_handlers = <event_handlers>
		replace_handlers
	}
endscript

script freestyle_mainmenu_display_info 
	if GotParam \{Play}
		freestyle_mainmenu_tree :se_setprops \{info_text = qs(0x7a6c088a)}
	elseif GotParam \{library}
		freestyle_mainmenu_tree :se_setprops \{info_text = qs(0xe956ff70)}
	elseif GotParam \{ds}
		freestyle_mainmenu_tree :se_setprops \{info_text = qs(0x32d9a259)}
	elseif GotParam \{tutorial}
		freestyle_mainmenu_tree :se_setprops \{info_text = qs(0x6763a336)}
	elseif GotParam \{nods}
		freestyle_mainmenu_tree :se_setprops \{info_text = qs(0x0e1af799)}
	endif
endscript

script ui_destroy_freestyle_mainmenu 
	DestroyScreenElement \{id = freestyle_mainmenu_tree}
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
			freestyle_mainmenu_tree :desc_resolvealias \{Name = alias_freestyle_mainmenu_menu}
			LaunchEvent Type = unfocus target = <resolved_id>
			create_dialog_box {
				use_all_controllers
				heading_text = qs(0xaa163738)
				body_text = qs(0x379f2201)
				options = [
					{
						func = destroy_dialog_box
						func_params = {dont_remove_helpers}
						text = qs(0x8ec213ed)
					}
					{
						func = ui_freestyle_main_menu_back
						text = qs(0xccf7e2c9)
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
	if ScreenElementExists \{id = freestyle_mainmenu_tree}
		freestyle_mainmenu_tree :se_setprops \{block_events}
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
