
script ui_create_pause_options 
	ui_pausemenu_create_bg \{title_text = qs(0x976cf9e7)}
	if pausemenu_bg :desc_resolvealias \{name = alias_menu}
		<parent> = <resolved_id>
	endif
	if (<player_device> = $primary_controller)
		scroll_down_sfx = generic_menu_up_or_down_sound
		scroll_up_sfx = generic_menu_up_or_down_sound
	else
		scroll_down_sfx = nullscript
		scroll_up_sfx = nullscript
	endif
	make_menu {
		parent = <parent>
		centered_offset = (-600.0, -290.0)
		exclusive_device = <player_device>
		extra_z = 510
		centered
		nobg
		scroll_down_sfx = <scroll_down_sfx>
		scroll_up_sfx = <scroll_up_sfx>
	}
	<show_audio_options> = 0
	gamemode_getproperty \{prop = faceoff}
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
	if (<show_audio_options> = 1)
		add_menu_item {
			text = qs(0xec400758)
			choose_state = uistate_options_audio
			choose_state_data = {device_num = <player_device>}
		}
		<item_container_id> :se_setprops focusable = false alpha = 0.4
	endif
	player_index = 0
	begin
	getplayerinfo (<player_index> + 1) controller
	if (<controller> = <player_device>)
		getplayerinfo (<player_index> + 1) part
		getplayerinfo (<player_index> + 1) lefty_flip
		break
	endif
	player_index = (<player_index> + 1)
	repeat ($current_num_players)
	if (<player_device> = $primary_controller)
		add_menu_item {
			text = qs(0xdc79581d)
			choose_state = uistate_options_calibrate_lag_warning
			choose_state_data = {controller = <player_device>}
		}
	endif
	if isguitarcontroller controller = <player_device>
		if NOT ($current_song = jamsession)
		endif
	endif
	getplayerinfo <player> part
	if NOT (<part> = vocals)
		add_menu_item {
			text = qs(0x83adf584)
			choose_state = uistate_pausemenu_lefty_flip_warning
			choose_state_data = {player = <player>}
		}
		getplayerinfo <player> lefty_flip
		if (<lefty_flip> = 1)
			lefty_tex = options_controller_check
		else
			lefty_tex = options_controller_x
		endif
		createscreenelement {
			type = spriteelement
			parent = <item_container_id>
			texture = <lefty_tex>
			pos = (135.0, 0.0)
		}
	endif
	if NOT ((<part> = vocals) || (<part> = drum))
		add_menu_item {
			text = qs(0xc8c7e963)
			pad_choose_sound = nullsound
			pad_choose_script = options_change_tilt_star_power
			pad_choose_params = {player = <player>}
		}
		<item_container_id> :se_setprops focusable = false alpha = 0.4
		getplayerinfo <player> use_tilt_for_starpower
		if (<use_tilt_for_starpower> = 1)
			tilt_tex = options_controller_check
		else
			tilt_tex = options_controller_x
		endif
		createscreenelement {
			local_id = tilt_check
			type = spriteelement
			parent = <item_container_id>
			texture = <tilt_tex>
			pos = (135.0, 0.0)
		}
	endif
	if NOT ((<part> = vocals) || (<part> = drum))
		add_menu_item {
			text = qs(0xf4397d0c)
			pad_choose_sound = nullsound
			pad_choose_script = options_change_touch_strip_option
			pad_choose_params = {player = <player>}
		}
		<item_container_id> :se_setprops focusable = false alpha = 0.4
		getplayerinfo <player> enable_touch_strip
		if (<enable_touch_strip> = 1)
			touch_tex = options_controller_check
		else
			touch_tex = options_controller_x
		endif
		createscreenelement {
			local_id = touch_check
			type = spriteelement
			parent = <item_container_id>
			texture = <touch_tex>
			pos = (135.0, 0.0)
		}
	endif
	if ($current_song != jamsession)
		if (<part> = vocals)
			if ($vocal_enable_static_view = 1)
				add_menu_item {
					text = qs(0x804b43ff)
					pad_choose_sound = nullsound
					choose_state = uistate_options_vocals_view_warning
					choose_state_data = {controller = <player_device> player = <player>}
				}
				vocals_get_highway_view player = <player>
				<vocals_highway_view> = <highway_view>
				if (<vocals_highway_view> = static)
					scroll_tex = options_controller_x
				else
					scroll_tex = options_controller_check
				endif
				createscreenelement {
					type = spriteelement
					parent = <item_container_id>
					texture = <scroll_tex>
					pos = (135.0, 0.0)
				}
			endif
			if NOT ($game_mode = training)
				add_menu_item {
					text = qs(0xd22e8941)
					internal_scale = (0.8, 1.0)
					pad_choose_sound = nullsound
					pad_choose_script = ui_pause_options_choose_sp_clap
					pad_choose_params = {popup = 1 player = (<player_index> + 1) device_num = <player_device>}
				}
				<item_container_id> :se_setprops focusable = false alpha = 0.4
				getplayerinfo <player> vocals_sp_clap
				if (<vocals_sp_clap> = 0)
					scroll_tex = options_controller_x
				else
					scroll_tex = options_controller_check
				endif
				createscreenelement {
					local_id = check
					type = spriteelement
					parent = <item_container_id>
					texture = <scroll_tex>
					pos = (135.0, 0.0)
				}
			endif
		endif
	endif
	count_texture = options_controller_x
	get_savegame_from_controller controller = ($last_start_pressed_device)
	getglobaltags user_options param = unpause_count savegame = <savegame>
	if (<unpause_count> = 1)
		count_texture = options_controller_check
	endif
	add_menu_item \{text = qs(0x8fdcfd13)
		pad_choose_sound = nullsound
		pad_choose_script = ui_pause_options_choose_count
		pad_choose_params = {
			popup = 1
			player = 1
		}}
	<item_container_id> :se_setprops focusable = false alpha = 0.4
	createscreenelement {
		type = spriteelement
		parent = <item_container_id>
		local_id = check
		pos = (135.0, 0.0)
		just = [center center]
		texture = <count_texture>
	}
	add_gamertag_helper \{exclusive_device = $last_start_pressed_device}
	menu_finish
