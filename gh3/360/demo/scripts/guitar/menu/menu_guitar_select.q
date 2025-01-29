guitar_select_available_guitar_array = [
]
guitar_select_available_bass_array = [
]
guitar_select_guitar_indeces = [
]
guitar_select_bass_indeces = [
]
g_old_selected_guitar_index_p1 = 0
g_old_selected_guitar_index_p2 = 0
guitar_select_old_guitar_p1 = 0
guitar_select_old_guitar_p2 = 0
guitar_select_highlighted_guitar_p1 = 0
guitar_select_highlighted_guitar_p2 = 0
guitar_select_total_num_guitars = 0
gs_selected_brand_p1 = 0
gs_old_selected_brand_p1 = 0
gs_selected_brand_p2 = 0
gs_old_selected_brand_p2 = 0
gs_made_first_selection_bool_p1 = 0
gs_made_first_selection_bool_p2 = 0
gs_guitar_brand_ID_p1 = NULL
gs_guitar_finish_ID_p1 = NULL
gs_guitar_brand_ID_p2 = NULL
gs_guitar_finish_ID_p2 = NULL
gh_net_finish_id = 0
online_guitar_highlighted_id_p1 = Instrument_ES335_Red
online_guitar_highlighted_id_p2 = Instrument_ES335_Red
online_old_guitar_id_p1 = Instrument_ES335_Red
online_old_guitar_id_p2 = Instrument_ES335_Red
gs_instrument_blurb_text = "DEFAULT INSTRUMENT BLURB"
gs_select_text = "SELECT GUITAR"
gs_element_offsets = [
	(0.0, 125.0)
	(-4.0, 185.0)
	(-4.0, 200.0)
	(-4.0, 268.0)
	(-100.0, 304.0)
	(0.0, 612.0)
]

script create_select_bass_menu 
	create_select_guitar_menu Player = <Player> instrument_type = bass
endscript

