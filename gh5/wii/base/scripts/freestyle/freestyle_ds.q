freestyle_ignore_ds_messages = true

script freestyle_ds_kill_spawned_scripts 
	KillSpawnedScript \{Name = freestyle_ds_set_auto_stage_show}
	KillSpawnedScript \{Name = freestyle_ds_trigger_camera}
	KillSpawnedScript \{Name = freestyle_ds_trigger_filter}
	KillSpawnedScript \{Name = freestyle_ds_trigger_lights}
endscript

script freestyle_ds_set_auto_stage_show 
	RequireParams \{[
			enable
		]
		all}
	if ($freestyle_ignore_ds_messages = true)
		return
	endif
	wait_until_unpaused
	if (<enable> = 0)
		freestyle_disable_auto_stage_show
	else
		freestyle_enable_auto_stage_show
	endif
endscript

script freestyle_ds_trigger_camera 
	RequireParams \{[
			index
		]
		all}
	if ($freestyle_ignore_ds_messages = true)
		return
	endif
	wait_until_unpaused
	freestyle_disable_auto_stage_show
	freestyle_get_camera_type_by_index camera_type_index = <index>
	freestyle_choose_next_camera_index camera_type = <camera_type>
	freestyle_change_camera camera_type = <camera_type> camera_index = <chosen_index>
endscript

script freestyle_ds_trigger_filter 
	RequireParams \{[
			index
		]
		all}
	if ($freestyle_ignore_ds_messages = true)
		return
	endif
	wait_until_unpaused
	freestyle_disable_auto_stage_show
	freestyle_trigger_screenfx_event filter_index = <index>
endscript

script freestyle_ds_trigger_lights 
	RequireParams \{[
			index
		]
		all}
	if ($freestyle_ignore_ds_messages = true)
		return
	endif
	wait_until_unpaused
	freestyle_disable_auto_stage_show
	freestyle_get_light_type_by_index light_type_index = <index>
	freestyle_choose_next_light_index light_type = <light_type>
	freestyle_play_specific_light light_type = <light_type> light_index = <next_light_index>
endscript

script freestyle_allow_ds_control 
	if (($freestyle_game_mode = standard) && ($freestyle_stage_manager_ds = true))
		if is_ds_connected
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script freestyle_notify_ds_disconnected 
	if (($freestyle_ds_has_disconnected) = FALSE)
		freestyle_enable_auto_stage_show
		formatText TextName = text qs(0x13454b5a) n = ($ds_infos [0].ds_name)
		displaynotification <text> display_time = 3 position = topright
		Change \{freestyle_ds_has_disconnected = true}
	endif
endscript

script freestyle_mainmenu_config_ds_handler 
	if freestyle_is_active
		if GotParam \{standard}
			ds_catcher :se_setprops \{event_handlers = [
					{
						pad_select
						nullscript
					}
					{
						ds_disconnect
						freestyle_notify_ds_disconnected
					}
				]
				replace_handlers}
		elseif GotParam \{main_menu}
			if ScreenElementExists \{id = ds_catcher}
				DestroyScreenElement \{id = ds_catcher}
			endif
			CreateScreenElement \{Type = ContainerElement
				id = ds_catcher
				parent = root_window
				event_handlers = [
					{
						ds_disconnect
						freestyle_notify_ds_disconnected
					}
					{
						ds_disconnect
						freestyle_mainmenu_refresh_ds_connect_option
						params = {
							disconnected
						}
					}
				]}
		elseif GotParam \{band_lobby}
			ds_catcher :se_setprops \{event_handlers = [
					{
						ds_disconnect
						freestyle_notify_ds_disconnected
					}
					{
						pad_select
						freestyle_band_lobby_open_ds_connect
					}
					{
						ds_disconnect
						freestyle_band_lobby_unjoin_ds
					}
				]
				replace_handlers}
		endif
	endif
endscript
