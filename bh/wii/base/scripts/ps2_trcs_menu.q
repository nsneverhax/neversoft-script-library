ps2_trc_menu_font = text_a4

script create_ps2_saveload_screen \{header = qs(0x00000000)
		message = qs(0x00000000)
		option1_text = qs(0x00000000)
		option2_text = qs(0x00000000)
		option1_script = empty_script
		option2_script = empty_script
		option1_params = {
		}
		option2_params = {
		}}
	if ($menu_music_on_flag = 1)
		menu_music_off
		Change \{restartmenumusic = 1}
	endif
	printf \{qs(0xfd135903)}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = ps2_trc_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	z = 4
	GetPlatform
	if (<Platform> = PS2)
		get_string_ps2 message = <message>
		if (<message> = insufficient_space_ingame)
			savefailedduetoinsufficientspace
			printf qs(0x5c5b6735) s = <localized_string> d = <SpaceRequired>
			formatText TextName = localized_string <localized_string> d = <SpaceRequired>
			printstruct <...>
		endif
	else
		get_string_wii message = <message>
	endif
	text_params = {
		header = <header>
		message = <localized_string>
	}
	StringLength string = <option1_text>
	if (<str_len> = 0)
		create_dialog_box {
			body_text = <localized_string>
			dialog_pos = (640.0, 455.0)
			dialgo
		}
	else
		create_dialog_box {
			body_text = <localized_string>
			dialog_pos = (640.0, 455.0)
			dialgo
			options = [
				{
					func = <option1_script>
					func_params = <option1_params>
					text = <option1_text>
				}
				{
					func = <option2_script>
					func_params = <option2_params>
					text = <option2_text>
				}
			]
		}
	endif
endscript

script destroy_ps2_saveload_screen 
	destroy_ps2_trc_menu
endscript

script create_ps2_trc_menu \{header = qs(0x00000000)
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
	CreateScreenElement \{Type = VScrollingMenu
		parent = root_window
		id = sd_warning_scroll
		just = [
			center
			top
		]
		dims = (1280.0, 200.0)
		Pos = (1280.0, 535.0)
		z_priority = 1}
	CreateScreenElement \{Type = VMenu
		parent = sd_warning_scroll
		id = sd_warning_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		internal_just = [
			center
			top
		]
		event_handlers = $default_event_handlers}
	create_ps2_saveload_screen <...>
	set_focus_color \{rgba = [
			130
			0
			0
			250
		]}
	set_unfocus_color \{rgba = $default_menu_unfocus_color}
	offwhite = [223 223 223 255]
	z = 4
	displaySprite id = trc_dialog_top parent = ps2_trc_container tex = Dialog_BG Pos = (430.0, 500.0) dims = (440.0, 75.0) z = <z>
	displaySprite id = trc_dialog_bottom parent = ps2_trc_container tex = Dialog_BG flip_h Pos = (430.0, 565.0) dims = (440.0, 75.0) z = <z>
	displaySprite id = hi_right parent = ps2_trc_container tex = Dialog_Highlight Pos = (770.0, 573.0) Scale = (1.0, 1.0) z = (<z> + 0.3)
	displaySprite id = hi_left parent = ps2_trc_container tex = Dialog_Highlight flip_v Pos = (500.0, 573.0) Scale = (1.0, 1.0) z = (<z> + 0.3)
	create_pause_menu_frame
	if GotParam \{check_for_memcard_pulled}
		printf \{'spawning check_for_memcard_pulled'}
		SpawnScriptNow \{check_for_memcard_pulled}
	endif
endscript

script destroy_ps2_trc_menu 
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu \{menu_id = sd_warning_scroll}
	destroy_menu \{menu_id = ps2_trc_container}
	printf \{'killing check_for_memcard_pulled (if it exists)'}
	KillSpawnedScript \{Name = check_for_memcard_pulled}
	destroy_dialog_box
endscript

script refresh_ps2_trc_menu 
	destroy_ps2_trc_menu
	create_ps2_trc_menu <...>
endscript

script check_for_memcard_pulled 
	card_in_slot = 0
	begin
	if CardIsInSlot
		card_in_slot = 1
	else
		if (<card_in_slot> = 1)
			printf \{'card was pulled, bailing out'}
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = memcard_pulled
				}}
			return
		endif
		card_in_slot = 0
	endif
	WaitOneGameFrame
	repeat
endscript

script create_ps2_trc_text 
	ScriptAssert \{'create_ps2_trc_text: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script create_ps2_trc_menu_options 
	ScriptAssert \{'create_ps2_trc_menu_options: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_ps2_trc_highlight_yes 
	retail_menu_focus \{id = trc_option_yes}
	get_trc_hilite_positions \{id = trc_option_yes}
	SetScreenElementProps id = hi_left Pos = <left_hilite_pos> flip_v
	SetScreenElementProps id = hi_right Pos = <right_hilite_pos>
endscript

script menu_ps2_trc_highlight_no 
	retail_menu_focus \{id = trc_option_no}
	get_trc_hilite_positions \{id = trc_option_no}
	SetScreenElementProps id = hi_left Pos = <left_hilite_pos> flip_v
	SetScreenElementProps id = hi_right Pos = <right_hilite_pos>
endscript

script get_trc_hilite_positions \{id = trc_option_yes}
	ps2_trc_get_option_bounds id = <id>
	GetScreenElementDims \{id = hi_left}
	hilite_width = <width>
	left_hilite_pos = ((<option_left_x> - (<hilite_width> + 15)) * (1.0, 0.0) + <option_y> * (0.0, 1.0))
	right_hilite_pos = ((<option_right_x> + 15) * (1.0, 0.0) + <option_y> * (0.0, 1.0))
	return left_hilite_pos = <left_hilite_pos> right_hilite_pos = <right_hilite_pos>
endscript

script ps2_trc_get_option_bounds \{id = trc_option_yes}
	GetScreenElementPosition id = <id> absolute
	GetScreenElementDims id = <id>
	option_left_x = (<screenelementpos>.(1.0, 0.0))
	option_right_x = (<option_left_x> + <width>)
	option_y = (<screenelementpos>.(0.0, 1.0))
	return <...>
endscript

script ps2_trc_refit_dialog_box 
	ScriptAssert \{'ps2_trc_refit_dialog_box: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