script create_select_guitar_menu \{Player = 1
		instrument_type = guitar}
	if (<Player> = 1)
		Change \{gs_made_first_selection_bool_p1 = 0}
	else
		Change \{gs_made_first_selection_bool_p2 = 0}
	endif
	build_gs_available_guitar_array <...>
	formatText checksumName = player_status 'player%i_status' i = <Player>
	if find_profile_by_id id = ($<player_status>.character_id)
		get_musician_profile_struct index = <index>
		formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
		if GetGlobalTags <default_characterguitartag> noassert = 1
			if ((<instrument_type> = bass))
				if (<current_instrument> = guitar)
					Change structurename = <player_status> instrument_id = <current_selected_bass>
					SetGlobalTags <default_characterguitartag> params = {current_instrument = bass}
					formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
					Change GlobalName = <change_flag> NewValue = 1
				endif
			elseif ((<instrument_type> = guitar))
				if (<current_instrument> = bass)
					Change structurename = <player_status> instrument_id = <current_selected_guitar>
					SetGlobalTags <default_characterguitartag> params = {current_instrument = guitar}
					formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
					Change GlobalName = <change_flag> NewValue = 1
				endif
			endif
		endif
	endif
	if (<instrument_type> = guitar)
		formatText \{checksumName = guitar_select_available_instruments
			'guitar_select_available_guitar_array'}
	else
		formatText \{checksumName = guitar_select_available_instruments
			'guitar_select_available_bass_array'}
	endif
	select_guitar_build_brand_array instrument_type = guitar gs_available_instruments = <guitar_select_available_instruments> Player = <Player>
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	event_handlers = [
		{pad_up gs_scroll_up_or_down params = {
				Player = <Player>
				Dir = up
				gs_available_instruments = <guitar_select_available_instruments>
				gs_available_brands = <gs_available_brands>
				instrument_type = <instrument_type>
			}
		}
		{pad_down gs_scroll_up_or_down params = {
				Player = <Player>
				Dir = down
				gs_available_instruments = <guitar_select_available_instruments>
				gs_available_brands = <gs_available_brands>
				instrument_type = <instrument_type>
			}
		}
		{pad_back select_guitar_go_back params = {
				Player = <Player>
				gs_available_instruments = <guitar_select_available_instruments>
				instrument_type = <instrument_type>
			}
		}
		{pad_choose select_guitar_choose params = {
				guitar_index = $guitar_select_highlighted_guitar_p1
				Player = <Player>
				gs_available_instruments = <guitar_select_available_instruments>
				gs_available_brands = <gs_available_brands>
				instrument_type = <instrument_type>
			}
		}
	]
	if (<Player> = 1)
		if ($current_num_players = 1)
			new_menu {
				scrollid = scrolling_select_guitar_p1
				vmenuid = vmenu_select_guitar_p1
				menu_pos = (120.0, 190.0)
				use_backdrop = 0
				event_handlers = <event_handlers>
			}
			vparent = vmenu_select_guitar_p1
		else
			new_menu {
				scrollid = scrolling_select_guitar_p1
				vmenuid = vmenu_select_guitar_p1
				menu_pos = (120.0, 190.0)
				use_backdrop = 0
				event_handlers = <event_handlers>
				exclusive_device = <exclusive_dev>
			}
			vparent = vmenu_select_guitar_p1
		endif
	else
		new_menu {
			scrollid = scrolling_select_guitar_p2
			vmenuid = vmenu_select_guitar_p2
			menu_pos = (700.0, 120.0)
			use_backdrop = 0
			event_handlers = <event_handlers>
			exclusive_device = <exclusive_dev>
		}
		if ($is_network_game = 1)
			vmenu_select_guitar_p2 :SetProps \{disable_pad_handling}
			LaunchEvent \{Type = unfocus
				target = vmenu_select_guitar_p2}
		endif
		vparent = vmenu_select_guitar_p2
	endif
	if ($current_num_players = 1)
		formatText checksumName = player_status 'player%i_status' i = <Player>
		their_instrument_id = ($<player_status>.instrument_id)
		get_instrument_name_and_index id = <their_instrument_id>
		select_guitar_get_available_index_from_total_index index = <instrument_index> gs_available_instruments = <guitar_select_available_instruments>
		Change guitar_select_highlighted_guitar_p1 = <index>
		Change guitar_select_old_guitar_p1 = <index>
		get_musician_instrument_struct index = <instrument_index>
		Change gs_instrument_blurb_text = (<info_struct>.blurb)
		CreateScreenElement \{Type = ContainerElement
			id = select_guitar_container
			parent = root_window
			Pos = (386.0, 0.0)}
		<brown_window_color> = [120 60 10 255]
		<window_fill_color> = [0 0 0 200]
		<cs_menu_starting_pos> = (0.0, 110.0)
		displaySprite {
			parent = select_guitar_container
			tex = window_frame_cap
			Pos = <cs_menu_starting_pos>
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <brown_window_color>
			z = 0
		}
		displaySprite {
			parent = select_guitar_container
			tex = window_fill_cap
			Pos = <cs_menu_starting_pos>
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <window_fill_color>
			z = 0
		}
		displaySprite {
			parent = select_guitar_container
			tex = window_header_01
			Pos = (<cs_menu_starting_pos> + (0.0, -40.0))
			dims = (256.0, 64.0)
			just = [center center]
			rgba = [200 200 200 255]
			z = 1
		}
		displaySprite {
			parent = select_guitar_container
			tex = window_frame_body_tall
			Pos = (<cs_menu_starting_pos> + (0.0, 32.0))
			dims = (256.0, 434.0)
			just = [center top]
			rgba = <brown_window_color>
			z = 0
		}
		displaySprite {
			parent = select_guitar_container
			tex = window_fill_body_large
			Pos = (<cs_menu_starting_pos> + (0.0, 32.0))
			dims = (256.0, 498.0)
			just = [center top]
			rgba = <window_fill_color>
			z = 0
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = select_guitar_container
			Pos = (<cs_menu_starting_pos> + (-2.0, 430.0))
			dims = (242.0, 128.0)
			just = [center top]
			texture = store_frame_bottom_bg
			z_priority = 1
			rgba = <brown_window_color>
			flip_h
			flip_v
		}
		displayText {
			parent = select_guitar_container
			text = "SELECT GUITAR"
			Pos = ($gs_element_offsets [0])
			Scale = (0.6, 0.55)
			font = fontgrid_title_gh3
			just = [center center]
			rgba = [185 100 60 255]
			z = 1
		}
		displaySprite {
			id = gs_brand_background
			parent = select_guitar_container
			tex = Char_Select_Frame_BG
			Pos = ($gs_element_offsets [2])
			dims = (266.0, 128.0)
			just = [center center]
			rgba = [250 250 200 255]
			z = 1
		}
		get_instrument_brand_and_finish id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
		displayText {
			parent = select_guitar_container
			text = <instrument_brand>
			Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
			Scale = 1
			font = fontgrid_title_gh3
			just = [center center]
			rgba = [160 80 30 255]
			z = 2
		}
		Change gs_guitar_brand_ID_p1 = <id>
		GetScreenElementDims \{id = $gs_guitar_brand_ID_p1}
		if (<width> > 260)
			SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
		CreateScreenElement {
			Type = TextBlockElement
			parent = select_guitar_container
			text = <instrument_name2>
			Pos = ($gs_element_offsets [3])
			Scale = (0.55, 0.55)
			dims = (440.0, 300.0)
			font = text_a4
			just = [center center]
			rgba = [255 255 200 255]
			z = 2
		}
		Change gs_guitar_finish_ID_p1 = <id>
		get_instrument_logo id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
		displayText {
			id = gs_guitar_logo_ID_p1
			parent = select_guitar_container
			text = <instrument_logo>
			Pos = ($gs_element_offsets [5])
			Scale = 0.8
			font = fontgrid_title_gh3
			just = [center center]
			rgba = [250 250 200 255]
			z = 2
		}
		CreateScreenElement {
			Type = WindowElement
			parent = select_guitar_container
			id = gs_instrument_info_scroll_window
			Pos = ($gs_element_offsets [4])
			dims = (388.0, 250.0)
		}
		SpawnScriptNow {
			select_guitar_scroll_instrument_info
			params = {
				parent = gs_instrument_info_scroll_window
				Pos = (($gs_element_offsets [4]) + (0.0, -10.0))
			}
		}
	else
		if (<instrument_type> = guitar)
			Change \{gs_select_text = "SELECT GUITAR"}
		elseif (<instrument_type> = bass)
			Change \{gs_select_text = "SELECT BASS"}
		endif
		if (<Player> = 1)
			formatText checksumName = player_status 'player%i_status' i = <Player>
			if find_profile_by_id id = ($<player_status>.character_id)
				get_musician_profile_struct index = <index>
				formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player> AddToStringLookup = true
				if GetGlobalTags <default_characterguitartag> noassert = 1
					if (<instrument_type> = guitar)
						<their_instrument_id> = <current_selected_guitar>
					else
						<their_instrument_id> = <current_selected_bass>
					endif
					get_instrument_name_and_index id = <their_instrument_id>
					select_guitar_get_available_index_from_total_index index = <instrument_index> gs_available_instruments = <guitar_select_available_instruments>
					Change guitar_select_highlighted_guitar_p1 = <index>
					Change guitar_select_old_guitar_p1 = <index>
					if NOT (<their_instrument_id> = $<player_status>.instrument_id)
						KillSpawnedScript \{Name = Store_Update_Player_Status}
						SpawnScriptNow Store_Update_Player_Status params = {Player = <Player> instrument_id = <their_instrument_id>}
					endif
				endif
			endif
			CreateScreenElement \{Type = ContainerElement
				id = select_guitar_container
				parent = root_window
				Pos = (460.0, 500.0)}
			displaySprite \{parent = select_guitar_container
				tex = guitar_select_2p_frame
				just = [
					center
					center
				]
				dims = (256.0, 432.0)
				Pos = (0.0, 40.0)
				z = 0}
			displaySprite \{parent = select_guitar_container
				tex = guitar_select_2p_wing
				just = [
					center
					center
				]
				Pos = (140.0, -24.0)
				z = 0}
			displaySprite \{parent = select_guitar_container
				tex = guitar_select_2p_wing
				just = [
					center
					center
				]
				Pos = (-140.0, -24.0)
				z = 0
				flip_v}
			displayText \{id = gs_select_guitar_text_p1
				parent = select_guitar_container
				text = $gs_select_text
				Pos = (0.0, -30.0)
				Scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [
					center
					center
				]
				rgba = [
					175
					105
					40
					255
				]
				z = 1}
			displaySprite \{id = gs_brand_background_p1
				parent = select_guitar_container
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				dims = (266.0, 128.0)
				just = [
					center
					center
				]
				rgba = [
					250
					250
					200
					255
				]
				z = 1}
			displaySprite \{id = gs_finish_background_p1
				parent = select_guitar_container
				tex = white
				Pos = (0.0, 88.0)
				dims = (266.0, 32.0)
				just = [
					center
					center
				]
				rgba = [
					120
					0
					0
					255
				]
				z = 1}
			get_instrument_brand_and_finish id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
			displayText {
				parent = select_guitar_container
				text = <instrument_brand>
				Pos = (0.0, 10.0)
				Scale = 1
				font = text_a4
				just = [center center]
				rgba = [80 0 10 255]
				z = 2
				noshadow
			}
			Change gs_guitar_brand_ID_p1 = <id>
			GetScreenElementDims \{id = $gs_guitar_brand_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			get_instrument_logo id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
			displayText {
				id = gs_guitar_logo_ID_p1
				parent = select_guitar_container
				text = <instrument_logo>
				Pos = (0.0, 40.0)
				Scale = 0.6
				font = text_a4
				just = [center center]
				rgba = [0 0 0 255]
				z = 2
				noshadow
			}
			displayText {
				parent = select_guitar_container
				text = <instrument_name2>
				Pos = (0.0, 83.0)
				Scale = (0.75, 0.5)
				font = text_a4
				just = [center center]
				rgba = [250 250 200 255]
				z = 2
				noshadow
			}
			Change gs_guitar_finish_ID_p1 = <id>
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 83.0)
			endif
		else
			formatText checksumName = player_status 'player%i_status' i = <Player>
			if find_profile_by_id id = ($<player_status>.character_id)
				get_musician_profile_struct index = <index>
				formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player> AddToStringLookup = true
				if GetGlobalTags <default_characterguitartag> noassert = 1
					if (<instrument_type> = guitar)
						<their_instrument_id> = <current_selected_guitar>
					else
						<their_instrument_id> = <current_selected_bass>
					endif
					get_instrument_name_and_index id = <their_instrument_id>
					select_guitar_get_available_index_from_total_index index = <instrument_index> gs_available_instruments = <guitar_select_available_instruments>
					Change guitar_select_highlighted_guitar_p2 = <index>
					Change guitar_select_old_guitar_p2 = <index>
					if NOT (<their_instrument_id> = $<player_status>.instrument_id)
						KillSpawnedScript \{Name = Store_Update_Player_Status}
						SpawnScriptNow Store_Update_Player_Status params = {Player = <Player> instrument_id = <their_instrument_id>}
					endif
				endif
			endif
			CreateScreenElement \{Type = ContainerElement
				id = select_guitar_container_p2
				parent = root_window
				Pos = (810.0, 500.0)}
			displaySprite \{parent = select_guitar_container_p2
				tex = guitar_select_2p_frame
				just = [
					center
					center
				]
				dims = (256.0, 432.0)
				Pos = (0.0, 40.0)
				z = 0}
			displaySprite \{parent = select_guitar_container_p2
				tex = guitar_select_2p_wing
				just = [
					center
					center
				]
				Pos = (140.0, -24.0)
				z = 0}
			displaySprite \{parent = select_guitar_container_p2
				tex = guitar_select_2p_wing
				just = [
					center
					center
				]
				Pos = (-140.0, -24.0)
				z = 0
				flip_v}
			displayText \{id = gs_select_guitar_text_p2
				parent = select_guitar_container_p2
				text = $gs_select_text
				Pos = (0.0, -30.0)
				Scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [
					center
					center
				]
				rgba = [
					140
					110
					150
					255
				]
				z = 1}
			displaySprite \{id = gs_brand_background_p2
				parent = select_guitar_container_p2
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				dims = (266.0, 128.0)
				just = [
					center
					center
				]
				rgba = [
					240
					210
					250
					255
				]
				z = 1}
			displaySprite \{id = gs_finish_background_p2
				parent = select_guitar_container_p2
				tex = white
				Pos = (0.0, 88.0)
				dims = (266.0, 32.0)
				just = [
					center
					center
				]
				rgba = [
					110
					0
					90
					255
				]
				z = 1}
			get_instrument_brand_and_finish id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p2])
			displayText {
				parent = select_guitar_container_p2
				text = <instrument_brand>
				Pos = (0.0, 10.0)
				Scale = 1
				font = text_a4
				just = [center center]
				rgba = [70 0 50 255]
				z = 2
				noshadow
			}
			Change gs_guitar_brand_ID_p2 = <id>
			GetScreenElementDims \{id = $gs_guitar_brand_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_brand_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			get_instrument_logo id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p2])
			displayText {
				id = gs_guitar_logo_ID_p2
				parent = select_guitar_container_p2
				text = <instrument_logo>
				Pos = (0.0, 40.0)
				Scale = 0.6
				font = text_a4
				just = [center center]
				rgba = [0 0 0 255]
				z = 2
				noshadow
			}
			displayText {
				parent = select_guitar_container_p2
				text = <instrument_name2>
				Pos = (0.0, 83.0)
				Scale = (0.75, 0.5)
				font = text_a4
				just = [center center]
				rgba = [240 210 250 255]
				z = 2
				noshadow
			}
			Change gs_guitar_finish_ID_p2 = <id>
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 83.0)
			endif
		endif
	endif
	if (<Player> = 1)
		get_instrument_name_and_index id = ($player1_status.instrument_id)
		Change g_old_selected_guitar_index_p1 = <instrument_index>
	else
		get_instrument_name_and_index id = ($player2_status.instrument_id)
		Change g_old_selected_guitar_index_p2 = <instrument_index>
	endif
	formatText checksumName = player_status 'player%i_status' i = <Player>
	if ($current_num_players = 1)
		Change \{using_guitar_select_camera = 1}
		Change \{lock_guitar_select_camera = 1}
		char_name = ($<player_status>.band_member)
		LaunchEvent Type = unfocus target = <vparent>
		if CompositeObjectExists Name = <char_name>
			<char_name> :Ragdoll_MarkForReset
			<char_name> :handle_change_stance stance = stance_frontend_guitar speed = 2.0 no_wait
		endif
		PlayIGCCam \{id = gs_view_cam_id
			Name = gs_view_cam
			viewport = bg_viewport
			controlscript = guitar_select_camera_morph
			LockTo = World
			Pos = (10.0, 5.0, 1.580106)
			Quat = (0.028251, -0.9906429, 0.13347001)
			FOV = 72.0
			play_hold = 1
			interrupt_current
			time = 0.5}
		begin
		if ($lock_guitar_select_camera = 0)
			LaunchEvent Type = focus target = <vparent>
			break
		else
			Wait \{1
				gameframe}
		endif
		repeat
	endif
