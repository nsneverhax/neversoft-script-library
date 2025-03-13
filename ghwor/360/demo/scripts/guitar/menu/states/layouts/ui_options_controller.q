
script ui_create_options_controller 
	ui_options_get_controller_type
	make_generic_menu \{title = qs(0x8627f83e)}
	menu_finish
endscript

script ui_destroy_options_controller 
	generic_ui_destroy
endscript

script ui_options_controller_choose_lefty_flip \{popup = 0
		player_device = $primary_controller}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if (<popup>)
		ui_sfx \{menustate = generic
			uitype = select}
		generic_event_choose state = uistate_pausemenu_lefty_flip_warning data = {player = <player>}
	else
		requireparams \{[
				part
			]
			all}
		gettags
		obj_getid
		<id> = <objid>
		get_savegame_from_controller controller = ($primary_controller)
		if (<part> != vocals)
			get_progression_instrument_user_option part = <part> controller = ($primary_controller) option = 'lefty_flip'
			getglobaltags user_options savegame = <savegame>
			if (<user_option> = 1)
				new_flip = 0
				<objid> :setprops menurow_ico_item_texture = options_controller_x
			else
				new_flip = 1
				<objid> :setprops menurow_ico_item_texture = options_controller_check
			endif
			if ((<part> = guitar) || (<part> = bass))
				save_progression_instrument_user_option {
					part = guitar
					controller = ($primary_controller)
					option = 'lefty_flip'
					new_value = <new_flip>
				}
				save_progression_instrument_user_option {
					part = bass
					controller = ($primary_controller)
					option = 'lefty_flip'
					new_value = <new_flip>
				}
			else
				save_progression_instrument_user_option {
					part = <part>
					controller = ($primary_controller)
					option = 'lefty_flip'
					new_value = <new_flip>
				}
			endif
		endif
	endif
endscript
