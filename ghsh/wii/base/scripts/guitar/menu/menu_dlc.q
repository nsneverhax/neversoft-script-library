0x3e5f56c6 = 200
0xb8463545 = 8
0xb5dc06bf = 0
0x29db48b8 = None
0xfe068932 = 1
0xac596da9 = 0
0xf17aa033 = 0
0xe222d7a4 = 0
0x1595458e = 0
dlc_last_focus_id = 0
dlc_last_focus_song_index = -1
0xe1d202e7 = 0
0x2507e507 = 400
0x54860f9a = 120000
0xaa3b1d6e = 128
0x3bbac502 = 0.05
0x7bf5bd74 = 0.1
0x3cf00975 = 0.5
0x85d69204 = 1
0xadd6103f = [
	1
	51
	51
	255
]
0xec34883b = [
	102
	41
	0
	255
]
0xebfdab1a = [
	92
	2
	33
	255
]
0x1e9c77a4 = [
	56
	219
	226
	255
]
0x47b1d8d9 = [
	227
	138
	59
	255
]
dlc_hide_catalog = 1

script dlc_handle_error 
	if NOT GotParam \{0x2831844c}
		if GotParam \{0x940022bd}
			formatText TextName = error_text qs(0x4581f2d4) t = <error_text> s = <0x940022bd>
		endif
		if GotParam \{error_include_blocks}
			formatText TextName = error_text <error_text> d = <blocks>
		endif
		if GotParam \{fatal}
			0xfd7a22ae text = <error_text> fatal
		else
			0xfd7a22ae text = <error_text>
		endif
	elseif GotParam \{fatal}
		generic_event_back
	elseif GotParam \{0x495f8299}
		0xfd7a22ae \{text = qs(0x534d1a38)}
	endif
endscript

script 0xb2ba2a5d 
	0xcce13e1d
	if (<fatal> = 1)
		generic_event_back
	endif
endscript

script 0x5279ca5b \{scroll_speed = 80}
	if generic_popupelement :desc_resolvealias \{Name = alias_dialog_text}
		<container_id> = <resolved_id>
		ResolveScreenElementID id = {<resolved_id> child = dlog_title}
		0x6ddbce46 item_id = <resolved_id>
		if (<0x1f8a8863> < ($0x2507e507))
			return
		endif
		CreateScreenElement {
			parent = <container_id>
			Type = WindowElement
			id = 0xb277205d
			Pos = (0.0, 15.0)
			dims = (400.0, 100.0)
			just = [center center]
			pos_anchor = [center center]
			z_priority = 525
		}
		<resolved_id> :se_setprops {
			parent = <id>
			just = [left top]
			pos_anchor = [left top]
			Pos = (40.0, 15.0)
			single_line = true
			fit_width = expand_dims
		}
		<distance> = (<0x1f8a8863> - 320)
		<time> = (<distance> / <scroll_speed>)
		<end_x> = (40 - <distance>)
		<end_pos> = ((<end_x> * (1.0, 0.0)) + (0.0, 15.0))
		RunScriptOnScreenElement id = <resolved_id> 0xa2b2aac5 params = {start_pos = (40.0, 15.0) end_pos = <end_pos> scroll_time = <time>}
	endif
endscript

script 0xa2b2aac5 
	begin
	se_setprops Pos = <start_pos>
	Wait \{1
		Seconds}
	se_setprops Pos = <end_pos> time = <scroll_time>
	se_waitprops
	Wait \{1
		Seconds}
	repeat
endscript

script 0x6ddbce46 
	<item_id> :se_getprops
	<0x35d3ac1b> = <fit_width>
	<0x3a997761> = <dims>
	<0x9b5c3e5b> = <Pos>
	<item_id> :se_setprops single_line = true fit_width = `expand	dims`
	<item_id> :se_getprops
	<0x5d01db20> = <dims>
	<item_id> :se_setprops single_line = FALSE fit_width = `scale	each	line	if	larger` dims = <0x3a997761> Pos = <0x9b5c3e5b>
	<item_id> :se_getprops
	return 0x1f8a8863 = ((<0x5d01db20>).(1.0, 0.0))
endscript
0x1ce39b28 = 11

script dlc_destroy_popup \{refocus = 1}
	destroy_generic_popup
endscript

script 0xcce13e1d 
	destroy_generic_popup
	dlc_make_helpers
endscript

script 0xfd7a22ae 
	printf 'Making error menu with message: %m' m = <text>
	if GotParam \{fatal}
		0x8bd34e00 = 1
	else
		0x8bd34e00 = 0
	endif
	create_new_generic_popup {
		popup_type = error_menu
		error_func = 0xb2ba2a5d
		error_func_params = {fatal = <0x8bd34e00>}
		text = <text>
		add_user_control_helpers
	}
endscript