endscript
using_guitar_select_camera = 0
lock_guitar_select_camera = 0

script guitar_select_camera_morph 
	Change \{lock_guitar_select_camera = 1}
	CCam_DoMorph \{LockTo = World
		Pos = (2.503113, 1.0385579, 2.869411)
		Quat = (0.028074998, -0.999026, 0.020287)
		FOV = 78.0}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = GUITARIST
		LockToBone = bone_guitar_neck
		Pos = (0.05, 0.6, -0.4)
		Quat = (0.48735002, 0.463712, -0.514474)
		FOV = 120.0
		time = 0.5
		motion = smooth}
	ScreenFX_AddFXInstance \{viewport = bg_viewport
		Name = GSdof
		scefName = DOF
		time = 0.5
		Type = DOF
		On = 1
		BackDist = 0.003
		Strength = 0.6
		BlurRadius = 6
		BlurResolution = half}
	ScreenFX_AddFXInstance \{viewport = bg_viewport
		Name = GSdof2
		scefName = DoF2
		time = 0.5
		Type = DOF
		On = 1
		BackDist = 0.01
		Strength = 1.0
		BlurRadius = 6
		BlurResolution = half}
	CCam_WaitMorph
	CCam_Freeze
	Change \{lock_guitar_select_camera = 0}
endscript

script select_guitar_build_brand_array \{instrument_type = guitar
		Player = 1}
	GetArraySize <gs_available_instruments> globalarray
	<our_array_size> = <array_Size>
	get_musician_instrument_size
	<their_array_size> = <array_Size>
	gs_available_brands = []
	<i> = 0
	begin
	<j> = 0
	begin
	get_musician_instrument_struct index = <j>
	if (($<gs_available_instruments> [<i>]) = (<info_struct>.desc_id))
		<k> = 0
		<found_brand> = 0
		GetArraySize (<gs_available_brands>)
		if (<array_Size> > 0)
			begin
			if ((<gs_available_brands> [<k>]) = (<info_struct>.Name))
				<found_brand> = 1
				formatText checksumName = player_status 'player%i_status' i = <Player>
				if (($<player_status>.instrument_id) = (<info_struct>.desc_id))
					if (<Player> = 1)
						Change gs_selected_brand_p1 = <k>
					else
						Change gs_selected_brand_p2 = <k>
					endif
				endif
				break
			endif
			<k> = (<k> + 1)
			repeat <array_Size>
		endif
		if (<found_brand> = 0)
			AddArrayElement array = (<gs_available_brands>) element = (<info_struct>.Name)
			<gs_available_brands> = (<array>)
			formatText checksumName = player_status 'player%i_status' i = <Player>
			if (($<player_status>.instrument_id) = (<info_struct>.desc_id))
				if (<Player> = 1)
					Change gs_selected_brand_p1 = <array_Size>
				else
					Change gs_selected_brand_p2 = <array_Size>
				endif
			endif
		endif
	endif
	<j> = (<j> + 1)
	repeat <their_array_size>
	<i> = (<i> + 1)
	repeat <our_array_size>
	return gs_available_brands = <gs_available_brands>
endscript

script select_guitar_build_finish_array \{instrument_type = guitar}
	GetArraySize <gs_available_instruments> globalarray
	<our_array_size> = <array_Size>
	get_musician_instrument_size
	<their_array_size> = <array_Size>
	gs_available_finishes = []
	<i> = 0
	begin
	<j> = 0
	begin
	get_musician_instrument_struct index = <j>
	if (($<gs_available_instruments> [<i>]) = (<info_struct>.desc_id))
		get_instrument_brand_and_finish id = (<info_struct>.desc_id)
		if (<instrument_brand> = <brand>)
			AddArrayElement array = (<gs_available_finishes>) element = (<info_struct>.desc_id)
			<gs_available_finishes> = (<array>)
		endif
	endif
	<j> = (<j> + 1)
	repeat <their_array_size>
	<i> = (<i> + 1)
	repeat <our_array_size>
	return gs_available_finishes = <gs_available_finishes>
endscript

script destroy_select_guitar_menu \{Player = 1}
	if (<Player> = 1)
		destroy_menu \{menu_id = scrolling_select_guitar_p1}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
		if ($current_num_players = 1)
			KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
		endif
		destroy_menu \{menu_id = gs_instrument_info_scroll_window}
		destroy_menu \{menu_id = select_guitar_container}
		destroy_menu \{menu_id = select_finish_container}
	else
		destroy_menu \{menu_id = scrolling_select_guitar_p2}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
		destroy_menu \{menu_id = select_guitar_container_p2}
		destroy_menu \{menu_id = select_finish_container_p2}
	endif
	formatText checksumName = player_status 'player%i_status' i = <Player>
	<band_member> = ($<player_status>.band_member)
	if CompositeObjectExists Name = <band_member>
		if <band_member> :Anim_AnimNodeExists id = BodyTimer
			<band_member> :Anim_Command target = BodyTimer Command = Timer_SetSpeed params = {speed = 1.0}
		endif
	endif
	if ($current_num_players = 1)
		KillCamAnim \{Name = gs_view_cam}
	endif
endscript
guitar_select_camera_changing = 0

script guitar_select_exit_camera_morph 
	Change \{guitar_select_camera_changing = 1}
	CCam_DoMorph \{LockTo = GUITARIST
		LockToBone = bone_guitar_neck
		Pos = (0.05, 0.618989, -0.4)
		Quat = (0.48735002, 0.463712, -0.514474)
		FOV = 120.0
		motion = smooth}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = World
		Pos = (2.503113, 1.0385579, 2.869411)
		Quat = (0.028074998, -0.999026, 0.020287)
		FOV = 78.0
		time = 0.5
		motion = smooth}
	ScreenFX_UpdateFXInstanceParams \{viewport = bg_viewport
		Name = GSdof
		time = 0.5
		Type = DOF
		On = 1
		BackDist = 0.003
		Strength = 0
		BlurRadius = 6
		BlurResolution = half}
	ScreenFX_UpdateFXInstanceParams \{viewport = bg_viewport
		Name = GSdof2
		time = 0.5
		Type = DOF
		On = 1
		BackDist = 0.01
		Strength = 0
		BlurRadius = 6
		BlurResolution = half}
	CCam_WaitMorph
	ScreenFX_RemoveFXInstance \{viewport = bg_viewport
		Name = GSdof}
	ScreenFX_RemoveFXInstance \{viewport = bg_viewport
		Name = GSdof2
		time = 2}
	Change \{guitar_select_camera_changing = 0}
