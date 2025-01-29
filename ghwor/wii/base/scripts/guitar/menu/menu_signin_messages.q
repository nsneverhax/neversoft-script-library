respond_to_signin_changed = 0
respond_to_signin_changed_all_players = 0
respond_to_signin_changed_func = None
signin_complete_menu_select_ok_called = 0
ps3_signin_complete = 0

script wait_for_blade_complete 
	if isxenonorwindx
		wait_for_sysnotify_unpause
	else
		begin
		if (1 = $ps3_signin_complete)
			break
		endif
		Wait \{1
			Frame}
		repeat
	endif
endscript

script create_signin_warning_menu {
		0x52 player_device = ($memcardcontroller)
		0x52 boot = 0
		0x52 require_signin = 0
	}
	printscriptinfo \{'create_signin_warning_menu'}
	printstruct <...>
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case ngc
		netstatus_geterrors
		format_net_error_text code = <error_code> text = <error_text>
		if NOT GotParam \{require_live}
			array = [
				{
					func = signin_warning_select_continue
					text = $wii_popup_continue
					Scale = (1.0, 1.0)
				}
			]
			if GotParam \{allow_back}
				AddArrayElement array = <array> element = {func = ui_signin_warning_back text = $wii_ok}
			endif
		else
			array = [
			]
			AddArrayElement array = <array> element = {func = ui_signin_warning_back text = $wii_ok}
		endif
		create_dialog_box {
			title = $wii_error
			body_text = <text>
			options = <array>
		}
		netstatus_showederrortouser net_system = <net_system>
		case PS3
		<error_string_when_too_young_for_online> = 'Online service is disabled on your PLAYSTATION®Network account due to parental control restrictions.'
		if NOT GotParam \{require_live}
			array = [
				{
					func = signin_warning_select_continue
					func_params = {ps3_boot_warning = <ps3_boot_warning>}
					text = qs(0x182f0173)
					Scale = (1.0, 1.0)
				}
			]
			if NetSessionFunc \{func = isoldenoughforonline}
				if CheckForSignIn \{network_platform_only}
					text = qs(0x410b2c33)
				else
					text = qs(0xe8acd340)
				endif
				if GotParam \{allow_back}
					if GotParam \{jam}
						AddArrayElement array = <array> element = {func = ui_signin_warning_jam_back func_params = {jam = <jam>} text = qs(0xf7723015)}
					else
						AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs(0xf7723015)}
					endif
				endif
			else
				text = <error_string_when_too_young_for_online>
			endif
		else
			array = [
			]
			if GotParam \{jam}
				AddArrayElement array = <array> element = {func = ui_signin_warning_jam_back func_params = {jam = <jam>} text = qs(0xf7723015)}
			else
				AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs(0xf7723015)}
			endif
			if NetSessionFunc \{func = isoldenoughforonline}
				if NetSessionFunc \{func = iscableunplugged}
					text = qs(0xb9836f21)
				else
					if CheckForSignIn \{network_platform_only}
						text = qs(0xd8f3244a)
					else
						text = qs(0xed14231f)
					endif
				endif
			else
				text = <error_string_when_too_young_for_online>
			endif
		endif
		ui_sfx \{menustate = Generic
			uitype = warningmessage}
		create_dialog_box {
			body_text = <text>
			options = <array>
		}
		case Xenon
		case windx
		array = [
			{
				func = signin_warning_select_signin
				func_params = {
					allow_back = <allow_back>
					jam = <jam>
					musicstore = <musicstore>
					require_live = <require_live>
					downloads = <downloads>
					leaderboards = <leaderboards>
					force_signin = 1
					boot = <boot>
					had_require_signin = <require_signin>
				}
				text = qs(0x17df5913)
			}
		]
		<continue_without_save> = 0
		if NOT GotParam \{downloads}
			if NOT GotParam \{leaderboards}
				if NOT GotParam \{require_live}
					<continue_without_save> = 1
				endif
			endif
		endif
		if ((GotParam jam) || (<boot> = 1))
			<continue_without_save> = 1
		endif
		if GotParam \{jam}
			if (<jam> = 2)
				<continue_without_save> = 0
			endif
		endif
		if (<boot> = 0)
			if GotParam \{require_signin}
				<continue_without_save> = 0
			endif
		endif
		if (<continue_without_save> = 1)
			AddArrayElement array = <array> element = {func = signin_warning_select_cws text = qs(0x06d0b6b0)}
		endif
		if GotParam \{allow_back}
			if GotParam \{jam}
				AddArrayElement array = <array> element = {func = ui_signin_warning_jam_back text = qs(0xf7723015) func_params = {jam = <jam>} require_live = <require_live>}
				<back_button_script> = ui_signin_warning_jam_back
				<back_button_params> = {jam = <jam>}
			else
				AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs(0xf7723015) require_live = <require_live>}
				<back_button_script> = ui_signin_warning_back
				<back_button_params> = {}
			endif
		endif
		text = qs(0x83f3352b)
		if NetSessionFunc func = xenonisguest params = {controller_index = ($primary_controller)}
			text = qs(0xa0cb6a7f)
		endif
		if GotParam \{downloads}
			text = qs(0xb586f45b)
		elseif GotParam \{leaderboards}
			text = qs(0x3f6f5d6a)
			if CheckForSignIn local controller_index = ($primary_controller)
				text = qs(0x3a2c3ac0)
			endif
		endif
		if GotParam \{require_live}
			<signed_in> = 0
			<multiplayer_allowed> = 0
			<live_enabled> = 0
			if NetSessionFunc func = isliveenabled params = {controller_index = ($primary_controller)}
				<live_enabled> = 1
			endif
			if CheckForSignIn local controller_index = ($primary_controller)
				<signed_in> = 1
				if NetSessionFunc func = ismultiplayerallowed params = {controller_index = ($primary_controller)}
					<multiplayer_allowed> = 1
				endif
			endif
			if NetSessionFunc \{func = iscableunplugged}
				text = qs(0xab79bf04)
			elseif NetSessionFunc func = xenonisguest params = {controller_index = ($primary_controller)}
				text = qs(0xb9fd7c2c)
			elseif (<signed_in> = 0)
				get_signin_profile_warning_text
			elseif (<signed_in> = 1 && <multiplayer_allowed> = 0)
				text = qs(0xd840d20c)
			endif
		endif
		<skip_everything> = 0
		if (<continue_without_save> = 1)
			get_savegame_from_controller controller = <player_device>
			GetGlobalTags savegame = <savegame> user_options param = has_warned_about_signin
			if (<has_warned_about_signin> = 1)
				<skip_everything> = 1
			endif
		endif
		if (<skip_everything> = 1)
			destroy_dialog_box
			SpawnScriptLater signin_warning_select_cws params = {
				device_num = <player_device>
			}
		else
			ui_sfx \{menustate = Generic
				uitype = warningmessage}
			create_dialog_box {
				player_device = <player_device>
				body_text = <text>
				options = <array>
				back_button_script = <back_button_script>
				back_button_params = <back_button_params>
			}
		endif
	endswitch
	fadetoblack \{OFF
		time = 0.0}
