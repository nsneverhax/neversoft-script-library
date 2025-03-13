g_social_networks_to_setup = [
]

script ui_init_social_networks_setup 
	lockglobaltags \{off}
	lockglobaltags \{freeplay_check_off}
endscript

script ui_deinit_social_networks_setup 
	lockglobaltags \{freeplay_check_on}
	lockglobaltags
endscript

script ui_create_social_networks_setup 
	printf qs(0x1cb96a96) d = ($invite_controller)
	netsessionfunc \{obj = live_settings
		func = get_settings}
	change \{rich_presence_context = presence_menus}
	if ($g_skip_social_networks = 1 || $invite_controller != -1)
		printf \{qs(0x102061a6)}
		hide_glitch \{num_frames = 4}
		facebook_figure_out_can_post controller_index = ($primary_controller)
		twitter_figure_out_can_post controller_index = ($primary_controller)
		ui_event_wait \{event = menu_change
			state = uistate_mainmenu}
		return
	elseif NOT checkforsignin controller_index = ($primary_controller)
		printf \{qs(0xb98c1844)}
		hide_glitch \{num_frames = 4}
		ui_event_wait \{event = menu_change
			state = uistate_mainmenu}
		return
	elseif netsessionfunc \{func = iscableunplugged}
		printf \{qs(0x6fec41fc)}
		hide_glitch \{num_frames = 4}
		ui_event_wait \{event = menu_change
			state = uistate_mainmenu}
		return
	elseif NOT social_networks_is_first_boot controller = ($primary_controller)
		printf \{qs(0x4fe1840d)}
		hide_glitch \{num_frames = 4}
		facebook_figure_out_can_post controller_index = ($primary_controller)
		twitter_figure_out_can_post controller_index = ($primary_controller)
		ui_event_wait \{event = menu_change
			state = uistate_mainmenu}
		return
	elseif isps3
		if NOT netsessionfunc \{obj = voice
				func = voice_allowed}
			printf \{qs(0x67931e9e)}
			hide_glitch \{num_frames = 4}
			ui_event_wait \{event = menu_change
				state = uistate_mainmenu}
			return
		endif
	elseif isxenon
		if netsessionfunc func = xenonisguest params = {controller_index = ($primary_controller)}
			printf \{qs(0x8738386b)}
			hide_glitch \{num_frames = 4}
			ui_event_wait \{event = menu_change
				state = uistate_mainmenu}
			return
		endif
	endif
	create_mainmenu_bg
	pushunsafeforshutdown \{context = ui_create_social_networks_setup}
	<i_loop_num> = 0
	netsessionfunc \{func = is_lobby_available}
	begin
	if netsessionfunc \{func = is_lobby_available}
		netsessionfunc \{obj = live_settings
			func = get_settings}
		break
	else
		if (<is_connecting> = 0)
			printf \{qs(0x6313c544)}
		endif
	endif
	if (<i_loop_num> = 0)
		savegame_ui_begin \{text = qs(0xceb9ba61)
			type = network}
	endif
	<i_loop_num> = (<i_loop_num> + 1)
	wait \{1
		second}
	printf \{'waiting in ui_create_social_networks_setup'}
	repeat 6
	if (<i_loop_num> > 0)
		savegame_ui_end
	endif
	popunsafeforshutdown \{context = ui_create_social_networks_setup}
	twitter_figure_out_can_post controller_index = ($primary_controller) callback = ui_social_networks_handle_twitter_setup_check
endscript

script ui_social_networks_handle_twitter_setup_check 
	printf \{qs(0x35bfc63f)}
	if checksumequals a = <result> b = success
		facebook_figure_out_can_post controller_index = ($primary_controller) callback = ui_social_networks_handle_facebook_setup_check
	else
		printf \{qs(0xf7966c7e)}
		ui_social_networks_handle_facebook_setup_check
	endif
endscript

script ui_social_networks_handle_facebook_setup_check 
	printf \{qs(0x0d238718)}
	if ui_event_exists_in_stack \{name = 'social_networks_setup'}
		social_networks_did_first_boot
		if NOT facebook_check_is_registered_flag
			if NOT twitter_check_is_registered_flag
				formattext textname = body_text qs(0x3dd423a8) f = ($g_facebook_string) t = ($g_twitter_string)
				create_dialog_box {
					no_background
					heading_text = qs(0xc99e9c3d)
					body_text = <body_text>
					options = [
						{
							text = qs(0x207351f3)
							func = ui_social_networks_setup_start
							func_params = {networks = [facebook twitter]}
						}
						{
							text = qs(0x0769b846)
							func = ui_memcard_autosave
							func_params = {event = menu_replace state = uistate_mainmenu show_mainmenu_bg = 1}
						}
					]
				}
				ui_sfx \{menustate = universalpopup
					uitype = select}
			else
				ui_event_wait \{event = menu_change
					state = uistate_mainmenu}
			endif
		else
			ui_event_wait \{event = menu_change
				state = uistate_mainmenu}
		endif
	endif
endscript

script ui_destroy_social_networks_setup 
	destroy_mainmenu_bg
	destroy_dialog_box
endscript

script ui_social_networks_setup_start \{networks = !a1768515945}
	change g_social_networks_to_setup = <networks>
	ui_social_networks_setup_continue
endscript

script ui_social_networks_setup_continue 
	getarraysize ($g_social_networks_to_setup)
	if (<array_size> = 0)
		ui_memcard_autosave_replace \{event = menu_replace
			state = uistate_mainmenu
			show_mainmenu_bg = 1}
		return
	endif
	<element> = ($g_social_networks_to_setup [0])
	removearrayelement array = ($g_social_networks_to_setup) index = 0
	change g_social_networks_to_setup = <array>
	<data> = {is_popup from_boot = 1 back_script = ui_social_networks_setup_continue next_state_params = {from_boot = 1}}
	switch <element>
		case facebook
		<data> = {<data> type = facebook next_state = uistate_options_facebook}
		heading_text = qs(0x1893f291)
		body_text = qs(0x1c5d476d)
		facebook_set_info controller = ($primary_controller) element = broadcast_enabled value = 1
		setup_text = qs(0xf2f5ef0e)
		case twitter
		<data> = {<data> type = twitter next_state = uistate_options_twitter}
		formattext textname = heading_text qs(0x77f9ec80) t = ($g_twitter_string)
		body_text = qs(0x1d93f8e7)
		twitter_set_info controller = ($primary_controller) element = broadcast_enabled value = 1
		setup_text = qs(0xe2a3eed1)
		default
		scriptassert \{qs(0x494fbb05)}
	endswitch
	generic_event_replace state = uistate_generic_dialog_box data = {
		no_background
		show_mainmenu_bg = 1
		heading_text = <heading_text>
		body_text = <body_text>
		options = [
			{
				text = <setup_text>
				func = generic_event_replace
				func_params = {state = uistate_privacy_policy data = <data>}
			}
			{
				text = qs(0xce9c6fec)
				func = ui_social_networks_setup_continue
			}
		]
	}
endscript
