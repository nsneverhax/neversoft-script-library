store_menu_font = fontgrid_title_gh3
soundcheck_in_store = 0
store_camera_props = {
	main_store_menu = {
		lockto = world
		pos = (27.390575, 0.374346, 10.101139)
		quat = (-0.0021890001, 0.997191, 0.032329)
		fov = 72.0
	}
	guitar_selection = {
		lockto = world
		pos = (28.865236, 1.268629, 3.7361782)
		quat = (-0.00024999998, 0.99804497, 0.062374)
		fov = 72.0
	}
	song_selection = {
		lockto = world
		pos = (27.147392, 0.59662694, 8.347746)
		quat = (-0.000703, 0.87414604, 0.0012660001)
		fov = 72.0
	}
	outfits_selection = {
		lockto = world
		pos = (29.334492, 0.15719901, 7.960009)
		quat = (-0.00127, -0.864339, -0.0021790003)
		fov = 72.0
	}
}
current_store_camera_prop = none
target_store_camera_prop = none
store_camera_changing = 0
store_view_cam_created = 0

script store_camera_script 
	change \{current_store_camera_prop = main_store_menu}
	ccam_domorph {
		($store_camera_props.main_store_menu)
	}
	begin
	if NOT ($current_store_camera_prop = $target_store_camera_prop)
		change \{store_camera_changing = 1}
		ccam_domorph {
			($store_camera_props.($target_store_camera_prop))
			time = 0.5
			motion = smooth
		}
		ccam_waitmorph
		change current_store_camera_prop = ($target_store_camera_prop)
		change \{store_camera_changing = 0}
	endif
	wait \{1
		gameframe}
	repeat
endscript

script store_camera_wait 
	wait \{5
		gameframes}
	begin
	if ($store_camera_changing = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script create_store_window_frame pos = (0.0, 0.0) hilite_pos = (0.0, 0.0) dims = (128.0, 128.0) hilite_dims = (128.0, 10.0) hilite_off = (10.0, 0.0) frame_rgba = [170 90 35 255] z = 10
	createscreenelement {
		type = containerelement
		parent = root_window
		id = store_frame_container
	}
	<dims> = (<dims> - (0.0, 128.0))
	if ((<dims>.(0.0, 1.0)) >= 360)
		frame_body_tex = window_frame_body_tall
		frane_body_fill_tex = window_fill_body_large
	else
		frame_body_tex = window_frame_body_short
		frane_body_fill_tex = window_fill_body_short
	endif
	createscreenelement {
		type = spriteelement
		parent = store_frame_container
		pos = <pos>
		just = [center center]
		texture = <frame_body_tex>
		dims = <dims>
		rgba = <frame_rgba>
		z_priority = <z>
	}
	createscreenelement {
		type = spriteelement
		parent = store_frame_container
		pos = <pos>
		just = [center center]
		texture = <frane_body_fill_tex>
		dims = <dims>
		rgba = [0 0 0 200]
		z_priority = (<z> - 1)
	}
	header_pos = (<pos> - (<dims>.(0.0, 1.0)) * (0.0, 0.5) - (0.0, 32.0))
	header_dims = ((<dims>.(1.0, 0.0) * (1.0, 0.0)) + (0.0, 64.0))
	createscreenelement {
		type = spriteelement
		parent = store_frame_container
		pos = <header_pos>
		dims = <header_dims>
		just = [center bottom]
		texture = window_header_01
		rgba = <frame_rgba>
		z_priority = <z>
	}
	<header_pos> = (<pos> - (<dims>.(0.0, 1.0)) * (0.0, 0.5))
	createscreenelement {
		type = spriteelement
		parent = store_frame_container
		pos = <header_pos>
		dims = <header_dims>
		just = [center bottom]
		texture = window_frame_cap
		rgba = <frame_rgba>
		z_priority = <z>
	}
	createscreenelement {
		type = spriteelement
		parent = store_frame_container
		pos = <header_pos>
		dims = <header_dims>
		just = [center bottom]
		texture = window_fill_cap
		rgba = [0 0 0 200]
		z_priority = (<z> - 1)
	}
	footer_pos = (<pos> + (<dims>.(0.0, 1.0)) * (0.0, 0.5) - (4.0, 36.0))
	footer_dims = ((<dims>.(1.0, 0.0) * (0.90999997, 0.0)) + (0.0, 128.0))
	createscreenelement {
		type = spriteelement
		parent = store_frame_container
		pos = <footer_pos>
		dims = <footer_dims>
		just = [center center]
		texture = store_frame_bottom_bg
		z_priority = (<z> + 1)
		rgba = <frame_rgba>
		flip_h
		flip_v
	}
	if NOT gotparam no_hilite
		createscreenelement {
			type = containerelement
			parent = store_frame_container
			id = store_hilite_container
			pos = <hilite_pos>
		}
		createscreenelement {
			type = spriteelement
			parent = store_hilite_container
			texture = white
			dims = <hilite_dims>
			z_priority = (<z> + 3)
			rgba = [255 255 205 255]
			just = [center center]
		}
		createscreenelement {
			type = spriteelement
			parent = store_hilite_container
			texture = character_hub_hilite_bookend
			pos = (<dims>.(-1.0, 0.0) * (0.5, 0.0) + <hilite_off>)
			z_priority = (<z> + 2)
			rgba = [255 255 205 255]
			just = [center center]
		}
		<hilite_off> = (<hilite_off> * 0.5)
		createscreenelement {
			type = spriteelement
			parent = store_hilite_container
			texture = character_hub_hilite_bookend
			pos = (<dims>.(1.0, 0.0) * (0.5, 0.0) - <hilite_off>)
			z_priority = (<z> + 2)
			rgba = [255 255 205 255]
			just = [center center]
		}
	else
		box_pos = (<pos> - (<dims>.(0.0, 1.0)) * (0.0, 0.5) + (-5.0, 16.0))
		box_dims = ((<dims>.(1.0, 0.0) * (1.0, 0.0)) + (0.0, 128.0))
		createscreenelement {
			type = spriteelement
			parent = store_frame_container
			texture = char_select_frame_bg
			pos = <box_pos>
			dims = <box_dims>
			z_priority = (<z> + 3)
			rgba = [255 255 205 255]
			just = [center center]
		}
	endif
endscript

script destroy_store_window_frame 
	destroy_menu \{menu_id = store_frame_container}
endscript

script create_store_menu 
	change soundcheck_in_store = 1
	change generic_select_monitor_p1_changed = 0
	if ($store_view_cam_created = 0)
		unload_band
		destroy_bg_viewport
		setup_bg_viewport
		playigccam {
			name = store_view_cam
			viewport = bg_viewport
			controlscript = store_camera_script
			play_hold = 1
		}
		change store_view_cam_created = 1
	endif
	change target_store_camera_prop = main_store_menu
	setup_store_hub cash_pos = (-2000.0, -2000.0)
	store_camera_wait
	setscreenelementprops id = store_cash_text pos = (900.0, 505.0)
	hilite_pos = [
		(897.0, 155.0)
		(897.0, 197.0)
		(897.0, 241.0)
		(897.0, 284.0)
		(897.0, 326.0)
		(897.0, 370.0)
		(897.0, 413.0)
		(897.0, 456.0)
	]
	create_store_window_frame pos = (900.0, 360.0) hilite_pos = (<hilite_pos> [0]) dims = (300.0, 512.0) hilite_dims = (270.0, 40.0)
	back_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back menu_store_go_back}
	]
	new_menu scrollid = ms_scroll vmenuid = ms_vmenu menu_pos = (775.0, 103.0) event_handlers = <back_handlers> z = 50 spacing = -20
	change menu_focus_color = [128 0 0 255]
	change menu_unfocus_color = [220 177 122 255]
	text_params = {
		parent = ms_vmenu
		type = textelement
		font = ($store_menu_font)
		rgba = ($menu_unfocus_color)
		no_shadow
	}
	createscreenelement {
		<text_params>
		text = "GUITARS"
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [0])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_guitars}}
			{pad_l3 store_debug_givebandcash}
			{pad_left store_debug_givebandcash}
		]
	}
	createscreenelement {
		<text_params>
		text = "FINISHES"
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [1])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_finishes}}
			{pad_l3 store_debug_givebandcash}
		]
	}
	createscreenelement {
		<text_params>
		text = "SONGS"
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [2])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_songs}}
			{pad_l3 store_debug_givebandcash}
		]
	}
	createscreenelement {
		<text_params>
		text = "CHARACTERS"
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [3])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_characters}}
			{pad_l3 store_debug_givebandcash}
		]
	}
	createscreenelement {
		<text_params>
		text = "OUTFITS"
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [4])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_outfits}}
			{pad_l3 store_debug_givebandcash}
		]
	}
	createscreenelement {
		<text_params>
		text = "COLORS"
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [5])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_styles}}
			{pad_l3 store_debug_givebandcash}
		]
	}
	createscreenelement {
		<text_params>
		text = "VIDEOS"
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [6])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_videos}}
			{pad_l3 store_debug_givebandcash}
		]
	}
	createscreenelement {
		<text_params>
		text = "DOWNLOADS"
		event_handlers = [
			{focus menu_store_focus params = {hilite_pos = (<hilite_pos> [7])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_downloads}}
			{pad_l3 store_debug_givebandcash}
			{pad_l3 store_debug_givebandcash}
		]
	}
	clean_up_user_control_helpers
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "BACK" button = red z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
endscript

