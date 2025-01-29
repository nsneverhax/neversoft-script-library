wii_trc_menu_font = text_a4

script get_string_wii \{message = unknown}
	localized_string = qs(0x00000000)
	switch <message>
		case loading
		localized_string = qs(0x32093500)
		case saving
		localized_string = qs(0x022024dd)
		case autosaving
		localized_string = qs(0x022024dd)
		case overwriting
		localized_string = qs(0x022024dd)
		case deleting
		localized_string = qs(0x57c372f0)
		case formatting
		localized_string = qs(0xf2ad55a4)
		case load_successful
		localized_string = qs(0xeae1a950)
		case format_successful
		localized_string = qs(0xe1015ca7)
		case save_successful
		localized_string = qs(0xe546315d)
		case delete_successful
		localized_string = qs(0x78f0a884)
		case delete_failed
		localized_string = qs(0xe7fdd79f)
		case overwrite_successful
		localized_string = qs(0x6a3945f4)
		case boot_autosave_warning
		localized_string = qs(0x445ea84e)
		case check_memcard
		localized_string = qs(0x7d94867b)
		case no_memcard_boot
		localized_string = qs(0xbd253b02)
		case no_memcard_save_boot
		localized_string = qs(0xedea2ea6)
		case no_save_boot
		localized_string = qs(0x3d12bad4)
		case no_save_ingame
		localized_string = qs(0xc6aa15e8)
		case save_failed
		localized_string = qs(0xa41a877c)
		case overwrite_failed
		localized_string = qs(0xddadeaef)
		case attempt_format
		localized_string = qs(0xc440474c)
		case confirm_format
		localized_string = qs(0xf747b41c)
		case already_formatted
		localized_string = qs(0xee3455e7)
		case format_failed
		localized_string = qs(0x1d29866d)
		case format_cancelled
		localized_string = qs(0x1111a071)
		case no_memcard_ingame
		localized_string = qs(0x107c2abd)
		case load_failed
		localized_string = qs(0x13ed19b0)
		case overwrite_warning_boot
		localized_string = qs(0x34aff911)
		case disable_autosave
		localized_string = qs(0xc9c0f19a)
		case overwrite_warning_ingame
		localized_string = qs(0xdb4b6d01)
		case lose_progress_ingame
		localized_string = qs(0x4598c504)
		case insufficient_space
		localized_string = qs(0x1bc91123)
		case insufficient_space_wfc_only
		localized_string = qs(0x683dd7c3)
		case insufficient_space_jam
		localized_string = qs(0xbf3553d4)
		case insufficient_inode
		localized_string = qs(0x9df52958)
		case insufficient_inode_wfc_only
		localized_string = qs(0x67b5aaea)
		case insufficient_inode_jam
		localized_string = qs(0xb877ec67)
		case corrupt_boot
		localized_string = qs(0x41308d43)
		case confirm_overwrite_boot
		localized_string = qs(0x709d9856)
		case new_memcard_ingame
		localized_string = qs(0x6b7bf6f2)
		case warning_480p
		localized_string = qs(0x7cedf58b)
		case now_in_480p
		localized_string = qs(0xd919ade9)
		case mii_channel_corrupt
		localized_string = qs(0x2d2c1532)
		case 0x04e32910
		localized_string = qs(0x66ff384c)
		case 0xd4b8e2fa
		localized_string = qs(0x448b859a)
		default
		printf qs(0xc0780dc8) d = <message>
		localized_string = qs(0x4b8729ef)
	endswitch
	return localized_string = <localized_string>
endscript

