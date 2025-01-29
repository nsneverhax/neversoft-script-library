respond_to_signin_changed = 0
respond_to_signin_changed_all_players = 0
respond_to_signin_changed_func = None
signin_complete_menu_select_ok_called = 0
ps3_signin_complete = 0

script wait_for_blade_complete 
	if IsXenonOrWinDX
		wait_for_sysnotify_unpause
	else
		begin
		printf \{'wait_for_blade_complete'}
		if (1 = $ps3_signin_complete)
			break
		endif
		wait \{1
			frame}
		repeat
	endif
endscript

script start_checking_for_signin_change 
	printf \{qs(0x08e4bedc)}
	printscriptinfo \{qs(0x08e4bedc)}
	printf \{qs(0x329c888b)}
	killspawnedscript \{name = sysnotify_handle_signin_change}
	printf \{qs(0x80fc902c)}
	Change \{signin_change_happening = 0}
	Change \{respond_to_signin_changed = 1}
endscript

script create_signin_warning_menu player_device = ($MemcardController)
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		<error_string_when_too_young_for_online> = qs(0x052f0757)
		if NOT GotParam \{require_live}
			array = [
				{
					func = signin_warning_select_continue
					func_params = {ps3_boot_warning = <ps3_boot_warning>}
					text = qs(0x182f0173)
					scale = (1.0, 1.0)
				}
			]
			if GotParam \{allow_back}
				if GotParam \{Jam}
					AddArrayElement array = <array> element = {func = ui_signin_warning_jam_back func_params = {Jam = <Jam>} text = qs(0xf7723015)}
				else
					AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs(0xf7723015)}
				endif
			endif
			if NetSessionFunc \{func = IsOldEnoughForOnline}
				if CheckForSignIn \{network_platform_only}
					text = qs(0xac33d0df)
				else
					text = qs(0x517f05d2)
				endif
			else
				text = <error_string_when_too_young_for_online>
			endif
		else
			array = [
			]
			if GotParam \{Jam}
				AddArrayElement array = <array> element = {func = ui_signin_warning_jam_back func_params = {Jam = <Jam>} text = qs(0xf7723015)}
			else
				AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs(0xf7723015)}
			endif
			if NetSessionFunc \{func = IsOldEnoughForOnline}
				if NetSessionFunc \{func = IsCableUnplugged}
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
		create_dialog_box {
			body_text = <text>
			options = <array>
		}
		case Xenon
		array = [
			{
				func = signin_warning_select_signin
				func_params = {allow_back = <allow_back> Jam = <Jam> musicstore = <musicstore> require_live = <require_live> downloads = <downloads> leaderboards = <leaderboards> force_signin = 1}
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
		if ((GotParam Jam) || (GotParam boot))
			<continue_without_save> = 1
		endif
		if GotParam \{Jam}
			if (<Jam> = 2)
				<continue_without_save> = 0
			endif
		endif
		if GotParam \{require_signin}
			continue_without_save = 0
		endif
		if (<continue_without_save> = 1)
			AddArrayElement array = <array> element = {func = signin_warning_select_cws text = qs(0x06d0b6b0)}
		endif
		if GotParam \{allow_back}
			if GotParam \{Jam}
				AddArrayElement array = <array> element = {func = ui_signin_warning_jam_back text = qs(0xf7723015) func_params = {Jam = <Jam>} require_live = <require_live>}
			else
				AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs(0xf7723015) require_live = <require_live>}
			endif
		endif
		text = qs(0xf97bd659)
		if NetSessionFunc func = XenonIsGuest params = {controller_index = ($primary_controller)}
			text = qs(0xb571a42e)
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
			if NetSessionFunc func = IsLiveEnabled params = {controller_index = ($primary_controller)}
				<live_enabled> = 1
			endif
			if CheckForSignIn local controller_index = ($primary_controller)
				<signed_in> = 1
				if NetSessionFunc func = IsMultiplayerAllowed params = {controller_index = ($primary_controller)}
					<multiplayer_allowed> = 1
				endif
			endif
			if NetSessionFunc \{func = IsCableUnplugged}
				text = qs(0xab79bf04)
			elseif NetSessionFunc func = XenonIsGuest params = {controller_index = ($primary_controller)}
				text = qs(0xb9fd7c2c)
			elseif (<signed_in> = 0)
				get_signin_profile_warning_text
			elseif (<signed_in> = 1 && <multiplayer_allowed> = 0)
				text = qs(0xd840d20c)
			endif
		endif
		create_dialog_box {
			player_device = <player_device>
			body_text = <text>
			options = <array>
		}
	endswitch
	fadetoblack \{off
		time = 0.0}
endscript

script destroy_signin_warning_menu 
	destroy_dialog_box
endscript

script get_signin_profile_warning_text 
	if ui_event_exists_in_stack \{name = 'leaderboard_instrument'}
		return \{text = qs(0x1e6e2e76)}
	else
		return \{text = qs(0xee63bbfc)}
	endif
endscript

script signin_complete_callback 
	printf \{'signin_complete_callback'}
	Change \{ps3_signin_complete = 1}
endscript

script signin_warning_select_continue 
	destroy_dialog_box
	if GotParam \{ps3_boot_warning}
		ui_memcard_single_signin this_event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
	else
		ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
	endif
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
	ui_event event = menu_replace data = {state = uistate_signin new_state = ($signin_continue_state) new_data = ($signin_continue_data) allow_back = <allow_back> Jam = <Jam> musicstore = <musicstore> require_live = <require_live> downloads = <downloads> leaderboards = <leaderboards> force_signin = <force_signin>}
endscript

script signin_warning_select_cws 
	start_checking_for_signin_change
	Change \{enable_saving = 0}
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
	ui_event event = menu_replace data = {state = UIstate_boot_download_scan controller = <device_num>
		event_params = {event = menu_replace data = {state = $signin_continue_state ($signin_continue_data)}}}
	hide_glitch \{num_frames = 20}
endscript
