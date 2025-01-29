
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
		GetTags
		Obj_GetID
		0x978e7147 Player = <Player>
		if (<new_flip> = 0)
			SoundEvent \{event = Checkbox_SFX}
			<objID> :se_setprops check_alpha = 0
			<objID> :se_setprops cross_alpha = 1
		else
			SoundEvent \{event = CheckBox_Check_SFX}
			<objID> :se_setprops check_alpha = 1
			<objID> :se_setprops cross_alpha = 0
		endif
		SetGlobalTags savegame = <savegame> user_options params = {lefty_flip_save = <new_flip>}
	endif
endscript
