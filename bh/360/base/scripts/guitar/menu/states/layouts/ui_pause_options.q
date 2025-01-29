
script ui_create_pause_options 
	options = []
	<show_audio_options> = 0
	GameMode_GetProperty \{prop = faceoff}
	if NOT is_current_song_a_jam_session
		if (<player_device> = $primary_controller)
			<show_audio_options> = 1
		elseif (<faceoff> = true)
			GameMode_GetNumPlayers
			if (<num_players> = 2)
				if PlayerInfoEquals \{1
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
					state = UIstate_options_audio
					device_num = <player_device>
					from_pause_menu = 1
				}
			}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
	endif
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> bot_play
		if (<bot_play> = 1)
			GetPlayerInfo <player> bot_original_controller
			controller = <bot_original_controller>
		else
			GetPlayerInfo <player> controller
		endif
		if (<controller> = <player_device>)
			GetPlayerInfo <player> part
			GetPlayerInfo <player> lefty_flip
			break
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	if (<player_device> = $primary_controller)
		if NOT is_current_song_a_jam_session
			new_option = {
				text = qs(0x550b8c8e)
				func = ui_event
				func_params = {event = menu_change data = {state = UIstate_options_calibrate_lag_warning controller = <player_device>}}
			}
			AddArrayElement array = <options> element = <new_option>
			<options> = <array>
		endif
	endif
	if isguitarcontroller controller = <player_device>
		if NOT is_current_song_a_jam_session
		endif
	endif
	GetPlayerInfo <player> part
	if NOT (<part> = vocals)
		GetPlayerInfo <player> lefty_flip
		if (<lefty_flip> = 1)
			lefty_tex = Options_Controller_Check
		else
			lefty_tex = Options_Controller_X
		endif
		new_option = {
			text = qs(0x2e9b1b43)
			texture = <lefty_tex>
			func = ui_event
			func_params = {event = menu_change choose_sfx data = {state = UIstate_pausemenu_lefty_flip_warning player = <player>}}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
	endif
	if (<part> = vocals)
		new_option = {
			text = qs(0xead60344)
			func = ui_event
			func_params = {event = menu_change choose_sfx data = {state = UIstate_pausemenu_highwaytype player = <player>}}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
		new_option = {
			text = qs(0x4d62e1f6)
			func = ui_event
			func_params = {event = menu_change data = {state = UIstate_options_mic_binding_warning controller = <player_device>}}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
	endif
	if NOT ((<part> = vocals) || (<part> = Drum))
		GetPlayerInfo <player> use_tilt_for_starpower
		if (<use_tilt_for_starpower> = 1)
			tilt_tex = Options_Controller_Check
		else
			tilt_tex = Options_Controller_X
		endif
		new_option = {
			text = qs(0x1c739509)
			texture = <tilt_tex>
			func = options_change_tilt_star_power
			func_params = {player = <player>}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
	endif
	if NOT ((<part> = vocals) || (<part> = Drum))
		GetPlayerInfo <player> enable_touch_strip
		if (<enable_touch_strip> = 1)
			touch_tex = Options_Controller_Check
		else
			touch_tex = Options_Controller_X
		endif
		new_option = {
			text = qs(0xa2b47a6e)
			texture = <touch_tex>
			func = options_change_touch_strip_option
			func_params = {player = <player>}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
	endif
	count_texture = Options_Controller_X
	get_savegame_from_controller controller = ($last_start_pressed_device)
	GetGlobalTags user_options param = unpause_count savegame = <savegame>
	if (<unpause_count> = 1)
		count_texture = Options_Controller_Check
	endif
	if ($game_mode != practice)
		new_option = {
			text = qs(0xc987ca62)
			texture = <count_texture>
			func = ui_pause_options_choose_count
			func_params = {popup = 1 player = 1}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
	endif
	GetArraySize <options>
	if (<array_size> > 3)
		ui_create_pausemenu title_text = qs(0x976cf9e7) options = <options> pad_back_script = generic_event_back focus_index = <selected_index>
	else
		ui_create_pausemenu title_text = qs(0x976cf9e7) options = <options> pad_back_script = generic_event_back focus_index = <selected_index> no_loop
	endif
endscript

script ui_destroy_pause_options 
	ui_destroy_pausemenu
endscript

script ui_pause_options_choose_count 
	Obj_GetID
	get_savegame_from_controller controller = <device_num>
	GetGlobalTags user_options param = unpause_count savegame = <savegame>
	if GotParam \{icon_id}
		if (<unpause_count> = 1)
			<unpause_count> = 0
			SoundEvent \{event = Box_UnCheck_SFX}
			if GotParam \{popup}
				new_texture = Options_Controller_X
			else
				new_texture = data_settings_xmark
			endif
		else
			<unpause_count> = 1
			SoundEvent \{event = Box_Check_SFX}
			if GotParam \{popup}
				new_texture = Options_Controller_Check
			else
				new_texture = data_settings_checkmark
			endif
		endif
		SetGlobalTags user_options params = {unpause_count = <unpause_count>} savegame = <savegame>
		Obj_GetID
		<objID> :SetProps menurow_ico_item_texture = <new_texture>
	else
		if ResolveScreenElementID id = {<objID> child = check}
			if (<unpause_count> = 1)
				<unpause_count> = 0
				SoundEvent \{event = Box_UnCheck_SFX}
				if GotParam \{popup}
					<resolved_id> :SetProps texture = Options_Controller_X
				else
					<resolved_id> :SetProps texture = data_settings_xmark
				endif
			else
				<unpause_count> = 1
				SoundEvent \{event = Box_Check_SFX}
				if GotParam \{popup}
					<resolved_id> :SetProps texture = Options_Controller_Check
				else
					<resolved_id> :SetProps texture = data_settings_checkmark
				endif
			endif
			SetGlobalTags user_options params = {unpause_count = <unpause_count>} savegame = <savegame>
		endif
	endif
endscript
