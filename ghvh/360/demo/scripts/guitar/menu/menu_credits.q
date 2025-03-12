credits_menu_font = text_a1
credits_menu_scroll = vertical

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
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = credits_backdrop_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if NOT ($end_credits = 1)
		printf \{channel = credits
			qs(0x0d097e90)}
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
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = 0
			alpha = 1}
	endif
	if NOT ($end_credits = 1)
		if NOT gotparam \{end_credits}
			event_handlers = [
				{pad_back end_credits_button params = <...>}
			]
			new_menu scrollid = mc_scroll vmenuid = current_menu event_handlers = <event_handlers>
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 1001}
		else
			event_handlers = [
				{pad_choose end_credits_button params = <...>}
			]
			new_menu scrollid = mc_scroll vmenuid = current_menu event_handlers = <event_handlers>
			add_user_control_helper \{text = qs(0x182f0173)
				button = green
				z = 1001}
		endif
	else
		new_menu \{scrollid = mc_scroll
			vmenuid = current_menu}
	endif
	runscriptonscreenelement id = credits_backdrop_container scrolling_list_begin params = <...>
	launchevent \{target = current_menu
		type = focus}
endscript

script end_credits_button 
	if screenelementexists \{id = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	destroy_credits_menu
	if NOT gotparam \{end_credits}
		generic_event_back
	else
		progression_set_credits_complete
		ui_win_song_career_continue
	endif
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
		printf channel = credits qs(0x8b30dc8a) ii = <i>
		wait <time> seconds
		if screenelementexists \{id = credits_list_container}
			destroyscreenelement \{id = credits_list_container}
		endif
		if NOT ($end_credits = 1)
			end_credits_button <...> soundcheck
		endif
		return
	endif
	if structurecontains structure = ($credits [<i>]) item
		if (<i> = (<array_size> - 11))
			getterritory
			if NOT (<territory> = territory_us)
				text = qs(0x2ba2c9a2)
			else
				text = (($credits [<i>]).item)
			endif
		else
			text = (($credits [<i>]).item)
		endif
	else
		text = qs(0x2ba2c9a2)
	endif
	if structurecontains structure = ($credits [<i>]) heading
		scale = <scale_head>
		color = <color_head>
		color_shadow = [20 10 5 0]
		shadow_offs = (3.0, 3.0)
	else
		scale = <scale_body>
		color = <color_body>
		color_shadow = [0 0 0 0]
		shadow_offs = (3.0, 3.0)
	endif
	if structurecontains structure = ($credits [<i>]) title
		scale = <scale_title>
		color = <color_title>
		color_shadow = [20 10 5 0]
		shadow_offs = (3.0, 3.0)
	endif
	if structurecontains structure = ($credits [<i>]) small
		scale = 0.5
		color = <color_body>
		color_shadow = [0 0 0 0]
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
		font = text_a1
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
		printf \{qs(0x0577daa1)}
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
		<rate> = 200.0
		<screen_height> = 280.0
		<scale_head> = 0.9
		<color_head> = [220 220 220 255]
		<scale_body> = 0.65000004
		<color_body> = [200 200 200 255]
		<scale_title> = 0.65000004
		<color_title> = [220 220 220 255]
	else
		<rate> = 200.0
		<screen_height> = 690
		<scale_head> = 0.8
		<color_head> = [30 30 30 255]
		<scale_body> = 0.5
		<color_body> = [30 30 30 255]
		<scale_title> = 0.5
		<color_title> = [149 48 48 255]
	endif
	<screen_width> = 1280
	if ($credits_menu_scroll = vertical)
		<just> = [center bottom]
		<base_pos> = ((640.0, 0.0) + ((0.0, 1.0) * <screen_height>))
		<column_width> = 800
		<our_dims> = (<column_width> * (1.0, 0.0))
		<spacer> = 5
	else
		<just> = [left center]
		<base_pos> = ((0.0, 300.0) + ((1.0, 0.0) * <screen_width>))
		<column_height> = 220
		<our_dims> = ((<column_height> * (0.0, 1.0)) + (70.0, 0.0))
		<spacer> = 80
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
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x905721f2)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x905721f2)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x905721f2)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xb395b315)
	}
	{
		title
		item = qs(0xd0a7271c)
	}
	{
		item = qs(0x09c528c8)
	}
	{
		title
		item = qs(0x6cd28cfd)
	}
	{
		item = qs(0x74b8f580)
	}
	{
		title
		item = qs(0xa137e060)
	}
	{
		item = qs(0xe468c3f8)
	}
	{
		title
		item = qs(0x6ae54d7a)
	}
	{
		item = qs(0x8471cdf1)
	}
	{
		title
		item = qs(0x7e1ac960)
	}
	{
		item = qs(0x2bc865fb)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x44f3d9cc)
	}
	{
		title
		item = qs(0x68a18f23)
	}
	{
		item = qs(0x347d085e)
	}
	{
		title
		item = qs(0xab209ee5)
	}
	{
		item = qs(0x58f0cd07)
	}
	{
		title
		item = qs(0x191af8b7)
	}
	{
		item = qs(0x9fb52014)
	}
	{
		title
		item = qs(0x4ec9a575)
	}
	{
		item = qs(0x829c3116)
	}
	{
		title
		item = qs(0x8d225704)
	}
	{
		item = qs(0xf824d3c7)
	}
	{
		title
		item = qs(0x626e6061)
	}
	{
		item = qs(0x296bf4db)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x03c352fc)
	}
	{
		title
		item = qs(0x90b675b8)
	}
	{
		item = qs(0x14595d1f)
	}
	{
		title
		item = qs(0x7e30e0f2)
	}
	{
		item = qs(0x996832fb)
	}
	{
		title
		item = qs(0x51ab44b1)
	}
	{
		item = qs(0x5199ed3b)
	}
	{
		title
		item = qs(0xff67d44a)
	}
	{
		item = qs(0x6ea4eeff)
	}
	{
		title
		item = qs(0xddda4e93)
	}
	{
		item = qs(0xd11f08af)
	}
	{
		title
		item = qs(0xe942967b)
	}
	{
		item = qs(0xe4bfb1c7)
	}
	{
		title
		item = qs(0xe8c8aa73)
	}
	{
		item = qs(0xf7bba6e1)
	}
	{
		title
		item = qs(0xc2236d4d)
	}
	{
		item = qs(0xf230e6e2)
	}
	{
		title
		item = qs(0x15b41e45)
	}
	{
		item = qs(0x5e3d80fc)
	}
	{
		title
		item = qs(0x0a8e705d)
	}
	{
		item = qs(0x655642cb)
	}
	{
		title
		item = qs(0x7f287925)
	}
	{
		item = qs(0x6bbe1850)
	}
	{
		title
		item = qs(0x0140f675)
	}
	{
		item = qs(0x6bfdec91)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x05e8b845)
	}
	{
		title
		item = qs(0xd497c914)
	}
	{
		item = qs(0xc78399fd)
	}
	{
		title
		item = qs(0x8c3abd02)
	}
	{
		item = qs(0x28ef2e82)
	}
	{
		title
		item = qs(0xd6fcc452)
	}
	{
		item = qs(0x9ce01374)
	}
	{
		title
		item = qs(0x5aec93e6)
	}
	{
		item = qs(0x812167ce)
	}
	{
		title
		item = qs(0x4550cd33)
	}
	{
		item = qs(0x7e6e25b0)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x79a70b1a)
	}
	{
		title
		item = qs(0xfd030bca)
	}
	{
		item = qs(0x285586c3)
	}
	{
		title
		item = qs(0x80fc80cf)
	}
	{
		item = qs(0x85e72c2b)
	}
	{
		title
		item = qs(0xf50e9c27)
	}
	{
		item = qs(0x12fa0af9)
	}
	{
		title
		item = qs(0x79a70b1a)
	}
	{
		item = qs(0xe997a7e4)
	}
	{
		item = qs(0x50928374)
	}
	{
		item = qs(0x203e82c7)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xfc804ee8)
	}
	{
		title
		item = qs(0x73123821)
	}
	{
		item = qs(0xcc87e417)
	}
	{
		title
		item = qs(0x5f9eb91b)
	}
	{
		item = qs(0xdb3ad32a)
	}
	{
		title
		item = qs(0x7807fa1e)
	}
	{
		item = qs(0xb4e8c95c)
	}
	{
		title
		item = qs(0xb794f84f)
	}
	{
		item = qs(0xfb0d1d71)
	}
	{
		title
		item = qs(0x7294ae6a)
	}
	{
		item = qs(0xef90c562)
	}
	{
		title
		item = qs(0x4608591c)
	}
	{
		item = qs(0x52a37514)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x22b83ad0)
	}
	{
		title
		item = qs(0x11b26600)
	}
	{
		item = qs(0xf4a4e783)
	}
	{
		title
		item = qs(0xa948bac2)
	}
	{
		item = qs(0xdd0346bf)
	}
	{
		title
		item = qs(0xbf13722b)
	}
	{
		item = qs(0x3daacf0e)
	}
	{
		title
		item = qs(0x45889857)
	}
	{
		item = qs(0x83fb1df8)
	}
	{
		item = qs(0xd2815722)
	}
	{
		item = qs(0xcc9c94ed)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xccce8717)
	}
	{
		title
		item = qs(0xbea6309d)
	}
	{
		item = qs(0x35402585)
	}
	{
		title
		item = qs(0x2f67d4ef)
	}
	{
		item = qs(0x19be958c)
	}
	{
		title
		item = qs(0xffe3b987)
	}
	{
		item = qs(0xdae8ca2f)
	}
	{
		item = qs(0x0b25612d)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xad686f76)
	}
	{
		item = qs(0xa9687cb3)
	}
	{
		item = qs(0xa65bb3ff)
	}
	{
		item = qs(0x05444877)
	}
	{
		item = qs(0x18a2802e)
	}
	{
		item = qs(0xab4cb3b8)
	}
	{
		item = qs(0xb9a8a8d1)
	}
	{
		item = qs(0x33f839f6)
	}
	{
		item = qs(0x653af539)
	}
	{
		item = qs(0x79cbf3b7)
	}
	{
		item = qs(0x0cd17cd9)
	}
	{
		item = qs(0xd3ac8ae0)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x004fad57)
	}
	{
		item = qs(0x7cd3eb96)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xc16497e6)
	}
	{
		item = qs(0xf2006997)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x7a101418)
	}
	{
		item = qs(0xe1702024)
	}
	{
		title
		item = qs(0x9a17c17e)
	}
	{
		item = qs(0x94db4ba0)
	}
	{
		item = qs(0x33c7b269)
	}
	{
		title
		item = qs(0x50f04bda)
	}
	{
		item = qs(0xb84214ee)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xe672a930)
	}
	{
		title
		item = qs(0xe1bf45a9)
	}
	{
		item = qs(0x261fd0b6)
	}
	{
		title
		item = qs(0x74a49691)
	}
	{
		item = qs(0x97dfb99f)
	}
	{
		item = qs(0xbbe2a87d)
	}
	{
		item = qs(0x35f64f39)
	}
	{
		title
		item = qs(0xbb9e0e3a)
	}
	{
		item = qs(0x417458ca)
	}
	{
		item = qs(0x790ad5fb)
	}
	{
		item = qs(0x3f359706)
	}
	{
		title
		item = qs(0x854ecd53)
	}
	{
		item = qs(0x4e5541e3)
	}
	{
		title
		item = qs(0xdc082730)
	}
	{
		item = qs(0x66447be5)
	}
	{
		title
		item = qs(0x206e606d)
	}
	{
		item = qs(0xa7a5a598)
	}
	{
		title
		item = qs(0xabe8904e)
	}
	{
		item = qs(0x264f6111)
	}
	{
		title
		item = qs(0x1c6eaba6)
	}
	{
		item = qs(0xc5518fa5)
	}
	{
		title
		item = qs(0x483c2841)
	}
	{
		item = qs(0x1d42d64e)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x09853309)
	}
	{
		title
		item = qs(0x6ae54d7a)
	}
	{
		item = qs(0x0f133c75)
	}
	{
		title
		item = qs(0x8bc82f1b)
	}
	{
		item = qs(0x3a152483)
	}
	{
		title
		item = qs(0x199e75d8)
	}
	{
		item = qs(0xc493cc3a)
	}
	{
		title
		item = qs(0x6cd28cfd)
	}
	{
		item = qs(0x146c4e63)
	}
	{
		title
		item = qs(0x262deeec)
	}
	{
		item = qs(0xa1e665db)
	}
	{
		title
		item = qs(0xd6570499)
	}
	{
		item = qs(0xd36f82d4)
	}
	{
		title
		item = qs(0x174c34d9)
	}
	{
		item = qs(0x913e9ddc)
	}
	{
		item = qs(0xdd8a954b)
	}
	{
		item = qs(0x7761f6d0)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x2036d389)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x7ae7608b)
	}
	{
		title
		item = qs(0xa7f08996)
	}
	{
		item = qs(0x6c7cdaaa)
	}
	{
		title
		item = qs(0xa7201470)
	}
	{
		item = qs(0x9510fa60)
	}
	{
		title
		item = qs(0x40b029ed)
	}
	{
		item = qs(0x6a02853f)
	}
	{
		title
		item = qs(0x16785f1c)
	}
	{
		item = qs(0x887801f5)
	}
	{
		heading
		item = qs(0xa34e3c7c)
	}
	{
		title
		item = qs(0xb45c84d5)
	}
	{
		item = qs(0xcd97d5cd)
	}
	{
		title
		item = qs(0x6a1e3c4c)
	}
	{
		item = qs(0x08f92267)
	}
	{
		title
		item = qs(0x500ea348)
	}
	{
		item = qs(0xae856cd2)
	}
	{
		title
		item = qs(0x280d42ee)
	}
	{
		item = qs(0x880a0ac6)
	}
	{
		title
		item = qs(0x84588733)
	}
	{
		item = qs(0x98a45a67)
	}
	{
		title
		item = qs(0xca92af95)
	}
	{
		item = qs(0x206798ad)
	}
	{
		title
		item = qs(0xa8b4e593)
	}
	{
		item = qs(0x0a691ffe)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x14a1300c)
	}
	{
		title
		item = qs(0x638cb816)
	}
	{
		item = qs(0xdd7b3bc2)
	}
	{
		title
		item = qs(0x49c7a3e8)
	}
	{
		item = qs(0xa86b9782)
	}
	{
		title
		item = qs(0xd8e8ba0e)
	}
	{
		item = qs(0x5144a205)
	}
	{
		title
		item = qs(0x2198a2a4)
	}
	{
		item = qs(0x84e0aefa)
	}
	{
		title
		item = qs(0x62c836bd)
	}
	{
		item = qs(0x6a976a6c)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x12a3b197)
	}
	{
		title
		item = qs(0x1f316b1c)
	}
	{
		item = qs(0x8a87386d)
	}
	{
		title
		item = qs(0x15fde88b)
	}
	{
		item = qs(0x1fe8dad4)
	}
	{
		title
		item = qs(0x360e1abd)
	}
	{
		item = qs(0x0c7540cc)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x2036d389)
	}
	{
		title
		item = qs(0x11c124f6)
	}
	{
		item = qs(0x86bac2e2)
	}
	{
		title
		item = qs(0xffc36037)
	}
	{
		item = qs(0x397e5d84)
	}
	{
		title
		item = qs(0x61bc8b4f)
	}
	{
		item = qs(0xe819f304)
	}
	{
		title
		item = qs(0xe2d86448)
	}
	{
		item = qs(0xe3ab930e)
	}
	{
		title
		item = qs(0x1a712604)
	}
	{
		item = qs(0x803e7e2e)
	}
	{
		title
		item = qs(0x4900b558)
	}
	{
		item = qs(0xf8edb610)
	}
	{
		title
		item = qs(0x5dce1f3c)
	}
	{
		item = qs(0x27b49a13)
	}
	{
		title
		item = qs(0x955be7db)
	}
	{
		item = qs(0xee3815c4)
	}
	{
		title
		item = qs(0xf1d564e1)
	}
	{
		item = qs(0x34bd069b)
	}
	{
		title
		item = qs(0xd6fd01f3)
	}
	{
		item = qs(0xbdca7297)
	}
	{
		title
		item = qs(0xc63e50d4)
	}
	{
		item = qs(0x9a0169c3)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xb01554c8)
	}
	{
		title
		item = qs(0xa58211ad)
	}
	{
		item = qs(0x876b3287)
	}
	{
		title
		item = qs(0xc5199173)
	}
	{
		item = qs(0xaaa7d1f2)
	}
	{
		title
		item = qs(0xb43d8860)
	}
	{
		item = qs(0x266541a9)
	}
	{
		title
		item = qs(0x4c1cc930)
	}
	{
		item = qs(0x7f30c317)
	}
	{
		title
		item = qs(0x4de0126b)
	}
	{
		item = qs(0xe0846a9e)
	}
	{
		title
		item = qs(0x8d314845)
	}
	{
		item = qs(0x19b75c1a)
	}
	{
		title
		item = qs(0xff14234a)
	}
	{
		item = qs(0x9cd6b1c7)
	}
	{
		title
		item = qs(0xd954fd22)
	}
	{
		item = qs(0xf4ba4707)
	}
	{
		title
		item = qs(0xc3ec9948)
	}
	{
		item = qs(0x393feba0)
	}
	{
		title
		item = qs(0xa137e060)
	}
	{
		item = qs(0xe40cbb4a)
	}
	{
		title
		item = qs(0x6ae54d7a)
	}
	{
		item = qs(0x72df0638)
	}
	{
		title
		item = qs(0x9241b161)
	}
	{
		item = qs(0x966d32d1)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x8152dd48)
	}
	{
		title
		item = qs(0xdb35d382)
	}
	{
		item = qs(0x93365be3)
	}
	{
		title
		item = qs(0x0fcac575)
	}
	{
		item = qs(0x5faad6e2)
	}
	{
		title
		item = qs(0x0b9dbe13)
	}
	{
		item = qs(0x4d6caaa3)
	}
	{
		title
		item = qs(0x1ca64aa6)
	}
	{
		item = qs(0x11056470)
	}
	{
		title
		item = qs(0x1f1d0671)
	}
	{
		item = qs(0xa5ac943a)
	}
	{
		title
		item = qs(0x47adf524)
	}
	{
		item = qs(0x8e8ba600)
	}
	{
		title
		item = qs(0x33b48d6e)
	}
	{
		item = qs(0xfe70f807)
	}
	{
		title
		item = qs(0xf81a3ac7)
	}
	{
		item = qs(0x281ccd95)
	}
	{
		item = qs(0x3b0d20e7)
	}
	{
		item = qs(0x25d961e1)
	}
	{
		item = qs(0xfa8209ad)
	}
	{
		item = qs(0x52eb254a)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x96bae7d7)
	}
	{
		title
		item = qs(0xd436550b)
	}
	{
		item = qs(0x909fb483)
	}
	{
		title
		item = qs(0x8408d30f)
	}
	{
		item = qs(0x16343dfe)
	}
	{
		title
		item = qs(0x9a0ec164)
	}
	{
		item = qs(0xa5d6c3d7)
	}
	{
		title
		item = qs(0x38d1aed5)
	}
	{
		item = qs(0x96020972)
	}
	{
		title
		item = qs(0x29515325)
	}
	{
		item = qs(0x3fa87a80)
	}
	{
		title
		item = qs(0xda01f75c)
	}
	{
		item = qs(0x64443cf8)
	}
	{
		title
		item = qs(0xf4a07da6)
	}
	{
		item = qs(0xa7c9cc7e)
	}
	{
		title
		item = qs(0x73764dc2)
	}
	{
		item = qs(0x96fefd87)
	}
	{
		title
		item = qs(0x6c4c1aae)
	}
	{
		item = qs(0x31eae86b)
	}
	{
		title
		item = qs(0xc34cfb35)
	}
	{
		item = qs(0x95833614)
	}
	{
		title
		item = qs(0x980b47d7)
	}
	{
		item = qs(0x182c15e8)
	}
	{
		title
		item = qs(0x7bb3fc9d)
	}
	{
		item = qs(0x92307bf4)
	}
	{
		title
		item = qs(0x8f7af036)
	}
	{
		item = qs(0xffadf633)
	}
	{
		title
		item = qs(0x56df084a)
	}
	{
		item = qs(0xf6130f49)
	}
	{
		title
		item = qs(0x30ae4229)
	}
	{
		item = qs(0x227fe4e0)
	}
	{
		title
		item = qs(0x1113a7fe)
	}
	{
		item = qs(0x243243dc)
	}
	{
		title
		item = qs(0xa3d946a7)
	}
	{
		item = qs(0x96724150)
	}
	{
		title
		item = qs(0x70aa6fdb)
	}
	{
		item = qs(0x1c700f1a)
	}
	{
		title
		item = qs(0x4cafd5ca)
	}
	{
		item = qs(0xd3317247)
	}
	{
		title
		item = qs(0x128bb1a2)
	}
	{
		item = qs(0x594415a2)
	}
	{
		title
		item = qs(0xbc671d82)
	}
	{
		item = qs(0x6f680661)
	}
	{
		title
		item = qs(0x9be82aff)
	}
	{
		item = qs(0xd346b543)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x94b1e75b)
	}
	{
		title
		item = qs(0xe1a09111)
	}
	{
		item = qs(0x9abe3701)
	}
	{
		title
		item = qs(0x0fa81ccd)
	}
	{
		item = qs(0xa5c72b1e)
	}
	{
		title
		item = qs(0xc2e8bf84)
	}
	{
		item = qs(0x2c02d252)
	}
	{
		title
		item = qs(0x324ed4fd)
	}
	{
		item = qs(0xac774245)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xd1f03d27)
	}
	{
		item = qs(0x03021564)
	}
	{
		item = qs(0x8885b9eb)
	}
	{
		item = qs(0xcafb98a3)
	}
	{
		item = qs(0x80ba5132)
	}
	{
		item = qs(0xe9c03a24)
	}
	{
		item = qs(0xce03c0f4)
	}
	{
		item = qs(0x7ab8cf26)
	}
	{
		item = qs(0x53878fcc)
	}
	{
		item = qs(0x7279991c)
	}
	{
		item = qs(0x0a94d4cc)
	}
	{
		item = qs(0xbab2f720)
	}
	{
		item = qs(0x9915bb00)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x22b83ad0)
	}
	{
		title
		item = qs(0xc05dd3a0)
	}
	{
		item = qs(0x94b849b7)
	}
	{
		title
		item = qs(0x83baa3c5)
	}
	{
		item = qs(0x681b5d14)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xe8e58201)
	}
	{
		title
		item = qs(0x1ee45254)
	}
	{
		item = qs(0xcf3d3554)
	}
	{
		title
		item = qs(0xf9362001)
	}
	{
		item = qs(0xef1033ee)
	}
	{
		title
		item = qs(0x5049c4fc)
	}
	{
		item = qs(0xb4b6064f)
	}
	{
		title
		item = qs(0x45b82b5c)
	}
	{
		item = qs(0xea4b84d7)
	}
	{
		item = qs(0xe6889910)
	}
	{
		item = qs(0xdd50ee5b)
	}
	{
		item = qs(0xed90a07b)
	}
	{
		item = qs(0xf546d1d6)
	}
	{
		item = qs(0xc97b587e)
	}
	{
		item = qs(0xa117b00e)
	}
	{
		item = qs(0x6c2e9ca8)
	}
	{
		item = qs(0x56ee07b6)
	}
	{
		item = qs(0x075666da)
	}
	{
		item = qs(0x9d94c3c2)
	}
	{
		item = qs(0xb78f17bc)
	}
	{
		item = qs(0x97447732)
	}
	{
		item = qs(0xf634d3d9)
	}
	{
		item = qs(0x4c5469d2)
	}
	{
		item = qs(0x6282a78b)
	}
	{
		title
		item = qs(0x2b2acf4b)
	}
	{
		item = qs(0x1b416852)
	}
	{
		title
		item = qs(0x5c2dab42)
	}
	{
		item = qs(0x66e6b016)
	}
	{
		title
		item = qs(0xd0ee6410)
	}
	{
		item = qs(0x135eb0d7)
	}
	{
		title
		item = qs(0xb660e2eb)
	}
	{
		item = qs(0x9ad0ccec)
	}
	{
		title
		item = qs(0xfe6e40ab)
	}
	{
		item = qs(0x09e18db7)
	}
	{
		item = qs(0xc4746407)
	}
	{
		item = qs(0xa57e926e)
	}
	{
		item = qs(0x5e1aa528)
	}
	{
		item = qs(0xfd6dae15)
	}
	{
		item = qs(0xce2aa8f8)
	}
	{
		item = qs(0x716abc0b)
	}
	{
		item = qs(0x0dc288cf)
	}
	{
		item = qs(0xf55a0d77)
	}
	{
		item = qs(0xc4a7a274)
	}
	{
		item = qs(0x5a0ea2ef)
	}
	{
		title
		item = qs(0x34b7fe48)
	}
	{
		item = qs(0x8eeff2c7)
	}
	{
		title
		item = qs(0x38b85cf4)
	}
	{
		item = qs(0x5b00d170)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x75afaf1c)
	}
	{
		title
		item = qs(0x647b0a2d)
	}
	{
		item = qs(0x1240d8bd)
	}
	{
		title
		item = qs(0xa183e773)
	}
	{
		item = qs(0x1b11af5f)
	}
	{
		title
		item = qs(0x34bf539b)
	}
	{
		item = qs(0x1dfce63e)
	}
	{
		title
		item = qs(0x444fecad)
	}
	{
		item = qs(0xd3a6894d)
	}
	{
		title
		item = qs(0x96aa3a44)
	}
	{
		item = qs(0x8bd13e03)
	}
	{
		item = qs(0x6912d8c9)
	}
	{
		item = qs(0x38a9880f)
	}
	{
		item = qs(0x1c033282)
	}
	{
		title
		item = qs(0x34bf539b)
	}
	{
		item = qs(0x44c02af6)
	}
	{
		title
		item = qs(0x444fecad)
	}
	{
		item = qs(0xd5f3882e)
	}
	{
		title
		item = qs(0x96aa3a44)
	}
	{
		item = qs(0xa3e729ea)
	}
	{
		item = qs(0x9a280fd9)
	}
	{
		item = qs(0x2d71e18d)
	}
	{
		item = qs(0xcc6fa81b)
	}
	{
		item = qs(0xd8a05013)
	}
	{
		item = qs(0x52f81a84)
	}
	{
		title
		item = qs(0x34bf539b)
	}
	{
		item = qs(0x94880a24)
	}
	{
		title
		item = qs(0x444fecad)
	}
	{
		item = qs(0xa2e1c665)
	}
	{
		title
		item = qs(0x96aa3a44)
	}
	{
		item = qs(0x3b2bacc1)
	}
	{
		item = qs(0xe210fcb9)
	}
	{
		item = qs(0x2aa4f72e)
	}
	{
		item = qs(0x0146061f)
	}
	{
		item = qs(0xda375374)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xad0f1bc1)
	}
	{
		title
		item = qs(0x2dbc7391)
	}
	{
		item = qs(0xfd187533)
	}
	{
		title
		item = qs(0x8230e5e8)
	}
	{
		item = qs(0xb17c73f4)
	}
	{
		title
		item = qs(0x0a10e967)
	}
	{
		item = qs(0x31545701)
	}
	{
		title
		item = qs(0x83be8d4f)
	}
	{
		item = qs(0x8d56a888)
	}
	{
		title
		item = qs(0x20b1e2b7)
	}
	{
		item = qs(0x98a7dadd)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xec48fc1c)
	}
	{
		title
		item = qs(0x9da8b2e0)
	}
	{
		item = qs(0x27925407)
	}
	{
		title
		item = qs(0x5bedb2bf)
	}
	{
		item = qs(0xaa5f4b2f)
	}
	{
		title
		item = qs(0xda8e782d)
	}
	{
		item = qs(0xe5cf3401)
	}
	{
		title
		item = qs(0xb169ae39)
	}
	{
		item = qs(0xacb75681)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xfe219200)
	}
	{
		title
		item = qs(0x40f24359)
	}
	{
		item = qs(0xdfecbd0a)
	}
	{
		title
		item = qs(0x2d590b50)
	}
	{
		item = qs(0x499bb37d)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xf9191d7d)
	}
	{
		title
		item = qs(0x27778a5a)
	}
	{
		item = qs(0xe3797dd4)
	}
	{
		title
		item = qs(0x14f4b510)
	}
	{
		item = qs(0xfb836824)
	}
	{
		title
		item = qs(0xef746942)
	}
	{
		item = qs(0xcced1fa7)
	}
	{
		title
		item = qs(0x1d39c8cd)
	}
	{
		item = qs(0x3199f037)
	}
	{
		item = qs(0x005fcdef)
	}
	{
		item = qs(0xda704bf4)
	}
	{
		item = qs(0x5e148c12)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x0ce2ef84)
	}
	{
		title
		item = qs(0xc1f52164)
	}
	{
		item = qs(0xb3dd43cd)
	}
	{
		title
		item = qs(0x4bcb5446)
	}
	{
		item = qs(0x1c4669ab)
	}
	{
		title
		item = qs(0x65e46730)
	}
	{
		item = qs(0xb21d8729)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x29a7871f)
	}
	{
		title
		item = qs(0xee6c85bd)
	}
	{
		item = qs(0xb7f57ddb)
	}
	{
		title
		item = qs(0x740fae8c)
	}
	{
		item = qs(0xfc614125)
	}
	{
		title
		item = qs(0x792bd188)
	}
	{
		item = qs(0xea7e6505)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xf7e8ab7d)
	}
	{
		title
		item = qs(0xdd2fdc9a)
	}
	{
		item = qs(0xc9aecf68)
	}
	{
		title
		item = qs(0x608b1604)
	}
	{
		item = qs(0x51d1b9c9)
	}
	{
		title
		item = qs(0x11f041d5)
	}
	{
		item = qs(0xcff4e72c)
	}
	{
		title
		item = qs(0x348d871c)
	}
	{
		item = qs(0xe74e9a38)
	}
	{
		item = qs(0x5a319993)
	}
	{
		item = qs(0x3642e57b)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x67eac432)
	}
	{
		title
		item = qs(0xf1f6db61)
	}
	{
		item = qs(0xc9aecf68)
	}
	{
		title
		item = qs(0x53458382)
	}
	{
		item = qs(0xb6d3ec98)
	}
	{
		title
		item = qs(0x5fb0eb9c)
	}
	{
		item = qs(0xd85e3387)
	}
	{
		item = qs(0xd6132103)
	}
	{
		title
		item = qs(0xa1a7282e)
	}
	{
		item = qs(0xddae41b2)
	}
	{
		title
		item = qs(0x9358a623)
	}
	{
		item = qs(0x0162b757)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x700dd815)
	}
	{
		title
		item = qs(0xda0f9ef3)
	}
	{
		item = qs(0x87cb064e)
	}
	{
		title
		item = qs(0x1c6657cd)
	}
	{
		item = qs(0xfe00276e)
	}
	{
		title
		item = qs(0x61bd6bf3)
	}
	{
		item = qs(0xe0b5885e)
	}
	{
		title
		item = qs(0xc132d668)
	}
	{
		item = qs(0xaf8e2b6e)
	}
	{
		title
		item = qs(0xd1e767a5)
	}
	{
		item = qs(0x867b8374)
	}
	{
		item = qs(0x4065a764)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xad17096e)
	}
	{
		title
		item = qs(0x210644cc)
	}
	{
		item = qs(0xf30cb4fb)
	}
	{
		title
		item = qs(0x947e900b)
	}
	{
		item = qs(0xa34c0114)
	}
	{
		title
		item = qs(0x5a5e93c5)
	}
	{
		item = qs(0x51ece770)
	}
	{
		title
		item = qs(0xad5c7249)
	}
	{
		item = qs(0xfaf958ab)
	}
	{
		title
		item = qs(0x6563d97d)
	}
	{
		item = qs(0x65021579)
	}
	{
		item = qs(0x6a2a42e2)
	}
	{
		item = qs(0x048aa56b)
	}
	{
		item = qs(0x8d29cc9e)
	}
	{
		item = qs(0x0e894a25)
	}
	{
		item = qs(0x1d653349)
	}
	{
		item = qs(0xdf8219c8)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x0cd5f89d)
	}
	{
		title
		item = qs(0x06d15f22)
	}
	{
		item = qs(0xdbc7e6f8)
	}
	{
		title
		item = qs(0xa1a60085)
	}
	{
		item = qs(0x82060dc9)
	}
	{
		title
		item = qs(0x8eee70f5)
	}
	{
		item = qs(0x0ea193f3)
	}
	{
		title
		item = qs(0x7e661be3)
	}
	{
		item = qs(0x2f4f8ac7)
	}
	{
		title
		item = qs(0x98f578c7)
	}
	{
		item = qs(0x0261b306)
	}
	{
		title
		item = qs(0xc9e2b523)
	}
	{
		item = qs(0x018a6066)
	}
	{
		title
		item = qs(0x2569e195)
	}
	{
		item = qs(0x3f385361)
	}
	{
		title
		item = qs(0x2c014aef)
	}
	{
		item = qs(0xde801f31)
	}
	{
		item = qs(0xabc4563a)
	}
	{
		item = qs(0xa06ce39d)
	}
	{
		item = qs(0xf4dd4633)
	}
	{
		item = qs(0xfbc74853)
	}
	{
		item = qs(0x05eeb355)
	}
	{
		item = qs(0x031e5e0c)
	}
	{
		title
		item = qs(0x52bc99bb)
	}
	{
		item = qs(0x06e82ed0)
	}
	{
		title
		item = qs(0xc41f27ce)
	}
	{
		item = qs(0x1f049d64)
	}
	{
		title
		item = qs(0x52e9517e)
	}
	{
		item = qs(0x903aff60)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xd73073d8)
	}
	{
		item = qs(0x1ce0f4a9)
	}
	{
		item = qs(0xfdbcfccd)
	}
	{
		item = qs(0x5973433f)
	}
	{
		item = qs(0x90057bc8)
	}
	{
		item = qs(0x091dcb66)
	}
	{
		item = qs(0x4e7eb811)
	}
	{
		item = qs(0xa248e406)
	}
	{
		item = qs(0x2b28eb29)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x1c6fca9f)
	}
	{
		heading
		item = qs(0xef7169a1)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x9330d6aa)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xfaf7c734)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x225e7e87)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x78daffd3)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x167687db)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x7422f088)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x73dbe900)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x4162b78c)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x21152deb)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xa56d174d)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x92957f1c)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x2430ae48)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x9330d6aa)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xd93cda2c)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x225e7e87)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x9c927dbf)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x9330d6aa)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x023b9c38)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x21152deb)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x496fec14)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x23fbd731)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x4e1be8af)
	}
	{
		item = qs(0x2f8af1d1)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x24c8d85f)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x258614e7)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x9330d6aa)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xee1fd6c3)
	}
	{
		item = qs(0x0777a0ae)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x9330d6aa)
	}
	{
		item = qs(0xf5a355ea)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x4541528f)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x21152deb)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x24488eed)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x9330d6aa)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x94aaf6b9)
	}
	{
		item = qs(0x2f8af1d1)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x24c8d85f)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xbb31ebeb)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x21152deb)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xcfd4589a)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x21152deb)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x3727d433)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x225e7e87)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x83ac9108)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x23fbd731)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x17bdf2e1)
	}
	{
		item = qs(0xcc962711)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x21152deb)
	}
	{
		item = qs(0x599a3591)
	}
	{
		item = qs(0x5422c02f)
	}
	{
		item = qs(0xd6dcc953)
	}
	{
		item = qs(0xdd20e6f5)
	}
	{
		item = qs(0x50bf8be5)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x4b56e78c)
	}
	{
		item = qs(0x2f8af1d1)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x24c8d85f)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xfd5a8416)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x225e7e87)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xb42adac4)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x9330d6aa)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x9a9f6b91)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x23fbd731)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x6fa7f4b1)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x92957f1c)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xe8741242)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x92957f1c)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xa55abe74)
	}
	{
		item = qs(0x8606fa2e)
	}
	{
		item = qs(0x943bb06c)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xeaef5b39)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x23fbd731)
	}
	{
		item = qs(0x524f924a)
	}
	{
		item = qs(0x8c3b1111)
	}
	{
		item = qs(0xe5657629)
	}
	{
		item = qs(0x782859f1)
	}
	{
		item = qs(0x6442b64a)
	}
	{
		item = qs(0x9d271794)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xe4e68cd1)
	}
	{
		item = qs(0x814beff6)
	}
	{
		item = qs(0x319ec06b)
	}
	{
		item = qs(0xd9d3dcf8)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x1a17150d)
	}
	{
		item = qs(0x8176d6d3)
	}
	{
		item = qs(0xd851fe82)
	}
	{
		item = qs(0x15b88557)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x2efb4aad)
	}
	{
		item = qs(0x6f513c96)
	}
	{
		item = qs(0x6cb9e256)
	}
	{
		item = qs(0xb903a896)
	}
	{
		item = qs(0x299d01c7)
	}
	{
		item = qs(0x2ba1aca5)
	}
	{
		item = qs(0x01a55979)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xd805d460)
	}
	{
		item = qs(0x3312d3e0)
	}
	{
		item = qs(0xbd310621)
	}
	{
		item = qs(0x5bed888a)
	}
	{
		item = qs(0x7c3e453c)
	}
	{
		item = qs(0xc79ae007)
	}
	{
		item = qs(0x0a832a56)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xa80ad134)
	}
	{
		item = qs(0x4a04a6a3)
	}
	{
		item = qs(0xe461767d)
	}
	{
		item = qs(0x028a995d)
	}
	{
		item = qs(0x299d01c7)
	}
	{
		item = qs(0x691ae803)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xef0b85e1)
	}
	{
		item = qs(0x07a0390c)
	}
	{
		item = qs(0x24092cc5)
	}
	{
		item = qs(0x5a5acce6)
	}
	{
		item = qs(0x5c0092e5)
	}
	{
		item = qs(0xd4d909f5)
	}
	{
		item = qs(0xa0106c2b)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x4d439e47)
	}
	{
		item = qs(0xc7bee3aa)
	}
	{
		item = qs(0x8001ef15)
	}
	{
		item = qs(0xf23b5fa8)
	}
	{
		item = qs(0x99c2108f)
	}
	{
		item = qs(0x2cd0701a)
	}
	{
		item = qs(0x8767f75b)
	}
	{
		item = qs(0x9a4dc6e5)
	}
	{
		item = qs(0x3200f572)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x320c96cb)
	}
	{
		item = qs(0x99aa0f77)
	}
	{
		item = qs(0x40a4d140)
	}
	{
		item = qs(0xc57f0082)
	}
	{
		item = qs(0x9be93133)
	}
	{
		item = qs(0x6f2e8720)
	}
	{
		item = qs(0x66353262)
	}
	{
		item = qs(0x1eb01b3b)
	}
	{
		item = qs(0xf45c2afb)
	}
	{
		item = qs(0x5adaccba)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xbba449ac)
	}
	{
		item = qs(0x065ef095)
	}
	{
		item = qs(0x16779a46)
	}
	{
		item = qs(0x0d958bc2)
	}
	{
		item = qs(0xc40c88c5)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x02862a71)
	}
	{
		item = qs(0xfc02d20d)
	}
	{
		item = qs(0x68664abd)
	}
	{
		item = qs(0xa6c0f84a)
	}
	{
		item = qs(0x7c3e453c)
	}
	{
		item = qs(0x56b2c23d)
	}
	{
		item = qs(0xc1bdb528)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x0a1dcfca)
	}
	{
		item = qs(0xbbd758d0)
	}
	{
		item = qs(0x3d9b89cb)
	}
	{
		item = qs(0x9bc58d4e)
	}
	{
		item = qs(0x8eb03106)
	}
	{
		item = qs(0x299d01c7)
	}
	{
		item = qs(0xa925977f)
	}
	{
		item = qs(0xba5b98bd)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x13800dc2)
	}
	{
		item = qs(0xee40c345)
	}
	{
		item = qs(0x03edd1ed)
	}
	{
		item = qs(0xe54a5be1)
	}
	{
		item = qs(0xa6ce2568)
	}
	{
		item = qs(0x2ba1aca5)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xaa1ac57b)
	}
	{
		item = qs(0x51aabda6)
	}
	{
		item = qs(0x3201214e)
	}
	{
		item = qs(0xb5d6a0e2)
	}
	{
		item = qs(0x273e1053)
	}
	{
		item = qs(0xf9221041)
	}
	{
		item = qs(0xaaaa3629)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x4adf5e48)
	}
	{
		item = qs(0xdec15ef2)
	}
	{
		item = qs(0x1c4c5590)
	}
	{
		item = qs(0x6695aab8)
	}
	{
		item = qs(0x7c3e453c)
	}
	{
		item = qs(0x4f716c68)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x0fc271a4)
	}
	{
		item = qs(0x51468ee7)
	}
	{
		item = qs(0xe54a5be1)
	}
	{
		item = qs(0x83bd8bb4)
	}
	{
		item = qs(0x71657520)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x2e3517c8)
	}
	{
		item = qs(0x0ff0fff4)
	}
	{
		item = qs(0x308f7dcb)
	}
	{
		item = qs(0x57ea2a30)
	}
	{
		item = qs(0xe71e3304)
	}
	{
		item = qs(0x9a4dc6e5)
	}
	{
		item = qs(0x570750cd)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x6fbe7936)
	}
	{
		item = qs(0xfea488e9)
	}
	{
		item = qs(0x6d5c379a)
	}
	{
		item = qs(0x42973079)
	}
	{
		item = qs(0x8eb03106)
	}
	{
		item = qs(0x299d01c7)
	}
	{
		item = qs(0xc3c42066)
	}
	{
		item = qs(0x771d8acc)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x107e970e)
	}
	{
		item = qs(0x1aec5089)
	}
	{
		item = qs(0xbb8c8fc7)
	}
	{
		item = qs(0x980fde1a)
	}
	{
		item = qs(0x83bd8bb4)
	}
	{
		item = qs(0x4a0c3372)
	}
	{
		item = qs(0x4631d46a)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x41c76a8e)
	}
	{
		item = qs(0x5881addd)
	}
	{
		item = qs(0x54e66a9c)
	}
	{
		item = qs(0x5510338d)
	}
	{
		item = qs(0xdb857a0d)
	}
	{
		item = qs(0xe2724bf5)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x46e45af7)
	}
	{
		item = qs(0xf7223b6f)
	}
	{
		item = qs(0xf4e6a0fc)
	}
	{
		item = qs(0x028a995d)
	}
	{
		item = qs(0x299d01c7)
	}
	{
		item = qs(0x9617f67b)
	}
	{
		item = qs(0x53c0aa68)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x744a0733)
	}
	{
		item = qs(0xb6c6b322)
	}
	{
		item = qs(0xbfce160f)
	}
	{
		item = qs(0x9940703c)
	}
	{
		item = qs(0x5bed888a)
	}
	{
		item = qs(0x7c3e453c)
	}
	{
		item = qs(0xd2811fc2)
	}
	{
		item = qs(0x4e6d40e0)
	}
	{
		item = qs(0xf1f4a8d0)
	}
	{
		item = qs(0x15b88557)
	}
	{
		emptyspace
	}
	{
		item = qs(0xd0837872)
	}
	{
		item = qs(0x80ece4c4)
	}
	{
		item = qs(0x36d9b5f0)
	}
	{
		item = qs(0x479974dd)
	}
	{
		item = qs(0x80e2e3d2)
	}
	{
		item = qs(0xcd4967bb)
	}
	{
		item = qs(0xd2dbafb6)
	}
	{
		item = qs(0x1a07131f)
	}
	{
		item = qs(0xdd11e473)
	}
	{
		item = qs(0x1f19694a)
	}
	{
		item = qs(0x7756cf73)
	}
	{
		item = qs(0x30094272)
	}
	{
		item = qs(0xd80b2b71)
	}
	{
		item = qs(0x2d543aa2)
	}
	{
		emptyspace
	}
	{
		item = qs(0x32040f40)
	}
	{
		item = qs(0x84a1c6d6)
	}
	{
		item = qs(0x7cc5acc4)
	}
	{
		item = qs(0xc371b921)
	}
	{
		item = qs(0x87e95500)
	}
	{
		item = qs(0xdbabde06)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
]
