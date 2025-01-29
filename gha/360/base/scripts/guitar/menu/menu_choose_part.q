g_si_hilitep1_pos = (665.0, 66.0)
g_si_hilitep2_pos = (410.0, 494.0)
g_si_player1_index = 0
g_si_player2_index = 0
g_si_player1_locked = 0
g_si_player2_locked = 0

script create_choose_part_menu 
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message {
			current_state = ($net_current_flow_state)
			action = request
			request_state = instrument
		}
	endif
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
	menu_font = text_a5
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		id = select_intsrument_container
		parent = root_window
		Pos = (0.0, 0.0)}
	displaySprite \{parent = select_intsrument_container
		tex = Instrument_2p_Poster
		Pos = (250.0, 0.0)
		dims = (768.0, 768.0)
		z = 1}
	if ($game_mode = p2_quickplay || $game_mode = p2_coop)
		CreateScreenElement \{Type = SpriteElement
			parent = select_intsrument_container
			texture = instrument_coop_overlay
			just = [
				center
				center
			]
			Pos = (625.0, 320.0)
			dims = (250.0, 250.0)
			alpha = 1
			z_priority = 10}
	endif
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
			font = text_a6
			rgba = [
				185
				220
				230
				255
			]
			rot = -3
			z = 5
			text = "Player 1"}
		displayText \{parent = select_intsrument_container
			Pos = (650.0, 538.0)
			Scale = 1
			font = text_a6
			rgba = [
				215
				220
				175
				255
			]
			rot = -3
			z = 5
			text = "Player 2"}
	endif
	get_song_rhythm_track song = ($current_song)
	if (<rhythm_track> = 1)
		part_text1 = "LEAD"
		part_text2 = "RHYTHM"
	else
		part_text1 = "GUITAR"
		part_text2 = "BASS"
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
		tex = Instrument_2p_Hilite
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
		tex = Instrument_2p_Hilite
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
	displaySprite id = si_hilite_bookend_p1a parent = select_intsrument_container tex = Instrument_2p_Hilite_End_1a Pos = ($g_si_hilitep1_pos + (0.0, 10.0)) z = 4.5
	displaySprite id = si_hilite_bookend_p1b parent = <id> tex = Instrument_2p_Hilite_End_1b Pos = (180.0, 10.0)
	displaySprite id = si_hilite_bookend_p2a parent = select_intsrument_container tex = Instrument_2p_Hilite_End_2a Pos = ($g_si_hilitep2_pos + (0.0, 20.0)) z = 4.5
	displaySprite id = si_hilite_bookend_p2b parent = <id> tex = Instrument_2p_Hilite_End_2b Pos = (180.0, 20.0)
	select_instrument_randomize_bookends \{Player = 1}
	select_instrument_randomize_bookends \{Player = 2}
	displaySprite \{parent = select_intsrument_container
		tex = Instrument_2p_Overlay
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50}
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		create_ready_icons \{pos1 = (890.0, 130.0)
			pos2 = (250.0, 540.0)}
		net_lobby_state_message \{current_state = instrument
			action = approval}
		Change \{net_can_send_approval = 0}
	else
		create_ready_icons
	endif
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
			Change \{g_si_player2_locked = 0}
			drop_out_ready_sign Player = <Player> from_cp = 1
			SoundEvent \{event = Generic_Menu_Back_SFX}
		else
			menu_flow_go_back
		endif
	else
		if ($p2_ready = 1)
			Change \{g_si_player1_locked = 0}
			drop_out_ready_sign Player = <Player> from_cp = 1
			SoundEvent \{event = Generic_Menu_Back_SFX}
		else
			menu_flow_go_back
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
			Change \{g_si_player2_locked = 1}
			if ($g_si_player1_index = $g_si_player2_index)
				select_instrument_scroll \{Player = 2
					overridelock = 1}
			endif
			drop_in_ready_sign Player = <Player> from_cp = 1
		endif
	else
		if ($p2_ready = 0)
			Change \{g_si_player1_locked = 1}
			if ($g_si_player2_index = $g_si_player1_index)
				select_instrument_scroll \{Player = 1
					overridelock = 1}
			endif
			drop_in_ready_sign Player = <Player> from_cp = 1
		endif
	endif
	if ($p1_ready = 1)
		if ($p2_ready = 1)
			if find_profile_by_id id = ($player1_status.character_id)
				get_musician_profile_struct index = <index>
				formatText checksumName = characterguitartags_p1 'character_%c_player_1_guitar_tags' c = (<profile_struct>.Name)
				if GetGlobalTags <characterguitartags_p1> noassert = 1
					<p1_guitar> = <current_selected_guitar>
					<p1_bass> = <current_selected_bass>
					if ($is_network_game = 1)
						Change player1_selected_guitar = <p1_guitar>
						Change player1_selected_bass = <p1_bass>
					endif
				endif
			endif
			if find_profile_by_id id = ($player2_status.character_id)
				get_musician_profile_struct index = <index>
				formatText checksumName = characterguitartags_p2 'character_%c_player_2_guitar_tags' c = (<profile_struct>.Name)
				if GetGlobalTags <characterguitartags_p2> noassert = 1
					<p2_guitar> = <current_selected_guitar>
					<p2_bass> = <current_selected_bass>
					if ($is_network_game = 1)
						<p2_guitar> = ($player2_selected_guitar)
						<p2_bass> = ($player2_selected_bass)
					endif
				endif
			endif
			Wait \{0.5
				Seconds}
			get_song_rhythm_track song = ($current_song)
			if ($g_si_player1_index = 0)
				Change \{structurename = player1_status
					part = guitar}
				Change structurename = player1_status instrument_id = <p1_guitar>
				if find_profile_by_id id = ($player1_status.character_id)
					get_musician_profile_struct index = <index>
					formatText checksumName = characterguitartags_p1 'character_%c_player_1_guitar_tags' c = (<profile_struct>.Name)
					SetGlobalTags <characterguitartags_p1> params = {current_instrument = guitar}
				endif
			else
				Change \{structurename = player1_status
					part = rhythm}
				if (<rhythm_track> = 1)
					Change structurename = player1_status instrument_id = <p1_guitar>
					if find_profile_by_id id = ($player1_status.character_id)
						get_musician_profile_struct index = <index>
						formatText checksumName = characterguitartags_p1 'character_%c_player_1_guitar_tags' c = (<profile_struct>.Name)
						SetGlobalTags <characterguitartags_p1> params = {current_instrument = guitar}
					endif
				else
					Change structurename = player1_status instrument_id = <p1_bass>
					if find_profile_by_id id = ($player1_status.character_id)
						get_musician_profile_struct index = <index>
						formatText checksumName = characterguitartags_p1 'character_%c_player_1_guitar_tags' c = (<profile_struct>.Name)
						SetGlobalTags <characterguitartags_p1> params = {current_instrument = bass}
					endif
				endif
			endif
			if ($g_si_player2_index = 0)
				Change \{structurename = player2_status
					part = guitar}
				Change structurename = player2_status instrument_id = <p2_guitar>
				if find_profile_by_id id = ($player2_status.character_id)
					get_musician_profile_struct index = <index>
					formatText checksumName = characterguitartags_p2 'character_%c_player_2_guitar_tags' c = (<profile_struct>.Name)
					SetGlobalTags <characterguitartags_p2> params = {current_instrument = guitar}
				endif
			else
				Change \{structurename = player2_status
					part = rhythm}
				if (<rhythm_track> = 1)
					Change structurename = player2_status instrument_id = <p2_guitar>
					if find_profile_by_id id = ($player2_status.character_id)
						get_musician_profile_struct index = <index>
						formatText checksumName = characterguitartags_p2 'character_%c_player_2_guitar_tags' c = (<profile_struct>.Name)
						SetGlobalTags <characterguitartags_p2> params = {current_instrument = guitar}
					endif
				else
					Change structurename = player2_status instrument_id = <p2_bass>
					if find_profile_by_id id = ($player2_status.character_id)
						get_musician_profile_struct index = <index>
						formatText checksumName = characterguitartags_p2 'character_%c_player_2_guitar_tags' c = (<profile_struct>.Name)
						SetGlobalTags <characterguitartags_p2> params = {current_instrument = bass}
					endif
				endif
			endif
			ui_flow_manager_respond_to_action action = continue device_num = <device_num>
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
	generic_menu_up_or_down_sound
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
			SetScreenElementProps id = <a> texture = Instrument_2p_Hilite_End_1a
		else
			SetScreenElementProps id = <a> texture = Instrument_2p_Hilite_End_1b
		endif
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			SetScreenElementProps id = <b> texture = Instrument_2p_Hilite_End_1a
		else
			SetScreenElementProps id = <b> texture = Instrument_2p_Hilite_End_1b
		endif
	else
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			SetScreenElementProps id = <a> texture = Instrument_2p_Hilite_End_2a
		else
			SetScreenElementProps id = <a> texture = Instrument_2p_Hilite_End_2b
		endif
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			SetScreenElementProps id = <b> texture = Instrument_2p_Hilite_End_2a
		else
			SetScreenElementProps id = <b> texture = Instrument_2p_Hilite_End_2b
		endif
	endif
