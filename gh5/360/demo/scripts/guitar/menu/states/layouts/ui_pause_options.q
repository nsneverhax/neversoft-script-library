
script ui_create_pause_options 
	options = []
	<show_audio_options> = 0
	gamemode_getproperty \{prop = faceoff}
	if NOT is_current_song_a_jam_session
		if (<player_device> = $primary_controller)
			<show_audio_options> = 1
		elseif (<faceoff> = true)
			gamemode_getnumplayers
			if (<num_players> = 2)
				if playerinfoequals \{1
						part = vocals}
					<show_audio_options> = 1
				endif
			endif
		endif
	endif
	if (<show_audio_options> = 1)
		new_option = {
			text = qs(0xa0345d1c)
			func = ui_event
			func_params = {
				event = menu_change
				data = {
					state = uistate_options_audio
					device_num = <player_device>
					from_pause_menu = 1
				}
			}
		}
		addarrayelement array = <options> element = <new_option>
		<options> = <array>
	endif
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> bot_play
		if (<bot_play> = 1)
			getplayerinfo <player> bot_original_controller
			controller = <bot_original_controller>
		else
			getplayerinfo <player> controller
		endif
		if (<controller> = <player_device>)
			getplayerinfo <player> part
			getplayerinfo <player> lefty_flip
			break
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	if (<player_device> = $primary_controller)
		if NOT is_current_song_a_jam_session
			new_option = {
				text = qs(0x550b8c8e)
				func = ui_event
				func_params = {event = menu_change data = {state = uistate_options_calibrate_lag_warning controller = <player_device>}}
			}
			addarrayelement array = <options> element = <new_option>
			<options> = <array>
		endif
	endif
	if isguitarcontroller controller = <player_device>
		if NOT is_current_song_a_jam_session
		endif
	endif
	getplayerinfo <player> part
	if NOT (<part> = vocals)
		getplayerinfo <player> lefty_flip
		if (<lefty_flip> = 1)
			lefty_tex = options_controller_check
		else
			lefty_tex = options_controller_x
		endif
		new_option = {
			text = qs(0x2e9b1b43)
			texture = <lefty_tex>
			func = ui_event
			func_params = {event = menu_change choose_sfx data = {state = uistate_pausemenu_lefty_flip_warning player = <player>}}
		}
		addarrayelement array = <options> element = <new_option>
		<options> = <array>
	endif
	if (<part> = vocals)
		new_option = {
			text = qs(0xead60344)
			func = ui_event
			func_params = {event = menu_change choose_sfx data = {state = uistate_pausemenu_highwaytype player = <player>}}
		}
		addarrayelement array = <options> element = <new_option>
		<options> = <array>
		new_option = {
			text = qs(0x4d62e1f6)
			func = ui_event
			func_params = {event = menu_change data = {state = uistate_options_mic_binding_warning controller = <player_device>}}
		}
		addarrayelement array = <options> element = <new_option>
		<options> = <array>
	endif
	if NOT ((<part> = vocals) || (<part> = drum))
		getplayerinfo <player> use_tilt_for_starpower
		if (<use_tilt_for_starpower> = 1)
			tilt_tex = options_controller_check
		else
			tilt_tex = options_controller_x
		endif
		new_option = {
			text = qs(0x1c739509)
			texture = <tilt_tex>
			func = options_change_tilt_star_power
			func_params = {player = <player>}
		}
		addarrayelement array = <options> element = <new_option>
		<options> = <array>
	endif
	if NOT ((<part> = vocals) || (<part> = drum))
		getplayerinfo <player> enable_touch_strip
		if (<enable_touch_strip> = 1)
			touch_tex = options_controller_check
		else
			touch_tex = options_controller_x
		endif
		new_option = {
			text = qs(0xa2b47a6e)
			texture = <touch_tex>
			func = options_change_touch_strip_option
			func_params = {player = <player>}
		}
		addarrayelement array = <options> element = <new_option>
		<options> = <array>
	endif
	count_texture = options_controller_x
	get_savegame_from_controller controller = ($last_start_pressed_device)
	getglobaltags user_options param = unpause_count savegame = <savegame>
	if (<unpause_count> = 1)
		count_texture = options_controller_check
	endif
	if ($game_mode != practice)
		new_option = {
			text = qs(0xc987ca62)
			texture = <count_texture>
			func = ui_pause_options_choose_count
			func_params = {popup = 1 player = 1}
		}
		addarrayelement array = <options> element = <new_option>
		<options> = <array>
	endif
	ui_create_pausemenu title_text = qs(0x976cf9e7) options = <options> pad_back_script = generic_event_back focus_index = 0
endscript

script ui_destroy_pause_options 
	ui_destroy_pausemenu
endscript

script ui_pause_options_choose_count 
	obj_getid
	get_savegame_from_controller controller = <device_num>
	getglobaltags user_options param = unpause_count savegame = <savegame>
	if gotparam \{icon_id}
		if (<unpause_count> = 1)
			<unpause_count> = 0
			soundevent \{event = box_uncheck_sfx}
			if gotparam \{popup}
				<icon_id> :setprops texture = options_controller_x
			else
				<icon_id> :setprops texture = data_settings_xmark
			endif
		else
			<unpause_count> = 1
			soundevent \{event = box_check_sfx}
			if gotparam \{popup}
				<icon_id> :setprops texture = options_controller_check
			else
				<icon_id> :setprops texture = data_settings_checkmark
			endif
		endif
		setglobaltags user_options params = {unpause_count = <unpause_count>} savegame = <savegame>
	else
		if resolvescreenelementid id = {<objid> child = check}
			if (<unpause_count> = 1)
				<unpause_count> = 0
				soundevent \{event = box_uncheck_sfx}
				if gotparam \{popup}
					<resolved_id> :setprops texture = options_controller_x
				else
					<resolved_id> :setprops texture = data_settings_xmark
				endif
			else
				<unpause_count> = 1
				soundevent \{event = box_check_sfx}
				if gotparam \{popup}
					<resolved_id> :setprops texture = options_controller_check
				else
					<resolved_id> :setprops texture = data_settings_checkmark
				endif
			endif
			setglobaltags user_options params = {unpause_count = <unpause_count>} savegame = <savegame>
		endif
	endif
endscript
