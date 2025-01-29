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

script create_signin_warning_menu player_device = ($memcardcontroller)
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case ngc
		getngcneterrors \{reset_on_begin_connect = 1}
		if (<dwc_error_code> > 0)
			formatText TextName = error_msg qs(0xcfb2fe82) d = (<dwc_error_code>) s = (<dwc_error_text>)
		else
			formatText TextName = error_msg qs(0x73307931) s = (<dwc_error_text>)
		endif
		wii_bootup_handle_connection_error
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
			body_text = <error_msg>
			options = <array>
		}
		case PS3
		<error_string_when_too_young_for_online> = 'Online service is disabled on your PLAYSTATION®Network account due to parental control restrictions.'
		if NOT GotParam \{require_live}
			array = [
				{
					func = signin_warning_select_continue
					text = qs(0x182f0173)
					Scale = (1.0, 1.0)
				}
			]
			if GotParam \{allow_back}
				AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs(0xf7723015)}
			endif
			if NetSessionFunc \{func = isoldenoughforonline}
				if CheckForSignIn \{network_platform_only}
					text = qs(0xf6ab5df3)
				else
					text = 'You are not signed in to the PLAYSTATION®Network. You will be unable to write statistics.'
				endif
			else
				text = <error_string_when_too_young_for_online>
			endif
		else
			array = [
			]
			AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs(0xf7723015)}
			if NetSessionFunc \{func = isoldenoughforonline}
				if NetSessionFunc \{func = iscableunplugged}
					text = 'You are not connected to the PLAYSTATION®Network. Please connect and try again.'
				else
					if CheckForSignIn \{network_platform_only}
						text = qs(0x0f686da5)
					else
						text = 'You are not signed in to the PLAYSTATION®Network. You must sign in to continue.'
					endif
				endif
			else
				text = <error_string_when_too_young_for_online>
			endif
		endif
		create_dialog_box {
			body_text = <text>
			options = <array>
		}
		case Xenon
		array = [
			{
				func = signin_warning_select_signin
				func_params = {allow_back = <allow_back> jam = <jam> require_live = <require_live> downloads = <downloads> leaderboards = <leaderboards> force_signin = 1}
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
		if ((GotParam jam) || (GotParam boot))
			<continue_without_save> = 1
		endif
		if GotParam \{jam}
			if (<jam> = 2)
				<continue_without_save> = 0
			endif
		endif
		if (<continue_without_save> = 1)
			AddArrayElement array = <array> element = {func = signin_warning_select_cws text = qs(0x06d0b6b0)}
		endif
		if GotParam \{allow_back}
			AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs(0xf7723015) require_live = <require_live>}
		endif
		text = qs(0xf97bd659)
		if GotParam \{downloads}
			text = qs(0xabd9af41)
		elseif GotParam \{leaderboards}
			text = qs(0x3f6f5d6a)
			if CheckForSignIn local controller_index = ($primary_controller)
				text = 'You must be signed in to Xbox LIVE to access leaderboards. Please connect and try again.'
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
				text = 'You are not currently connected to Xbox LIVE. Please connect and try again.'
			elseif NetSessionFunc func = xenonisguest params = {controller_index = ($primary_controller)}
				text = 'You are currently signed into a guest gamer profile. In order to use this feature, you must be signed into Xbox LIVE, and not a guest of a multiplayer enabled gamer profile.'
			elseif (<signed_in> = 0)
				text = 'No gamer profile currently signed in. Please sign into an Xbox LIVE multiplayer enabled gamer profile to continue.'
			elseif (<signed_in> = 1 && <multiplayer_allowed> = 0)
				text = 'The current gamer profile is not enabled for Xbox LIVE multiplayer game play or the network connection has been lost.'
			endif
		endif
		create_dialog_box {
			player_device = <player_device>
			body_text = <text>
			options = <array>
		}
	endswitch
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
	if NOT (($signin_continue_state) = uistate_boot_guitar)
	endif
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
	ui_event event = menu_replace data = {state = uistate_signin new_state = ($signin_continue_state) new_data = ($signin_continue_data) allow_back = <allow_back> jam = <jam> require_live = <require_live> downloads = <downloads> leaderboards = <leaderboards> force_signin = <force_signin>}
endscript

script signin_warning_select_cws 
	start_checking_for_signin_change
	Change \{enable_saving = 0}
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
	ui_event event = menu_replace data = {state = uistate_boot_download_scan controller = <device_num>
		event_params = {event = menu_replace data = {state = $signin_continue_state ($signin_continue_data)}}}
endscript
