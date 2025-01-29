ps2_trc_menu_font = text_a4

script create_ps2_saveload_screen 

	if ($menu_music_on_flag = 1)
		Change \{restartmenumusic = 1}
	endif
	menu_music_off
	AddParams (<...>.$0xafe47fe2)

	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = ps2_trc_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	z = 4
	get_string_ps2 message = <message>
	text_params = {
		header = <header>
		message = <localized_string>
	}
	if NOT GotParam \{option1_text}
		create_popup_warning_menu {
			title = <header>
			textblock = {
				text = <localized_string>
				Pos = (640.0, 380.0)
				Scale = 0.6
			}
			menu_pos = (640.0, 465.0)
			dialog_pos = (640.0, 455.0)
			dialgo
		}
	else
		create_popup_warning_menu {
			title = <header>
			textblock = {
				text = <localized_string>
				Pos = (640.0, 380.0)
				Scale = 0.6
			}
			menu_pos = (640.0, 465.0)
			dialog_pos = (640.0, 455.0)
			dialgo
			options = [
				{
					func = {ui_flow_manager_respond_to_action params = {action = <0x9c953112>}}
					text = <option1_text>
				}
				{
					func = {ui_flow_manager_respond_to_action params = {action = <0x121a36f1>}}
					text = <option2_text>
				}
			]
		}
	endif
endscript

script destroy_ps2_saveload_screen 
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu \{menu_id = sd_warning_scroll}
	destroy_menu \{menu_id = ps2_trc_container}
	destroy_popup_warning_menu
endscript

script refresh_ps2_trc_menu 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	if GotParam \{0x81a048de}
		Wait <0x81a048de> Seconds
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = continue
			}}
	endif
endscript