endscript

script create_ready_icons \{pos1 = (440.0, 120.0)
		pos2 = (720.0, 580.0)}
	if NOT ((GotParam parent1) || (GotParam parent2))
		parent1 = root_window
		parent2 = root_window
	endif
	if GotParam \{parent1}
		destroy_menu \{menu_id = ready_container_p1}
		CreateScreenElement {
			Type = ContainerElement
			parent = <parent1>
			id = ready_container_p1
			just = [left top]
			Pos = <pos1>
			rot_angle = -10
			z_priority = 70
			Scale = 1
			alpha = 0
		}
		displaySprite \{parent = ready_container_p1
			tex = Dialog_Title_BG
			flip_v
			dims = (128.0, 128.0)}
		displaySprite \{parent = ready_container_p1
			tex = Dialog_Title_BG
			Pos = (64.0, -64.0)
			dims = (128.0, 128.0)}
		displayText \{parent = ready_container_p1
			text = "READY!"
			Pos = (-15.0, -35.0)
			Scale = (1.25, 0.9)
			font = text_a4
			z = 75
			rgba = [
				223
				223
				223
				255
			]}
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (160.0, 42.0)
	endif
	if GotParam \{parent2}
		destroy_menu \{menu_id = ready_container_p2}
		CreateScreenElement {
			Type = ContainerElement
			parent = <parent2>
			id = ready_container_p2
			just = [left top]
			Pos = <pos2>
			rot_angle = 10
			z_priority = 70
			Scale = 1
			alpha = 0
		}
		displaySprite \{parent = ready_container_p2
			tex = Dialog_Title_BG
			flip_v
			dims = (128.0, 128.0)}
		displaySprite \{parent = ready_container_p2
			tex = Dialog_Title_BG
			Pos = (64.0, -64.0)
			dims = (128.0, 128.0)}
		displayText \{parent = ready_container_p2
			text = "READY!"
			Pos = (-15.0, -35.0)
			Scale = (1.25, 0.9)
			font = text_a4
			z = 75
			rgba = [
				223
				223
				223
				255
			]}
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (160.0, 42.0)
	endif
