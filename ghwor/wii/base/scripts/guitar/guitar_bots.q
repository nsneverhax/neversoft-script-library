delta_bot_accuracy = 0.05
delta_bot_starpower = 25.0
delta_bot_health_target = 0.01

script botplayon 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> bot_play
	getplayerinfo <Player> is_local_client
	if ((0 = <bot_play>) && (1 = <is_local_client>))
		setplayerinfo <Player> bot_play = 1
		if (1 = ($playing_song))
			if NOT retailbuild
				setupbotcontroller Player = <Player>
			endif
			createbotdebugwidget Player = <Player>
		endif
	endif
endscript

script botplayoff 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> bot_play
	getplayerinfo <Player> is_local_client
	if ((1 = <bot_play>) && (1 = <is_local_client>))
		setplayerinfo <Player> bot_play = 0
		if (1 = ($playing_song))
			if NOT retailbuild
				revertbotcontroller Player = <Player>
			endif
			destroybotdebugwidget Player = <Player>
		endif
	endif
endscript

script setupbotcontroller 
	RequireParams \{[
			Player
		]
		all}
	GetInputHandlerBotIndex Player = <Player>
	getplayerinfo <Player> controller out = player_controller
	if (<controller> != <player_controller>)
		setplayerinfo <Player> bot_original_controller = <player_controller>
		setplayerinfo <Player> controller = <controller>
	endif
endscript

script revertbotcontroller 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> bot_original_controller
	getplayerinfo <Player> controller
	if (<controller> >= 0 && <controller> < 4)
		return
	endif
	if (<bot_original_controller> = -1)
		ScriptAssert \{qs(0x5855c702)}
	endif
	if (<controller> != <bot_original_controller>)
		setplayerinfo <Player> controller = <bot_original_controller>
	endif
endscript

script createbotdebugwidget 
	RequireParams \{[
			Player
		]
		all}
	destroybotdebugwidget Player = <Player>
	formatText checksumName = widget_id 'bot_debug_widget_p%d' d = <Player>
	formatText TextName = player_num_text qs(0x48c6d14c) d = <Player>
	get_highway_hud_root_id Player = <Player>
	getbotdebugwidgetpos Player = <Player>
	if ScreenElementExists id = <highway_hud_root>
		CreateScreenElement {
			parent = <highway_hud_root>
			id = <widget_id>
			Type = descinterface
			desc = 'bot_debug'
			Pos = <position>
			player_num_text = <player_num_text>
			pos_anchor = [center , center]
		}
		updatebotdebugwidget Player = <Player>
	endif
endscript

script getbotdebugwidgetpos \{Player = !i1768515945}
	offset = (0.0, 0.0)
	getnumplayersingame
	getplayerinfo <Player> part
	if (<num_players> = 1 && <part> = vocals)
		offset = (150.0, -330.0)
	endif
	return position = <offset>
endscript

script destroybotdebugwidget 
	RequireParams \{[
			Player
		]
		all}
	formatText checksumName = widget_id 'bot_debug_widget_p%d' d = <Player>
	DestroyScreenElement id = <widget_id>
endscript

script updatebotdebugwidget 
	RequireParams \{[
			Player
		]
		all}
	formatText checksumName = widget_id 'bot_debug_widget_p%d' d = <Player>
	if ScreenElementExists id = <widget_id>
		getplayerinfo <Player> bot_hit_percent
		getplayerinfo <Player> bot_shift
		getplayerinfo <Player> bot_show_debug_widget
		getplayerinfo <Player> star_power_amount
		getplayerinfo <Player> bot_whammy
		getplayerinfo <Player> bot_mute
		getplayerinfo <Player> bot_health_target
		getplayerinfo <Player> bot_use_health_target
		getplayerinfo <Player> bot_strum_type
		getplayerinfo <Player> part
		accuracy_value = (100.0 * <bot_hit_percent>)
		formatText \{TextName = accuracy_helper_text_text
			qs(0xe6418308)}
		formatText TextName = accuracy_value_text qs(0xd1066115) d = <accuracy_value> DecimalPlaces = 0
		formatText TextName = sp_increase_value_text qs(0x48c6d14c) d = <star_power_amount> DecimalPlaces = 0
		if (1 = <bot_use_health_target>)
			formatText \{TextName = accuracy_helper_text_text
				qs(0xdbeed537)}
			formatText TextName = accuracy_value_text qs(0x48c6d14c) d = <bot_health_target> DecimalPlaces = 2
		endif
		mute_value_text = qs(0x73360a03)
		if (1 = <bot_mute>)
			mute_value_text = qs(0xa86f0987)
		endif
		whammy_value_text = qs(0xa86f0987)
		if (1 = <bot_whammy>)
			whammy_value_text = qs(0x73360a03)
		endif
		strum_value_text = qs(0x98d38227)
		if (down = <bot_strum_type>)
			strum_value_text = qs(0xf12401a8)
		elseif (alternate = <bot_strum_type>)
			strum_value_text = qs(0x852cf840)
		elseif (touch = <bot_strum_type>)
			strum_value_text = qs(0xb175ca60)
		endif
		toggle_strum_alpha = 0.0
		whammy_data_alpha = 0.0
		if (<part> = guitar || <part> = bass)
			toggle_strum_alpha = 1.0
			whammy_data_alpha = 1.0
		endif
		menu_one_alpha = 1.0
		menu_shift_alpha = 0.0
		if (1 = <bot_shift>)
			menu_one_alpha = 0.0
			menu_shift_alpha = 1.0
		endif
		SetScreenElementProps {
			id = <widget_id>
			mute_value_text = <mute_value_text>
			accuracy_value_text = <accuracy_value_text>
			whammy_value_text = <whammy_value_text>
			strum_value_text = <strum_value_text>
			toggle_strum_alpha = <toggle_strum_alpha>
			whammy_data_alpha = <whammy_data_alpha>
			menu_one_alpha = <menu_one_alpha>
			menu_shift_alpha = <menu_shift_alpha>
			sp_increase_value_text = <sp_increase_value_text>
			accuracy_helper_text_text = <accuracy_helper_text_text>
			alpha = <bot_show_debug_widget>
		}
	endif
endscript

script togglebotdebugwidget \{action = On}
	RequireParams \{[
			action
		]
		all}
	Player = 1
	num_players = 4
	begin
	if (On = <action>)
		setplayerinfo <Player> bot_show_debug_widget = 1
	elseif (OFF = <action>)
		setplayerinfo <Player> bot_show_debug_widget = 0
	endif
	updatebotdebugwidget Player = <Player>
	Player = (<Player> + 1)
	repeat <num_players>
endscript

script get_actual_controller \{Player = !i1768515945}
	getplayerinfo <Player> bot_play
	if (<bot_play> = 1)
		getplayerinfo <Player> bot_original_controller
		return controller = <bot_original_controller>
	else
		getplayerinfo <Player> controller
		return controller = <controller>
	endif
endscript
