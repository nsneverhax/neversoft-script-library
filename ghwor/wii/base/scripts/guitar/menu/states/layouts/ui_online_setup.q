
script ui_create_online_setup 
	printstruct <...>
	SpawnScriptNow ui_create_online_setup_spawned params = {<...>}
endscript

script ui_create_online_setup_spawned 
	ui_event_wait_for_safe
	printstruct <...>
	show_dialog = 0
	show_mainmenu_bg = 0
	if GotParam \{from_options_menu}
		show_mainmenu_bg = 1
		show_dialog = 1
	else
		SpawnScriptNow \{wait_for_connection_failed_notification}
		if NOT hascompletedonlinesetup
			show_dialog = 1
			show_mainmenu_bg = 1
		endif
	endif
	if (<show_dialog> = 1)
		disablenetwork \{restart_network_platform}
		NetSessionFunc \{func = get_gamertag}
		if (<Name> = qs(0x00000000))
			<Name> = qs(0x675459e3)
		endif
		if NOT hascompletedonlinesetup
			if getconsolenickname
				<Name> = <console_nickname>
			else
				<Name> = qs(0xb3a0e5e9)
			endif
		endif
		generic_event_choose {
			state = uistate_edit_name
			data = {
				is_popup
				default_name = <Name>
				char_limit = 16
				allowed_sets = [upper lower number space]
				title = qs(0xdd5c7fab)
				device_num = <device_num>
				accept_script = ui_online_setup_commit_online_name
				cancel_script = ui_online_setup_cancel_online_name
				show_mainmenu_bg = <show_mainmenu_bg>
			}
		}
		skiprenderframes \{5}
		ui_event_wait_for_safe
	else
		ui_online_setup_continue device_num = <device_num>
	endif
endscript

script ui_online_setup_continue_to_mainmenu 
	ui_memcard_autosave_replace \{event = menu_replace
		state = uistate_mainmenu
		show_mainmenu_bg = 1}
endscript

script ui_destroy_online_setup 
endscript

script ui_return_online_setup 
	destroy_dialog_box
	hide_glitch \{num_frames = 4}
	if NOT ui_event_exists_in_stack \{Name = 'mainmenu'}
		spawnscript \{ui_online_setup_display_friends_dialog}
	else
		spawnscript \{ui_online_setup_back_to_options}
	endif
endscript

script ui_online_setup_display_friends_dialog 
	create_mainmenu_bg
	ui_event_wait_for_safe
	destroy_dialog_box
	create_dialog_box \{heading_text = qs(0x5bb722bb)
		body_text = qs(0xb9f522e7)
		use_all_controllers = 1
		options = [
			{
				func = ui_online_setup_import_friends
				func_params = {
					import = 1
				}
				text = qs(0x58e0a1fb)
			}
			{
				func = ui_online_setup_import_friends
				func_params = {
					import = 0
				}
				text = qs(0xd2915c27)
			}
		]}
endscript

script ui_online_setup_import_friends 
	RequireParams \{[
			import
		]
		all}
	if NOT GotParam \{from_options}
		destroy_dialog_box
		friend_obj_params = {enable = <import>}
	else
		friend_obj_params = {enable = <import> from_options}
	endif
	if (<import> = 1)
		import_text = ($wii_notification_strings.friends_imported)
	else
		import_text = ($wii_notification_strings.friends_removed)
	endif
	Change g_ngc_friends_enabled = <import>
	NetSessionFunc Obj = friends func = enable_friends params = <friend_obj_params>
	if NOT GotParam \{from_options}
		displaynotification high_priority text = <import_text> display_time = 2.5 Type = friend
		setcompletedonlinesetup
		ui_online_setup_continue device_num = <device_num>
	endif
endscript

script ui_online_setup_continue 
	RequireParams \{[
			device_num
		]
		all}
	if NOT ui_event_exists_in_stack \{Name = 'mainmenu'}
		ui_online_setup_continue_to_mainmenu device_num = <device_num>
	else
		if NOT ui_event_exists_in_stack \{Name = 'online_setup'}
			LaunchEvent \{Type = focus
				target = current_menu}
			online_settings_helper_pills
		else
			ui_online_setup_back_to_options device_num = <device_num>
		endif
	endif
endscript

script ui_online_setup_back_to_options 
	ui_event_wait_for_safe
	generic_event_back
endscript

script ui_online_setup_commit_online_name 
	printf \{qs(0xf573894e)}
	printf \{qs(0xdb432982)}
	LaunchEvent \{Type = unfocus
		target = edit_name_screen_id}
	stringchecknumberofdigits profile_name_string = <text>
	if (<num_digits> > 6)
		create_dialog_box \{heading_text = qs(0x5c9b76c1)
			body_text = $wii_rvldwc_message_0001
			dlg_z_priority = 2500
			options = [
				{
					func = ui_online_setup_failed_name_check_ok
					text = qs(0x0e41fe46)
				}
			]}
		return
	endif
	printf qs(0x3cdb57fc) s = <text>
	setonlineprofilename Name = <text>
	SpawnScriptNow \{wait_and_enable_network}
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_back
endscript

script ui_online_setup_cancel_online_name 
	if ui_event_exists_in_stack \{Name = 'options'}
		SpawnScriptNow \{wait_and_enable_network}
		ui_sfx \{menustate = Generic
			uitype = back}
		generic_event_back
	else
		if ScreenElementExists \{id = edit_name_screen_id}
			LaunchEvent \{Type = focus
				target = edit_name_screen_id}
		endif
	endif
endscript

script wait_and_enable_network 
	begin
	printf \{'Waiting for Network to disable'}
	Wait \{1
		Frame}
	if (isnetworkdisabled)
		break
	endif
	repeat
	enablenetwork
endscript

script ui_online_setup_failed_name_check_ok 
	destroy_dialog_box
	LaunchEvent \{Type = focus
		target = edit_name_screen_id}
	ui_online_setup_setup_name_helpers
endscript

script ui_online_setup_setup_name_helpers 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x43f2255e)
		button = green
		z = 100000}
	if ui_event_exists_in_stack \{Name = 'options'}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
	endif
	add_user_control_helper \{text = qs(0xe3576d13)
		button = blue
		z = 100000}
	add_user_control_helper \{text = qs(0x71449adf)
		button = yellow
		z = 100000}
	add_user_control_helper \{text = qs(0xe0ca6171)
		button = start
		z = 100000}
endscript

script ui_deinit_online_setup 
	printf \{channel = clayton
		'ui_deinit_online_setup'}
	Change \{online_setup_finished = 1}
	destroy_mainmenu_bg
endscript
