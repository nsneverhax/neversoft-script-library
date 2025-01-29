
script ui_create_options_settings 
	GetGlobalTags \{user_options}
	make_menu_frontend \{screen = GUITARIST
		title = qs(0x2c98ca28)
		pad_back_script = ui_options_check_settings}
	add_menu_frontend_item \{text = qs(0x75ff0ab2)
		choose_state = uistate_options_audio}
	lefty_texture = data_settings_xmark
	getplayerinfo \{Player = 1
		lefty_flip}
	if (<lefty_flip> = 1)
		lefty_texture = data_settings_checkmark
	endif
	if isXenon
		add_menu_frontend_item {
			text = qs(0x2e9b1b43)
			Pos = (20.0, 0.0)
			pad_choose_script = ui_options_controller_choose_lefty_flip
			pad_choose_params = {popup = <popup> player_device = $primary_controller}
		}
	else
		add_menu_frontend_item \{text = qs(0x2e9b1b43)
			Pos = (20.0, 0.0)
			choose_state = uistate_options_settings_lefty_warning
			choose_state_data = {
				is_popup
			}}
		current_menu :SetTags lefty_id = <item_id>
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <item_container_id>
		local_id = check
		Pos = (0.0, 20.0)
		just = [center center]
		texture = <lefty_texture>
	}
	if ($vocal_enable_static_view = 1)
		vocals_get_highway_view \{Player = 1}
		if (<highway_view> = static)
			scroll_texture = data_settings_xmark
		else
			scroll_texture = data_settings_checkmark
		endif
		add_menu_frontend_item \{text = qs(0x7a043839)
			Pos = (20.0, 0.0)
			pad_choose_script = options_change_vocals_highway_view
			pad_choose_params = {
				no_restart
				Player = 1
			}}
		CreateScreenElement {
			Type = SpriteElement
			parent = <item_container_id>
			local_id = check
			Pos = (0.0, 20.0)
			just = [center center]
			texture = <scroll_texture>
		}
	endif
	getplayerinfo \{Player = 1
		vocals_sp_clap}
	if (<vocals_sp_clap> = 0)
		scroll_texture = data_settings_xmark
	else
		scroll_texture = data_settings_checkmark
	endif
	add_menu_frontend_item \{text = qs(0xa86561de)
		Pos = (20.0, 0.0)
		pad_choose_script = options_change_vocals_sp_clap
		pad_choose_params = {
			Player = 1
		}}
	CreateScreenElement {
		Type = SpriteElement
		parent = <item_container_id>
		local_id = check
		Pos = (0.0, 20.0)
		just = [center center]
		texture = <scroll_texture>
	}
	count_texture = data_settings_xmark
	if (<unpause_count> = 1)
		count_texture = data_settings_checkmark
	endif
	add_menu_frontend_item \{text = qs(0xc987ca62)
		Pos = (20.0, 0.0)
		pad_choose_script = ui_options_settings_choose_count
		pad_choose_params = {
			Player = 1
		}}
	CreateScreenElement {
		Type = SpriteElement
		parent = <item_container_id>
		local_id = check
		Pos = (0.0, 20.0)
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
	Obj_GetID
	GetGlobalTags \{user_options
		param = unpause_count}
	if ResolveScreenElementID id = {<objID> child = {0 child = check}}
		if (<unpause_count> = 1)
			<unpause_count> = 0
			SoundEvent \{event = Checkbox_SFX}
			if GotParam \{popup}
				<resolved_id> :SetProps texture = Options_Controller_X
			else
				<resolved_id> :SetProps texture = data_settings_xmark
			endif
		else
			<unpause_count> = 1
			SoundEvent \{event = CheckBox_Check_SFX}
			if GotParam \{popup}
				<resolved_id> :SetProps texture = Options_Controller_Check
			else
				<resolved_id> :SetProps texture = data_settings_checkmark
			endif
		endif
		SetGlobalTags user_options params = {unpause_count = <unpause_count>}
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
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	current_menu :GetSingleTag \{lefty_id}
	<lefty_id> :obj_spawnscript ui_options_controller_choose_lefty_flip params = {player_device = $primary_controller}
	generic_event_back
endscript
