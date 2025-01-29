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
gs_guitar_brand_id_p1 = null
gs_guitar_finish_id_p1 = null
gs_guitar_brand_id_p2 = null
gs_guitar_finish_id_p2 = null
gh_net_finish_id = 0
online_guitar_highlighted_id_p1 = instrument_es335_red
online_guitar_highlighted_id_p2 = instrument_es335_red
online_old_guitar_id_p1 = instrument_es335_red
online_old_guitar_id_p2 = instrument_es335_red
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
	create_select_guitar_menu player = <player> instrument_type = bass
endscript

script create_select_guitar_menu \{player = 1
		instrument_type = guitar}
	if (<player> = 1)
		change \{gs_made_first_selection_bool_p1 = 0}
	else
		change \{gs_made_first_selection_bool_p2 = 0}
	endif
	build_gs_available_guitar_array <...>
	formattext checksumname = player_status 'player%i_status' i = <player>
	if find_profile_by_id id = ($<player_status>.character_id)
		get_musician_profile_struct index = <index>
		formattext checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player>
		if getglobaltags <default_characterguitartag> noassert = 1
			if ((<instrument_type> = bass))
				if (<current_instrument> = guitar)
					change structurename = <player_status> instrument_id = <current_selected_bass>
					setglobaltags <default_characterguitartag> params = {current_instrument = bass}
					formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
					change globalname = <change_flag> newvalue = 1
				endif
			elseif ((<instrument_type> = guitar))
				if (<current_instrument> = bass)
					change structurename = <player_status> instrument_id = <current_selected_guitar>
					setglobaltags <default_characterguitartag> params = {current_instrument = guitar}
					formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
					change globalname = <change_flag> newvalue = 1
				endif
			endif
		endif
	endif
	if (<instrument_type> = guitar)
		formattext \{checksumname = guitar_select_available_instruments
			'guitar_select_available_guitar_array'}
	else
		formattext \{checksumname = guitar_select_available_instruments
			'guitar_select_available_bass_array'}
	endif
	select_guitar_build_brand_array instrument_type = guitar gs_available_instruments = <guitar_select_available_instruments> player = <player>
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	event_handlers = [
		{pad_up gs_scroll_up_or_down params = {
				player = <player>
				dir = up
				gs_available_instruments = <guitar_select_available_instruments>
				gs_available_brands = <gs_available_brands>
				instrument_type = <instrument_type>
			}
		}
		{pad_down gs_scroll_up_or_down params = {
				player = <player>
				dir = down
				gs_available_instruments = <guitar_select_available_instruments>
				gs_available_brands = <gs_available_brands>
				instrument_type = <instrument_type>
			}
		}
		{pad_back select_guitar_go_back params = {
				player = <player>
				gs_available_instruments = <guitar_select_available_instruments>
				instrument_type = <instrument_type>
			}
		}
		{pad_choose select_guitar_choose params = {
				guitar_index = $guitar_select_highlighted_guitar_p1
				player = <player>
				gs_available_instruments = <guitar_select_available_instruments>
				gs_available_brands = <gs_available_brands>
				instrument_type = <instrument_type>
			}
		}
	]
	if (<player> = 1)
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
			vmenu_select_guitar_p2 :setprops \{disable_pad_handling}
			launchevent \{type = unfocus
				target = vmenu_select_guitar_p2}
		endif
		vparent = vmenu_select_guitar_p2
	endif
	if ($current_num_players = 1)
		formattext checksumname = player_status 'player%i_status' i = <player>
		their_instrument_id = ($<player_status>.instrument_id)
		get_instrument_name_and_index id = <their_instrument_id>
		select_guitar_get_available_index_from_total_index index = <instrument_index> gs_available_instruments = <guitar_select_available_instruments>
		change guitar_select_highlighted_guitar_p1 = <index>
		change guitar_select_old_guitar_p1 = <index>
		get_musician_instrument_struct index = <instrument_index>
		change gs_instrument_blurb_text = (<info_struct>.blurb)
		createscreenelement \{type = containerelement
			id = select_guitar_container
			parent = root_window
			pos = (386.0, 0.0)}
		<brown_window_color> = [120 60 10 255]
		<window_fill_color> = [0 0 0 200]
		<cs_menu_starting_pos> = (0.0, 110.0)
		displaysprite {
			parent = select_guitar_container
			tex = window_frame_cap
			pos = <cs_menu_starting_pos>
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <brown_window_color>
			z = 0
		}
		displaysprite {
			parent = select_guitar_container
			tex = window_fill_cap
			pos = <cs_menu_starting_pos>
			dims = (256.0, 64.0)
			just = [center center]
			rgba = <window_fill_color>
			z = 0
		}
		displaysprite {
			parent = select_guitar_container
			tex = window_header_01
			pos = (<cs_menu_starting_pos> + (0.0, -40.0))
			dims = (256.0, 64.0)
			just = [center center]
			rgba = [200 200 200 255]
			z = 1
		}
		displaysprite {
			parent = select_guitar_container
			tex = window_frame_body_tall
			pos = (<cs_menu_starting_pos> + (0.0, 32.0))
			dims = (256.0, 434.0)
			just = [center top]
			rgba = <brown_window_color>
			z = 0
		}
		displaysprite {
			parent = select_guitar_container
			tex = window_fill_body_large
			pos = (<cs_menu_starting_pos> + (0.0, 32.0))
			dims = (256.0, 498.0)
			just = [center top]
			rgba = <window_fill_color>
			z = 0
		}
		createscreenelement {
			type = spriteelement
			parent = select_guitar_container
			pos = (<cs_menu_starting_pos> + (-2.0, 430.0))
			dims = (242.0, 128.0)
			just = [center top]
			texture = store_frame_bottom_bg
			z_priority = 1
			rgba = <brown_window_color>
			flip_h
			flip_v
		}
		displaytext {
			parent = select_guitar_container
			text = "SELECT GUITAR"
			pos = ($gs_element_offsets [0])
			scale = (0.6, 0.55)
			font = fontgrid_title_gh3
			just = [center center]
			rgba = [185 100 60 255]
			z = 1
		}
		displaysprite {
			id = gs_brand_background
			parent = select_guitar_container
			tex = char_select_frame_bg
			pos = ($gs_element_offsets [2])
			dims = (266.0, 128.0)
			just = [center center]
			rgba = [250 250 200 255]
			z = 1
		}
		get_instrument_brand_and_finish id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
		displaytext {
			parent = select_guitar_container
			text = <instrument_brand>
			pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
			scale = 1
			font = fontgrid_title_gh3
			just = [center center]
			rgba = [160 80 30 255]
			z = 2
		}
		change gs_guitar_brand_id_p1 = <id>
		getscreenelementdims \{id = $gs_guitar_brand_id_p1}
		if (<width> > 260)
			setscreenelementprops \{id = $gs_guitar_brand_id_p1
				scale = 1}
			fit_text_in_rectangle id = $gs_guitar_brand_id_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
		createscreenelement {
			type = textblockelement
			parent = select_guitar_container
			text = <instrument_name2>
			pos = ($gs_element_offsets [3])
			scale = (0.55, 0.55)
			dims = (440.0, 300.0)
			font = text_a4
			just = [center center]
			rgba = [255 255 200 255]
			z = 2
		}
		change gs_guitar_finish_id_p1 = <id>
		get_instrument_logo id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
		displaytext {
			id = gs_guitar_logo_id_p1
			parent = select_guitar_container
			text = <instrument_logo>
			pos = ($gs_element_offsets [5])
			scale = 0.8
			font = fontgrid_title_gh3
			just = [center center]
			rgba = [250 250 200 255]
			z = 2
		}
		createscreenelement {
			type = windowelement
			parent = select_guitar_container
			id = gs_instrument_info_scroll_window
			pos = ($gs_element_offsets [4])
			dims = (388.0, 250.0)
		}
		spawnscriptnow {
			select_guitar_scroll_instrument_info
			params = {
				parent = gs_instrument_info_scroll_window
				pos = (($gs_element_offsets [4]) + (0.0, -10.0))
			}
		}
	else
		if (<instrument_type> = guitar)
			change \{gs_select_text = "SELECT GUITAR"}
		elseif (<instrument_type> = bass)
			change \{gs_select_text = "SELECT BASS"}
		endif
		if (<player> = 1)
			formattext checksumname = player_status 'player%i_status' i = <player>
			if find_profile_by_id id = ($<player_status>.character_id)
				get_musician_profile_struct index = <index>
				formattext checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player> addtostringlookup = true
				if getglobaltags <default_characterguitartag> noassert = 1
					if (<instrument_type> = guitar)
						<their_instrument_id> = <current_selected_guitar>
					else
						<their_instrument_id> = <current_selected_bass>
					endif
					get_instrument_name_and_index id = <their_instrument_id>
					select_guitar_get_available_index_from_total_index index = <instrument_index> gs_available_instruments = <guitar_select_available_instruments>
					change guitar_select_highlighted_guitar_p1 = <index>
					change guitar_select_old_guitar_p1 = <index>
					if NOT (<their_instrument_id> = $<player_status>.instrument_id)
						killspawnedscript \{name = store_update_player_status}
						spawnscriptnow store_update_player_status params = {player = <player> instrument_id = <their_instrument_id>}
					endif
				endif
			endif
			createscreenelement \{type = containerelement
				id = select_guitar_container
				parent = root_window
				pos = (460.0, 500.0)}
			displaysprite \{parent = select_guitar_container
				tex = guitar_select_2p_frame
				just = [
					center
					center
				]
				dims = (256.0, 432.0)
				pos = (0.0, 40.0)
				z = 0}
			displaysprite \{parent = select_guitar_container
				tex = guitar_select_2p_wing
				just = [
					center
					center
				]
				pos = (140.0, -24.0)
				z = 0}
			displaysprite \{parent = select_guitar_container
				tex = guitar_select_2p_wing
				just = [
					center
					center
				]
				pos = (-140.0, -24.0)
				z = 0
				flip_v}
			displaytext \{id = gs_select_guitar_text_p1
				parent = select_guitar_container
				text = $gs_select_text
				pos = (0.0, -30.0)
				scale = (0.5, 0.43)
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
			displaysprite \{id = gs_brand_background_p1
				parent = select_guitar_container
				tex = char_select_frame_bg
				pos = (0.0, 30.0)
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
			displaysprite \{id = gs_finish_background_p1
				parent = select_guitar_container
				tex = white
				pos = (0.0, 88.0)
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
			displaytext {
				parent = select_guitar_container
				text = <instrument_brand>
				pos = (0.0, 10.0)
				scale = 1
				font = text_a4
				just = [center center]
				rgba = [80 0 10 255]
				z = 2
				noshadow
			}
			change gs_guitar_brand_id_p1 = <id>
			getscreenelementdims \{id = $gs_guitar_brand_id_p1}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_brand_id_p1
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_id_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			get_instrument_logo id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
			displaytext {
				id = gs_guitar_logo_id_p1
				parent = select_guitar_container
				text = <instrument_logo>
				pos = (0.0, 40.0)
				scale = 0.6
				font = text_a4
				just = [center center]
				rgba = [0 0 0 255]
				z = 2
				noshadow
			}
			displaytext {
				parent = select_guitar_container
				text = <instrument_name2>
				pos = (0.0, 83.0)
				scale = (0.75, 0.5)
				font = text_a4
				just = [center center]
				rgba = [250 250 200 255]
				z = 2
				noshadow
			}
			change gs_guitar_finish_id_p1 = <id>
			getscreenelementdims \{id = $gs_guitar_finish_id_p1}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_finish_id_p1
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_id_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 83.0)
			endif
		else
			formattext checksumname = player_status 'player%i_status' i = <player>
			if find_profile_by_id id = ($<player_status>.character_id)
				get_musician_profile_struct index = <index>
				formattext checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player> addtostringlookup = true
				if getglobaltags <default_characterguitartag> noassert = 1
					if (<instrument_type> = guitar)
						<their_instrument_id> = <current_selected_guitar>
					else
						<their_instrument_id> = <current_selected_bass>
					endif
					get_instrument_name_and_index id = <their_instrument_id>
					select_guitar_get_available_index_from_total_index index = <instrument_index> gs_available_instruments = <guitar_select_available_instruments>
					change guitar_select_highlighted_guitar_p2 = <index>
					change guitar_select_old_guitar_p2 = <index>
					if NOT (<their_instrument_id> = $<player_status>.instrument_id)
						killspawnedscript \{name = store_update_player_status}
						spawnscriptnow store_update_player_status params = {player = <player> instrument_id = <their_instrument_id>}
					endif
				endif
			endif
			createscreenelement \{type = containerelement
				id = select_guitar_container_p2
				parent = root_window
				pos = (810.0, 500.0)}
			displaysprite \{parent = select_guitar_container_p2
				tex = guitar_select_2p_frame
				just = [
					center
					center
				]
				dims = (256.0, 432.0)
				pos = (0.0, 40.0)
				z = 0}
			displaysprite \{parent = select_guitar_container_p2
				tex = guitar_select_2p_wing
				just = [
					center
					center
				]
				pos = (140.0, -24.0)
				z = 0}
			displaysprite \{parent = select_guitar_container_p2
				tex = guitar_select_2p_wing
				just = [
					center
					center
				]
				pos = (-140.0, -24.0)
				z = 0
				flip_v}
			displaytext \{id = gs_select_guitar_text_p2
				parent = select_guitar_container_p2
				text = $gs_select_text
				pos = (0.0, -30.0)
				scale = (0.5, 0.43)
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
			displaysprite \{id = gs_brand_background_p2
				parent = select_guitar_container_p2
				tex = char_select_frame_bg
				pos = (0.0, 30.0)
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
			displaysprite \{id = gs_finish_background_p2
				parent = select_guitar_container_p2
				tex = white
				pos = (0.0, 88.0)
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
			displaytext {
				parent = select_guitar_container_p2
				text = <instrument_brand>
				pos = (0.0, 10.0)
				scale = 1
				font = text_a4
				just = [center center]
				rgba = [70 0 50 255]
				z = 2
				noshadow
			}
			change gs_guitar_brand_id_p2 = <id>
			getscreenelementdims \{id = $gs_guitar_brand_id_p2}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_brand_id_p2
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_id_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			get_instrument_logo id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p2])
			displaytext {
				id = gs_guitar_logo_id_p2
				parent = select_guitar_container_p2
				text = <instrument_logo>
				pos = (0.0, 40.0)
				scale = 0.6
				font = text_a4
				just = [center center]
				rgba = [0 0 0 255]
				z = 2
				noshadow
			}
			displaytext {
				parent = select_guitar_container_p2
				text = <instrument_name2>
				pos = (0.0, 83.0)
				scale = (0.75, 0.5)
				font = text_a4
				just = [center center]
				rgba = [240 210 250 255]
				z = 2
				noshadow
			}
			change gs_guitar_finish_id_p2 = <id>
			getscreenelementdims \{id = $gs_guitar_finish_id_p2}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_finish_id_p2
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_id_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 83.0)
			endif
		endif
	endif
	if (<player> = 1)
		get_instrument_name_and_index id = ($player1_status.instrument_id)
		change g_old_selected_guitar_index_p1 = <instrument_index>
	else
		get_instrument_name_and_index id = ($player2_status.instrument_id)
		change g_old_selected_guitar_index_p2 = <instrument_index>
	endif
	formattext checksumname = player_status 'player%i_status' i = <player>
	if ($current_num_players = 1)
		change \{using_guitar_select_camera = 1}
		change \{lock_guitar_select_camera = 1}
		char_name = ($<player_status>.band_member)
		launchevent type = unfocus target = <vparent>
		if compositeobjectexists name = <char_name>
			<char_name> :ragdoll_markforreset
			<char_name> :handle_change_stance stance = stance_frontend_guitar speed = 2.0 no_wait
		endif
		playigccam \{id = gs_view_cam_id
			name = gs_view_cam
			viewport = bg_viewport
			controlscript = guitar_select_camera_morph
			lockto = world
			pos = (10.0, 5.0, 1.580106)
			quat = (0.028251, -0.9906429, 0.13347001)
			fov = 72.0
			play_hold = 1
			interrupt_current
			time = 0.5}
		begin
		if ($lock_guitar_select_camera = 0)
			break
		else
			wait \{1
				gameframe}
		endif
		repeat
	endif
	launchevent type = focus target = <vparent>
endscript
using_guitar_select_camera = 0
lock_guitar_select_camera = 0

script guitar_select_camera_morph 
	change \{lock_guitar_select_camera = 1}
	ccam_domorph \{lockto = world
		pos = (2.503113, 1.0385579, 2.869411)
		quat = (0.028074998, -0.999026, 0.020287)
		fov = 78.0}
	ccam_waitmorph
	ccam_domorph \{lockto = guitarist
		locktobone = bone_guitar_neck
		pos = (0.05, 0.6, -0.4)
		quat = (0.48735002, 0.463712, -0.514474)
		fov = 120.0
		time = 0.5
		motion = smooth}
	screenfx_addfxinstance \{viewport = bg_viewport
		name = gsdof
		scefname = dof
		time = 0.5
		type = dof
		on = 1
		backdist = 0.003
		strength = 0.6
		blurradius = 6
		blurresolution = half}
	screenfx_addfxinstance \{viewport = bg_viewport
		name = gsdof2
		scefname = dof2
		time = 0.5
		type = dof
		on = 1
		backdist = 0.01
		strength = 1.0
		blurradius = 6
		blurresolution = half}
	ccam_waitmorph
	ccam_freeze
	change \{lock_guitar_select_camera = 0}
endscript

script select_guitar_build_brand_array \{instrument_type = guitar
		player = 1}
	getarraysize <gs_available_instruments> globalarray
	<our_array_size> = <array_size>
	get_musician_instrument_size
	<their_array_size> = <array_size>
	gs_available_brands = []
	<i> = 0
	begin
	<j> = 0
	begin
	get_musician_instrument_struct index = <j>
	if (($<gs_available_instruments> [<i>]) = (<info_struct>.desc_id))
		<k> = 0
		<found_brand> = 0
		getarraysize (<gs_available_brands>)
		if (<array_size> > 0)
			begin
			if ((<gs_available_brands> [<k>]) = (<info_struct>.name))
				<found_brand> = 1
				formattext checksumname = player_status 'player%i_status' i = <player>
				if (($<player_status>.instrument_id) = (<info_struct>.desc_id))
					if (<player> = 1)
						change gs_selected_brand_p1 = <k>
					else
						change gs_selected_brand_p2 = <k>
					endif
				endif
				break
			endif
			<k> = (<k> + 1)
			repeat <array_size>
		endif
		if (<found_brand> = 0)
			addarrayelement array = (<gs_available_brands>) element = (<info_struct>.name)
			<gs_available_brands> = (<array>)
			formattext checksumname = player_status 'player%i_status' i = <player>
			if (($<player_status>.instrument_id) = (<info_struct>.desc_id))
				if (<player> = 1)
					change gs_selected_brand_p1 = <array_size>
				else
					change gs_selected_brand_p2 = <array_size>
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
	getarraysize <gs_available_instruments> globalarray
	<our_array_size> = <array_size>
	get_musician_instrument_size
	<their_array_size> = <array_size>
	gs_available_finishes = []
	<i> = 0
	begin
	<j> = 0
	begin
	get_musician_instrument_struct index = <j>
	if (($<gs_available_instruments> [<i>]) = (<info_struct>.desc_id))
		get_instrument_brand_and_finish id = (<info_struct>.desc_id)
		if (<instrument_brand> = <brand>)
			addarrayelement array = (<gs_available_finishes>) element = (<info_struct>.desc_id)
			<gs_available_finishes> = (<array>)
		endif
	endif
	<j> = (<j> + 1)
	repeat <their_array_size>
	<i> = (<i> + 1)
	repeat <our_array_size>
	return gs_available_finishes = <gs_available_finishes>
endscript

script destroy_select_guitar_menu \{player = 1}
	if (<player> = 1)
		destroy_menu \{menu_id = scrolling_select_guitar_p1}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
		if ($current_num_players = 1)
			killspawnedscript \{name = select_guitar_scroll_instrument_info}
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
	formattext checksumname = player_status 'player%i_status' i = <player>
	<band_member> = ($<player_status>.band_member)
	if compositeobjectexists name = <band_member>
		if <band_member> :anim_animnodeexists id = bodytimer
			<band_member> :anim_command target = bodytimer command = timer_setspeed params = {speed = 1.0}
		endif
	endif
	if ($current_num_players = 1)
		killcamanim \{name = gs_view_cam}
	endif
endscript
guitar_select_camera_changing = 0

script guitar_select_exit_camera_morph 
	change \{guitar_select_camera_changing = 1}
	ccam_domorph \{lockto = guitarist
		locktobone = bone_guitar_neck
		pos = (0.05, 0.618989, -0.4)
		quat = (0.48735002, 0.463712, -0.514474)
		fov = 120.0
		motion = smooth}
	ccam_waitmorph
	ccam_domorph \{lockto = world
		pos = (2.503113, 1.0385579, 2.869411)
		quat = (0.028074998, -0.999026, 0.020287)
		fov = 78.0
		time = 0.5
		motion = smooth}
	screenfx_updatefxinstanceparams \{viewport = bg_viewport
		name = gsdof
		time = 0.5
		type = dof
		on = 1
		backdist = 0.003
		strength = 0
		blurradius = 6
		blurresolution = half}
	screenfx_updatefxinstanceparams \{viewport = bg_viewport
		name = gsdof2
		time = 0.5
		type = dof
		on = 1
		backdist = 0.01
		strength = 0
		blurradius = 6
		blurresolution = half}
	ccam_waitmorph
	screenfx_removefxinstance \{viewport = bg_viewport
		name = gsdof}
	screenfx_removefxinstance \{viewport = bg_viewport
		name = gsdof2
		time = 2}
	change \{guitar_select_camera_changing = 0}
endscript

script wait_for_guitar_select_exit_camera 
	wait \{5
		gameframes}
	begin
	if ($guitar_select_camera_changing = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script gs_wait_to_load_guitar_p1 
	wait \{0.2
		second}
	change \{globalname = generic_select_monitor_p1_changed
		newvalue = 1}
endscript

script gs_wait_to_load_guitar_p2 
	wait \{0.2
		second}
	change \{globalname = generic_select_monitor_p2_changed
		newvalue = 1}
endscript

script gs_scroll_up_or_down \{player = 1
		dir = down}
	generic_menu_up_or_down_sound params = {<dir>}
	if (<player> = 1)
		if ($gs_made_first_selection_bool_p1 = 0)
			getarraysize (gs_available_brands)
			<avail_size> = <array_size>
			if (<dir> = down)
				change gs_selected_brand_p1 = ($gs_selected_brand_p1 + 1)
				if ($gs_selected_brand_p1 = <avail_size>)
					change \{gs_selected_brand_p1 = 0}
				endif
			endif
			if (<dir> = up)
				change gs_selected_brand_p1 = ($gs_selected_brand_p1 - 1)
				if ($gs_selected_brand_p1 = -1)
					change gs_selected_brand_p1 = (<avail_size> - 1)
				endif
			endif
			<inst_id> = 0
			select_guitar_get_first_guitar_brand_in_list {
				brand = (<gs_available_brands> [$gs_selected_brand_p1])
				instrument_type = <instrument_type>
				gs_available_instruments = <gs_available_instruments>
			}
			<inst_id> = <instrument_id>
			change guitar_select_highlighted_guitar_p1 = <instrument_index>
			formattext checksumname = player_status 'player%i_status' i = <player>
			if NOT (<inst_id> = $<player_status>.instrument_id)
				killspawnedscript \{name = store_update_player_status}
				spawnscriptnow store_update_player_status params = {player = <player> instrument_id = <inst_id>}
				if ($current_num_players = 1)
					select_guitar_change_blurb_text inst_id = <inst_id>
				endif
			endif
			if (($is_network_game) = 1)
				change online_guitar_highlighted_id_p1 = ($<player_status>.instrument_id)
				if (<dir> = up)
					dir_value = 0
				else
					dir_value = 1
				endif
				network_player_lobby_message {
					type = guitar_select
					action = update
					checksum = <instrument_type>
					value1 = <dir_value>
				}
			endif
			get_instrument_brand_and_finish id = <inst_id>
			setscreenelementprops id = $gs_guitar_brand_id_p1 text = <instrument_brand>
			setscreenelementprops id = $gs_guitar_finish_id_p1 text = <instrument_name2>
			if ($current_num_players = 1)
				setscreenelementprops \{id = $gs_guitar_brand_id_p1
					scale = 1}
				getscreenelementdims \{id = $gs_guitar_brand_id_p1}
				if (<width> > 260)
					fit_text_in_rectangle id = $gs_guitar_brand_id_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
				endif
			else
				setscreenelementprops \{id = $gs_guitar_brand_id_p1
					scale = 1}
				getscreenelementdims \{id = $gs_guitar_brand_id_p1}
				if (<width> > 260)
					fit_text_in_rectangle id = $gs_guitar_brand_id_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 10.0)
				endif
				setscreenelementprops \{id = $gs_guitar_finish_id_p1
					scale = 1}
				getscreenelementdims \{id = $gs_guitar_finish_id_p1}
				if (<width> > 260)
					fit_text_in_rectangle id = $gs_guitar_finish_id_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 0.5))) pos = (0.0, 83.0)
				else
					setscreenelementprops \{id = $gs_guitar_finish_id_p1
						scale = (0.75, 0.5)}
				endif
			endif
			get_instrument_logo id = <inst_id>
			setscreenelementprops id = gs_guitar_logo_id_p1 text = <instrument_logo>
		endif
	else
		if ($gs_made_first_selection_bool_p2 = 0)
			getarraysize (gs_available_brands)
			<avail_size> = <array_size>
			if (<dir> = down)
				change gs_selected_brand_p2 = ($gs_selected_brand_p2 + 1)
				if ($gs_selected_brand_p2 = <avail_size>)
					change \{gs_selected_brand_p2 = 0}
				endif
			endif
			if (<dir> = up)
				change gs_selected_brand_p2 = ($gs_selected_brand_p2 - 1)
				if ($gs_selected_brand_p2 = -1)
					change gs_selected_brand_p2 = (<avail_size> - 1)
				endif
			endif
			<inst_id> = 0
			select_guitar_get_first_guitar_brand_in_list {
				brand = (<gs_available_brands> [$gs_selected_brand_p2])
				instrument_type = <instrument_type>
				gs_available_instruments = <gs_available_instruments>
			}
			change guitar_select_highlighted_guitar_p2 = <instrument_index>
			<inst_id> = <instrument_id>
			formattext checksumname = player_status 'player%i_status' i = <player>
			if NOT (<inst_id> = $<player_status>.instrument_id)
				killspawnedscript \{name = store_update_player_status}
				spawnscriptnow store_update_player_status params = {player = <player> instrument_id = <inst_id>}
			endif
			get_instrument_brand_and_finish id = <inst_id>
			setscreenelementprops id = $gs_guitar_brand_id_p2 text = <instrument_brand>
			setscreenelementprops id = $gs_guitar_finish_id_p2 text = <instrument_name2>
			setscreenelementprops \{id = $gs_guitar_brand_id_p2
				scale = 1}
			getscreenelementdims \{id = $gs_guitar_brand_id_p2}
			if (<width> > 260)
				fit_text_in_rectangle id = $gs_guitar_brand_id_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			setscreenelementprops \{id = $gs_guitar_finish_id_p2
				scale = 1}
			getscreenelementdims \{id = $gs_guitar_finish_id_p2}
			if (<width> > 260)
				fit_text_in_rectangle id = $gs_guitar_finish_id_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 0.5))) pos = (0.0, 83.0)
			else
				setscreenelementprops \{id = $gs_guitar_finish_id_p2
					scale = (0.75, 0.5)}
			endif
			get_instrument_logo id = <inst_id>
			setscreenelementprops id = gs_guitar_logo_id_p2 text = <instrument_logo>
		endif
	endif