script menu_store_focus 
	retail_menu_focus
	if screenelementexists \{id = store_hilite_container}
		store_hilite_container :setprops pos = <hilite_pos>
	endif
endscript

script menu_store_go_back 
	clean_up_user_control_helpers
	change \{soundcheck_in_store = 0}
	menu_flow_go_back
endscript

script destroy_store_menu 
	destroy_store_window_frame
	destroy_menu \{menu_id = ms_scroll}
	shut_down_store_hub
endscript

script setup_store_hub cash_pos = (0.0, 0.0)
	change game_mode = p1_career
	getpakmancurrentname map = zones
	if gotparam pakname
		if NOT (<pakname> = "z_soundcheck")
			resetwaypoints
			setpakmancurrentblock map = zones pak = z_soundcheck block_scripts = 1
		endif
	else
		resetwaypoints
		setpakmancurrentblock map = zones pak = z_soundcheck block_scripts = 1
	endif
	disable_pause
	createscreenelement {
		type = containerelement
		parent = root_window
		pos = (0.0, 0.0)
		just = [left top]
		id = store_container
	}
	createscreenelement {
		type = textelement
		pos = <cash_pos>
		parent = store_container
		font = text_a4
		text = ""
		id = store_cash_text
		rgba = [255 255 205 250]
		z_priority = 50
		just = [center center]
	}
	store_update_band_cash
	store_hide_already_owned
endscript

script shut_down_store_hub 
	destroy_band \{unload_paks}
	destroy_menu \{menu_id = store_container}
endscript

script store_update_band_cash 
	get_current_band_info
	getglobaltags <band_info>
	formattext textname = user_cash_amount "$%d" d = (<cash>) usecommas
	setscreenelementprops {
		id = store_cash_text
		text = (<user_cash_amount>)
	}
endscript

script set_store_purchase_price \{price = 0}
	if screenelementexists \{id = store_price_tag_text}
		formattext textname = price_text "$%d" d = (<price>)
		store_price_tag_text :setprops text = <price_text>
		store_price_tag_text :settags tag_price = <price>
	endif
endscript

