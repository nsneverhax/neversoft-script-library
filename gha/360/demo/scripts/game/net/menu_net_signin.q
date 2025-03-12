online_signin_autoload_required = 0

script create_online_signin_splash 
	create_menu_backdrop \{texture = online_background}
	begin
	if ($net_safe_to_enter_net_play = 1)
		break
	else
		wait \{0.5
			seconds}
	endif
	repeat
	wait \{2
		frames}
	change \{online_signin_autoload_required = 0}
	if checkforsignin
		netsessionfunc \{func = onlinesignin}
	else
		if isxenon
			warning_options = [{func = online_signin_select_signin text = "SIGN IN"} {func = online_signin_select_cancel text = "CANCEL"}]
			if isxenon
				if (netsessionfunc func = is_cable_unplugged)
					sign_in_text = "Unable to connect to Xbox LIVE. Please check your network connection and settings and try again."
					warning_options = [{func = online_signin_select_cancel text = "CONTINUE"}]
				elseif (checkforsignin local)
					sign_in_text = "You are currently not signed into Xbox LIVE or the current gamer profile is not enabled for Xbox LIVE multiplayer game play."
				else
					sign_in_text = "No gamer profile currently signed in. Please sign into an Xbox LIVE multiplayer enabled gamer profile to continue."
				endif
			else
				sign_in_text = "The current profile does not have permission to enter the lobby."
			endif
			if screenelementexists \{id = popup_warning_container}
				return
			endif
			create_popup_warning_menu {
				textblock = {
					text = <sign_in_text>
					dims = (700.0, 320.0)
					scale = 0.6
				}
				no_background
				menu_pos = (640.0, 465.0)
				dialog_dims = (600.0, 80.0)
				helper_pills = [select updown]
				options = <warning_options>
			}
		else
			netsessionfunc \{func = onlinesignin}
		endif
	endif
endscript

script destroy_online_signin_splash 
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script online_signin_select_signin 
	change \{online_signin_autoload_required = 1}
	netsessionfunc \{func = onlinesignin}
endscript

script online_signin_select_cancel 
	ui_flow_manager_respond_to_action \{action = cancel}
endscript