script create_wii_saveload_screen \{header = qs(0xaa163738)
		message = qs(0x00000000)
		option1_text = qs(0x03ac90f0)
		option2_text = qs(0x03ac90f0)
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
		create_popup_warning_menu {
			textblock = {
				text = <localized_string>
				Pos = (640.0, 380.0)
				Scale = 0.6
			}
			title = <header>
			menu_pos = (640.0, 465.0)
			dialog_pos = (640.0, 455.0)
			dialgo
		}
	else
		StringLength string = <option2_text>
		if (<str_len> = 0)
			create_popup_warning_menu {
				textblock = {
					text = <localized_string>
					Pos = (640.0, 380.0)
					Scale = 0.6
				}
				title = <header>
				menu_pos = (640.0, 465.0)
				dialog_pos = (640.0, 455.0)
				dialgo
				options = [
					{
						func = {<option1_script> params = {<option1_params>}}
						text = <option1_text>
					}
				]
			}
		else
			create_popup_warning_menu {
				textblock = {
					text = <localized_string>
					Pos = (640.0, 380.0)
					Scale = 0.6
				}
				title = <header>
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
	endif
	if 0x8658e568
		destroy_loading_screen
	endif
endscript

script destroy_wii_saveload_screen 
	destroy_wii_trc_menu
endscript

script create_wii_trc_menu \{header = qs(0x00000000)
		message = qs(0x00000000)
		option1_text = qs(0x03ac90f0)
		option2_text = qs(0x03ac90f0)
		option1_script = empty_script
		option2_script = empty_script
		option1_params = {
		}
		option2_params = {
		}}
	if ($wii_nosave_onboot = 1)
		jam_save_song_unload
	endif
	Wait \{1
		gameframes}
	if ($ismenumusicon = 1)
		menu_music_off \{setflag = 1}
		Change \{restartmenumusic = 1}
	endif
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
	create_wii_saveload_screen <...>
	set_focus_color \{rgba = [
			130
			0
			0
			250
		]}
	set_unfocus_color \{rgba = $default_menu_unfocus_color}
	offwhite = [223 223 223 255]
	z = 4
	displaySprite id = trc_dialog_top parent = wii_trc_container tex = Dialog_BG Pos = (430.0, 500.0) dims = (440.0, 75.0) z = <z>
	displaySprite id = trc_dialog_bottom parent = wii_trc_container tex = Dialog_BG flip_h Pos = (430.0, 565.0) dims = (440.0, 75.0) z = <z>
	displaySprite id = hi_right parent = wii_trc_container tex = Dialog_Highlight Pos = (770.0, 573.0) Scale = (1.0, 1.0) z = (<z> + 0.3)
	displaySprite id = hi_left parent = wii_trc_container tex = Dialog_Highlight flip_v Pos = (500.0, 573.0) Scale = (1.0, 1.0) z = (<z> + 0.3)
	dumpscripts
endscript

script destroy_wii_trc_menu 
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu \{menu_id = sd_warning_scroll}
	destroy_menu \{menu_id = wii_trc_container}
	destroy_popup_warning_menu
endscript

script refresh_wii_trc_menu 
	destroy_wii_trc_menu
	create_wii_trc_menu <...>
endscript

script create_wii_trc_text 
	CreateScreenElement {
		Type = TextElement
		id = 0x35368cfa
		font = ($wii_trc_menu_font)
		text = <header>
		just = [center center]
		Pos = (640.0, 100.0)
		Scale = 1.1
		parent = wii_trc_container
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
		font = ($wii_trc_menu_font)
		text = <header>
		just = [center center]
		Pos = (640.0, 105.0)
		Scale = 1.1
		parent = wii_trc_container
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
		font = ($wii_trc_menu_font)
		text = <message>
		just = [center center]
		Pos = (640.0, 340.0)
		dims = (900.0, 600.0)
		Scale = 0.83
		parent = wii_trc_container
		rgba = [200 200 200 250]
		Shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 6
	}
endscript

script create_wii_trc_menu_options 
	CreateScreenElement {
		Type = TextElement
		font = ($wii_trc_menu_font)
		parent = sd_warning_vmenu
		text = <option1_text>
		just = [center top]
		Scale = (0.75, 0.85)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus menu_wii_trc_highlight_yes}
			{unfocus retail_menu_unfocus}
			{pad_choose <option1_script> params = <option1_params>}
		]
		z_priority = 5
		id = trc_option_yes
	}
	StringLength string = <option2_text>
	if NOT (<str_len> = 0)
		CreateScreenElement {
			Type = TextElement
			font = ($wii_trc_menu_font)
			parent = sd_warning_vmenu
			text = <option2_text>
			just = [center top]
			Scale = (0.75, 0.85)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus menu_wii_trc_highlight_no}
				{unfocus retail_menu_unfocus}
				{pad_choose <option2_script> params = <option2_params>}
			]
			z_priority = 5
			id = trc_option_no
		}
	endif
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
	if ScreenElementExists \{id = trc_option_yes}
		wii_trc_get_option_bounds \{id = trc_option_yes}
		left_x = <option_left_x>
		right_x = <option_right_x>
	endif
	if ScreenElementExists \{id = trc_option_no}
		wii_trc_get_option_bounds \{id = trc_option_no}
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
