
script ui_create_options_controller 
	ui_options_get_controller_type
	make_menu_frontend \{screen = GUITARIST
		title = qs(0x8627f83e)}
	menu_finish
endscript

script ui_destroy_options_controller 
	generic_ui_destroy
endscript

script ui_options_controller_choose_lefty_flip \{popup = 0
		player_device = $primary_controller}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Player = 1
	i = 1
	begin
	getplayerinfo <i> controller
	if (<controller> = <player_device>)
		Player = <i>
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	if (<popup>)
		generic_event_choose state = uistate_pausemenu_lefty_flip_warning data = {Player = <Player>}
	else
		ui_create_options_settings_lefty_warning
		GetTags
		Obj_GetID
		get_savegame_from_controller controller = <player_device>
		GetGlobalTags user_options savegame = <savegame>
		if (<lefty_flip_save> = 1)
			new_flip = 0
			SoundEvent \{event = Checkbox_SFX}
			<objID> :se_setprops check_alpha = 0
			<objID> :se_setprops cross_alpha = 1
			if (<Player> = 1)
				Change \{pad_event_up_inversion = true}
			endif
		else
			new_flip = 1
			SoundEvent \{event = CheckBox_Check_SFX}
			<objID> :se_setprops check_alpha = 1
			<objID> :se_setprops cross_alpha = 0
			if (<Player> = 1)
				Change \{pad_event_up_inversion = FALSE}
			endif
		endif
		setplayerinfo <Player> lefty_flip = <new_flip>
		SetGlobalTags savegame = <savegame> user_options params = {lefty_flip_save = <new_flip>}
	endif
endscript