endscript

script select_guitar_go_back \{player = 1
		instrument_type = guitar}
	if (<player> = 1)
		instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p1)])
		change \{guitar_select_highlighted_guitar_p1 = $guitar_select_old_guitar_p1}
		change \{gs_selected_brand_p1 = $gs_old_selected_brand_p1}
		if ($is_network_game = 1)
			get_musician_instrument_type desc_id = <instrument_id>
			if (<instrument_type> = guitar)
				change player1_selected_guitar = <instrument_id>
			else
				change player1_selected_bass = <instrument_id>
			endif
		endif
	else
		instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p2)])
		change \{guitar_select_highlighted_guitar_p2 = $guitar_select_old_guitar_p2}
		change \{gs_selected_brand_p2 = $gs_old_selected_brand_p2}
	endif
	formattext checksumname = player_status 'player%i_status' i = <player>
	if NOT (<instrument_id> = $<player_status>.instrument_id)
		change structurename = <player_status> instrument_id = <instrument_id>
		if NOT ($is_network_game)
			if find_profile_by_id id = ($<player_status>.character_id)
				get_musician_profile_struct index = <index>
				formattext checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player>
				if (<instrument_type> = guitar)
					setglobaltags <default_characterguitartag> params = {current_instrument = guitar current_selected_guitar = <instrument_id>}
				else
					setglobaltags <default_characterguitartag> params = {current_instrument = bass current_selected_bass = <instrument_id>}
				endif
			endif
		endif
		formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
		change globalname = <change_flag> newvalue = 1
		if ($current_num_players = 1)
			select_guitar_change_blurb_text inst_id = <instrument_id>
		endif
		generic_select_monitor_wait
	endif
	if NOT ($is_network_game)
		if find_profile_by_id id = ($<player_status>.character_id)
			get_musician_profile_struct index = <index>
			formattext checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player> addtostringlookup = true
			setglobaltags <default_characterguitartag> params = {current_instrument = <instrument_type>}
		endif
	endif
	ui_flow_manager_respond_to_action action = go_back player = <player>
