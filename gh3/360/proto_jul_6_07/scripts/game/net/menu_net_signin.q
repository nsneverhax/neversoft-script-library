
script create_online_signin_splash 
	printf "--- create_online_signin_splash"
	event_handlers = [
		{pad_up 0x1600ab6b}
		{pad_down 0xf2a6a9d5}
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back online_signin_select_cancel}
	]
	if isxenon
		<menu_pos> = (575.0, 487.0)
		<bookend_r_pos> = (710.0, 533.0)
		<bookend_l_pos> = (500.0, 533.0)
	else
		<menu_pos> = (555.0, 510.0)
		<bookend_r_pos> = (750.0, 533.0)
		<bookend_l_pos> = (480.0, 533.0)
	endif
	new_menu scrollid = sign_in_scoller vmenuid = sign_in_vmenu use_backdrop = (0) menu_pos = <menu_pos> just = [left top] event_handlers = <event_handlers>
	create_menu_backdrop texture = online_background
	if checkforsignin
		netsessionfunc func = onlinesignin
	else
		if isxenon
			createscreenelement {
				type = containerelement
				parent = root_window
				id = signin_container
				pos = (0.0, 0.0)
			}
			change menu_focus_color = [180 50 50 255]
			change menu_unfocus_color = [0 0 0 255]
			create_pause_menu_frame z = 5
			displaysprite parent = signin_container tex = dialog_title_bg scale = (1.7, 1.7) z = 9 pos = (640.0, 100.0) just = [right top] flip_v
			displaysprite parent = signin_container tex = dialog_title_bg scale = (1.7, 1.7) z = 9 pos = (640.0, 100.0) just = [left top]
			displaysprite parent = signin_container tex = dialog_frame_joiner pos = (480.0, 510.0) rot_angle = 5 scale = (1.575, 1.5) z = 10
			displaysprite parent = signin_container tex = dialog_frame_joiner pos = (750.0, 514.0) flip_v rot_angle = -5 scale = (1.575, 1.5) z = 10
			displaysprite id = hi_right parent = signin_container tex = dialog_highlight pos = <bookend_r_pos> scale = (1.0, 1.0) z = (11)
			displaysprite id = hi_left parent = signin_container tex = dialog_highlight flip_v pos = <bookend_l_pos> scale = (1.0, 1.0) z = (11)
			displaysprite parent = signin_container tex = dialog_bg pos = (480.0, 500.0) scale = (1.25, 1.0) z = 9 just = [left botom]
			displaysprite parent = signin_container tex = dialog_bg pos = (480.0, 530.0) scale = (1.25, 1.0) z = 9 just = [left top] flip_h
			createscreenelement {
				type = textelement
				parent = signin_container
				font = fontgrid_title_gh3
				scale = 1.3
				rgba = [223 223 223 250]
				text = "WARNING"
				just = [center top]
				z_priority = 10.0
				pos = (640.0, 175.0)
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
			}
			if isxenon
				<sign_in_text> = "The current profile does not have permission to enter the Xbox Live lobby. Please sign into an Xbox Live enabled profile to proceed."
			else
				<sign_in_text> = "The current profile does not have permission to enter the PlayStation Network lobby."
			endif
			createscreenelement {
				type = textblockelement
				parent = signin_container
				font = fontgrid_title_gh3
				scale = 0.6
				rgba = [210 210 210 250]
				text = <sign_in_text>
				just = [center top]
				internal_just = [center top]
				z_priority = 10.0
				pos = (640.0, 310.0)
				dims = (700.0, 320.0)
				line_spacing = 1.0
			}
			if isxenon
				createscreenelement {
					type = textelement
					parent = sign_in_vmenu
					font = fontgrid_title_gh3
					scale = 0.85
					rgba = ($menu_unfocus_color)
					text = "SIGN IN"
					just = [center top]
					z_priority = 10.0
					event_handlers = [
						{focus 0x16ea0ce8 params = {y_pos = 490}}
						{unfocus retail_menu_unfocus}
						{pad_choose online_signin_select_signin}
					]
				}
				createscreenelement {
					type = textelement
					parent = sign_in_vmenu
					font = fontgrid_title_gh3
					scale = 0.85
					rgba = ($menu_unfocus_color)
					text = "CANCEL"
					just = [center top]
					z_priority = 10.0
					event_handlers = [
						{focus 0x16ea0ce8 params = {y_pos = 540}}
						{unfocus retail_menu_unfocus}
						{pad_choose online_signin_select_cancel}
					]
				}
			else
				createscreenelement {
					type = textelement
					parent = sign_in_vmenu
					font = fontgrid_title_gh3
					scale = 0.85
					rgba = ($menu_unfocus_color)
					text = "CONTINUE"
					just = [center top]
					z_priority = 10.0
					event_handlers = [
						{focus 0x16ea0ce8 params = {y_pos = 515}}
						{unfocus retail_menu_unfocus}
						{pad_choose online_signin_select_signin}
					]
				}
			endif
			add_user_control_helper text = "SELECT" button = green z = 100
			add_user_control_helper text = "BACK" button = red z = 100
			add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
			launchevent type = focus target = sign_in_vmenu
		else
			netsessionfunc func = onlinesignin
		endif
	endif
endscript

script destroy_online_signin_splash 
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu \{menu_id = sign_in_scoller}
	destroy_menu_backdrop
	if screenelementexists \{id = signin_container}
		destroyscreenelement \{id = signin_container}
	endif
endscript

script online_signin_select_signin 
	netsessionfunc \{func = onlinesignin}
endscript

script online_signin_select_cancel 
	ui_flow_manager_respond_to_action \{action = cancel}
endscript

script 0x16ea0ce8 \{y_pos = 320}
	retail_menu_focus
	if screenelementexists \{id = hi_right}
		getscreenelementprops \{id = hi_right}
		printstruct <...>
		hi_right :setprops pos = ((<pos>.(1.0, 0.0) * (1.0, 0.0)) + (<y_pos> * (0.0, 1.0)))
	endif
	if screenelementexists \{id = hi_left}
		getscreenelementprops \{id = hi_left}
		hi_left :setprops preserve_flip pos = ((<pos>.(1.0, 0.0) * (1.0, 0.0)) + (<y_pos> * (0.0, 1.0)))
	endif
endscript