endscript

script destroy_signin_warning_menu 
	destroy_dialog_box
endscript

script signin_complete_callback 
	printf \{'signin_complete_callback'}
	Change \{ps3_signin_complete = 1}
endscript

script signin_warning_select_continue 
	destroy_dialog_box
	ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
endscript

script create_signin_complete_menu 
	memcard_cleanup_messages
	signin_complete_menu_select_ok
	Change \{signin_complete_menu_select_ok_called = 0}
endscript

script signin_complete_menu_select_ok 
	if ($signin_complete_menu_select_ok_called = 0)
		Change \{signin_complete_menu_select_ok_called = 1}
		destroy_dialog_box
		ui_signin_process_complete
		<callback> <callback_params>
	endif
endscript

script destroy_signin_complete_menu 
	destroy_dialog_box
endscript

script signin_warning_select_signin 
	ui_event event = menu_replace data = {
		state = uistate_signin
		new_state = ($signin_continue_state)
		new_data = ($signin_continue_data)
		allow_back = <allow_back>
		jam = <jam>
		musicstore = <musicstore>
		require_live = <require_live>
		downloads = <downloads>
		leaderboards = <leaderboards>
		force_signin = <force_signin>
		had_require_signin = <had_require_signin>
		boot = <boot>
		show_mainmenu_bg = 1
	}
endscript

script signin_warning_select_cws \{device_num = !i1768515945
		no_hide_glitch = 0}
	start_checking_for_signin_change
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
	ui_event event = menu_replace data = {state = uistate_boot_download_scan controller = <device_num> show_mainmenu_bg = 1
		event_params = {event = menu_replace data = {state = $signin_continue_state ($signin_continue_data)}}}
	if (<no_hide_glitch> = 0)
		hide_glitch \{num_frames = 20}
	endif
endscript
