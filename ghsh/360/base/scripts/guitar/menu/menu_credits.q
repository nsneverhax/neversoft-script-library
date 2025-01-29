credits_menu_font = fontgrid_denim_title
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
	endif
	PushAssetContext \{context = z_quebec}
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
		if NOT GotParam \{end_credits}
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
	RunScriptOnScreenElement id = credits_backdrop_container scrolling_list_begin params = <...>
	LaunchEvent \{target = current_menu
		Type = focus}
endscript

script end_credits_button 
	if ScreenElementExists \{id = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	destroy_credits_menu
	if NOT GotParam \{end_credits}
		generic_event_back
	else
		progression_set_credits_complete
		ui_win_song_career_continue
	endif
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
	isgreatesthits
	if (<is_greatest_hits>)
		Change \{Credits = $credits_eu}
	endif
	GetArraySize ($Credits)
	if (<i> = <array_Size>)
		printf \{qs(0xb58d18b7)}
		Wait <time> Seconds
		if ScreenElementExists \{id = credits_list_container}
			DestroyScreenElement \{id = credits_list_container}
		endif
		if NOT ($end_credits = 1)
			end_credits_button <...> soundcheck
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
		color_shadow = [30 30 30 255]
		shadow_offs = (3.0, 3.0)
	else
		Scale = <scale_body>
		Color = <color_body>
		color_shadow = [30 30 30 255]
		shadow_offs = (3.0, 3.0)
	endif
	if StructureContains structure = ($Credits [<i>]) title
		Scale = <scale_title>
		Color = <color_title>
		color_shadow = [30 30 30 255]
		shadow_offs = (3.0, 3.0)
	endif
	if StructureContains structure = ($Credits [<i>]) small
		Scale = 0.5
		Color = <color_body>
		color_shadow = [30 30 30 255]
		shadow_offs = (3.0, 3.0)
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
		font = fontgrid_denim_title
		font = fontgrid_denim_title
		font = fontgrid_denim_title
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
	else
		<rate> = 380.0
		<screen_height> = 690
		<scale_head> = 0.75
		<color_head> = [203 151 51 255]
		<scale_body> = 0.65000004
		<color_body> = [230 230 230 255]
		<scale_title> = 0.65000004
		<color_title> = [203 151 51 255]
		<color_head> = [180 165 120 255]
		<color_head> = [203 151 51 255]
		<color_head> = [149 48 48 255]
		<scale_body> = 0.65000004
		<color_body> = [180 200 200 255]
		<color_body> = [230 230 230 255]
		<color_body> = [30 30 30 255]
		<scale_title> = 0.65000004
		<color_title> = [180 165 120 255]
		<color_title> = [203 151 51 255]
		<color_title> = [149 48 48 255]
	endif
	<color_head> = (($g_menu_colors).menu_gold)
	<scale_body> = 0.65000004
	<color_body> = (($g_menu_colors).menu_white)
	<scale_title> = 0.65000004
	<color_title> = (($g_menu_colors).menu_gold)
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
		item = qs(0xdbba1864)
	}
	{
		item = qs(0x6051b8a7)
	}
	{
		item = qs(0x0487185c)
	}
	{
		item = qs(0xe32731a9)
	}
	{
		item = qs(0xe5f81df6)
	}
	{
		item = qs(0xe65f40f1)
	}
	{
		item = qs(0x8746e040)
	}
	{
		item = qs(0xc073315b)
	}
	{
		item = qs(0x708007b0)
	}
	{
		item = qs(0xdc0a7000)
	}
	{
		item = qs(0x82845fc4)
	}
	{
		item = qs(0x890b5138)
	}
	{
		item = qs(0x8e455288)
	}
	{
		item = qs(0xd3bf42bc)
	}
	{
		item = qs(0x3a3bb794)
	}
	{
		item = qs(0xc0a83b25)
	}
	{
		item = qs(0x7111b28b)
	}
	{
		item = qs(0x6f45af67)
	}
	{
		item = qs(0xaa2c90af)
	}
	{
		heading
		item = qs(0xbd68e84d)
	}
	{
		item = qs(0xe1702024)
	}
	{
		heading
		item = qs(0x7876e230)
	}
	{
		item = qs(0x67467ef7)
	}
	{
		item = qs(0xff41d1d6)
	}
	{
		heading
		item = qs(0xbf703b04)
	}
	{
		item = qs(0xb84214ee)
	}
	{
		heading
		item = qs(0x53381542)
	}
	{
		item = qs(0x97a22785)
	}
	{
		heading
		item = qs(0x0a030e88)
	}
	{
		item = qs(0xaad17d05)
	}
	{
		item = qs(0xd422896a)
	}
	{
		item = qs(0x3f8b22e2)
	}
	{
		item = qs(0x48e8af16)
	}
	{
		item = qs(0xa491f305)
	}
	{
		item = qs(0xfeb7bff5)
	}
	{
		heading
		item = qs(0x55e515b4)
	}
	{
		heading
		item = qs(0x0123089d)
	}
	{
		item = qs(0x5bbe9509)
	}
	{
		heading
		item = qs(0x1bb8dc8f)
	}
	{
		item = qs(0xf9388671)
	}
	{
		heading
		item = qs(0x7f4e4c4f)
	}
	{
		item = qs(0x07136b14)
	}
	{
		heading
		item = qs(0x97ac6d41)
	}
	{
		item = qs(0x608159d8)
	}
	{
		heading
		item = qs(0xe1bf45a9)
	}
	{
		item = qs(0x42e0ff6b)
	}
	{
		heading
		item = qs(0x74a49691)
	}
	{
		item = qs(0x71cc90ac)
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
		item = qs(0xe5696f20)
	}
	{
		item = qs(0xe8f87f17)
	}
	{
		heading
		item = qs(0x086c055d)
	}
	{
		item = qs(0x26e8788b)
	}
	{
		heading
		item = qs(0x3d73e7a4)
	}
	{
		item = qs(0x13bcb1b6)
	}
	{
		item = qs(0x6782689e)
	}
	{
		item = qs(0x187c123d)
	}
	{
		heading
		item = qs(0x73e510b6)
	}
	{
		item = qs(0xe01876c8)
	}
	{
		heading
		item = qs(0xa7620173)
	}
	{
		heading
		item = qs(0x87cdacac)
	}
	{
		item = qs(0x7b0bb98d)
	}
	{
		heading
		item = qs(0x80bd83b8)
	}
	{
		item = qs(0x1d9962e4)
	}
	{
		heading
		item = qs(0xdc082730)
	}
	{
		item = qs(0x04b009d7)
	}
	{
		heading
		item = qs(0xaaad5230)
	}
	{
		item = qs(0xeb368afe)
	}
	{
		heading
		item = qs(0x40ef1a91)
	}
	{
		item = qs(0xb5284214)
	}
	{
		item = qs(0xccbc6a75)
	}
	{
		item = qs(0x04aa8358)
	}
	{
		item = qs(0xfea8ef8a)
	}
	{
		item = qs(0xb2c5d8a6)
	}
	{
		item = qs(0x1eedef02)
	}
	{
		item = qs(0x666dc681)
	}
	{
		item = qs(0xced2f085)
	}
	{
		item = qs(0x41110896)
	}
	{
		heading
		item = qs(0xe66ec149)
	}
	{
		item = qs(0xe2c17def)
	}
	{
		item = qs(0x6a929bcc)
	}
	{
		item = qs(0x7010de6c)
	}
	{
		item = qs(0x7ee2f66a)
	}
	{
		heading
		item = qs(0x894c374a)
	}
	{
		item = qs(0xd97588f2)
	}
	{
		item = qs(0x70452ea3)
	}
	{
		item = qs(0x32ab987c)
	}
	{
		item = qs(0x6d96e013)
	}
	{
		item = qs(0x07a7a180)
	}
	{
		item = qs(0x61036950)
	}
	{
		item = qs(0x25cbf4da)
	}
	{
		heading
		item = qs(0xafc5b578)
	}
	{
		item = qs(0x000ccc01)
	}
	{
		item = qs(0xd5eceb5f)
	}
	{
		item = qs(0x35fabacf)
	}
	{
		item = qs(0x5cbe94ed)
	}
	{
		item = qs(0x8fdc8d6f)
	}
	{
		item = qs(0xff38e639)
	}
	{
		heading
		item = qs(0xa7cf531d)
	}
	{
		item = qs(0x74e8b256)
	}
	{
		item = qs(0x8eccade7)
	}
	{
		item = qs(0xf716a549)
	}
	{
		heading
		item = qs(0xd0325e23)
	}
	{
		item = qs(0xed595939)
	}
	{
		item = qs(0xc562d97f)
	}
	{
		item = qs(0x4e546345)
	}
	{
		item = qs(0xb042d8f9)
	}
	{
		item = qs(0xde7cb1af)
	}
	{
		item = qs(0x5c121c20)
	}
	{
		item = qs(0x3de8432d)
	}
	{
		item = qs(0xebfd4bd3)
	}
	{
		item = qs(0xe212c3ef)
	}
	{
		item = qs(0xa40b65e7)
	}
	{
		item = qs(0xd8f965b6)
	}
	{
		item = qs(0x858dc050)
	}
	{
		heading
		item = qs(0x4a8ca6c7)
	}
	{
		item = qs(0x57c2ef6d)
	}
	{
		item = qs(0xf0bec703)
	}
	{
		item = qs(0xa9dea461)
	}
	{
		item = qs(0x794c2ee2)
	}
	{
		item = qs(0xb5fdfab0)
	}
	{
		item = qs(0x8e94f600)
	}
	{
		item = qs(0x6fe2aacd)
	}
	{
		item = qs(0x76b896e5)
	}
	{
		item = qs(0x8cecd703)
	}
	{
		item = qs(0x39cb3be3)
	}
	{
		item = qs(0xc3221fc4)
	}
	{
		item = qs(0xd54e60b3)
	}
	{
		heading
		item = qs(0xe56b344f)
	}
	{
		item = qs(0x50356fea)
	}
	{
		item = qs(0xdbad9f4d)
	}
	{
		item = qs(0xb1eadef4)
	}
	{
		item = qs(0x5d871761)
	}
	{
		item = qs(0xa2907cd1)
	}
	{
		item = qs(0xfae3285a)
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
		item = qs(0x9625a8a9)
	}
	{
		item = qs(0xa6e4d08a)
	}
	{
		item = qs(0x63b9fd19)
	}
	{
		heading
		item = qs(0xdcd7add8)
	}
	{
		item = qs(0xec19436e)
	}
	{
		item = qs(0xed9c3870)
	}
	{
		item = qs(0x9d36a923)
	}
	{
		item = qs(0xec7161c1)
	}
	{
		item = qs(0xb029b47f)
	}
	{
		item = qs(0x4ecc19b1)
	}
	{
		item = qs(0x435835be)
	}
	{
		item = qs(0x44dfec33)
	}
	{
		item = qs(0x112e1703)
	}
	{
		item = qs(0x070dbd2e)
	}
	{
		item = qs(0x11d01f3b)
	}
	{
		item = qs(0xb8090bde)
	}
	{
		item = qs(0x2a493543)
	}
	{
		item = qs(0x3ff71b76)
	}
	{
		item = qs(0xa4c7a097)
	}
	{
		item = qs(0x7b54e012)
	}
	{
		item = qs(0x56038986)
	}
	{
		item = qs(0x1bb1f7ff)
	}
	{
		item = qs(0x4df6ec1c)
	}
	{
		heading
		item = qs(0xd1f03d27)
	}
	{
		item = qs(0x10cf83b3)
	}
	{
		item = qs(0x08f5c771)
	}
	{
		item = qs(0xacd62b14)
	}
	{
		item = qs(0x4faee5d8)
	}
	{
		item = qs(0x3251bb1a)
	}
	{
		item = qs(0xd37dc04f)
	}
	{
		item = qs(0x545e06ad)
	}
	{
		item = qs(0xed0da341)
	}
	{
		heading
		item = qs(0x5693ea98)
	}
	{
		item = qs(0x75162b8a)
	}
	{
		item = qs(0x64460473)
	}
	{
		heading
		item = qs(0x39a29dd8)
	}
	{
		item = qs(0x39e7e552)
	}
	{
		item = qs(0x2d934f45)
	}
	{
		item = qs(0x9b673479)
	}
	{
		item = qs(0x417cd384)
	}
	{
		item = qs(0x0d8ea004)
	}
	{
		item = qs(0x5f63b3c9)
	}
	{
		item = qs(0x73039347)
	}
	{
		item = qs(0x2b5b8cde)
	}
	{
		item = qs(0xaee11745)
	}
	{
		item = qs(0x6a94af7c)
	}
	{
		item = qs(0xffe33d48)
	}
	{
		item = qs(0xd420dc26)
	}
	{
		item = qs(0x590a33cb)
	}
	{
		item = qs(0xb1fa4230)
	}
	{
		item = qs(0x5ab59159)
	}
	{
		item = qs(0x711c3196)
	}
	{
		item = qs(0xed19220b)
	}
	{
		item = qs(0xee136b6c)
	}
	{
		item = qs(0x1cfa18a7)
	}
	{
		item = qs(0x924a6e8e)
	}
	{
		item = qs(0x1ea0e23b)
	}
	{
		item = qs(0x6d3b21db)
	}
	{
		item = qs(0xd90bc159)
	}
	{
		item = qs(0x9a9b3844)
	}
	{
		item = qs(0x7fd74d1d)
	}
	{
		item = qs(0x1daad675)
	}
	{
		item = qs(0x22c5d069)
	}
	{
		item = qs(0x7efaa040)
	}
	{
		item = qs(0xf2d67e4b)
	}
	{
		item = qs(0xf6375e20)
	}
	{
		item = qs(0xe7b2342f)
	}
	{
		item = qs(0x53242b34)
	}
	{
		item = qs(0x5fec533f)
	}
	{
		item = qs(0x5d69c28f)
	}
	{
		item = qs(0x1e796514)
	}
	{
		item = qs(0x2693d62b)
	}
	{
		item = qs(0x214f2f8c)
	}
	{
		item = qs(0xc7324e2b)
	}
	{
		item = qs(0xe33acdd2)
	}
	{
		item = qs(0x1098bf30)
	}
	{
		item = qs(0x5bb8b6b5)
	}
	{
		item = qs(0x71cb894b)
	}
	{
		item = qs(0x664020eb)
	}
	{
		item = qs(0xba1e01a9)
	}
	{
		item = qs(0x03ff9c3a)
	}
	{
		item = qs(0x793fb051)
	}
	{
		heading
		item = qs(0x85b748f2)
	}
	{
		item = qs(0x3eceda76)
	}
	{
		item = qs(0x9e9bb5f1)
	}
	{
		item = qs(0x9b6003c1)
	}
	{
		item = qs(0xc028986f)
	}
	{
		item = qs(0x8f44ca91)
	}
	{
		item = qs(0xfbff94bb)
	}
	{
		item = qs(0x77e90800)
	}
	{
		item = qs(0x93077610)
	}
	{
		item = qs(0xce4f929f)
	}
	{
		item = qs(0x9ab97e9b)
	}
	{
		item = qs(0x6269545d)
	}
	{
		item = qs(0x83bd5a7a)
	}
	{
		item = qs(0xa00f9d07)
	}
	{
		item = qs(0xc933334a)
	}
	{
		item = qs(0x0002aaca)
	}
	{
		item = qs(0xd8a05013)
	}
	{
		item = qs(0x52f81a84)
	}
	{
		heading
		item = qs(0x77d5d15b)
	}
	{
		item = qs(0xdf41334d)
	}
	{
		item = qs(0x98f2d988)
	}
	{
		item = qs(0x5e2c3493)
	}
	{
		item = qs(0xad43aac5)
	}
	{
		heading
		item = qs(0xdc3e4c02)
	}
	{
		item = qs(0xbf5e2873)
	}
	{
		item = qs(0x631fe7bb)
	}
	{
		item = qs(0xc26ff7ce)
	}
	{
		item = qs(0xe5118008)
	}
	{
		item = qs(0xf4e8daad)
	}
	{
		item = qs(0xb25335f3)
	}
	{
		heading
		item = qs(0x9b2fefc3)
	}
	{
		item = qs(0x76655087)
	}
	{
		item = qs(0x1da8dad1)
	}
	{
		item = qs(0xfe4e4b36)
	}
	{
		heading
		item = qs(0xfe3c544a)
	}
	{
		item = qs(0xd75e1130)
	}
	{
		item = qs(0x4fcc0973)
	}
	{
		item = qs(0x66c71834)
	}
	{
		item = qs(0xd197430d)
	}
	{
		item = qs(0x8365d500)
	}
	{
		item = qs(0xa58db2b5)
	}
	{
		heading
		item = qs(0x54d0eb4b)
	}
	{
		item = qs(0xd75e1130)
	}
	{
		item = qs(0x521eb0aa)
	}
	{
		item = qs(0x114b1fc5)
	}
	{
		item = qs(0xafc22799)
	}
	{
		item = qs(0x81625a07)
	}
	{
		item = qs(0xe66cbd07)
	}
	{
		heading
		item = qs(0x9a141286)
	}
	{
		item = qs(0xb3849bf6)
	}
	{
		item = qs(0x2e28f716)
	}
	{
		item = qs(0xd196a52a)
	}
	{
		item = qs(0x2a93c4d2)
	}
	{
		item = qs(0x7db51f9a)
	}
	{
		item = qs(0x914d02f3)
	}
	{
		heading
		item = qs(0xa70b8de3)
	}
	{
		item = qs(0x59c9940c)
	}
	{
		item = qs(0xa51c97d8)
	}
	{
		item = qs(0x6c9edddd)
	}
	{
		heading
		item = qs(0x4037d6d1)
	}
	{
		item = qs(0x1d80fe47)
	}
	{
		item = qs(0x912d21b5)
	}
	{
		item = qs(0xd473a080)
	}
	{
		item = qs(0x101d1865)
	}
	{
		item = qs(0x63140aa3)
	}
	{
		item = qs(0xd46da3a0)
	}
	{
		item = qs(0x507b6470)
	}
	{
		item = qs(0x72352a4a)
	}
	{
		heading
		item = qs(0x9c14616e)
	}
	{
		item = qs(0xc361609e)
	}
	{
		item = qs(0x7aa3e4cf)
	}
	{
		item = qs(0xcb3c6b97)
	}
	{
		item = qs(0x198719a7)
	}
	{
		item = qs(0x8ed51518)
	}
	{
		item = qs(0xc9a53d32)
	}
	{
		item = qs(0x86b62edf)
	}
	{
		item = qs(0x74337c12)
	}
	{
		item = qs(0xf4a941d2)
	}
	{
		item = qs(0xecc16060)
	}
	{
		item = qs(0x83b526f2)
	}
	{
		item = qs(0xd6ad541f)
	}
	{
		item = qs(0x6618b49e)
	}
	{
		item = qs(0xb2476da1)
	}
	{
		item = qs(0x81f83cfd)
	}
	{
		item = qs(0x181315ea)
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
		item = qs(0xd24ea5ad)
	}
	{
		item = qs(0x888383ef)
	}
	{
		item = qs(0xb6f82fc3)
	}
	{
		heading
		item = qs(0x59dc6dff)
	}
	{
		item = qs(0xbcca6637)
	}
	{
		item = qs(0x4e6cb8a8)
	}
	{
		item = qs(0xcd270847)
	}
	{
		item = qs(0x8ac31758)
	}
	{
		item = qs(0x64d4a1b1)
	}
	{
		item = qs(0x8aa38082)
	}
	{
		item = qs(0x81d71886)
	}
	{
		heading
		item = qs(0xa8c17f6d)
	}
	{
		heading
		item = qs(0xd8afe829)
	}
	{
		item = qs(0x393e9427)
	}
	{
		item = qs(0x8ad5df96)
	}
	{
		heading
		item = qs(0xe9465c7c)
	}
	{
		item = qs(0xd70e79ac)
	}
	{
		heading
		item = qs(0xb4ac41ec)
	}
	{
		item = qs(0x48bca668)
	}
	{
		heading
		item = qs(0xcfe7e85d)
	}
	{
		item = qs(0x8d7e0b3d)
	}
	{
		heading
		item = qs(0xb8ef3f80)
	}
	{
		item = qs(0xd2515d00)
	}
	{
		heading
		item = qs(0x6733e199)
	}
	{
		item = qs(0x4e992301)
	}
	{
		item = qs(0x59ae8f8e)
	}
	{
		item = qs(0x90006dde)
	}
	{
		heading
		item = qs(0x28c63269)
	}
	{
		item = qs(0x78c457e5)
	}
	{
		heading
		item = qs(0x9cc45ece)
	}
	{
		item = qs(0x7a21c8af)
	}
	{
		item = qs(0xac04e013)
	}
	{
		heading
		item = qs(0x37086af4)
	}
	{
		item = qs(0x60c30cd8)
	}
	{
		item = qs(0xadcd8567)
	}
	{
		heading
		item = qs(0x02ee7164)
	}
	{
		item = qs(0x94624b55)
	}
	{
		heading
		item = qs(0xde92eb66)
	}
	{
		item = qs(0x5d421c7b)
	}
	{
		heading
		item = qs(0xb0be2186)
	}
	{
		item = qs(0x6e6ef5dd)
	}
	{
		heading
		item = qs(0x56f48738)
	}
	{
		item = qs(0x3096a35f)
	}
	{
		item = qs(0x55d8873e)
	}
	{
		item = qs(0x0c108419)
	}
	{
		heading
		item = qs(0x5363db58)
	}
	{
		item = qs(0xda2c7994)
	}
	{
		heading
		item = qs(0x88c67bbe)
	}
	{
		item = qs(0x304fa8f6)
	}
	{
		heading
		item = qs(0xc994b9ce)
	}
	{
		item = qs(0x1ae6c86e)
	}
	{
		heading
		item = qs(0x6250257a)
	}
	{
		item = qs(0xb4ac8e12)
	}
	{
		heading
		item = qs(0x481a96fc)
	}
	{
		item = qs(0x78ae065b)
	}
	{
		heading
		item = qs(0xde8cf467)
	}
	{
		item = qs(0x7ef60bfb)
	}
	{
		heading
		item = qs(0xc2bedb70)
	}
	{
		item = qs(0xa9c825be)
	}
	{
		item = qs(0xf9b1311d)
	}
	{
		heading
		item = qs(0x30406b99)
	}
	{
		item = qs(0x62997cda)
	}
	{
		item = qs(0xaa0ecaf1)
	}
	{
		item = qs(0xcacf4951)
	}
	{
		heading
		item = qs(0xdad49db5)
	}
	{
		item = qs(0xd6a56b4d)
	}
	{
		item = qs(0xdbcc9f1f)
	}
	{
		heading
		item = qs(0xa9ec62d1)
	}
	{
		item = qs(0x042de825)
	}
	{
		heading
		item = qs(0xb952199c)
	}
	{
		item = qs(0x20d4b712)
	}
	{
		heading
		item = qs(0x7bc09129)
	}
	{
		item = qs(0x500b9eec)
	}
	{
		heading
		item = qs(0xa939556a)
	}
	{
		item = qs(0x5396fedd)
	}
	{
		item = qs(0xb8b1bde8)
	}
	{
		heading
		item = qs(0xf73e9639)
	}
	{
		item = qs(0xc6bc76e6)
	}
	{
		item = qs(0xcb66ed0e)
	}
	{
		heading
		item = qs(0x680492b3)
	}
	{
		item = qs(0x884568b8)
	}
	{
		heading
		item = qs(0xff88df1b)
	}
	{
		item = qs(0xb4831d1c)
	}
	{
		heading
		item = qs(0x68076eef)
	}
	{
		item = qs(0x4d0188d3)
	}
	{
		heading
		item = qs(0xd9d09990)
	}
	{
		item = qs(0x9d84b5f1)
	}
	{
		heading
		item = qs(0xda07351b)
	}
	{
		item = qs(0xce2b6d78)
	}
	{
		heading
		item = qs(0xc3d70f53)
	}
	{
		item = qs(0xb6206a1a)
	}
	{
		heading
		item = qs(0xc3870664)
	}
	{
		item = qs(0xd94bbf82)
	}
	{
		heading
		item = qs(0xe5c2854b)
	}
	{
		item = qs(0x70734547)
	}
	{
		item = qs(0xcddcfd9e)
	}
	{
		heading
		item = qs(0x4fd0c11b)
	}
	{
		item = qs(0xc739659c)
	}
	{
		item = qs(0x27c31e11)
	}
	{
		heading
		item = qs(0xec86c701)
	}
	{
		item = qs(0x724fa823)
	}
	{
		item = qs(0xf507ee57)
	}
	{
		heading
		item = qs(0xbaa757e9)
	}
	{
		item = qs(0x331a2a1b)
	}
	{
		item = qs(0x9ed5e419)
	}
	{
		heading
		item = qs(0x3f6379eb)
	}
	{
		item = qs(0x6871ffec)
	}
	{
		heading
		item = qs(0xacc57d2e)
	}
	{
		item = qs(0xc13be96e)
	}
	{
		heading
		item = qs(0xa3937ece)
	}
	{
		item = qs(0x88a261aa)
	}
	{
		item = qs(0xce816a88)
	}
	{
		heading
		item = qs(0x9be3431f)
	}
	{
		item = qs(0x0b472361)
	}
	{
		item = qs(0xecde4f61)
	}
	{
		heading
		item = qs(0x1adbea50)
	}
	{
		item = qs(0xcc0d079c)
	}
	{
		heading
		item = qs(0x34c5b030)
	}
	{
		item = qs(0x8ac01c28)
	}
	{
		heading
		item = qs(0x7190cda0)
	}
	{
		item = qs(0x1cdbfc4d)
	}
	{
		heading
		item = qs(0x09a2332c)
	}
	{
		item = qs(0x2bb4d1f0)
	}
	{
		item = qs(0x748d375a)
	}
	{
		item = qs(0x51d34bb0)
	}
	{
		heading
		item = qs(0x946bc831)
	}
	{
		item = qs(0xa50660f0)
	}
	{
		heading
		item = qs(0x1832eb81)
	}
	{
		item = qs(0x53fdc092)
	}
	{
		item = qs(0x0bf51c3e)
	}
	{
		item = qs(0x8bbf416a)
	}
	{
		item = qs(0x98cb7681)
	}
]
credits_eu = [
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
		item = qs(0xdbba1864)
	}
	{
		item = qs(0x6051b8a7)
	}
	{
		item = qs(0x0487185c)
	}
	{
		item = qs(0xe32731a9)
	}
	{
		item = qs(0xe5f81df6)
	}
	{
		item = qs(0xe65f40f1)
	}
	{
		item = qs(0x8746e040)
	}
	{
		item = qs(0xc073315b)
	}
	{
		item = qs(0x708007b0)
	}
	{
		item = qs(0xdc0a7000)
	}
	{
		item = qs(0x82845fc4)
	}
	{
		item = qs(0x890b5138)
	}
	{
		item = qs(0x8e455288)
	}
	{
		item = qs(0xd3bf42bc)
	}
	{
		item = qs(0x3a3bb794)
	}
	{
		item = qs(0xc0a83b25)
	}
	{
		item = qs(0x7111b28b)
	}
	{
		item = qs(0x6f45af67)
	}
	{
		item = qs(0xaa2c90af)
	}
	{
		heading
		item = qs(0xbd68e84d)
	}
	{
		item = qs(0xe1702024)
	}
	{
		heading
		item = qs(0x7876e230)
	}
	{
		item = qs(0x67467ef7)
	}
	{
		item = qs(0xff41d1d6)
	}
	{
		heading
		item = qs(0xbf703b04)
	}
	{
		item = qs(0xb84214ee)
	}
	{
		heading
		item = qs(0x53381542)
	}
	{
		item = qs(0x97a22785)
	}
	{
		heading
		item = qs(0x0a030e88)
	}
	{
		item = qs(0xaad17d05)
	}
	{
		item = qs(0xd422896a)
	}
	{
		item = qs(0x3f8b22e2)
	}
	{
		item = qs(0x48e8af16)
	}
	{
		item = qs(0xa491f305)
	}
	{
		item = qs(0xfeb7bff5)
	}
	{
		heading
		item = qs(0x55e515b4)
	}
	{
		heading
		item = qs(0x0123089d)
	}
	{
		item = qs(0x5bbe9509)
	}
	{
		heading
		item = qs(0x1bb8dc8f)
	}
	{
		item = qs(0xf9388671)
	}
	{
		heading
		item = qs(0x7f4e4c4f)
	}
	{
		item = qs(0x07136b14)
	}
	{
		heading
		item = qs(0x97ac6d41)
	}
	{
		item = qs(0x608159d8)
	}
	{
		heading
		item = qs(0xe1bf45a9)
	}
	{
		item = qs(0x42e0ff6b)
	}
	{
		heading
		item = qs(0x74a49691)
	}
	{
		item = qs(0xd7084d86)
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
		item = qs(0xe5696f20)
	}
	{
		item = qs(0xe8f87f17)
	}
	{
		heading
		item = qs(0x086c055d)
	}
	{
		item = qs(0x26e8788b)
	}
	{
		heading
		item = qs(0x3d73e7a4)
	}
	{
		item = qs(0x13bcb1b6)
	}
	{
		item = qs(0x6782689e)
	}
	{
		item = qs(0x187c123d)
	}
	{
		heading
		item = qs(0x73e510b6)
	}
	{
		item = qs(0xe01876c8)
	}
	{
		heading
		item = qs(0xa7620173)
	}
	{
		heading
		item = qs(0x87cdacac)
	}
	{
		item = qs(0x7b0bb98d)
	}
	{
		heading
		item = qs(0x80bd83b8)
	}
	{
		item = qs(0x1d9962e4)
	}
	{
		heading
		item = qs(0xdc082730)
	}
	{
		item = qs(0x04b009d7)
	}
	{
		heading
		item = qs(0xaaad5230)
	}
	{
		item = qs(0xeb368afe)
	}
	{
		heading
		item = qs(0x40ef1a91)
	}
	{
		item = qs(0xb5284214)
	}
	{
		item = qs(0xccbc6a75)
	}
	{
		item = qs(0x04aa8358)
	}
	{
		item = qs(0xfea8ef8a)
	}
	{
		item = qs(0xb2c5d8a6)
	}
	{
		item = qs(0x1eedef02)
	}
	{
		item = qs(0x666dc681)
	}
	{
		item = qs(0xced2f085)
	}
	{
		item = qs(0x41110896)
	}
	{
		heading
		item = qs(0xe66ec149)
	}
	{
		item = qs(0xe2c17def)
	}
	{
		item = qs(0x6a929bcc)
	}
	{
		item = qs(0x7010de6c)
	}
	{
		item = qs(0x7ee2f66a)
	}
	{
		heading
		item = qs(0x894c374a)
	}
	{
		item = qs(0xd97588f2)
	}
	{
		item = qs(0x70452ea3)
	}
	{
		item = qs(0x32ab987c)
	}
	{
		item = qs(0x6d96e013)
	}
	{
		item = qs(0x07a7a180)
	}
	{
		item = qs(0x61036950)
	}
	{
		item = qs(0x25cbf4da)
	}
	{
		heading
		item = qs(0xafc5b578)
	}
	{
		item = qs(0x000ccc01)
	}
	{
		item = qs(0xd5eceb5f)
	}
	{
		item = qs(0x35fabacf)
	}
	{
		item = qs(0x5cbe94ed)
	}
	{
		item = qs(0x8fdc8d6f)
	}
	{
		item = qs(0xff38e639)
	}
	{
		heading
		item = qs(0xa7cf531d)
	}
	{
		item = qs(0x74e8b256)
	}
	{
		item = qs(0x8eccade7)
	}
	{
		item = qs(0xf716a549)
	}
	{
		heading
		item = qs(0xd0325e23)
	}
	{
		item = qs(0xed595939)
	}
	{
		item = qs(0xc562d97f)
	}
	{
		item = qs(0x4e546345)
	}
	{
		item = qs(0xb042d8f9)
	}
	{
		item = qs(0xde7cb1af)
	}
	{
		item = qs(0x5c121c20)
	}
	{
		item = qs(0x3de8432d)
	}
	{
		item = qs(0xebfd4bd3)
	}
	{
		item = qs(0xe212c3ef)
	}
	{
		item = qs(0xa40b65e7)
	}
	{
		item = qs(0xd8f965b6)
	}
	{
		item = qs(0x858dc050)
	}
	{
		heading
		item = qs(0x4a8ca6c7)
	}
	{
		item = qs(0x57c2ef6d)
	}
	{
		item = qs(0xf0bec703)
	}
	{
		item = qs(0xa9dea461)
	}
	{
		item = qs(0x794c2ee2)
	}
	{
		item = qs(0xb5fdfab0)
	}
	{
		item = qs(0x8e94f600)
	}
	{
		item = qs(0x6fe2aacd)
	}
	{
		item = qs(0x76b896e5)
	}
	{
		item = qs(0x8cecd703)
	}
	{
		item = qs(0x39cb3be3)
	}
	{
		item = qs(0xc3221fc4)
	}
	{
		item = qs(0xd54e60b3)
	}
	{
		heading
		item = qs(0xe56b344f)
	}
	{
		item = qs(0x50356fea)
	}
	{
		item = qs(0xdbad9f4d)
	}
	{
		item = qs(0xb1eadef4)
	}
	{
		item = qs(0x5d871761)
	}
	{
		item = qs(0xa2907cd1)
	}
	{
		item = qs(0xfae3285a)
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
		item = qs(0x9625a8a9)
	}
	{
		item = qs(0xa6e4d08a)
	}
	{
		item = qs(0x63b9fd19)
	}
	{
		heading
		item = qs(0xdcd7add8)
	}
	{
		item = qs(0xec19436e)
	}
	{
		item = qs(0xed9c3870)
	}
	{
		item = qs(0x9d36a923)
	}
	{
		item = qs(0xec7161c1)
	}
	{
		item = qs(0xb029b47f)
	}
	{
		item = qs(0x4ecc19b1)
	}
	{
		item = qs(0x435835be)
	}
	{
		item = qs(0x44dfec33)
	}
	{
		item = qs(0x112e1703)
	}
	{
		item = qs(0x070dbd2e)
	}
	{
		item = qs(0x11d01f3b)
	}
	{
		item = qs(0xb8090bde)
	}
	{
		item = qs(0x2a493543)
	}
	{
		item = qs(0x3ff71b76)
	}
	{
		item = qs(0xa4c7a097)
	}
	{
		item = qs(0x7b54e012)
	}
	{
		item = qs(0x56038986)
	}
	{
		item = qs(0x1bb1f7ff)
	}
	{
		item = qs(0x4df6ec1c)
	}
	{
		heading
		item = qs(0xd1f03d27)
	}
	{
		item = qs(0x10cf83b3)
	}
	{
		item = qs(0x08f5c771)
	}
	{
		item = qs(0xacd62b14)
	}
	{
		item = qs(0x4faee5d8)
	}
	{
		item = qs(0x3251bb1a)
	}
	{
		item = qs(0xd37dc04f)
	}
	{
		item = qs(0x545e06ad)
	}
	{
		item = qs(0xed0da341)
	}
	{
		heading
		item = qs(0x5693ea98)
	}
	{
		item = qs(0x75162b8a)
	}
	{
		item = qs(0x64460473)
	}
	{
		heading
		item = qs(0x39a29dd8)
	}
	{
		item = qs(0x39e7e552)
	}
	{
		item = qs(0x2d934f45)
	}
	{
		item = qs(0x9b673479)
	}
	{
		item = qs(0x417cd384)
	}
	{
		item = qs(0x0d8ea004)
	}
	{
		item = qs(0x5f63b3c9)
	}
	{
		item = qs(0x73039347)
	}
	{
		item = qs(0x2b5b8cde)
	}
	{
		item = qs(0xaee11745)
	}
	{
		item = qs(0x6a94af7c)
	}
	{
		item = qs(0xffe33d48)
	}
	{
		item = qs(0xd420dc26)
	}
	{
		item = qs(0x590a33cb)
	}
	{
		item = qs(0xb1fa4230)
	}
	{
		item = qs(0x5ab59159)
	}
	{
		item = qs(0x711c3196)
	}
	{
		item = qs(0xed19220b)
	}
	{
		item = qs(0xee136b6c)
	}
	{
		item = qs(0x1cfa18a7)
	}
	{
		item = qs(0x924a6e8e)
	}
	{
		item = qs(0x1ea0e23b)
	}
	{
		item = qs(0x6d3b21db)
	}
	{
		item = qs(0xd90bc159)
	}
	{
		item = qs(0x9a9b3844)
	}
	{
		item = qs(0x7fd74d1d)
	}
	{
		item = qs(0x1daad675)
	}
	{
		item = qs(0x22c5d069)
	}
	{
		item = qs(0x7efaa040)
	}
	{
		item = qs(0xf2d67e4b)
	}
	{
		item = qs(0xf6375e20)
	}
	{
		item = qs(0xe7b2342f)
	}
	{
		item = qs(0x53242b34)
	}
	{
		item = qs(0x5fec533f)
	}
	{
		item = qs(0x5d69c28f)
	}
	{
		item = qs(0x1e796514)
	}
	{
		item = qs(0x2693d62b)
	}
	{
		item = qs(0x214f2f8c)
	}
	{
		item = qs(0xc7324e2b)
	}
	{
		item = qs(0xe33acdd2)
	}
	{
		item = qs(0x1098bf30)
	}
	{
		item = qs(0x5bb8b6b5)
	}
	{
		item = qs(0x71cb894b)
	}
	{
		item = qs(0x664020eb)
	}
	{
		item = qs(0xba1e01a9)
	}
	{
		item = qs(0x03ff9c3a)
	}
	{
		item = qs(0x793fb051)
	}
	{
		heading
		item = qs(0x85b748f2)
	}
	{
		item = qs(0x3eceda76)
	}
	{
		item = qs(0x9e9bb5f1)
	}
	{
		item = qs(0x9b6003c1)
	}
	{
		item = qs(0xc028986f)
	}
	{
		item = qs(0x8f44ca91)
	}
	{
		item = qs(0xfbff94bb)
	}
	{
		item = qs(0x77e90800)
	}
	{
		item = qs(0x93077610)
	}
	{
		item = qs(0xce4f929f)
	}
	{
		item = qs(0x9ab97e9b)
	}
	{
		item = qs(0x6269545d)
	}
	{
		item = qs(0x83bd5a7a)
	}
	{
		item = qs(0xa00f9d07)
	}
	{
		item = qs(0xc933334a)
	}
	{
		item = qs(0x0002aaca)
	}
	{
		item = qs(0xd8a05013)
	}
	{
		item = qs(0x52f81a84)
	}
	{
		heading
		item = qs(0x77d5d15b)
	}
	{
		item = qs(0xdf41334d)
	}
	{
		item = qs(0x98f2d988)
	}
	{
		item = qs(0x5e2c3493)
	}
	{
		item = qs(0xad43aac5)
	}
	{
		heading
		item = qs(0xdc3e4c02)
	}
	{
		item = qs(0xbf5e2873)
	}
	{
		item = qs(0x631fe7bb)
	}
	{
		item = qs(0xc26ff7ce)
	}
	{
		item = qs(0xe5118008)
	}
	{
		item = qs(0xf4e8daad)
	}
	{
		item = qs(0xb25335f3)
	}
	{
		heading
		item = qs(0x9b2fefc3)
	}
	{
		item = qs(0x76655087)
	}
	{
		item = qs(0x1da8dad1)
	}
	{
		item = qs(0xfe4e4b36)
	}
	{
		heading
		item = qs(0xfe3c544a)
	}
	{
		item = qs(0xd75e1130)
	}
	{
		item = qs(0x4fcc0973)
	}
	{
		item = qs(0x66c71834)
	}
	{
		item = qs(0xd197430d)
	}
	{
		item = qs(0x8365d500)
	}
	{
		item = qs(0xa58db2b5)
	}
	{
		heading
		item = qs(0x54d0eb4b)
	}
	{
		item = qs(0xd75e1130)
	}
	{
		item = qs(0x521eb0aa)
	}
	{
		item = qs(0x114b1fc5)
	}
	{
		item = qs(0xafc22799)
	}
	{
		item = qs(0x81625a07)
	}
	{
		item = qs(0xe66cbd07)
	}
	{
		heading
		item = qs(0x9a141286)
	}
	{
		item = qs(0xb3849bf6)
	}
	{
		item = qs(0x2e28f716)
	}
	{
		item = qs(0xd196a52a)
	}
	{
		item = qs(0x2a93c4d2)
	}
	{
		item = qs(0x7db51f9a)
	}
	{
		item = qs(0x914d02f3)
	}
	{
		heading
		item = qs(0xa70b8de3)
	}
	{
		item = qs(0x59c9940c)
	}
	{
		item = qs(0xa51c97d8)
	}
	{
		item = qs(0x6c9edddd)
	}
	{
		heading
		item = qs(0x4037d6d1)
	}
	{
		item = qs(0x1d80fe47)
	}
	{
		item = qs(0x912d21b5)
	}
	{
		item = qs(0xd473a080)
	}
	{
		item = qs(0x101d1865)
	}
	{
		item = qs(0x63140aa3)
	}
	{
		item = qs(0xd46da3a0)
	}
	{
		item = qs(0x507b6470)
	}
	{
		item = qs(0x72352a4a)
	}
	{
		heading
		item = qs(0x9c14616e)
	}
	{
		item = qs(0xc361609e)
	}
	{
		item = qs(0x7aa3e4cf)
	}
	{
		item = qs(0xcb3c6b97)
	}
	{
		item = qs(0x198719a7)
	}
	{
		item = qs(0x8ed51518)
	}
	{
		item = qs(0xc9a53d32)
	}
	{
		item = qs(0x86b62edf)
	}
	{
		item = qs(0x74337c12)
	}
	{
		item = qs(0xf4a941d2)
	}
	{
		item = qs(0xecc16060)
	}
	{
		item = qs(0x83b526f2)
	}
	{
		item = qs(0xd6ad541f)
	}
	{
		item = qs(0x6618b49e)
	}
	{
		item = qs(0xb2476da1)
	}
	{
		item = qs(0x81f83cfd)
	}
	{
		item = qs(0x181315ea)
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
		item = qs(0xd24ea5ad)
	}
	{
		item = qs(0x888383ef)
	}
	{
		item = qs(0xb6f82fc3)
	}
	{
		heading
		item = qs(0x59dc6dff)
	}
	{
		item = qs(0xbcca6637)
	}
	{
		item = qs(0x4e6cb8a8)
	}
	{
		item = qs(0xcd270847)
	}
	{
		item = qs(0x8ac31758)
	}
	{
		item = qs(0x64d4a1b1)
	}
	{
		item = qs(0x8aa38082)
	}
	{
		item = qs(0x81d71886)
	}
	{
		heading
		item = qs(0xa8c17f6d)
	}
	{
		heading
		item = qs(0xd8afe829)
	}
	{
		item = qs(0x393e9427)
	}
	{
		item = qs(0x8ad5df96)
	}
	{
		heading
		item = qs(0xe9465c7c)
	}
	{
		item = qs(0xd70e79ac)
	}
	{
		heading
		item = qs(0xb4ac41ec)
	}
	{
		item = qs(0x48bca668)
	}
	{
		heading
		item = qs(0xcfe7e85d)
	}
	{
		item = qs(0x8d7e0b3d)
	}
	{
		heading
		item = qs(0xb8ef3f80)
	}
	{
		item = qs(0xd2515d00)
	}
	{
		heading
		item = qs(0x6733e199)
	}
	{
		item = qs(0x4e992301)
	}
	{
		item = qs(0x59ae8f8e)
	}
	{
		item = qs(0x90006dde)
	}
	{
		heading
		item = qs(0x28c63269)
	}
	{
		item = qs(0x78c457e5)
	}
	{
		heading
		item = qs(0x9cc45ece)
	}
	{
		item = qs(0x7a21c8af)
	}
	{
		item = qs(0xac04e013)
	}
	{
		heading
		item = qs(0x37086af4)
	}
	{
		item = qs(0x60c30cd8)
	}
	{
		item = qs(0xadcd8567)
	}
	{
		heading
		item = qs(0x02ee7164)
	}
	{
		item = qs(0x94624b55)
	}
	{
		heading
		item = qs(0xde92eb66)
	}
	{
		item = qs(0x5d421c7b)
	}
	{
		heading
		item = qs(0xb0be2186)
	}
	{
		item = qs(0x6e6ef5dd)
	}
	{
		heading
		item = qs(0x56f48738)
	}
	{
		item = qs(0x3096a35f)
	}
	{
		item = qs(0x55d8873e)
	}
	{
		item = qs(0x0c108419)
	}
	{
		heading
		item = qs(0x5363db58)
	}
	{
		item = qs(0xda2c7994)
	}
	{
		heading
		item = qs(0x88c67bbe)
	}
	{
		item = qs(0x304fa8f6)
	}
	{
		heading
		item = qs(0xc994b9ce)
	}
	{
		item = qs(0x1ae6c86e)
	}
	{
		heading
		item = qs(0x6250257a)
	}
	{
		item = qs(0xb4ac8e12)
	}
	{
		heading
		item = qs(0x481a96fc)
	}
	{
		item = qs(0x78ae065b)
	}
	{
		heading
		item = qs(0xde8cf467)
	}
	{
		item = qs(0x7ef60bfb)
	}
	{
		heading
		item = qs(0xc2bedb70)
	}
	{
		item = qs(0xa9c825be)
	}
	{
		item = qs(0xf9b1311d)
	}
	{
		heading
		item = qs(0x30406b99)
	}
	{
		item = qs(0x62997cda)
	}
	{
		item = qs(0xaa0ecaf1)
	}
	{
		item = qs(0xcacf4951)
	}
	{
		heading
		item = qs(0xdad49db5)
	}
	{
		item = qs(0x36a469f5)
	}
	{
		heading
		item = qs(0xa9ec62d1)
	}
	{
		item = qs(0x042de825)
	}
	{
		heading
		item = qs(0xb952199c)
	}
	{
		item = qs(0x20d4b712)
	}
	{
		heading
		item = qs(0x7bc09129)
	}
	{
		item = qs(0x500b9eec)
	}
	{
		heading
		item = qs(0xa939556a)
	}
	{
		item = qs(0x5396fedd)
	}
	{
		item = qs(0xb8b1bde8)
	}
	{
		heading
		item = qs(0xf73e9639)
	}
	{
		item = qs(0xc6bc76e6)
	}
	{
		item = qs(0xcb66ed0e)
	}
	{
		heading
		item = qs(0x680492b3)
	}
	{
		item = qs(0x884568b8)
	}
	{
		heading
		item = qs(0xff88df1b)
	}
	{
		item = qs(0xb4831d1c)
	}
	{
		heading
		item = qs(0x68076eef)
	}
	{
		item = qs(0x4d0188d3)
	}
	{
		heading
		item = qs(0xd9d09990)
	}
	{
		item = qs(0x9d84b5f1)
	}
	{
		heading
		item = qs(0xda07351b)
	}
	{
		item = qs(0xce2b6d78)
	}
	{
		heading
		item = qs(0xc3d70f53)
	}
	{
		item = qs(0xb6206a1a)
	}
	{
		heading
		item = qs(0xc3870664)
	}
	{
		item = qs(0xd94bbf82)
	}
	{
		heading
		item = qs(0xe5c2854b)
	}
	{
		item = qs(0x70734547)
	}
	{
		item = qs(0xcddcfd9e)
	}
	{
		heading
		item = qs(0x4fd0c11b)
	}
	{
		item = qs(0xc739659c)
	}
	{
		item = qs(0x27c31e11)
	}
	{
		heading
		item = qs(0xec86c701)
	}
	{
		item = qs(0x724fa823)
	}
	{
		item = qs(0xf507ee57)
	}
	{
		heading
		item = qs(0xbaa757e9)
	}
	{
		item = qs(0x331a2a1b)
	}
	{
		item = qs(0x9ed5e419)
	}
	{
		heading
		item = qs(0x3f6379eb)
	}
	{
		item = qs(0x6871ffec)
	}
	{
		heading
		item = qs(0xacc57d2e)
	}
	{
		item = qs(0xc13be96e)
	}
	{
		heading
		item = qs(0xa3937ece)
	}
	{
		item = qs(0x88a261aa)
	}
	{
		item = qs(0xce816a88)
	}
	{
		heading
		item = qs(0x9be3431f)
	}
	{
		item = qs(0x0b472361)
	}
	{
		item = qs(0xecde4f61)
	}
	{
		heading
		item = qs(0x1adbea50)
	}
	{
		item = qs(0xcc0d079c)
	}
	{
		heading
		item = qs(0x34c5b030)
	}
	{
		item = qs(0x8ac01c28)
	}
	{
		heading
		item = qs(0x7190cda0)
	}
	{
		item = qs(0x1cdbfc4d)
	}
	{
		heading
		item = qs(0x09a2332c)
	}
	{
		item = qs(0x2bb4d1f0)
	}
	{
		item = qs(0x748d375a)
	}
	{
		item = qs(0x51d34bb0)
	}
	{
		heading
		item = qs(0x946bc831)
	}
	{
		item = qs(0xa50660f0)
	}
	{
		heading
		item = qs(0x1832eb81)
	}
	{
		item = qs(0x53fdc092)
	}
	{
		item = qs(0x0bf51c3e)
	}
	{
		item = qs(0xc554311b)
	}
	{
		item = qs(0x98cb7681)
	}
]
