
script ui_create_music_central 
	SpawnScriptLater \{destroy_loading_screen}
	Change \{rich_presence_context = presence_menus}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	make_generic_barrel_menu \{texture = tv_clouds
		max_expansion = 3}
	add_generic_barrel_menu_text_item \{pad_choose_script = music_central_select_music_studio
		text = qs(0x51cb0c89)}
	add_generic_barrel_menu_text_item \{pad_choose_script = music_central_select_ghtunes
		text = qs(0x99680c13)}
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
	printf \{qs(0xd6c9e9f5)}
	musicstudio_entry_unsafe_for_shutdown_push
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ($enable_saving = 1)
		setplayerinfo \{1
			in_game = 0}
		setplayerinfo \{2
			in_game = 0}
		setplayerinfo \{3
			in_game = 0}
		setplayerinfo \{4
			in_game = 0}
		musician1 :Pause
		musician2 :Pause
		musician3 :Pause
		musician4 :Pause
		Change \{respond_to_signin_changed = 1}
		generic_menu_pad_choose_sound
		set_primary_controller device_num = <device_num> state = uistate_jam jam
		SpawnScriptNow \{menu_music_fade
			params = {
				time = 8.160001
				out
				dont_fade_crowd
			}}
	else
		LaunchEvent \{Type = unfocus
			target = current_menu}
		create_dialog_box \{use_all_controllers
			heading_text = qs(0xaa163738)
			body_text = qs(0x41efac64)
			options = [
				{
					func = main_menu_roadie_battle_destroy_error_dialog
					func_params = {
						dont_remove_helpers
					}
					text = qs(0x0e41fe46)
				}
			]}
	endif
endscript

script music_central_select_ghtunes 
	printf \{qs(0xde9a0c58)}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{respond_to_signin_changed = 1}
	if isxenonorwindx
		set_primary_controller device_num = <device_num> state = uistate_jam_ghtunes require_live = 1 jam = 3
	elseif ((isps3) || (isngc))
		set_primary_controller device_num = <device_num> state = uistate_jam_ghtunes require_live = 1
	endif
	SpawnScriptNow \{menu_music_fade
		params = {
			time = 8.160001
			out
			dont_fade_crowd
		}}
	Wait \{1
		Seconds}
endscript
