wii_trc_menu_font = text_a4

script create_wii_saveload_screen \{header = qs(0xaa163738)
		message = qs(0x00000000)
		option1_text = qs(0x00000000)
		option2_text = qs(0x00000000)
		option1_script = empty_script
		option2_script = empty_script
		option1_params = {
		}
		option2_params = {
		}}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = wii_trc_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	dlg_z_priority = 60000
	get_string_wii message = <message>
	StringLength string = <option1_text>
	if (<str_len> = 0)
		create_dialog_box {
			body_text = <localized_string>
			heading_text = <header>
			dialog_pos = (640.0, 455.0)
			dialgo
			dlg_z_priority = <dlg_z_priority>
		}
	else
		StringLength string = <option2_text>
		if (<str_len> = 0)
			create_dialog_box {
				body_text = <localized_string>
				heading_text = <header>
				dialog_pos = (640.0, 455.0)
				dialgo
				dlg_z_priority = <dlg_z_priority>
				options = [
					{
						func = <option1_script>
						func_params = <option1_params>
						text = <option1_text>
					}
				]
			}
		else
			create_dialog_box {
				body_text = <localized_string>
				heading_text = <header>
				dialog_pos = (640.0, 455.0)
				dialgo
				dlg_z_priority = <dlg_z_priority>
				template = trc
				options = [
					{
						func = <option1_script>
						func_params = <option1_params>
						text = <option1_text>
						id = dialog_option1_id
					}
					{
						func = <option2_script>
						func_params = <option2_params>
						text = <option2_text>
						id = dialog_option2_id
					}
				]
			}
		endif
	endif
endscript

script destroy_wii_saveload_screen 
	savegame_ui_end \{savegame = 0}
	destroy_wii_trc_menu
endscript

script create_wii_trc_menu \{header = qs(0x00000000)
		message = qs(0x00000000)
		option1_text = qs(0x00000000)
		option2_text = qs(0x00000000)
		option1_script = empty_script
		option2_script = empty_script
		option1_params = {
		}
		option2_params = {
		}}
	Wait \{1
		gameframes}
	if ($ismenumusicon = 1)
		audio_ui_menu_music_off \{setflag = 1}
		Change \{restartmenumusic = 1}
	endif
	create_wii_saveload_screen <...>
endscript

script destroy_wii_trc_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = sd_warning_scroll}
	destroy_menu \{menu_id = wii_trc_container}
	destroy_dialog_box
endscript

script refresh_wii_trc_menu 
	savegame_ui_end \{savegame = 0}
	destroy_wii_trc_menu
	create_wii_trc_menu <...>
endscript
