
script create_leaving_lobby_dialog \{vmenu_id = leaving_lobby_dialog_vmenu
		pad_back_script = return_to_character_select_from_net_warning
		pad_choose_script = net_warning_guit_net_game
		Pos = (640.0, 520.0)
		z = 110}
	if (($ui_flow_manager_state [0]) = online_pause_fs)
		clean_up_user_control_helpers
	endif
	go_to_net_warning_from_pause_menu
	if ScreenElementExists \{id = vmenu_character_select_p1}
		LaunchEvent \{Type = unfocus
			target = vmenu_character_select_p1}
	endif
	<menu_pos> = (575.0, 487.0)
	SoundEvent \{event = Generic_Menu_Back_SFX}
	create_popup_warning_menu {
		textblock = {
			text = "You are about to leave the current game. Are you sure you want to leave?"
			dims = (700.0, 320.0)
			Scale = 0.6
		}
		no_background
		menu_pos = <menu_pos>
		dialog_dims = (600.0, 80.0)
		pad_back_script = <pad_back_script>
		options = [
			{
				func = <pad_back_script>
				text = "NO"
			}
			{
				func = <pad_choose_script> params = <pad_choose_params>
				text = "YES"
			}
		]
	}
	if (($ui_flow_manager_state [0]) = online_pause_fs)
		Change \{user_control_pill_text_color = [
				0
				0
				0
				255
			]}
		Change \{user_control_pill_color = [
				180
				180
				180
				255
			]}
		add_user_control_helper text = "SELECT" button = green z = (<z> - 10)
		add_user_control_helper text = "BACK" button = red z = (<z> - 10)
		add_user_control_helper text = "UP/DOWN" button = strumbar z = (<z> - 10)
	endif
endscript

script net_cs_go_back 
	if (<Player> = 1)
		create_leaving_lobby_dialog \{z = 300
			parent = menu_container}
	else
		drop_client_from_character_select
		if IsHost
			net_lobby_state_message \{current_state = character_hub
				action = request
				request_state = leaving_lobby}
		endif
	endif
endscript

script net_warning_guit_net_game 
	destroy_popup_warning_menu
	destroy_net_popup
	EndGameNetScriptPump
	KillSpawnedScript \{Name = net_hub_stream}
	destroy_ready_icons
	cs_go_back \{params = {
			Player = 1
		}}
endscript

script return_to_character_select_from_net_warning 
	SoundEvent \{event = Generic_Menu_Back_SFX}
	destroy_popup_warning_menu
	if ScreenElementExists \{id = vmenu_character_select_p1}
		LaunchEvent \{Type = focus
			target = vmenu_character_select_p1}
	endif
endscript

script go_to_net_warning_from_pause_menu 
	if ScreenElementExists \{id = pause_menu_frame_container}
		destroy_menu \{menu_id = scrolling_pause}
		destroy_menu \{menu_id = pause_menu_frame_container}
		KillSpawnedScript \{Name = animate_bunny_flame}
	endif
endscript

script return_to_pause_menu_from_net_warning 
	SoundEvent \{event = Generic_Menu_Back_SFX}
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	create_pause_menu
endscript

script pause_menu_really_quit_net_game 
	destroy_popup_warning_menu
	ui_flow_manager_respond_to_action \{action = select_quit
		create_params = {
			Player = 1
		}}
endscript
