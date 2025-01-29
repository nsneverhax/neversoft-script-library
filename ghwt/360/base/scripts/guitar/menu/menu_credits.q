credits_menu_font = fontgrid_text_a8
credits_menu_scroll = horizontal

script ui_create_end_credits 
	printf \{'ui_create_end_credits'}
	SpawnScriptNow ui_create_end_credits_spawned params = {<...>}
endscript

script ui_create_end_credits_spawned 
	kill_gem_scroller
	Progression_EndCredits
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
		Change \{current_level = load_z_credits}
		Load_Venue \{async = 1}
		destroy_loading_screen
	endif
	PushAssetContext \{context = z_credits}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = credits_backdrop_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if NOT ($end_credits = 1)
		CreateScreenElement \{Type = SpriteElement
			id = credits_backdrop
			parent = credits_backdrop_container
			texture = credits_bg
			rgba = [
				255
				255
				255
				255
			]
			Pos = (640.0, 360.0)
			dims = (2560.0, 720.0)
			just = [
				center
				center
			]
			z_priority = 0
			alpha = 1}
	endif
	TileSprite \{parent = credits_backdrop_container
		texture = credits_bg
		tile_dims = (5120.0, 720.0)
		dims = (2560.0, 720.0)
		Pos = (-2560.0, 0.0)}
	RunScriptOnScreenElement TileSpriteLoop id = <id> params = {move_x = 5 move_y = 0}
	PopAssetContext
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
	RunScriptOnScreenElement \{id = credits_backdrop_container
		scrolling_list_begin}
	LaunchEvent \{target = current_menu
		Type = focus}
endscript

script end_credits_button 
	destroy_credits_menu
	if GotParam \{soundcheck}
		frontend_load_soundcheck \{loadingscreen}
	endif
	generic_event_back
endscript

script destroy_credits_menu 
	if ($shutdown_game_for_signin_change_flag = 1)
		KillSpawnedScript \{Name = create_credits_menu}
		if ScreenElementExists \{id = credits_list_container}
			DestroyScreenElement \{id = credits_list_container}
		endif
		KillSpawnedScript \{Name = scrolling_list_begin}
	endif
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = TileSpriteLoop}
	if ScreenElementExists \{id = credits_backdrop_container}
		DestroyScreenElement \{id = credits_backdrop_container}
	endif
	if ScreenElementExists \{id = mc_scroll}
		DestroyScreenElement \{id = mc_scroll}
	endif
endscript

