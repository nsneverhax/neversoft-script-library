delta_bot_accuracy = 0.05
delta_bot_starpower = 25.0
delta_bot_health_target = 0.01
show_bot_debug_widgets = 1

script botplayon 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> bot_play
	getplayerinfo <player> is_local_client
	if ((0 = <bot_play>) && (1 = <is_local_client>))
		setplayerinfo <player> bot_play = 1
		if (1 = ($playing_song))
			if NOT retailbuild
				setupbotcontroller player = <player>
			endif
			createbotdebugwidget player = <player>
		endif
	endif
endscript

script botplayoff 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> bot_play
	getplayerinfo <player> is_local_client
	if ((1 = <bot_play>) && (1 = <is_local_client>))
		setplayerinfo <player> bot_play = 0
		if (1 = ($playing_song))
			if NOT retailbuild
				revertbotcontroller player = <player>
			endif
			destroybotdebugwidget player = <player>
		endif
	endif
endscript

script setupbotcontroller 
	requireparams \{[
			player
		]
		all}
	getinputhandlerbotindex player = <player>
	getplayerinfo <player> controller out = player_controller
	if (<controller> != <player_controller>)
		setplayerinfo <player> bot_original_controller = <player_controller>
		setplayerinfo <player> controller = <controller>
	endif
endscript

script revertbotcontroller 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> bot_original_controller
	getplayerinfo <player> controller
	if (<controller> >= 0 && <controller> < 4)
		return
	endif
	if (<bot_original_controller> = -1)
		scriptassert \{qs(0x5855c702)}
	endif
	if (<controller> != <bot_original_controller>)
		setplayerinfo <player> controller = <bot_original_controller>
	endif
endscript

script setbotaccuracy 
	requireparams \{[
			player
			accuracy
		]
		all}
	if (<accuracy> > 1.0 || <accuracy> < 0.0)
		scriptassert \{qs(0x7ad816d6)}
	endif
	setplayerinfo <player> bot_hit_percent = <accuracy>
endscript

script createbotdebugwidget 
	requireparams \{[
			player
		]
		all}
	if NOT ($show_bot_debug_widgets)
		return
	endif
	destroybotdebugwidget player = <player>
	formattext checksumname = widget_id 'bot_debug_widget_p%d' d = <player>
	formattext textname = player_num_text qs(0x48c6d14c) d = <player>
	get_highway_hud_root_id player = <player>
	getbotdebugwidgetpos player = <player>
	if screenelementexists id = <highway_hud_root>
		createscreenelement {
			parent = <highway_hud_root>
			id = <widget_id>
			type = descinterface
			desc = 'bot_debug'
			pos = <position>
			player_num_text = <player_num_text>
			pos_anchor = [center , center]
		}
		updatebotdebugwidget player = <player>
	endif
endscript

script getbotdebugwidgetpos \{player = !i1768515945}
	offset = (0.0, 0.0)
	getnumplayersingame
	getplayerinfo <player> part
	if (<num_players> = 1 && <part> = vocals)
		offset = (150.0, -330.0)
	endif
	return position = <offset>
endscript

script destroybotdebugwidget 
	requireparams \{[
			player
		]
		all}
	formattext checksumname = widget_id 'bot_debug_widget_p%d' d = <player>
	destroyscreenelement id = <widget_id>
endscript

script updatebotdebugwidget 
	requireparams \{[
			player
		]
		all}
	formattext checksumname = widget_id 'bot_debug_widget_p%d' d = <player>
	if screenelementexists id = <widget_id>
		getplayerinfo <player> bot_hit_percent
		getplayerinfo <player> bot_shift
		getplayerinfo <player> bot_show_debug_widget
		getplayerinfo <player> star_power_amount
		getplayerinfo <player> bot_whammy
		getplayerinfo <player> bot_mute
		getplayerinfo <player> bot_health_target
		getplayerinfo <player> bot_use_health_target
		getplayerinfo <player> bot_strum_type
		getplayerinfo <player> part
		accuracy_value = (100.0 * <bot_hit_percent>)
		formattext \{textname = accuracy_helper_text_text
			qs(0x8745630b)}
		formattext textname = accuracy_value_text qs(0x720688b0) d = <accuracy_value> decimalplaces = 0
		formattext textname = sp_increase_value_text qs(0x76b3fda7) d = <star_power_amount> decimalplaces = 0
		if (1 = <bot_use_health_target>)
			formattext \{textname = accuracy_helper_text_text
				qs(0x98fc3a5d)}
			formattext textname = accuracy_value_text qs(0x76b3fda7) d = <bot_health_target> decimalplaces = 2
		endif
		mute_value_text = qs(0x4d4326e8)
		if (1 = <bot_mute>)
			mute_value_text = qs(0x273d7136)
		endif
		whammy_value_text = qs(0x273d7136)
		if (1 = <bot_whammy>)
			whammy_value_text = qs(0x4d4326e8)
		endif
		strum_value_text = qs(0xa6a6aecc)
		if (down = <bot_strum_type>)
			strum_value_text = qs(0x5224e80d)
		elseif (alternate = <bot_strum_type>)
			strum_value_text = qs(0x0a7e80f1)
		elseif (touch = <bot_strum_type>)
			strum_value_text = qs(0xbbd37b10)
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
		setscreenelementprops {
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

script togglebotdebugwidget \{action = on}
	requireparams \{[
			action
		]
		all}
	player = 1
	num_players = 4
	begin
	if (on = <action>)
		setplayerinfo <player> bot_show_debug_widget = 1
	elseif (off = <action>)
		setplayerinfo <player> bot_show_debug_widget = 0
	endif
	updatebotdebugwidget player = <player>
	player = (<player> + 1)
	repeat <num_players>
endscript

script get_actual_controller \{player = !i1768515945}
	getplayerinfo <player> bot_play
	if (<bot_play> = 1)
		getplayerinfo <player> bot_original_controller
		return controller = <bot_original_controller>
	else
		getplayerinfo <player> controller
		return controller = <controller>
	endif
endscript