script create_store_songs_menu 
	change target_store_camera_prop = song_selection
	setup_store_hub cash_pos = (-2000.0, -2000.0)
	store_camera_wait
	setscreenelementprops id = store_cash_text pos = (900.0, 550.0)
	create_store_window_frame pos = (900.0, 360.0) dims = (300.0, 600.0) no_hilite
	createscreenelement {
		type = containerelement
		parent = root_window
		id = select_guitar_container
		pos = (893.0, -100.0)
	}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = store_songs_container
		pos = (900.0, 210.0)
	}
	createscreenelement {
		type = windowelement
		parent = root_window
		id = store_info_scroll_window
		pos = ($store_window_pos + (0.0, 60.0))
		dims = ($store_window_dims - (0.0, 70.0))
	}
	new_menu scrollid = ss_scroll vmenuid = ss_vmenu
	text_params = {parent = ss_vmenu type = textelement font = ($store_menu_font) rgba = [170 90 35 255] z_priority = 50 no_shadow}
	createscreenelement {
		<text_params>
		text = ""
		event_handlers = [
			{pad_left store_songs_right}
			{pad_right store_songs_left}
			{pad_down store_songs_right}
			{pad_up store_songs_left}
			{pad_choose store_songs_buy}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
		id = store_songs_menu_holder
	}
	createscreenelement {
		type = textelement
		parent = store_songs_container
		just = [center center]
		font = ($store_menu_font)
		text = ""
		scale = 1.0
		id = store_song_artist
		rgba = [170 90 35 255]
		z_priority = (<text_params>.z_priority)
		pos = (-5.0, -62.0)
	}
	createscreenelement {
		type = textblockelement
		parent = store_songs_container
		just = [center center]
		font = text_a6
		text = ""
		scale = 0.6
		dims = (380.0, 180.0)
		pos = (0.0, 29.0)
		id = store_song_title
		rgba = [255 255 205 255]
		z_priority = (<text_params>.z_priority)
	}
	createscreenelement {
		type = spriteelement
		parent = store_songs_container
		just = [center center]
		texture = store_song_default
		pos = (-512.0, 128.0)
		id = store_songs_album_cover
		z_priority = 1
	}
	createscreenelement {
		type = spriteelement
		parent = <id>
		texture = store_song_45
		pos = (256.0, 128.0)
		id = store_songs_album_45
		z_priority = 0
	}
	store_show_price_tag parent = store_songs_album_cover pos = (260.0, -80.0) rot = -10
	launchevent type = unfocus target = ss_vmenu
	launchevent type = focus target = store_songs_menu_holder
	store_show_already_owned
	set_store_song_title index = 0
endscript

script destroy_store_songs_menu 
	destroy_store_price_tag
	killspawnedscript \{name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = store_songs_container}
	destroy_menu \{menu_id = ss_scroll}
	destroy_store_window_frame
	shut_down_store_hub
endscript

script store_scroll_info scroll_time = 20 info_block_text = "NO TEXT AVAILABLE."
	destroy_menu menu_id = store_info_block_text_id
	createscreenelement {
		type = textblockelement
		id = store_info_block_text_id
		parent = <parent>
		just = [left top]
		internal_just = [left top]
		pos = (0.0, 0.0)
		scale = (0.58, 0.6)
		text = <info_block_text>
		font = text_a5
		rgba = [255 165 100 255]
		z_priority = <z>
		dims = <dims>
		line_spacing = 1.25
	}
	<this_id> = <id>
	getscreenelementdims id = <id>
	end_pos = (<height> * (0.0, -1.5))
	begin
	wait 5 seconds
	doscreenelementmorph id = <this_id> pos = <end_pos> time = <scroll_time>
	wait (<scroll_time> * 0.8) seconds
	setscreenelementprops id = <this_id> pos = (0.0, 0.0)
	repeat
endscript

script find_bonus_info 
	array = bonus_songs_info
	if gotparam guitar
		scriptassert "Shouldn't be calling this function (find_bonus_info) for guitars!"
	elseif gotparam character
		array = bonus_characters_info
	endif
	getarraysize ($<array>)
	i = 0
	begin
	if (<item_checksum> = ((($<array>) [<i>]).item))
		return info_index = <i>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	printstruct <...>
	scriptassert "Didn't find the item in find_bonus_info!"
endscript

script menu_store_find_guitar_index_for_blurb 
	<i> = 0
	getarraysize ($musician_instrument)
	begin
	if (<id> = (($musician_instrument [<i>]).desc_id))
		return guitar_index = <i>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script set_store_song_title index = 0
	store_hide_already_owned
	get_progression_globals game_mode = ($game_mode) bonus
	store_song_artist :settags song_index = <index>
	song_checksum = ($<tier_global>.tier1.songs [<index>])
	find_bonus_info item_checksum = <song_checksum> song
	select_guitar_change_blurb_text text = ($bonus_songs_info [<info_index>].text) x_dims = 430 pos = (-115.0, 375.0) z = 50
	store_songs_album_cover :setprops texture = ($bonus_songs_info [<info_index>].album_cover)
	get_song_title song = (<song_checksum>)
	setscreenelementprops {
		id = store_song_title
		text = (<song_title>)
	}
	get_song_artist song = (<song_checksum>) with_year = 0
	setscreenelementprops {
		id = store_song_artist
		text = (<song_artist>)
	}
	store_song_artist :setprops scale = (1.0, 1.0) relative_scale
	getscreenelementdims id = store_song_artist
	if (<width> >= 280.0)
		new_scale = ((280.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		store_song_artist :setprops scale = <new_scale> relative_scale
	endif
	song_price = ($store_song_data.<song_checksum>.price)
	set_store_purchase_price price = (<song_price>)
	formattext checksumname = bonus_song_checksum '%p_song%i_tier%s' p = 'bonus' i = (<index> + 1) s = 1
	getglobaltags <bonus_song_checksum>
	if (<unlocked> = 1)
		store_show_already_owned
	endif
endscript

script store_songs_left 
	generic_menu_up_or_down_sound
	store_song_artist :gettags
	<song_index> = (<song_index> - 1)
	get_progression_globals game_mode = ($game_mode) bonus
	getarraysize ($<tier_global>.tier1.songs)
	if (<song_index> < 0)
		<song_index> = (<song_index> + <array_size>)
	endif
	set_store_song_title index = (<song_index>)
endscript

script store_songs_right 
	generic_menu_up_or_down_sound
	store_song_artist :gettags
	<song_index> = (<song_index> + 1)
	get_progression_globals game_mode = ($game_mode) bonus
	getarraysize ($<tier_global>.tier1.songs)
	if (<song_index> = <array_size>)
		<song_index> = 0
	endif
	set_store_song_title index = (<song_index>)
endscript

script store_songs_buy 
	store_song_artist :gettags
	formattext checksumname = bonus_song_checksum '%p_song%i_tier%s' p = 'bonus' i = (<song_index> + 1) s = 1
	getglobaltags <bonus_song_checksum>
	if (<unlocked> = 0)
		get_current_band_info
		getglobaltags <band_info>
		get_progression_globals game_mode = ($game_mode) bonus
		song_checksum = ($<tier_global>.tier1.songs [<song_index>])
		song_price = ($store_song_data.<song_checksum>.price)
		if ((<cash> > <song_price>) || (<cash> = <song_price>))
			<cash> = (<cash> - <song_price>)
			setglobaltags <band_info> params = {cash = <cash>}
			setglobaltags <bonus_song_checksum> params = {unlocked = 1}
			store_update_band_cash
			set_store_song_title index = (<song_index>)
			change store_autosave_required = 1
		endif
	endif
endscript
store_character_original_id_p1 = none
store_character_original_outfit_id_p1 = 0
store_character_original_style_id_p1 = 0

script create_store_character_menu for_outfits = 0 for_styles = 0
	setscreenelementprops id = store_cash_text pos = (900.0, 550.0)
	create_store_window_frame pos = (900.0, 360.0) dims = (300.0, 600.0) no_hilite
	menu_pos = (845.0, 85.0)
	if (<for_outfits> = 1)
		<menu_pos> = (835.0, 85.0)
	endif
	if (<for_styles> = 1)
		<menu_pos> = (800.0, 85.0)
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = select_guitar_container
		pos = (893.0, -100.0)
	}
	createscreenelement {
		type = windowelement
		parent = root_window
		id = store_info_scroll_window
		pos = $store_window_pos
		dims = $store_window_dims
	}
	new_menu scrollid = cs_scroll vmenuid = cs_vmenu menu_pos = <menu_pos>
	text_params = {parent = cs_vmenu type = textelement font = ($store_menu_font) rgba = [170 90 35 255] z_priority = 50 no_shadow}
	createscreenelement {
		<text_params>
		text = <character_full_name>
		id = character_name_text
		event_handlers = [
			{pad_back store_go_back}
			{pad_right store_next_character params = {for_outfits = <for_outfits> for_styles = <for_styles>}}
			{pad_down store_next_character params = {for_outfits = <for_outfits> for_styles = <for_styles>}}
			{pad_left store_previous_character params = {for_outfits = <for_outfits> for_styles = <for_styles>}}
			{pad_up store_previous_character params = {for_outfits = <for_outfits> for_styles = <for_styles>}}
			{pad_choose store_buy_character}
		]
	}
	launchevent type = unfocus target = cs_vmenu
	launchevent type = focus target = character_name_text
	store_show_price_tag pos = (580.0, 400.0) rot = -10
endscript

script store_go_back 
	if NOT ($generic_select_monitor_p1_changed = 0)
		return
	endif
	if NOT ($store_guitar_loading = 0)
		return
	endif
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script create_store_characters_menu 
	kill name = z_soundcheck_g_rmm_kill_me
	change store_character_original_id_p1 = ($player1_status.character_id)
	change store_character_original_outfit_id_p1 = ($player1_status.outfit)
	change store_character_original_style_id_p1 = ($player1_status.style)
	change target_store_camera_prop = outfits_selection
	setup_store_hub cash_pos = (-2000.0, -2000.0)
	store_camera_wait
	create_store_character_menu
	character_name_text :settags current_character = -1
	character_name_text :settags last_character_change = 0
	character_name_text :settags goal_character = 0
	character_name_text :settags character_array = ($secret_characters)
	store_update_already_bought_for_character
	store_get_name_from_id character_id = ($secret_characters [0].id)
	set_store_purchase_price price = ($secret_characters [0].price)
	formattext checksumname = character_id '%s' s = <character_name>
	change structurename = player1_status character_id = <character_id>
	change structurename = guitarist_info stance = stance_frontend
	change structurename = guitarist_info next_stance = stance_frontend
	change structurename = guitarist_info current_anim = idle
	change structurename = guitarist_info cycle_anim = true
	change structurename = guitarist_info next_anim = none
	change structurename = bassist_info stance = stance_frontend
	change structurename = bassist_info next_stance = stance_frontend
	change structurename = bassist_info current_anim = idle
	change structurename = bassist_info cycle_anim = true
	change structurename = bassist_info next_anim = none
	store_show_character character_index = 0 character_id = ($secret_characters [0].id) for_outfits = 0
	spawnscriptnow generic_select_monitor params = {
		player = 1
		player_status = player1_status
		change_flag = generic_select_monitor_p1_changed
		name = guitarist
		node_flags = {node_name = z_soundcheck_trg_waypoint_character_start}
	}
endscript

script destroy_store_characters_menu 
	killspawnedscript \{name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_store_window_frame
	destroy_menu \{menu_id = cs_scroll}
	destroy_menu \{menu_id = character_name_text}
	shut_down_store_hub
	generic_select_monitor_finish
	change \{structurename = player1_status
		character_id = $store_character_original_id_p1}
	change \{structurename = player1_status
		outfit = $store_character_original_outfit_id_p1}
	change \{structurename = player1_status
		style = $store_character_original_style_id_p1}
	create \{name = z_soundcheck_g_rmm_kill_me}
endscript

script create_store_outfits_menu 
	kill name = z_soundcheck_g_rmm_kill_me
	change store_character_original_id_p1 = ($player1_status.character_id)
	change store_character_original_outfit_id_p1 = ($player1_status.outfit)
	change target_store_camera_prop = outfits_selection
	setup_store_hub cash_pos = (-2000.0, -2000.0)
	store_camera_wait
	store_build_character_outfit_name profile_name = ($bonus_outfits [0].profile_name) character_id = ($bonus_outfits [0].id)
	set_store_purchase_price price = ($bonus_outfits [0].price)
	store_get_outfit_name_from_id character_id = ($bonus_outfits [0].id)
	formattext checksumname = character_id '%s' s = <character_name>
	change structurename = player1_status character_id = <character_id>
	create_store_character_menu for_outfits = 1
	character_name_text :settags current_character = -1
	character_name_text :settags last_character_change = 0
	character_name_text :settags goal_character = 0
	character_name_text :settags character_array = ($bonus_outfits)
	store_update_already_bought_for_character
	store_show_character {
		character_index = 0
		character_id = ($bonus_outfits [0].id)
		for_outfits = 1
	}
	spawnscriptnow generic_select_monitor params = {
		player = 1
		player_status = player1_status
		change_flag = generic_select_monitor_p1_changed
		name = guitarist
		for_outfits = 1
		node_flags = {node_name = z_soundcheck_trg_waypoint_character_start}
	}
endscript

script destroy_store_outfits_menu 
	killspawnedscript \{name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = cs_scroll}
	destroy_store_window_frame
	destroy_menu \{menu_id = character_name_text}
	shut_down_store_hub
	generic_select_monitor_finish
	change \{structurename = player1_status
		character_id = $store_character_original_id_p1}
	change \{structurename = player1_status
		outfit = $store_character_original_outfit_id_p1}
	create \{name = z_soundcheck_g_rmm_kill_me}
endscript

script create_store_styles_menu 
	kill name = z_soundcheck_g_rmm_kill_me
	change store_character_original_id_p1 = ($player1_status.character_id)
	change store_character_original_outfit_id_p1 = ($player1_status.outfit)
	change store_character_original_style_id_p1 = ($player1_status.style)
	change target_store_camera_prop = outfits_selection
	setup_store_hub cash_pos = (-2000.0, -2000.0)
	store_camera_wait
	store_prune_styles_array
	store_build_character_outfit_name profile_name = (<styles_array> [0].profile_name) character_id = (<styles_array> [0].id)
	set_store_purchase_price price = (<styles_array> [0].price)
	store_get_outfit_name_from_id character_id = (<styles_array> [0].id) array = <styles_array>
	formattext checksumname = character_id '%s' s = <character_name>
	change structurename = player1_status character_id = <character_id>
	create_store_character_menu for_outfits = 1 for_styles = 1
	character_name_text :settags current_character = -1
	character_name_text :settags last_character_change = 0
	character_name_text :settags goal_character = 0
	character_name_text :settags character_array = <styles_array>
	store_update_already_bought_for_character
	store_show_character {
		character_index = 0
		character_id = ((<styles_array> [0]).id)
		for_outfits = 1
		for_styles = 1
	}
	spawnscriptnow generic_select_monitor params = {
		player = 1
		player_status = player1_status
		change_flag = generic_select_monitor_p1_changed
		name = guitarist
		for_outfits = 1
		node_flags = {node_name = z_soundcheck_trg_waypoint_character_start}
	}
endscript

script destroy_store_styles_menu 
	killspawnedscript \{name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = cs_scroll}
	destroy_store_window_frame
	destroy_menu \{menu_id = character_name_text}
	shut_down_store_hub
	generic_select_monitor_finish
	change \{structurename = player1_status
		character_id = $store_character_original_id_p1}
	change \{structurename = player1_status
		outfit = $store_character_original_outfit_id_p1}
	change \{structurename = player1_status
		style = $store_character_original_style_id_p1}
	create \{name = z_soundcheck_g_rmm_kill_me}
endscript

script store_get_name_from_id 
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	if (<character_id> = (<profile_struct>.musician_body.desc_id))
		return character_name = (<profile_struct>.name) character_full_name = (<profile_struct>.fullname)
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	printstruct <...>
	scriptassert \{"Entry not found!"}
endscript

script store_get_outfit_name_from_id \{array = $bonus_outfits}
	getarraysize (<array>)
	index = 0
	begin
	if (<character_id> = (<array> [<index>].id))
		return character_name = (<array> [<index>].profile_name)
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	printstruct <...>
	scriptassert \{"Entry not found!"}
endscript

script store_buy_character 
	character_name_text :gettags
	character_id = (<character_array> [<goal_character>].id)
	getglobaltags <character_id>
	if (<unlocked> = 0)
		price = (<character_array> [<goal_character>].price)
		get_current_band_info
		getglobaltags <band_info>
		if ((<cash> > <price>) || (<cash> = <price>))
			<cash> = (<cash> - <price>)
			setglobaltags <band_info> params = {cash = <cash>}
			setglobaltags <character_id> params = {unlocked = 1}
			getarraysize $musician_profiles
			<i> = 0
			begin
			if (($musician_profiles [<i>].musician_body.desc_id) = <character_id>)
				<guitar_id> = ($musician_profiles [<i>].musician_instrument.desc_id)
				setglobaltags <guitar_id> params = {unlocked = 1}
			endif
			<i> = (<i> + 1)
			repeat <array_size>
			store_update_band_cash
			store_update_already_bought_for_character
			change store_autosave_required = 1
		endif
	endif
endscript

script store_update_already_bought_for_character 
	character_name_text :gettags
	character_id = (<character_array> [<goal_character>].id)
	getglobaltags <character_id>
	if (<unlocked>)
		store_show_already_owned unlocked_for_purchase = <unlocked_for_purchase> for_character = 1
	else
		store_hide_already_owned \{for_character = 1}
	endif
endscript

script get_instrument_from_character 
	getarraysize ($musician_profiles)
	i = 0
	begin
	if (<name> = ($musician_profiles [<i>].name))
		return instrument_id = ($musician_profiles [<i>].musician_instrument.desc_id)
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	printstruct <...>
	scriptassert \{"Didn't find the character by id!"}
endscript

script store_show_character for_outfits = 0 for_styles = 0
	character_name_text :gettags
	getarraysize <character_array>
	if (<for_styles>)
		store_build_character_outfit_name profile_name = (<character_array> [<character_index>].profile_name) character_id = (<character_array> [<character_index>].id)
		setscreenelementprops id = character_name_text text = <fullname>
	else
		if (<for_outfits>)
			store_build_character_outfit_name profile_name = (<character_array> [<character_index>].profile_name) character_id = (<character_array> [<character_index>].id)
			setscreenelementprops id = character_name_text text = <character_outfit_name>
		else
			store_get_name_from_id character_id = <character_id>
			setscreenelementprops id = character_name_text text = <character_full_name>
			formattext checksumname = character_id '%s' s = <character_name>
			change structurename = player1_status character_id = <character_id>
			get_instrument_from_character name = <character_name>
			change structurename = player1_status instrument_id = <instrument_id>
		endif
	endif
	character_name_text :setprops scale = 1
	getscreenelementdims id = character_name_text
	if (<width> > 280)
		new_scale = ((280.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		character_name_text :setprops scale = <new_scale> relative_scale
	endif
	if (<for_styles>)
		store_get_outfit_name_from_id character_id = <character_id> array = $bonus_styles
		formattext checksumname = character_id '%s' s = <character_name>
		change structurename = player1_status character_id = <character_id>
		get_instrument_from_character name = <character_name>
		change structurename = player1_status instrument_id = <instrument_id>
		store_find_outfit_and_style_indices {
			profile_name = (<character_array> [<character_index>].profile_name)
			character_id = (<character_array> [<character_index>].id)
		}
		change structurename = player1_status outfit = (<outfit_index> + 1)
		change structurename = player1_status style = (<style_index> + 1)
	elseif (<for_outfits>)
		store_get_outfit_name_from_id character_id = <character_id> array = $bonus_outfits
		formattext checksumname = character_id '%s' s = <character_name>
		change structurename = player1_status character_id = <character_id>
		change structurename = player1_status outfit = <outfit_num>
		get_instrument_from_character name = <character_name>
		change structurename = player1_status instrument_id = <instrument_id>
	else
	endif
	set_store_purchase_price price = (<character_array> [<character_index>].price)
	if (<for_styles>)
		select_guitar_change_blurb_text text = <character_outfit_name> x_dims = 430 pos = (-115.0, 320.0) dims = (388.0, 300.0) z = 50
	else
		if (<for_outfits>)
			find_bonus_info item_checksum = (<character_array> [<character_index>].info_name) character
			select_guitar_change_blurb_text text = ($bonus_characters_info [<info_index>].text) x_dims = 430 pos = (-115.0, 320.0) dims = (388.0, 300.0) z = 50
		else
			store_find_character_blurb_by_id id = (<character_array> [<character_index>].id)
			select_guitar_change_blurb_text text = <blurb_text> x_dims = 430 pos = (-115.0, 320.0) dims = (388.0, 300.0) z = 50
		endif
	endif
	character_name_text :settags goal_character = <character_index>
	character_name_text :settags last_character_change = <starttime>
	store_update_already_bought_for_character
endscript

script store_find_character_blurb_by_id 
	getarraysize ($musician_profiles)
	i = 0
	begin
	if (($musician_profiles [<i>].musician_body.desc_id) = <id>)
		return blurb_text = ($musician_profiles [<i>].blurb)
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	printstruct <...>
	scriptassert \{"Couldn't find the character blurb by id!"}
endscript

script store_next_character for_outfits = 0 for_styles = 0
	character_name_text :gettags
	if ($generic_select_monitor_p1_changed = 1)
		return
	endif
	generic_menu_up_or_down_sound
	<goal_character> = (<goal_character> + 1)
	getarraysize <character_array>
	if (<goal_character> = <array_size>)
		<goal_character> = 0
	endif
	store_show_character {
		character_index = <goal_character>
		character_id = (<character_array> [<goal_character>].id)
		for_outfits = <for_outfits>
		for_styles = <for_styles>
	}
	change generic_select_monitor_p1_changed = 1
endscript

script store_previous_character for_outfits = 0 for_styles = 0
	character_name_text :gettags
	if ($generic_select_monitor_p1_changed = 1)
		return
	endif
	generic_menu_up_or_down_sound
	<goal_character> = (<goal_character> - 1)
	getarraysize <character_array>
	if (<goal_character> = -1)
		<goal_character> = (<array_size> - 1)
	endif
	store_show_character {
		character_index = <goal_character>
		character_id = (<character_array> [<goal_character>].id)
		for_outfits = <for_outfits>
		for_styles = <for_styles>
	}
	change generic_select_monitor_p1_changed = 1
endscript

script store_build_character_outfit_name 
	store_find_outfit_and_style_indices profile_name = <profile_name> character_id = <character_id>
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	if (<profile_struct>.name = <profile_name>)
		outfit_array = (<profile_struct>.outfits)
		break
	endif
	<index> = (<index> + 1)
	repeat (<array_size>)
	if NOT gotparam outfit_array
		printstruct <...>
		scriptassert "Couldn't find matching musician profile!"
	else
		if (<style_index> = 0)
			outfit_name = (<outfit_array> [<outfit_index>].name)
			formattext textname = character_outfit_name "%o" o = <outfit_name>
			return character_outfit_name = <character_outfit_name> outfit_num = (<outfit_index> + 1) profile_name = <profile_name> fullname = (<profile_struct>.fullname)
		else
			style_name = (<outfit_array> [<outfit_index>].styles [<style_index>])
			formattext textname = character_outfit_name "%o" o = <style_name>
			return character_outfit_name = <character_outfit_name> outfit_num = (<outfit_index> + 1) profile_name = <profile_name> fullname = (<profile_struct>.fullname)
		endif
	endif
endscript

script store_find_outfit_and_style_indices 
	outfit_index = 1
	begin
	style_index = 1
	begin
	formattext checksumname = test_outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' n = <profile_name> o = <outfit_index> s = <style_index>
	if (<test_outfit_style_cs> = <character_id>)
		return outfit_index = (<outfit_index> -1) style_index = (<style_index> -1)
	endif
	<style_index> = (<style_index> + 1)
	repeat 4
	<outfit_index> = (<outfit_index> + 1)
	repeat 2
	printstruct <...>
	scriptassert "Couldn't figure out the outfit and style indices!"
endscript

script store_prune_styles_array 
	styles_array = ($bonus_styles)
	getarraysize (<styles_array>)
	index = 0
	begin
	profile_name = (<styles_array> [<index>].profile_name)
	character_id = (<styles_array> [<index>].id)
	store_find_outfit_and_style_indices profile_name = <profile_name> character_id = <character_id>
	<outfit_index> = (<outfit_index> + 1)
	<style_index> = (<style_index> + 1)
	if NOT (<outfit_index> = 1)
		formattext checksumname = outfit_cs 'Guitarist_%n_Outfit%o_Style1' n = <profile_name> o = <outfit_index>
		getglobaltags <outfit_cs>
		if (<unlocked> = 0)
			removearrayelement array = (<styles_array>) index = <index>
			<styles_array> = (<array>)
			<index> = (<index> - 1)
		endif
	endif
	<index> = (<index> + 1)
	repeat (<array_size>)
	return styles_array = <styles_array>
endscript

script store_debug_givebandcash \{add_cash = 1000000}
	enable_cheat = 0
	if ($enable_button_cheats = 1)
		enable_cheat = 1
	endif
	if (<enable_cheat> = 1)
		add_cash = <cash>
		get_current_band_info
		getglobaltags <band_info>
		<cash> = (<cash> + <add_cash>)
		setglobaltags <band_info> params = {cash = <cash>}
	endif
	destroy_store_menu
	create_store_menu
endscript
store_guitar_loaded_pak_name = ""
store_window_pos = (780.0, 240.0)
store_window_dims = (300.0, 280.0)

script create_store_guitars_menu 
	change target_store_camera_prop = guitar_selection
	setup_store_hub cash_pos = (-2000.0, -2000.0)
	store_camera_wait
	setscreenelementprops id = store_cash_text pos = (900.0, 550.0)
	create_store_window_frame pos = (900.0, 360.0) dims = (300.0, 600.0) no_hilite
	createscreenelement {
		type = containerelement
		parent = root_window
		id = select_guitar_container
		pos = (893.0, -100.0)
	}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = store_guitar_container
		pos = (893.0, 200.0)
	}
	createscreenelement {
		type = windowelement
		parent = root_window
		id = store_info_scroll_window
		pos = $store_window_pos
		dims = $store_window_dims
	}
	new_menu scrollid = sg_scroll vmenuid = sg_vmenu menu_pos = (835.0, 85.0)
	text_params = {parent = sg_vmenu type = textelement font = ($store_menu_font) rgba = [170 90 35 255] z_priority = 50 no_shadow}
	createscreenelement {
		<text_params>
		text = ""
		id = store_guitar_name
		event_handlers = [
			{pad_down store_guitar_next_guitar}
			{pad_up store_guitar_previous_guitar}
			{pad_left store_guitar_previous_guitar}
			{pad_right store_guitar_next_guitar}
			{pad_choose store_guitar_buy_guitar}
			{pad_back store_go_back}
		]
	}
	createscreenelement {
		type = textelement
		parent = store_guitar_container
		just = [center center]
		font = text_a6
		text = ""
		scale = 0.7
		id = store_guitar_finish_name
		rgba = [255 255 205 255]
		z_priority = (<text_params>.z_priority)
	}
	launchevent type = unfocus target = sg_vmenu
	launchevent type = focus target = store_guitar_name
	guitar_array = ($bonus_guitars)
	store_add_secret_guitars_and_basses guitar_array = (<guitar_array>)
	store_guitar_name :settags guitar_index = 0
	store_guitar_name :settags guitar_array = <guitar_array>
	change store_true_index = -1
	find_guitar_index_by_id id = (<guitar_array> [0].id)
	store_show_guitar guitar_index = <guitar_index> price = (<guitar_array> [0].price)
	spawnscriptnow store_monitor_goal_guitar_index
	store_show_price_tag pos = (520.0, 260.0) price = (<guitar_array> [0].price) rot = -10 z3d = 2
	store_update_already_bought_for_guitar
	menu_store_find_guitar_index_for_blurb id = ((<guitar_array> [0]).id)
endscript

script destroy_store_guitars_menu 
	killspawnedscript \{name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_store_price_tag
	destroy_store_window_frame
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = store_guitar_container}
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = sg_scroll}
	shut_down_store_hub
	store_monitor_goal_guitar_finish
endscript

script store_guitar_buy_guitar 
	store_guitar_name :gettags
	guitar_id = (<guitar_array> [<guitar_index>].id)
	getglobaltags <guitar_id>
	if ((<unlocked> = 0) && (<unlocked_for_purchase> = 1))
		guitar_price = (<guitar_array> [<guitar_index>].price)
		get_current_band_info
		getglobaltags <band_info>
		if ((<cash> > <guitar_price>) || (<cash> = <guitar_price>))
			<cash> = (<cash> - <guitar_price>)
			setglobaltags <band_info> params = {cash = <cash>}
			setglobaltags <guitar_id> params = {unlocked = 1}
			store_update_band_cash
			store_update_already_bought_for_guitar
			change store_autosave_required = 1
		endif
	endif
endscript

script store_guitar_previous_guitar 
	generic_menu_up_or_down_sound
	store_guitar_name :gettags
	<guitar_index> = (<guitar_index> - 1)
	getarraysize (<guitar_array>)
	if (<guitar_index> < 0)
		<guitar_index> = (<guitar_index> + <array_size>)
	endif
	store_guitar_name :settags guitar_index = <guitar_index>
	bonus_index = <guitar_index>
	find_guitar_index_by_id id = (<guitar_array> [<bonus_index>].id)
	store_show_guitar guitar_index = <guitar_index> price = (<guitar_array> [<bonus_index>].price)
endscript

script store_guitar_next_guitar 
	generic_menu_up_or_down_sound
	store_guitar_name :gettags
	<guitar_index> = (<guitar_index> + 1)
	getarraysize (<guitar_array>)
	if (<guitar_index> = <array_size>)
		<guitar_index> = 0
	endif
	store_guitar_name :settags guitar_index = <guitar_index>
	bonus_index = <guitar_index>
	find_guitar_index_by_id id = (<guitar_array> [<bonus_index>].id)
	store_show_guitar guitar_index = <guitar_index> price = (<guitar_array> [<bonus_index>].price)
endscript

script find_guitar_index_by_id 
	get_musician_instrument_size
	find_index = 0
	begin
	get_musician_instrument_struct index = <find_index>
	if (<info_struct>.desc_id = <id>)
		return guitar_index = (<find_index>)
	endif
	<find_index> = (<find_index> + 1)
	repeat (<array_size>)
	printstruct <...>
	scriptassert \{"Didn't find the guitar!"}
endscript
store_last_index_update = 0
store_goal_index = 0
store_true_index = -1

script store_show_guitar guitar_index = 0
	store_update_guitar_blackout
	get_musician_instrument_struct index = <guitar_index>
	get_instrument_brand_and_finish id = (<info_struct>.desc_id)
	setscreenelementprops id = store_guitar_name text = <instrument_brand>
	getscreenelementdims id = store_guitar_name
	store_guitar_name :setprops scale = (1.0, 1.0) relative_scale
	getscreenelementdims id = store_guitar_name
	if (<width> >= 280.0)
		new_scale = ((280.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		store_guitar_name :setprops scale = <new_scale> relative_scale
	endif
	store_guitar_finish_name :setprops text = <instrument_finish>
	store_guitar_finish_name :setprops scale = (1.0, 1.0) relative_scale
	getscreenelementdims id = store_guitar_finish_name
	if (<width> >= 250.0)
		new_scale = ((250.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		store_guitar_finish_name :setprops scale = <new_scale> relative_scale
	endif
	set_store_purchase_price price = <price>
	change store_goal_index = <guitar_index>
	store_guitar_name :gettags
	getstarttime
	change store_last_index_update = (<starttime>)
	store_update_already_bought_for_guitar
	menu_store_find_guitar_index_for_blurb id = ((<guitar_array> [<guitar_index>]).id)
	select_guitar_change_blurb_text inst_id = (($musician_instrument [<guitar_index>]).desc_id) x_dims = 430 pos = (-115.0, 320.0) dims = (388.0, 300.0) z = 50
endscript

script store_update_guitar_blackout 
	store_guitar_name :gettags
	guitar_id = (<guitar_array> [<guitar_index>].id)
	getglobaltags <guitar_id>
endscript
store_guitar_loading = 0

script store_monitor_goal_guitar_index 
	begin
	if NOT ($store_true_index = $store_goal_index)
		change \{store_guitar_loading = 1}
		store_do_guitar_load guitar_index = ($store_goal_index)
		change store_true_index = ($store_goal_index)
		change \{store_guitar_loading = 0}
	endif
	wait \{1
		gameframe}
	repeat
endscript

script store_monitor_goal_guitar_finish 
	begin
	if ($store_guitar_loading = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{store_guitar_loading = 1}
	killspawnedscript \{name = store_monitor_goal_guitar_index}
	if compositeobjectexists \{store_display_guitar}
		store_display_guitar :die
	endif
	unloadpakasync pak_name = ($store_loaded_guitar_pak) heap = heap_instrument1 async = 1
	change \{store_guitar_loading = 0}
endscript
store_loaded_guitar_pak = ''

script store_update_already_bought_for_guitar 
	store_guitar_name :gettags
	guitar_id = (<guitar_array> [<guitar_index>].id)
	getglobaltags <guitar_id>
	if (<unlocked>)
		store_show_already_owned unlocked_for_purchase = <unlocked_for_purchase>
	else
		store_hide_already_owned
	endif
endscript

script create_store_guitar_finishes_menu 
	change target_store_camera_prop = guitar_selection
	setup_store_hub cash_pos = (-2000.0, -2000.0)
	store_camera_wait
	setscreenelementprops id = store_cash_text pos = (900.0, 550.0)
	create_store_window_frame pos = (900.0, 360.0) dims = (300.0, 600.0) no_hilite
	createscreenelement {
		type = containerelement
		parent = root_window
		id = select_guitar_container
		pos = (893.0, -100.0)
	}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = store_guitar_container
		pos = (893.0, 200.0)
	}
	createscreenelement {
		type = windowelement
		parent = root_window
		id = store_info_scroll_window
		pos = $store_window_pos
		dims = $store_window_dims
	}
	new_menu scrollid = sgf_scroll vmenuid = sgf_vmenu menu_pos = (800.0, 85.0)
	text_params = {parent = sgf_vmenu type = textelement font = ($store_menu_font) rgba = [170 90 35 255] z_priority = 50 no_shadow}
	createscreenelement {
		<text_params>
		text = ""
		id = store_guitar_name
		event_handlers = [
			{pad_down store_guitar_next_guitar}
			{pad_up store_guitar_previous_guitar}
			{pad_left store_guitar_previous_guitar}
			{pad_right store_guitar_next_guitar}
			{pad_choose store_guitar_buy_guitar}
			{pad_back store_go_back}
		]
	}
	createscreenelement {
		type = textelement
		parent = store_guitar_container
		just = [center center]
		font = text_a6
		text = ""
		scale = 0.7
		id = store_guitar_finish_name
		rgba = [255 255 205 255]
		z_priority = (<text_params>.z_priority)
	}
	launchevent type = unfocus target = sgf_vmenu
	launchevent type = focus target = store_guitar_name
	guitar_array = ($bonus_guitar_finishes)
	store_prune_guitar_finishes guitar_array = <guitar_array>
	store_guitar_name :settags guitar_index = 0
	store_guitar_name :settags guitar_array = <guitar_array>
	change store_true_index = -1
	find_guitar_index_by_id id = (<guitar_array> [0].id)
	store_show_guitar guitar_index = <guitar_index> price = (<guitar_array> [0].price)
	spawnscriptnow store_monitor_goal_guitar_index
	store_show_price_tag pos = (520.0, 260.0) price = (<guitar_array> [0].price) rot = -10 z3d = 2
	store_update_already_bought_for_guitar
	menu_store_find_guitar_index_for_blurb id = ((<guitar_array> [0]).id)
	select_guitar_change_blurb_text inst_id = (($musician_instrument [<guitar_index>]).desc_id) x_dims = 430 pos = (-115.0, 320.0) dims = (388.0, 300.0) z = 50
endscript

script destroy_store_guitar_finishes_menu 
	killspawnedscript \{name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = store_guitar_container}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = sgf_scroll}
	destroy_store_window_frame
	shut_down_store_hub
	store_monitor_goal_guitar_finish
endscript

script store_prune_guitar_finishes 
	unlocked_guitar_types = [none]
	find_guitar_index_by_id id = ($free_guitars [0])
	get_musician_instrument_struct index = <guitar_index>
	setarrayelement arrayname = unlocked_guitar_types index = 0 newvalue = (<info_struct>.guitar)
	getarraysize ($free_guitars)
	type_index = 1
	begin
	find_guitar_index_by_id id = ($free_guitars [<type_index>])
	get_musician_instrument_struct index = <guitar_index>
	addarrayelement array = (<unlocked_guitar_types>) element = (<info_struct>.guitar)
	<unlocked_guitar_types> = (<array>)
	<type_index> = (<type_index> + 1)
	repeat (<array_size> - 1)
	getarraysize ($free_basses)
	type_index = 0
	begin
	find_guitar_index_by_id id = ($free_basses [<type_index>])
	get_musician_instrument_struct index = <guitar_index>
	if NOT arraycontains array = (<unlocked_guitar_types>) contains = (<info_struct>.bass)
		addarrayelement array = (<unlocked_guitar_types>) element = (<info_struct>.bass)
		<unlocked_guitar_types> = (<array>)
	endif
	<type_index> = (<type_index> + 1)
	repeat (<array_size>)
	getarraysize ($bonus_guitars)
	type_index = 0
	begin
	guitar_id = ($bonus_guitars [<type_index>].id)
	getglobaltags <guitar_id>
	if (<unlocked>)
		find_guitar_index_by_id id = <guitar_id>
		get_musician_instrument_struct index = <guitar_index>
		addarrayelement array = (<unlocked_guitar_types>) element = (<info_struct>.guitar)
		<unlocked_guitar_types> = (<array>)
	endif
	<type_index> = (<type_index> + 1)
	repeat <array_size>
	getarraysize (<guitar_array>)
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	find_guitar_index_by_id id = <guitar_id>
	get_musician_instrument_struct index = <guitar_index>
	if structurecontains structure = (<info_struct>) guitar
		guitar_type = (<info_struct>.guitar)
	else
		guitar_type = (<info_struct>.bass)
	endif
	if NOT arraycontains array = (<unlocked_guitar_types>) contains = <guitar_type>
		removearrayelement array = (<guitar_array>) index = <index>
		<index> = (<index> - 1)
		<guitar_array> = (<array>)
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return guitar_array = <guitar_array>
endscript

script store_add_secret_guitars_and_basses 
	getarraysize ($secret_guitars)
	index = 0
	begin
	guitar_id = ($secret_guitars [<index>].id)
	getglobaltags <guitar_id>
	if (<unlocked_for_purchase> = 1)
		addarrayelement array = (<guitar_array>) element = ($secret_guitars [<index>])
		<guitar_array> = (<array>)
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	getarraysize ($secret_basses)
	index = 0
	begin
	guitar_id = ($secret_basses [<index>].id)
	getglobaltags <guitar_id>
	if (<unlocked_for_purchase> = 1)
		addarrayelement array = (<guitar_array>) element = ($secret_basses [<index>])
		<guitar_array> = (<array>)
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return guitar_array = <guitar_array>
endscript

script store_do_guitar_load pos = (0.0, 0.0, 0.0) node_name = z_soundcheck_trg_waypoint_guitar_start
	if gotparam guitar_index
		if gotparam node_index
			get_waypoint_id index = <node_index>
			getwaypointpos name = <waypoint_id>
		else
			if gotparam node_name
				getwaypointpos name = <node_name>
			endif
		endif
		existed = 0
		if compositeobjectexists store_display_guitar
			if gotparam useoldpos
				store_display_guitar :obj_getposition
			endif
			store_display_guitar :die
			<existed> = 1
		endif
		guitar_pos = <pos>
		get_musician_instrument_struct index = <guitar_index>
		unformatted_meshname = (<info_struct>.mesh)
		stringremove text = (<unformatted_meshname>) remove = 'models\\' new_string = meshname
		find_loaded_pak_file type = instrument desc_id = (<info_struct>.desc_id)
		if (<found> = 0)
			if (<existed> = 1)
				unloadpakasync pak_name = ($store_loaded_guitar_pak) heap = heap_instrument1 async = 1
			endif
			loadpakasync pak_name = (<info_struct>.pak) heap = heap_instrument1 async = 1
			change store_loaded_guitar_pak = (<info_struct>.pak)
		endif
		if gotparam meshname
			createcompositeobject {
				components = [
					{
						component = skeleton
						skeletonname = gh3_guitarist_axel
					}
					{
						component = setdisplaymatrix
					}
					{
						component = model
						lightgroup = guitar_center
					}
				]
				params = {
					pos = (<guitar_pos> + (0.6, -0.14, 0.0))
					<info_struct>
					object_type = hud_model_3d
					name = store_display_guitar
					model = <meshname>
					scale = 1.25
				}
			}
			profile = {
				<info_struct>
				musician_instrument = {desc_id = (<info_struct>.desc_id)}
			}
			store_display_guitar :obj_spawnscriptnow rotateguitar params = {guitar_pos = <guitar_pos>}
			store_display_guitar :obj_initmodelfromprofile {
				struct = <profile>
				buildscript = create_ped_model_from_appearance
				params = {
					lightgroup = guitar_center_guitar
				}
			}
		endif
	endif
endscript

script rotateguitar 
	pos = (<guitar_pos> + (0.0, -0.14, 0.0))
	rotation = 0.0
	begin
	vrotate = (0.0, 0.0, 0.53)
	rotatevector vector = <vrotate> ry = (90 - <rotation>)
	store_display_guitar :obj_setorientation z = -90 x = <rotation>
	store_display_guitar :obj_setposition position = (<pos> + <result_vector>)
	rotation = (<rotation> + 1.0)
	wait \{1
		gameframe}
	repeat
endscript

script store_show_price_tag parent = root_window price = 23 pos = (0.0, 0.0) z = 10 rot = 0 z3d = 1
	destroy_store_price_tag
	createscreenelement {
		type = containerelement
		parent = <parent>
		pos = <pos>
		id = store_price_tag_container
		z_priority = <z>
		rot_angle = <rot>
	}
	tex = store_tag_price
	if gotparam sold
		<tex> = store_tag_sold
	else
		formattext textname = price_text "$%d" d = <price>
		createscreenelement {
			type = textelement
			parent = store_price_tag_container
			id = store_price_tag_text
			text = <price_text>
			z_priority = 1
			font = text_a5
			pos = (65.0, 8.0)
			rgba = [7 108 4 255]
			rot_angle = 7
		}
		<id> :settags tag_price = 0
	endif
	createscreenelement {
		type = spriteelement
		parent = store_price_tag_container
		id = store_price_tag
		texture = <tex>
		just = [center center]
		rgba = [255 255 255 255]
		dims = (384.0, 192.0)
		z_priority = 0
	}
	store_price_tag :setprops z3d = <z3d>
	store_price_tag_text :setprops z3d = (<z3d> - 0.1)
endscript

script destroy_store_price_tag 
	destroy_menu \{menu_id = store_price_tag_container}
endscript

script store_show_already_owned unlocked_for_purchase = 1 for_character = 0
	if screenelementexists id = store_price_tag
		if (<for_character> = 0)
			store_price_tag :setprops texture = store_tag_sold z3d = 1
		else
			store_price_tag :setprops texture = store_tag_sold z3d = 1
		endif
	endif
	if screenelementexists id = store_price_tag_text
		if (<for_character> = 0)
			store_price_tag_text :setprops z3d = 0.9
		else
			store_price_tag_text :setprops z3d = 0.9
		endif
		if (<unlocked_for_purchase>)
			store_price_tag_text :setprops text = "SOLD" rgba = [170 90 35 255]
		endif
		setscreenelementprops id = store_price_tag_text scale = 1
		fit_text_in_rectangle id = store_price_tag_text dims = (130.0, 90.0)
	endif
endscript

script store_hide_already_owned for_character = 0
	if screenelementexists id = store_price_tag
		if (<for_character> = 0)
			store_price_tag :setprops texture = store_tag_price z3d = 2
		else
			store_price_tag :setprops texture = store_tag_price z3d = 5
		endif
		if screenelementexists id = store_price_tag_text
			if (<for_character> = 0)
				store_price_tag_text :setprops rgba = [7 108 4 255] z3d = 1.9
			else
				store_price_tag_text :setprops rgba = [7 108 4 255] z3d = 4.9
			endif
			setscreenelementprops id = store_price_tag_text scale = 1
			fit_text_in_rectangle id = store_price_tag_text dims = (150.0, 90.0)
		endif
	endif
endscript

script create_store_videos_menu 
	change target_store_camera_prop = song_selection
	setup_store_hub cash_pos = (-2000.0, -2000.0)
	store_camera_wait
	setscreenelementprops id = store_cash_text pos = (900.0, 550.0)
	create_store_window_frame pos = (900.0, 360.0) dims = (300.0, 600.0) no_hilite
	createscreenelement {
		type = containerelement
		parent = root_window
		id = select_guitar_container
		pos = (893.0, -100.0)
	}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = store_videos_container
		pos = (900.0, 215.0)
	}
	createscreenelement {
		type = windowelement
		parent = root_window
		id = store_info_scroll_window
		pos = ($store_window_pos + (0.0, 60.0))
		dims = ($store_window_dims - (0.0, 70.0))
	}
	new_menu scrollid = sv_scroll vmenuid = sv_vmenu
	text_params = {parent = sv_vmenu type = textelement font = ($store_menu_font) rgba = [170 90 35 255] z_priority = 50 no_shadow}
	createscreenelement {
		<text_params>
		text = ""
		event_handlers = [
			{pad_left store_videos_right}
			{pad_right store_videos_left}
			{pad_down store_videos_right}
			{pad_up store_videos_left}
			{pad_choose store_videos_buy}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
		id = store_videos_menu_holder
	}
	createscreenelement {
		type = textelement
		parent = store_videos_container
		just = [center center]
		font = ($store_menu_font)
		text = ""
		scale = 1.0
		id = store_videos_artist
		rgba = [170 90 35 255]
		z_priority = (<text_params>.z_priority)
		pos = (-5.0, -67.0)
	}
	<id> :settags videos_index = 0
	store_show_price_tag parent = store_videos_container pos = (-500.0, 80.0) rot = -10
	launchevent type = unfocus target = sv_vmenu
	launchevent type = focus target = store_videos_menu_holder
	set_store_videos_title index = 0
endscript

script destroy_store_videos_menu 
	killspawnedscript \{name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = store_videos_container}
	destroy_menu \{menu_id = sv_scroll}
	destroy_store_window_frame
	shut_down_store_hub
endscript

script set_store_videos_title index = 0
	store_videos_artist :settags videos_index = <index>
	videos_checksum = ($bonus_videos [<index>].id)
	select_guitar_change_blurb_text text = ($bonus_videos [<index>].info) x_dims = 430 pos = (-115.0, 320.0) dims = (388.0, 300.0) z = 50
	setscreenelementprops {
		id = store_videos_artist
		text = ($bonus_videos [<index>].name)
	}
	store_videos_artist :setprops scale = (1.0, 1.0) relative_scale
	getscreenelementdims id = store_videos_artist
	if (<width> >= 280.0)
		new_scale = ((280.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		store_videos_artist :setprops scale = <new_scale> relative_scale
	endif
	video_price = ($bonus_videos [<index>].price)
	set_store_purchase_price price = (<video_price>)
	store_hide_already_owned
	getglobaltags <videos_checksum>
	if (<unlocked> = 1)
		store_show_already_owned
	endif
endscript

script store_videos_left 
	store_videos_artist :gettags
	<videos_index> = (<videos_index> - 1)
	getarraysize ($bonus_videos)
	if (<videos_index> < 0)
		<videos_index> = (<videos_index> + <array_size>)
	endif
	set_store_videos_title index = (<videos_index>)
endscript

script store_videos_right 
	store_videos_artist :gettags
	<videos_index> = (<videos_index> + 1)
	get_progression_globals game_mode = ($game_mode) bonus
	getarraysize ($bonus_videos)
	if (<videos_index> = <array_size>)
		<videos_index> = 0
	endif
	set_store_videos_title index = (<videos_index>)
endscript

script store_videos_buy 
	store_videos_artist :gettags
	video_checksum = ($bonus_videos [<videos_index>].id)
	video_price = ($bonus_videos [<videos_index>].price)
	getglobaltags <video_checksum>
	if (<unlocked> = 0)
		get_current_band_info
		getglobaltags <band_info>
		if ((<cash> > <video_price>) || (<cash> = <video_price>))
			<cash> = (<cash> - <video_price>)
			setglobaltags <band_info> params = {cash = <cash>}
			setglobaltags <video_checksum> params = {unlocked = 1}
			store_update_band_cash
			set_store_videos_title index = (<videos_index>)
			change store_autosave_required = 1
		endif
	endif
endscript