endscript

script wait_for_guitar_select_exit_camera 
	Wait \{5
		gameframes}
	begin
	if ($guitar_select_camera_changing = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script gs_wait_to_load_guitar_p1 
	Wait \{0.2
		Second}
	Change \{GlobalName = generic_select_monitor_p1_changed
		NewValue = 1}
endscript

script gs_wait_to_load_guitar_p2 
	Wait \{0.2
		Second}
	Change \{GlobalName = generic_select_monitor_p2_changed
		NewValue = 1}
endscript

script gs_scroll_up_or_down \{Player = 1
		Dir = down}
	generic_menu_up_or_down_sound params = {<Dir>}
	if (<Player> = 1)
		if ($gs_made_first_selection_bool_p1 = 0)
			GetArraySize (gs_available_brands)
			<avail_size> = <array_Size>
			if (<Dir> = down)
				Change gs_selected_brand_p1 = ($gs_selected_brand_p1 + 1)
				if ($gs_selected_brand_p1 = <avail_size>)
					Change \{gs_selected_brand_p1 = 0}
				endif
			endif
			if (<Dir> = up)
				Change gs_selected_brand_p1 = ($gs_selected_brand_p1 - 1)
				if ($gs_selected_brand_p1 = -1)
					Change gs_selected_brand_p1 = (<avail_size> - 1)
				endif
			endif
			<inst_ID> = 0
			select_guitar_get_first_guitar_brand_in_list {
				brand = (<gs_available_brands> [$gs_selected_brand_p1])
				instrument_type = <instrument_type>
				gs_available_instruments = <gs_available_instruments>
			}
			<inst_ID> = <instrument_id>
			Change guitar_select_highlighted_guitar_p1 = <instrument_index>
			formatText checksumName = player_status 'player%i_status' i = <Player>
			if NOT (<inst_ID> = $<player_status>.instrument_id)
				KillSpawnedScript \{Name = Store_Update_Player_Status}
				SpawnScriptNow Store_Update_Player_Status params = {Player = <Player> instrument_id = <inst_ID>}
				if ($current_num_players = 1)
					select_guitar_change_blurb_text inst_ID = <inst_ID>
				endif
			endif
			if (($is_network_game) = 1)
				Change online_guitar_highlighted_id_p1 = ($<player_status>.instrument_id)
				if (<Dir> = up)
					dir_value = 0
				else
					dir_value = 1
				endif
				network_player_lobby_message {
					Type = guitar_select
					action = update
					checksum = <instrument_type>
					value1 = <dir_value>
				}
			endif
			get_instrument_brand_and_finish id = <inst_ID>
			SetScreenElementProps id = $gs_guitar_brand_ID_p1 text = <instrument_brand>
			SetScreenElementProps id = $gs_guitar_finish_ID_p1 text = <instrument_name2>
			if ($current_num_players = 1)
				SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
					Scale = 1}
				GetScreenElementDims \{id = $gs_guitar_brand_ID_p1}
				if (<width> > 260)
					fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
				endif
			else
				SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
					Scale = 1}
				GetScreenElementDims \{id = $gs_guitar_brand_ID_p1}
				if (<width> > 260)
					fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
				endif
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p1
					Scale = 1}
				GetScreenElementDims \{id = $gs_guitar_finish_ID_p1}
				if (<width> > 260)
					fit_text_in_rectangle id = $gs_guitar_finish_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 0.5))) Pos = (0.0, 83.0)
				else
					SetScreenElementProps \{id = $gs_guitar_finish_ID_p1
						Scale = (0.75, 0.5)}
				endif
			endif
			get_instrument_logo id = <inst_ID>
			SetScreenElementProps id = gs_guitar_logo_ID_p1 text = <instrument_logo>
		endif
	else
		if ($gs_made_first_selection_bool_p2 = 0)
			GetArraySize (gs_available_brands)
			<avail_size> = <array_Size>
			if (<Dir> = down)
				Change gs_selected_brand_p2 = ($gs_selected_brand_p2 + 1)
				if ($gs_selected_brand_p2 = <avail_size>)
					Change \{gs_selected_brand_p2 = 0}
				endif
			endif
			if (<Dir> = up)
				Change gs_selected_brand_p2 = ($gs_selected_brand_p2 - 1)
				if ($gs_selected_brand_p2 = -1)
					Change gs_selected_brand_p2 = (<avail_size> - 1)
				endif
			endif
			<inst_ID> = 0
			select_guitar_get_first_guitar_brand_in_list {
				brand = (<gs_available_brands> [$gs_selected_brand_p2])
				instrument_type = <instrument_type>
				gs_available_instruments = <gs_available_instruments>
			}
			Change guitar_select_highlighted_guitar_p2 = <instrument_index>
			<inst_ID> = <instrument_id>
			formatText checksumName = player_status 'player%i_status' i = <Player>
			if NOT (<inst_ID> = $<player_status>.instrument_id)
				KillSpawnedScript \{Name = Store_Update_Player_Status}
				SpawnScriptNow Store_Update_Player_Status params = {Player = <Player> instrument_id = <inst_ID>}
			endif
			get_instrument_brand_and_finish id = <inst_ID>
			SetScreenElementProps id = $gs_guitar_brand_ID_p2 text = <instrument_brand>
			SetScreenElementProps id = $gs_guitar_finish_ID_p2 text = <instrument_name2>
			SetScreenElementProps \{id = $gs_guitar_brand_ID_p2
				Scale = 1}
			GetScreenElementDims \{id = $gs_guitar_brand_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle id = $gs_guitar_brand_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			SetScreenElementProps \{id = $gs_guitar_finish_ID_p2
				Scale = 1}
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle id = $gs_guitar_finish_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 0.5))) Pos = (0.0, 83.0)
			else
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p2
					Scale = (0.75, 0.5)}
			endif
			get_instrument_logo id = <inst_ID>
			SetScreenElementProps id = gs_guitar_logo_ID_p2 text = <instrument_logo>
		endif
	endif
endscript

script select_guitar_go_back \{Player = 1
		instrument_type = guitar}
	if (<Player> = 1)
		instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p1)])
		Change \{guitar_select_highlighted_guitar_p1 = $guitar_select_old_guitar_p1}
		Change \{gs_selected_brand_p1 = $gs_old_selected_brand_p1}
		if ($is_network_game = 1)
			get_musician_instrument_type desc_id = <instrument_id>
			if (<instrument_type> = guitar)
				Change player1_selected_guitar = <instrument_id>
			else
				Change player1_selected_bass = <instrument_id>
			endif
		endif
	else
		instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p2)])
		Change \{guitar_select_highlighted_guitar_p2 = $guitar_select_old_guitar_p2}
		Change \{gs_selected_brand_p2 = $gs_old_selected_brand_p2}
	endif
	formatText checksumName = player_status 'player%i_status' i = <Player>
	if NOT (<instrument_id> = $<player_status>.instrument_id)
		Change structurename = <player_status> instrument_id = <instrument_id>
		if NOT ($is_network_game)
			if find_profile_by_id id = ($<player_status>.character_id)
				get_musician_profile_struct index = <index>
				formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
				if (<instrument_type> = guitar)
					SetGlobalTags <default_characterguitartag> params = {current_instrument = guitar current_selected_guitar = <instrument_id>}
				else
					SetGlobalTags <default_characterguitartag> params = {current_instrument = bass current_selected_bass = <instrument_id>}
				endif
			endif
		endif
		formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
		Change GlobalName = <change_flag> NewValue = 1
		if ($current_num_players = 1)
			select_guitar_change_blurb_text inst_ID = <instrument_id>
		endif
		generic_select_monitor_wait
	endif
	if NOT ($is_network_game)
		if find_profile_by_id id = ($<player_status>.character_id)
			get_musician_profile_struct index = <index>
			formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player> AddToStringLookup = true
			SetGlobalTags <default_characterguitartag> params = {current_instrument = <instrument_type>}
		endif
	endif
	ui_flow_manager_respond_to_action action = go_back Player = <Player>
endscript

script select_guitar_menu_lose_focus 
	GetTags
	SetScreenElementProps id = <id> rgba = [180 100 60 255]
endscript

