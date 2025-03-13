credits_menu_font = fontgrid_text_a8
credits_menu_scroll = horizontal

script ui_create_end_credits 
	printf \{'ui_create_end_credits'}
	spawnscriptnow ui_create_end_credits_spawned params = {<...>}
endscript

script ui_create_end_credits_spawned 
	kill_gem_scroller
	progression_endcredits
endscript

script ui_destroy_end_credits 
endscript

script create_credits_menu 
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if NOT ($end_credits = 1)
		disable_pause
		create_loading_screen
		change \{current_level = load_z_credits}
		load_venue \{async = 1}
		destroy_loading_screen
	endif
	pushassetcontext \{context = z_credits}
	createscreenelement \{type = containerelement
		parent = root_window
		id = credits_backdrop_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if NOT ($end_credits = 1)
		createscreenelement \{type = spriteelement
			id = credits_backdrop
			parent = credits_backdrop_container
			texture = credits_bg
			rgba = [
				255
				255
				255
				255
			]
			pos = (640.0, 360.0)
			dims = (2560.0, 720.0)
			just = [
				center
				center
			]
			z_priority = 0
			alpha = 1}
	endif
	tilesprite \{parent = credits_backdrop_container
		texture = credits_bg
		tile_dims = (5120.0, 720.0)
		dims = (2560.0, 720.0)
		pos = (-2560.0, 0.0)}
	runscriptonscreenelement tilespriteloop id = <id> params = {move_x = 5 move_y = 0}
	popassetcontext
	if NOT ($end_credits = 1)
		event_handlers = [
			{pad_back end_credits_button params = <...>}
		]
		new_menu scrollid = mc_scroll vmenuid = current_menu event_handlers = <event_handlers>
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 1001}
	else
		new_menu \{scrollid = mc_scroll
			vmenuid = current_menu}
	endif
	runscriptonscreenelement \{id = credits_backdrop_container
		scrolling_list_begin}
	launchevent \{target = current_menu
		type = focus}
endscript

script end_credits_button 
	destroy_credits_menu
	if gotparam \{soundcheck}
		frontend_load_soundcheck \{loadingscreen}
	endif
	generic_event_back
endscript

script destroy_credits_menu 
	if ($shutdown_game_for_signin_change_flag = 1)
		killspawnedscript \{name = create_credits_menu}
		if screenelementexists \{id = credits_list_container}
			destroyscreenelement \{id = credits_list_container}
		endif
		killspawnedscript \{name = scrolling_list_begin}
	endif
	clean_up_user_control_helpers
	killspawnedscript \{name = tilespriteloop}
	if screenelementexists \{id = credits_backdrop_container}
		destroyscreenelement \{id = credits_backdrop_container}
	endif
	if screenelementexists \{id = mc_scroll}
		destroyscreenelement \{id = mc_scroll}
	endif
endscript

script scrolling_list_begin 
	if ($end_credits = 1)
		wait \{2
			seconds}
		createscreenelement \{type = containerelement
			parent = root_window
			id = credits_backdrop_container
			pos = (0.0, 0.0)
			just = [
				left
				top
			]}
	endif
	scrolling_list_init_credits
	scrolling_list_add_item <...>
endscript

