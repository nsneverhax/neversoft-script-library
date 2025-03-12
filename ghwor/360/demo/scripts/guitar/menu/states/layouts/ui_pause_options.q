
script ui_create_pause_options 
	options = []
	<show_audio_options> = 0
	if NOT is_current_song_a_jam_session
		if (<player_device> = $primary_controller)
			<show_audio_options> = 1
		endif
	endif
	if (<show_audio_options> = 1)
		if NOT demobuild
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
			gamemode_gettype
			if (<type> = practice)
				<func> = menu_calibrate_lag_warning_select_yes
				<func_params> = {}
			else
				<func> = ui_event
				<func_params> = {event = menu_change data = {state = uistate_options_calibrate_lag_warning controller = <player_device>}}
			endif
			new_option = {
				text = qs(0x550b8c8e)
				func = <func>
				func_params = <func_params>
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
			func = pausemenu_options_choose_lefty
			func_params = {player = <player>}
		}
		addarrayelement array = <options> element = <new_option>
		<options> = <array>
	endif
	if (<part> = vocals)
		new_option = {
			text = qs(0x589b1fee)
			func = ui_event
			func_params = {event = menu_change data = {state = uistate_pausemenu_highwaytype player = <player>}}
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
		getplayerinfo <player> vocal_star_power_tap
		if (<vocal_star_power_tap> = 1)
			vocal_star_power_tap_tex = options_controller_check
		else
			vocal_star_power_tap_tex = options_controller_x
		endif
		new_option = {
			text = qs(0x2ba6dc70)
			texture = <vocal_star_power_tap_tex>
			func = options_change_vocal_star_power_tap
			func_params = {popup = 1 player = <player>}
		}
		addarrayelement array = <options> element = <new_option>
		<options> = <array>
		get_savegame_from_player player = <player>
		getglobaltags savegame = <savegame> user_options params = vocals_mic_enhancement_save
		<vocals_mic_enhancement> = <vocals_mic_enhancement_save>
		if (<vocals_mic_enhancement> = 1)
			vocals_mic_enhancement_tex = options_controller_check
		else
			vocals_mic_enhancement_tex = options_controller_x
		endif
		new_option = {
			text = qs(0xe79da7c6)
			texture = <vocals_mic_enhancement_tex>
			func = options_change_vocals_mic_enhancement
			func_params = {savegame = <savegame>}
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
	<challenge_icons_texture> = options_controller_x
	get_savegame_from_controller controller = ($last_start_pressed_device)
	getglobaltags user_options param = show_challenge_icons_save savegame = <savegame>
	if (<show_challenge_icons_save> = 1)
		<challenge_icons_texture> = options_controller_check
	endif
	<options_index> = ($g_pausemenu_selected_index)
	ui_create_pausemenu title_text = qs(0x976cf9e7) options = <options> pad_back_script = generic_event_back focus_index = 0
	pause_menu_desc_id :settags options_index = <options_index>
endscript

script ui_destroy_pause_options 
	pause_menu_desc_id :getsingletag \{options_index}
	ui_destroy_pausemenu
	change g_pausemenu_selected_index = <options_index>
endscript

script ui_pause_options_choose_count 
	obj_getid
	get_savegame_from_controller controller = <device_num>
	getglobaltags user_options param = unpause_count savegame = <savegame>
	if gotparam \{icon_id}
		if (<unpause_count> = 1)
			<unpause_count> = 0
			ui_sfx \{menustate = generic
				uitype = toggleoff}
			if gotparam \{popup}
				<icon_id> :setprops texture = options_controller_x
			else
				<icon_id> :setprops texture = data_settings_xmark
			endif
		else
			<unpause_count> = 1
			ui_sfx \{menustate = generic
				uitype = toggleon}
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
				ui_sfx \{menustate = generic
					uitype = toggleoff}
				if gotparam \{popup}
					<resolved_id> :setprops texture = options_controller_x
				else
					<resolved_id> :setprops texture = data_settings_xmark
				endif
			else
				<unpause_count> = 1
				ui_sfx \{menustate = generic
					uitype = toggleon}
				if gotparam \{popup}
					<resolved_id> :setprops texture = options_controller_check
				else
					<resolved_id> :setprops texture = data_settings_checkmark
				endif
			endif
			setglobaltags user_options params = {unpause_count = <unpause_count>} savegame = <savegame>
		endif
	endif
	change \{g_pause_menu_exit_script = switch_rewind_active}
	change g_pause_menu_exit_script_params = {active = <unpause_count>}
endscript

script pausemenu_options_choose_lefty \{player = !i1768515945}
	ui_sfx \{menustate = generic
		uitype = select}
	ui_event event = menu_change data = {state = uistate_pausemenu_lefty_flip_warning player = <player>}
endscript
