g_si_hilitep1_pos = (665.0, 66.0)
g_si_hilitep2_pos = (410.0, 494.0)
g_si_player1_index = 0
g_si_player2_index = 0
g_si_player1_locked = 0
g_si_player2_locked = 0

script create_choose_part_menu 
	Change \{p1_ready = 0}
	Change \{p2_ready = 0}
	CreateScreenElement \{Type = VScrollingMenu
		parent = root_window
		id = si_scrolling_menu}
	if ($is_network_game)
		net_choose_part_screen_elements
	else
		CreateScreenElement \{Type = VMenu
			parent = si_scrolling_menu
			id = si_vmenu_p1
			event_handlers = [
				{
					pad_up
					select_instrument_scroll
					params = {
						Player = 1
						Dir = up
					}
				}
				{
					pad_down
					select_instrument_scroll
					params = {
						Player = 1
						Dir = down
					}
				}
				{
					pad_choose
					choose_part_menu_select_part
					params = {
						Player = 1
					}
				}
				{
					pad_back
					select_instrument_go_back
					params = {
						Player = 1
					}
				}
			]
			exclusive_device = $player1_device}
		LaunchEvent \{Type = focus
			target = si_vmenu_p1}
		CreateScreenElement \{Type = VMenu
			parent = si_scrolling_menu
			id = si_vmenu_p2
			event_handlers = [
				{
					pad_up
					select_instrument_scroll
					params = {
						Player = 2
						Dir = up
					}
				}
				{
					pad_down
					select_instrument_scroll
					params = {
						Player = 2
						Dir = down
					}
				}
				{
					pad_choose
					choose_part_menu_select_part
					params = {
						Player = 2
					}
				}
				{
					pad_back
					select_instrument_go_back
					params = {
						Player = 2
					}
				}
			]
			exclusive_device = $player2_device}
		LaunchEvent \{Type = focus
			target = si_vmenu_p2}
	endif
	menu_font = fontgrid_text_a6
	create_menu_backdrop \{texture = menu_venue_bg}
	CreateScreenElement \{Type = ContainerElement
		id = select_intsrument_container
		parent = root_window
		Pos = (0.0, 0.0)}
	displaySprite \{parent = select_intsrument_container
		tex = 2p_instrument_poster
		Pos = (250.0, 0.0)
		dims = (768.0, 768.0)
		z = 1}
	displaySprite \{parent = select_intsrument_container
		tex = Tape_H_01
		Pos = (190.0, 260.0)
		dims = (192.0, 96.0)
		z = 10
		rot_angle = -80}
	displaySprite \{parent = select_intsrument_container
		tex = Tape_H_01
		rgba = [
			0
			0
			0
			128
		]
		Pos = (186.0, 266.0)
		dims = (192.0, 96.0)
		z = 10
		rot_angle = -80}
	displaySprite \{parent = select_intsrument_container
		tex = Tape_V_01
		Pos = (960.0, 386.0)
		dims = (116.0, 232.0)
		z = 10
		flip_v
		rot_angle = -6}
	displaySprite \{parent = select_intsrument_container
		tex = Tape_V_01
		rgba = [
			0
			0
			0
			128
		]
		Pos = (966.0, 392.0)
		dims = (116.0, 232.0)
		z = 10
		flip_v
		rot_angle = -6}
	if NOT ($is_network_game)
		displayText \{parent = select_intsrument_container
			Pos = (420.0, 96.0)
			Scale = 1
			font = fontgrid_text_a6
			rgba = [
				185
				220
				230
				255
			]
			rot = -3
			z = 5
			text = qs(0x7c104666)}
		displayText \{parent = select_intsrument_container
			Pos = (650.0, 538.0)
			Scale = 1
			font = fontgrid_text_a6
			rgba = [
				215
				220
				175
				255
			]
			rot = -3
			z = 5
			text = qs(0x573d15a5)}
	endif
	get_song_rhythm_track song = ($current_song)
	if (<rhythm_track> = 1)
		part_text1 = qs(0x0cc7d9b2)
		part_text2 = qs(0x1f0659c1)
	else
		part_text1 = qs(0x9504b94a)
		part_text2 = qs(0x7d4f9214)
	endif
	displayText parent = select_intsrument_container text = <part_text1> Pos = (770.0, 75.0) Scale = 1.1 font = <menu_font> rgba = [185 220 230 255] just = [center top] rot = 3 z = 5
	GetScreenElementDims id = <id>
	if (<width> > 170)
		fit_text_in_rectangle id = <id> dims = ((170.0, 0.0) + <height> * (0.0, 1.1))
	endif
	displayText parent = select_intsrument_container text = <part_text2> Pos = (770.0, 120.0) Scale = 1.1 font = <menu_font> rgba = [185 220 230 255] just = [center top] rot = 3 z = 5
	GetScreenElementDims id = <id>
	if (<width> > 170)
		fit_text_in_rectangle id = <id> dims = ((170.0, 0.0) + <height> * (0.0, 1.0))
	endif
	displayText parent = select_intsrument_container text = <part_text1> Pos = (515.0, 520.0) Scale = 1.1 font = <menu_font> rgba = [215 220 175 255] just = [center top] rot = 5 z = 5
	GetScreenElementDims id = <id>
	if (<width> > 170)
		fit_text_in_rectangle id = <id> dims = ((170.0, 0.0) + <height> * (0.0, 1.1))
	endif
	displayText parent = select_intsrument_container text = <part_text2> Pos = (515.0, 565.0) Scale = 1.1 font = <menu_font> rgba = [215 220 175 255] just = [center top] rot = 5 z = 5
	GetScreenElementDims id = <id>
	if (<width> > 170)
		fit_text_in_rectangle id = <id> dims = ((170.0, 0.0) + <height> * (0.0, 1.1))
	endif
	displaySprite \{id = si_hilite_p1
		parent = select_intsrument_container
		tex = 2p_instrument_hilite
		Pos = $g_si_hilitep1_pos
		dims = (216.0, 64.0)
		rgba = [
			5
			30
			35
			255
		]
		z = 4}
	displaySprite \{id = si_hilite_p2
		parent = select_intsrument_container
		tex = 2p_instrument_hilite
		Pos = $g_si_hilitep2_pos
		dims = (216.0, 64.0)
		rgba = [
			65
			25
			10
			255
		]
		z = 4
		flip_h
		rot_angle = 8}
	displaySprite id = si_hilite_bookend_p1a parent = select_intsrument_container tex = 2p_instrument_hilite_end_1a Pos = ($g_si_hilitep1_pos + (0.0, 10.0)) z = 4.5
	displaySprite id = si_hilite_bookend_p1b parent = <id> tex = 2p_instrument_hilite_end_1b Pos = (180.0, 10.0)
	displaySprite id = si_hilite_bookend_p2a parent = select_intsrument_container tex = 2p_instrument_hilite_end_2a Pos = ($g_si_hilitep2_pos + (0.0, 20.0)) z = 4.5
	displaySprite id = si_hilite_bookend_p2b parent = <id> tex = 2p_instrument_hilite_end_2b Pos = (180.0, 20.0)
	select_instrument_randomize_bookends \{Player = 1}
	select_instrument_randomize_bookends \{Player = 2}
	displaySprite \{parent = select_intsrument_container
		tex = light_overlay_3spots
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50}
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	create_ready_icons
endscript

