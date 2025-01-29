
script music_central_select_music_studio 
	if NOT ($enable_saving = 1)
		LaunchEvent \{Type = unfocus
			target = current_menu}
		create_dialog_box \{use_all_controllers
			heading_text = qs(0xaa163738)
			body_text = qs(0xe00c5c16)
			options = [
				{
					func = main_menu_roadie_battle_destroy_error_dialog
					func_params = {
						dont_remove_helpers
					}
					text = qs(0x0e41fe46)
				}
			]}
		return
	endif
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
			require_signin = 0
		}
	else
		music_central_enter_music_central from_help = 0 device_num = <device_num>
	endif
	destroy_friend_feed
endscript

script music_central_enter_music_central \{from_help = 0
		device_num = !i1768515945}
	<event> = menu_change
	if (<from_help> = 1)
		<event> = menu_replace
	endif
	net_counter_increment \{counter_name = globalcounter_music_studio}
	pushunsafeforshutdown \{context = enter_music_central
		Type = unchecked}
	printf \{qs(0xd6c9e9f5)}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{respond_to_signin_changed = 1}
	ui_event event = <event> state = uistate_jam
	Wait \{1
		Seconds}
endscript