script select_guitar_choose \{Player = 1
		needs_net_message = 1
		includes_finish = 0}
	SoundEvent \{event = ui_sfx_select}
	if (<Player> = 1)
		if ($gs_made_first_selection_bool_p1 = 1)
			<inst_ID> = ($<gs_available_instruments> [($guitar_select_highlighted_guitar_p1)])
			Change structurename = player1_status instrument_id = <inst_ID>
			if find_profile_by_id id = ($player1_status.character_id)
				get_musician_profile_struct index = <index>
				formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
				if (<instrument_type> = guitar)
					SetGlobalTags <default_characterguitartag> params = {current_instrument = guitar current_selected_guitar = <inst_ID>}
					Change player1_selected_guitar = <inst_ID>
				else
					SetGlobalTags <default_characterguitartag> params = {current_instrument = bass current_selected_bass = <inst_ID>}
					Change player1_selected_bass = <inst_ID>
				endif
			endif
			Change \{guitar_select_old_guitar_p1 = $guitar_select_highlighted_guitar_p1}
			Change \{gs_old_selected_brand_p1 = $gs_selected_brand_p1}
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		else
			select_guitar_create_finish_menu gs_available_instruments = <gs_available_instruments> Player = <Player> instrument_type = <instrument_type>
			Change \{gs_made_first_selection_bool_p1 = 1}
		endif
	else
		if ($gs_made_first_selection_bool_p2 = 1)
			<inst_ID> = ($<gs_available_instruments> [($guitar_select_highlighted_guitar_p2)])
			Change structurename = player2_status instrument_id = <inst_ID>
			if NOT ($is_network_game)
				if find_profile_by_id id = ($player2_status.character_id)
					get_musician_profile_struct index = <index>
					formatText checksumName = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
					if (<instrument_type> = guitar)
						SetGlobalTags <default_characterguitartag> params = {current_instrument = guitar current_selected_guitar = <inst_ID>}
					else
						SetGlobalTags <default_characterguitartag> params = {current_instrument = bass current_selected_bass = <inst_ID>}
					endif
				endif
			endif
			Change \{guitar_select_old_guitar_p2 = $guitar_select_highlighted_guitar_p2}
			Change \{gs_old_selected_brand_p2 = $gs_selected_brand_p2}
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		else
			select_guitar_create_finish_menu gs_available_instruments = <gs_available_instruments> Player = <Player> instrument_type = <instrument_type>
			Change \{gs_made_first_selection_bool_p2 = 1}
		endif
	endif
endscript

script get_instrument_name_and_index 
	get_musician_instrument_size
	index = 0
	begin
	get_musician_instrument_struct index = <index>
	if (<id> = (<info_struct>.desc_id))
		return instrument_name = (<info_struct>.Name) instrument_index = <index>
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	get_instrument_name_and_index \{id = instrument_explorer_white}
	return instrument_name = (<info_struct>.Name) instrument_index = <index> FALSE
endscript

script get_player_instrument_desc_name \{Player = 1}
	if (<Player> = 1)
		instrument_id = ($player1_status.instrument_id)
	else
		instrument_id = ($player2_status.instrument_id)
	endif
	find_instrument_index desc_id = (<instrument_id>)
	if GotParam \{FALSE}
		return \{FALSE
			instrument_name = "Instrument not found"}
	else
		get_musician_instrument_struct index = <index>
		return true instrument_name = (<info_struct>.desc_name)
	endif
endscript

script get_instrument_brand_and_finish 
	get_musician_instrument_size
	index = 0
	begin
	get_musician_instrument_struct index = <index>
	if (<id> = (<info_struct>.desc_id))
		<ins_fin> = (<info_struct>.finish)
		if GotParam \{ins_fin}
			GetUpperCaseString <ins_fin>
			gitaf_instrument_finish = <UppercaseString>
		else
			gitaf_instrument_finish = "Something Bad Happened..."
		endif
		<ins_name2> = (<info_struct>.name2)
		if GotParam \{ins_name2}
			GetUpperCaseString <ins_name2>
			gitaf_instrument_name2 = <UppercaseString>
		else
			gitaf_instrument_name2 = "Something Bad Happened..."
		endif
		<ins_brand> = (<info_struct>.Name)
		if GotParam \{ins_fin}
			GetUpperCaseString <ins_brand>
			gitaf_instrument_brand = <UppercaseString>
		else
			gitaf_instrument_brand = "Something Bad Happened..."
		endif
		return instrument_brand = <gitaf_instrument_brand> instrument_finish = <gitaf_instrument_finish> instrument_name2 = <gitaf_instrument_name2>
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	return \{instrument_brand = "Brand Not Found!!!"
		instrument_finish = "Finish Not Found!!!"}
endscript

script get_instrument_logo 
	get_musician_instrument_size
	index = 0
	begin
	get_musician_instrument_struct index = <index>
	if (<id> = (<info_struct>.desc_id))
		<ins_logo> = (<info_struct>.logo)
		if GotParam \{ins_logo}
			GetUpperCaseString <ins_logo>
			gitaf_instrument_logo = <UppercaseString>
		else
			gitaf_instrument_logo = "Something Bad Happened..."
		endif
		return instrument_logo = <gitaf_instrument_logo>
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	return \{instrument_logo = "Logo Not Found!!!"}
endscript

script select_guitar_change_blurb_text \{lines_in_window = 8}
	if GotParam \{inst_ID}
		get_instrument_name_and_index id = <inst_ID>
		get_musician_instrument_struct index = <instrument_index>
		Change gs_instrument_blurb_text = (<info_struct>.blurb)
	else
		Change gs_instrument_blurb_text = <text>
	endif
	KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	CreateScreenElement {
		Type = WindowElement
		parent = select_guitar_container
		id = gs_instrument_info_scroll_window
		Pos = ($gs_element_offsets [4])
		dims = (388.0, 250.0)
	}
	my_pos = (($gs_element_offsets [4]) + (0.0, -10.0))
	my_x_dims = 362
	if GotParam \{dims}
		gs_instrument_info_scroll_window :SetProps dims = <dims>
	endif
	if GotParam \{x_dims}
		<my_x_dims> = <x_dims>
	endif
	if GotParam \{Pos}
		<my_pos> = <Pos>
		gs_instrument_info_scroll_window :SetProps Pos = <my_pos>
	endif
	my_z = 2
	if GotParam \{z}
		<my_z> = <z>
	endif
	SpawnScriptNow {
		select_guitar_scroll_instrument_info
		params = {
			parent = gs_instrument_info_scroll_window
			x_dims = <my_x_dims>
			z = <my_z>
			Pos = <my_pos>
			lines_in_window = <lines_in_window>
		}
	}
endscript

script select_guitar_scroll_instrument_info \{z = 2
		x_dims = 362}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <parent>
		just = [left top]
		internal_just = [left top]
		Pos = (0.0, 0.0)
		Scale = (0.58, 0.6)
		text = $gs_instrument_blurb_text
		font = text_a4
		rgba = [235 145 80 255]
		z_priority = <z>
		dims = (<x_dims> * (1.0, 0.0))
		allow_expansion
		line_spacing = 1.25
	}
	<text_id> = <id>
	SetScreenElementLock id = <text_id> On
	<text_id> :GetParentID
	GetScreenElementDims id = <parent_id>
	<parent_height> = <height>
	GetScreenElementDims id = <text_id>
	GetScreenElementChildren id = <text_id>
	GetArraySize (<children>)
	<line_nums> = (<array_Size> + 0.01)
	<pixels_per_line> = (<height> / <line_nums>)
	<fade_time> = 1.5
	<idle_time> = 3.5
	<black_time> = 0.2
	begin
	<text_id> :DoMorph alpha = 0 Pos = (0.0, 0.0)
	<text_id> :DoMorph alpha = 1 time = <fade_time>
	if (<height> <= <parent_height>)
		break
	endif
	Wait <idle_time> Seconds
	<diff> = (<height> - <parent_height> + 2.1)
	<lines_to_scroll> = (<diff> / <pixels_per_line>)
	<rate> = 1.0
	<text_id> :DoMorph Pos = (<diff> * (0.0, -1.0)) time = (<rate> * <lines_to_scroll>)
	Wait <idle_time> Seconds
	<text_id> :DoMorph alpha = 0 time = <fade_time>
	Wait <black_time> Seconds
	repeat
endscript

script select_guitar_get_first_guitar_brand_in_list \{brand = explorer}
	<i> = 0
	GetArraySize <gs_available_instruments> globalarray
	total_size = <array_Size>
	begin
	if (<instrument_type> = guitar)
		get_musician_instrument_struct index = ($guitar_select_guitar_indeces [<i>])
	else
		get_musician_instrument_struct index = ($guitar_select_bass_indeces [<i>])
	endif
	if ((<info_struct>.Name) = <brand>)
		return instrument_id = (<info_struct>.desc_id) instrument_index = <i>
	endif
	<i> = (<i> + 1)
	repeat <total_size>
endscript

