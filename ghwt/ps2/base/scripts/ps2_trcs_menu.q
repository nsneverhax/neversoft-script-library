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
		Change \{restartmenumusic = 1}
	endif
	menu_music_off

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
	StringLength string = <option1_text>
	if (<str_len> = 0)
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
					func = {<option1_script> params = {<option1_params>}}
					text = <option1_text>
				}
				{
					func = {<option2_script> params = {<option2_params>}}
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
	add_user_control_helper \{text = qs(0x643800a7)
		button = strumbar
		z = 100}
	if GotParam \{check_for_memcard_pulled}

		SpawnScriptNow \{check_for_memcard_pulled}
	endif
endscript

script destroy_ps2_trc_menu 
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu \{menu_id = sd_warning_scroll}
	destroy_menu \{menu_id = ps2_trc_container}

	KillSpawnedScript \{Name = check_for_memcard_pulled}
	destroy_popup_warning_menu
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
	CreateScreenElement {
		Type = TextElement
		id = 0x35368cfa
		font = ($ps2_trc_menu_font)
		text = <header>
		just = [center center]
		Pos = (640.0, 100.0)
		Scale = 1.1
		parent = ps2_trc_container
		rgba = [200 200 200 255]
		Shadow
		shadow_offs = (4.0, 4.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 6
	}
	GetScreenElementDims \{id = 0x35368cfa}
	fit_text_in_rectangle id = 0x35368cfa only_if_larger_x = 1 dims = ((400.0, 0.0) + <height> * (0.0, 1.0))
	CreateScreenElement {
		Type = TextElement
		font = ($ps2_trc_menu_font)
		text = <header>
		just = [center center]
		Pos = (640.0, 105.0)
		Scale = 1.1
		parent = ps2_trc_container
		rgba = [0 0 0 0]
		Shadow
		shadow_offs = (-4.0, -1.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 6
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((400.0, 0.0) + <height> * (0.0, 1.0))
	CreateScreenElement {
		Type = TextBlockElement
		font = ($ps2_trc_menu_font)
		text = <message>
		just = [center center]
		Pos = (640.0, 340.0)
		dims = (900.0, 600.0)
		Scale = 0.83
		parent = ps2_trc_container
		rgba = [200 200 200 250]
		Shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 6
	}
endscript

script create_ps2_trc_menu_options 
	CreateScreenElement {
		Type = TextElement
		font = ($ps2_trc_menu_font)
		parent = sd_warning_vmenu
		text = <option1_text>
		just = [center top]
		Scale = (0.75, 0.85)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus menu_ps2_trc_highlight_yes}
			{unfocus retail_menu_unfocus}
			{pad_choose <option1_script> params = <option1_params>}
		]
		z_priority = 5
		id = trc_option_yes
	}
	CreateScreenElement {
		Type = TextElement
		font = ($ps2_trc_menu_font)
		parent = sd_warning_vmenu
		text = <option2_text>
		just = [center top]
		Scale = (0.75, 0.85)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus menu_ps2_trc_highlight_no}
			{unfocus retail_menu_unfocus}
			{pad_choose <option2_script> params = <option2_params>}
		]
		z_priority = 5
		id = trc_option_no
	}
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
	if ScreenElementExists \{id = trc_option_yes}
		ps2_trc_get_option_bounds \{id = trc_option_yes}
		left_x = <option_left_x>
		right_x = <option_right_x>
	endif
	if ScreenElementExists \{id = trc_option_no}
		ps2_trc_get_option_bounds \{id = trc_option_no}
		if GotParam \{left_x}
			if (<option_left_x> < <left_x>)
				<left_x> = <option_left_x>
			endif
			if (<option_right_x> > <right_x>)
				<right_x> = <option_right_x>
			endif
		endif
	endif
	if GotParam \{left_x}
		0xf21596b2 = ((<right_x> - <left_x>) * 0.5)
		SetScreenElementProps id = sd_warning_vmenu Pos = ((-1.0, 0.0) * <0xf21596b2> + (0.0, 1.0))
		left_x = (<left_x> - 68)
		right_x = (<right_x> + 68)
		0x56edb000 = (<left_x> - 30 - <0xf21596b2>)
		0xd7d9e9a5 = (<right_x> + 30 - <0xf21596b2>)
		0xb8ab4b07 = (<0xd7d9e9a5> - <0x56edb000>)
		GetScreenElementPosition \{id = trc_dialog_top}
		GetScreenElementDims \{id = trc_dialog_top}
		0x792eb1dc = (<screenelementpos>.(0.0, 1.0))
		SetScreenElementProps id = trc_dialog_top Pos = (<0x56edb000> * (1.0, 0.0) + <0x792eb1dc> * (0.0, 1.0)) dims = (<0xb8ab4b07> * (1.0, 0.0) + <height> * (0.0, 1.0)) just = [left top]
		GetScreenElementPosition \{id = trc_dialog_bottom}
		0x1348e287 = (<screenelementpos>.(0.0, 1.0))
		SetScreenElementProps id = trc_dialog_bottom Pos = (<0x56edb000> * (1.0, 0.0) + <0x1348e287> * (0.0, 1.0)) dims = (<0xb8ab4b07> * (1.0, 0.0) + <height> * (0.0, 1.0)) just = [left top] flip_h
	endif
endscript
