g_si_hilitep1_pos = (665.0, 66.0)
g_si_hilitep2_pos = (410.0, 494.0)
g_si_player1_index = 0
g_si_player2_index = 0
g_si_player1_locked = 0
g_si_player2_locked = 0

script create_choose_part_menu 
	change p1_ready = 0
	change p2_ready = 0
	createscreenelement {
		type = vscrollingmenu
		parent = root_window
		id = si_scrolling_menu
	}
	if ($is_network_game)
		net_choose_part_screen_elements
	else
		createscreenelement {
			type = vmenu
			parent = si_scrolling_menu
			id = si_vmenu_p1
			event_handlers = [
				{pad_up select_instrument_scroll params = {player = 1 dir = up}}
				{pad_down select_instrument_scroll params = {player = 1 dir = down}}
				{pad_choose choose_part_menu_select_part params = {player = 1}}
				{pad_back select_instrument_go_back params = {player = 1}}
			]
			exclusive_device = $player1_device
		}
		launchevent type = focus target = si_vmenu_p1
		createscreenelement {
			type = vmenu
			parent = si_scrolling_menu
			id = si_vmenu_p2
			event_handlers = [
				{pad_up select_instrument_scroll params = {player = 2 dir = up}}
				{pad_down select_instrument_scroll params = {player = 2 dir = down}}
				{pad_choose choose_part_menu_select_part params = {player = 2}}
				{pad_back select_instrument_go_back params = {player = 2}}
			]
			exclusive_device = $player2_device
		}
		launchevent type = focus target = si_vmenu_p2
	endif
	menu_font = text_a5
	create_menu_backdrop texture = venue_bg
	createscreenelement {
		type = containerelement
		id = select_intsrument_container
		parent = root_window
		pos = (0.0, 0.0)
	}
	displaysprite {
		parent = select_intsrument_container
		tex = instrument_2p_poster
		pos = (250.0, 0.0)
		dims = (768.0, 768.0)
		z = 1
	}
	displaysprite {
		parent = select_intsrument_container
		tex = tape_h_01
		pos = (190.0, 260.0)
		dims = (192.0, 96.0)
		z = 10
		rot_angle = -80
	}
	displaysprite {
		parent = select_intsrument_container
		tex = tape_h_01
		rgba = [0 0 0 128]
		pos = (186.0, 266.0)
		dims = (192.0, 96.0)
		z = 10
		rot_angle = -80
	}
	displaysprite {
		parent = select_intsrument_container
		tex = tape_v_01
		pos = (960.0, 386.0)
		dims = (116.0, 232.0)
		z = 10
		flip_v
		rot_angle = -6
	}
	displaysprite {
		parent = select_intsrument_container
		tex = tape_v_01
		rgba = [0 0 0 128]
		pos = (966.0, 392.0)
		dims = (116.0, 232.0)
		z = 10
		flip_v
		rot_angle = -6
	}
	if NOT ($is_network_game)
		displaytext parent = select_intsrument_container pos = (420.0, 96.0) scale = 1.1 font = text_a6 rgba = [185 220 230 255] rot = -3 z = 5 text = "Player 1"
		displaytext parent = select_intsrument_container pos = (650.0, 538.0) scale = 1.1 font = text_a6 rgba = [215 220 175 255] rot = -3 z = 5 text = "Player 2"
	endif
	get_song_rhythm_track song = ($current_song)
	if (<rhythm_track> = 1)
		part_text = "RHYTHM"
	else
		part_text = "BASS"
	endif
	displaytext parent = select_intsrument_container text = "GUITAR" pos = (710.0, 70.0) scale = 1.1 font = <menu_font> rgba = [185 220 230 255] rot = 3 z = 5
	displaytext parent = <id> text = <part_text> pos = (60.0, 40.0) font = <menu_font> rgba = [185 220 230 255] just = [center top]
	displaytext parent = select_intsrument_container text = "GUITAR" pos = (456.0, 515.0) scale = 1.1 font = <menu_font> rgba = [215 220 175 255] rot = 5 z = 5
	displaytext parent = <id> text = <part_text> pos = (60.0, 40.0) font = <menu_font> rgba = [215 220 175 255] just = [center top]
	displaysprite id = si_hilite_p1 parent = select_intsrument_container tex = instrument_2p_hilite pos = $g_si_hilitep1_pos dims = (216.0, 64.0) rgba = [5 30 35 255] z = 4
	displaysprite id = si_hilite_p2 parent = select_intsrument_container tex = instrument_2p_hilite pos = $g_si_hilitep2_pos dims = (216.0, 64.0) rgba = [65 25 10 255] z = 4 flip_h rot_angle = 8
	displaysprite id = si_hilite_bookend_p1a parent = select_intsrument_container tex = instrument_2p_hilite_end_1a pos = ($g_si_hilitep1_pos + (0.0, 10.0)) z = 4.5
	displaysprite id = si_hilite_bookend_p1b parent = <id> tex = instrument_2p_hilite_end_1b pos = (180.0, 10.0)
	displaysprite id = si_hilite_bookend_p2a parent = select_intsrument_container tex = instrument_2p_hilite_end_2a pos = ($g_si_hilitep2_pos + (0.0, 20.0)) z = 4.5
	displaysprite id = si_hilite_bookend_p2b parent = <id> tex = instrument_2p_hilite_end_2b pos = (180.0, 20.0)
	select_instrument_randomize_bookends player = 1
	select_instrument_randomize_bookends player = 2
	displaysprite parent = select_intsrument_container tex = instrument_2p_overlay pos = (0.0, 0.0) dims = (1280.0, 720.0) z = 50
	change user_control_pill_text_color = [0 0 0 255]
	change user_control_pill_color = [180 180 180 255]
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "BACK" button = red z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
	if ($is_network_game)
		create_ready_icons pos1 = (890.0, 130.0) pos2 = (250.0, 540.0)
	else
		create_ready_icons
	endif
