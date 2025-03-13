
script ui_create_options_controller 
	ui_options_get_controller_type
	make_menu_frontend \{screen = guitarist
		title = qs(0x8627f83e)}
	menu_finish
endscript

script ui_destroy_options_controller 
	generic_ui_destroy
endscript

script ui_options_controller_choose_lefty_flip \{popup = 0
		player_device = $primary_controller}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	player = 1
	i = 1
	begin
	getplayerinfo <i> controller
	if (<controller> = <player_device>)
		player = <i>
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	if (<popup>)
		generic_event_choose state = uistate_pausemenu_lefty_flip_warning data = {player = <player>}
	else
		gettags
		obj_getid
		<id> = <objid>
		if resolvescreenelementid id = {<id> child = {0 child = check}}
			get_savegame_from_controller controller = <player_device>
			getglobaltags user_options savegame = <savegame>
			if (<lefty_flip_save> = 1)
				new_flip = 0
				soundevent \{event = checkbox_sfx}
				<resolved_id> :setprops texture = data_settings_xmark
				if (<player> = 1)
					change \{pad_event_up_inversion = true}
				endif
			else
				new_flip = 1
				soundevent \{event = checkbox_check_sfx}
				<resolved_id> :setprops texture = data_settings_checkmark
				if (<player> = 1)
					change \{pad_event_up_inversion = false}
				endif
			endif
			setplayerinfo <player> lefty_flip = <new_flip>
			if isps3
				i = 1
				begin
				setplayerinfo <i> lefty_flip = <new_flip>
				i = (<i> + 1)
				repeat 4
			endif
			setglobaltags savegame = <savegame> user_options params = {lefty_flip_save = <new_flip>}
		endif
	endif
endscript
