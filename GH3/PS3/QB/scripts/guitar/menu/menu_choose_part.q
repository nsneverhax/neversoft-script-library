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
			request_state = Instrument
		}
	endif
	Change \{p1_ready = 0}
	Change \{p2_ready = 0}
	CreateScreenElement \{Type = VScrollingMenu
		PARENT = root_window
		Id = si_scrolling_menu}
	if ($is_network_game)
		net_choose_part_screen_elements
	else
		CreateScreenElement \{Type = VMenu
			PARENT = si_scrolling_menu
			Id = si_vmenu_p1
			event_handlers = [
				{
					pad_up
					select_instrument_scroll
					Params = {
						Player = 1
						Dir = UP
					}
				}
				{
					pad_down
					select_instrument_scroll
					Params = {
						Player = 1
						Dir = DOWN
					}
				}
				{
					pad_choose
					choose_part_menu_select_part
					Params = {
						Player = 1
					}
				}
				{
					pad_back
					select_instrument_go_back
					Params = {
						Player = 1
					}
				}
			]
			exclusive_device = $player1_device}
		LaunchEvent \{Type = Focus
			Target = si_vmenu_p1}
		CreateScreenElement \{Type = VMenu
			PARENT = si_scrolling_menu
			Id = si_vmenu_p2
			event_handlers = [
				{
					pad_up
					select_instrument_scroll
					Params = {
						Player = 2
						Dir = UP
					}
				}
				{
					pad_down
					select_instrument_scroll
					Params = {
						Player = 2
						Dir = DOWN
					}
				}
				{
					pad_choose
					choose_part_menu_select_part
					Params = {
						Player = 2
					}
				}
				{
					pad_back
					select_instrument_go_back
					Params = {
						Player = 2
					}
				}
			]
			exclusive_device = $player2_device}
		LaunchEvent \{Type = Focus
			Target = si_vmenu_p2}
	endif
	menu_font = text_a5
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		Id = select_intsrument_container
		PARENT = root_window
		Pos = (0.0, 0.0)}
	displaySprite \{PARENT = select_intsrument_container
		tex = Instrument_2p_Poster
		Pos = (250.0, 0.0)
		Dims = (768.0, 768.0)
		Z = 1}
	displaySprite \{PARENT = select_intsrument_container
		tex = Tape_H_01
		Pos = (190.0, 260.0)
		Dims = (192.0, 96.0)
		Z = 10
		Rot_Angle = -80}
	displaySprite \{PARENT = select_intsrument_container
		tex = Tape_H_01
		rgba = [
			0
			0
			0
			128
		]
		Pos = (186.0, 266.0)
		Dims = (192.0, 96.0)
		Z = 10
		Rot_Angle = -80}
	displaySprite \{PARENT = select_intsrument_container
		tex = Tape_V_01
		Pos = (960.0, 386.0)
		Dims = (116.0, 232.0)
		Z = 10
		flip_v
		Rot_Angle = -6}
	displaySprite \{PARENT = select_intsrument_container
		tex = Tape_V_01
		rgba = [
			0
			0
			0
			128
		]
		Pos = (966.0, 392.0)
		Dims = (116.0, 232.0)
		Z = 10
		flip_v
		Rot_Angle = -6}
	if NOT ($is_network_game)
		displayText \{PARENT = select_intsrument_container
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
			Z = 5
			Text = "Player 1"}
		displayText \{PARENT = select_intsrument_container
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
			Z = 5
			Text = "Player 2"}
	endif
	get_song_rhythm_track Song = ($current_song)
	if (<rhythm_track> = 1)
		part_text1 = "LEAD"
		part_text2 = "RHYTHM"
	else
		part_text1 = "GUITAR"
		part_text2 = "BASS"
	endif
	displayText PARENT = select_intsrument_container Text = <part_text1> Pos = (770.0, 75.0) Scale = 1.1 font = <menu_font> rgba = [185 220 230 255] just = [Center Top] rot = 3 Z = 5
	GetScreenElementDims Id = <Id>
	if (<width> > 170)
		fit_text_in_rectangle Id = <Id> Dims = ((170.0, 0.0) + <Height> * (0.0, 1.1))
	endif
	displayText PARENT = select_intsrument_container Text = <part_text2> Pos = (770.0, 120.0) Scale = 1.1 font = <menu_font> rgba = [185 220 230 255] just = [Center Top] rot = 3 Z = 5
	GetScreenElementDims Id = <Id>
	if (<width> > 170)
		fit_text_in_rectangle Id = <Id> Dims = ((170.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	displayText PARENT = select_intsrument_container Text = <part_text1> Pos = (515.0, 520.0) Scale = 1.1 font = <menu_font> rgba = [215 220 175 255] just = [Center Top] rot = 5 Z = 5
	GetScreenElementDims Id = <Id>
	if (<width> > 170)
		fit_text_in_rectangle Id = <Id> Dims = ((170.0, 0.0) + <Height> * (0.0, 1.1))
	endif
	displayText PARENT = select_intsrument_container Text = <part_text2> Pos = (515.0, 565.0) Scale = 1.1 font = <menu_font> rgba = [215 220 175 255] just = [Center Top] rot = 5 Z = 5
	GetScreenElementDims Id = <Id>
	if (<width> > 170)
		fit_text_in_rectangle Id = <Id> Dims = ((170.0, 0.0) + <Height> * (0.0, 1.1))
	endif
	displaySprite \{Id = si_hilite_p1
		PARENT = select_intsrument_container
		tex = Instrument_2p_Hilite
		Pos = $g_si_hilitep1_pos
		Dims = (216.0, 64.0)
		rgba = [
			5
			30
			35
			255
		]
		Z = 4}
	displaySprite \{Id = si_hilite_p2
		PARENT = select_intsrument_container
		tex = Instrument_2p_Hilite
		Pos = $g_si_hilitep2_pos
		Dims = (216.0, 64.0)
		rgba = [
			65
			25
			10
			255
		]
		Z = 4
		flip_h
		Rot_Angle = 8}
	displaySprite Id = si_hilite_bookend_p1a PARENT = select_intsrument_container tex = Instrument_2p_Hilite_End_1a Pos = ($g_si_hilitep1_pos + (0.0, 10.0)) Z = 4.5
	displaySprite Id = si_hilite_bookend_p1b PARENT = <Id> tex = Instrument_2p_Hilite_End_1b Pos = (180.0, 10.0)
	displaySprite Id = si_hilite_bookend_p2a PARENT = select_intsrument_container tex = Instrument_2p_Hilite_End_2a Pos = ($g_si_hilitep2_pos + (0.0, 20.0)) Z = 4.5
	displaySprite Id = si_hilite_bookend_p2b PARENT = <Id> tex = Instrument_2p_Hilite_End_2b Pos = (180.0, 20.0)
	select_instrument_randomize_bookends \{Player = 1}
	select_instrument_randomize_bookends \{Player = 2}
	displaySprite \{PARENT = select_intsrument_container
		tex = Instrument_2p_Overlay
		Pos = (0.0, 0.0)
		Dims = (1280.0, 720.0)
		Z = 50}
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
	add_user_control_helper \{Text = "SELECT"
		button = Green
		Z = 100}
	add_user_control_helper \{Text = "BACK"
		button = RED
		Z = 100}
	add_user_control_helper \{Text = "UP/DOWN"
		button = Strumbar
		Z = 100}
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		create_ready_icons \{pos1 = (890.0, 130.0)
			pos2 = (250.0, 540.0)}
		net_lobby_state_message \{current_state = Instrument
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
			Change \{p1_ready = 0}
			Change \{g_si_player2_locked = 0}
			drop_out_ready_sign Player = <Player>
			SoundEvent \{Event = Generic_Menu_Back_SFX}
		else
			menu_flow_go_back
		endif
	else
		if ($p2_ready = 1)
			Change \{p2_ready = 0}
			Change \{g_si_player1_locked = 0}
			drop_out_ready_sign Player = <Player>
			SoundEvent \{Event = Generic_Menu_Back_SFX}
		else
			menu_flow_go_back
		endif
	endif
endscript

script choose_part_menu_select_part 
	LaunchEvent \{Type = unfocus
		Target = si_vmenu_p1}
	LaunchEvent \{Type = unfocus
		Target = si_vmenu_p2}
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
			if find_profile_by_id Id = ($player1_status.character_id)
				get_musician_profile_struct Index = <Index>
				FormatText ChecksumName = default_characterguitartag1 'character_%c_player_1_guitar_tags' C = (<profile_struct>.Name)
				if GetGlobalTags <default_characterguitartag1> noassert = 1
					<p1_guitar> = <current_selected_guitar>
					<p1_bass> = <current_selected_bass>
					if ($is_network_game = 1)
						<p1_guitar> = ($player1_selected_guitar)
						<p1_bass> = ($player1_selected_bass)
					endif
				endif
			endif
			if find_profile_by_id Id = ($player2_status.character_id)
				get_musician_profile_struct Index = <Index>
				FormatText ChecksumName = default_characterguitartag2 'character_%c_player_2_guitar_tags' C = (<profile_struct>.Name)
				if GetGlobalTags <default_characterguitartag2> noassert = 1
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
			get_song_rhythm_track Song = ($current_song)
			if ($g_si_player1_index = 0)
				Change \{StructureName = player1_status
					part = GUITAR}
				Change StructureName = player1_status instrument_id = <p1_guitar>
				if find_profile_by_id Id = ($player1_status.character_id)
					get_musician_profile_struct Index = <Index>
					FormatText ChecksumName = default_characterguitartag1 'character_%c_player_1_guitar_tags' C = (<profile_struct>.Name)
					SetGlobalTags <default_characterguitartag1> Params = {current_instrument = GUITAR}
				endif
			else
				Change \{StructureName = player1_status
					part = RHYTHM}
				if (<rhythm_track> = 1)
					Change StructureName = player1_status instrument_id = <p1_guitar>
					if find_profile_by_id Id = ($player1_status.character_id)
						get_musician_profile_struct Index = <Index>
						FormatText ChecksumName = default_characterguitartag1 'character_%c_player_1_guitar_tags' C = (<profile_struct>.Name)
						SetGlobalTags <default_characterguitartag1> Params = {current_instrument = GUITAR}
					endif
				else
					Change StructureName = player1_status instrument_id = <p1_bass>
					if find_profile_by_id Id = ($player1_status.character_id)
						get_musician_profile_struct Index = <Index>
						FormatText ChecksumName = default_characterguitartag1 'character_%c_player_1_guitar_tags' C = (<profile_struct>.Name)
						SetGlobalTags <default_characterguitartag1> Params = {current_instrument = BASS}
					endif
				endif
			endif
			if ($g_si_player2_index = 0)
				Change \{StructureName = player2_status
					part = GUITAR}
				Change StructureName = player2_status instrument_id = <p2_guitar>
				if find_profile_by_id Id = ($player2_status.character_id)
					get_musician_profile_struct Index = <Index>
					FormatText ChecksumName = default_characterguitartag2 'character_%c_player_2_guitar_tags' C = (<profile_struct>.Name)
					SetGlobalTags <default_characterguitartag2> Params = {current_instrument = GUITAR}
				endif
			else
				Change \{StructureName = player2_status
					part = RHYTHM}
				if (<rhythm_track> = 1)
					Change StructureName = player2_status instrument_id = <p2_guitar>
					if find_profile_by_id Id = ($player2_status.character_id)
						get_musician_profile_struct Index = <Index>
						FormatText ChecksumName = default_characterguitartag2 'character_%c_player_2_guitar_tags' C = (<profile_struct>.Name)
						SetGlobalTags <default_characterguitartag2> Params = {current_instrument = GUITAR}
					endif
				else
					Change StructureName = player2_status instrument_id = <p2_bass>
					if find_profile_by_id Id = ($player2_status.character_id)
						get_musician_profile_struct Index = <Index>
						FormatText ChecksumName = default_characterguitartag2 'character_%c_player_2_guitar_tags' C = (<profile_struct>.Name)
						SetGlobalTags <default_characterguitartag2> Params = {current_instrument = BASS}
					endif
				endif
			endif
			ui_flow_manager_respond_to_action action = Continue device_num = <device_num>
			return
		endif
	endif
	LaunchEvent \{Type = Focus
		Target = si_vmenu_p1}
	LaunchEvent \{Type = Focus
		Target = si_vmenu_p2}
endscript

script select_instrument_scroll \{Dir = DOWN
		overridelock = 0}
	if (<Player> = 1)
		if (($p1_ready = 1) || ($g_si_player1_locked = 1) && (<overridelock> = 0))
			return
		endif
		if ($g_si_player1_index = 0)
			Change \{g_si_player1_index = 1}
			SetScreenElementProps Id = si_hilite_p1 Pos = ($g_si_hilitep1_pos + (0.0, 46.0))
			SetScreenElementProps Id = si_hilite_bookend_p1a Pos = ($g_si_hilitep1_pos + (0.0, 60.0))
		else
			Change \{g_si_player1_index = 0}
			SetScreenElementProps \{Id = si_hilite_p1
				Pos = $g_si_hilitep1_pos}
			SetScreenElementProps Id = si_hilite_bookend_p1a Pos = ($g_si_hilitep1_pos + (0.0, 10.0))
		endif
	else
		if (($p2_ready = 1) || ($g_si_player2_locked = 1) && (<overridelock> = 0))
			return
		endif
		if ($g_si_player2_index = 0)
			Change \{g_si_player2_index = 1}
			SetScreenElementProps Id = si_hilite_p2 Pos = ($g_si_hilitep2_pos + (0.0, 44.0)) flip_h
			SetScreenElementProps Id = si_hilite_bookend_p2a Pos = ($g_si_hilitep2_pos + (0.0, 64.0))
		else
			Change \{g_si_player2_index = 0}
			SetScreenElementProps \{Id = si_hilite_p2
				Pos = $g_si_hilitep2_pos
				flip_h}
			SetScreenElementProps Id = si_hilite_bookend_p2a Pos = ($g_si_hilitep2_pos + (0.0, 20.0))
		endif
	endif
	select_instrument_randomize_bookends Player = <Player>
endscript

script select_instrument_randomize_bookends \{Player = 1}
	if (<Player> = 1)
		FormatText \{ChecksumName = A
			'si_hilite_bookend_p%sa'
			S = 1}
		FormatText \{ChecksumName = B
			'si_hilite_bookend_p%sb'
			S = 1}
	else
		FormatText \{ChecksumName = A
			'si_hilite_bookend_p%sa'
			S = 2}
		FormatText \{ChecksumName = B
			'si_hilite_bookend_p%sb'
			S = 2}
	endif
	if (<Player> = 1)
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			SetScreenElementProps Id = <A> texture = Instrument_2p_Hilite_End_1a
		else
			SetScreenElementProps Id = <A> texture = Instrument_2p_Hilite_End_1b
		endif
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			SetScreenElementProps Id = <B> texture = Instrument_2p_Hilite_End_1a
		else
			SetScreenElementProps Id = <B> texture = Instrument_2p_Hilite_End_1b
		endif
	else
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			SetScreenElementProps Id = <A> texture = Instrument_2p_Hilite_End_2a
		else
			SetScreenElementProps Id = <A> texture = Instrument_2p_Hilite_End_2b
		endif
		rand = Random (@ 1 @ 2 )
		if (<rand> = 1)
			SetScreenElementProps Id = <B> texture = Instrument_2p_Hilite_End_2a
		else
			SetScreenElementProps Id = <B> texture = Instrument_2p_Hilite_End_2b
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
			PARENT = <parent1>
			Id = ready_container_p1
			just = [LEFT Top]
			Pos = <pos1>
			Rot_Angle = -10
			z_priority = 70
			Scale = 1
			Alpha = 0
		}
		displaySprite \{PARENT = ready_container_p1
			tex = Dialog_Title_BG
			flip_v
			Dims = (128.0, 128.0)}
		displaySprite PARENT = <Id> tex = Dialog_Title_BG Pos = (128.0, 0.0) Dims = (128.0, 128.0)
		displayText \{PARENT = ready_container_p1
			Text = "READY!"
			Pos = (-15.0, -35.0)
			Scale = (1.25, 0.9)
			font = text_a4
			Z = 100
			rgba = [
				223
				223
				223
				255
			]}
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (160.0, 42.0)
	endif
	if GotParam \{parent2}
		destroy_menu \{menu_id = ready_container_p2}
		CreateScreenElement {
			Type = ContainerElement
			PARENT = <parent2>
			Id = ready_container_p2
			just = [LEFT Top]
			Pos = <pos2>
			Rot_Angle = 10
			z_priority = 70
			Scale = 1
			Alpha = 0
		}
		displaySprite \{PARENT = ready_container_p2
			tex = Dialog_Title_BG
			flip_v
			Dims = (128.0, 128.0)}
		displaySprite PARENT = <Id> tex = Dialog_Title_BG Pos = (128.0, 0.0) Dims = (128.0, 128.0)
		displayText \{PARENT = ready_container_p2
			Text = "READY!"
			Pos = (-15.0, -35.0)
			Scale = (1.25, 0.9)
			font = text_a4
			Z = 100
			rgba = [
				223
				223
				223
				255
			]}
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (160.0, 42.0)
	endif
endscript

script destroy_ready_icons 
	destroy_menu \{menu_id = ready_container_p1}
	destroy_menu \{menu_id = ready_container_p2}
endscript

script drop_in_ready_sign \{Player = 1}
	FormatText ChecksumName = ready_container 'ready_container_p%d' D = <Player>
	if NOT ScreenElementExists Id = <ready_container>
		create_ready_icons
	endif
	DoScreenElementMorph Id = <ready_container> Alpha = 1
	DoScreenElementMorph Id = <ready_container> Scale = 0.5 Time = 0.1
	Wait \{0.1
		Seconds}
	FormatText ChecksumName = sound_event 'CheckBox_Check_SFX_P%d' D = <Player>
	SoundEvent Event = <sound_event>
	DoScreenElementMorph Id = <ready_container> Scale = 1 Time = 0.1
	Wait \{0.1
		Seconds}
endscript

script drop_out_ready_sign \{Player = 1}
	FormatText ChecksumName = ready_container 'ready_container_p%d' D = <Player>
	DoScreenElementMorph Id = <ready_container> Scale = 0.5 Time = 0.1
	Wait \{0.1
		Seconds}
	FormatText ChecksumName = sound_event 'Checkbox_SFX_P%d' D = <Player>
	SoundEvent Event = <sound_event>
	DoScreenElementMorph Id = <ready_container> Scale = 1 Time = 0.1
	Wait \{0.1
		Seconds}
	DoScreenElementMorph Id = <ready_container> Alpha = 0
endscript

script change_pos_ready_sign \{Player = 1
		Pos = (0.0, 0.0)}
	if (<Player> = 1)
		if ScreenElementExists \{Id = ready_container_p1}
			SetScreenElementProps Id = ready_container_p1 Pos = <Pos>
		endif
	else
		if ScreenElementExists \{Id = ready_container_p2}
			SetScreenElementProps Id = ready_container_p2 Pos = <Pos>
		endif
	endif
endscript
