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
gs_highlight_index = 0
gs_scroll_dir = down
gs_finishes_size = 0
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
gs_current_brand_is_selected_p1 = 1
gs_current_brand_is_selected_p2 = 1
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
	(0.0, 135.0)
	(0.0, 185.0)
	(0.0, 200.0)
	(0.0, 278.0)
	(-106.0, 315.0)
	(-1.0, 579.0)
]

script create_select_bass_menu 
	create_select_guitar_menu Player = <Player> instrument_type = bass
endscript

script create_select_guitar_menu \{Player = 1
		instrument_type = guitar}
	Change \{gs_current_brand_is_selected_p1 = 1}
	Change \{gs_current_brand_is_selected_p2 = 1}
	formatText checksumName = player_status 'player%i_status' i = <Player>
	if (<Player> = 1)
		Change \{gs_made_first_selection_bool_p1 = 0}
	else
		Change \{gs_made_first_selection_bool_p2 = 0}
	endif
	build_gs_available_guitar_array <...>
	if find_profile_by_id id = ($<player_status>.character_id)
		get_musician_profile_struct index = <index>
		formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
		if GetGlobalTags <characterguitartags> noassert = 1
			if ((<instrument_type> = bass))
				if (<current_instrument> = guitar)
					Change structurename = <player_status> instrument_id = <current_selected_bass>
					SetGlobalTags <characterguitartags> params = {current_instrument = bass}
					formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
					Change GlobalName = <change_flag> NewValue = 1
				endif
			elseif ((<instrument_type> = guitar))
				if (<current_instrument> = bass)
					Change structurename = <player_status> instrument_id = <current_selected_guitar>
					SetGlobalTags <characterguitartags> params = {current_instrument = guitar}
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
	select_guitar_build_brand_array instrument_type = <instrument_type> gs_available_instruments = <guitar_select_available_instruments> Player = <Player>
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
				no_focus = 1
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
				no_focus = 1
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
			no_focus = 1
		}
		if ($is_network_game = 1)
			vmenu_select_guitar_p2 :SetProps \{disable_pad_handling}
			LaunchEvent \{Type = unfocus
				target = vmenu_select_guitar_p2}
		endif
		vparent = vmenu_select_guitar_p2
	endif
	if ($current_num_players = 1)
		if (<instrument_type> = guitar)
			Change \{gs_select_text = "SELECT GUITAR"}
		elseif (<instrument_type> = bass)
			Change \{gs_select_text = "SELECT BASS"}
		endif
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
			Pos = (392.0, 6.0)}
		frame_dims = (280.0, 600.0)
		center_pos = (0.0, 335.0)
		create_ui_frame {
			parent = select_guitar_container
			frame_dims = <frame_dims>
			center_pos = <center_pos>
			frame_rgba = (($g_menu_colors).frame_rgba)
			fill_rgba = (($g_menu_colors).fill_rgba)
			z_priority = 0
		}
		header_pos = (<center_pos> - ((<frame_dims>.(0.0, 1.0)) * (0.0, 0.5) - (0.0, 80.0)))
		CreateScreenElement {
			Type = SpriteElement
			parent = select_guitar_container
			Pos = <header_pos>
			id = gs_frame_header_01
			just = [center bottom]
			texture = window_header_01
			rgba = (($g_menu_colors).lt_violet_grey)
			z_priority = 1
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = select_guitar_container
			Pos = (<center_pos> + (0.0, 175.0))
			dims = (242.0, 128.0)
			just = [center top]
			texture = store_frame_bottom_bg
			z_priority = 4
			rgba = (($g_menu_colors).lt_violet_grey)
		}
		displayText {
			parent = select_guitar_container
			text = $gs_select_text
			Pos = ($gs_element_offsets [0])
			Scale = (0.6, 0.55)
			font = fontgrid_title_gh3
			just = [center center]
			rgba = (($g_menu_colors).pink)
			z = 1
		}
		displaySprite {
			id = gs_brand_background
			parent = select_guitar_container
			tex = Char_Select_Frame_BG
			Pos = ($gs_element_offsets [2])
			dims = (266.0, 128.0)
			just = [center center]
			rgba = (($g_menu_colors).lt_violet_grey)
			z = 1
		}
		get_instrument_brand_and_finish id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
		CreateScreenElement {
			Type = TextElement
			parent = select_guitar_container
			text = <instrument_brand>
			Pos = (($gs_element_offsets [2]) + (0.0, 8.0))
			Scale = 1
			font = fontgrid_title_gh3
			just = [center center]
			rgba = (($g_menu_colors).black)
			z = 2
			Shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = (($g_menu_colors).lt_violet_grey)
		}
		Change gs_guitar_brand_ID_p1 = <id>
		GetScreenElementDims \{id = $gs_guitar_brand_ID_p1}
		if (<width> > 250)
			SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((250.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (0.0, 8.0))
		endif
		CreateScreenElement {
			Type = TextBlockElement
			parent = select_guitar_container
			text = <instrument_name2>
			Pos = ($gs_element_offsets [3])
			Scale = (0.55, 0.55)
			dims = (440.0, 300.0)
			font = text_a4
			line_spacing = 0.9
			just = [center center]
			rgba = (($g_menu_colors).lt_violet_grey)
			z_priority = 2
		}
		Change gs_guitar_finish_ID_p1 = <id>
		GetScreenElementDims id = ($gs_guitar_finish_ID_p1)
		if (<width> > 120)
			fit_text_in_rectangle id = ($gs_guitar_finish_ID_p1) dims = ((120.0, 0.0) + (<height> * (0.0, 1.0))) Pos = ($gs_element_offsets [3]) keep_ar = 1
		endif
		get_instrument_logo id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
		displayText {
			id = gs_guitar_logo_ID_p1
			parent = select_guitar_container
			text = <instrument_logo>
			Pos = ($gs_element_offsets [5])
			Scale = 0.8
			font = fontgrid_title_gh3
			just = [center center]
			rgba = (($g_menu_colors).lt_violet_grey)
			z = 5
		}
		CreateScreenElement {
			Type = WindowElement
			parent = select_guitar_container
			id = gs_instrument_info_scroll_window
			Pos = ($gs_element_offsets [4])
			dims = (388.0, 245.0)
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
				formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player> AddToStringLookup = true
				if GetGlobalTags <characterguitartags> noassert = 1
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
			create_ui_frame {
				frame_dims = (250.0, 185.0)
				center_pos = (0.0, 32.0)
				parent = select_guitar_container
				frame_rgba = [240 225 200 50]
				fill_rgba = [50 25 40 185]
				z_priority = 0
				offset_top = 32
				offset_side = 32
				min_fill_pad_width = 73
				min_fill_pad_height = 63
				tex_param = 'simple'
				suffix = <Player>
				check_side_swap = 0
			}
			displayText {
				id = gs_select_guitar_text_p1
				parent = select_guitar_container
				text = $gs_select_text
				Pos = (0.0, -30.0)
				Scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [center center]
				rgba = (($g_menu_colors).md_violet_grey)
				z = 1
			}
			displaySprite {
				id = gs_brand_background_p1
				parent = select_guitar_container
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				dims = (266.0, 128.0)
				just = [center center]
				rgba = (($g_menu_colors).light_brown)
				z = 1
			}
			get_instrument_brand_and_finish id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
			displayText {
				parent = select_guitar_container
				text = <instrument_brand>
				Pos = (0.0, 10.0)
				Scale = 1
				font = text_a4
				just = [center center]
				rgba = (($g_menu_colors).fill_rgba)
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
				rgba = (($g_menu_colors).black)
				z = 2
				noshadow
			}
			displayText {
				parent = select_guitar_container
				text = <instrument_name2>
				Pos = (2.0, 93.0)
				Scale = (1.0, 0.5)
				font = text_a4
				just = [center center]
				rgba = (($g_menu_colors).light_brown)
				z = 2
				noshadow
			}
			Change gs_guitar_finish_ID_p1 = <id>
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p1}
			fit_text_in_rectangle id = $gs_guitar_finish_ID_p1 dims = ((220.0, 0.0) + ((<height>) * (0.0, 1.0))) only_if_larger_x = 1 start_x_scale = 1 start_y_scale = 0.5
		else
			formatText checksumName = player_status 'player%i_status' i = <Player>
			if find_profile_by_id id = ($<player_status>.character_id)
				get_musician_profile_struct index = <index>
				formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player> AddToStringLookup = true
				if GetGlobalTags <characterguitartags> noassert = 1
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
			create_ui_frame {
				frame_dims = (250.0, 185.0)
				center_pos = (0.0, 32.0)
				parent = select_guitar_container_p2
				frame_rgba = [180 150 175 75]
				fill_rgba = [50 25 40 185]
				z_priority = 0
				offset_top = 32
				offset_side = 32
				min_fill_pad_width = 73
				min_fill_pad_height = 63
				tex_param = 'simple'
				suffix = <Player>
				check_side_swap = 0
			}
			displayText {
				id = gs_select_guitar_text_p2
				parent = select_guitar_container_p2
				text = $gs_select_text
				Pos = (0.0, -30.0)
				Scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [center center]
				rgba = (($g_menu_colors).md_violet_grey)
				z = 1
			}
			displaySprite {
				id = gs_brand_background_p2
				parent = select_guitar_container_p2
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				dims = (266.0, 128.0)
				just = [center center]
				rgba = (($g_menu_colors).lt_violet_bar)
				z = 1
			}
			get_instrument_brand_and_finish id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p2])
			displayText {
				parent = select_guitar_container_p2
				text = <instrument_brand>
				Pos = (0.0, 10.0)
				Scale = 1
				font = text_a4
				just = [center center]
				rgba = (($g_menu_colors).fill_rgba)
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
				rgba = (($g_menu_colors).black)
				z = 2
				noshadow
			}
			displayText {
				parent = select_guitar_container_p2
				text = <instrument_name2>
				Pos = (2.0, 93.0)
				Scale = (1.0, 0.5)
				font = text_a4
				just = [center center]
				rgba = (($g_menu_colors).lt_violet_bar)
				z = 2
				noshadow
			}
			Change gs_guitar_finish_ID_p2 = <id>
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p2}
			fit_text_in_rectangle id = $gs_guitar_finish_ID_p2 dims = ((220.0, 0.0) + ((<height>) * (0.0, 1.0))) only_if_larger_x = 1 start_x_scale = 1 start_y_scale = 0.5
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
		if ($generic_select_monitor_p1_changed = 1)
			begin
			if ($generic_select_monitor_p1_changed = 0)
				break
			endif
			Wait \{1
				gameframe}
			repeat
		endif
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
			break
		else
			Wait \{1
				gameframe}
		endif
		repeat
	endif
	LaunchEvent Type = focus target = <vparent>
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
	gs_available_brands = []
	if (<instrument_type> = guitar)
		formatText \{checksumName = gs_indeces
			'guitar_select_guitar_indeces'}
	else
		formatText \{checksumName = gs_indeces
			'guitar_select_bass_indeces'}
	endif
	<i> = 0
	begin
	get_musician_instrument_struct index = ($<gs_indeces> [<i>])
	if (($<gs_available_instruments> [<i>]) = (<info_struct>.desc_id))
		<k> = 0
		<found_group> = 0
		GetArraySize (<gs_available_brands>)
		if (<array_Size> > 0)
			begin
			if ((<gs_available_brands> [<k>]) = (<info_struct>.group))
				<found_group> = 1
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
		if (<found_group> = 0)
			AddArrayElement array = (<gs_available_brands>) element = (<info_struct>.group)
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
	else
		ScriptAssert \{"Something is wrong with your guitar arrays! [In select_guitar_build_brand_array]"}
	endif
	<i> = (<i> + 1)
	repeat <our_array_size>
	return gs_available_brands = <gs_available_brands>
