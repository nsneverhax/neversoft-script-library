
script ui_create_pause_options 
	options = []
	<show_audio_options> = 0
	if NOT is_current_song_a_jam_session
		if (<player_device> = $primary_controller)
			<show_audio_options> = 1
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
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
	endif
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> bot_play
		if (<bot_play> = 1)
			getplayerinfo <Player> bot_original_controller
			controller = <bot_original_controller>
		else
			getplayerinfo <Player> controller
		endif
		if (<controller> = <player_device>)
			getplayerinfo <Player> part
			getplayerinfo <Player> lefty_flip
			break
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	if (<player_device> = $primary_controller)
		if NOT is_current_song_a_jam_session
			if NOT inroadiebattlemode
				gamemode_gettype
				if (<Type> = practice)
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
				AddArrayElement array = <options> element = <new_option>
				<options> = <array>
			endif
		endif
	endif
	if IsGuitarController controller = <player_device>
		if NOT is_current_song_a_jam_session
		endif
	endif
	getplayerinfo <Player> part
	if NOT (<part> = vocals)
		getplayerinfo <Player> lefty_flip
		if (<lefty_flip> = 1)
			lefty_tex = Options_Controller_Check
		else
			lefty_tex = Options_Controller_X
		endif
		new_option = {
			text = qs(0x2e9b1b43)
			texture = <lefty_tex>
			func = pausemenu_options_choose_lefty
			func_params = {Player = <Player>}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
	endif
	if (<part> = vocals)
		new_option = {
			text = qs(0x589b1fee)
			func = ui_event
			func_params = {event = menu_change data = {state = uistate_pausemenu_highwaytype Player = <Player>}}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
		new_option = {
			text = qs(0x4d62e1f6)
			func = ui_event
			func_params = {event = menu_change data = {state = uistate_options_mic_binding_warning controller = <player_device>}}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
		getplayerinfo <Player> vocal_star_power_tap
		if (<vocal_star_power_tap> = 1)
			vocal_star_power_tap_tex = Options_Controller_Check
		else
			vocal_star_power_tap_tex = Options_Controller_X
		endif
		new_option = {
			text = qs(0x2ba6dc70)
			texture = <vocal_star_power_tap_tex>
			func = options_change_vocal_star_power_tap
			func_params = {popup = 1 Player = <Player>}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
	endif
	if NOT ((<part> = vocals) || (<part> = drum))
		getplayerinfo <Player> use_tilt_for_starpower
		if (<use_tilt_for_starpower> = 1)
			tilt_tex = Options_Controller_Check
		else
			tilt_tex = Options_Controller_X
		endif
		new_option = {
			text = qs(0x1c739509)
			texture = <tilt_tex>
			func = options_change_tilt_star_power
			func_params = {Player = <Player>}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
	endif
	if NOT ((<part> = vocals) || (<part> = drum))
		getplayerinfo <Player> enable_touch_strip
		if (<enable_touch_strip> = 1)
			touch_tex = Options_Controller_Check
		else
			touch_tex = Options_Controller_X
		endif
		new_option = {
			text = qs(0xa2b47a6e)
			texture = <touch_tex>
			func = options_change_touch_strip_option
			func_params = {Player = <Player>}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
	endif
	<challenge_icons_texture> = Options_Controller_X
	get_savegame_from_controller controller = ($last_start_pressed_device)
	GetGlobalTags user_options param = show_challenge_icons_save savegame = <savegame>
	if (<show_challenge_icons_save> = 1)
		<challenge_icons_texture> = Options_Controller_Check
	endif
	<options_index> = ($g_pausemenu_selected_index)
	ui_create_pausemenu title_text = qs(0x976cf9e7) options = <options> pad_back_script = generic_event_back focus_index = 0
	pause_menu_desc_id :SetTags options_index = <options_index>
endscript

script ui_destroy_pause_options 
	pause_menu_desc_id :GetSingleTag \{options_index}
	ui_destroy_pausemenu
	Change g_pausemenu_selected_index = <options_index>
endscript

script pausemenu_options_choose_lefty \{Player = !i1768515945}
	ui_sfx \{menustate = Generic
		uitype = select}
	ui_event event = menu_change data = {state = uistate_pausemenu_lefty_flip_warning Player = <Player>}
endscript