script dlc_setup 
	Change \{0xe1d202e7 = 0}
	0xa071f441
	if GotParam \{error}
		return
	endif
	Change \{0xe1d202e7 = 1}
	0xbfe5353d
	if GotParam \{error}
		return
	endif
	0x0d5584b6
	if GotParam \{error}
		return
	endif
	0x46e941cb
	if GotParam \{error}
		return
	endif
	0xfdfb5d58
	if GotParam \{error}
		return
	endif
	Change \{ui_dlc_needs_setup = 0}
	NetSessionFunc \{func = 0xf808c81c}
	if NOT NetSessionFunc \{func = is_lobby_available}
		Wait \{1
			gameframe}
		<timeout> = 10.0
		ResetTimer
		begin
		if NetSessionFunc \{func = is_lobby_available}
			break
		endif
		if TimeGreaterThan <timeout>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	NetSessionFunc \{Obj = dlc_manifest
		func = 0x526ce47b}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	add_user_control_helper \{text = qs(0xe678814d)
		button = orange
		z = 100}
endscript

script 0xfdfb5d58 
	0x18d69109 text = (qs(0xae35e42a))
	if GotParam \{error}
		return \{error}
	endif
	<song_index> = 1
	if 0x0e0fa27c
		0xc0b4b516 \{song_index = 1}
		if (<0x82848b69> = corrupt)
			0x9955e805 \{song_index = 1}
			0xc0b4b516 \{song_index = 1}
		endif
		if (<0x82848b69> = owned)
			0x1b32fa8c \{song_index = 1}
			if GotParam \{error}
				dlc_handle_error <...>
				return
			endif
			disablereset
			0x5aef39d4 \{song_index = 1}
			0x217a8e1c <...> text = (qs(0xae35e42a)) 0xc596cac2
			if GotParam \{error}
				enablereset
				dlc_handle_error <...>
				return
			endif
			0x7688ed1c \{song_index = 1}
			updatecontentindex \{index = 1}
			Downloads_EnumContent \{0xb5e0fc5b = 1}
			enablereset
		endif
	endif
endscript

script 0xa071f441 
	0xe1285ef1
	if GotParam \{error}
		dlc_handle_error <...> fatal = 1
		return \{error}
	endif
endscript

script 0xbfe5353d 
	0xbeb7e232 = 1
	0x29cb0514
	0x217a8e1c <...> text = (qs(0x59cf5cd0))
	if GotParam \{error}
		dlc_handle_error <...> fatal = 1
		return \{error}
	endif
endscript

script 0x0d5584b6 
	0xbeb7e232 = 1
	fatal = 1
	0x8d8e5b74
	0x217a8e1c <...> text = (qs(0xda4a6d20))
	if GotParam \{error}
		dlc_handle_error <...>
		return \{error}
	endif
	0x616a12e4
	if GotParam \{no_songs}
		dlc_handle_error error_text = (qs(0x32f14ca8)) fatal
		return \{error}
	endif
	if GotParam \{0xfb65eeff}
		begin
		0x97f434eb
		if GotParam \{0x30d52d8d}
			0xc7259258
			<error_text> = <0x1d70f71e>
			dlc_handle_error <...>
			return \{error}
		endif
		0x217a8e1c <...> text = (qs(0xc171f6bf)) progress_bar 0xc596cac2
		if GotParam \{error}
			0xc7259258
			dlc_handle_error <...>
			return \{error}
		endif
		if GotParam \{0xa85aba57}
			break
		endif
		repeat
		0xc7259258
	endif
endscript

script 0xdbc982f9 
	if cntsdiscardpresent
		0x2308e284
		if (<catalog_status> = 0xb8eebfe2)
			0xd8d65a73 \{index = 1}
			0x5436e5d9
			if NOT GotParam \{error}
				if (<0xaec2e8d3> >= <0xffbe4c25>)
					disablereset
					0x66cb7d70 \{index = 1}
					formatText \{TextName = long_text
						qs(0xac955685)
						s = qs(0x9c331616)}
					if NOT GotParam \{error}
						0xdad2c850 text = qs(0x00000000) long_text = <long_text> progress_bar index = 1 0xc596cac2
					endif
					enablereset
				endif
			endif
			if GotParam \{error}
				dlc_handle_error <...> song_index = 1
			endif
		endif
	endif
endscript
0xc9f2f2c2 = 0

script 0x46e941cb 
	0xbeb7e232 = 1
	fatal = 1
	start_index = 0
	Change \{0xc9f2f2c2 = 1}
	begin
	0x7790f131 start_index = <start_index>
	0x217a8e1c <...> text = (qs(0xa6575038))
	if GotParam \{error}
		Change \{0xc9f2f2c2 = 0}
		Change \{0xac596da9 = 0}
		dlc_handle_error <...> fatal
		return \{error}
	endif
	0xccb849a0
	if GotParam \{0xda5a5099}
		Change \{0xc9f2f2c2 = 0}
		Change \{0xac596da9 = 0}
		if NOT 0xe8a55a6f
			printf \{'LACKING TMD!!!'}
			begin
			0x4ac34b1d
			0x217a8e1c <...> text = (qs(0xa6575038))
			if GotParam \{error}
				0xd8273866
				dlc_handle_error <...>
				return \{error}
			endif
			if GotParam \{0xa85aba57}
				break
			endif
			repeat
			0xd8273866
		endif
		break
	endif
	repeat
endscript