endscript

script select_guitar_menu_lose_focus 
	gettags
	setscreenelementprops id = <id> rgba = [180 100 60 255]
endscript

script select_guitar_choose \{player = 1
		needs_net_message = 1
		includes_finish = 0}
	soundevent \{event = ui_sfx_select}
	if ($current_num_players = 1)
		begin
		if ($generic_select_monitor_p1_changed = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	if (<player> = 1)
		<inst_id> = ($<gs_available_instruments> [($guitar_select_highlighted_guitar_p1)])
		change structurename = player1_status instrument_id = <inst_id>
		if find_profile_by_id id = ($player1_status.character_id)
			get_musician_profile_struct index = <index>
			formattext checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player>
			if (<instrument_type> = guitar)
				setglobaltags <default_characterguitartag> params = {current_instrument = guitar current_selected_guitar = <inst_id>}
				change player1_selected_guitar = <inst_id>
			else
				setglobaltags <default_characterguitartag> params = {current_instrument = bass current_selected_bass = <inst_id>}
				change player1_selected_bass = <inst_id>
			endif
		endif
		change \{guitar_select_old_guitar_p1 = $guitar_select_highlighted_guitar_p1}
		change \{gs_old_selected_brand_p1 = $gs_selected_brand_p1}
		if ($gs_made_first_selection_bool_p1 = 0)
			select_guitar_create_finish_menu gs_available_instruments = <gs_available_instruments> player = <player> instrument_type = <instrument_type>
			change \{gs_made_first_selection_bool_p1 = 1}
		else
			ui_flow_manager_respond_to_action action = select_character_hub player = <player> create_params = {player = <player>} destroy_params = {player = <player>}
		endif
	else
		<inst_id> = ($<gs_available_instruments> [($guitar_select_highlighted_guitar_p2)])
		change structurename = player2_status instrument_id = <inst_id>
		if NOT ($is_network_game)
			if find_profile_by_id id = ($player2_status.character_id)
				get_musician_profile_struct index = <index>
				formattext checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player>
				if (<instrument_type> = guitar)
					setglobaltags <default_characterguitartag> params = {current_instrument = guitar current_selected_guitar = <inst_id>}
				else
					setglobaltags <default_characterguitartag> params = {current_instrument = bass current_selected_bass = <inst_id>}
				endif
			endif
		endif
		change \{guitar_select_old_guitar_p2 = $guitar_select_highlighted_guitar_p2}
		change \{gs_old_selected_brand_p2 = $gs_selected_brand_p2}
		if ($gs_made_first_selection_bool_p2 = 0)
			select_guitar_create_finish_menu gs_available_instruments = <gs_available_instruments> player = <player> instrument_type = <instrument_type>
			change \{gs_made_first_selection_bool_p2 = 1}
		else
			ui_flow_manager_respond_to_action action = select_character_hub player = <player> create_params = {player = <player>} destroy_params = {player = <player>}
		endif
	endif
endscript

script get_instrument_name_and_index 
	get_musician_instrument_size
	index = 0
	begin
	get_musician_instrument_struct index = <index>
	if (<id> = (<info_struct>.desc_id))
		return instrument_name = (<info_struct>.name) instrument_index = <index>
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	get_instrument_name_and_index \{id = instrument_explorer_white}
	return instrument_name = (<info_struct>.name) instrument_index = <index> false
endscript

script get_player_instrument_desc_name \{player = 1}
	if (<player> = 1)
		instrument_id = ($player1_status.instrument_id)
	else
		instrument_id = ($player2_status.instrument_id)
	endif
	if find_instrument_index desc_id = (<instrument_id>)
		get_musician_instrument_struct index = <index>
		return true instrument_name = (<info_struct>.desc_name)
	else
		return \{false
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
		if gotparam \{ins_fin}
			getuppercasestring <ins_fin>
			gitaf_instrument_finish = <uppercasestring>
		else
			gitaf_instrument_finish = "Something Bad Happened..."
		endif
		<ins_name2> = (<info_struct>.name2)
		if gotparam \{ins_name2}
			getuppercasestring <ins_name2>
			gitaf_instrument_name2 = <uppercasestring>
		else
			gitaf_instrument_name2 = "Something Bad Happened..."
		endif
		<ins_brand> = (<info_struct>.name)
		if gotparam \{ins_fin}
			getuppercasestring <ins_brand>
			gitaf_instrument_brand = <uppercasestring>
		else
			gitaf_instrument_brand = "Something Bad Happened..."
		endif
		return instrument_brand = <gitaf_instrument_brand> instrument_finish = <gitaf_instrument_finish> instrument_name2 = <gitaf_instrument_name2>
	endif
	<index> = (<index> + 1)
	repeat <array_size>
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
		if gotparam \{ins_logo}
			getuppercasestring <ins_logo>
			gitaf_instrument_logo = <uppercasestring>
		else
			gitaf_instrument_logo = "Something Bad Happened..."
		endif
		return instrument_logo = <gitaf_instrument_logo>
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{instrument_logo = "Logo Not Found!!!"}
endscript

script select_guitar_change_blurb_text \{lines_in_window = 8}
	if gotparam \{inst_id}
		get_instrument_name_and_index id = <inst_id>
		get_musician_instrument_struct index = <instrument_index>
		change gs_instrument_blurb_text = (<info_struct>.blurb)
	else
		change gs_instrument_blurb_text = <text>
	endif
	killspawnedscript \{name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	createscreenelement {
		type = windowelement
		parent = select_guitar_container
		id = gs_instrument_info_scroll_window
		pos = ($gs_element_offsets [4])
		dims = (388.0, 250.0)
	}
	my_pos = (($gs_element_offsets [4]) + (0.0, -10.0))
	my_x_dims = 362
	if gotparam \{dims}
		gs_instrument_info_scroll_window :setprops dims = <dims>
	endif
	if gotparam \{x_dims}
		<my_x_dims> = <x_dims>
	endif
	if gotparam \{pos}
		<my_pos> = <pos>
		gs_instrument_info_scroll_window :setprops pos = <my_pos>
	endif
	my_z = 2
	if gotparam \{z}
		<my_z> = <z>
	endif
	spawnscriptnow {
		select_guitar_scroll_instrument_info
		params = {
			parent = gs_instrument_info_scroll_window
			x_dims = <my_x_dims>
			z = <my_z>
			pos = <my_pos>
			lines_in_window = <lines_in_window>
		}
	}
endscript

script select_guitar_scroll_instrument_info \{z = 2
		x_dims = 362}
	createscreenelement {
		type = textblockelement
		parent = <parent>
		just = [left top]
		internal_just = [left top]
		pos = (0.0, 0.0)
		scale = (0.58, 0.6)
		text = $gs_instrument_blurb_text
		font = text_a4
		rgba = [235 145 80 255]
		z_priority = <z>
		dims = (<x_dims> * (1.0, 0.0))
		allow_expansion
		line_spacing = 1.25
	}
	<text_id> = <id>
	setscreenelementlock id = <text_id> on
	<text_id> :getparentid
	getscreenelementdims id = <parent_id>
	<parent_height> = <height>
	getscreenelementdims id = <text_id>
	getscreenelementchildren id = <text_id>
	getarraysize (<children>)
	<line_nums> = (<array_size> + 0.01)
	<pixels_per_line> = (<height> / <line_nums>)
	<fade_time> = 1.5
	<idle_time> = 3.5
	<black_time> = 0.2
	begin
	<text_id> :domorph alpha = 0 pos = (0.0, 0.0)
	<text_id> :domorph alpha = 1 time = <fade_time>
	if (<height> <= <parent_height>)
		break
	endif
	wait <idle_time> seconds
	<diff> = (<height> - <parent_height> + 2.1)
	<lines_to_scroll> = (<diff> / <pixels_per_line>)
	<rate> = 1.0
	<text_id> :domorph pos = (<diff> * (0.0, -1.0)) time = (<rate> * <lines_to_scroll>)
	wait <idle_time> seconds
	<text_id> :domorph alpha = 0 time = <fade_time>
	wait <black_time> seconds
	repeat
endscript

script select_guitar_get_first_guitar_brand_in_list \{brand = explorer}
	<i> = 0
	getarraysize <gs_available_instruments> globalarray
	total_size = <array_size>
	begin
	if (<instrument_type> = guitar)
		get_musician_instrument_struct index = ($guitar_select_guitar_indeces [<i>])
	else
		get_musician_instrument_struct index = ($guitar_select_bass_indeces [<i>])
	endif
	if ((<info_struct>.name) = <brand>)
		return instrument_id = (<info_struct>.desc_id) instrument_index = <i>
	endif
	<i> = (<i> + 1)
	repeat <total_size>
endscript

script select_guitar_get_available_index_from_total_index \{index = 0}
	<i> = 0
	getarraysize <gs_available_instruments> globalarray
	<avail_size> = <array_size>
	begin
	get_musician_instrument_struct index = <index>
	if (($<gs_available_instruments> [<i>]) = (<info_struct>.desc_id))
		return index = <i>
	endif
	<i> = (<i> + 1)
	repeat <avail_size>
endscript

script select_guitar_create_finish_menu \{player = 1}
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back select_guitar_go_back_from_finish_menu params = {gs_available_instruments = <gs_available_instruments> player = <player> instrument_type = <instrument_type>}}
	]
	<p1_menu_pos> = (566.0, 480.0)
	<p2_menu_pos> = (786.0, 490.0)
	<menu_offset> = (-270.0, -160.0)
	if (<player> = 1)
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
			killspawnedscript \{name = select_guitar_scroll_instrument_info}
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
			vmenu_guitar_finish_menu_p2 :setprops \{disable_pad_handling}
			launchevent \{type = unfocus
				target = vmenu_guitar_finish_menu_p2}
		endif
		vparent = vmenu_guitar_finish_menu_p2
	endif
	if (<player> = 1)
		launchevent \{type = unfocus
			target = scrolling_select_guitar_p1}
	else
		if NOT ($is_network_game)
			launchevent \{type = unfocus
				target = scrolling_select_guitar_p2}
		endif
	endif
	if ($current_num_players = 1)
		createscreenelement {
			type = containerelement
			id = select_finish_container
			parent = root_window
			pos = (<p1_menu_pos> + <menu_offset>)
			internal_just = [center top]
		}
		<brown_window_color> = [120 60 10 255]
		setscreenelementprops {
			id = gs_brand_background
			texture = store_frame_bottom_bg
			dims = (242.0, 128.0)
			rgba = <brown_window_color>
		}
		setscreenelementprops \{id = $gs_guitar_brand_id_p1
			rgba = [
				250
				250
				200
				255
			]
			scale = 0.8}
		getscreenelementdims \{id = $gs_guitar_brand_id_p1}
		if (<width> > 260)
			setscreenelementprops \{id = $gs_guitar_brand_id_p1
				scale = 1}
			fit_text_in_rectangle id = $gs_guitar_brand_id_p1 dims = ((215.0, 0.0) + (<height> * (0.0, 1.0))) pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
		displaysprite \{id = gs_bookend1_id
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
			pos = (-64.0, 11.0)
			z = 4}
		displaysprite \{id = gs_bookend2_id
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
			pos = (238.0, 11.0)
			z = 4}
		displaysprite \{id = gs_whitetexhighlight_id
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
			pos = (-47.0, 8.0)
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
		getarraysize <gs_available_finishes>
		<i> = 0
		begin
		get_instrument_brand_and_finish id = (<gs_available_finishes> [<i>])
		formattext checksumname = gs_finish_menu_item_id 'gs_finish_menu_item_%n' n = <i>
		createscreenelement {
			id = <gs_finish_menu_item_id>
			type = textelement
			parent = <vparent>
			font = text_a4
			scale = (0.7, 0.7)
			rgba = ($menu_unfocus_color)
			just = [center top]
			text = <instrument_finish>
			event_handlers = [
				{focus retail_menu_focus}
				{focus select_guitar_finish_highlight params = {player = <player>
						id = (<gs_available_finishes> [<i>])
						index = <i>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose select_guitar_finish_choose params = {id = (<gs_available_finishes> [<i>])
						player = <player>
						gs_available_instruments = <gs_available_instruments>
						instrument_type = <instrument_type>
					}
				}
			]
		}
		getscreenelementdims id = <id>
		if (<width> > 180)
			setscreenelementprops id = <id> scale = 1
			fit_text_in_rectangle id = <id> dims = ((180.0, 34.0))
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		if (<array_size> = 1)
			change \{gs_made_first_selection_bool_p1 = 1}
			select_guitar_finish_highlight {
				player = <player>
				id = (<gs_available_finishes> [0])
			}
			select_guitar_finish_choose {
				id = (<gs_available_finishes> [0])
				player = <player>
				gs_available_instruments = <gs_available_instruments>
				instrument_type = <instrument_type>
			}
		endif
	else
		if (<player> = 1)
			launchevent \{type = unfocus
				target = scrolling_select_guitar_p1}
			launchevent type = focus target = <vparent>
			setscreenelementprops \{id = gs_select_guitar_text_p1
				text = "SELECT FINISH"}
			get_instrument_brand_and_finish id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p1])
			select_guitar_build_finish_array {
				brand = <instrument_brand>
				gs_available_instruments = <gs_available_instruments>
			}
			get_instrument_brand_and_finish id = (<gs_available_finishes> [0])
			setscreenelementprops \{id = gs_brand_background_p1
				pos = (0.0, 58.0)}
			setscreenelementprops \{id = gs_finish_background_p1
				pos = (0.0, 0.0)}
			setscreenelementprops \{id = gs_guitar_logo_id_p1
				hide}
			setscreenelementprops {
				id = $gs_guitar_brand_id_p1
				text = <instrument_brand>
				scale = (0.75, 0.5)
				pos = (0.0, -6.0)
				rgba = [250 250 200 255]
			}
			getscreenelementdims \{id = $gs_guitar_brand_id_p1}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_brand_id_p1
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_id_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			setscreenelementprops {
				id = $gs_guitar_finish_id_p1
				text = <instrument_finish>
				scale = (1.0, 0.8)
				pos = (0.0, 52.0)
				rgba = [80 0 10 255]
			}
			getscreenelementdims \{id = $gs_guitar_finish_id_p1}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_finish_id_p1
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_id_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 52.0)
			endif
			getarraysize <gs_available_finishes>
			<i> = 0
			begin
			get_instrument_brand_and_finish id = (<gs_available_finishes> [<i>])
			createscreenelement {
				type = textelement
				parent = <vparent>
				font = text_a4
				scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [center top]
				text = <instrument_finish>
				event_handlers = [
					{focus retail_menu_focus}
					{focus select_guitar_finish_highlight params = {player = <player>
							id = (<gs_available_finishes> [<i>])
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose select_guitar_finish_choose params = {id = (<gs_available_finishes> [<i>])
							player = <player>
							gs_available_instruments = <gs_available_instruments>
							instrument_type = <instrument_type>
							finish_index = <i>
						}
					}
				]
				exclusive_device = <exclusive_dev>
				hide
			}
			getscreenelementdims id = <id>
			if (<width> > 180)
				fit_text_in_rectangle id = <id> dims = (0.7 * ((160.0, 0.0) + (<height> * (0.0, 1.0)))) pos = (<p1_menu_pos> + <menu_offset>)
			endif
			<i> = (<i> + 1)
			repeat <array_size>
			if (<array_size> = 1)
				change \{gs_made_first_selection_bool_p1 = 1}
				select_guitar_finish_highlight {
					player = <player>
					id = (<gs_available_finishes> [0])
				}
				select_guitar_finish_choose {
					id = (<gs_available_finishes> [0])
					player = <player>
					gs_available_instruments = <gs_available_instruments>
					instrument_type = <instrument_type>
					needs_net_message = 0
				}
			endif
		else
			if ($is_network_game = 0)
				launchevent \{type = unfocus
					target = scrolling_select_guitar_p2}
				launchevent type = focus target = <vparent>
			endif
			setscreenelementprops \{id = gs_select_guitar_text_p2
				text = "SELECT FINISH"}
			get_instrument_brand_and_finish id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p2])
			select_guitar_build_finish_array {
				brand = <instrument_brand>
				gs_available_instruments = <gs_available_instruments>
			}
			get_instrument_brand_and_finish id = (<gs_available_finishes> [0])
			setscreenelementprops \{id = gs_brand_background_p2
				pos = (0.0, 58.0)}
			setscreenelementprops \{id = gs_finish_background_p2
				pos = (0.0, 0.0)}
			setscreenelementprops \{id = gs_guitar_logo_id_p2
				hide}
			setscreenelementprops {
				id = $gs_guitar_brand_id_p2
				text = <instrument_brand>
				scale = (0.75, 0.5)
				pos = (0.0, -6.0)
				rgba = [240 210 250 255]
			}
			getscreenelementdims \{id = $gs_guitar_brand_id_p2}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_brand_id_p2
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_id_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			setscreenelementprops {
				id = $gs_guitar_finish_id_p2
				text = <instrument_finish>
				scale = (1.0, 0.8)
				pos = (0.0, 52.0)
				rgba = [70 0 50 255]
			}
			getscreenelementdims \{id = $gs_guitar_finish_id_p2}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_finish_id_p2
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_id_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 52.0)
			endif
			getarraysize <gs_available_finishes>
			get_instrument_brand_and_finish id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p2])
			select_guitar_build_finish_array {
				brand = <instrument_brand>
				gs_available_instruments = <gs_available_instruments>
			}
			getarraysize <gs_available_finishes>
			<i> = 0
			begin
			get_instrument_brand_and_finish id = (<gs_available_finishes> [<i>])
			createscreenelement {
				type = textelement
				parent = <vparent>
				font = text_a4
				scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [center top]
				text = <instrument_finish>
				event_handlers = [
					{focus retail_menu_focus}
					{focus select_guitar_finish_highlight params = {player = <player>
							id = (<gs_available_finishes> [<i>])
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose select_guitar_finish_choose params = {id = (<gs_available_finishes> [<i>])
							player = <player>
							gs_available_instruments = <gs_available_instruments>
							instrument_type = <instrument_type>
						}
					}
				]
				exclusive_device = <exclusive_dev>
				hide
			}
			getscreenelementdims id = <id>
			if (<width> > 180)
				fit_text_in_rectangle id = <id> dims = (0.7 * ((160.0, 0.0) + (<height> * (0.0, 1.0)))) pos = (<p1_menu_pos> + <menu_offset>)
			endif
			<i> = (<i> + 1)
			repeat <array_size>
			if (<array_size> = 1)
				change \{gs_made_first_selection_bool_p2 = 1}
				select_guitar_finish_highlight {
					player = <player>
					id = (<gs_available_finishes> [0])
				}
				select_guitar_finish_choose {
					id = (<gs_available_finishes> [0])
					player = <player>
					gs_available_instruments = <gs_available_instruments>
					instrument_type = <instrument_type>
					needs_net_message = 0
				}
			endif
		endif
	endif
endscript

script select_guitar_go_back_from_finish_menu \{player = 1
		instrument_type = guitar}
	soundevent \{event = generic_menu_back_sfx}
	if ($current_num_players = 1)
		launchevent \{type = focus
			target = scrolling_select_guitar_p1}
		launchevent \{type = unfocus
			target = scrolling_guitar_finish_menu_p1}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
		change \{gs_made_first_selection_bool_p1 = 0}
		destroy_menu \{menu_id = select_finish_container}
		instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p1)])
		change \{guitar_select_highlighted_guitar_p1 = $guitar_select_old_guitar_p1}
		change \{gs_selected_brand_p1 = $gs_old_selected_brand_p1}
		if NOT (<instrument_id> = ($player1_status.instrument_id))
			change structurename = player1_status instrument_id = <instrument_id>
			formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
			change globalname = <change_flag> newvalue = 1
		endif
		setscreenelementprops \{id = gs_brand_background
			texture = char_select_frame_bg
			dims = (266.0, 128.0)
			rgba = [
				250
				250
				200
				255
			]}
		setscreenelementprops \{id = $gs_guitar_brand_id_p1
			rgba = [
				160
				80
				30
				255
			]}
		get_instrument_brand_and_finish id = <instrument_id>
		setscreenelementprops id = $gs_guitar_brand_id_p1 text = <instrument_brand>
		setscreenelementprops \{id = $gs_guitar_brand_id_p1
			scale = 1}
		getscreenelementdims \{id = $gs_guitar_brand_id_p1}
		if (<width> > 260)
			setscreenelementprops \{id = $gs_guitar_brand_id_p1
				scale = 1}
			fit_text_in_rectangle id = $gs_guitar_brand_id_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
		setscreenelementprops id = $gs_guitar_finish_id_p1 text = <instrument_name2>
		get_instrument_logo id = <instrument_id>
		setscreenelementprops id = gs_guitar_logo_id_p1 text = <instrument_logo>
		select_guitar_change_blurb_text inst_id = <instrument_id>
	else
		if (<instrument_type> = guitar)
			change \{gs_select_text = "SELECT GUITAR"}
		elseif (<instrument_type> = bass)
			change \{gs_select_text = "SELECT BASS"}
		endif
		if (<player> = 1)
			setscreenelementprops \{id = gs_select_guitar_text_p1
				text = $gs_select_text}
			launchevent \{type = focus
				target = scrolling_select_guitar_p1}
			launchevent \{type = unfocus
				target = scrolling_guitar_finish_menu_p1}
			destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
			change \{gs_made_first_selection_bool_p1 = 0}
			if ($is_network_game = 1)
				network_player_lobby_message {
					type = skin_select
					action = deselect
					checksum = <instrument_type>
				}
			endif
			instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p1)])
			change \{guitar_select_highlighted_guitar_p1 = $guitar_select_old_guitar_p1}
			change \{gs_selected_brand_p1 = $gs_old_selected_brand_p1}
			if NOT (<instrument_id> = ($player1_status.instrument_id))
				change structurename = player1_status instrument_id = <instrument_id>
				formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
				change globalname = <change_flag> newvalue = 1
			endif
			get_instrument_brand_and_finish id = <instrument_id>
			setscreenelementprops \{id = gs_brand_background_p1
				pos = (0.0, 30.0)}
			setscreenelementprops \{id = gs_finish_background_p1
				pos = (0.0, 88.0)}
			setscreenelementprops {
				id = $gs_guitar_brand_id_p1
				text = <instrument_brand>
				scale = 1
				pos = (0.0, 10.0)
				rgba = [80 0 10 255]
			}
			getscreenelementdims \{id = $gs_guitar_brand_id_p1}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_brand_id_p1
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_id_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			setscreenelementprops {
				id = $gs_guitar_finish_id_p1
				text = <instrument_name2>
				scale = (0.75, 0.5)
				pos = (0.0, 83.0)
				rgba = [250 250 200 255]
			}
			getscreenelementdims \{id = $gs_guitar_finish_id_p1}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_finish_id_p1
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_id_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 83.0)
			endif
			get_instrument_logo id = <instrument_id>
			setscreenelementprops id = gs_guitar_logo_id_p1 text = <instrument_logo>
			setscreenelementprops \{id = gs_guitar_logo_id_p1
				unhide}
		else
			setscreenelementprops \{id = gs_select_guitar_text_p2
				text = $gs_select_text}
			launchevent \{type = focus
				target = scrolling_select_guitar_p2}
			launchevent \{type = unfocus
				target = scrolling_guitar_finish_menu_p2}
			destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
			change \{gs_made_first_selection_bool_p2 = 0}
			instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p2)])
			change \{guitar_select_highlighted_guitar_p2 = $guitar_select_old_guitar_p2}
			change \{gs_selected_brand_p2 = $gs_old_selected_brand_p2}
			if NOT (<instrument_id> = ($player2_status.instrument_id))
				change structurename = player2_status instrument_id = <instrument_id>
				formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
				change globalname = <change_flag> newvalue = 1
			endif
			get_instrument_brand_and_finish id = <instrument_id>
			setscreenelementprops \{id = gs_brand_background_p2
				pos = (0.0, 30.0)}
			setscreenelementprops \{id = gs_finish_background_p2
				pos = (0.0, 88.0)}
			setscreenelementprops {
				id = $gs_guitar_brand_id_p2
				text = <instrument_brand>
				scale = 1
				pos = (0.0, 10.0)
				rgba = [70 0 50 255]
			}
			getscreenelementdims \{id = $gs_guitar_brand_id_p2}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_brand_id_p2
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_brand_id_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			setscreenelementprops {
				id = $gs_guitar_finish_id_p2
				text = <instrument_name2>
				scale = (0.75, 0.5)
				pos = (0.0, 83.0)
				rgba = [240 251 250 255]
			}
			getscreenelementdims \{id = $gs_guitar_finish_id_p2}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_finish_id_p2
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_id_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 83.0)
			endif
			get_instrument_logo id = <instrument_id>
			setscreenelementprops id = gs_guitar_logo_id_p2 text = <instrument_logo>
			setscreenelementprops \{id = gs_guitar_logo_id_p2
				unhide}
		endif
		if (<player> = 1)
			destroy_menu \{menu_id = select_finish_container}
		else
			destroy_menu \{menu_id = select_finish_container_p2}
		endif
	endif
