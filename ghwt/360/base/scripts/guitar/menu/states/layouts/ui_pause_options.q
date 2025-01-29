
script ui_create_pause_options 
	ui_pausemenu_create_bg \{title_text = qs(0x976cf9e7)}
	if pausemenu_bg :desc_resolvealias \{Name = alias_menu}
		<parent> = <resolved_id>
	endif
	make_menu {
		parent = <parent>
		centered_offset = (-450.0, -250.0)
		exclusive_device = <player_device>
		extra_z = 600
		centered
		nobg
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
			text = qs(0xfd77e801)
			choose_state = uistate_options_audio
			choose_state_data = {device_num = <player_device>}
		}
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
			text = qs(0x550b8c8e)
			choose_state = uistate_options_calibrate_lag_warning
			choose_state_data = {controller = <player_device>}
		}
	endif
	if IsGuitarController controller = <player_device>
		if NOT ($current_song = jamsession)
		endif
	endif
	getplayerinfo <Player> part
	if NOT (<part> = vocals)
		add_menu_item {
			text = qs(0x2e9b1b43)
			choose_state = uistate_pausemenu_lefty_flip_warning
			choose_state_data = {Player = <Player>}
		}
		getplayerinfo <Player> lefty_flip
		if (<lefty_flip> = 1)
			lefty_tex = Options_Controller_Check
		else
			lefty_tex = Options_Controller_X
		endif
		CreateScreenElement {
			Type = SpriteElement
			parent = <item_container_id>
			texture = <lefty_tex>
			Pos = (225.0, 0.0)
		}
	endif
	if NOT ((<part> = vocals) || (<part> = drum))
		add_menu_item {
			text = qs(0x1c739509)
			pad_choose_script = options_change_tilt_star_power
			pad_choose_params = {Player = <Player>}
		}
		getplayerinfo <Player> use_tilt_for_starpower
		if (<use_tilt_for_starpower> = 1)
			tilt_tex = Options_Controller_Check
		else
			tilt_tex = Options_Controller_X
		endif
		CreateScreenElement {
			local_id = tilt_check
			Type = SpriteElement
			parent = <item_container_id>
			texture = <tilt_tex>
			Pos = (225.0, 0.0)
		}
	endif
	if NOT ((<part> = vocals) || (<part> = drum))
		add_menu_item {
			text = qs(0xa2b47a6e)
			pad_choose_script = options_change_touch_strip_option
			pad_choose_params = {Player = <Player>}
		}
		getplayerinfo <Player> enable_touch_strip
		if (<enable_touch_strip> = 1)
			touch_tex = Options_Controller_Check
		else
			touch_tex = Options_Controller_X
		endif
		CreateScreenElement {
			local_id = touch_check
			Type = SpriteElement
			parent = <item_container_id>
			texture = <touch_tex>
			Pos = (225.0, 0.0)
		}
	endif
	if ($current_song != jamsession)
		if (<part> = vocals)
			if ($vocal_enable_static_view = 1)
				add_menu_item {
					text = qs(0x7a043839)
					choose_state = uistate_options_vocals_view_warning
					choose_state_data = {controller = <player_device> Player = <Player>}
				}
				vocals_get_highway_view Player = <Player>
				<vocals_highway_view> = <highway_view>
				if (<vocals_highway_view> = static)
					scroll_tex = Options_Controller_X
				else
					scroll_tex = Options_Controller_Check
				endif
				CreateScreenElement {
					Type = SpriteElement
					parent = <item_container_id>
					texture = <scroll_tex>
					Pos = (225.0, 0.0)
				}
			endif
			add_menu_item {
				text = qs(0x70974769)
				pad_choose_script = options_change_vocals_sp_clap
				pad_choose_params = {Player = <Player> checkbox_child = check check_tex = Options_Controller_Check x_tex = Options_Controller_X}
			}
			getplayerinfo <Player> vocals_sp_clap
			if (<vocals_sp_clap> = 0)
				scroll_tex = Options_Controller_X
			else
				scroll_tex = Options_Controller_Check
			endif
			CreateScreenElement {
				local_id = check
				Type = SpriteElement
				parent = <item_container_id>
				texture = <scroll_tex>
				Pos = (225.0, 0.0)
			}
		endif
	endif
	count_texture = Options_Controller_X
	get_savegame_from_controller controller = ($last_start_pressed_device)
	GetGlobalTags user_options param = unpause_count savegame = <savegame>
	if (<unpause_count> = 1)
		count_texture = Options_Controller_Check
	endif
	add_menu_item \{text = qs(0xc987ca62)
		pad_choose_script = ui_pause_options_choose_count
		pad_choose_params = {
			popup = 1
			Player = 1
		}}
	CreateScreenElement {
		Type = SpriteElement
		parent = <item_container_id>
		local_id = check
		Pos = (225.0, 0.0)
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
	Obj_GetID
	get_savegame_from_controller controller = <device_num>
	GetGlobalTags user_options param = unpause_count savegame = <savegame>
	if ResolveScreenElementID id = {<objID> child = check}
		if (<unpause_count> = 1)
			<unpause_count> = 0
			SoundEvent \{event = Checkbox_SFX}
			if GotParam \{popup}
				<resolved_id> :SetProps texture = Options_Controller_X
			else
				<resolved_id> :SetProps texture = data_settings_xmark
			endif
		else
			<unpause_count> = 1
			SoundEvent \{event = CheckBox_Check_SFX}
			if GotParam \{popup}
				<resolved_id> :SetProps texture = Options_Controller_Check
			else
				<resolved_id> :SetProps texture = data_settings_checkmark
			endif
		endif
		SetGlobalTags user_options params = {unpause_count = <unpause_count>} savegame = <savegame>
	endif
endscript