script dlc_make_helpers 
	clean_up_user_control_helpers
	switch ($0x29db48b8)
		case corrupt
		<green_text> = (qs(0x271a1633))
		case present
		<green_text> = (qs(0x271a1633))
		case owned
		<green_text> = (qs(0xa3deafe2))
		case archived
		<green_text> = (qs(0x50c3c667))
		case 0x9cf5e95a
		<green_text> = (qs(0x9b07ecb6))
	endswitch
	if GotParam \{green_text}
		add_user_control_helper text = <green_text> button = green z = 100
	endif
	add_user_control_helper text = (qs(0xaf4d5dd2)) button = red z = 100
	add_user_control_helper text = (qs(0x58811fcb)) button = yellow z = 100
	add_user_control_helper text = (qs(0x43b287ab)) button = blue z = 100
	add_user_control_helper text = (qs(0xe678814d)) button = orange z = 100
endscript

script 0x491fabef 
	current_menu :se_getparentid
	selectionhighlight :se_setprops alpha = 0 parent = <parent_id>
	DestroyScreenElement \{id = current_menu}
endscript

script 0x7f876a45 
	SpawnScriptNow \{0x2e8eb010}
endscript

script 0x2e8eb010 
	Change 0xb5dc06bf = (($0xb5dc06bf) + 1)
	if (($0xb5dc06bf) > 3)
		Change \{0xb5dc06bf = 0}
	endif
	dlc_refresh_song_list
	dlc_set_sort_mode_text
endscript

script dlc_set_sort_mode_text 
	switch ($0xb5dc06bf)
		case 0
		<sort_text> = (qs(0xb4a49c8a))
		case 1
		<sort_text> = (qs(0xe868e5d2))
		case 2
		<sort_text> = (qs(0x161edd80))
		case 3
		<sort_text> = (qs(0x135abc50))
	endswitch
	formatText TextName = sort_text qs(0xde815bcc) s = (qs(0x9d30a9c9)) m = <sort_text>
	dlc_submenu :se_setprops {
		sorttext_text = <sort_text>
	}
endscript

script dlc_refresh_song_list \{0x29652795 = 0}
	lb_get_selection_info \{id = current_menu}
	<0x6a9e3d71> = ($dlc_last_focus_song_index)
	0x491fabef
	0xdb293d9d 0x29652795 = <0x29652795>
	if (($dlc_current_secondary_menu) < 2)
		0x4690501e
	else
		0x480d2529
	endif
	menu_props = {
		dims = (490.0, 370.0)
		just = [left top]
		internal_just = [left top]
		Pos = (0.0, 0.0)
		z_priority = 4
		spacing_between = 2
	}
	if GotParam \{no_songs}
		CreateScreenElement {
			parent = dlc_menu_container
			Type = VMenu
			<menu_props>
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound}
				{pad_down generic_menu_up_or_down_sound}
				{pad_back ui_dlc_menu_setup_first_menu}
				{pad_option2 ui_dlc_menu_toggle_secondary_menu}
				{pad_L1 ui_dlc_goto_rock_archive}
				{pad_select 0x7f876a45}
			]
		}
		AssignAlias id = <id> alias = current_menu
		if (($dlc_current_secondary_menu) < 2)
			<text> = qs(0x32f14ca8)
		else
			<text> = qs(0xf350b1f1)
		endif
		CreateScreenElement {
			parent = current_menu
			Type = descinterface
			desc = 'DLC_NoSongs'
			autosizedims = true
			nosongmessage_text = <text>
		}
		dlc_submenu :se_setprops \{songinfoartist_text = qs(0x00000000)
			songinfoname_text = qs(0x00000000)
			songinfoleft_text = qs(0x00000000)
			songinforight_text = qs(0x00000000)
			genreheader_text = qs(0x00000000)
			genreinfo_text = qs(0x00000000)
			songinfocontainer_alpha = 0}
		Change \{0x29db48b8 = 'none'}
		dlc_make_helpers
		Change \{dlc_last_focus_id = 0}
		LaunchEvent \{Type = focus
			target = current_menu}
	else
		if (($dlc_current_secondary_menu) < 2)
			dlc_submenu :se_setprops {
				songinfoleft_text = (qs(0xbd1aae8f))
				genreheader_text = (qs(0x135abc50))
				songinfocontainer_alpha = 1
			}
		else
			dlc_submenu :se_setprops {
				songinfoleft_text = (qs(0x0d9d81a8))
				genreheader_text = (qs(0x135abc50))
				songinfocontainer_alpha = 1
			}
		endif
		<search_index> = 0
		if 0x6a772cf0 song_index = <0x6a9e3d71>
			<start_index> = (<index> - <selected_index>)
			if (<start_index> < 0)
				<selected_index> = (<selected_index> + <start_index>)
				<start_index> = 0
			endif
		else
			<start_index> = 0
			<selected_index> = 0
		endif
		create_lb_menu {
			start_index = <start_index>
			selected_index = <selected_index>
			parent = dlc_menu_container
			window_size = 9
			menu_props = <menu_props>
			menu_array_size = <num_rows>
			empty_row_props = {
				Type = descinterface
				desc = 'DLC_Empty_Row'
				dims = (490.0, 40.0)
			}
			row_script = 0x9e09f473
			choose_script = 0xc9468538
			option_script = 0xcebf393a
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound}
				{pad_down generic_menu_up_or_down_sound}
				{pad_back ui_dlc_menu_setup_first_menu}
				{pad_option2 ui_dlc_menu_toggle_secondary_menu}
				{pad_L1 ui_dlc_goto_rock_archive}
				{pad_select 0x7f876a45}
			]
			focus_script = 0x01bd06eb
			unfocus_script = 0x03b9ee9f
			is_header_script = 0x9274331e
		}
		AssignAlias id = <lb_menu_id> alias = current_menu
	endif
	if (($dlc_current_secondary_menu) = 2)
		0x07561241
	endif