endscript

script select_guitar_build_finish_array \{instrument_type = guitar}
	GetArraySize <gs_available_instruments> globalarray
	<our_array_size> = <array_Size>
	gs_available_finishes = []
	if (<instrument_type> = guitar)
		formatText \{checksumName = gs_indeces
			'guitar_select_guitar_indeces'}
	else
		formatText \{checksumName = gs_indeces
			'guitar_select_bass_indeces'}
	endif
	<i> = 0
	begin
	get_musician_instrument_struct index = ($<gs_indeces> [<i>])
	if (($<gs_available_instruments> [<i>]) = (<info_struct>.desc_id))
		get_instrument_brand_and_finish id = (<info_struct>.desc_id)
		if (<instrument_group> = <group>)
			AddArrayElement array = (<gs_available_finishes>) element = (<info_struct>.desc_id)
			<gs_available_finishes> = (<array>)
		endif
	else
		ScriptAssert \{"Something is wrong with your guitar arrays! [In select_guitar_build_finish_array]"}
	endif
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
				Player = <Player>
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
				if (<width> > 235)
					fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((235.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (0.0, 8.0))
				endif
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p1
					Scale = 1}
				GetScreenElementDims \{id = $gs_guitar_finish_ID_p1}
				if (<width> > 220)
					fit_text_in_rectangle id = $gs_guitar_finish_ID_p1 dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [3]) + (1.0, 2.0)) keep_ar = 1
				endif
			else
				SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
					Scale = 1}
				GetScreenElementDims \{id = $gs_guitar_brand_ID_p1}
				if (<width> > 260)
					SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
						Scale = 1}
					fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
				endif
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p1
					Scale = (1.0, 0.5)}
				GetScreenElementDims \{id = $gs_guitar_finish_ID_p1}
				fit_text_in_rectangle id = $gs_guitar_finish_ID_p1 dims = ((220.0, 0.0) + ((<height>) * (0.0, 0.5))) only_if_larger_x = 1 start_x_scale = 1 start_y_scale = 1
			endif
			get_instrument_logo id = <inst_ID>
			SetScreenElementProps id = gs_guitar_logo_ID_p1 text = <instrument_logo>
		else
			if (<Dir> = down)
				Change \{gs_scroll_dir = down}
				Change gs_highlight_index = (($gs_highlight_index) + 1)
				if (($gs_highlight_index) > 4)
					Change \{gs_highlight_index = 4}
				endif
			else
				Change \{gs_scroll_dir = up}
				Change gs_highlight_index = (($gs_highlight_index) - 1)
				if (($gs_highlight_index) < 0)
					Change \{gs_highlight_index = 0}
				endif
			endif
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
				Player = <Player>
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
				Scale = (1.0, 0.5)}
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p2}
			fit_text_in_rectangle id = $gs_guitar_finish_ID_p2 dims = ((220.0, 0.0) + ((<height>) * (0.0, 1.0))) only_if_larger_x = 1 start_x_scale = 1 start_y_scale = 0.5
			get_instrument_logo id = <inst_ID>
			SetScreenElementProps id = gs_guitar_logo_ID_p2 text = <instrument_logo>
		endif
	endif