script destroy_choose_part_menu 
	destroy_gamertags
	destroy_ready_icons
	clean_up_user_control_helpers
	Change \{g_si_player1_index = 0}
	Change \{g_si_player2_index = 0}
	Change \{p1_ready = 0}
	Change \{p2_ready = 0}
	Change \{g_si_player1_locked = 0}
	Change \{g_si_player2_locked = 0}
	destroy_menu \{menu_id = si_scrolling_menu}
	destroy_menu \{menu_id = select_intsrument_container}
	destroy_menu_backdrop
endscript

script select_instrument_go_back 
	if (<Player> = 1)
		if ($p1_ready = 1)
			Change \{p1_ready = 0}
			Change \{g_si_player2_locked = 0}
			drop_out_ready_sign Player = <Player>
			SoundEvent \{event = Generic_Menu_Back_SFX}
		else
			generic_event_back
		endif
	else
		if ($p2_ready = 1)
			Change \{p2_ready = 0}
			Change \{g_si_player1_locked = 0}
			drop_out_ready_sign Player = <Player>
			SoundEvent \{event = Generic_Menu_Back_SFX}
		else
			generic_event_back
		endif
	endif
endscript

script choose_part_menu_select_part 
	LaunchEvent \{Type = unfocus
		target = si_vmenu_p1}
	LaunchEvent \{Type = unfocus
		target = si_vmenu_p2}
	if (<Player> = 1)
		if ($p1_ready = 0)
			Change \{p1_ready = 1}
			Change \{g_si_player2_locked = 1}
			if ($g_si_player1_index = $g_si_player2_index)
				select_instrument_scroll \{Player = 2
					overridelock = 1}
			endif
			drop_in_ready_sign Player = <Player>
		endif
	else
		if ($p2_ready = 0)
			Change \{p2_ready = 1}
			Change \{g_si_player1_locked = 1}
			if ($g_si_player2_index = $g_si_player1_index)
				select_instrument_scroll \{Player = 1
					overridelock = 1}
			endif
			drop_in_ready_sign Player = <Player>
		endif
	endif
	if ($p1_ready = 1)
		if ($p2_ready = 1)
			Wait \{0.5
				Seconds}
			get_song_rhythm_track song = ($current_song)
			if ($g_si_player1_index = 0)
				Change \{structurename = player1_status
					part = guitar}
			else
				Change \{structurename = player1_status
					part = bass}
			endif
			if ($g_si_player2_index = 0)
				Change \{structurename = player2_status
					part = guitar}
			else
				Change \{structurename = player2_status
					part = bass}
			endif
			generic_event_choose \{state = uistate_play_song}
			return
		endif
	endif
	LaunchEvent \{Type = focus
		target = si_vmenu_p1}
	LaunchEvent \{Type = focus
		target = si_vmenu_p2}