endscript

script 0x01bd06eb 
	Obj_GetID
	GetTags
	0xc0b4b516 song_index = <song_index>
	if (<0x82848b69> = owned)
		formatText checksumName = 0x610df2c5 'DLC%d' d = <song_index>
		if StructureContains structure = $dlc_menu_sd_indices Name = <0x610df2c5>
			<0x82848b69> = archived
		endif
	endif
	selectionhighlight :se_setprops alpha = 1 Pos = (0.0, 0.0) parent = <objID> just = [left , center] pos_anchor = [left , center]
	if NOT (<0x82848b69> = ($0x29db48b8))
		Change 0x29db48b8 = <0x82848b69>
		dlc_make_helpers
	endif
	if (($dlc_current_secondary_menu) < 2)
		if (<song_price> = 0)
			<song_price> = (qs(0x15ad514f))
		endif
		formatText TextName = song_info qs(0x3f85be3f) y = <song_year> p = <song_price> b = <0x5e2e18c1>
	else
		<0x3da7f018> = qs(0x00000000)
		switch (<0x82848b69>)
			case 0x9cf5e95a
			<0x3da7f018> = (qs(0x2d183cce))
			case owned
			<0x3da7f018> = (qs(0x10b2221a))
			case archived
			<0x3da7f018> = (qs(0x1a19a28b))
			case present
			<0x3da7f018> = (qs(0x1cbca9a2))
			case corrupt
			<0x3da7f018> = (qs(0xb210d0eb))
		endswitch
		formatText TextName = song_info qs(0xd4b2053c) y = <song_year> s = <0x3da7f018> b = <0x5e2e18c1>
	endif
	<0x385d9e9e> = 1
	if (<0x34c949da> = FALSE)
		<0x385d9e9e> = 0
	endif
	dlc_submenu :se_setprops {
		songinfoartist_text = <song_artist>
		songinfoname_text = <song_name>
		songinforight_text = <song_info>
		genreinfo_text = <song_genre>
		photo_caption_container_alpha = <0x385d9e9e>
	}
	Change dlc_last_focus_song_index = <song_index>
	Change dlc_last_focus_id = <objID>
endscript

script 0x03b9ee9f 
	dlc_resetpreview
endscript

script dlc_resetpreview 
	songstoppreview
	dlc_base_interface :se_setprops \{albumcover_texture = dlc_generic_album}
endscript

script 0x9e09f473 
	0xf4103294 index = <index>
	if StructureContains \{structure = 0x201722de
			header}
		params = {
			desc = 'DLC_Header_Row'
			focusable = FALSE
			header_left_text = (<0x201722de>.header)
			header_right_text = (<0x201722de>.header_right)
		}
	else
		if (($dlc_current_secondary_menu) < 2)
			if ((<0x201722de>.song_right) = 0)
				<0xa6578e96> = (qs(0x15ad514f))
			else
				formatText TextName = 0xa6578e96 qs(0x3c71eff6) t = (<0x201722de>.song_right)
			endif
		else
			formatText TextName = 0xa6578e96 qs(0x3c71eff6) t = (<0x201722de>.song_right)
		endif
		params = {
			desc = 'DLC_Song_Row'
			focusable = true
			song_left_text = (<0x201722de>.song_name)
			song_right_text = <0xa6578e96>
			tags = {
				song_index = (<0x201722de>.song_index)
			}
		}
	endif
	return params = <params>
endscript

script 0x9274331e 
	0xf4103294 index = <index>
	if StructureContains \{structure = 0x201722de
			header}
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script 0xcebf393a 
	GetTags
	dlc_resetpreview
	if NOT 0x04be42ea song_index = <song_index>
		dlc_handle_error \{error_text = qs(0x56ee7c7b)}
		return
	endif
	if NOT GotParam \{0x7f243cab}
		0x217a8e1c preview text = (qs(0xfc1a3043)) progress_bar
		if GotParam \{error}
			if GotParam \{0x2831844c}
				dlc_refresh_song_list
			endif
			dlc_handle_error <...>
			dlc_make_helpers
			return
		endif
	endif
	dlc_make_helpers
	0x887167de
	dlc_base_interface :se_setprops \{albumcover_texture = 0xa82ca961}
endscript

script 0xc9468538 
	GetTags
	0x17d4c456 song_index = <song_index>
endscript

