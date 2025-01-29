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
	printf \{qs(0xaab1dbb2)}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = wii_trc_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	z = 4
	get_string_wii message = <message>
	StringLength string = <option1_text>
	if (<str_len> = 0)
		create_dialog_box {
			body_text = <localized_string>
			heading_text = <header>
			dialog_pos = (640.0, 455.0)
			dialgo
		}
	else
		StringLength string = <option2_text>
		if (<str_len> = 0)
			create_dialog_box {
				body_text = <localized_string>
				heading_text = <header>
				dialog_pos = (640.0, 455.0)
				dialgo
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
		menu_music_off \{setflag = 1}
		Change \{restartmenumusic = 1}
	endif
	create_wii_saveload_screen <...>
	dumpscripts
endscript

script destroy_wii_trc_menu 
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu \{menu_id = sd_warning_scroll}
	destroy_menu \{menu_id = wii_trc_container}
	destroy_dialog_box
endscript

script refresh_wii_trc_menu 
	savegame_ui_end \{savegame = 0}
	destroy_wii_trc_menu
	create_wii_trc_menu <...>
endscript

script create_wii_trc_text 
	ScriptAssert \{'create_wii_trc_text: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script create_wii_trc_menu_options 
	ScriptAssert \{'create_wii_trc_menu_options: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_wii_trc_highlight_yes 
	retail_menu_focus \{id = trc_option_yes}
	get_trc_hilite_positions_wii \{id = trc_option_yes}
	SetScreenElementProps id = hi_left Pos = <left_hilite_pos> flip_v
	SetScreenElementProps id = hi_right Pos = <right_hilite_pos>
endscript

script menu_wii_trc_highlight_no 
	retail_menu_focus \{id = trc_option_no}
	get_trc_hilite_positions_wii \{id = trc_option_no}
	SetScreenElementProps id = hi_left Pos = <left_hilite_pos> flip_v
	SetScreenElementProps id = hi_right Pos = <right_hilite_pos>
endscript

script get_trc_hilite_positions_wii \{id = trc_option_yes}
	wii_trc_get_option_bounds id = <id>
	GetScreenElementDims \{id = hi_left}
	hilite_width = <width>
	left_hilite_pos = ((<option_left_x> - (<hilite_width> + 15)) * (1.0, 0.0) + <option_y> * (0.0, 1.0))
	right_hilite_pos = ((<option_right_x> + 15) * (1.0, 0.0) + <option_y> * (0.0, 1.0))
	return left_hilite_pos = <left_hilite_pos> right_hilite_pos = <right_hilite_pos>
endscript

script wii_trc_get_option_bounds \{id = trc_option_yes}
	GetScreenElementPosition id = <id> absolute
	GetScreenElementDims id = <id>
	option_left_x = (<screenelementpos>.(1.0, 0.0))
	option_right_x = (<option_left_x> + <width>)
	option_y = (<screenelementpos>.(0.0, 1.0))
	return <...>
endscript

script wii_trc_refit_dialog_box 
	ScriptAssert \{'wii_trc_refit_dialog_box: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