script scrolling_list_begin 
	if ($end_credits = 1)
		Wait \{2
			Seconds}
		CreateScreenElement \{Type = ContainerElement
			parent = root_window
			id = credits_backdrop_container
			Pos = (0.0, 0.0)
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
	GetArraySize ($Credits)
	if (<i> = <array_Size>)
		printf \{qs(0xb58d18b7)}
		Wait <time> Seconds
		if ScreenElementExists \{id = credits_list_container}
			DestroyScreenElement \{id = credits_list_container}
		endif
		if NOT ($end_credits = 1)
			end_credits_button \{soundcheck}
		endif
		return
	endif
	if StructureContains structure = ($Credits [<i>]) item
		text = (($Credits [<i>]).item)
	else
		text = qs(0x2ba2c9a2)
	endif
	if StructureContains structure = ($Credits [<i>]) heading
		Scale = <scale_head>
		Color = <color_head>
		color_shadow = [20 10 5 90]
		shadow_offs = (3.0, 3.0)
	else
		Scale = <scale_body>
		Color = <color_body>
		color_shadow = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
	endif
	if StructureContains structure = ($Credits [<i>]) title
		Scale = <scale_title>
		Color = <color_title>
		color_shadow = [20 10 5 90]
		shadow_offs = (3.0, 3.0)
	endif
	if StructureContains structure = ($Credits [<i>]) small
		Scale = 0.5
		Color = <color_body>
		color_shadow = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
	endif
	formatText checksumName = item_id 'item_%n' n = <i>
	if ScreenElementExists id = <item_id>
		DestroyScreenElement id = <item_id>
	endif
	if ($credits_menu_scroll = vertical)
		<fit_width> = `scale	each	line	if	larger`
		<fit_height> = `expand	dims`
	else
		<fit_width> = `expand	dims`
		<fit_height> = `scale	down	if	larger`
	endif
	CreateScreenElement {
		Type = TextBlockElement
		id = <item_id>
		parent = credits_list_container
		font = fontgrid_text_a8
		dims = <our_dims>
		fit_width = <fit_width>
		fit_height = <fit_height>
		font_spacing = 1
		Pos = (0.0, 0.0)
		internal_scale = <Scale>
		text = <text>
		just = <just>
		internal_just = <just>
		rgba = <Color>
		alpha = 1
		Shadow
		shadow_offs = <shadow_offs>
		shadow_rgba = <color_shadow>
		z_priority = <z_priority_credits>
	}
	GetScreenElementDims id = <item_id>
	if ($credits_menu_scroll = vertical)
		<item_height> = (<height> + <spacer>)
		<item_pos> = (<base_pos> + (<item_height> * (0.0, 1.0)))
	else
		<item_width> = (<width> + <spacer>)
		if GotParam \{prev_dim_x}
			<item_pos> = (<base_pos> + ((<prev_dim_x> + <spacer>) * (1.0, 0.0)))
		else
			<item_pos> = (<base_pos> + (<item_width> * (1.0, 0.0)))
		endif
	endif
	<item_id> :se_setprops Pos = <item_pos>
	if ($credits_menu_scroll = vertical)
		<distance> = (<screen_height> + ((<item_pos>.(0.0, 1.0)) - <screen_height>))
	else
		<distance> = (<screen_width> + ((<item_pos>.(1.0, 0.0)) - <screen_width> + <width>))
	endif
	<time> = (<distance> / <rate>)
	if ScreenElementExists id = <item_id>
		RunScriptOnScreenElement id = <item_id> scrolling_list_move_item params = {<...>}
	endif
endscript

script scrolling_list_move_item 
	RunScriptOnScreenElement id = credits_backdrop_container scrolling_list_queue_next_item params = {<...>}
	if ($credits_menu_scroll = vertical)
		<target_pos> = (<item_pos> - ((0.0, 1.0) * <distance>))
	else
		<target_pos> = (<item_pos> - ((1.0, 0.0) * <distance>))
	endif
	se_setprops time = <time> Pos = <target_pos>
	se_waitprops
	if ScreenElementExists id = <item_id>
		DestroyScreenElement id = <item_id>
	endif
endscript

script scrolling_list_queue_next_item 
	begin
	if ScreenElementExists id = <item_id>
		GetScreenElementProps id = <item_id>
	endif
	if ($credits_menu_scroll = vertical)
		pos_y = (<Pos>.(0.0, 1.0))
		if (<pos_y> < <screen_height>)
			<i> = (<i> + 1)
			scrolling_list_add_item <...>
			return
		endif
	else
		pos_x = (<Pos>.(1.0, 0.0))
		if (<pos_x> < <screen_width>)
			<i> = (<i> + 1)
			<prev_dim_x> = (<dims>.(1.0, 0.0))
			scrolling_list_add_item <...>
			return
		endif
	endif
	Wait \{1
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
	if ScreenElementExists \{id = credits_list_container}
		DestroyScreenElement \{id = credits_list_container}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = credits_backdrop_container
		id = credits_list_container
		Pos = (0.0, 0.0)}
	return <...>
endscript
Credits = [
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
		item = qs(0x9340148a)
	}
	{
		item = qs(0xe1d891be)
	}
	{
		item = qs(0x472a29a4)
	}
	{
		item = qs(0x3e911e56)
	}
	{
		item = qs(0xde844cdb)
	}
	{
		item = qs(0x15af9b23)
	}
	{
		item = qs(0x35c793b3)
	}
	{
		item = qs(0xb39fd4ce)
	}
	{
		item = qs(0x9eb27c40)
	}
	{
		item = qs(0xae335c22)
	}
	{
		item = qs(0x3286d992)
	}
	{
		item = qs(0xc43c746b)
	}
	{
		item = qs(0xfe5a4240)
	}
	{
		item = qs(0xaaf96bf3)
	}
	{
		item = qs(0x8d31e982)
	}
	{
		item = qs(0x6aca987a)
	}
	{
		item = qs(0xd591e880)
	}
	{
		item = qs(0x275878b9)
	}
	{
		item = qs(0x487d138d)
	}
	{
		item = qs(0x551506c7)
	}
	{
		item = qs(0x75cd5f65)
	}
	{
		item = qs(0x0cba5d5b)
	}
	{
		item = qs(0x71a6ad28)
	}
	{
		item = qs(0xc4a83a4d)
	}
	{
		item = qs(0xe138ff76)
	}
	{
		item = qs(0x5ca1aff1)
	}
	{
		item = qs(0x53c4b142)
	}
	{
		item = qs(0x751a630a)
	}
	{
		item = qs(0x59d1cfd7)
	}
	{
		item = qs(0x4d2d1ab2)
	}
	{
		item = qs(0x09a56e42)
	}
	{
		item = qs(0xb4bcf561)
	}
	{
		item = qs(0x71789832)
	}
	{
		item = qs(0x09febe07)
	}
	{
		item = qs(0xa2e5d28e)
	}
	{
		item = qs(0xa41534a3)
	}
	{
		item = qs(0x1e4bc031)
	}
	{
		item = qs(0xbad80090)
	}
	{
		item = qs(0xb367e397)
	}
	{
		item = qs(0xbfd6b803)
	}
	{
		heading
		item = qs(0x458e3979)
	}
	{
		item = qs(0x9aed1ade)
	}
	{
		item = qs(0x8d785b03)
	}
	{
		heading
		item = qs(0xa1e48a6e)
	}
	{
		item = qs(0x6df6c912)
	}
	{
		item = qs(0xac6e137c)
	}
	{
		item = qs(0x003a0682)
	}
	{
		item = qs(0x1c0458ea)
	}
	{
		item = qs(0x03f6ec9e)
	}
	{
		item = qs(0xd62c941d)
	}
	{
		item = qs(0x571748d0)
	}
	{
		item = qs(0xba6b5128)
	}
	{
		item = qs(0x8bc862bf)
	}
	{
		item = qs(0x25e4150c)
	}
	{
		heading
		item = qs(0x0a030e88)
	}
	{
		item = qs(0x367264c8)
	}
	{
		heading
		item = qs(0xf6c146f1)
	}
	{
		item = qs(0x91249a1b)
	}
	{
		item = qs(0x39c9228f)
	}
	{
		item = qs(0x6a8d67e0)
	}
	{
		item = qs(0x2f2b3692)
	}
	{
		item = qs(0x1de28da8)
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
		item = qs(0x107b2913)
	}
	{
		item = qs(0xf3488f70)
	}
	{
		heading
		item = qs(0x7aad20f2)
	}
	{
		item = qs(0x046a9ddb)
	}
	{
		heading
		item = qs(0xc1dbc765)
	}
	{
		item = qs(0x642ed048)
	}
	{
		heading
		item = qs(0x22cee176)
	}
	{
		item = qs(0xc1c762b0)
	}
	{
		heading
		item = qs(0x2497f415)
	}
	{
		item = qs(0xa2df9a8c)
	}
	{
		heading
		item = qs(0x0123089d)
	}
	{
		item = qs(0x440a6b8b)
	}
	{
		heading
		item = qs(0x1bb8dc8f)
	}
	{
		item = qs(0x81c15397)
	}
	{
		heading
		item = qs(0x7f4e4c4f)
	}
	{
		item = qs(0x06fc5f80)
	}
	{
		heading
		item = qs(0x97ac6d41)
	}
	{
		item = qs(0x9502ba28)
	}
	{
		heading
		item = qs(0x5a5a4dac)
	}
	{
		item = qs(0x0ee2db5f)
	}
	{
		heading
		item = qs(0xafc1c6ea)
	}
	{
		item = qs(0xedc67296)
	}
	{
		heading
		item = qs(0x00a4a2e0)
	}
	{
		item = qs(0x30873e85)
	}
	{
		heading
		item = qs(0xbb9e0e3a)
	}
	{
		item = qs(0x066d3e72)
	}
	{
		heading
		item = qs(0x15207e2e)
	}
	{
		item = qs(0x9fdeb5be)
	}
	{
		heading
		item = qs(0x6158800c)
	}
	{
		item = qs(0x9120f593)
	}
	{
		heading
		item = qs(0xcba1ab2d)
	}
	{
		item = qs(0x4ac53b21)
	}
	{
		heading
		item = qs(0x086c055d)
	}
	{
		item = qs(0xdab2b62a)
	}
	{
		heading
		item = qs(0x73e510b6)
	}
	{
		item = qs(0x5b0a0baa)
	}
	{
		heading
		item = qs(0xaaad5230)
	}
	{
		item = qs(0x5f58347f)
	}
	{
		heading
		item = qs(0xad57e8cc)
	}
	{
		item = qs(0xbb908bff)
	}
	{
		heading
		item = qs(0xa7620173)
	}
	{
		heading
		item = qs(0xfc7ec7c2)
	}
	{
		heading
		item = qs(0x3abe6b7c)
	}
	{
		heading
		item = qs(0x4bbb0da3)
	}
	{
		item = qs(0xf848483c)
	}
	{
		item = qs(0x26237cc4)
	}
	{
		item = qs(0xf814f815)
	}
	{
		item = qs(0x02ca4338)
	}
	{
		item = qs(0xbc0fd41b)
	}
	{
		item = qs(0x411a976e)
	}
	{
		item = qs(0x5c671be4)
	}
	{
		item = qs(0x16071a19)
	}
	{
		item = qs(0x1f565e48)
	}
	{
		heading
		item = qs(0xe66ec149)
	}
	{
		item = qs(0x0c07888d)
	}
	{
		item = qs(0xea7d00d1)
	}
	{
		item = qs(0x79048593)
	}
	{
		item = qs(0x2f907ff3)
	}
	{
		item = qs(0xff831e22)
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
		item = qs(0xb86d8a00)
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
		item = qs(0x80c405b9)
	}
	{
		item = qs(0x05a42813)
	}
	{
		heading
		item = qs(0xa7cf531d)
	}
	{
		item = qs(0x608ab445)
	}
	{
		item = qs(0x747dac9f)
	}
	{
		item = qs(0x190e8ed3)
	}
	{
		heading
		item = qs(0xd0325e23)
	}
	{
		item = qs(0x8ead72b3)
	}
	{
		item = qs(0x70867e0d)
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
		item = qs(0xff4bddbf)
	}
	{
		item = qs(0x4374bbbe)
	}
	{
		item = qs(0x3dc761a9)
	}
	{
		item = qs(0x2f03a224)
	}
	{
		item = qs(0xb0185232)
	}
	{
		item = qs(0x986b6495)
	}
	{
		item = qs(0x8a4cdf2c)
	}
	{
		heading
		item = qs(0x4a8ca6c7)
	}
	{
		item = qs(0x906ef1ba)
	}
	{
		item = qs(0x860d08ef)
	}
	{
		item = qs(0xcbe15b86)
	}
	{
		item = qs(0xf13a89cf)
	}
	{
		item = qs(0x54b1e346)
	}
	{
		item = qs(0x74c70655)
	}
	{
		item = qs(0xfefe88ab)
	}
	{
		item = qs(0xa9468d63)
	}
	{
		item = qs(0x27c775b9)
	}
	{
		item = qs(0x70f4a485)
	}
	{
		item = qs(0xa868e7e7)
	}
	{
		item = qs(0xeebe0a51)
	}
	{
		item = qs(0x7e1ac40e)
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
		item = qs(0x721d0f75)
	}
	{
		item = qs(0xba9496e1)
	}
	{
		item = qs(0x0ffa544a)
	}
	{
		item = qs(0xac8bc788)
	}
	{
		item = qs(0x970abca4)
	}
	{
		item = qs(0xefb4553e)
	}
	{
		item = qs(0xbf5971a8)
	}
	{
		heading
		item = qs(0xdca042cc)
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
		heading
		item = qs(0xe125b026)
	}
	{
		item = qs(0xe746b798)
	}
	{
		item = qs(0xc2948518)
	}
	{
		item = qs(0x05f38132)
	}
	{
		item = qs(0x24353686)
	}
	{
		item = qs(0x67db9399)
	}
	{
		item = qs(0x0c033a9a)
	}
	{
		item = qs(0x1f10a50a)
	}
	{
		item = qs(0x0efccce9)
	}
	{
		item = qs(0xd2de21a9)
	}
	{
		item = qs(0xc92d913c)
	}
	{
		item = qs(0xe857095e)
	}
	{
		item = qs(0x8970b08d)
	}
	{
		item = qs(0x14b653d7)
	}
	{
		item = qs(0x7efccd0f)
	}
	{
		item = qs(0x16491688)
	}
	{
		item = qs(0x124c2ab0)
	}
	{
		item = qs(0xad906d54)
	}
	{
		item = qs(0x3dafe356)
	}
	{
		item = qs(0xcc6d65bf)
	}
	{
		item = qs(0x01c36743)
	}
	{
		item = qs(0x5102ed44)
	}
	{
		item = qs(0x71ea95b2)
	}
	{
		heading
		item = qs(0xec2ac4da)
	}
	{
		item = qs(0x10546f58)
	}
	{
		item = qs(0x8bd52cc8)
	}
	{
		item = qs(0xc4d331e5)
	}
	{
		item = qs(0x5b9baf80)
	}
	{
		item = qs(0xdcf88a28)
	}
	{
		heading
		item = qs(0x3e802d06)
	}
	{
		item = qs(0x5fb9261f)
	}
	{
		item = qs(0x12dcf84f)
	}
	{
		item = qs(0xa2ce1725)
	}
	{
		item = qs(0x96661057)
	}
	{
		item = qs(0xf1c2de3f)
	}
	{
		item = qs(0x934b4d61)
	}
	{
		item = qs(0x5c988351)
	}
	{
		item = qs(0x41dcfc4d)
	}
	{
		item = qs(0x65ab141e)
	}
	{
		heading
		item = qs(0xf17b99ff)
	}
	{
		item = qs(0x29f80179)
	}
	{
		item = qs(0xbad51b56)
	}
	{
		heading
		item = qs(0xd1f03d27)
	}
	{
		item = qs(0x10cf83b3)
	}
	{
		item = qs(0xbf560571)
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
		item = qs(0xf6abf4b0)
	}
	{
		item = qs(0x7b6dc123)
	}
	{
		item = qs(0x7cca0384)
	}
	{
		heading
		item = qs(0x5693ea98)
	}
	{
		item = qs(0x02688910)
	}
	{
		item = qs(0xa45d80fa)
	}
	{
		item = qs(0x3f0d4e7d)
	}
	{
		heading
		item = qs(0x39a29dd8)
	}
	{
		item = qs(0x9c9c43d4)
	}
	{
		item = qs(0xacdf0279)
	}
	{
		item = qs(0x227f99ca)
	}
	{
		item = qs(0xd030926f)
	}
	{
		item = qs(0xfc9e37e9)
	}
	{
		item = qs(0xa2adf0c0)
	}
	{
		item = qs(0x20dc230b)
	}
	{
		item = qs(0xb75beaaf)
	}
	{
		item = qs(0x49d3f377)
	}
	{
		item = qs(0x10637717)
	}
	{
		item = qs(0xd14aee59)
	}
	{
		item = qs(0x96b2f544)
	}
	{
		item = qs(0x25edc2a5)
	}
	{
		item = qs(0x3c529e94)
	}
	{
		item = qs(0xf052cbf1)
	}
	{
		item = qs(0x57d6117a)
	}
	{
		item = qs(0x4048253f)
	}
	{
		item = qs(0x7a72dace)
	}
	{
		item = qs(0x1fe5207a)
	}
	{
		item = qs(0xa27ce93b)
	}
	{
		item = qs(0x8e61005f)
	}
	{
		item = qs(0x87c2ebf3)
	}
	{
		item = qs(0x4d743b80)
	}
	{
		item = qs(0xd462061a)
	}
	{
		item = qs(0x8d84d51f)
	}
	{
		item = qs(0xa45598ad)
	}
	{
		item = qs(0xdbcd565d)
	}
	{
		item = qs(0xf28b9444)
	}
	{
		item = qs(0xde00d4fe)
	}
	{
		item = qs(0x9b227f07)
	}
	{
		item = qs(0x78669cca)
	}
	{
		item = qs(0xc7f21592)
	}
	{
		item = qs(0x3c8d2db9)
	}
	{
		item = qs(0xf64a9395)
	}
	{
		item = qs(0xb6f10645)
	}
	{
		item = qs(0x2c107aa3)
	}
	{
		item = qs(0xe93c1e5b)
	}
	{
		item = qs(0xb5bfdcc0)
	}
	{
		item = qs(0x43b50ac7)
	}
	{
		item = qs(0x5594a013)
	}
	{
		item = qs(0x878b88e9)
	}
	{
		item = qs(0xa073be4b)
	}
	{
		item = qs(0xb48f58f8)
	}
	{
		item = qs(0x0022e071)
	}
	{
		item = qs(0xd789d7a0)
	}
	{
		item = qs(0x86167772)
	}
	{
		item = qs(0x907d7b79)
	}
	{
		item = qs(0x74f684a9)
	}
	{
		item = qs(0xf39e5347)
	}
	{
		item = qs(0x3a62417d)
	}
	{
		item = qs(0x79d7899c)
	}
	{
		item = qs(0x6d64fe47)
	}
	{
		item = qs(0x8b14b7cf)
	}
	{
		item = qs(0x8d0fdc66)
	}
	{
		item = qs(0x965cf3d9)
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
		item = qs(0xece39fe9)
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
		item = qs(0xf6fe127b)
	}
	{
		item = qs(0x235dec91)
	}
	{
		item = qs(0x27532628)
	}
	{
		heading
		item = qs(0xedc6fdb6)
	}
	{
		item = qs(0xd7cb824c)
	}
	{
		heading
		item = qs(0x98dbb6d6)
	}
	{
		item = qs(0xc69fd4b0)
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
		item = qs(0xed3ed18f)
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
		item = qs(0x2e83f426)
	}
	{
		heading
		item = qs(0x43694413)
	}
	{
		item = qs(0x83e0885c)
	}
	{
		item = qs(0x145a3694)
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
		item = qs(0xd1427b06)
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
		item = qs(0x681bdf8a)
	}
	{
		item = qs(0xdaa6968a)
	}
	{
		item = qs(0xa74f0025)
	}
	{
		item = qs(0xd7afe7db)
	}
	{
		item = qs(0x54882c41)
	}
	{
		item = qs(0xb8feb3fd)
	}
	{
		item = qs(0x0590c142)
	}
	{
		item = qs(0x2f38c010)
	}
	{
		heading
		item = qs(0xea196508)
	}
	{
		item = qs(0xabc2dc01)
	}
	{
		item = qs(0x3863684e)
	}
	{
		item = qs(0x5b49c40e)
	}
	{
		item = qs(0xc54c45df)
	}
	{
		item = qs(0x2aea8e20)
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
		item = qs(0x24590af0)
	}
	{
		item = qs(0xa7e90578)
	}
	{
		item = qs(0x6eeb6df2)
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
		item = qs(0x5e608444)
	}
	{
		item = qs(0x823208be)
	}
	{
		item = qs(0x703f4f45)
	}
	{
		heading
		item = qs(0x225dbcb1)
	}
	{
		item = qs(0x3994086a)
	}
	{
		item = qs(0xaf6b472c)
	}
	{
		heading
		item = qs(0x0d601396)
	}
	{
		item = qs(0x6de232b7)
	}
	{
		item = qs(0xed37d22f)
	}
	{
		heading
		item = qs(0xc2307b37)
	}
	{
		item = qs(0xd58f69a3)
	}
	{
		item = qs(0x0213632b)
	}
	{
		heading
		item = qs(0xd2706646)
	}
	{
		item = qs(0x8fdafc51)
	}
	{
		item = qs(0x9336af27)
	}
	{
		heading
		item = qs(0x5be59ddc)
	}
	{
		item = qs(0x1d8b3104)
	}
	{
		item = qs(0xb09f04ac)
	}
	{
		heading
		item = qs(0xcffeadfc)
	}
	{
		item = qs(0x85750058)
	}
	{
		heading
		item = qs(0x0ecceb3e)
	}
	{
		item = qs(0x5e267e35)
	}
	{
		item = qs(0x74d4ee9b)
	}
	{
		heading
		item = qs(0x71b2f566)
	}
	{
		item = qs(0xfa643021)
	}
	{
		item = qs(0x3b97274f)
	}
	{
		heading
		item = qs(0x91e5b3c2)
	}
	{
		item = qs(0x5287c1d3)
	}
	{
		heading
		item = qs(0x90191301)
	}
	{
		item = qs(0x3af1df8a)
	}
	{
		heading
		item = qs(0x17b0271c)
	}
	{
		item = qs(0x2d4e91d6)
	}
	{
		heading
		item = qs(0xb4e9bcc7)
	}
	{
		item = qs(0xeb1ce6ff)
	}
	{
		item = qs(0x270bd872)
	}
	{
		heading
		item = qs(0x006b2639)
	}
	{
		item = qs(0xb1f76091)
	}
	{
		item = qs(0xb99a02c7)
	}
	{
		item = qs(0x689f40eb)
	}
	{
		heading
		item = qs(0x2bd1aac8)
	}
	{
		item = qs(0xb19726e0)
	}
	{
		item = qs(0x6a93cd19)
	}
	{
		item = qs(0x03c486ec)
	}
	{
		heading
		item = qs(0x30431295)
	}
	{
		item = qs(0xa49009d8)
	}
	{
		heading
		item = qs(0xbdf75e0a)
	}
	{
		item = qs(0x99ecf233)
	}
	{
		item = qs(0x24f391e8)
	}
	{
		item = qs(0x5db431c4)
	}
	{
		heading
		item = qs(0x95c699e0)
	}
	{
		item = qs(0xf5049637)
	}
	{
		item = qs(0x1798b23a)
	}
	{
		heading
		item = qs(0x3ada917c)
	}
	{
		item = qs(0x48cc513e)
	}
	{
		heading
		item = qs(0xd5411171)
	}
	{
		item = qs(0x25718df8)
	}
	{
		item = qs(0x62e56488)
	}
	{
		heading
		item = qs(0x3055017f)
	}
	{
		item = qs(0x82b69331)
	}
	{
		item = qs(0x1a65fd12)
	}
	{
		heading
		item = qs(0x6533267f)
	}
	{
		item = qs(0xe6854537)
	}
	{
		item = qs(0xd87b8833)
	}
	{
		heading
		item = qs(0xf93cc763)
	}
	{
		item = qs(0x3616ef4c)
	}
	{
		item = qs(0x51d5ddc3)
	}
	{
		heading
		item = qs(0xc8c67726)
	}
	{
		item = qs(0x9b989e88)
	}
	{
		item = qs(0x22e47769)
	}
	{
		heading
		item = qs(0x67db2ef6)
	}
	{
		item = qs(0xd9aabdc5)
	}
	{
		item = qs(0x4fffe72b)
	}
	{
		heading
		item = qs(0xb659c21c)
	}
	{
		item = qs(0x052bf703)
	}
	{
		item = qs(0x1c776ebe)
	}
	{
		heading
		item = qs(0xcdd6f007)
	}
	{
		item = qs(0xcf6c8aed)
	}
	{
		item = qs(0x87078cdb)
	}
	{
		heading
		item = qs(0x1ba5a60d)
	}
	{
		item = qs(0x7c534617)
	}
	{
		item = qs(0x92997ef9)
	}
	{
		heading
		item = qs(0xe0bbc8e6)
	}
	{
		item = qs(0x158f98a7)
	}
	{
		item = qs(0xe0e2c44a)
	}
	{
		heading
		item = qs(0x9b3befa6)
	}
	{
		item = qs(0xa8909d86)
	}
	{
		item = qs(0x2ada7f8c)
	}
	{
		item = qs(0x37c883aa)
	}
	{
		heading
		item = qs(0x8d41994d)
	}
	{
		item = qs(0xbf9e348d)
	}
	{
		item = qs(0x7fdd1d48)
	}
	{
		heading
		item = qs(0xfa43ffdb)
	}
	{
		item = qs(0xaee7d11b)
	}
	{
		item = qs(0x05dd1020)
	}
	{
		heading
		item = qs(0xe32fe1c4)
	}
	{
		item = qs(0x622a76a4)
	}
	{
		item = qs(0xa537b7be)
	}
	{
		item = qs(0x2fe2b56a)
	}
	{
		heading
		item = qs(0x76273b05)
	}
	{
		item = qs(0xbca220bf)
	}
	{
		heading
		item = qs(0x81b31855)
	}
	{
		item = qs(0xe71c0964)
	}
	{
		item = qs(0x720e7768)
	}
	{
		item = qs(0xd8b25a90)
	}
	{
		heading
		item = qs(0x8a53c98c)
	}
	{
		item = qs(0x83843095)
	}
	{
		item = qs(0xc107105f)
	}
	{
		heading
		item = qs(0x13690963)
	}
	{
		item = qs(0xdf22e4ce)
	}
	{
		item = qs(0x3822435f)
	}
	{
		heading
		item = qs(0x9c46a02b)
	}
	{
		item = qs(0xbee55cfa)
	}
	{
		item = qs(0x57001c9c)
	}
	{
		heading
		item = qs(0xf49283c4)
	}
	{
		item = qs(0xc1fed5c7)
	}
	{
		item = qs(0xa188b6e9)
	}
	{
		heading
		item = qs(0xab6945e0)
	}
	{
		item = qs(0x62ba6cf7)
	}
	{
		item = qs(0x670731f4)
	}
	{
		heading
		item = qs(0x49ffff40)
	}
	{
		item = qs(0x3cc697fa)
	}
	{
		item = qs(0x3e39a624)
	}
	{
		item = qs(0x7824367d)
	}
	{
		heading
		item = qs(0x8b00d125)
	}
	{
		item = qs(0x7a11236e)
	}
	{
		item = qs(0x3c8dd9cc)
	}
	{
		item = qs(0x0e39d0a5)
	}
	{
		heading
		item = qs(0x80471bb3)
	}
	{
		item = qs(0x10ef22a5)
	}
	{
		item = qs(0xbf822fdc)
	}
	{
		heading
		item = qs(0x39128a4c)
	}
	{
		item = qs(0xfa2528d4)
	}
	{
		heading
		item = qs(0x6add8dcb)
	}
	{
		item = qs(0x7bcc5511)
	}
	{
		item = qs(0x0846214f)
	}
	{
		heading
		item = qs(0xd8145db5)
	}
	{
		item = qs(0x1d77c41d)
	}
	{
		heading
		item = qs(0x0f53b9cc)
	}
	{
		item = qs(0x49f5e51b)
	}
	{
		item = qs(0xf2440926)
	}
	{
		heading
		item = qs(0xe65fd49d)
	}
	{
		item = qs(0xad739ec0)
	}
	{
		item = qs(0x382772e5)
	}
	{
		heading
		item = qs(0x4c97e31d)
	}
	{
		item = qs(0x9b2d0081)
	}
	{
		item = qs(0x1bd93b62)
	}
	{
		heading
		item = qs(0xfb8dd742)
	}
	{
		item = qs(0xedbef372)
	}
	{
		item = qs(0x3fa4f531)
	}
	{
		heading
		item = qs(0x3679d414)
	}
	{
		item = qs(0x272d10c1)
	}
	{
		item = qs(0x2f27ac08)
	}
	{
		heading
		item = qs(0x44c8d6fe)
	}
	{
		item = qs(0xc5dff45a)
	}
	{
		item = qs(0x8edc4192)
	}
	{
		heading
		item = qs(0x3632dcdd)
	}
	{
		item = qs(0x765ef574)
	}
	{
		heading
		item = qs(0x48c2d7f1)
	}
	{
		item = qs(0x1e40502b)
	}
	{
		item = qs(0xe7c8ff41)
	}
	{
		heading
		item = qs(0x2f68d718)
	}
	{
		item = qs(0x74cd16e6)
	}
	{
		item = qs(0x47f1f50e)
	}
	{
		heading
		item = qs(0xfd9bf6fa)
	}
	{
		item = qs(0x9cca4bdd)
	}
	{
		item = qs(0x3ec42521)
	}
	{
		heading
		item = qs(0x2cb33326)
	}
	{
		item = qs(0x7cc5886c)
	}
	{
		item = qs(0xa96a6e4c)
	}
	{
		item = qs(0xff97bc94)
	}
	{
		heading
		item = qs(0xe3655077)
	}
	{
		item = qs(0x06afcf18)
	}
	{
		heading
		item = qs(0x9df65ebb)
	}
	{
		item = qs(0x64719742)
	}
	{
		item = qs(0x5308eaec)
	}
	{
		heading
		item = qs(0x1da55801)
	}
	{
		item = qs(0x9b9ed50e)
	}
	{
		item = qs(0x98b60d22)
	}
	{
		heading
		item = qs(0x67d14ce9)
	}
	{
		item = qs(0x7b560376)
	}
	{
		item = qs(0x31134e9f)
	}
	{
		heading
		item = qs(0xd2ab3d6d)
	}
	{
		item = qs(0x44e92820)
	}
	{
		item = qs(0xac033259)
	}
	{
		heading
		item = qs(0xaa57c8df)
	}
	{
		item = qs(0xa97bfaf3)
	}
	{
		item = qs(0x159dba1f)
	}
	{
		item = qs(0xb98ae411)
	}
	{
		heading
		item = qs(0xca1c738a)
	}
	{
		item = qs(0xa7b6c592)
	}
	{
		item = qs(0x4c762b36)
	}
	{
		heading
		item = qs(0xb5ea8c80)
	}
	{
		item = qs(0x85bced9f)
	}
	{
		item = qs(0x7a877104)
	}
	{
		heading
		item = qs(0xaaf5bc61)
	}
	{
		item = qs(0x83f64531)
	}
	{
		item = qs(0xb0cc2f8b)
	}
	{
		heading
		item = qs(0xff86a985)
	}
	{
		item = qs(0x0b82d2c1)
	}
	{
		item = qs(0x75d8d670)
	}
	{
		item = qs(0x404ddc87)
	}
	{
		heading
		item = qs(0xba746163)
	}
	{
		item = qs(0x1c85acc6)
	}
	{
		item = qs(0x4afa294e)
	}
	{
		heading
		item = qs(0xc88a6235)
	}
	{
		item = qs(0x959b4d49)
	}
	{
		item = qs(0x63f72a99)
	}
	{
		heading
		item = qs(0xaeca064a)
	}
	{
		item = qs(0x81ce2313)
	}
	{
		item = qs(0x0be60cd3)
	}
	{
		item = qs(0x9f38ef4a)
	}
	{
		heading
		item = qs(0x83bf5478)
	}
	{
		item = qs(0x9798a3fc)
	}
	{
		item = qs(0x50e79053)
	}
	{
		heading
		item = qs(0xed53474d)
	}
	{
		item = qs(0x24fe6e86)
	}
	{
		heading
		item = qs(0x014d8eab)
	}
	{
		item = qs(0x254d7e81)
	}
	{
		item = qs(0x881fe967)
	}
	{
		item = qs(0x9d38317e)
	}
	{
		heading
		item = qs(0x0accf403)
	}
	{
		item = qs(0x0899727a)
	}
	{
		item = qs(0xbc294a29)
	}
	{
		heading
		item = qs(0x09fecc8c)
	}
	{
		item = qs(0x19c26512)
	}
	{
		item = qs(0x2757da63)
	}
	{
		heading
		item = qs(0xe6a35ee4)
	}
	{
		item = qs(0xf2b5549e)
	}
	{
		item = qs(0xf937268c)
	}
	{
		heading
		item = qs(0x113995e1)
	}
	{
		item = qs(0x7e20828b)
	}
	{
		item = qs(0x76a8202d)
	}
	{
		heading
		item = qs(0xf3668474)
	}
	{
		item = qs(0x6a42e112)
	}
	{
		heading
		item = qs(0xec585c58)
	}
	{
		item = qs(0xd3a8f21f)
	}
	{
		item = qs(0x1d94e2d6)
	}
	{
		heading
		item = qs(0x977f36cc)
	}
	{
		item = qs(0x44be4299)
	}
	{
		item = qs(0xc2bb4154)
	}
	{
		heading
		item = qs(0xc0ca750b)
	}
	{
		item = qs(0xf38f57de)
	}
	{
		item = qs(0x36d0c4cb)
	}
	{
		heading
		item = qs(0x4af942d8)
	}
	{
		item = qs(0x8f06536f)
	}
	{
		item = qs(0x5cce0689)
	}
	{
		item = qs(0x0c4fa5f7)
	}
	{
		item = qs(0xf0cbf69e)
	}
	{
		heading
		item = qs(0xf35fa855)
	}
	{
		item = qs(0x9920205e)
	}
	{
		item = qs(0x0fd1b166)
	}
	{
		heading
		item = qs(0x6dd915e3)
	}
	{
		item = qs(0x3022122e)
	}
	{
		item = qs(0x6fd36845)
	}
]
