credits_menu_font = fontgrid_text_a1
credits_menu_scroll = horizontal

script ui_create_end_credits 

	SpawnScriptNow ui_create_end_credits_spawned params = {<...>}
endscript

script ui_create_end_credits_spawned 
	kill_gem_scroller
	Progression_EndCredits
endscript

script ui_destroy_end_credits 
	progression_set_credits_complete
endscript

script create_credits_menu 
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if NOT ($end_credits = 1)
		disable_pause
		create_loading_screen
		destroy_band
		unload_songqpak
		destroy_loading_screen
		spawnscript \{menu_music_on}
	endif
	PushAssetContext \{context = z_subway}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = credits_backdrop_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	TileSprite \{parent = credits_backdrop_container
		texture = credits_bg
		tile_dims = (2560.0, 720.0)
		dims = (1280.0, 720.0)
		Pos = (-1280.0, 0.0)}
	PopAssetContext
	RunScriptOnScreenElement TileSpriteLoop id = <id> params = {move_x = 5 move_y = 0}
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
	RunScriptOnScreenElement id = credits_backdrop_container scrolling_list_begin_credits params = <...>
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
		KillSpawnedScript \{Name = scrolling_list_begin_credits}
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

script scrolling_list_begin_credits 
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
		font = fontgrid_title_a1
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
		<rate> = 425.0
		<screen_height> = 280.0
		<scale_head> = 0.9
		<color_head> = [180 165 120 255]
		<scale_body> = 0.65000004
		<color_body> = [180 200 200 255]
		<scale_title> = 0.65000004
		<color_title> = [180 165 120 255]
	else
		<rate> = 380.0
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
		item = qs(0xda1fdbbc)
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
		item = qs(0xa46dc961)
	}
	{
		item = qs(0x5466c4e1)
	}
	{
		item = qs(0x66c6e698)
	}
	{
		item = qs(0xca1583f2)
	}
	{
		item = qs(0x736bc434)
	}
	{
		item = qs(0xe586429b)
	}
	{
		item = qs(0x2d9befe1)
	}
	{
		item = qs(0xfe8fa289)
	}
	{
		item = qs(0x2f44456d)
	}
	{
		item = qs(0x0aad5d59)
	}
	{
		item = qs(0x1c863057)
	}
	{
		item = qs(0x69e4d1dc)
	}
	{
		item = qs(0x32d188c4)
	}
	{
		item = qs(0x3b953bad)
	}
	{
		item = qs(0x41fb46d2)
	}
	{
		item = qs(0x35cc2d98)
	}
	{
		item = qs(0x69a72291)
	}
	{
		item = qs(0xff5f200e)
	}
	{
		item = qs(0x43478a2e)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xad686f76)
	}
	{
		item = qs(0xa5f60a35)
	}
	{
		item = qs(0x3ae18198)
	}
	{
		item = qs(0xeff5ffa4)
	}
	{
		item = qs(0xb645a734)
	}
	{
		item = qs(0xaee4ffbb)
	}
	{
		item = qs(0xb56d1ae7)
	}
	{
		item = qs(0x82fc1b4c)
	}
	{
		item = qs(0xc9205392)
	}
	{
		item = qs(0xf9bc4d00)
	}
	{
		item = qs(0xcca21076)
	}
	{
		item = qs(0xc4d28a8b)
	}
	{
		item = qs(0xf664cc4d)
	}
	{
		item = qs(0x9fd3b82b)
	}
	{
		item = qs(0xf1f85cc9)
	}
	{
		item = qs(0x3a744fd8)
	}
	{
		item = qs(0xae3d1a72)
	}
	{
		item = qs(0xc3a7b28c)
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
		item = qs(0x7d5ec6be)
	}
	{
		item = qs(0x977b1a99)
	}
	{
		item = qs(0xe1d891be)
	}
	{
		item = qs(0x472a29a4)
	}
	{
		item = qs(0xfef17821)
	}
	{
		item = qs(0xa839d238)
	}
	{
		item = qs(0x5c49bc4d)
	}
	{
		item = qs(0x1780e4cf)
	}
	{
		item = qs(0x0197afa9)
	}
	{
		item = qs(0x4cdc8133)
	}
	{
		item = qs(0x7c2e53a2)
	}
	{
		item = qs(0x3b08b97d)
	}
	{
		item = qs(0x8cf6105c)
	}
	{
		item = qs(0x54c65055)
	}
	{
		item = qs(0x9372be31)
	}
	{
		item = qs(0x9e823d32)
	}
	{
		item = qs(0x4bca91b5)
	}
	{
		item = qs(0xeddb006a)
	}
	{
		item = qs(0x14238a5c)
	}
	{
		item = qs(0xddaccc0a)
	}
	{
		item = qs(0xcf81dc04)
	}
	{
		item = qs(0x6ac79a27)
	}
	{
		item = qs(0x7fa11717)
	}
	{
		item = qs(0x268cb380)
	}
	{
		item = qs(0x88ea4c58)
	}
	{
		item = qs(0x677f4b96)
	}
	{
		item = qs(0x174cddad)
	}
	{
		item = qs(0x928e053a)
	}
	{
		item = qs(0x82cd3d76)
	}
	{
		item = qs(0x0ffd144a)
	}
	{
		item = qs(0x0207b28e)
	}
	{
		item = qs(0x9d04fd8e)
	}
	{
		item = qs(0x099fb536)
	}
	{
		item = qs(0xdd5ac6f0)
	}
	{
		item = qs(0x6d8e679f)
	}
	{
		item = qs(0x500b9c19)
	}
	{
		item = qs(0x7e888628)
	}
	{
		item = qs(0xde817619)
	}
	{
		item = qs(0x0f885cfc)
	}
	{
		item = qs(0x4448d67d)
	}
	{
		item = qs(0x7ab7787e)
	}
	{
		item = qs(0xb1c10bdc)
	}
	{
		item = qs(0xfa2a0903)
	}
	{
		item = qs(0xa959dc45)
	}
	{
		item = qs(0x2adc9549)
	}
	{
		heading
		item = qs(0x44722efb)
	}
	{
		item = qs(0xa9536e7b)
	}
	{
		item = qs(0x886ab4bc)
	}
	{
		heading
		item = qs(0x88e4482f)
	}
	{
		item = qs(0x01c433fe)
	}
	{
		item = qs(0x912780a8)
	}
	{
		item = qs(0xcd3a09a8)
	}
	{
		item = qs(0xf39163f9)
	}
	{
		item = qs(0x03a0fc25)
	}
	{
		item = qs(0x52b682fc)
	}
	{
		item = qs(0x0235461c)
	}
	{
		item = qs(0x44424f0e)
	}
	{
		item = qs(0xce5364b8)
	}
	{
		item = qs(0xab90f1f8)
	}
	{
		item = qs(0xb116d15c)
	}
	{
		item = qs(0x2dc26c26)
	}
	{
		item = qs(0x01e4f829)
	}
	{
		item = qs(0x258af1c9)
	}
	{
		item = qs(0xefe2140d)
	}
	{
		item = qs(0xf2031c4e)
	}
	{
		heading
		item = qs(0x5fd190d9)
	}
	{
		item = qs(0x7d7ce26b)
	}
	{
		item = qs(0xb3790df1)
	}
	{
		item = qs(0x2f40eb81)
	}
	{
		heading
		item = qs(0x54b18d8b)
	}
	{
		item = qs(0x4c35ea71)
	}
	{
		item = qs(0x39388d04)
	}
	{
		item = qs(0x16498756)
	}
	{
		item = qs(0x68e7320b)
	}
	{
		item = qs(0x10f52b82)
	}
	{
		heading
		item = qs(0x72c4f2f5)
	}
	{
		item = qs(0x99379ec7)
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
		item = qs(0xbcfbe1d1)
	}
	{
		item = qs(0xefdbb206)
	}
	{
		heading
		item = qs(0x6c89e64a)
	}
	{
		heading
		item = qs(0x203330ca)
	}
	{
		item = qs(0x339f943d)
	}
	{
		heading
		item = qs(0x54eb85ee)
	}
	{
		item = qs(0x693768b2)
	}
	{
		heading
		item = qs(0x2cea23a7)
	}
	{
		item = qs(0x5715704a)
	}
	{
		heading
		item = qs(0x1532dba5)
	}
	{
		item = qs(0x3018162c)
	}
	{
		heading
		item = qs(0xa64a9f64)
	}
	{
		item = qs(0x0224e010)
	}
	{
		heading
		item = qs(0x97c5e8d7)
	}
	{
		item = qs(0xc547a51a)
	}
	{
		item = qs(0xa29d4897)
	}
	{
		heading
		item = qs(0xc927a81f)
	}
	{
		item = qs(0xe9b5c568)
	}
	{
		heading
		item = qs(0x1063e816)
	}
	{
		item = qs(0xd0e9f122)
	}
	{
		heading
		item = qs(0x448f6551)
	}
	{
		item = qs(0x7cab7049)
	}
	{
		heading
		item = qs(0x19c44938)
	}
	{
		item = qs(0xa1e016a0)
	}
	{
		heading
		item = qs(0x556c2f93)
	}
	{
		item = qs(0x264f26ec)
	}
	{
		heading
		item = qs(0xf643006c)
	}
	{
		item = qs(0x6b9b236b)
	}
	{
		heading
		item = qs(0xd6ef8ad3)
	}
	{
		item = qs(0x29a60ffc)
	}
	{
		heading
		item = qs(0x70fe18f3)
	}
	{
		item = qs(0x96d7157e)
	}
	{
		item = qs(0x1ff34bad)
	}
	{
		heading
		item = qs(0xb4324cbf)
	}
	{
		item = qs(0x80c19cc6)
	}
	{
		heading
		item = qs(0xf39d1ad5)
	}
	{
		item = qs(0xdb50ab07)
	}
	{
		item = qs(0x00c994b1)
	}
	{
		item = qs(0xe56b7970)
	}
	{
		heading
		item = qs(0xbf50769d)
	}
	{
		item = qs(0x822bbe36)
	}
	{
		heading
		item = qs(0x2bfacf63)
	}
	{
		item = qs(0x8fddbcf8)
	}
	{
		heading
		item = qs(0xb82fc5a2)
	}
	{
		item = qs(0xa7de80fa)
	}
	{
		heading
		item = qs(0xd519ad02)
	}
	{
		item = qs(0x8a6359fc)
	}
	{
		heading
		item = qs(0xca8d617d)
	}
	{
		item = qs(0x9c4f885f)
	}
	{
		heading
		item = qs(0xb019c932)
	}
	{
		item = qs(0x3a02452b)
	}
	{
		heading
		item = qs(0x9b63cff8)
	}
	{
		item = qs(0x8a6e3b93)
	}
	{
		item = qs(0x16617d72)
	}
	{
		item = qs(0xad80609c)
	}
	{
		item = qs(0x74c5d11c)
	}
	{
		item = qs(0x22010bd5)
	}
	{
		item = qs(0x627eaf6b)
	}
	{
		item = qs(0x26fddeeb)
	}
	{
		item = qs(0x84839780)
	}
	{
		item = qs(0x0479c843)
	}
	{
		item = qs(0x6ae48ca1)
	}
	{
		heading
		item = qs(0xd0325e23)
	}
	{
		item = qs(0xa1b18684)
	}
	{
		item = qs(0x76d0ba18)
	}
	{
		item = qs(0x0868eddb)
	}
	{
		item = qs(0x5b0e8d7d)
	}
	{
		item = qs(0x43001ea5)
	}
	{
		item = qs(0x514602e8)
	}
	{
		item = qs(0x551b6135)
	}
	{
		item = qs(0x2f1809b8)
	}
	{
		item = qs(0xd92799fc)
	}
	{
		item = qs(0x6bb1cb6a)
	}
	{
		item = qs(0x6b46f120)
	}
	{
		heading
		item = qs(0x894c374a)
	}
	{
		item = qs(0x433bbb83)
	}
	{
		item = qs(0x16be2d45)
	}
	{
		item = qs(0x00a6729d)
	}
	{
		item = qs(0x1c277fb4)
	}
	{
		item = qs(0xb0745005)
	}
	{
		item = qs(0x4741a983)
	}
	{
		item = qs(0xbddb1f7c)
	}
	{
		heading
		item = qs(0xe427df17)
	}
	{
		item = qs(0x10014107)
	}
	{
		item = qs(0x4fe5b03b)
	}
	{
		item = qs(0x20012b88)
	}
	{
		item = qs(0xa5f49fb7)
	}
	{
		item = qs(0xff7afeab)
	}
	{
		item = qs(0xf8f82332)
	}
	{
		heading
		item = qs(0x89b1aa8d)
	}
	{
		item = qs(0xb179fd46)
	}
	{
		item = qs(0x387750da)
	}
	{
		item = qs(0x5e7b0b50)
	}
	{
		item = qs(0xa4a0ad11)
	}
	{
		heading
		item = qs(0xd0325e23)
	}
	{
		item = qs(0xaca470b5)
	}
	{
		item = qs(0x4cbd0b2b)
	}
	{
		item = qs(0xfd120924)
	}
	{
		item = qs(0x16273ae9)
	}
	{
		item = qs(0x6c65ecf3)
	}
	{
		item = qs(0x7793d265)
	}
	{
		item = qs(0x0eebe21f)
	}
	{
		item = qs(0x4374bbbe)
	}
	{
		item = qs(0x14d5fc34)
	}
	{
		item = qs(0xe4bd4508)
	}
	{
		heading
		item = qs(0x4a8ca6c7)
	}
	{
		item = qs(0x906ef1ba)
	}
	{
		item = qs(0x7e4d852b)
	}
	{
		item = qs(0x18384d5a)
	}
	{
		item = qs(0x6264887f)
	}
	{
		item = qs(0xd1078524)
	}
	{
		item = qs(0x217f8156)
	}
	{
		item = qs(0x370c0552)
	}
	{
		item = qs(0xb3b87a0b)
	}
	{
		item = qs(0x7749bd6d)
	}
	{
		item = qs(0xc8d0fccb)
	}
	{
		item = qs(0x875984da)
	}
	{
		item = qs(0x056badff)
	}
	{
		item = qs(0x14cf7ea5)
	}
	{
		heading
		item = qs(0xe56b344f)
	}
	{
		item = qs(0x46e31c34)
	}
	{
		item = qs(0x0e28ffaa)
	}
	{
		item = qs(0xfb82e982)
	}
	{
		item = qs(0xc4ed152c)
	}
	{
		item = qs(0xac09aa22)
	}
	{
		item = qs(0x9f7c525d)
	}
	{
		item = qs(0xf34775f5)
	}
	{
		item = qs(0x9d4e6b43)
	}
	{
		item = qs(0xb751c976)
	}
	{
		heading
		item = qs(0xa217a7e7)
	}
	{
		item = qs(0x17ebf9db)
	}
	{
		item = qs(0xb00de132)
	}
	{
		item = qs(0x132bb21e)
	}
	{
		item = qs(0xeb108346)
	}
	{
		item = qs(0x8165b07d)
	}
	{
		heading
		item = qs(0x55fefa6c)
	}
	{
		item = qs(0x9fd4d84e)
	}
	{
		item = qs(0xab1ba71c)
	}
	{
		item = qs(0xb0a5fae5)
	}
	{
		item = qs(0xeefd4428)
	}
	{
		item = qs(0x9904659d)
	}
	{
		item = qs(0x6fb52afe)
	}
	{
		heading
		item = qs(0xc6b1271e)
	}
	{
		item = qs(0xbf2408dc)
	}
	{
		item = qs(0x8bd52cc8)
	}
	{
		item = qs(0xb30f1126)
	}
	{
		item = qs(0x7cd8fb95)
	}
	{
		item = qs(0x694bbf8c)
	}
	{
		item = qs(0x6accff71)
	}
	{
		heading
		item = qs(0x5d7bb297)
	}
	{
		item = qs(0x1bb65834)
	}
	{
		item = qs(0xef9c36c7)
	}
	{
		item = qs(0x92767a58)
	}
	{
		item = qs(0x7489556b)
	}
	{
		item = qs(0x86d12bff)
	}
	{
		item = qs(0x2ce9ecfd)
	}
	{
		heading
		item = qs(0xb226bb9e)
	}
	{
		item = qs(0x04807080)
	}
	{
		item = qs(0xc4029dea)
	}
	{
		item = qs(0xa5fe4019)
	}
	{
		item = qs(0xbeb54a96)
	}
	{
		item = qs(0x7f92a2db)
	}
	{
		heading
		item = qs(0xacf49fe3)
	}
	{
		item = qs(0xb52e0558)
	}
	{
		item = qs(0x8dfe6570)
	}
	{
		heading
		item = qs(0x7238f64d)
	}
	{
		item = qs(0x10cf83b3)
	}
	{
		item = qs(0x776238cd)
	}
	{
		item = qs(0xa383997f)
	}
	{
		item = qs(0xccdee522)
	}
	{
		item = qs(0x368c9cdb)
	}
	{
		item = qs(0x51132e42)
	}
	{
		item = qs(0x745648e8)
	}
	{
		item = qs(0xab7e77a6)
	}
	{
		item = qs(0x9ea3d355)
	}
	{
		item = qs(0x208940fd)
	}
	{
		heading
		item = qs(0x5693ea98)
	}
	{
		item = qs(0x3c5aa25c)
	}
	{
		item = qs(0x13853484)
	}
	{
		heading
		item = qs(0x254a644a)
	}
	{
		item = qs(0x928aca83)
	}
	{
		item = qs(0xc8191224)
	}
	{
		item = qs(0xac235c04)
	}
	{
		item = qs(0xf371d02c)
	}
	{
		item = qs(0xc7b00d64)
	}
	{
		item = qs(0x71a1c311)
	}
	{
		item = qs(0x6118995b)
	}
	{
		item = qs(0x1bc8bc88)
	}
	{
		item = qs(0x469ebd79)
	}
	{
		item = qs(0x10027043)
	}
	{
		item = qs(0x1f43129f)
	}
	{
		item = qs(0x8824f14c)
	}
	{
		item = qs(0x0062e0d9)
	}
	{
		item = qs(0x155447fa)
	}
	{
		item = qs(0x5efbfd94)
	}
	{
		item = qs(0x60d4dde9)
	}
	{
		item = qs(0x4e73e245)
	}
	{
		item = qs(0x10435b77)
	}
	{
		item = qs(0x67c741fa)
	}
	{
		item = qs(0x18e078d1)
	}
	{
		item = qs(0xdff450d1)
	}
	{
		item = qs(0xec1b7847)
	}
	{
		item = qs(0xbe76a5c3)
	}
	{
		item = qs(0xcc3333ca)
	}
	{
		item = qs(0x5c16c95e)
	}
	{
		item = qs(0xa3fc26bb)
	}
	{
		item = qs(0xb1c31594)
	}
	{
		item = qs(0x507a70e6)
	}
	{
		item = qs(0xefae56ce)
	}
	{
		item = qs(0x14ad7d0e)
	}
	{
		item = qs(0xc2b6dde6)
	}
	{
		item = qs(0x8a520a7d)
	}
	{
		item = qs(0x59cd5265)
	}
	{
		item = qs(0xa445e387)
	}
	{
		item = qs(0xa735c62c)
	}
	{
		item = qs(0x78acef85)
	}
	{
		item = qs(0xd44486eb)
	}
	{
		item = qs(0x7e535686)
	}
	{
		item = qs(0x1940ab8e)
	}
	{
		item = qs(0xb82ec9d1)
	}
	{
		item = qs(0x2c1f107a)
	}
	{
		item = qs(0xd5dd4e52)
	}
	{
		item = qs(0x238e817f)
	}
	{
		item = qs(0xfcfa389b)
	}
	{
		item = qs(0x337a8441)
	}
	{
		item = qs(0x320560f9)
	}
	{
		item = qs(0x53d269c6)
	}
	{
		item = qs(0xae1a2901)
	}
	{
		heading
		item = qs(0x6a8a04bf)
	}
	{
		item = qs(0xfa97453d)
	}
	{
		item = qs(0x1dd0ea3b)
	}
	{
		item = qs(0xa56d349f)
	}
	{
		item = qs(0x5fcbad2c)
	}
	{
		item = qs(0x8c80b87c)
	}
	{
		item = qs(0x47a6052a)
	}
	{
		item = qs(0x34e88aa5)
	}
	{
		item = qs(0x3a724caa)
	}
	{
		item = qs(0xe54bc939)
	}
	{
		item = qs(0xf1b336d8)
	}
	{
		heading
		item = qs(0xa9c7a812)
	}
	{
		item = qs(0x0c7e1d6d)
	}
	{
		item = qs(0x4b26f620)
	}
	{
		item = qs(0x39d8c32f)
	}
	{
		item = qs(0x1fded3f1)
	}
	{
		item = qs(0x135ba726)
	}
	{
		item = qs(0x65ab2a71)
	}
	{
		item = qs(0xd5f3882e)
	}
	{
		item = qs(0xc13f530c)
	}
	{
		item = qs(0xb491bb93)
	}
	{
		item = qs(0x596ca171)
	}
	{
		item = qs(0x5b95613b)
	}
	{
		item = qs(0x3e410f45)
	}
	{
		item = qs(0x2f189f6b)
	}
	{
		item = qs(0xe9cbfa10)
	}
	{
		item = qs(0xb4ea2b12)
	}
	{
		heading
		item = qs(0x6da38be8)
	}
	{
		item = qs(0xfe72f248)
	}
	{
		item = qs(0x8da1f0b0)
	}
	{
		item = qs(0x0adbafb8)
	}
	{
		item = qs(0x7bd2a2a5)
	}
	{
		heading
		item = qs(0x8a232966)
	}
	{
		item = qs(0x3293bb6d)
	}
	{
		item = qs(0xef5a0c39)
	}
	{
		item = qs(0x186c3f99)
	}
	{
		item = qs(0xa53b72bb)
	}
	{
		item = qs(0xd06b78be)
	}
	{
		item = qs(0xa684036d)
	}
	{
		heading
		item = qs(0xedc6fdb6)
	}
	{
		item = qs(0x51c19a0e)
	}
	{
		item = qs(0x6d09c842)
	}
	{
		item = qs(0xd13458f2)
	}
	{
		heading
		item = qs(0x0320a808)
	}
	{
		item = qs(0x4d37c216)
	}
	{
		item = qs(0x12ebed69)
	}
	{
		item = qs(0x8f9df77c)
	}
	{
		item = qs(0x83e1a318)
	}
	{
		item = qs(0x4242f853)
	}
	{
		item = qs(0x0c4d3725)
	}
	{
		heading
		item = qs(0x54d0eb4b)
	}
	{
		item = qs(0xcf9b9ca0)
	}
	{
		item = qs(0xc88689a2)
	}
	{
		item = qs(0xba04e428)
	}
	{
		item = qs(0xaedeb080)
	}
	{
		item = qs(0x16da40d0)
	}
	{
		item = qs(0x1ecae410)
	}
	{
		heading
		item = qs(0x275698c2)
	}
	{
		item = qs(0x9619c586)
	}
	{
		item = qs(0x72bc4c04)
	}
	{
		item = qs(0x07d95132)
	}
	{
		item = qs(0x67cc9763)
	}
	{
		item = qs(0x0049b7da)
	}
	{
		item = qs(0x7d343f27)
	}
	{
		heading
		item = qs(0xdc8b13dc)
	}
	{
		item = qs(0x643217d4)
	}
	{
		item = qs(0xf4b158cf)
	}
	{
		item = qs(0xa9183304)
	}
	{
		heading
		item = qs(0xdf6b1f76)
	}
	{
		item = qs(0xd3fdee71)
	}
	{
		heading
		item = qs(0xbc468bcd)
	}
	{
		item = qs(0xa183ca16)
	}
	{
		item = qs(0xdad6bdba)
	}
	{
		item = qs(0xdcf701e4)
	}
	{
		item = qs(0x443b345f)
	}
	{
		item = qs(0x97504ba5)
	}
	{
		heading
		item = qs(0xd1427b06)
	}
	{
		item = qs(0xe4c8500e)
	}
	{
		item = qs(0xf151c72a)
	}
	{
		item = qs(0x0ca705ac)
	}
	{
		item = qs(0xb5619245)
	}
	{
		item = qs(0x58d2fbd9)
	}
	{
		item = qs(0xc5735938)
	}
	{
		item = qs(0xee0c5e21)
	}
	{
		item = qs(0xcc6b9a1e)
	}
	{
		item = qs(0x56c5ece7)
	}
	{
		item = qs(0xed7326a0)
	}
	{
		item = qs(0x9fef66ba)
	}
	{
		item = qs(0x762350df)
	}
	{
		item = qs(0x817401dd)
	}
	{
		item = qs(0xfa89afcc)
	}
	{
		item = qs(0xf6dce186)
	}
	{
		item = qs(0x9ad35724)
	}
	{
		item = qs(0x660111df)
	}
	{
		item = qs(0xccfcbf81)
	}
	{
		item = qs(0x04aa7aca)
	}
	{
		item = qs(0xb0ce4a55)
	}
	{
		item = qs(0x27fc81b6)
	}
	{
		heading
		item = qs(0xa8c17f6d)
	}
	{
		heading
		item = qs(0x12d59066)
	}
	{
		item = qs(0x6bc82d05)
	}
	{
		item = qs(0xa036f4ae)
	}
	{
		heading
		item = qs(0xed7afb12)
	}
	{
		item = qs(0x7cdc5a98)
	}
	{
		item = qs(0x7bd32594)
	}
	{
		heading
		item = qs(0xf3004b40)
	}
	{
		item = qs(0x4acc7a57)
	}
	{
		item = qs(0xd65ce2cd)
	}
	{
		heading
		item = qs(0x326cacb5)
	}
	{
		item = qs(0x1fc63cbc)
	}
	{
		heading
		item = qs(0xd3f139da)
	}
	{
		item = qs(0x7a1a2599)
	}
	{
		heading
		item = qs(0xcdcbb95b)
	}
	{
		item = qs(0xdb81966e)
	}
	{
		item = qs(0x2baef2d3)
	}
	{
		heading
		item = qs(0xfbcbde40)
	}
	{
		item = qs(0xec7119db)
	}
	{
		item = qs(0x577ce957)
	}
	{
		heading
		item = qs(0xa084eda9)
	}
	{
		item = qs(0x20d6e6a5)
	}
	{
		item = qs(0x03542ba5)
	}
	{
		heading
		item = qs(0x4f73912d)
	}
	{
		item = qs(0x8bb3c584)
	}
	{
		heading
		item = qs(0x643ea940)
	}
	{
		item = qs(0xfc834e23)
	}
	{
		item = qs(0xbb107da1)
	}
	{
		heading
		item = qs(0xd9771a22)
	}
	{
		item = qs(0xe0a5655e)
	}
	{
		item = qs(0x502c579b)
	}
	{
		heading
		item = qs(0x04a428e0)
	}
	{
		item = qs(0x8918ad03)
	}
	{
		item = qs(0x4da6037d)
	}
	{
		heading
		item = qs(0x7e52c31f)
	}
	{
		item = qs(0x93ab3f9f)
	}
	{
		heading
		item = qs(0xcf78ed83)
	}
	{
		item = qs(0x1d99c6fc)
	}
	{
		item = qs(0x3f3f4257)
	}
	{
		heading
		item = qs(0xdb1f3bdd)
	}
	{
		item = qs(0xc469c23b)
	}
	{
		item = qs(0xbf1c20e8)
	}
	{
		heading
		item = qs(0x5fe2ba0e)
	}
	{
		item = qs(0xf57aad23)
	}
	{
		item = qs(0x169925a8)
	}
	{
		heading
		item = qs(0x2ffb65f3)
	}
	{
		item = qs(0xc6f03263)
	}
	{
		heading
		item = qs(0x560c3997)
	}
	{
		item = qs(0x8ce0ef24)
	}
	{
		item = qs(0x384a7faf)
	}
	{
		heading
		item = qs(0x1ddf3c9b)
	}
	{
		item = qs(0xfa603935)
	}
	{
		item = qs(0x34d2f608)
	}
	{
		heading
		item = qs(0x968d9a49)
	}
	{
		item = qs(0x79669c05)
	}
	{
		item = qs(0xea2c2851)
	}
	{
		item = qs(0x6d7041dc)
	}
	{
		heading
		item = qs(0x71b29fbc)
	}
	{
		item = qs(0x5ea50fda)
	}
	{
		item = qs(0xd565de77)
	}
	{
		heading
		item = qs(0x1afb5811)
	}
	{
		item = qs(0xb7a4ea07)
	}
	{
		item = qs(0xeb7be44c)
	}
	{
		heading
		item = qs(0xe02a33a8)
	}
	{
		item = qs(0x39747495)
	}
	{
		item = qs(0x675a3ba5)
	}
	{
		heading
		item = qs(0x6180ce43)
	}
	{
		item = qs(0x2e1e513b)
	}
	{
		item = qs(0x2ac90124)
	}
	{
		heading
		item = qs(0x56a7e715)
	}
	{
		item = qs(0xdb5770d4)
	}
	{
		item = qs(0x2695d615)
	}
	{
		heading
		item = qs(0xcb696786)
	}
	{
		item = qs(0xbc099ef2)
	}
	{
		item = qs(0x3773e3b8)
	}
	{
		heading
		item = qs(0xc95bdb12)
	}
	{
		item = qs(0x9ce345a6)
	}
	{
		heading
		item = qs(0x06bb132a)
	}
	{
		item = qs(0xd40df6dc)
	}
	{
		item = qs(0xa08c9903)
	}
	{
		heading
		item = qs(0x09f899fe)
	}
	{
		item = qs(0xebb73ef1)
	}
	{
		heading
		item = qs(0x8c899cab)
	}
	{
		item = qs(0xaab72363)
	}
	{
		item = qs(0x24da4e80)
	}
	{
		heading
		item = qs(0x9c26af16)
	}
	{
		item = qs(0xbb89dcc0)
	}
	{
		item = qs(0x3f67ecfd)
	}
	{
		heading
		item = qs(0x1d0e5d20)
	}
	{
		item = qs(0xef6db200)
	}
	{
		item = qs(0x5123c921)
	}
	{
		heading
		item = qs(0xa2b25eab)
	}
	{
		item = qs(0xc0af6907)
	}
	{
		item = qs(0xda49a7f6)
	}
	{
		heading
		item = qs(0x543b61eb)
	}
	{
		item = qs(0xf67ac092)
	}
	{
		item = qs(0xda001a08)
	}
	{
		heading
		item = qs(0x8f6a4dbc)
	}
	{
		item = qs(0xf326896b)
	}
	{
		item = qs(0xba688d0e)
	}
	{
		heading
		item = qs(0x558ba46e)
	}
	{
		item = qs(0x4ced5a3a)
	}
	{
		item = qs(0x5c9b5a86)
	}
	{
		heading
		item = qs(0xcc82023f)
	}
	{
		item = qs(0xf2584c08)
	}
	{
		item = qs(0xbf0498f5)
	}
	{
		heading
		item = qs(0x758adce4)
	}
	{
		item = qs(0xd185b5bd)
	}
	{
		item = qs(0xdf9723ea)
	}
	{
		heading
		item = qs(0x6cc39cc6)
	}
	{
		item = qs(0xa863430b)
	}
	{
		item = qs(0x8b19bf4f)
	}
	{
		heading
		item = qs(0xce396ee1)
	}
	{
		item = qs(0x9ee1c19e)
	}
	{
		item = qs(0x65904fed)
	}
	{
		heading
		item = qs(0x0cb8fc18)
	}
	{
		item = qs(0x7d680916)
	}
	{
		item = qs(0xe3cfee68)
	}
	{
		heading
		item = qs(0x6f0c30ea)
	}
	{
		item = qs(0x6033cbc6)
	}
	{
		item = qs(0xa6c5b81d)
	}
	{
		heading
		item = qs(0x90437984)
	}
	{
		item = qs(0x1b82a74e)
	}
	{
		item = qs(0x29637d36)
	}
	{
		heading
		item = qs(0x7c1a7e6c)
	}
	{
		item = qs(0x7b0c8276)
	}
	{
		item = qs(0xab5a9035)
	}
	{
		heading
		item = qs(0xcf53a448)
	}
	{
		item = qs(0x6e507de3)
	}
	{
		item = qs(0x5e0f73fe)
	}
	{
		heading
		item = qs(0x3448a8f9)
	}
	{
		item = qs(0x77ff89a4)
	}
	{
		heading
		item = qs(0xacf869ea)
	}
	{
		item = qs(0x33c476d2)
	}
	{
		item = qs(0xbf0945e8)
	}
	{
		heading
		item = qs(0x68c79fdb)
	}
	{
		item = qs(0xbe7226a9)
	}
	{
		item = qs(0x16d18dad)
	}
	{
		heading
		item = qs(0x26ac26be)
	}
	{
		item = qs(0xaefedd0a)
	}
	{
		item = qs(0x173d52e0)
	}
	{
		heading
		item = qs(0x5654910e)
	}
	{
		item = qs(0x00dddde9)
	}
	{
		item = qs(0x61b642ec)
	}
	{
		heading
		item = qs(0xdfbc4f93)
	}
	{
		item = qs(0xb3055eaa)
	}
	{
		item = qs(0x068d6157)
	}
	{
		heading
		item = qs(0x07df8038)
	}
	{
		item = qs(0xd42f829b)
	}
	{
		item = qs(0x20fe7f0d)
	}
	{
		heading
		item = qs(0x7a295daf)
	}
	{
		item = qs(0x2dae3a30)
	}
	{
		item = qs(0xae5d4755)
	}
	{
		heading
		item = qs(0x9f36b8d9)
	}
	{
		item = qs(0x6d3ec75a)
	}
	{
		heading
		item = qs(0xf22848b3)
	}
	{
		item = qs(0xac009e08)
	}
	{
		item = qs(0xc76b99ab)
	}
	{
		heading
		item = qs(0xfaa21a8d)
	}
	{
		item = qs(0x57773b0a)
	}
	{
		item = qs(0x30346ae4)
	}
	{
		heading
		item = qs(0x3aac966e)
	}
	{
		item = qs(0xaa3f0f1f)
	}
	{
		item = qs(0x8899ea65)
	}
	{
		item = qs(0xb3fc785b)
	}
	{
		item = qs(0x32c7abb0)
	}
	{
		heading
		item = qs(0xd0bc9d6e)
	}
	{
		item = qs(0xb88dc79a)
	}
	{
		item = qs(0x16dac3b5)
	}
	{
		heading
		item = qs(0xcf7ce314)
	}
	{
		item = qs(0xf28717fb)
	}
	{
		item = qs(0xbb0f70ff)
	}
	{
		heading
		item = qs(0x3972c64b)
	}
	{
		item = qs(0xedbe0e26)
	}
	{
		item = qs(0x3e640c9f)
	}
	{
		item = qs(0x068d6157)
	}
	{
		heading
		item = qs(0x48d904a2)
	}
	{
		item = qs(0xeed661f7)
	}
	{
		item = qs(0x946c4962)
	}
	{
		heading
		item = qs(0x116c9a70)
	}
	{
		item = qs(0x506f0d1f)
	}
	{
		heading
		item = qs(0x1a5085e8)
	}
	{
		item = qs(0x538d46ae)
	}
	{
		item = qs(0x0193ed91)
	}
	{
		heading
		item = qs(0xcc04f8e4)
	}
	{
		item = qs(0xfdde7478)
	}
	{
		item = qs(0x6ff8af58)
	}
	{
		heading
		item = qs(0xf53fb8ab)
	}
	{
		item = qs(0x7e961679)
	}
	{
		item = qs(0x83513096)
	}
	{
		heading
		item = qs(0x13dcc24b)
	}
	{
		item = qs(0x3ae479c9)
	}
	{
		item = qs(0xd939e5fa)
	}
	{
		heading
		item = qs(0xa08e0e94)
	}
	{
		item = qs(0x045c1ded)
	}
	{
		item = qs(0xebd57663)
	}
	{
		heading
		item = qs(0x59763f62)
	}
	{
		item = qs(0x937817c7)
	}
	{
		item = qs(0xf5639ffa)
	}
	{
		heading
		item = qs(0xe6d84ea3)
	}
	{
		item = qs(0xf17a2a24)
	}
	{
		item = qs(0x6b674975)
	}
	{
		heading
		item = qs(0x1ef35121)
	}
	{
		item = qs(0x0accfdf6)
	}
	{
		item = qs(0xfbc1ddb8)
	}
	{
		heading
		item = qs(0xd0735ed2)
	}
	{
		item = qs(0x866f9a80)
	}
	{
		heading
		item = qs(0xc4f40e07)
	}
	{
		item = qs(0x02fdca8e)
	}
	{
		item = qs(0x6ff8af58)
	}
	{
		heading
		item = qs(0x57aa50cc)
	}
	{
		item = qs(0xce1da915)
	}
	{
		heading
		item = qs(0x43d4140f)
	}
	{
		item = qs(0xaf2e3597)
	}
	{
		item = qs(0xb1bb3639)
	}
	{
		heading
		item = qs(0x3d5debe4)
	}
	{
		item = qs(0xae338af8)
	}
	{
		item = qs(0x7c5f1feb)
	}
	{
		heading
		item = qs(0x12c5c4f2)
	}
	{
		item = qs(0xacc0c43b)
	}
	{
		item = qs(0x1afb1f94)
	}
	{
		item = qs(0xce5b3c0f)
	}
	{
		heading
		item = qs(0x5aa21a17)
	}
	{
		item = qs(0x08e31110)
	}
	{
		item = qs(0x37e3a236)
	}
	{
		heading
		item = qs(0x71220295)
	}
	{
		item = qs(0xe5f7dab6)
	}
	{
		item = qs(0x8b156233)
	}
	{
		heading
		item = qs(0x8eb17a3e)
	}
	{
		item = qs(0xcb9db13a)
	}
	{
		item = qs(0xace104c5)
	}
	{
		item = qs(0x068d6157)
	}
	{
		heading
		item = qs(0xff671dc9)
	}
	{
		item = qs(0x667c2a04)
	}
	{
		item = qs(0x7f475232)
	}
	{
		heading
		item = qs(0xe3ddf8f4)
	}
	{
		item = qs(0x1239dd76)
	}
	{
		item = qs(0x3657506d)
	}
	{
		heading
		item = qs(0x7ffff182)
	}
	{
		item = qs(0x32d46a62)
	}
	{
		item = qs(0x8627878d)
	}
	{
		heading
		item = qs(0xa8d7cefb)
	}
	{
		item = qs(0x4260a1d8)
	}
	{
		item = qs(0x73ccd496)
	}
	{
		heading
		item = qs(0x3b107234)
	}
	{
		item = qs(0x5bacfec8)
	}
	{
		item = qs(0x4a0253cd)
	}
	{
		item = qs(0x7fe7dfad)
	}
	{
		heading
		item = qs(0x5dff043f)
	}
	{
		item = qs(0xeb34d791)
	}
	{
		heading
		item = qs(0x95f5fd55)
	}
	{
		item = qs(0xee2f3d88)
	}
	{
		item = qs(0xe08d90cc)
	}
	{
		item = qs(0x07792c28)
	}
]
