
script ui_create_pause_options 
	ui_pausemenu_create_bg title_text = qs(0x2c98ca28) exclusive_device = <player_device>
	text_scale = 0.6
	spinner_offset = -10
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
		add_menu_frontend_item {
			text = qs(0x0242ed3e)
			internal_scale = <text_scale>
			choose_state = uistate_options_audio
			choose_state_data = {device_num = <player_device>}
		}
		<item_container_id> :settags {spinner_offset = <spinner_offset>}
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
		add_menu_frontend_item {
			text = qs(0xdc79581d)
			internal_scale = <text_scale>
			choose_state = uistate_options_calibrate_lag_warning
			choose_state_data = {controller = <player_device>}
		}
		<item_container_id> :settags {spinner_offset = <spinner_offset>}
	endif
	if isguitarcontroller controller = <player_device>
		if NOT ($current_song = jamsession)
		endif
	endif
	getplayerinfo <player> part
	checkboxes_to_add = []
	if NOT (<part> = vocals)
		add_menu_frontend_item {
			text = qs(0x83adf584)
			internal_scale = <text_scale>
			choose_state = uistate_pausemenu_lefty_flip_warning
			choose_state_data = {player = <player>}
		}
		<item_container_id> :settags {spinner_offset = <spinner_offset>}
		getplayerinfo <player> lefty_flip
		if (<lefty_flip> = 1)
			lefty_tex = options_controller_check
		else
			lefty_tex = options_controller_x
		endif
		addarrayelement array = <checkboxes_to_add> element = {element = <item_container_id> tex = <lefty_tex> local_id = lefty_check}
		checkboxes_to_add = <array>
	endif
	if NOT ((<part> = vocals) || (<part> = drum))
		add_menu_frontend_item {
			text = qs(0xc8c7e963)
			internal_scale = <text_scale>
			pad_choose_sound = nullsound
			pad_choose_script = options_change_tilt_star_power
			pad_choose_params = {player = <player>}
		}
		<item_container_id> :settags {spinner_offset = <spinner_offset>}
		<item_container_id> :se_setprops focusable = false alpha = 0.4
		getplayerinfo <player> use_tilt_for_starpower
		if (<use_tilt_for_starpower> = 1)
			tilt_tex = options_controller_check
		else
			tilt_tex = options_controller_x
		endif
		addarrayelement array = <checkboxes_to_add> element = {element = <item_container_id> tex = <tilt_tex> local_id = tilt_check}
		checkboxes_to_add = <array>
	endif
	if NOT ((<part> = vocals) || (<part> = drum))
		add_menu_frontend_item {
			text = qs(0xf4397d0c)
			internal_scale = <text_scale>
			pad_choose_sound = nullsound
			pad_choose_script = options_change_touch_strip_option
			pad_choose_params = {player = <player>}
		}
		<item_container_id> :settags {spinner_offset = <spinner_offset>}
		<item_container_id> :se_setprops focusable = false alpha = 0.4
		getplayerinfo <player> enable_touch_strip
		if (<enable_touch_strip> = 1)
			touch_tex = options_controller_check
		else
			touch_tex = options_controller_x
		endif
		addarrayelement array = <checkboxes_to_add> element = {element = <item_container_id> tex = <touch_tex> local_id = touch_check}
		checkboxes_to_add = <array>
	endif
	if ($current_song != jamsession)
		if (<part> = vocals)
			if ($vocal_enable_static_view = 1)
				if NOT isps3
					add_menu_frontend_item {
						text = qs(0x804b43ff)
						internal_scale = <text_scale>
						pad_choose_sound = nullsound
						choose_state = uistate_options_vocals_view_warning
						choose_state_data = {controller = <player_device> player = <player>}
					}
					vocals_get_highway_view player = <player>
					<vocals_highway_view> = <highway_view>
					<item_container_id> :settags {spinner_offset = <spinner_offset>}
					if (<vocals_highway_view> = static)
						scroll_tex = options_controller_x
					else
						scroll_tex = options_controller_check
					endif
					addarrayelement array = <checkboxes_to_add> element = {element = <item_container_id> tex = <scroll_tex> local_id = scroll_check}
					checkboxes_to_add = <array>
				endif
			endif
			if NOT ($game_mode = training)
				add_menu_frontend_item {
					text = qs(0xd22e8941)
					internal_scale = <text_scale>
					pad_choose_sound = nullsound
					pad_choose_script = ui_pause_options_choose_sp_clap
					pad_choose_params = {popup = 1 player = (<player_index> + 1) device_num = <player_device>}
				}
				<item_container_id> :settags {spinner_offset = <spinner_offset>}
				<item_container_id> :se_setprops focusable = false alpha = 0.4
				getplayerinfo <player> vocals_sp_clap
				if (<vocals_sp_clap> = 0)
					scroll_tex = options_controller_x
				else
					scroll_tex = options_controller_check
				endif
				addarrayelement array = <checkboxes_to_add> element = {element = <item_container_id> tex = <scroll_tex> local_id = clap_check}
				checkboxes_to_add = <array>
			endif
		endif
	endif
	count_texture = options_controller_x
	get_savegame_from_controller controller = ($last_start_pressed_device)
	getglobaltags user_options param = unpause_count savegame = <savegame>
	if (<unpause_count> = 1)
		count_texture = options_controller_check
	endif
	add_menu_frontend_item {
		text = qs(0x8fdcfd13)
		internal_scale = <text_scale>
		pad_choose_sound = nullsound
		pad_choose_script = ui_pause_options_choose_count
		pad_choose_params = {popup = 1 player = 1}
	}
	<item_container_id> :settags {spinner_offset = <spinner_offset>}
	<item_container_id> :se_setprops focusable = false alpha = 0.4
	addarrayelement array = <checkboxes_to_add> element = {element = <item_container_id> tex = <count_texture> local_id = check}
	checkboxes_to_add = <array>
	getarraysize \{checkboxes_to_add}
	if (<array_size> > 0)
		printf \{channel = kim
			qs(0x50b0eb57)}
		index = 0
		begin
		calculate_checkbox_offset id = (<checkboxes_to_add> [<index>].element)
		createscreenelement {
			local_id = (<checkboxes_to_add> [<index>].local_id)
			type = spriteelement
			parent = (<checkboxes_to_add> [<index>].element)
			texture = (<checkboxes_to_add> [<index>].tex)
			pos = <offset>
		}
		(<checkboxes_to_add> [<index>].element) :se_getprops
		printf channel = kim qs(0x8e832227) i = <index> t = (<checkboxes_to_add> [<index>].tex)
		index = (<index> + 1)
		repeat <array_size>
	endif
	add_gamertag_helper \{exclusive_device = $last_start_pressed_device}
	menu_finish
endscript

script calculate_checkbox_offset 
	requireparams \{[
			id
		]
		all}
	getscreenelementdims id = <id> summed
	<id> :se_getprops
	scale = (1.0 / (<scale>.(1.0, 0.0)))
	offset = ((<width> * 0.5 + (275.0 * <scale>)) * (1.0, 0.0) + (0.0, 10.0))
	return offset = <offset>
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
	if resolvescreenelementid id = {<objid> child = clap_check}
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