script scrolling_list_add_item \{i = 0}
	if (<i> = 0)
		if NOT ($end_credits = 1)
			<i> = 6
		endif
	endif
	getarraysize ($credits)
	if (<i> = <array_size>)
		printf \{qs(0xb58d18b7)}
		wait <time> seconds
		if screenelementexists \{id = credits_list_container}
			destroyscreenelement \{id = credits_list_container}
		endif
		if NOT ($end_credits = 1)
			end_credits_button \{soundcheck}
		endif
		return
	endif
	if structurecontains structure = ($credits [<i>]) item
		text = (($credits [<i>]).item)
	else
		text = qs(0x2ba2c9a2)
	endif
	if structurecontains structure = ($credits [<i>]) heading
		scale = <scale_head>
		color = <color_head>
		color_shadow = [20 10 5 90]
		shadow_offs = (3.0, 3.0)
	else
		scale = <scale_body>
		color = <color_body>
		color_shadow = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
	endif
	if structurecontains structure = ($credits [<i>]) title
		scale = <scale_title>
		color = <color_title>
		color_shadow = [20 10 5 90]
		shadow_offs = (3.0, 3.0)
	endif
	if structurecontains structure = ($credits [<i>]) small
		scale = 0.5
		color = <color_body>
		color_shadow = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
	endif
	formattext checksumname = item_id 'item_%n' n = <i>
	if screenelementexists id = <item_id>
		destroyscreenelement id = <item_id>
	endif
	if ($credits_menu_scroll = vertical)
		<fit_width> = `scale each line if larger`
		<fit_height> = `expand dims`
	else
		<fit_width> = `expand dims`
		<fit_height> = `scale down if larger`
	endif
	createscreenelement {
		type = textblockelement
		id = <item_id>
		parent = credits_list_container
		font = fontgrid_text_a8
		dims = <our_dims>
		fit_width = <fit_width>
		fit_height = <fit_height>
		font_spacing = 1
		pos = (0.0, 0.0)
		internal_scale = <scale>
		text = <text>
		just = <just>
		internal_just = <just>
		rgba = <color>
		alpha = 1
		shadow
		shadow_offs = <shadow_offs>
		shadow_rgba = <color_shadow>
		z_priority = <z_priority_credits>
	}
	getscreenelementdims id = <item_id>
	if ($credits_menu_scroll = vertical)
		<item_height> = (<height> + <spacer>)
		<item_pos> = (<base_pos> + (<item_height> * (0.0, 1.0)))
	else
		<item_width> = (<width> + <spacer>)
		if gotparam \{prev_dim_x}
			<item_pos> = (<base_pos> + ((<prev_dim_x> + <spacer>) * (1.0, 0.0)))
		else
			<item_pos> = (<base_pos> + (<item_width> * (1.0, 0.0)))
		endif
	endif
	<item_id> :se_setprops pos = <item_pos>
	if ($credits_menu_scroll = vertical)
		<distance> = (<screen_height> + ((<item_pos>.(0.0, 1.0)) - <screen_height>))
	else
		<distance> = (<screen_width> + ((<item_pos>.(1.0, 0.0)) - <screen_width> + <width>))
	endif
	<time> = (<distance> / <rate>)
	if screenelementexists id = <item_id>
		runscriptonscreenelement id = <item_id> scrolling_list_move_item params = {<...>}
	endif
endscript

script scrolling_list_move_item 
	runscriptonscreenelement id = credits_backdrop_container scrolling_list_queue_next_item params = {<...>}
	if ($credits_menu_scroll = vertical)
		<target_pos> = (<item_pos> - ((0.0, 1.0) * <distance>))
	else
		<target_pos> = (<item_pos> - ((1.0, 0.0) * <distance>))
	endif
	se_setprops time = <time> pos = <target_pos>
	se_waitprops
	if screenelementexists id = <item_id>
		destroyscreenelement id = <item_id>
	endif
endscript

script scrolling_list_queue_next_item 
	begin
	if screenelementexists id = <item_id>
		getscreenelementprops id = <item_id>
	endif
	if ($credits_menu_scroll = vertical)
		pos_y = (<pos>.(0.0, 1.0))
		if (<pos_y> < <screen_height>)
			<i> = (<i> + 1)
			scrolling_list_add_item <...>
			return
		endif
	else
		pos_x = (<pos>.(1.0, 0.0))
		if (<pos_x> < <screen_width>)
			<i> = (<i> + 1)
			<prev_dim_x> = (<dims>.(1.0, 0.0))
			scrolling_list_add_item <...>
			return
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script scrolling_list_init_credits 
	if ($end_credits = 1)
		z_priority_credits = 100
	else
		z_priority_credits = 1000
	endif
	if ($end_credits = 1)
		<rate> = 394.0
		<screen_height> = 280.0
		<scale_head> = 0.9
		<color_head> = [180 165 120 255]
		<scale_body> = 0.65000004
		<color_body> = [180 200 200 255]
		<scale_title> = 0.65000004
		<color_title> = [180 165 120 255]
	else
		<rate> = 140.0
		<screen_height> = 690
		<scale_head> = 0.75
		<color_head> = [180 165 120 255]
		<scale_body> = 0.65000004
		<color_body> = [180 200 200 255]
		<scale_title> = 0.65000004
		<color_title> = [180 165 120 255]
	endif
	<screen_width> = 1280
	if ($credits_menu_scroll = vertical)
		<just> = [center bottom]
		<base_pos> = ((640.0, 0.0) + ((0.0, 1.0) * <screen_height>))
		<column_width> = 450
		<our_dims> = (<column_width> * (1.0, 0.0))
		<spacer> = 5
	else
		<just> = [left center]
		<base_pos> = ((0.0, 320.0) + ((1.0, 0.0) * <screen_width>))
		<column_height> = 180
		<our_dims> = ((<column_height> * (0.0, 1.0)) + (70.0, 0.0))
		<spacer> = 15
	endif
	if screenelementexists \{id = credits_list_container}
		destroyscreenelement \{id = credits_list_container}
	endif
	createscreenelement \{type = containerelement
		parent = credits_backdrop_container
		id = credits_list_container
		pos = (0.0, 0.0)}
	return <...>
endscript
credits = [
]