endscript

script destroy_choose_part_menu 
	destroy_gamertags
	destroy_ready_icons
	clean_up_user_control_helpers
	change \{g_si_player1_index = 0}
	change \{g_si_player2_index = 0}
	change \{p1_ready = 0}
	change \{p2_ready = 0}
	change \{g_si_player1_locked = 0}
	change \{g_si_player2_locked = 0}
	destroy_menu \{menu_id = si_scrolling_menu}
	destroy_menu \{menu_id = select_intsrument_container}
	destroy_menu_backdrop
endscript

script select_instrument_go_back 
	if (<player> = 1)
		if ($p1_ready = 1)
			change p1_ready = 0
			change g_si_player2_locked = 0
			drop_out_ready_sign player = <player>
			soundevent event = generic_menu_back_sfx
		else
			menu_flow_go_back
		endif
	else
		if ($p2_ready = 1)
			change p2_ready = 0
			change g_si_player1_locked = 0
			drop_out_ready_sign player = <player>
			soundevent event = generic_menu_back_sfx
		else
			menu_flow_go_back
		endif
	endif
endscript

script choose_part_menu_select_part 
	if (<player> = 1)
		if ($p1_ready = 0)
			soundevent event = ui_sfx_select
			change p1_ready = 1
			change g_si_player2_locked = 1
			if ($g_si_player1_index = $g_si_player2_index)
				select_instrument_scroll player = 2 overridelock = 1
			endif
			drop_in_ready_sign player = <player>
		endif
	else
		if ($p2_ready = 0)
			soundevent event = ui_sfx_select
			change p2_ready = 1
			change g_si_player1_locked = 1
			if ($g_si_player2_index = $g_si_player1_index)
				select_instrument_scroll player = 1 overridelock = 1
			endif
			drop_in_ready_sign player = <player>
		endif
	endif
	if ($p1_ready = 1)
		if ($p2_ready = 1)
			wait 0.5 seconds
			if ($g_si_player1_index = 0)
				change structurename = player1_status part = guitar
			else
				change structurename = player1_status part = rhythm
			endif
			if ($g_si_player2_index = 0)
				change structurename = player2_status part = guitar
			else
				change structurename = player2_status part = rhythm
			endif
			ui_flow_manager_respond_to_action action = continue device_num = <device_num>
		endif
	endif
endscript

script select_instrument_scroll dir = down overridelock = 0
	if (<player> = 1)
		if (($p1_ready = 1) || ($g_si_player1_locked = 1) && (<overridelock> = 0))
			return
		endif
		if ($g_si_player1_index = 0)
			change g_si_player1_index = 1
			setscreenelementprops id = si_hilite_p1 pos = ($g_si_hilitep1_pos + (0.0, 46.0))
			setscreenelementprops id = si_hilite_bookend_p1a pos = ($g_si_hilitep1_pos + (0.0, 60.0))
		else
			change g_si_player1_index = 0
			setscreenelementprops id = si_hilite_p1 pos = $g_si_hilitep1_pos
			setscreenelementprops id = si_hilite_bookend_p1a pos = ($g_si_hilitep1_pos + (0.0, 10.0))
		endif
	else
		if (($p2_ready = 1) || ($g_si_player2_locked = 1) && (<overridelock> = 0))
			return
		endif
		if ($g_si_player2_index = 0)
			change g_si_player2_index = 1
			setscreenelementprops id = si_hilite_p2 pos = ($g_si_hilitep2_pos + (0.0, 44.0)) flip_h
			setscreenelementprops id = si_hilite_bookend_p2a pos = ($g_si_hilitep2_pos + (0.0, 64.0))
		else
			change g_si_player2_index = 0
			setscreenelementprops id = si_hilite_p2 pos = $g_si_hilitep2_pos flip_h
			setscreenelementprops id = si_hilite_bookend_p2a pos = ($g_si_hilitep2_pos + (0.0, 20.0))
		endif
	endif
	select_instrument_randomize_bookends player = <player>