script 0x17d4c456 
	0xc0b4b516 song_index = <song_index>
	0x764ae086 = <...>
	if (<0x82848b69> = owned)
		formatText checksumName = 0x610df2c5 'DLC%d' d = <song_index>
		if StructureContains structure = $dlc_menu_sd_indices Name = <0x610df2c5>
			<0x82848b69> = archived
		endif
	endif
	switch <0x82848b69>
		case corrupt
		formatText TextName = text qs(0x2aa98a3e) s = <0x8f160727> m = qs(0x12bd9112)
		options = [
			{
				func = 0xa6fb44e6
				func_params = <0x764ae086>
				text = (qs(0xa32bf91f))
			}
			{
				func = 0xcce13e1d
				func_params = {}
				text = (qs(0x7343df39))
			}
		]
		case present
		formatText TextName = text qs(0x2aa98a3e) s = <0x8f160727> m = qs(0x7561f01b)
		options = [
			{
				func = 0xa6fb44e6
				func_params = <0x764ae086>
				text = (qs(0xa32bf91f))
			}
			{
				func = 0xcce13e1d
				func_params = {}
				text = (qs(0x7343df39))
			}
		]
		case owned
		formatText TextName = text qs(0x2aa98a3e) s = <0x8f160727> m = qs(0x755ff34e)
		options = [
			{
				func = 0xbadf9968
				func_params = ((<0x764ae086>) + ({0x9ee82ec4 = 0}))
				text = (qs(0xb8c320a3))
			}
			{
				func = 0xcce13e1d
				func_params = {}
				text = (qs(0x7343df39))
			}
		]
		case archived
		formatText TextName = text qs(0x2aa98a3e) s = <0x8f160727> m = qs(0xc74f0434)
		options = [
			{
				func = 0xcce13e1d
				func_params = {}
				text = (qs(0x0e41fe46))
			}
		]
		case 0x9cf5e95a
		formatText TextName = text qs(0x2aa98a3e) s = <0x8f160727> m = qs(0xcb25e33a)
		options = [
			{
				func = 0xbadf9968
				func_params = ((<0x764ae086>) + ({0x9ee82ec4 = 1}))
				text = (qs(0xe6d6f69f))
			}
			{
				func = 0xcce13e1d
				func_params = {}
				text = (qs(0x7343df39))
			}
		]
	endswitch
	create_new_generic_popup {
		popup_type = message_options
		back_script = 0xcce13e1d
		title = <song_name>
		text = <text>
		options = <options>
		title_effect
		add_user_control_helpers
	}
endscript

script 0x217a8e1c 
	if ((GotParam error) || (GotParam 0x7f243cab))
		return
	endif
	<last_progress> = -1.0
	<timed_out> = 0
	GetStartTime
	0x68f07e06 = {
		title = (qs(0xa4d1f3c3))
		popup_type = dlc_wait
		text = <text>
		title_effect
		title_effect_index = 1
		add_user_control_helpers
	}
	if GotParam \{progress_bar}
		<0x68f07e06> = ((<0x68f07e06>) + ({progress_bar}))
	endif
	if NOT GotParam \{0xc596cac2}
		<0xc0126306> = 0x4b548d97
		if GotParam \{preview}
			<0xc0126306> = 0x561844c7
		endif
		cancel_params = {
			can_cancel
			back_script = <0xc0126306>
			cancel_func = <0xc0126306>
		}
		<0x68f07e06> = ((<0x68f07e06>) + (<cancel_params>))
	endif
	create_new_generic_popup <0x68f07e06>
	RemoveParameter \{0xc0126306}
	RemoveParameter \{cancel_params}
	RemoveParameter \{0x68f07e06}
	begin
	if NOT GotParam \{preview}
		0xe8b83aac 0x17efda49 = <0x17efda49>
	else
		0x572f6d7f
	endif
	if ((GotParam 0x7f243cab) || (GotParam error))
		break
	endif
	if GotParam \{progress_bar}
		dlc_update_loading 0x8b19268e = <0x8b19268e>
	else
		dlc_update_loading
	endif
	if (<timed_out> = 0)
		if (<0x8b19268e> != <last_progress>)
			GetStartTime
			<last_progress> = <0x8b19268e>
		endif
		getelapsedtime starttime = <starttime>
		if (<ElapsedTime> > $0x54860f9a)
			if NOT dlcisdwcokay
				<timed_out> = 1
				if NOT GotParam \{preview}
					0xbadc42a9
				else
					0x84a626b4
				endif
			endif
		endif
		if (<timed_out> = 0)
			if (($0xf17aa033) = 1)
				RemoveParameter \{progress_bar}
				dlc_reset_loading
				if NOT GotParam \{preview}
					0x217a8e1c text = (qs(0x2978bcf5)) 0xc596cac2 0x17efda49 = <0x17efda49>
				else
					0x217a8e1c text = (qs(0x2978bcf5)) 0xc596cac2 preview
				endif
				if GotParam \{0xbeb7e232}
					if (<0xbeb7e232> = 1)
						if NOT GotParam \{error}
							printf \{'FORCED A CANCEL ERROR!!!'}
							error = 1
							0x2831844c = 1
						endif
					endif
				endif
				break
			endif
		endif
	endif
	WaitOneGameFrame
	repeat
	dlc_reset_loading
	if (<timed_out> = 1)
		RemoveParameter \{0x2831844c}
		error = qs(0x09b62e0f)
		error_text = qs(0x09b62e0f)
		fatal = 1
	endif
	if GotParam \{error}
		return <...>
	endif
endscript

script 0x561844c7 
	if NOT ($0xf17aa033 = 1)
		Change \{0xf17aa033 = 1}
		0x84a626b4
	endif
endscript

script 0x4b548d97 
	if NOT ($0xf17aa033 = 1)
		Change \{0xf17aa033 = 1}
		0xbadc42a9
	endif