endscript

script select_instrument_scroll \{Dir = down
		overridelock = 0}
	if (<Player> = 1)
		if (($p1_ready = 1) || ($g_si_player1_locked = 1) && (<overridelock> = 0))
			return
		endif
		if ($g_si_player1_index = 0)
			Change \{g_si_player1_index = 1}
			SetScreenElementProps id = si_hilite_p1 Pos = ($g_si_hilitep1_pos + (0.0, 46.0))
			SetScreenElementProps id = si_hilite_bookend_p1a Pos = ($g_si_hilitep1_pos + (0.0, 60.0))
		else
			Change \{g_si_player1_index = 0}
			SetScreenElementProps \{id = si_hilite_p1
				Pos = $g_si_hilitep1_pos}
			SetScreenElementProps id = si_hilite_bookend_p1a Pos = ($g_si_hilitep1_pos + (0.0, 10.0))
		endif
	else
		if (($p2_ready = 1) || ($g_si_player2_locked = 1) && (<overridelock> = 0))
			return
		endif
		if ($g_si_player2_index = 0)
			Change \{g_si_player2_index = 1}
			SetScreenElementProps id = si_hilite_p2 Pos = ($g_si_hilitep2_pos + (0.0, 44.0)) flip_h
			SetScreenElementProps id = si_hilite_bookend_p2a Pos = ($g_si_hilitep2_pos + (0.0, 64.0))
		else
			Change \{g_si_player2_index = 0}
			SetScreenElementProps \{id = si_hilite_p2
				Pos = $g_si_hilitep2_pos
				flip_h}
			SetScreenElementProps id = si_hilite_bookend_p2a Pos = ($g_si_hilitep2_pos + (0.0, 20.0))
		endif
	endif
	select_instrument_randomize_bookends Player = <Player>
endscript

script select_instrument_randomize_bookends \{Player = 1}
	if (<Player> = 1)
		formatText \{checksumName = a
			'si_hilite_bookend_p%sa'
			s = 1}
		formatText \{checksumName = b
			'si_hilite_bookend_p%sb'
			s = 1}
	else
		formatText \{checksumName = a
			'si_hilite_bookend_p%sa'
			s = 2}
		formatText \{checksumName = b
			'si_hilite_bookend_p%sb'
			s = 2}
	endif
	if (<Player> = 1)
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			SetScreenElementProps id = <a> texture = 2p_instrument_hilite_end_1a
		else
			SetScreenElementProps id = <a> texture = 2p_instrument_hilite_end_1b
		endif
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			SetScreenElementProps id = <b> texture = 2p_instrument_hilite_end_1a
		else
			SetScreenElementProps id = <b> texture = 2p_instrument_hilite_end_1b
		endif
	else
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			SetScreenElementProps id = <a> texture = 2p_instrument_hilite_end_2a
		else
			SetScreenElementProps id = <a> texture = 2p_instrument_hilite_end_2b
		endif
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			SetScreenElementProps id = <b> texture = 2p_instrument_hilite_end_2a
		else
			SetScreenElementProps id = <b> texture = 2p_instrument_hilite_end_2b
		endif
	endif