endscript

script select_instrument_randomize_bookends player = 1
	if (<player> = 1)
		formattext checksumname = a 'si_hilite_bookend_p%sa' s = 1
		formattext checksumname = b 'si_hilite_bookend_p%sb' s = 1
	else
		formattext checksumname = a 'si_hilite_bookend_p%sa' s = 2
		formattext checksumname = b 'si_hilite_bookend_p%sb' s = 2
	endif
	if (<player> = 1)
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			setscreenelementprops id = <a> texture = instrument_2p_hilite_end_1a
		else
			setscreenelementprops id = <a> texture = instrument_2p_hilite_end_1b
		endif
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			setscreenelementprops id = <b> texture = instrument_2p_hilite_end_1a
		else
			setscreenelementprops id = <b> texture = instrument_2p_hilite_end_1b
		endif
	else
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			setscreenelementprops id = <a> texture = instrument_2p_hilite_end_2a
		else
			setscreenelementprops id = <a> texture = instrument_2p_hilite_end_2b
		endif
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			setscreenelementprops id = <b> texture = instrument_2p_hilite_end_2a
		else
			setscreenelementprops id = <b> texture = instrument_2p_hilite_end_2b
		endif
	endif
endscript

script create_ready_icons pos1 = (440.0, 120.0) pos2 = (720.0, 580.0)
	if NOT ((gotparam parent1) || (gotparam parent2))
		parent1 = root_window
		parent2 = root_window
	endif
	if gotparam parent1
		createscreenelement {
			type = containerelement
			parent = <parent1>
			id = ready_container_p1
			just = [left top]
			pos = <pos1>
			rot_angle = -10
			z_priority = 50
			scale = 1
			alpha = 0
		}
		displaysprite parent = ready_container_p1 tex = dialog_title_bg flip_v dims = (128.0, 128.0)
		displaysprite parent = <id> tex = dialog_title_bg pos = (128.0, 0.0) dims = (128.0, 128.0)
		displaytext parent = ready_container_p1 text = "READY!" pos = (-15.0, -35.0) scale = (1.25, 0.9) font = text_a4 z = 100 rgba = [223 223 223 255]
	endif
	if gotparam parent2
		createscreenelement {
			type = containerelement
			parent = <parent2>
			id = ready_container_p2
			just = [left top]
			pos = <pos2>
			rot_angle = 10
			z_priority = 50
			scale = 1
			alpha = 0
		}
		displaysprite parent = ready_container_p2 tex = dialog_title_bg flip_v dims = (128.0, 128.0)
		displaysprite parent = <id> tex = dialog_title_bg pos = (128.0, 0.0) dims = (128.0, 128.0)
		displaytext parent = ready_container_p2 text = "READY!" pos = (-15.0, -35.0) scale = (1.25, 0.9) font = text_a4 z = 100 rgba = [223 223 223 255]
	endif
endscript

script destroy_ready_icons 
	destroy_menu \{menu_id = ready_container_p1}
	destroy_menu \{menu_id = ready_container_p2}
endscript

script drop_in_ready_sign \{player = 1}
	formattext checksumname = ready_container 'ready_container_p%d' d = <player>
	doscreenelementmorph id = <ready_container> alpha = 1
	doscreenelementmorph id = <ready_container> scale = 0.5 time = 0.1
	wait \{0.1
		seconds}
	doscreenelementmorph id = <ready_container> scale = 1 time = 0.1
	wait \{0.1
		seconds}
endscript

script drop_out_ready_sign \{player = 1}
	formattext checksumname = ready_container 'ready_container_p%d' d = <player>
	doscreenelementmorph id = <ready_container> scale = 0.5 time = 0.1
	wait \{0.1
		seconds}
	doscreenelementmorph id = <ready_container> scale = 1 time = 0.1
	wait \{0.1
		seconds}
	doscreenelementmorph id = <ready_container> alpha = 0
endscript

script change_pos_ready_sign \{player = 1
		pos = (0.0, 0.0)}
	if (<player> = 1)
		if screenelementexists \{id = ready_container_p1}
			setscreenelementprops id = ready_container_p1 pos = <pos>
		endif
	else
		if screenelementexists \{id = ready_container_p2}
			setscreenelementprops id = ready_container_p2 pos = <pos>
		endif
	endif
endscript