endscript

script select_guitar_finish_highlight \{player = 1
		index = 0}
	formattext checksumname = player_status 'player%i_status' i = <player>
	if NOT (<id> = $<player_status>.instrument_id)
		change structurename = <player_status> instrument_id = <id>
		formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
		change globalname = <change_flag> newvalue = 1
	endif
	get_instrument_brand_and_finish id = <id>
	if ($current_num_players = 1)
		setscreenelementprops id = $gs_guitar_brand_id_p1 text = <instrument_brand>
		setscreenelementprops id = $gs_guitar_finish_id_p1 text = <instrument_name2>
		get_instrument_logo id = <id>
		setscreenelementprops id = gs_guitar_logo_id_p1 text = <instrument_logo>
		<offset> = (<index> * (0.0, 33.5))
		<l_pos> = ((-64.0, 11.0) + <offset>)
		<r_pos> = ((238.0, 11.0) + <offset>)
		<hl_pos> = ((-47.0, 8.0) + <offset>)
		setscreenelementprops id = gs_bookend1_id pos = <l_pos>
		setscreenelementprops id = gs_bookend2_id pos = <r_pos>
		setscreenelementprops id = gs_whitetexhighlight_id pos = <hl_pos>
	else
		if (<player> = 1)
			setscreenelementprops {
				id = $gs_guitar_finish_id_p1
				text = <instrument_finish>
			}
			getscreenelementdims \{id = $gs_guitar_finish_id_p1}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_finish_id_p1
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_id_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 52.0)
			endif
		else
			setscreenelementprops {
				id = $gs_guitar_finish_id_p2
				text = <instrument_finish>
			}
			getscreenelementdims \{id = $gs_guitar_finish_id_p2}
			if (<width> > 260)
				setscreenelementprops \{id = $gs_guitar_finish_id_p2
					scale = 1}
				fit_text_in_rectangle id = $gs_guitar_finish_id_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 52.0)
			endif
		endif
	endif