script select_guitar_get_available_index_from_total_index \{index = 0}
	<i> = 0
	GetArraySize <gs_available_instruments> globalarray
	<avail_size> = <array_Size>
	begin
	get_musician_instrument_struct index = <index>
	if (($<gs_available_instruments> [<i>]) = (<info_struct>.desc_id))
		return index = <i>
	endif
	<i> = (<i> + 1)
	repeat <avail_size>
endscript

script select_guitar_create_finish_menu \{Player = 1}
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back select_guitar_go_back_from_finish_menu params = {gs_available_instruments = <gs_available_instruments> Player = <Player> instrument_type = <instrument_type>}}
	]
	<p1_menu_pos> = (566.0, 480.0)
	<p2_menu_pos> = (786.0, 490.0)
	<menu_offset> = (-270.0, -160.0)
	if (<Player> = 1)
		if ($current_num_players = 2)
			new_menu {
				scrollid = scrolling_guitar_finish_menu_p1
				vmenuid = vmenu_guitar_finish_menu_p1
				use_backdrop = 0
				event_handlers = <event_handlers>
				menu_pos = (<p1_menu_pos> + (-178.0, -210.0))
				exclusive_device = <exclusive_dev>
				internal_just = [center top]
			}
		else
			new_menu {
				scrollid = scrolling_guitar_finish_menu_p1
				vmenuid = vmenu_guitar_finish_menu_p1
				use_backdrop = 0
				event_handlers = <event_handlers>
				menu_pos = (<p1_menu_pos> + <menu_offset>)
				internal_just = [center top]
				text_left
			}
			KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
			destroy_menu \{menu_id = gs_instrument_info_scroll_window}
		endif
		vparent = vmenu_guitar_finish_menu_p1
	else
		new_menu {
			scrollid = scrolling_guitar_finish_menu_p2
			vmenuid = vmenu_guitar_finish_menu_p2
			use_backdrop = 0
			event_handlers = <event_handlers>
			menu_pos = <p2_menu_pos>
			exclusive_device = <exclusive_dev>
			internal_just = [center top]
		}
		if ($is_network_game = 1)
			vmenu_guitar_finish_menu_p2 :SetProps \{disable_pad_handling}
			LaunchEvent \{Type = unfocus
				target = vmenu_guitar_finish_menu_p2}
		endif
		vparent = vmenu_guitar_finish_menu_p2
	endif
	if (<Player> = 1)
		LaunchEvent \{Type = unfocus
			target = scrolling_select_guitar_p1}
	else
		if NOT ($is_network_game)
			LaunchEvent \{Type = unfocus
				target = scrolling_select_guitar_p2}
		endif
	endif
	if ($current_num_players = 1)
		CreateScreenElement {
			Type = ContainerElement
			id = select_finish_container
			parent = root_window
			Pos = (<p1_menu_pos> + <menu_offset>)
			internal_just = [center top]
		}
		<brown_window_color> = [120 60 10 255]
		SetScreenElementProps {
			id = gs_brand_background
			texture = store_frame_bottom_bg
			dims = (242.0, 128.0)
			rgba = <brown_window_color>
		}
		SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
			rgba = [
				250
				250
				200
				255
			]
			Scale = 0.8}
		GetScreenElementDims \{id = $gs_guitar_brand_ID_p1}
		if (<width> > 260)
			SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((215.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
		displaySprite \{id = gs_bookend1_ID
			parent = select_finish_container
			tex = character_hub_hilite_bookend
			dims = (24.0, 24.0)
			just = [
				left
				top
			]
			rgba = [
				255
				255
				205
				255
			]
			Pos = (-64.0, 11.0)
			z = 4}
		displaySprite \{id = gs_bookend2_ID
			parent = select_finish_container
			tex = character_hub_hilite_bookend
			dims = (24.0, 24.0)
			just = [
				right
				top
			]
			rgba = [
				255
				255
				205
				255
			]
			Pos = (238.0, 11.0)
			z = 4}
		displaySprite \{id = gs_whiteTexHighlight_ID
			parent = select_finish_container
			tex = white
			just = [
				left
				top
			]
			rgba = [
				255
				255
				205
				255
			]
			dims = (264.0, 32.0)
			Pos = (-47.0, 8.0)
			z = 2}
		set_focus_color \{rgba = [
				130
				40
				40
				250
			]}
		set_unfocus_color \{rgba = [
				180
				100
				60
				250
			]}
		get_instrument_brand_and_finish id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p1])
		select_guitar_build_finish_array {
			brand = <instrument_brand>
			gs_available_instruments = <gs_available_instruments>
		}
		GetArraySize <gs_available_finishes>
		<i> = 0
		begin
		get_instrument_brand_and_finish id = (<gs_available_finishes> [<i>])
		formatText checksumName = gs_finish_menu_item_id 'gs_finish_menu_item_%n' n = <i>
		CreateScreenElement {
			id = <gs_finish_menu_item_id>
			Type = TextElement
			parent = <vparent>
			font = text_a4
			Scale = (0.7, 0.7)
			rgba = ($menu_unfocus_color)
			just = [center top]
			text = <instrument_finish>
			event_handlers = [
				{focus retail_menu_focus}
				{focus select_guitar_finish_highlight params = {Player = <Player>
						id = (<gs_available_finishes> [<i>])
						index = <i>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose select_guitar_finish_choose params = {id = (<gs_available_finishes> [<i>])
						Player = <Player>
						gs_available_instruments = <gs_available_instruments>
						instrument_type = <instrument_type>
					}
				}
			]
		}
		GetScreenElementDims id = <id>
		if (<width> > 180)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> dims = ((180.0, 34.0))
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		if (<array_Size> = 1)
			Change \{gs_made_first_selection_bool_p1 = 1}
			select_guitar_finish_highlight {
				Player = <Player>
				id = (<gs_available_finishes> [0])
			}
			select_guitar_finish_choose {
				id = (<gs_available_finishes> [0])
				Player = <Player>
				gs_available_instruments = <gs_available_instruments>
				instrument_type = <instrument_type>
			}
		endif
	else
		if (<Player> = 1)
			LaunchEvent \{Type = unfocus
				target = scrolling_select_guitar_p1}
			LaunchEvent Type = focus target = <vparent>
			SetScreenElementProps \{id = gs_select_guitar_text_p1
				text = "SELECT FINISH"}
			get_instrument_brand_and_finish id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p1])
			select_guitar_build_finish_array {
				brand = <instrument_brand>
				gs_available_instruments = <gs_available_instruments>
			}
			get_instrument_brand_and_finish id = (<gs_available_finishes> [0])
			SetScreenElementProps \{id = gs_brand_background_p1
				Pos = (0.0, 58.0)}
			SetScreenElementProps \{id = gs_finish_background_p1
				Pos = (0.0, 0.0)}
			SetScreenElementProps \{id = gs_guitar_logo_ID_p1
				Hide}
			SetScreenElementProps {
				id = $gs_guitar_brand_ID_p1
				text = <instrument_brand>
				Scale = (0.75, 0.5)
				Pos = (0.0, -6.0)
				rgba = [250 250 200 255]
			}
			GetScreenElementDims \{id = $gs_guitar_brand_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			SetScreenElementProps {
				id = $gs_guitar_finish_ID_p1
				text = <instrument_finish>
				Scale = (1.0, 0.8)
				Pos = (0.0, 52.0)
				rgba = [80 0 10 255]
			}
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 52.0)
			endif
			GetArraySize <gs_available_finishes>
			<i> = 0
			begin
			get_instrument_brand_and_finish id = (<gs_available_finishes> [<i>])
			CreateScreenElement {
				Type = TextElement
				parent = <vparent>
				font = text_a4
				Scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [center top]
				text = <instrument_finish>
				event_handlers = [
					{focus retail_menu_focus}
					{focus select_guitar_finish_highlight params = {Player = <Player>
							id = (<gs_available_finishes> [<i>])
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose select_guitar_finish_choose params = {id = (<gs_available_finishes> [<i>])
							Player = <Player>
							gs_available_instruments = <gs_available_instruments>
							instrument_type = <instrument_type>
							finish_index = <i>
						}
					}
				]
				exclusive_device = <exclusive_dev>
				Hide
			}
			GetScreenElementDims id = <id>
			if (<width> > 180)
				fit_text_in_rectangle id = <id> dims = (0.7 * ((160.0, 0.0) + (<height> * (0.0, 1.0)))) Pos = (<p1_menu_pos> + <menu_offset>)
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			if (<array_Size> = 1)
				Change \{gs_made_first_selection_bool_p1 = 1}
				select_guitar_finish_highlight {
					Player = <Player>
					id = (<gs_available_finishes> [0])
				}
				select_guitar_finish_choose {
					id = (<gs_available_finishes> [0])
					Player = <Player>
					gs_available_instruments = <gs_available_instruments>
					instrument_type = <instrument_type>
					needs_net_message = 0
				}
			endif
		else
			if ($is_network_game = 0)
				LaunchEvent \{Type = unfocus
					target = scrolling_select_guitar_p2}
				LaunchEvent Type = focus target = <vparent>
			endif
			SetScreenElementProps \{id = gs_select_guitar_text_p2
				text = "SELECT FINISH"}
			get_instrument_brand_and_finish id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p2])
			select_guitar_build_finish_array {
				brand = <instrument_brand>
				gs_available_instruments = <gs_available_instruments>
			}
			get_instrument_brand_and_finish id = (<gs_available_finishes> [0])
			SetScreenElementProps \{id = gs_brand_background_p2
				Pos = (0.0, 58.0)}
			SetScreenElementProps \{id = gs_finish_background_p2
				Pos = (0.0, 0.0)}
			SetScreenElementProps \{id = gs_guitar_logo_ID_p2
				Hide}
			SetScreenElementProps {
				id = $gs_guitar_brand_ID_p2
				text = <instrument_brand>
				Scale = (0.75, 0.5)
				Pos = (0.0, -6.0)
				rgba = [240 210 250 255]
			}
			GetScreenElementDims \{id = $gs_guitar_brand_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_brand_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			SetScreenElementProps {
				id = $gs_guitar_finish_ID_p2
				text = <instrument_finish>
				Scale = (1.0, 0.8)
				Pos = (0.0, 52.0)
				rgba = [70 0 50 255]
			}
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 52.0)
			endif
			GetArraySize <gs_available_finishes>
			get_instrument_brand_and_finish id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p2])
			select_guitar_build_finish_array {
				brand = <instrument_brand>
				gs_available_instruments = <gs_available_instruments>
			}
			GetArraySize <gs_available_finishes>
			<i> = 0
			begin
			get_instrument_brand_and_finish id = (<gs_available_finishes> [<i>])
			CreateScreenElement {
				Type = TextElement
				parent = <vparent>
				font = text_a4
				Scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [center top]
				text = <instrument_finish>
				event_handlers = [
					{focus retail_menu_focus}
					{focus select_guitar_finish_highlight params = {Player = <Player>
							id = (<gs_available_finishes> [<i>])
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose select_guitar_finish_choose params = {id = (<gs_available_finishes> [<i>])
							Player = <Player>
							gs_available_instruments = <gs_available_instruments>
							instrument_type = <instrument_type>
						}
					}
				]
				exclusive_device = <exclusive_dev>
				Hide
			}
			GetScreenElementDims id = <id>
			if (<width> > 180)
				fit_text_in_rectangle id = <id> dims = (0.7 * ((160.0, 0.0) + (<height> * (0.0, 1.0)))) Pos = (<p1_menu_pos> + <menu_offset>)
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			if (<array_Size> = 1)
				Change \{gs_made_first_selection_bool_p2 = 1}
				select_guitar_finish_highlight {
					Player = <Player>
					id = (<gs_available_finishes> [0])
				}
				select_guitar_finish_choose {
					id = (<gs_available_finishes> [0])
					Player = <Player>
					gs_available_instruments = <gs_available_instruments>
					instrument_type = <instrument_type>
					needs_net_message = 0
				}
			endif
		endif
	endif
endscript

script select_guitar_go_back_from_finish_menu \{Player = 1
		instrument_type = guitar}
	SoundEvent \{event = Generic_Menu_Back_SFX}
	if ($current_num_players = 1)
		LaunchEvent \{Type = focus
			target = scrolling_select_guitar_p1}
		LaunchEvent \{Type = unfocus
			target = scrolling_guitar_finish_menu_p1}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
		Change \{gs_made_first_selection_bool_p1 = 0}
		destroy_menu \{menu_id = select_finish_container}
		instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p1)])
		Change \{guitar_select_highlighted_guitar_p1 = $guitar_select_old_guitar_p1}
		Change \{gs_selected_brand_p1 = $gs_old_selected_brand_p1}
		if NOT (<instrument_id> = ($player1_status.instrument_id))
			Change structurename = player1_status instrument_id = <instrument_id>
			formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
			Change GlobalName = <change_flag> NewValue = 1
		endif
		SetScreenElementProps \{id = gs_brand_background
			texture = Char_Select_Frame_BG
			dims = (266.0, 128.0)
			rgba = [
				250
				250
				200
				255
			]}
		SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
			rgba = [
				160
				80
				30
				255
			]}
		get_instrument_brand_and_finish id = <instrument_id>
		SetScreenElementProps id = $gs_guitar_brand_ID_p1 text = <instrument_brand>
		SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
			Scale = 1}
		GetScreenElementDims \{id = $gs_guitar_brand_ID_p1}
		if (<width> > 260)
			SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
		SetScreenElementProps id = $gs_guitar_finish_ID_p1 text = <instrument_name2>
		get_instrument_logo id = <instrument_id>
		SetScreenElementProps id = gs_guitar_logo_ID_p1 text = <instrument_logo>
		select_guitar_change_blurb_text inst_ID = <instrument_id>
	else
		if (<instrument_type> = guitar)
			Change \{gs_select_text = "SELECT GUITAR"}
		elseif (<instrument_type> = bass)
			Change \{gs_select_text = "SELECT BASS"}
		endif
		if (<Player> = 1)
			SetScreenElementProps \{id = gs_select_guitar_text_p1
				text = $gs_select_text}
			LaunchEvent \{Type = focus
				target = scrolling_select_guitar_p1}
			LaunchEvent \{Type = unfocus
				target = scrolling_guitar_finish_menu_p1}
			destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
			Change \{gs_made_first_selection_bool_p1 = 0}
			if ($is_network_game = 1)
				network_player_lobby_message {
					Type = skin_select
					action = deselect
					checksum = <instrument_type>
				}
			endif
			instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p1)])
			Change \{guitar_select_highlighted_guitar_p1 = $guitar_select_old_guitar_p1}
			Change \{gs_selected_brand_p1 = $gs_old_selected_brand_p1}
			if NOT (<instrument_id> = ($player1_status.instrument_id))
				Change structurename = player1_status instrument_id = <instrument_id>
				formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
				Change GlobalName = <change_flag> NewValue = 1
			endif
			get_instrument_brand_and_finish id = <instrument_id>
			SetScreenElementProps \{id = gs_brand_background_p1
				Pos = (0.0, 30.0)}
			SetScreenElementProps \{id = gs_finish_background_p1
				Pos = (0.0, 88.0)}
			SetScreenElementProps {
				id = $gs_guitar_brand_ID_p1
				text = <instrument_brand>
				Scale = 1
				Pos = (0.0, 10.0)
				rgba = [80 0 10 255]
			}
			GetScreenElementDims \{id = $gs_guitar_brand_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			SetScreenElementProps {
				id = $gs_guitar_finish_ID_p1
				text = <instrument_name2>
				Scale = (0.75, 0.5)
				Pos = (0.0, 83.0)
				rgba = [250 250 200 255]
			}
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 83.0)
			endif
			get_instrument_logo id = <instrument_id>
			SetScreenElementProps id = gs_guitar_logo_ID_p1 text = <instrument_logo>
			SetScreenElementProps \{id = gs_guitar_logo_ID_p1
				unhide}
		else
			SetScreenElementProps \{id = gs_select_guitar_text_p2
				text = $gs_select_text}
			LaunchEvent \{Type = focus
				target = scrolling_select_guitar_p2}
			LaunchEvent \{Type = unfocus
				target = scrolling_guitar_finish_menu_p2}
			destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
			Change \{gs_made_first_selection_bool_p2 = 0}
			instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p2)])
			Change \{guitar_select_highlighted_guitar_p2 = $guitar_select_old_guitar_p2}
			Change \{gs_selected_brand_p2 = $gs_old_selected_brand_p2}
			if NOT (<instrument_id> = ($player2_status.instrument_id))
				Change structurename = player2_status instrument_id = <instrument_id>
				formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
				Change GlobalName = <change_flag> NewValue = 1
			endif
			get_instrument_brand_and_finish id = <instrument_id>
			SetScreenElementProps \{id = gs_brand_background_p2
				Pos = (0.0, 30.0)}
			SetScreenElementProps \{id = gs_finish_background_p2
				Pos = (0.0, 88.0)}
			SetScreenElementProps {
				id = $gs_guitar_brand_ID_p2
				text = <instrument_brand>
				Scale = 1
				Pos = (0.0, 10.0)
				rgba = [70 0 50 255]
			}
			GetScreenElementDims \{id = $gs_guitar_brand_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_brand_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			SetScreenElementProps {
				id = $gs_guitar_finish_ID_p2
				text = <instrument_name2>
				Scale = (0.75, 0.5)
				Pos = (0.0, 83.0)
				rgba = [240 251 250 255]
			}
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 83.0)
			endif
			get_instrument_logo id = <instrument_id>
			SetScreenElementProps id = gs_guitar_logo_ID_p2 text = <instrument_logo>
			SetScreenElementProps \{id = gs_guitar_logo_ID_p2
				unhide}
		endif
		if (<Player> = 1)
			destroy_menu \{menu_id = select_finish_container}
		else
			destroy_menu \{menu_id = select_finish_container_p2}
		endif
	endif
