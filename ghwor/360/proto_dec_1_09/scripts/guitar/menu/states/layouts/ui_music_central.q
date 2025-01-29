
script ui_create_music_central 
	destroy_loading_screen
	Change \{rich_presence_context = presence_menus}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	make_generic_barrel_menu \{max_expansion = 3}
	add_generic_barrel_menu_text_item \{pad_choose_script = music_central_select_music_studio
		text = qs(0x51cb0c89)}
	add_generic_barrel_menu_text_item \{pad_choose_script = music_central_select_ghtunes
		text = qs(0x81c70ffe)}
	set_focus_color
	set_unfocus_color
	generic_barrel_menu_finish
	if GotParam \{vmenu_id}
		AssignAlias id = <vmenu_id> alias = current_menu
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_music_central 
	clean_up_user_control_helpers
	destroy_generic_barrel_menu
endscript

script ui_deinit_music_central 
	deinit_jam_audio
endscript

script music_central_select_music_studio 
	universal_help_display_help_check device_num = <device_num> help_context = gh_studio
	if (<show_help_page> = 1)
		generic_event_choose {
			state = uistate_universal_help
			data = {
				next_state_script = music_central_enter_music_central
				next_state_params = {
					from_help = 1
					device_num = <device_num>
				}
				help_global_index = <help_index>
				device_num = <device_num>
			}
		}
	else
		music_central_enter_music_central from_help = 0 device_num = <device_num>
	endif
endscript

script music_central_enter_music_central \{from_help = 0
		device_num = !i1768515945}
	<event> = menu_change
	if (<from_help> = 1)
		<event> = menu_replace
	endif
	pushunsafeforshutdown \{context = enter_music_central
		Type = unchecked}
	printf \{qs(0xd6c9e9f5)}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{respond_to_signin_changed = 1}
	set_primary_controller device_num = <device_num> event = <event> state = uistate_jam jam
	SpawnScriptNow \{audio_ui_fade_menu_music
		params = {
			time = 8.160001
			out
			dont_fade_crowd
		}}
	Wait \{1
		Seconds}
endscript

script music_central_select_ghtunes 
	printf \{qs(0xde9a0c58)}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{respond_to_signin_changed = 1}
	if isxenonorwindx
		set_primary_controller device_num = <device_num> state = uistate_jam_ghtunes require_live = 1 jam = 3
	elseif isps3
		set_primary_controller device_num = <device_num> state = uistate_jam_ghtunes require_live = 1
	endif
	SpawnScriptNow \{audio_ui_fade_menu_music
		params = {
			time = 8.160001
			out
			dont_fade_crowd
		}}
	Wait \{1
		Seconds}
endscript
