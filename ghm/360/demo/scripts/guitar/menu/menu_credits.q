credits_menu_font = fontgrid_text_a6
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
	endif
	pushassetcontext \{context = z_icecave}
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
		printf \{qs(0xb58d18b7)}
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
		text = (($credits [<i>]).item)
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
		font = fontgrid_text_a6
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
		<color_head> = [220 220 220 255]
		<scale_body> = 0.65000004
		<color_body> = [200 200 200 255]
		<scale_title> = 0.65000004
		<color_title> = [220 220 220 255]
	else
		<rate> = 380.0
		<screen_height> = 690
		<scale_head> = 0.75
		<color_head> = [149 48 48 255]
		<scale_body> = 0.65000004
		<color_body> = [30 30 30 255]
		<scale_title> = 0.65000004
		<color_title> = [149 48 48 255]
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
		<base_pos> = ((0.0, 380.0) + ((1.0, 0.0) * <screen_width>))
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
		title
		item = qs(0x3c507e8b)
	}
	{
		heading
		item = qs(0x868db38d)
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
		emptyspace
	}
	{
		heading
		item = qs(0x58858026)
	}
	{
		item = qs(0x0219f09e)
	}
	{
		item = qs(0x4c56a2b8)
	}
	{
		item = qs(0x0bf57165)
	}
	{
		item = qs(0x0acbc6fe)
	}
	{
		item = qs(0xc678c1ad)
	}
	{
		item = qs(0xf4dd6ef1)
	}
	{
		item = qs(0xb7ce45f7)
	}
	{
		item = qs(0x9b8f13fb)
	}
	{
		item = qs(0xa37cf8a8)
	}
	{
		item = qs(0xab0141ff)
	}
	{
		item = qs(0x423d9e4e)
	}
	{
		item = qs(0xda220db7)
	}
	{
		item = qs(0xf5f756e2)
	}
	{
		item = qs(0xbb20745b)
	}
	{
		item = qs(0x0a828019)
	}
	{
		item = qs(0xc3eba2df)
	}
	{
		item = qs(0xd4ac023c)
	}
	{
		item = qs(0x14238a5c)
	}
	{
		item = qs(0x255cac94)
	}
	{
		item = qs(0xcf81dc04)
	}
	{
		item = qs(0x6beaa7cd)
	}
	{
		item = qs(0x264baeb0)
	}
	{
		item = qs(0x0b383197)
	}
	{
		item = qs(0xea3cc137)
	}
	{
		item = qs(0x3913d41f)
	}
	{
		item = qs(0x40128016)
	}
	{
		item = qs(0x51315401)
	}
	{
		item = qs(0xab172152)
	}
	{
		item = qs(0x51d3a0a6)
	}
	{
		item = qs(0x589ee749)
	}
	{
		item = qs(0xd32b085c)
	}
	{
		item = qs(0x0d1b92f4)
	}
	{
		item = qs(0x99330c81)
	}
	{
		item = qs(0x54352214)
	}
	{
		item = qs(0xb4bcf561)
	}
	{
		item = qs(0x19da93cf)
	}
	{
		item = qs(0xf9844ffb)
	}
	{
		item = qs(0x4083665c)
	}
	{
		item = qs(0x8482f3af)
	}
	{
		item = qs(0x3603edfb)
	}
	{
		item = qs(0xedeb99cb)
	}
	{
		item = qs(0xe833a1ac)
	}
	{
		item = qs(0xa959dc45)
	}
	{
		item = qs(0xd2e882f0)
	}
	{
		heading
		item = qs(0x458e3979)
	}
	{
		item = qs(0x710a877d)
	}
	{
		heading
		item = qs(0xa1e48a6e)
	}
	{
		item = qs(0x05004496)
	}
	{
		item = qs(0x152d8e82)
	}
	{
		item = qs(0xa49a0d43)
	}
	{
		item = qs(0x2d21101c)
	}
	{
		item = qs(0xdc916f52)
	}
	{
		item = qs(0x8527dbb1)
	}
	{
		item = qs(0x8cc99ae8)
	}
	{
		item = qs(0x108fd104)
	}
	{
		item = qs(0x99a2f94a)
	}
	{
		item = qs(0x8300bca6)
	}
	{
		item = qs(0xaee41748)
	}
	{
		heading
		item = qs(0x3cb1c7be)
	}
	{
		item = qs(0xbacce7b4)
	}
	{
		item = qs(0x6d032bfc)
	}
	{
		heading
		item = qs(0xf6c146f1)
	}
	{
		item = qs(0x6eef7297)
	}
	{
		item = qs(0xe9eb877d)
	}
	{
		heading
		item = qs(0xf424ffa9)
	}
	{
		item = qs(0x6ce84a73)
	}
	{
		item = qs(0x221a3137)
	}
	{
		heading
		item = qs(0x55e515b4)
	}
	{
		heading
		item = qs(0x502cfec0)
	}
	{
		item = qs(0x07136b14)
	}
	{
		heading
		item = qs(0xe5695afa)
	}
	{
		item = qs(0x1b040a7b)
	}
	{
		heading
		item = qs(0xc5662e50)
	}
	{
		item = qs(0x608159d8)
	}
	{
		heading
		item = qs(0x216c1be2)
	}
	{
		item = qs(0x11992603)
	}
	{
		heading
		item = qs(0x2c858e5a)
	}
	{
		item = qs(0x6b4a4ff0)
	}
	{
		heading
		item = qs(0xd0f33797)
	}
	{
		item = qs(0xb4b2cab1)
	}
	{
		heading
		item = qs(0xb019c932)
	}
	{
		item = qs(0xbb908bff)
	}
	{
		heading
		item = qs(0x98f6197c)
	}
	{
		heading
		item = qs(0xbf749573)
	}
	{
		heading
		item = qs(0x758ede6a)
	}
	{
		heading
		item = qs(0xc7052c58)
	}
	{
		heading
		item = qs(0xc93a68d8)
	}
	{
		heading
		item = qs(0x74661d31)
	}
	{
		heading
		item = qs(0x0a030e88)
	}
	{
		item = qs(0xadf2ed4c)
	}
	{
		item = qs(0x703a137c)
	}
	{
		item = qs(0x66194427)
	}
	{
		item = qs(0x8d713d33)
	}
	{
		item = qs(0x08534fe0)
	}
	{
		item = qs(0xb0abfd73)
	}
	{
		item = qs(0xad60f8f0)
	}
	{
		item = qs(0x75031640)
	}
	{
		item = qs(0x76ce3d39)
	}
	{
		item = qs(0x2c64fd31)
	}
	{
		heading
		item = qs(0xd09f8811)
	}
	{
		item = qs(0x46db982d)
	}
	{
		item = qs(0xc890fe6a)
	}
	{
		item = qs(0xf61079ef)
	}
	{
		item = qs(0xc22ae49c)
	}
	{
		item = qs(0x9a839b54)
	}
	{
		heading
		item = qs(0x4bbb0da3)
	}
	{
		item = qs(0x971aa698)
	}
	{
		item = qs(0x270f2625)
	}
	{
		item = qs(0xfb090c77)
	}
	{
		item = qs(0x268c660f)
	}
	{
		item = qs(0xf10b68c9)
	}
	{
		item = qs(0x94f09cc9)
	}
	{
		item = qs(0x95153bbb)
	}
	{
		item = qs(0xff86dd66)
	}
	{
		heading
		item = qs(0xe66ec149)
	}
	{
		item = qs(0x0c07888d)
	}
	{
		item = qs(0xd5e3729a)
	}
	{
		item = qs(0x1f332094)
	}
	{
		item = qs(0x6dffc59d)
	}
	{
		heading
		item = qs(0x894c374a)
	}
	{
		item = qs(0x4a3abcdf)
	}
	{
		item = qs(0x699a2e0c)
	}
	{
		item = qs(0x4951538b)
	}
	{
		item = qs(0xf04e2acf)
	}
	{
		item = qs(0x3c442f07)
	}
	{
		item = qs(0xb8f24072)
	}
	{
		heading
		item = qs(0xafc5b578)
	}
	{
		item = qs(0x339e59a4)
	}
	{
		item = qs(0x02fd56a7)
	}
	{
		item = qs(0x264564e6)
	}
	{
		item = qs(0xfc612323)
	}
	{
		item = qs(0x05a42813)
	}
	{
		item = qs(0x80c405b9)
	}
	{
		heading
		item = qs(0xa7cf531d)
	}
	{
		item = qs(0x608ab445)
	}
	{
		item = qs(0x190e8ed3)
	}
	{
		item = qs(0x3b9c9048)
	}
	{
		heading
		item = qs(0xd0325e23)
	}
	{
		item = qs(0x8ead72b3)
	}
	{
		item = qs(0x81581593)
	}
	{
		item = qs(0x683bac6c)
	}
	{
		item = qs(0xda85a0f6)
	}
	{
		item = qs(0x895d4da2)
	}
	{
		item = qs(0xd79ea5af)
	}
	{
		item = qs(0x85795507)
	}
	{
		item = qs(0x4374bbbe)
	}
	{
		item = qs(0x47e209d1)
	}
	{
		item = qs(0x2f03a224)
	}
	{
		heading
		item = qs(0x4a8ca6c7)
	}
	{
		item = qs(0x906ef1ba)
	}
	{
		item = qs(0x1532141c)
	}
	{
		item = qs(0xcbe15b86)
	}
	{
		item = qs(0x54b1e346)
	}
	{
		item = qs(0x3a157990)
	}
	{
		item = qs(0xcead8e6c)
	}
	{
		item = qs(0x74c70655)
	}
	{
		item = qs(0x0d008208)
	}
	{
		heading
		item = qs(0xe56b344f)
	}
	{
		item = qs(0x67b2ea57)
	}
	{
		item = qs(0xb356aca2)
	}
	{
		item = qs(0x9adc0edd)
	}
	{
		item = qs(0xc8109eb0)
	}
	{
		item = qs(0x95de7721)
	}
	{
		item = qs(0xfa1d0a2f)
	}
	{
		item = qs(0xf34775f5)
	}
	{
		heading
		item = qs(0x386778cc)
	}
	{
		item = qs(0xe39e7230)
	}
	{
		heading
		item = qs(0x721d0f75)
	}
	{
		item = qs(0xba9496e1)
	}
	{
		item = qs(0xd60efc72)
	}
	{
		item = qs(0xd26aa01e)
	}
	{
		item = qs(0x1010346f)
	}
	{
		item = qs(0xefb4553e)
	}
	{
		item = qs(0x87aeae99)
	}
	{
		heading
		item = qs(0xd5be6cc0)
	}
	{
		item = qs(0x18261268)
	}
	{
		item = qs(0x3021a6ae)
	}
	{
		item = qs(0x47b187eb)
	}
	{
		item = qs(0x8e100471)
	}
	{
		item = qs(0x9904659d)
	}
	{
		item = qs(0xaec3b89b)
	}
	{
		item = qs(0x9935cd27)
	}
	{
		item = qs(0xf04cf30c)
	}
	{
		item = qs(0x0dba21a2)
	}
	{
		item = qs(0x3edc45d7)
	}
	{
		item = qs(0x548214fb)
	}
	{
		item = qs(0xa2bd845d)
	}
	{
		item = qs(0xa60f9116)
	}
	{
		item = qs(0xbc8ea17b)
	}
	{
		item = qs(0x3769bdf0)
	}
	{
		item = qs(0x9daf6c4e)
	}
	{
		item = qs(0x43805ee8)
	}
	{
		heading
		item = qs(0x8f981bd3)
	}
	{
		item = qs(0xf2aa26ff)
	}
	{
		heading
		item = qs(0xd1f03d27)
	}
	{
		item = qs(0x10cf83b3)
	}
	{
		item = qs(0x938299a8)
	}
	{
		item = qs(0xb03b9ae8)
	}
	{
		item = qs(0xfead43fe)
	}
	{
		item = qs(0x7552abba)
	}
	{
		item = qs(0xca623d44)
	}
	{
		item = qs(0x7b6dc123)
	}
	{
		heading
		item = qs(0x5693ea98)
	}
	{
		item = qs(0x02688910)
	}
	{
		item = qs(0xaf634fb4)
	}
	{
		heading
		item = qs(0x39a29dd8)
	}
	{
		item = qs(0x588459ec)
	}
	{
		item = qs(0x8a206ca6)
	}
	{
		item = qs(0x208ed917)
	}
	{
		item = qs(0x32e34cfc)
	}
	{
		item = qs(0xb75beaaf)
	}
	{
		item = qs(0xc3b79a81)
	}
	{
		item = qs(0xc68bfc75)
	}
	{
		item = qs(0x4ca516b6)
	}
	{
		item = qs(0xe179c8bd)
	}
	{
		item = qs(0xfc4c1e60)
	}
	{
		item = qs(0x8a06866c)
	}
	{
		item = qs(0x015cfcff)
	}
	{
		item = qs(0xa52bee13)
	}
	{
		item = qs(0xf0acbc02)
	}
	{
		item = qs(0x71d0af61)
	}
	{
		item = qs(0x36dbc421)
	}
	{
		item = qs(0xe25e521f)
	}
	{
		item = qs(0x11314d2a)
	}
	{
		item = qs(0x90d7b581)
	}
	{
		item = qs(0x64fe0722)
	}
	{
		item = qs(0x304defe2)
	}
	{
		item = qs(0xec7d611f)
	}
	{
		item = qs(0x45759d88)
	}
	{
		item = qs(0xfdaa7dcb)
	}
	{
		item = qs(0x28d5afb4)
	}
	{
		item = qs(0xac92cb2e)
	}
	{
		item = qs(0x43e46125)
	}
	{
		item = qs(0x9c7b8411)
	}
	{
		item = qs(0x8930ec03)
	}
	{
		item = qs(0x6c43c45b)
	}
	{
		item = qs(0xb48d8c43)
	}
	{
		item = qs(0x0f2393bd)
	}
	{
		item = qs(0x989a6fc1)
	}
	{
		item = qs(0x93aea83a)
	}
	{
		item = qs(0x8ff40a03)
	}
	{
		item = qs(0x549fc11d)
	}
	{
		item = qs(0xb706e347)
	}
	{
		item = qs(0x93a393ad)
	}
	{
		heading
		item = qs(0xa9c7a812)
	}
	{
		item = qs(0xe4926c63)
	}
	{
		item = qs(0x5468e18f)
	}
	{
		item = qs(0xf9398f0a)
	}
	{
		item = qs(0x90ae6c56)
	}
	{
		item = qs(0xa33c7dd2)
	}
	{
		item = qs(0xdcfe1878)
	}
	{
		item = qs(0xf68c6f96)
	}
	{
		item = qs(0xfc6172a1)
	}
	{
		item = qs(0xfd8ae8ed)
	}
	{
		item = qs(0x5b355643)
	}
	{
		item = qs(0x6c6f443d)
	}
	{
		item = qs(0x565bd658)
	}
	{
		item = qs(0x7196877a)
	}
	{
		heading
		item = qs(0x6da38be8)
	}
	{
		item = qs(0x99e49179)
	}
	{
		item = qs(0xd0fadac1)
	}
	{
		item = qs(0x870b4741)
	}
	{
		heading
		item = qs(0x05f70cf2)
	}
	{
		item = qs(0xf9d57b74)
	}
	{
		item = qs(0x184ca631)
	}
	{
		item = qs(0x4a8a4887)
	}
	{
		item = qs(0xc5907a6c)
	}
	{
		item = qs(0x3f9fd97a)
	}
	{
		item = qs(0x76037d55)
	}
	{
		heading
		item = qs(0xedc6fdb6)
	}
	{
		item = qs(0xd7cb824c)
	}
	{
		item = qs(0xfa0affa8)
	}
	{
		heading
		item = qs(0x98dbb6d6)
	}
	{
		item = qs(0xd072f2e7)
	}
	{
		heading
		item = qs(0x54d0eb4b)
	}
	{
		item = qs(0x5aa92252)
	}
	{
		item = qs(0x035f13b0)
	}
	{
		item = qs(0x28171ddb)
	}
	{
		item = qs(0xa50beca6)
	}
	{
		item = qs(0xccefdb80)
	}
	{
		item = qs(0x4f4ddb77)
	}
	{
		heading
		item = qs(0xb45c800b)
	}
	{
		item = qs(0xfd778fcd)
	}
	{
		item = qs(0x44052ce5)
	}
	{
		item = qs(0x71eb32b4)
	}
	{
		item = qs(0xd6d23d71)
	}
	{
		heading
		item = qs(0xdf6b1f76)
	}
	{
		item = qs(0x0753adac)
	}
	{
		item = qs(0x70713fef)
	}
	{
		heading
		item = qs(0x43694413)
	}
	{
		item = qs(0x129b3aac)
	}
	{
		item = qs(0x1c908c08)
	}
	{
		item = qs(0x92d2466b)
	}
	{
		heading
		item = qs(0x14e7e030)
	}
	{
		item = qs(0x7872ac5a)
	}
	{
		item = qs(0x35e8d7e7)
	}
	{
		item = qs(0x69fab07f)
	}
	{
		item = qs(0x47c11621)
	}
	{
		item = qs(0x36df25ac)
	}
	{
		item = qs(0x763f9f89)
	}
	{
		item = qs(0xdaa6968a)
	}
	{
		item = qs(0x47cc06a4)
	}
	{
		item = qs(0x2d69f99e)
	}
	{
		item = qs(0xd678df8f)
	}
	{
		item = qs(0xa5de6343)
	}
	{
		item = qs(0x0592dc4d)
	}
	{
		item = qs(0xc82c1639)
	}
	{
		item = qs(0x3ab2316b)
	}
	{
		item = qs(0x2da9c932)
	}
	{
		item = qs(0xf58091ea)
	}
	{
		item = qs(0xb8feb3fd)
	}
	{
		item = qs(0x0590c142)
	}
	{
		item = qs(0x32319c8d)
	}
	{
		heading
		item = qs(0xea196508)
	}
	{
		item = qs(0xb78382fb)
	}
	{
		item = qs(0xdddb30bf)
	}
	{
		item = qs(0x2891632f)
	}
	{
		item = qs(0x888383ef)
	}
	{
		item = qs(0xd32bcb0a)
	}
	{
		heading
		item = qs(0x59dc6dff)
	}
	{
		item = qs(0x52d9dfb9)
	}
	{
		item = qs(0x45f5a29b)
	}
	{
		item = qs(0x0cfdd183)
	}
	{
		item = qs(0xcdca68bf)
	}
	{
		item = qs(0x3d1055b3)
	}
	{
		item = qs(0xa93a80e7)
	}
	{
		item = qs(0xcc90813f)
	}
	{
		item = qs(0x11a8cbb0)
	}
	{
		heading
		item = qs(0xa8c17f6d)
	}
	{
		heading
		item = qs(0xbf2ccef7)
	}
	{
		item = qs(0x74663f7f)
	}
	{
		heading
		item = qs(0xa7894564)
	}
	{
		item = qs(0x55c55c30)
	}
	{
		item = qs(0x2e8e3ef8)
	}
	{
		heading
		item = qs(0xd67bccf1)
	}
	{
		item = qs(0xd9b78d83)
	}
	{
		item = qs(0xb09ef300)
	}
	{
		heading
		item = qs(0x46bba59c)
	}
	{
		item = qs(0x739d7d9f)
	}
	{
		item = qs(0xffdb5b54)
	}
	{
		heading
		item = qs(0xd02432d1)
	}
	{
		item = qs(0xf6c0538b)
	}
	{
		item = qs(0x971ab74e)
	}
	{
		heading
		item = qs(0x6a238de4)
	}
	{
		item = qs(0x932e2ce1)
	}
	{
		item = qs(0x0334010e)
	}
	{
		heading
		item = qs(0x80a6bd70)
	}
	{
		item = qs(0x643f0682)
	}
	{
		item = qs(0x38e31c12)
	}
	{
		heading
		item = qs(0x48c56eaf)
	}
	{
		item = qs(0x1a92bb1c)
	}
	{
		item = qs(0x5f2aa389)
	}
	{
		heading
		item = qs(0x4b927c0a)
	}
	{
		item = qs(0x787a7cda)
	}
	{
		item = qs(0xb09ef300)
	}
	{
		heading
		item = qs(0x226ce299)
	}
	{
		item = qs(0x64f379eb)
	}
	{
		item = qs(0xbd07784f)
	}
	{
		heading
		item = qs(0xa4052257)
	}
	{
		item = qs(0x787a7cda)
	}
	{
		item = qs(0xb09ef300)
	}
	{
		heading
		item = qs(0x852f9e17)
	}
	{
		item = qs(0x08314e9a)
	}
	{
		item = qs(0x2b69a0f6)
	}
	{
		heading
		item = qs(0x4e8148bb)
	}
	{
		item = qs(0xb23d1262)
	}
	{
		item = qs(0x12b9e44e)
	}
	{
		heading
		item = qs(0xda885c09)
	}
	{
		item = qs(0x6fbb71d0)
	}
	{
		item = qs(0x5951dab2)
	}
	{
		heading
		item = qs(0x57ec9a49)
	}
	{
		item = qs(0x6fbb71d0)
	}
	{
		item = qs(0xf33dabe4)
	}
	{
		heading
		item = qs(0x7bb967a8)
	}
	{
		item = qs(0x4b8ffa93)
	}
	{
		item = qs(0xc495f2a6)
	}
	{
		heading
		item = qs(0x161c6ebc)
	}
	{
		item = qs(0xbc9cf1c8)
	}
	{
		item = qs(0x76dbb37f)
	}
	{
		heading
		item = qs(0x13162dfd)
	}
	{
		item = qs(0x462206d9)
	}
	{
		item = qs(0xbd07784f)
	}
	{
		heading
		item = qs(0x8a6ebb2d)
	}
	{
		item = qs(0x339d667d)
	}
	{
		item = qs(0xbd07784f)
	}
	{
		heading
		item = qs(0x2b55afb4)
	}
	{
		item = qs(0x511a3d29)
	}
	{
		item = qs(0xbd07784f)
	}
	{
		heading
		item = qs(0x4f849870)
	}
	{
		item = qs(0x02a574b6)
	}
	{
		item = qs(0x06d16cbc)
	}
	{
		heading
		item = qs(0x2970a7bc)
	}
	{
		item = qs(0x6fbb71d0)
	}
	{
		item = qs(0x02772469)
	}
	{
		heading
		item = qs(0x5deb98e9)
	}
	{
		item = qs(0x958e9ab7)
	}
	{
		item = qs(0x1f4915db)
	}
	{
		heading
		item = qs(0x2141dd32)
	}
	{
		item = qs(0x9ad8cae1)
	}
	{
		item = qs(0x2cd2172d)
	}
	{
		heading
		item = qs(0x31f5d0a7)
	}
	{
		item = qs(0x6fbb71d0)
	}
	{
		item = qs(0xd1db22ff)
	}
	{
		heading
		item = qs(0x43169ac3)
	}
	{
		item = qs(0x64f379eb)
	}
	{
		item = qs(0xa18a0237)
	}
	{
		heading
		item = qs(0x91045b69)
	}
	{
		item = qs(0xebc6dc96)
	}
	{
		item = qs(0x83b38521)
	}
	{
		heading
		item = qs(0x81737952)
	}
	{
		item = qs(0x323dca2e)
	}
	{
		item = qs(0x976db863)
	}
	{
		item = qs(0x455db207)
	}
	{
		heading
		item = qs(0x85f08518)
	}
	{
		item = qs(0xde1a424f)
	}
	{
		heading
		item = qs(0x915adff5)
	}
	{
		item = qs(0xaeda44d9)
	}
	{
		item = qs(0x7bd3fe0f)
	}
	{
		item = qs(0x20c5ee79)
	}
	{
		heading
		item = qs(0x02453371)
	}
	{
		item = qs(0x787a7cda)
	}
	{
		item = qs(0xb09ef300)
	}
	{
		heading
		item = qs(0x7c9a8f99)
	}
	{
		item = qs(0x9ad8cae1)
	}
	{
		item = qs(0xa0347186)
	}
	{
		heading
		item = qs(0x08c334cf)
	}
	{
		item = qs(0x9ad8cae1)
	}
	{
		item = qs(0x400e4d9d)
	}
	{
		heading
		item = qs(0x392c6877)
	}
	{
		item = qs(0x2a3cbaf5)
	}
	{
		heading
		item = qs(0xb07c0d96)
	}
	{
		item = qs(0x339d667d)
	}
	{
		item = qs(0xa18a0237)
	}
	{
		heading
		item = qs(0x1db89891)
	}
	{
		item = qs(0x9ad8cae1)
	}
	{
		item = qs(0x5951dab2)
	}
	{
		heading
		item = qs(0x4c133c18)
	}
	{
		item = qs(0x9ad8cae1)
	}
	{
		item = qs(0x400e4d9d)
	}
	{
		heading
		item = qs(0xb6fedde2)
	}
	{
		item = qs(0x9ad8cae1)
	}
	{
		item = qs(0x9fe1f154)
	}
	{
		heading
		item = qs(0x252ef578)
	}
	{
		item = qs(0xeb07b77c)
	}
	{
		item = qs(0xc0b02d8b)
	}
	{
		heading
		item = qs(0x50b53f54)
	}
	{
		item = qs(0x5b0ae741)
	}
	{
		item = qs(0x8be40cb0)
	}
	{
		heading
		item = qs(0xf1c0f500)
	}
	{
		item = qs(0x787a7cda)
	}
	{
		item = qs(0xb09ef300)
	}
	{
		heading
		item = qs(0x38a11445)
	}
	{
		item = qs(0x787a7cda)
	}
	{
		item = qs(0xb09ef300)
	}
	{
		heading
		item = qs(0xb671453a)
	}
	{
		item = qs(0x787a7cda)
	}
	{
		item = qs(0xb09ef300)
	}
	{
		heading
		item = qs(0xdc1d89c0)
	}
	{
		item = qs(0xc1a081ca)
	}
	{
		heading
		item = qs(0x1e008e4d)
	}
	{
		item = qs(0xa37bddb4)
	}
	{
		item = qs(0xd1a370ab)
	}
	{
		heading
		item = qs(0x5484233a)
	}
	{
		item = qs(0x787a7cda)
	}
	{
		item = qs(0xb09ef300)
	}
	{
		heading
		item = qs(0x013aaafd)
	}
	{
		item = qs(0x787a7cda)
	}
	{
		item = qs(0xb09ef300)
	}
	{
		heading
		item = qs(0x98d7a196)
	}
	{
		item = qs(0x787a7cda)
	}
	{
		item = qs(0xb09ef300)
	}
	{
		heading
		item = qs(0x57827cc1)
	}
	{
		item = qs(0x9ad8cae1)
	}
	{
		item = qs(0x5951dab2)
	}
	{
		heading
		item = qs(0xd6b4d6c9)
	}
	{
		item = qs(0x6fbb71d0)
	}
	{
		item = qs(0xa18a0237)
	}
	{
		heading
		item = qs(0x1973e105)
	}
	{
		item = qs(0x6fbb71d0)
	}
	{
		item = qs(0x5059f1ec)
	}
	{
		heading
		item = qs(0x4aa8ac52)
	}
	{
		item = qs(0x787a7cda)
	}
	{
		item = qs(0xb09ef300)
	}
	{
		heading
		item = qs(0x0e881c7b)
	}
	{
		item = qs(0x07cef62a)
	}
	{
		item = qs(0xeb93984f)
	}
	{
		heading
		item = qs(0xd31f0770)
	}
	{
		item = qs(0xfc24239a)
	}
	{
		item = qs(0x0c5a723e)
	}
	{
		heading
		item = qs(0x6a43f2d4)
	}
	{
		item = qs(0x65083267)
	}
	{
		heading
		item = qs(0xa9e1079c)
	}
	{
		item = qs(0xa58472f4)
	}
	{
		heading
		item = qs(0x4f783a30)
	}
	{
		item = qs(0x11e4363e)
	}
	{
		item = qs(0x516064b4)
	}
	{
		heading
		item = qs(0xe523f35a)
	}
	{
		item = qs(0x6fbb71d0)
	}
	{
		item = qs(0x452dcd7e)
	}
	{
		heading
		item = qs(0x9ae4236a)
	}
	{
		item = qs(0x9ad8cae1)
	}
	{
		item = qs(0x5059f1ec)
	}
	{
		heading
		item = qs(0xee8d5dc3)
	}
	{
		item = qs(0x9ad8cae1)
	}
	{
		item = qs(0x128a00f5)
	}
	{
		item = qs(0x8848d3eb)
	}
	{
		item = qs(0x32e5b7ce)
	}
	{
		item = qs(0x98cb7681)
	}
]