endscript

script select_guitar_finish_highlight \{Player = 1
		index = 0}
	formatText checksumName = player_status 'player%i_status' i = <Player>
	if NOT (<id> = $<player_status>.instrument_id)
		Change structurename = <player_status> instrument_id = <id>
		formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
		Change GlobalName = <change_flag> NewValue = 1
	endif
	get_instrument_brand_and_finish id = <id>
	if ($current_num_players = 1)
		SetScreenElementProps id = $gs_guitar_brand_ID_p1 text = <instrument_brand>
		SetScreenElementProps id = $gs_guitar_finish_ID_p1 text = <instrument_name2>
		get_instrument_logo id = <id>
		SetScreenElementProps id = gs_guitar_logo_ID_p1 text = <instrument_logo>
		<offset> = (<index> * (0.0, 33.5))
		<l_pos> = ((-64.0, 11.0) + <offset>)
		<r_pos> = ((238.0, 11.0) + <offset>)
		<hl_pos> = ((-47.0, 8.0) + <offset>)
		SetScreenElementProps id = gs_bookend1_ID Pos = <l_pos>
		SetScreenElementProps id = gs_bookend2_ID Pos = <r_pos>
		SetScreenElementProps id = gs_whiteTexHighlight_ID Pos = <hl_pos>
	else
		if (<Player> = 1)
			SetScreenElementProps {
				id = $gs_guitar_finish_ID_p1
				text = <instrument_finish>
			}
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 52.0)
			endif
		else
			SetScreenElementProps {
				id = $gs_guitar_finish_ID_p2
				text = <instrument_finish>
			}
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 52.0)
			endif
		endif
	endif