endscript

script select_guitar_go_back \{Player = 1
		instrument_type = guitar}
	if (<Player> = 1)
		LaunchEvent \{Type = unfocus
			target = vmenu_select_guitar_p1}
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
		LaunchEvent \{Type = unfocus
			target = vmenu_select_guitar_p2}
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
				formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
				if (<instrument_type> = guitar)
					SetGlobalTags <characterguitartags> params = {current_instrument = guitar current_selected_guitar = <instrument_id>}
				else
					SetGlobalTags <characterguitartags> params = {current_instrument = bass current_selected_bass = <instrument_id>}
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
			formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player> AddToStringLookup = true
			SetGlobalTags <characterguitartags> params = {current_instrument = <instrument_type>}
		endif
	endif
	ui_flow_manager_respond_to_action action = go_back Player = <Player>
endscript

script select_guitar_menu_lose_focus 
	GetTags
	SetScreenElementProps id = <id> rgba = (($g_menu_colors).dk_violet_grey)
endscript

script select_guitar_choose \{Player = 1
		needs_net_message = 1
		includes_finish = 0}
	SoundEvent \{event = ui_sfx_select}
	if ($current_num_players = 1)
		begin
		if ($generic_select_monitor_p1_changed = 0)
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	if (<Player> = 1)
		<inst_ID> = ($<gs_available_instruments> [($guitar_select_highlighted_guitar_p1)])
		Change structurename = player1_status instrument_id = <inst_ID>
		if find_profile_by_id id = ($player1_status.character_id)
			get_musician_profile_struct index = <index>
			formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
			if (<instrument_type> = guitar)
				SetGlobalTags <characterguitartags> params = {current_instrument = guitar current_selected_guitar = <inst_ID>}
				Change player1_selected_guitar = <inst_ID>
			else
				SetGlobalTags <characterguitartags> params = {current_instrument = bass current_selected_bass = <inst_ID>}
				Change player1_selected_bass = <inst_ID>
			endif
		endif
		Change \{guitar_select_old_guitar_p1 = $guitar_select_highlighted_guitar_p1}
		Change \{gs_old_selected_brand_p1 = $gs_selected_brand_p1}
		if ($gs_made_first_selection_bool_p1 = 0)
			select_guitar_create_finish_menu gs_available_instruments = <gs_available_instruments> Player = <Player> instrument_type = <instrument_type>
			Change \{gs_made_first_selection_bool_p1 = 1}
		else
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		endif
	else
		<inst_ID> = ($<gs_available_instruments> [($guitar_select_highlighted_guitar_p2)])
		Change structurename = player2_status instrument_id = <inst_ID>
		if NOT ($is_network_game)
			if find_profile_by_id id = ($player2_status.character_id)
				get_musician_profile_struct index = <index>
				formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
				if (<instrument_type> = guitar)
					SetGlobalTags <characterguitartags> params = {current_instrument = guitar current_selected_guitar = <inst_ID>}
				else
					SetGlobalTags <characterguitartags> params = {current_instrument = bass current_selected_bass = <inst_ID>}
				endif
			endif
		endif
		Change \{guitar_select_old_guitar_p2 = $guitar_select_highlighted_guitar_p2}
		Change \{gs_old_selected_brand_p2 = $gs_selected_brand_p2}
		if ($gs_made_first_selection_bool_p2 = 0)
			select_guitar_create_finish_menu gs_available_instruments = <gs_available_instruments> Player = <Player> instrument_type = <instrument_type>
			Change \{gs_made_first_selection_bool_p2 = 1}
		else
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
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
	if find_instrument_index desc_id = (<instrument_id>)
		get_musician_instrument_struct index = <index>
		return true instrument_name = (<info_struct>.desc_name)
	else
		return \{FALSE
			instrument_name = "Instrument not found"}
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
		if GotParam \{ins_brand}
			GetUpperCaseString <ins_brand>
			gitaf_instrument_brand = <UppercaseString>
		else
			gitaf_instrument_brand = "Something Bad Happened..."
		endif
		<ins_group> = (<info_struct>.group)
		if GotParam \{ins_group}
			gitaf_instrument_group = <ins_group>
		else
			gitaf_instrument_group = somethingbadhappened
		endif
		return instrument_brand = <gitaf_instrument_brand> instrument_finish = <gitaf_instrument_finish> instrument_name2 = <gitaf_instrument_name2> instrument_group = <gitaf_instrument_group>
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	return \{instrument_brand = "Brand Not Found!!!"
		instrument_finish = "Finish Not Found!!!"
		instrument_name2 = "Name2 Not Found!!!"
		instrument_group = somethingbadhappened}
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
	if ScreenElementExists \{id = select_guitar_container}
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
	endif
