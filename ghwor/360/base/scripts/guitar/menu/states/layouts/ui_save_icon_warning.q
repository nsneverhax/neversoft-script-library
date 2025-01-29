g_save_icon_warning_already_viewed = 0

script ui_create_save_icon_warning 
	audio_ui_menu_music_on
	create_mainmenu_bg
	if isXenon
		<body_text> = qs(0xbbcb2931)
	else
		<body_text> = qs(0xc9cd65cb)
	endif
	CreateScreenElement {
		Type = descinterface
		desc = 'autosave_boot_message'
		parent = root_window
		id = autosave_boot_message
		description_text_text = <body_text>
		event_handlers = [
			{pad_choose save_icon_warning_accept params = {device_num = <device_num>}}
		]
	}
	if autosave_boot_message :desc_resolvealias \{Name = alias_autosave_icon}
		<resolved_id> :Obj_SpawnScriptNow autosave_spinner_ui_icon_anim
	else
		ScriptAssert \{qs(0x45fb23ba)}
	endif
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000
		all_buttons}
	fadetoblack \{OFF
		time = 1.0
		no_wait}
	destroy_loading_screen
	<savegame> = 0
	if NOT isps3
		<idx> = 0
		begin
		if get_savegame_has_saved_game savegame = <idx>
			<savegame> = <idx>
			break
		endif
		<idx> = (<idx> + 1)
		repeat 4
	endif
	ui_options_audio_set_dolby_digital savegame = <savegame>
	update_all_volumes_savegame savegame = <savegame>
	update_mic_eq_setting savegame = <savegame>
	KillSpawnedScript \{Name = persistent_band_cancel_lobby}
	SpawnScriptNow \{persistent_band_cancel_lobby}
	finaldumpheaps
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
	Change \{g_boot_sysnotify_wait = FALSE}
endscript

script save_icon_warning_accept \{device_num = !i1768515945}
	Change \{respond_to_signin_changed = 1}
	ui_event_wait_for_safe
	Change \{g_save_icon_warning_already_viewed = 1}
	ui_sfx \{menustate = freeplay
		uitype = select}
	hide_glitch \{num_frames = 22}
	set_primary_controller {
		device_num = <device_num>
		optional_signin = 1
		allow_back = 0
		state = uistate_social_networks_setup
		data = {
			boot = 1
			no_sound = 1
			clear_previous_stack
			show_mainmenu_bg = 1
		}
	}
endscript

script ui_destroy_save_icon_warning 
	DestroyScreenElement \{id = autosave_boot_message}
	destroy_mainmenu_bg
	clean_up_user_control_helpers
endscript