endscript

script destroy_ready_icons 
	destroy_menu \{menu_id = ready_container_p1}
	destroy_menu \{menu_id = ready_container_p2}
endscript

script drop_in_ready_sign \{Player = 1
		from_sd = 0
		from_cp = 0}
	formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
	if NOT ScreenElementExists id = <ready_container>
		create_ready_icons
	endif
	DoScreenElementMorph id = <ready_container> alpha = 1
	DoScreenElementMorph id = <ready_container> Scale = 0.5 time = 0.1
	Wait \{0.1
		Seconds}
	formatText checksumName = sound_event 'CheckBox_Check_SFX_P%d' d = <Player>
	SoundEvent event = <sound_event>
	DoScreenElementMorph id = <ready_container> Scale = 1 time = 0.1
	Wait \{0.1
		Seconds}
	if (<from_sd> = 1)
		formatText checksumName = player_ready 'g_sd_p%d_ready' d = <Player>
		Change GlobalName = <player_ready> NewValue = 1
	elseif (<from_cp> = 1)
		formatText checksumName = player_ready 'p%d_ready' d = <Player>
		Change GlobalName = <player_ready> NewValue = 1
	endif
endscript

script drop_out_ready_sign \{Player = 1
		from_sd = 0
		from_cp = 0}
	formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
	DoScreenElementMorph id = <ready_container> Scale = 0.5 time = 0.1
	Wait \{0.1
		Seconds}
	formatText checksumName = sound_event 'Checkbox_SFX_P%d' d = <Player>
	SoundEvent event = <sound_event>
	DoScreenElementMorph id = <ready_container> Scale = 1 time = 0.1
	Wait \{0.1
		Seconds}
	DoScreenElementMorph id = <ready_container> alpha = 0
	if (<from_sd> = 1)
		formatText checksumName = player_ready 'g_sd_p%d_ready' d = <Player>
		Change GlobalName = <player_ready> NewValue = 0
	elseif (<from_cp> = 1)
		formatText checksumName = player_ready 'p%d_ready' d = <Player>
		Change GlobalName = <player_ready> NewValue = 0
	endif
endscript

script change_pos_ready_sign \{Player = 1
		Pos = (0.0, 0.0)}
	if (<Player> = 1)
		if ScreenElementExists \{id = ready_container_p1}
			SetScreenElementProps id = ready_container_p1 Pos = <Pos>
		endif
	else
		if ScreenElementExists \{id = ready_container_p2}
			SetScreenElementProps id = ready_container_p2 Pos = <Pos>
		endif
	endif
endscript