endscript

script select_guitar_scroll_instrument_info \{z = 2
		x_dims = 362
		Color = dk_violet_grey}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <parent>
		just = [left top]
		internal_just = [center center]
		Pos = (0.0, 0.0)
		Scale = (0.58, 0.6)
		text = $gs_instrument_blurb_text
		font = text_a4
		rgba = (($g_menu_colors).<Color>)
		z_priority = <z>
		dims = (<x_dims> * (1.0, 0.0))
		allow_expansion
		line_spacing = 1.125
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
	if ((<height> + <pixels_per_line>) <= <parent_height>)
		break
	endif
	Wait <idle_time> Seconds
	<diff> = (<height> - <parent_height> + 0.1 + <pixels_per_line>)
	<lines_to_scroll> = (<diff> / <pixels_per_line>)
	<rate> = 1.0
	<text_id> :DoMorph Pos = (<diff> * (0.0, -1.0)) time = (<rate> * <lines_to_scroll>)
	Wait <idle_time> Seconds
	<text_id> :DoMorph alpha = 0 time = <fade_time>
	Wait <black_time> Seconds
	repeat
endscript

script select_guitar_get_first_guitar_brand_in_list \{brand = explorer}
	if (<Player> = 1)
		get_instrument_brand_and_finish id = ($<gs_available_instruments> [$guitar_select_old_guitar_p1])
	else
		get_instrument_brand_and_finish id = ($<gs_available_instruments> [$guitar_select_old_guitar_p2])
	endif
	<our_group> = <instrument_group>
	<i> = 0
	GetArraySize <gs_available_instruments> globalarray
	total_size = <array_Size>
	begin
	if (<instrument_type> = guitar)
		get_musician_instrument_struct index = ($guitar_select_guitar_indeces [<i>])
	else
		get_musician_instrument_struct index = ($guitar_select_bass_indeces [<i>])
	endif
	if ((<info_struct>.group) = <brand>)
		if (<brand> = <our_group>)
			if (<Player> = 1)
				Change \{gs_current_brand_is_selected_p1 = 1}
			else
				Change \{gs_current_brand_is_selected_p2 = 1}
			endif
			formatText checksumName = player_status 'player%x_status' X = <Player>
			if find_profile_by_id id = ($<player_status>.character_id)
				get_musician_profile_struct index = <index>
				formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player> AddToStringLookup = true
				if GetGlobalTags <characterguitartags> noassert = 1
					if (<instrument_type> = guitar)
						<inst_ID> = <current_selected_guitar>
					else
						<inst_ID> = <current_selected_bass>
					endif
					get_instrument_name_and_index id = <inst_ID>
					select_guitar_get_available_index_from_total_index {
						gs_available_instruments = <gs_available_instruments>
						index = <instrument_index>
					}
					return instrument_id = <inst_ID> instrument_index = <index>
				endif
			endif
		else
			if (<Player> = 1)
				Change \{gs_current_brand_is_selected_p1 = 0}
			else
				Change \{gs_current_brand_is_selected_p2 = 0}
			endif
		endif
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
		{pad_up gs_scroll_up_or_down params = {
				Player = <Player>
				Dir = up
			}
		}
		{pad_down gs_scroll_up_or_down params = {
				Player = <Player>
				Dir = down
			}
		}
	]
	<p1_menu_pos> = (566.0, 480.0)
	<p2_menu_pos> = (786.0, 490.0)
	<menu_offset> = (-270.0, -150.0)
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
				dims = (200.0, 200.0)
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
		Change \{gs_highlight_index = 0}
		Change \{gs_scroll_dir = down}
		Change \{gs_finishes_size = 0}
		CreateScreenElement {
			Type = ContainerElement
			id = select_finish_container
			parent = root_window
			Pos = (<p1_menu_pos> + <menu_offset>)
			internal_just = [center top]
		}
		SetScreenElementProps \{id = gs_brand_background
			texture = char_select_frame_bg2
			rgba = [
				210
				120
				155
				255
			]}
		SetScreenElementProps {
			id = $gs_guitar_brand_ID_p1
			shadow_rgba = (($g_menu_colors).frame_rgba)
		}
		GetScreenElementDims \{id = $gs_guitar_brand_ID_p1}
		if (<width> > 256)
			SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((215.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (0.0, 8.0))
		endif
		CreateScreenElement {
			Type = SpriteElement
			id = gs_triangle_top
			parent = select_finish_container
			texture = guitar_select_triangle
			just = [center center]
			rgba = (($g_menu_colors).md_violet_grey)
			alpha = 0.3
			Pos = (94.0, -8.0)
			Scale = 0.5
			z_priority = 4
		}
		CreateScreenElement {
			Type = SpriteElement
			id = gs_triangle_bottom
			parent = select_finish_container
			texture = guitar_select_triangle
			just = [center center]
			rgba = (($g_menu_colors).md_violet_grey)
			alpha = 0.3
			Pos = (94.0, 192.0)
			Scale = 0.5
			z_priority = 4
			flip_h
		}
		displaySprite {
			id = gs_bookend1_ID
			parent = select_finish_container
			tex = character_hub_hilite_bookend
			dims = (24.0, 32.0)
			just = [left top]
			rgba = (($g_menu_colors).md_violet_grey)
			Pos = (-52.0, 0.0)
			z = 4
			flip_v
		}
		displaySprite {
			id = gs_bookend2_ID
			parent = select_finish_container
			tex = character_hub_hilite_bookend
			dims = (24.0, 32.0)
			just = [right top]
			rgba = (($g_menu_colors).md_violet_grey)
			Pos = (248.0, 0.0)
			z = 4
		}
		displaySprite {
			id = gs_whiteTexHighlight_ID
			parent = select_finish_container
			tex = hilite_bar_01
			just = [left top]
			rgba = (($g_menu_colors).md_violet_grey)
			dims = (264.0, 32.0)
			Pos = (-37.0, 8.0)
			z = 2
		}
		set_focus_color \{Color = black}
		set_unfocus_color \{Color = dk_violet_grey}
		get_instrument_brand_and_finish id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p1])
		select_guitar_build_finish_array {
			group = <instrument_group>
			gs_available_instruments = <gs_available_instruments>
		}
		GetArraySize <gs_available_finishes>
		Change gs_finishes_size = <array_Size>
		if (<array_Size> <= 5)
			SetScreenElementProps \{id = gs_triangle_top
				Hide
				preserve_flip}
			SetScreenElementProps \{id = gs_triangle_bottom
				Hide
				preserve_flip}
		endif
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
		if ($gs_current_brand_is_selected_p1 = 1)
			if (($<gs_available_instruments> [$guitar_select_old_guitar_p1]) = (<gs_available_finishes> [<i>]))
				<selected_index> = <i>
			endif
		endif
		GetScreenElementDims id = <id>
		if (<width> > 180)
			fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((180.0, 0.0) + <height> * (0.0, 1.0)) start_x_scale = 0.7 start_y_scale = 0.7
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
		elseif ($gs_current_brand_is_selected_p1 = 1)
			Change \{gs_made_first_selection_bool_p1 = 1}
			if (<selected_index> > 0)
				Change \{disable_menu_sounds = 1}
				<i> = 0
				begin
				LaunchEvent Type = pad_down target = <vparent>
				repeat <selected_index>
				Change \{disable_menu_sounds = 0}
			endif
			SetScreenElementLock \{id = vmenu_guitar_finish_menu_p1
				On}
			SetScreenElementLock \{id = vmenu_guitar_finish_menu_p1
				OFF}
			SetScreenElementLock \{id = scrolling_guitar_finish_menu_p1
				On}
			SetScreenElementLock \{id = scrolling_guitar_finish_menu_p1
				OFF}
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
				group = <instrument_group>
				gs_available_instruments = <gs_available_instruments>
				instrument_type = <instrument_type>
			}
			get_instrument_brand_and_finish id = (<gs_available_finishes> [0])
			SetScreenElementProps \{id = gs_brand_background_p1
				Pos = (0.0, 58.0)}
			SetScreenElementProps \{id = gs_guitar_logo_ID_p1
				Hide}
			SetScreenElementProps {
				id = $gs_guitar_brand_ID_p1
				text = <instrument_brand>
				Scale = (0.75, 0.5)
				Pos = (0.0, -13.0)
				rgba = (($g_menu_colors).light_brown)
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
				Pos = (0.0, 48.0)
				rgba = (($g_menu_colors).fill_rgba)
			}
			fit_finish_text \{Player = 1}
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
			if ($gs_current_brand_is_selected_p1 = 1)
				if (($<gs_available_instruments> [$guitar_select_old_guitar_p1]) = (<gs_available_finishes> [<i>]))
					<selected_index> = <i>
				endif
			endif
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
			elseif ($gs_current_brand_is_selected_p1 = 1)
				Change \{gs_made_first_selection_bool_p1 = 1}
				if (<selected_index> > 0)
					Change \{disable_menu_sounds = 1}
					<i> = 0
					begin
					LaunchEvent Type = pad_down target = <vparent>
					repeat <selected_index>
					Change \{disable_menu_sounds = 0}
				endif
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
				group = <instrument_group>
				gs_available_instruments = <gs_available_instruments>
				instrument_type = <instrument_type>
			}
			get_instrument_brand_and_finish id = (<gs_available_finishes> [0])
			SetScreenElementProps \{id = gs_brand_background_p2
				Pos = (0.0, 58.0)}
			SetScreenElementProps \{id = gs_guitar_logo_ID_p2
				Hide}
			SetScreenElementProps {
				id = $gs_guitar_brand_ID_p2
				text = <instrument_brand>
				Scale = (0.75, 0.5)
				Pos = (0.0, -13.0)
				rgba = (($g_menu_colors).lt_violet_bar)
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
				Pos = (0.0, 48.0)
				rgba = (($g_menu_colors).fill_rgba)
			}
			fit_finish_text \{Player = 2}
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
			if ($gs_current_brand_is_selected_p2 = 1)
				if (($<gs_available_instruments> [$guitar_select_old_guitar_p2]) = (<gs_available_finishes> [<i>]))
					<selected_index> = <i>
				endif
			endif
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
			elseif ($gs_current_brand_is_selected_p2 = 1)
				Change \{gs_made_first_selection_bool_p2 = 1}
				if (<selected_index> > 0)
					Change \{disable_menu_sounds = 1}
					<i> = 0
					begin
					LaunchEvent Type = pad_down target = <vparent>
					repeat <selected_index>
					Change \{disable_menu_sounds = 0}
				endif
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
		SetScreenElementProps {
			id = gs_brand_background
			texture = Char_Select_Frame_BG
			dims = (266.0, 128.0)
			rgba = (($g_menu_colors).lt_violet_grey)
		}
		SetScreenElementProps {
			id = $gs_guitar_brand_ID_p1
			shadow_rgba = (($g_menu_colors).lt_violet_grey)
		}
		get_instrument_brand_and_finish id = <instrument_id>
		SetScreenElementProps id = $gs_guitar_brand_ID_p1 text = <instrument_brand>
		SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
			Scale = 1}
		GetScreenElementDims \{id = $gs_guitar_brand_ID_p1}
		if (<width> > 256)
			SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((250.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (0.0, 8.0))
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
			SetScreenElementProps {
				id = $gs_guitar_brand_ID_p1
				text = <instrument_brand>
				Scale = 1
				Pos = (0.0, 10.0)
				rgba = (($g_menu_colors).fill_rgba)
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
				Pos = (2.0, 93.0)
				rgba = (($g_menu_colors).light_brown)
			}
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p1}
			if (<width> > 230)
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_ID_p1 dims = ((225.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (2.0, 93.0)
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
			SetScreenElementProps {
				id = $gs_guitar_brand_ID_p2
				text = <instrument_brand>
				Scale = 1
				Pos = (0.0, 10.0)
				rgba = (($g_menu_colors).fill_rgba)
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
				Pos = (2.0, 93.0)
				rgba = (($g_menu_colors).lt_violet_bar)
			}
			GetScreenElementDims \{id = $gs_guitar_finish_ID_p2}
			if (<width> > 230)
				SetScreenElementProps \{id = $gs_guitar_finish_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_ID_p2 dims = ((225.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (2.0, 93.0)
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
		if ((($gs_scroll_dir) = down) && (<index> = 0))
			Change \{gs_highlight_index = 0}
		elseif ((($gs_scroll_dir) = up) && (<index> = ($gs_finishes_size - 1)))
			if (<index> > 4)
				Change \{gs_highlight_index = 4}
			else
				Change gs_highlight_index = <index>
			endif
		endif
		<offset> = (($gs_highlight_index) * (0.0, 34.0))
		<l_pos> = ((-61.0, 7.0) + <offset>)
		<r_pos> = ((250.0, 7.0) + <offset>)
		<hl_pos> = ((-37.0, 8.0) + <offset>)
		if ((($gs_highlight_index) = 4) && (<index> >= ($gs_highlight_index)))
			SetScreenElementProps \{id = gs_triangle_bottom
				alpha = 1.0
				preserve_flip}
		else
			SetScreenElementProps \{id = gs_triangle_bottom
				alpha = 0.3
				preserve_flip}
		endif
		if ((($gs_highlight_index) = 0))
			SetScreenElementProps \{id = gs_triangle_top
				alpha = 1.0
				preserve_flip}
		else
			SetScreenElementProps \{id = gs_triangle_top
				alpha = 0.3
				preserve_flip}
		endif
		SetScreenElementProps id = gs_bookend1_ID Pos = <l_pos> preserve_flip
		SetScreenElementProps id = gs_bookend2_ID Pos = <r_pos>
		SetScreenElementProps id = gs_whiteTexHighlight_ID Pos = <hl_pos>
	else
		if (<Player> = 1)
			SetScreenElementProps {
				id = $gs_guitar_finish_ID_p1
				text = <instrument_finish>
			}
			fit_finish_text \{Player = 1}
			SetScreenElementProps {
				id = $gs_guitar_brand_ID_p1
				text = <instrument_brand>
			}
			GetScreenElementDims \{id = $gs_guitar_brand_ID_p1}
			if (<width> > 235)
				SetScreenElementProps \{id = $gs_guitar_brand_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_ID_p1 dims = ((230.0, 0.0) + ((<height>) * (0.0, 1.0)))
			endif
		else
			SetScreenElementProps {
				id = $gs_guitar_finish_ID_p2
				text = <instrument_finish>
			}
			fit_finish_text \{Player = 2}
			SetScreenElementProps {
				id = $gs_guitar_brand_ID_p2
				text = <instrument_brand>
			}
			GetScreenElementDims \{id = $gs_guitar_brand_ID_p2}
			if (<width> > 235)
				SetScreenElementProps \{id = $gs_guitar_brand_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_ID_p2 dims = ((230.0, 0.0) + ((<height>) * (0.0, 1.0)))
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
		Change GlobalName = <guitar_select_available_instruments> NewValue = []
		<i> = 0
		get_musician_instrument_size
		total_size = <array_Size>
		begin
		get_musician_instrument_struct index = <i>
		if StructureContains structure = <info_struct> guitar
			<check> = 0
			if isps3
				if NOT ((<info_struct>.desc_id) = instrument_gh3_360)
					<check> = 1
				endif
			else
				<check> = 1
			endif
			if ((<info_struct>.desc_id) = instrument_jp_psteel)
				<check> = 0
			endif
			if (<check> = 1)
				if GetGlobalTags (<info_struct>.desc_id) param = unlocked noassert = 1
					if (<unlocked>)
						AddArrayElement array = $<guitar_select_available_instruments> element = (<info_struct>.desc_id)
						Change GlobalName = <guitar_select_available_instruments> NewValue = (<array>)
						AddArrayElement array = $guitar_select_guitar_indeces element = <i>
						Change GlobalName = guitar_select_guitar_indeces NewValue = (<array>)
					endif
				else
					AddArrayElement array = $<guitar_select_available_instruments> element = (<info_struct>.desc_id)
					Change GlobalName = <guitar_select_available_instruments> NewValue = (<array>)
					AddArrayElement array = $guitar_select_guitar_indeces element = <i>
					Change GlobalName = guitar_select_guitar_indeces NewValue = (<array>)
				endif
			endif
		endif
		<i> = (<i> + 1)
		repeat <total_size>
	else
		formatText \{checksumName = guitar_select_available_instruments
			'guitar_select_available_bass_array'}
		Change \{GlobalName = guitar_select_bass_indeces
			NewValue = [
			]}
		Change GlobalName = <guitar_select_available_instruments> NewValue = []
		<i> = 0
		get_musician_instrument_size
		total_size = <array_Size>
		begin
		get_musician_instrument_struct index = <i>
		if StructureContains structure = <info_struct> bass
			if GetGlobalTags (<info_struct>.desc_id) param = unlocked noassert = 1
				if (<unlocked>)
					AddArrayElement array = $<guitar_select_available_instruments> element = (<info_struct>.desc_id)
					Change GlobalName = <guitar_select_available_instruments> NewValue = (<array>)
					AddArrayElement array = $guitar_select_bass_indeces element = <i>
					Change GlobalName = guitar_select_bass_indeces NewValue = (<array>)
				endif
			else
				AddArrayElement array = $<guitar_select_available_instruments> element = (<info_struct>.desc_id)
				Change GlobalName = <guitar_select_available_instruments> NewValue = (<array>)
				AddArrayElement array = $guitar_select_bass_indeces element = <i>
				Change GlobalName = guitar_select_bass_indeces NewValue = (<array>)
			endif
		endif
		<i> = (<i> + 1)
		repeat <total_size>
	endif
endscript

script get_random_available_guitar_id \{instrument_type = guitar}
	build_gs_available_guitar_array instrument_type = <instrument_type>
	if (<instrument_type> = guitar)
		formatText \{checksumName = gs_indeces
			'guitar_select_guitar_indeces'}
	else
		formatText \{checksumName = gs_indeces
			'guitar_select_bass_indeces'}
	endif
	GetArraySize <gs_indeces> globalarray
	GetRandomValue a = 0 b = (<array_Size> -1) Name = random_guitar_index integer
	get_musician_instrument_struct index = ($<gs_indeces> [<random_guitar_index>])
	return instrument_id = (<info_struct>.desc_id)
endscript

script fit_finish_text \{Player = 1}
	dim_width = (220.0, 0.0)
	startY = 0.8
	startx = 1
	if (<Player> = 1)
		SetScreenElementProps \{id = $gs_guitar_finish_ID_p1
			Scale = (1.0, 0.8)}
		GetScreenElementDims \{id = $gs_guitar_finish_ID_p1}
		fit_text_in_rectangle id = $gs_guitar_finish_ID_p1 dims = (<dim_width> + (<height> * (0.0, 1.0))) start_x_scale = <startx> start_y_scale = <startY> only_if_larger_x = 1
	else
		SetScreenElementProps \{id = $gs_guitar_finish_ID_p2
			Scale = (1.0, 0.8)}
		GetScreenElementDims \{id = $gs_guitar_finish_ID_p2}
		fit_text_in_rectangle id = $gs_guitar_finish_ID_p2 dims = (<dim_width> + ((<height>) * (0.0, 1.0))) only_if_larger_x = 1 start_x_scale = <startx> start_y_scale = <startY>
	endif
endscript
