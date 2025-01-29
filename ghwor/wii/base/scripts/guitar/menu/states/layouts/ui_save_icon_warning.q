g_save_icon_warning_already_viewed = 0

script ui_create_save_icon_warning 
	allow_wii_notifications
	audio_ui_menu_music_on
	if ($enable_saving = 1)
		create_mainmenu_bg
		<body_text> = qs(0x38340209)
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
			z = 100000}
	else
		SpawnScriptNow save_icon_warning_accept params = {device_num = ($primary_controller)}
	endif
	fadetoblack \{OFF
		time = 1.0
		no_wait}
	destroy_loading_screen
endscript

script save_icon_warning_accept \{device_num = !i1768515945}
	ui_event_wait_for_safe
	Change \{g_save_icon_warning_already_viewed = 1}
	ui_sfx \{menustate = freeplay
		uitype = select}
	hide_glitch \{num_frames = 22}
	Change \{g_boot_sysnotify_wait = FALSE}
	set_primary_controller device_num = <device_num> optional_signin = 1 state = uistate_online_setup data = {boot = 1 no_sound = 1 clear_previous_stack show_mainmenu_bg = 1}
endscript

script ui_destroy_save_icon_warning 
	if ($enable_saving = 1)
		DestroyScreenElement \{id = autosave_boot_message}
		destroy_mainmenu_bg
		clean_up_user_control_helpers
	endif
endscript