endscript

script select_guitar_finish_choose \{Player = 1
		needs_net_message = 1}
	if (<Player> = 1)
		get_instrument_name_and_index id = <id>
		select_guitar_get_available_index_from_total_index {
			gs_available_instruments = <gs_available_instruments>
			index = <instrument_index>
		}
		Change guitar_select_highlighted_guitar_p1 = <index>
		if GotParam \{finish_index}
			Change gh_net_finish_id = <finish_index>
		endif
		select_guitar_choose {
			Player = <Player>
			gs_available_instruments = <gs_available_instruments>
			instrument_type = <instrument_type>
			needs_net_message = <needs_net_message>
			includes_finish = 1
		}
	else
		get_instrument_name_and_index id = <id>
		select_guitar_get_available_index_from_total_index {
			gs_available_instruments = <gs_available_instruments>
			index = <instrument_index>
		}
		Change guitar_select_highlighted_guitar_p2 = <index>
		select_guitar_choose {
			Player = <Player>
			gs_available_instruments = <gs_available_instruments>
			instrument_type = <instrument_type>
		}
	endif
	if (<Player> = 1)
		destroy_menu \{menu_id = select_finish_container}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
	else
		destroy_menu \{menu_id = select_finish_container_p2}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
	endif
endscript

script build_gs_available_guitar_array 
	if (<instrument_type> = guitar)
		formatText \{checksumName = guitar_select_available_instruments
			'guitar_select_available_guitar_array'}
		Change \{GlobalName = guitar_select_guitar_indeces
			NewValue = [
			]}
		Change GlobalName = <guitar_select_available_instruments> NewValue = ($Free_Guitars)
		<secret_instrument_array> = ($Secret_Guitars)
		<download_instrument_array> = Download_Guitars
		num_downloads_on_other_client = ($download_guitars_on_other_client)
		<bonus_guitar_array> = ($Bonus_Guitars)
		<bonus_guitar_finishes_array> = ($Bonus_Guitar_Finishes)
	else
		formatText \{checksumName = guitar_select_available_instruments
			'guitar_select_available_bass_array'}
		Change \{GlobalName = guitar_select_bass_indeces
			NewValue = [
			]}
		Change GlobalName = <guitar_select_available_instruments> NewValue = ($Free_Basses)
		<secret_instrument_array> = ($Secret_Basses)
		<download_instrument_array> = Download_Basses
		num_downloads_on_other_client = ($download_basses_on_other_client)
		<bonus_guitar_array> = ($Bonus_Basses)
		<bonus_guitar_finishes_array> = ($Bonus_Bass_Finishes)
	endif
	num_downloads = 0
	if GlobalExists Name = <download_instrument_array>
		GetArraySize ($<download_instrument_array>)
		<download_array_size> = <array_Size>
		<i> = 0
		begin
		find_instrument_index desc_id = ($<download_instrument_array> [<i>])
		if is_musician_instrument_downloaded index = <index>
			AddArrayElement array = $<guitar_select_available_instruments> element = ($<download_instrument_array> [<i>])
			Change GlobalName = <guitar_select_available_instruments> NewValue = (<array>)
			num_downloads = (<num_downloads> + 1)
		endif
		<i> = (<i> + 1)
		repeat <download_array_size>
	endif
	if ($is_network_game = 1 && <Player> = 2 && (($download_guitars_on_other_client - <num_downloads>) > 0))
		begin
		AddArrayElement array = $<guitar_select_available_instruments> element = (<guitar_select_available_instruments> [0])
		Change GlobalName = <guitar_select_available_instruments> NewValue = (<array>)
		repeat ($download_guitars_on_other_client - <num_downloads>)
	endif
	GetArraySize (<secret_instrument_array>)
	<secret_array_size> = <array_Size>
	<i> = 0
	begin
	GetGlobalTags (<secret_instrument_array> [<i>].id) param = unlocked
	if (<unlocked>)
		AddArrayElement array = $<guitar_select_available_instruments> element = (<secret_instrument_array> [<i>].id)
		Change GlobalName = <guitar_select_available_instruments> NewValue = (<array>)
	endif
	<i> = (<i> + 1)
	repeat <secret_array_size>
	GetArraySize (<bonus_guitar_array>)
	<bonus_guitar_array_size> = <array_Size>
	<j> = 0
	begin
	GetGlobalTags (<bonus_guitar_array> [<j>].id) param = unlocked
	if (<unlocked>)
		AddArrayElement array = $<guitar_select_available_instruments> element = (<bonus_guitar_array> [<j>].id)
		Change GlobalName = <guitar_select_available_instruments> NewValue = (<array>)
	endif
	<j> = (<j> + 1)
	repeat <bonus_guitar_array_size>
	GetArraySize (<bonus_guitar_finishes_array>)
	<bonus_guitar_finishes_array_size> = <array_Size>
	<k> = 0
	begin
	GetGlobalTags (<bonus_guitar_finishes_array> [<k>].id) param = unlocked
	if (<unlocked>)
		AddArrayElement array = $<guitar_select_available_instruments> element = (<bonus_guitar_finishes_array> [<k>].id)
		Change GlobalName = <guitar_select_available_instruments> NewValue = (<array>)
	endif
	<k> = (<k> + 1)
	repeat <bonus_guitar_finishes_array_size>
	GetArraySize <guitar_select_available_instruments> globalarray
	Change guitar_select_total_num_guitars = <array_Size>
	<i> = 0
	GetArraySize <guitar_select_available_instruments> globalarray
	total_size = <array_Size>
	begin
	<j> = 0
	get_musician_instrument_size
	begin
	get_musician_instrument_struct index = <j>
	if (($<guitar_select_available_instruments> [<i>]) = (<info_struct>.desc_id))
		if (<instrument_type> = guitar)
			AddArrayElement array = $guitar_select_guitar_indeces element = <j>
			Change GlobalName = guitar_select_guitar_indeces NewValue = (<array>)
		else
			AddArrayElement array = $guitar_select_bass_indeces element = <j>
			Change GlobalName = guitar_select_bass_indeces NewValue = (<array>)
		endif
		break
	endif
	<j> = (<j> + 1)
	repeat <array_Size>
	<i> = (<i> + 1)
	repeat <total_size>
endscript