endscript

script ui_destroy_pause_options 
	generic_ui_destroy
	ui_pausemenu_destroy_bg
endscript

script ui_pause_options_choose_count 
	obj_getid
	get_savegame_from_controller controller = <device_num>
	getglobaltags user_options param = unpause_count savegame = <savegame>
	if resolvescreenelementid id = {<objid> child = check}
		if (<unpause_count> = 1)
			<unpause_count> = 0
			soundevent \{event = checkbox_sfx}
			if gotparam \{popup}
				<resolved_id> :setprops texture = options_controller_x
			else
				<resolved_id> :setprops texture = data_settings_xmark
			endif
		else
			<unpause_count> = 1
			soundevent \{event = checkbox_check_sfx}
			if gotparam \{popup}
				<resolved_id> :setprops texture = options_controller_check
			else
				<resolved_id> :setprops texture = data_settings_checkmark
			endif
		endif
		setglobaltags user_options params = {unpause_count = <unpause_count>} savegame = <savegame>
	endif
endscript

script ui_pause_options_choose_sp_clap 
	obj_getid
	getplayerinfo player = <player> vocals_sp_clap
	if resolvescreenelementid id = {<objid> child = check}
		if (<vocals_sp_clap> = 1)
			<vocals_sp_clap> = 0
			soundevent \{event = checkbox_sfx}
			if gotparam \{popup}
				<resolved_id> :setprops texture = options_controller_x
			else
				<resolved_id> :setprops texture = data_settings_xmark
			endif
		else
			<vocals_sp_clap> = 1
			soundevent \{event = checkbox_check_sfx}
			if gotparam \{popup}
				<resolved_id> :setprops texture = options_controller_check
			else
				<resolved_id> :setprops texture = data_settings_checkmark
			endif
		endif
		vocals_set_star_power_clap player = <player> clap = <vocals_sp_clap> controller = <device_num>
	endif
endscript