endscript

script dlc_reset_loading 
	Change \{0xf17aa033 = 0}
	if ($0xc9f2f2c2 = 0)
		Change \{0xac596da9 = 0}
	endif
	dlc_destroy_popup
endscript

script dlc_update_loading 
	Change 0xac596da9 = (($0xac596da9) + 1)
	0xf255cb2c = qs(0x03ac90f0)
	if (($0xac596da9) > 79)
		Change \{0xac596da9 = 0}
	else
		count = (($0xac596da9) / 20)
		if (<count> > 0)
			begin
			formatText TextName = 0xf255cb2c qs(0x79548c8f) t = <0xf255cb2c>
			repeat <count>
		endif
	endif
	if ScreenElementExists \{id = generic_popupelement}
		generic_popupelement :se_setprops wait_dots_text = <0xf255cb2c>
	endif
	if GotParam \{0x8b19268e}
		if ScreenElementExists \{id = generic_popupelement}
			generic_popupelement :se_setprops bar_sprite_dims = ((<0x8b19268e> * (4.2, 0.0)) + (0.0, 25.0))
		endif
	endif
endscript

script 0x4690501e 
	0xa4a4dd23
	if GotParam \{error}
		dlc_handle_error <...>
		return
	endif
	<Scale> = (1.0, 1.0)
	<rgba> = [255 126 0 255]
	formatText TextName = 0x03901a90 qs(0x581d2af2) p = <wii_points>
	dlc_base_interface :se_setprops availablelabel_text = (qs(0xd73794fb)) availabletext_text = <0x03901a90> availabletext_rgba = <rgba> availabletext_scale = <Scale>
endscript

script 0x480d2529 
	0xb8cfb312
	if GotParam \{error}
		dlc_handle_error <...>
		return
	endif
	<Scale> = (1.0, 1.0)
	<rgba> = [255 126 0 255]
	if (<0x88333d3f> < ($0x3e5f56c6))
		<Scale> = (1.1, 1.1)
		<rgba> = [149 33 33 255]
	endif
	formatText TextName = blocks_text qs(0x20e95a21) b = <0x88333d3f>
	dlc_base_interface :se_setprops availablelabel_text = (qs(0xa18189dd)) availabletext_text = <blocks_text> availabletext_rgba = <rgba> availabletext_scale = <Scale>
endscript

script 0xbadf9968 
	dlc_destroy_popup
	0xa4a4dd23
	0xb8cfb312
	0x1b32fa8c song_index = <song_index>
	if GotParam \{error}
		dlc_handle_error <...>
		return
	endif
	0xc0b4b516 song_index = <song_index>
	if (<0x9ee82ec4> = 0)
		<song_price> = 0
	endif
	formatText {
		TextName = middle_text
		qs(0xdc6f8c7d)
		a = (qs(0xf3442f5b))
		b = <wii_points>
		c = <song_price>
		d = (<wii_points> - <song_price>)
	}
	formatText {
		TextName = right_text
		qs(0xdc6f8c7d)
		a = (qs(0x85ca8f41))
		b = <0x88333d3f>
		c = <0x5e2e18c1>
		d = <0x91fbbf00>
	}
	create_new_generic_popup {
		popup_type = dlc_confirmation
		title = (qs(0x12bbdbbd))
		left_text = qs(0xa3be0ad2)
		middle_text = <middle_text>
		right_text = <right_text>
		confirm_func = 0xa32be322
		confirm_params = {song_index = <song_index> 0x9ee82ec4 = <0x9ee82ec4>}
		back_script = 0xa924e98c
		cancel_func = 0xa924e98c
		title_effect
		add_user_control_helpers
	}
endscript

script 0xa924e98c 
	0xbfab2f1d
	0xcce13e1d
endscript

script 0x5674e979 
	if (<pin> = '')
		dlc_make_helpers
		return
	endif
	0xd351404d pin = <pin>
	if GotParam \{error}
		dlc_handle_error <...>
		return
	endif
	dlc_make_helpers
	0xa32be322 song_index = ($0x1595458e) 0x9ee82ec4 = 1
endscript

script 0x18d69109 text = (qs(0x4ce6666f))
	if NOT (0x048a3269)
		return
	endif
	0xc0b4b516 \{song_index = 1}
	if (<0x82848b69> = 0x9cf5e95a)
		0x988f62b8 \{song_index = 1}
		if GotParam \{error}
			return <...>
		endif
		0x217a8e1c <...> 0xc596cac2
		if GotParam \{error}
			return <...> fatal
		endif
		0x85a27444 \{song_index = 1}
		updatecontentindex \{index = 1}
	endif
endscript

