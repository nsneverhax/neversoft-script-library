
script music_central_select_music_studio 
	destroy_friend_feed
	universal_help_display_help_check device_num = <device_num> help_context = gh_studio
	if (<show_help_page> = 1)
		set_primary_controller device_num = <device_num> event = <event> state = uistate_universal_help jam data = {
			next_state_script = music_central_enter_music_central
			next_state_params = {
				from_help = 1
				device_num = <device_num>
			}
			help_global_index = <help_index>
			device_num = <device_num>
			show_mainmenu_bg = 1
		}
	else
		music_central_enter_music_central from_help = 0 device_num = <device_num>
	endif
endscript

script music_central_enter_music_central \{from_help = 0
		device_num = !i1768515945}
	net_counter_increment \{counter_name = globalcounter_music_studio}
	pushunsafeforshutdown \{context = enter_music_central
		Type = unchecked}
	printf \{qs(0xd6c9e9f5)}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{respond_to_signin_changed = 1}
	if (<from_help> = 1)
		ui_event \{event = menu_replace
			state = uistate_jam}
	else
		set_primary_controller {
			device_num = <device_num>
			state = uistate_jam
			data = {
				device_num = <device_num>
				from_main_menu
			}
		}
	endif
	Wait \{1
		Seconds}
endscript