endscript

script select_guitar_finish_choose \{player = 1
		needs_net_message = 1}
	if (<player> = 1)
		get_instrument_name_and_index id = <id>
		select_guitar_get_available_index_from_total_index {
			gs_available_instruments = <gs_available_instruments>
			index = <instrument_index>
		}
		change guitar_select_highlighted_guitar_p1 = <index>
		if gotparam \{finish_index}
			change gh_net_finish_id = <finish_index>
		endif
		select_guitar_choose {
			player = <player>
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
		change guitar_select_highlighted_guitar_p2 = <index>
		select_guitar_choose {
			player = <player>
			gs_available_instruments = <gs_available_instruments>
			instrument_type = <instrument_type>
		}
	endif
	if (<player> = 1)
		destroy_menu \{menu_id = select_finish_container}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
	else
		destroy_menu \{menu_id = select_finish_container_p2}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
	endif
endscript

script build_gs_available_guitar_array 
	if (<instrument_type> = guitar)
		formattext \{checksumname = guitar_select_available_instruments
			'guitar_select_available_guitar_array'}
		change \{globalname = guitar_select_guitar_indeces
			newvalue = [
			]}
		change globalname = <guitar_select_available_instruments> newvalue = ($free_guitars)
		<secret_instrument_array> = ($secret_guitars)
		<download_instrument_array> = download_guitars
		num_downloads_on_other_client = ($download_guitars_on_other_client)
		<bonus_guitar_array> = ($bonus_guitars)
		<bonus_guitar_finishes_array> = ($bonus_guitar_finishes)
	else
		formattext \{checksumname = guitar_select_available_instruments
			'guitar_select_available_bass_array'}
		change \{globalname = guitar_select_bass_indeces
			newvalue = [
			]}
		change globalname = <guitar_select_available_instruments> newvalue = ($free_basses)
		<secret_instrument_array> = ($secret_basses)
		<download_instrument_array> = download_basses
		num_downloads_on_other_client = ($download_basses_on_other_client)
		<bonus_guitar_array> = ($bonus_basses)
		<bonus_guitar_finishes_array> = ($bonus_bass_finishes)
	endif
	num_downloads = 0
	if globalexists name = <download_instrument_array>
		getarraysize ($<download_instrument_array>)
		<download_array_size> = <array_size>
		<i> = 0
		begin
		find_instrument_index desc_id = ($<download_instrument_array> [<i>])
		if is_musician_instrument_downloaded index = <index>
			addarrayelement array = $<guitar_select_available_instruments> element = ($<download_instrument_array> [<i>])
			change globalname = <guitar_select_available_instruments> newvalue = (<array>)
			num_downloads = (<num_downloads> + 1)
		endif
		<i> = (<i> + 1)
		repeat <download_array_size>
	endif
	if ($is_network_game = 1 && <player> = 2 && (($download_guitars_on_other_client - <num_downloads>) > 0))
		begin
		addarrayelement array = $<guitar_select_available_instruments> element = (<guitar_select_available_instruments> [0])
		change globalname = <guitar_select_available_instruments> newvalue = (<array>)
		repeat ($download_guitars_on_other_client - <num_downloads>)
	endif
	getarraysize (<secret_instrument_array>)
	<secret_array_size> = <array_size>
	<i> = 0
	begin
	getglobaltags (<secret_instrument_array> [<i>].id) param = unlocked
	if (<unlocked>)
		addarrayelement array = $<guitar_select_available_instruments> element = (<secret_instrument_array> [<i>].id)
		change globalname = <guitar_select_available_instruments> newvalue = (<array>)
	endif
	<i> = (<i> + 1)
	repeat <secret_array_size>
	getarraysize (<bonus_guitar_array>)
	<bonus_guitar_array_size> = <array_size>
	<j> = 0
	begin
	getglobaltags (<bonus_guitar_array> [<j>].id) param = unlocked
	if (<unlocked>)
		addarrayelement array = $<guitar_select_available_instruments> element = (<bonus_guitar_array> [<j>].id)
		change globalname = <guitar_select_available_instruments> newvalue = (<array>)
	endif
	<j> = (<j> + 1)
	repeat <bonus_guitar_array_size>
	getarraysize (<bonus_guitar_finishes_array>)
	<bonus_guitar_finishes_array_size> = <array_size>
	<k> = 0
	begin
	getglobaltags (<bonus_guitar_finishes_array> [<k>].id) param = unlocked
	if (<unlocked>)
		addarrayelement array = $<guitar_select_available_instruments> element = (<bonus_guitar_finishes_array> [<k>].id)
		change globalname = <guitar_select_available_instruments> newvalue = (<array>)
	endif
	<k> = (<k> + 1)
	repeat <bonus_guitar_finishes_array_size>
	getarraysize <guitar_select_available_instruments> globalarray
	change guitar_select_total_num_guitars = <array_size>
	<i> = 0
	getarraysize <guitar_select_available_instruments> globalarray
	total_size = <array_size>
	begin
	<j> = 0
	get_musician_instrument_size
	begin
	get_musician_instrument_struct index = <j>
	if (($<guitar_select_available_instruments> [<i>]) = (<info_struct>.desc_id))
		if (<instrument_type> = guitar)
			addarrayelement array = $guitar_select_guitar_indeces element = <j>
			change globalname = guitar_select_guitar_indeces newvalue = (<array>)
		else
			addarrayelement array = $guitar_select_bass_indeces element = <j>
			change globalname = guitar_select_bass_indeces newvalue = (<array>)
		endif
		break
	endif
	<j> = (<j> + 1)
	repeat <array_size>
	<i> = (<i> + 1)
	repeat <total_size>
endscript