script 0xa32be322 
	dlc_destroy_popup
	0x1b32fa8c song_index = <song_index>
	if GotParam \{error}
		0xbfab2f1d
		dlc_handle_error <...>
		return
	endif
	disablereset
	if (<0x9ee82ec4> = 1)
		0x988f62b8 song_index = <song_index>
		if GotParam \{error}
			enablereset
			if GotParam \{0x399a9d60}
				Change 0x1595458e = <song_index>
				create_new_generic_popup {
					popup_type = dlc_pin
					callback = 0x5674e979
					text = <error_text>
					title = qs(0x13c03767)
					title_effect
				}
			else
				0xbfab2f1d
				dlc_handle_error <...>
			endif
			return
		endif
		0x217a8e1c <...> text = (qs(0x4ce6666f)) 0xc596cac2
		if GotParam \{0x399a9d60}
			enablereset
			printf \{'PIN needed (2)'}
			Change 0x1595458e = <song_index>
			create_new_generic_popup {
				popup_type = dlc_pin
				callback = 0x5674e979
				text = <error_text>
				title = qs(0x13c03767)
				title_effect
			}
			return
		elseif GotParam \{error}
			enablereset
			0xbfab2f1d
			dlc_handle_error <...> fatal
			return
		endif
		0x85a27444 song_index = <song_index>
		if (($dlc_hide_catalog) = 0)
			0x18d69109 \{text = qs(0x4b08a162)}
		else
			0x18d69109
		endif
		if GotParam \{error}
			enablereset
			0xbfab2f1d
			dlc_handle_error <...>
			return
		endif
		0xbfab2f1d
	endif
	if NOT 0x0e0fa27c
		0x692e7fd4 song_index = <song_index>
		0x217a8e1c <...> text = (qs(0xebf39454)) 0xc596cac2
		if GotParam \{error}
			enablereset
			dlc_handle_error <...>
			return
		endif
		0x4ca13dd4 song_index = <song_index>
	endif
	0x5aef39d4 song_index = <song_index>
	0x217a8e1c <...> text = (qs(0xebf39454)) progress_bar
	if GotParam \{error}
		enablereset
		if GotParam \{0x2831844c}
			if (<0x9ee82ec4> = 1)
				<0x495f8299> = 1
			endif
			dlc_refresh_song_list \{0x29652795 = 1}
			dlc_handle_error <...>
			dlc_make_helpers
		else
			dlc_handle_error <...>
		endif
		return
	endif
	enablereset
	0x7688ed1c song_index = <song_index>
	0xc0b4b516 song_index = <song_index>
	if (<0x82848b69> = corrupt)
		dlc_handle_error \{error_text = qs(0xfea5abea)}
	endif
	updatecontentindex \{index = 1}
	Downloads_EnumContent \{0xb5e0fc5b = 1}
	cntsdcardwasejected
	if cntsdiscardpresent
		0x2a01bf05 song_index = <song_index>
	else
		dlc_refresh_song_list \{0x29652795 = 1}
	endif
endscript

script 0xddaa9b47 
	0xc0b4b516 song_index = <song_index>
	if (<song_index> > 1)
		cntsdcountsdsongs exclude_index = <song_index>
		if GotParam \{error}
			create_new_generic_popup {
				popup_type = error_menu
				text = <error>
				error_func = 0xfb12ec0a
				add_user_control_helpers
			}
			return
		endif
		if ((<sd_song_count> + 1) > $dlc_max_songs_on_sd)
			formatText \{TextName = tmperror
				qs(0x1cd32936)
				d = $dlc_max_songs_on_sd}
			formatText TextName = error qs(0x96c41fb5) s = <tmperror>
			create_new_generic_popup {
				popup_type = error_menu
				text = <error>
				error_func = 0xfb12ec0a
				add_user_control_helpers
			}
			return
		endif
	endif
	disablereset
	0x66cb7d70 index = <song_index>
	formatText TextName = long_text qs(0xac955685) s = <song_name>
	if NOT GotParam \{error}
		0xdad2c850 text = qs(0x00000000) long_text = <long_text> progress_bar index = <song_index>
	endif
	enablereset
	if GotParam \{error}
		formatText TextName = errortext qs(0x2aed6e30) a = <error> b = qs(0xf1082659)
		formatText TextName = errortext <errortext> s = <song_name>
		create_new_generic_popup {
			popup_type = error_menu
			text = <errortext>
			error_func = 0xfb12ec0a
			add_user_control_helpers
		}
		return
	endif
	formatText checksumName = 0x610df2c5 'DLC%d' d = (<song_index>)
	Change dlc_menu_sd_indices = (($dlc_menu_sd_indices) + {<0x610df2c5>})
	0xa6fb44e6 song_index = <song_index>
endscript

script 0xfb12ec0a 
	0xcce13e1d
	dlc_refresh_song_list \{0x29652795 = 1}
endscript

script 0x5a38f72c 
	destroy_generic_popup
	0xc0b4b516 song_index = <song_index>
	formatText \{TextName = error_text
		qs(0x2aed6e30)
		a = qs(0x87c9b5d7)
		b = qs(0xf1082659)}
	formatText TextName = error_text <error_text> s = <song_name>
	create_new_generic_popup {
		popup_type = error_menu
		text = <error_text>
		error_func = 0xfb12ec0a
		add_user_control_helpers
	}
endscript

script 0x6c2642ed 
	0xc0b4b516 song_index = <song_index>
	begin
	if cntsdcardwasejected
		SpawnScriptNow 0x5a38f72c params = {song_index = <song_index>}
		return
	endif
	WaitOneGameFrame
	repeat
endscript

