
script ui_create_options_settings 
	getglobaltags \{user_options}
	make_menu_frontend \{screen = guitarist
		title = qs(0x2c98ca28)
		pad_back_script = ui_options_check_settings}
	add_menu_frontend_item \{text = qs(0x75ff0ab2)
		choose_state = uistate_options_audio}
	lefty_texture = data_settings_xmark
	getplayerinfo \{player = 1
		lefty_flip}
	if (<lefty_flip> = 1)
		lefty_texture = data_settings_checkmark
	endif
	if ((isps3) || (iswinport))
		add_menu_frontend_item \{text = qs(0x2e9b1b43)
			pos = (20.0, 0.0)
			choose_state = uistate_options_settings_lefty_warning
			choose_state_data = {
				is_popup
			}}
		current_menu :settags lefty_id = <item_id>
	else
		add_menu_frontend_item {
			text = qs(0x2e9b1b43)
			pos = (20.0, 0.0)
			pad_choose_script = ui_options_controller_choose_lefty_flip
			pad_choose_params = {popup = <popup> player_device = $primary_controller}
		}
	endif
	createscreenelement {
		type = spriteelement
		parent = <item_container_id>
		local_id = check
		pos = (0.0, 20.0)
		just = [center center]
		texture = <lefty_texture>
	}
	if ($vocal_enable_static_view = 1)
		vocals_get_highway_view \{player = 1}
		if (<highway_view> = static)
			scroll_texture = data_settings_xmark
		else
			scroll_texture = data_settings_checkmark
		endif
		add_menu_frontend_item \{text = qs(0x7a043839)
			pos = (20.0, 0.0)
			pad_choose_script = options_change_vocals_highway_view
			pad_choose_params = {
				no_restart
				player = 1
			}}
		createscreenelement {
			type = spriteelement
			parent = <item_container_id>
			local_id = check
			pos = (0.0, 20.0)
			just = [center center]
			texture = <scroll_texture>
		}
	endif
	getplayerinfo \{player = 1
		vocals_sp_clap}
	if (<vocals_sp_clap> = 0)
		scroll_texture = data_settings_xmark
	else
		scroll_texture = data_settings_checkmark
	endif
	add_menu_frontend_item \{text = qs(0xa86561de)
		pos = (20.0, 0.0)
		pad_choose_script = options_change_vocals_sp_clap
		pad_choose_params = {
			player = 1
		}}
	createscreenelement {
		type = spriteelement
		parent = <item_container_id>
		local_id = check
		pos = (0.0, 20.0)
		just = [center center]
		texture = <scroll_texture>
	}
	count_texture = data_settings_xmark
	if (<unpause_count> = 1)
		count_texture = data_settings_checkmark
	endif
	add_menu_frontend_item \{text = qs(0xc987ca62)
		pos = (20.0, 0.0)
		pad_choose_script = ui_options_settings_choose_count
		pad_choose_params = {
			player = 1
		}}
	createscreenelement {
		type = spriteelement
		parent = <item_container_id>
		local_id = check
		pos = (0.0, 20.0)
		just = [center center]
		texture = <count_texture>
	}
	ui_options_set_settings
	menu_finish
endscript

script ui_destroy_options_settings 
	generic_ui_destroy
endscript

script ui_return_options_settings 
	clean_up_user_control_helpers
	add_gamertag_helper \{exclusive_device = $primary_controller}
	menu_finish
endscript

script ui_options_settings_choose_count 
	obj_getid
	getglobaltags \{user_options
		param = unpause_count}
	if resolvescreenelementid id = {<objid> child = {0 child = check}}
		if (<unpause_count> = 1)
			<unpause_count> = 0
			soundevent \{event = checkbox_sfx}
			if gotparam \{popup}
				<resolved_id> :setprops texture = options_controller_x
			else
				<resolved_id> :setprops texture = data_settings_xmark
			endif
		else
			<unpause_count> = 1
			soundevent \{event = checkbox_check_sfx}
			if gotparam \{popup}
				<resolved_id> :setprops texture = options_controller_check
			else
				<resolved_id> :setprops texture = data_settings_checkmark
			endif
		endif
		setglobaltags user_options params = {unpause_count = <unpause_count>}
	endif
endscript

script ui_create_options_settings_lefty_warning 
	create_popup_warning_menu \{title = qs(0xaa163738)
		textblock = {
			text = qs(0x15cdec24)
		}
		options = [
			{
				func = ui_options_settings_lefty_warning
				text = qs(0x182f0173)
			}
		]
		no_background}
endscript

script ui_destroy_options_settings_lefty_warning 
	destroy_popup_warning_menu
endscript

script ui_options_settings_lefty_warning 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	current_menu :getsingletag \{lefty_id}
	<lefty_id> :obj_spawnscript ui_options_controller_choose_lefty_flip params = {player_device = $primary_controller}
	generic_event_back
endscript