endscript

script create_ready_icons \{pos1 = (440.0, 120.0)
		pos2 = (720.0, 580.0)
		pos3 = (200.0, 200.0)
		pos4 = (400.0, 400.0)}
	loop_num = 0
	count = 4
	if GotParam \{parent1}
		count = 1
	endif
	if GotParam \{parent2}
		count = 1
		loop_num = 1
	endif
	begin
	parent = root_window
	if GotParam \{parent1}
		if (<loop_num> = 0)
			<parent> = <parent1>
		endif
	endif
	if GotParam \{parent2}
		if (<loop_num> = 1)
			<parent> = <parent2>
		endif
	endif
	Pos = <pos1>
	if (<loop_num> = 1)
		<Pos> = <pos2>
	elseif (<loop_num> = 2)
		<Pos> = <pos3>
	elseif (<loop_num> = 3)
		<Pos> = <pos4>
	endif
	formatText checksumName = container 'ready_container_p%d' d = (<loop_num> + 1)
	destroy_menu menu_id = <container>
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = <container>
		just = [left top]
		Pos = <Pos>
		rot_angle = -10
		z_priority = 70
		Scale = 1
		alpha = 0
	}
	displaySprite parent = <container> tex = Dialog_Title_BG flip_v dims = (128.0, 128.0)
	displaySprite parent = <id> tex = Dialog_Title_BG Pos = (128.0, 0.0) dims = (128.0, 128.0)
	displayText parent = <container> text = qs(0x679dee25) Pos = (50.0, 30.0) Scale = (1.25, 0.9) font = fontgrid_text_a8 z = 100 rgba = [223 223 223 255]
	SetScreenElementProps id = <id> Scale = 1
	fit_text_in_rectangle id = <id> dims = (160.0, 42.0)
	<loop_num> = (<loop_num> + 1)
	repeat <count>
endscript

script destroy_ready_icons 
	Change \{p1_ready = 0}
	Change \{p2_ready = 0}
	Change \{p3_ready = 0}
	Change \{p4_ready = 0}
	destroy_menu \{menu_id = ready_container_p1}
	destroy_menu \{menu_id = ready_container_p2}
	destroy_menu \{menu_id = ready_container_p3}
	destroy_menu \{menu_id = ready_container_p4}
endscript

script drop_in_ready_sign \{Player = 1}
	formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
	if NOT ScreenElementExists id = <ready_container>
		create_ready_icons
	endif
	legacydoscreenelementmorph id = <ready_container> alpha = 1
	legacydoscreenelementmorph id = <ready_container> Scale = 0.5 time = 0.1
	Wait \{0.1
		Seconds}
	formatText checksumName = sound_event 'CheckBox_Check_SFX_P%d' d = <Player>
	SoundEvent event = <sound_event>
	legacydoscreenelementmorph id = <ready_container> Scale = 1 time = 0.1
	Wait \{0.1
		Seconds}
endscript

script drop_out_ready_sign \{Player = 1}
	formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
	if ScreenElementExists id = <ready_container>
		legacydoscreenelementmorph id = <ready_container> Scale = 0.5 time = 0.1
		Wait \{0.1
			Seconds}
		formatText checksumName = sound_event 'Checkbox_SFX_P%d' d = <Player>
		SoundEvent event = <sound_event>
		legacydoscreenelementmorph id = <ready_container> Scale = 1 time = 0.1
		Wait \{0.1
			Seconds}
		legacydoscreenelementmorph id = <ready_container> alpha = 0
	endif
endscript

script change_pos_ready_sign \{Player = 1
		Pos = (0.0, 0.0)}
	formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
	if ScreenElementExists id = <ready_container>
		SetScreenElementProps id = <ready_container> Pos = <Pos>
	endif
endscript