script 0x2a01bf05 
	0x2308e284
	if ((<catalog_status> = wrong_wii) || (GotParam error))
		0xfb12ec0a
		return
	endif
	0xc0b4b516 song_index = <song_index>
	0xd8d65a73 index = <song_index>
	0x5436e5d9
	if NOT GotParam \{error}
		if (<0xaec2e8d3> < <0xffbe4c25>)
			<error> = 1
		endif
	endif
	if cntsdcardwasejected
		<error> = 1
	endif
	if GotParam \{error}
		0xfb12ec0a
		return
	endif
	formatText TextName = text qs(0x807015a5) s = <song_name>
	create_new_generic_popup {
		popup_type = yes_no_menu
		yes_func = 0xddaa9b47
		yes_func_params = {song_index = <song_index>}
		no_func = 0xfb12ec0a
		back_script = 0xfb12ec0a
		title = qs(0xe23b804f)
		text = <text>
		title_effect
		add_user_control_helpers
	}
	RunScriptOnScreenElement id = generic_popupelement 0x6c2642ed params = {song_index = <song_index>}
endscript

script 0xa6fb44e6 
	dlc_destroy_popup
	0x9955e805 song_index = <song_index>
	dlc_refresh_song_list \{0x29652795 = 1}
	if GotParam \{error}
		dlc_handle_error <...>
		return
	endif
endscript

script dlc_deinitialize 
	if (($0xe1d202e7) = 1)
		Downloads_EnumContent \{0xb5e0fc5b = 1
			0xd1c075f0}
	endif
	Change \{0xe1d202e7 = 0}
	0x2ac0f39d
	Change is_network_game = ($ui_dlc_should_restore_network_game)
	if ($ui_dlc_we_disabled_hb = 1)
		set_home_button_allowed
	endif
endscript
dlc_menu_sd_indices = {
}
dlc_menu_sd_indices_valid = 0

script 0x07561241 
	if cntsdiscardpresent
		RunScriptOnScreenElement \{id = current_menu
			0x4d0bb498}
	elseif ($dlc_menu_sd_indices_valid = 1)
		RunScriptOnScreenElement \{id = current_menu
			0x4d0bb498}
	else
		RunScriptOnScreenElement \{id = current_menu
			0x69081652}
	endif
endscript

script 0x69081652 
	WaitOneGameFrame
	begin
	if ScreenElementExists \{id = generic_popupelement}
		Wait \{4
			gameframes}
	else
		if cntsdiscardpresent
			cntsdcardwasejected
			if dlc_enumerate_sd
				Change \{dlc_menu_sd_indices_valid = 1}
				SpawnScriptNow \{dlc_refresh_song_list}
			else
				Change \{dlc_menu_sd_indices_valid = 0}
				Change \{dlc_menu_sd_indices = {
					}}
				0x07561241
			endif
			break
		endif
		WaitOneGameFrame
	endif
	repeat
endscript

script 0x4d0bb498 
	WaitOneGameFrame
	begin
	if cntsdcardwasejected
		if (($dlc_menu_sd_indices_valid) = 1)
			Change \{dlc_menu_sd_indices_valid = 0}
			Change \{dlc_menu_sd_indices = {
				}}
			SpawnScriptNow \{dlc_refresh_song_list}
		else
			0x07561241
		endif
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script dlc_enumerate_sd 
	<0x74b07736> = 0
	Change \{dlc_menu_sd_indices = {
		}}
	cntsdiscardusable
	if NOT GotParam \{error}
		cntsdgetcontentindices
		if NOT GotParam \{error}
			GetArraySize <index_array>
			<0x74b07736> = <array_Size>
			if (<0x74b07736> = 0)
				return \{FALSE}
			endif
			0x2308e284
			if (<catalog_status> = wrong_wii)
				return \{FALSE}
			endif
			<i> = 0
			begin
			formatText checksumName = 0x610df2c5 'DLC%d' d = (<index_array> [<i>])
			Change dlc_menu_sd_indices = (($dlc_menu_sd_indices) + {<0x610df2c5>})
			<i> = (<i> + 1)
			repeat <0x74b07736>
		else
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
	if cntsdcardwasejected
		return \{FALSE}
	endif
	return \{true}
endscript

script 0x229db1f6 \{node = dlc_base_interface}
	params = <...>
	if NOT GotParam \{item}
		printf \{'Missing "item" parameter...'}
		return
	endif
	if 0x3f9bf068 item = <item> node = <node>
		RemoveComponent \{Name = item
			structure_name = params}
		RemoveComponent \{Name = node
			structure_name = params}
		if NOT StructureContains structure = $0x0acd245d Name = <local_id>
			appendstruct struct = 0x0acd245d Field = <local_id> params = <params> globalstruct
		else
			<struct> = (($0x0acd245d).<local_id>)
			updatestructelement struct = $0x0acd245d element = <local_id> value = ((<struct>) + (<params>))
			Change 0x0acd245d = <newstruct>
		endif
		<0xa10e9c8e> :se_setprops <params>
		0x60a698cf item = <0xa10e9c8e>
		AssignAlias alias = 0x82628039 id = <0xa10e9c8e>
	else
		printf \{'Failed to find item'}
	endif
endscript

script 0x60a698cf 
	<item> :se_getprops
	RemoveParameter \{item}
	printstruct <...>
endscript
0x0acd245d = {
}

script 0xf7cd8a37 
	printstruct ($0x0acd245d)
endscript
