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
	if ($end_credits = 0)
		disable_screen_saver
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = credits_backdrop_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if ($end_credits = 0)
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
	if ($end_credits = 0)
		event_handlers = [
			{pad_back end_credits_button params = <...>}
		]
		new_menu scrollid = mc_scroll vmenuid = current_menu event_handlers = <event_handlers>
	else
		new_menu \{scrollid = mc_scroll
			vmenuid = current_menu}
	endif
	text_params = {parent = current_menu Type = TextElement font = ($credits_menu_font) rgba = ($menu_unfocus_color)}
	RunScriptOnScreenElement \{id = credits_backdrop_container
		scrolling_list_begin_credits}
	LaunchEvent \{target = current_menu
		Type = focus}
endscript

script end_credits_button 
	destroy_credits_menu
	generic_event_back
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
	enable_screen_saver
endscript

script scrolling_list_begin_credits 
	if ($end_credits > 0)
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
		if ($end_credits = 0)
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
		if ($end_credits = 0)
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
	if ($end_credits > 0)
		z_priority_credits = 20
	else
		z_priority_credits = 100
	endif
	if ($end_credits > 0)
		<rate> = 729.0
		<screen_height> = 245.0
		<scale_head> = 0.9
		<color_head> = gh51_purple_lt
		<scale_body> = 0.65000004
		<color_body> = gh51_blue_lt
		<scale_title> = 0.65000004
		<color_title> = gh51_purple_lt
	else
		<rate> = 225.0 <screen_height> = 690
		<scale_head> = 0.75
		<color_head> = gh51_purple_lt
		<scale_body> = 0.65000004
		<color_body> = gh51_blue_lt
		<scale_title> = 0.65000004
		<color_title> = gh51_purple_lt
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
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		centered
		item = qs(0xcf432aa6)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xd146f080)
	}
	{
		item = qs(0xff18bcae)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x7dec89a4)
	}
	{
		item = qs(0x01c7acd1)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xf6f895ec)
	}
	{
		item = qs(0x6f7a76e1)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xec049b76)
	}
	{
		item = qs(0xac516185)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xfaeafa56)
	}
	{
		item = qs(0x4772cc4e)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x6fe459e4)
	}
	{
		item = qs(0x8d25424d)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x8375b5b4)
	}
	{
		item = qs(0xc6e0c926)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x4554cd41)
	}
	{
		item = qs(0xe01aa040)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xa0d330f7)
	}
	{
		item = qs(0x5f181fd1)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x38d8126c)
	}
	{
		item = qs(0x2e2713cd)
	}
	{
		item = qs(0xb93426a3)
	}
	{
		item = qs(0xf15e8d3d)
	}
	{
		item = qs(0x8028bacb)
	}
	{
		item = qs(0xa28a5ebf)
	}
	{
		item = qs(0x9f469cdc)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x2db7ebf3)
	}
	{
		item = qs(0x253973f8)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xe419dedf)
	}
	{
		item = qs(0x93a5a287)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x34a5ceab)
	}
	{
		item = qs(0xa746b905)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x5575a461)
	}
	{
		item = qs(0x3999e88d)
	}
	{
		item = qs(0x12875280)
	}
	{
		item = qs(0x90cfb369)
	}
	{
		item = qs(0x85dfb424)
	}
	{
		item = qs(0xc4245dfc)
	}
	{
		item = qs(0x1a99a694)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xa51439f8)
	}
	{
		item = qs(0xc2e42232)
	}
	{
		item = qs(0x8e31a3e3)
	}
	{
		item = qs(0x56263111)
	}
	{
		item = qs(0x21022314)
	}
	{
		item = qs(0x41af77c5)
	}
	{
		item = qs(0xc0663778)
	}
	{
		item = qs(0xe2f289d9)
	}
	{
		item = qs(0xaa714d49)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xa9f921d9)
	}
	{
		item = qs(0xc4efd1cf)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x950d1b4b)
	}
	{
		item = qs(0x118f6709)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x0d19cd66)
	}
	{
		item = qs(0x0a7cc22a)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x67c942ac)
	}
	{
		item = qs(0xae551c19)
	}
	{
		item = qs(0x45078d5d)
	}
	{
		item = qs(0xa86c9d13)
	}
	{
		item = qs(0x70d98d3f)
	}
	{
		item = qs(0xae3ed03c)
	}
	{
		item = qs(0x2e696c9b)
	}
	{
		item = qs(0x675a0ee2)
	}
	{
		item = qs(0x9b6decf8)
	}
	{
		item = qs(0xbfc6d7e7)
	}
	{
		item = qs(0x361e6b20)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x20e498b2)
	}
	{
		item = qs(0xc68ca7a3)
	}
	{
		item = qs(0xd686437d)
	}
	{
		item = qs(0xfc405a8e)
	}
	{
		item = qs(0x22da6f7f)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x43fa5b2f)
	}
	{
		item = qs(0x074bd5cc)
	}
	{
		item = qs(0x960d66dc)
	}
	{
		item = qs(0x348d2fdf)
	}
	{
		item = qs(0x7f6630f0)
	}
	{
		item = qs(0x16dc4e52)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x7169ded2)
	}
	{
		item = qs(0xd52614ff)
	}
	{
		item = qs(0x879e34ad)
	}
	{
		item = qs(0x22f1d612)
	}
	{
		item = qs(0x33cde134)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x5458abbe)
	}
	{
		item = qs(0xe2712d8b)
	}
	{
		item = qs(0x2bc2c14b)
	}
	{
		item = qs(0xa1b59e75)
	}
	{
		item = qs(0x1691a8a6)
	}
	{
		item = qs(0xdb438da5)
	}
	{
		item = qs(0xb4d1634d)
	}
	{
		item = qs(0xaa9865d8)
	}
	{
		item = qs(0x4bd1b483)
	}
	{
		item = qs(0x8a2a379b)
	}
	{
		item = qs(0x2e4c4c6e)
	}
	{
		item = qs(0xeee48ec7)
	}
	{
		item = qs(0x49cd67c1)
	}
	{
		item = qs(0x31ec9e5f)
	}
	{
		item = qs(0x7cc5e5f4)
	}
	{
		item = qs(0x8e8649c8)
	}
	{
		item = qs(0x1e5bf046)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xa93d7ac7)
	}
	{
		item = qs(0x977b1a99)
	}
	{
		item = qs(0x9ff5e5d0)
	}
	{
		item = qs(0x0961b71c)
	}
	{
		item = qs(0x6a9d559d)
	}
	{
		item = qs(0x107925be)
	}
	{
		item = qs(0xc1fd0d5f)
	}
	{
		item = qs(0x101676b4)
	}
	{
		item = qs(0x86ee6b19)
	}
	{
		item = qs(0x9cf17a43)
	}
	{
		item = qs(0x8224c684)
	}
	{
		item = qs(0x3e75030d)
	}
	{
		item = qs(0x037a9749)
	}
	{
		item = qs(0x0fc23d6d)
	}
	{
		item = qs(0x72319133)
	}
	{
		item = qs(0x459f409c)
	}
	{
		item = qs(0x7657e140)
	}
	{
		item = qs(0xbe984b8d)
	}
	{
		item = qs(0xcdc37e4f)
	}
	{
		item = qs(0x43075c0b)
	}
	{
		item = qs(0x6547d2be)
	}
	{
		item = qs(0xbe00f145)
	}
	{
		item = qs(0x138fb145)
	}
	{
		item = qs(0x264baeb0)
	}
	{
		item = qs(0x9af22058)
	}
	{
		item = qs(0x2adeb28d)
	}
	{
		item = qs(0x92f6713f)
	}
	{
		item = qs(0xc4a83a4d)
	}
	{
		item = qs(0x3d913832)
	}
	{
		item = qs(0xea790737)
	}
	{
		item = qs(0xe632f5ec)
	}
	{
		item = qs(0x9d04fd8e)
	}
	{
		item = qs(0xe1cabf56)
	}
	{
		item = qs(0x77b4acab)
	}
	{
		item = qs(0xf76d3512)
	}
	{
		item = qs(0x8e15b855)
	}
	{
		item = qs(0x02804a92)
	}
	{
		item = qs(0xd3cd5d50)
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
		item = qs(0xda6dad26)
	}
	{
		item = qs(0x49350622)
	}
	{
		item = qs(0x27a526d5)
	}
	{
		item = qs(0x08b06411)
	}
	{
		item = qs(0xfcb3e0b8)
	}
	{
		heading
		item = qs(0x9cc8660e)
	}
	{
		item = qs(0x9c80e0f4)
	}
	{
		item = qs(0x6b4b282d)
	}
	{
		heading
		item = qs(0x112397b3)
	}
	{
		item = qs(0x096d45f8)
	}
	{
		item = qs(0xed4fcd17)
	}
	{
		item = qs(0xb8b9bd68)
	}
	{
		item = qs(0xda15ecfa)
	}
	{
		item = qs(0x8097728c)
	}
	{
		item = qs(0xe0284009)
	}
	{
		item = qs(0x5c0cdbe9)
	}
	{
		item = qs(0xac5a29b7)
	}
	{
		item = qs(0x30c120ee)
	}
	{
		item = qs(0x4799d25b)
	}
	{
		item = qs(0xf462823b)
	}
	{
		item = qs(0x8c33bf97)
	}
	{
		item = qs(0x60b9392c)
	}
	{
		item = qs(0x0f7d5fbf)
	}
	{
		item = qs(0x6f69c065)
	}
	{
		item = qs(0x07241377)
	}
	{
		item = qs(0x79d02eca)
	}
	{
		heading
		item = qs(0x34af99d5)
	}
	{
		item = qs(0x8bde6db6)
	}
	{
		heading
		item = qs(0xdf69f20b)
	}
	{
		item = qs(0x7d7ce26b)
	}
	{
		item = qs(0xb3e954dd)
	}
	{
		item = qs(0xd76d62d2)
	}
	{
		item = qs(0x91d12b3b)
	}
	{
		heading
		item = qs(0x38c845ce)
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
		item = qs(0xcf316719)
	}
	{
		item = qs(0x1dccbf98)
	}
	{
		heading
		item = qs(0x07d3a043)
	}
	{
		item = qs(0x9b8dd365)
	}
	{
		item = qs(0x9a756004)
	}
	{
		heading
		item = qs(0xfdca95c0)
	}
	{
		heading
		item = qs(0x929c0be2)
	}
	{
		item = qs(0xefdbb206)
	}
	{
		heading
		item = qs(0x091e3bd0)
	}
	{
		heading
		item = qs(0x69499990)
	}
	{
		item = qs(0x2bb44b46)
	}
	{
		heading
		item = qs(0x9f7ccf7b)
	}
	{
		item = qs(0x0a677c48)
	}
	{
		heading
		item = qs(0x4b1ea059)
	}
	{
		item = qs(0x693768b2)
	}
	{
		heading
		item = qs(0x9bef1376)
	}
	{
		item = qs(0x5715704a)
	}
	{
		heading
		item = qs(0x73b5ee22)
	}
	{
		item = qs(0x3018162c)
	}
	{
		heading
		item = qs(0x1f188207)
	}
	{
		item = qs(0x0224e010)
	}
	{
		heading
		item = qs(0x40b282a2)
	}
	{
		heading
		item = qs(0x8f4b7b56)
	}
	{
		item = qs(0xc547a51a)
	}
	{
		item = qs(0xa29d4897)
	}
	{
		heading
		item = qs(0xbeac998e)
	}
	{
		item = qs(0xe9b5c568)
	}
	{
		heading
		item = qs(0x67865305)
	}
	{
		item = qs(0xd0e9f122)
	}
	{
		heading
		item = qs(0xfad580d4)
	}
	{
		item = qs(0x7cab7049)
	}
	{
		heading
		item = qs(0x91cff78b)
	}
	{
		item = qs(0xeb59fda4)
	}
	{
		heading
		item = qs(0xb130af6d)
	}
	{
		item = qs(0xa1e016a0)
	}
	{
		heading
		item = qs(0xf18bc4b4)
	}
	{
		item = qs(0x264f26ec)
	}
	{
		heading
		item = qs(0x3e6aa755)
	}
	{
		item = qs(0x70bb3514)
	}
	{
		heading
		item = qs(0x2a57f3a6)
	}
	{
		item = qs(0x29a60ffc)
	}
	{
		heading
		item = qs(0xc93a31d0)
	}
	{
		item = qs(0x96d7157e)
	}
	{
		item = qs(0x1ff34bad)
	}
	{
		heading
		item = qs(0x6fe6a3aa)
	}
	{
		item = qs(0x80c19cc6)
	}
	{
		heading
		item = qs(0xb2e00ccc)
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
		item = qs(0x66b4e7a3)
	}
	{
		item = qs(0x822bbe36)
	}
	{
		heading
		item = qs(0xd00b838c)
	}
	{
		item = qs(0xef72d0cd)
	}
	{
		heading
		item = qs(0xbfabbb6b)
	}
	{
		item = qs(0xa7de80fa)
	}
	{
		heading
		item = qs(0x39cc1ed8)
	}
	{
		item = qs(0x7d1eb3dc)
	}
	{
		heading
		item = qs(0x080ba5ef)
	}
	{
		item = qs(0x90ebb024)
	}
	{
		heading
		item = qs(0xdbd1c5db)
	}
	{
		item = qs(0x9c4f885f)
	}
	{
		heading
		item = qs(0x81c0af08)
	}
	{
		item = qs(0xb0e06f32)
	}
	{
		heading
		item = qs(0x84e6c73f)
	}
	{
		item = qs(0x3a02452b)
	}
	{
		heading
		item = qs(0x74bff5f8)
	}
	{
		item = qs(0x93b32d85)
	}
	{
		item = qs(0xff3bdc8c)
	}
	{
		item = qs(0xf9b01365)
	}
	{
		item = qs(0x94c64443)
	}
	{
		item = qs(0x73bd15ff)
	}
	{
		item = qs(0x09efbdc2)
	}
	{
		item = qs(0xb891098e)
	}
	{
		item = qs(0xd5cf48f6)
	}
	{
		item = qs(0xaa40f265)
	}
	{
		item = qs(0x6dfbe31a)
	}
	{
		item = qs(0xefe1ac53)
	}
	{
		heading
		item = qs(0x4367219f)
	}
	{
		item = qs(0xff8812e8)
	}
	{
		item = qs(0x28f7f781)
	}
	{
		item = qs(0x5b1f3402)
	}
	{
		item = qs(0x6e6b59e2)
	}
	{
		item = qs(0xa5b10406)
	}
	{
		item = qs(0xbeb4f69b)
	}
	{
		heading
		item = qs(0x3dc6760b)
	}
	{
		item = qs(0xc9c6ff41)
	}
	{
		heading
		item = qs(0x2a94413d)
	}
	{
		item = qs(0x48749722)
	}
	{
		item = qs(0x196cd7f0)
	}
	{
		item = qs(0xa5141554)
	}
	{
		item = qs(0xfb18c245)
	}
	{
		item = qs(0x7b137021)
	}
	{
		item = qs(0x22d0889b)
	}
	{
		item = qs(0x57edf6c0)
	}
	{
		item = qs(0x65c25061)
	}
	{
		item = qs(0xdc052593)
	}
	{
		item = qs(0x9f000eb3)
	}
	{
		item = qs(0x2dd076ef)
	}
	{
		item = qs(0xb2bbfd3e)
	}
	{
		item = qs(0x16398d31)
	}
	{
		item = qs(0xe6ab81fc)
	}
	{
		item = qs(0x6de31100)
	}
	{
		item = qs(0xc6a82ecb)
	}
	{
		item = qs(0x84a57970)
	}
	{
		item = qs(0xc19b859b)
	}
	{
		item = qs(0x4f8abdf5)
	}
	{
		item = qs(0xc44fa4ec)
	}
	{
		item = qs(0x160e4594)
	}
	{
		item = qs(0xb15653ec)
	}
	{
		item = qs(0xeca8f8b6)
	}
	{
		item = qs(0xbf062fe3)
	}
	{
		item = qs(0x6e65ec7d)
	}
	{
		item = qs(0x815d4b64)
	}
	{
		item = qs(0x525a9e24)
	}
	{
		item = qs(0xf461d89b)
	}
	{
		item = qs(0x2f79c271)
	}
	{
		item = qs(0x48d47179)
	}
	{
		item = qs(0x4942e2ec)
	}
	{
		item = qs(0xd434f1f6)
	}
	{
		item = qs(0xa2f9ad26)
	}
	{
		item = qs(0xf72ac890)
	}
	{
		heading
		item = qs(0x7c6f3f3a)
	}
	{
		item = qs(0x27f89f03)
	}
	{
		item = qs(0x1ace8a8a)
	}
	{
		item = qs(0x8abd47c5)
	}
	{
		item = qs(0x67a56cfb)
	}
	{
		item = qs(0xc0bd2ec0)
	}
	{
		item = qs(0x7024de68)
	}
	{
		item = qs(0xaca0b7f7)
	}
	{
		item = qs(0x5be1ad52)
	}
	{
		item = qs(0x923bfbb6)
	}
	{
		item = qs(0x8ff1a227)
	}
	{
		item = qs(0xd31e8765)
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
		item = qs(0x31df9263)
	}
	{
		item = qs(0x403438c3)
	}
	{
		item = qs(0x322ac74b)
	}
	{
		item = qs(0x26bdb547)
	}
	{
		item = qs(0xeffc9d52)
	}
	{
		heading
		item = qs(0x0385bcf2)
	}
	{
		item = qs(0xea4b0b95)
	}
	{
		item = qs(0x5729b5a6)
	}
	{
		item = qs(0x97b3e616)
	}
	{
		item = qs(0x673fce05)
	}
	{
		item = qs(0x983e4e9a)
	}
	{
		heading
		item = qs(0x3227994a)
	}
	{
		item = qs(0x9e2b8c55)
	}
	{
		item = qs(0xdef5b599)
	}
	{
		item = qs(0x3303f2db)
	}
	{
		heading
		item = qs(0xe0b03edc)
	}
	{
		item = qs(0x2142c10f)
	}
	{
		item = qs(0x8f06c69f)
	}
	{
		item = qs(0x9beace85)
	}
	{
		item = qs(0xa53b72bb)
	}
	{
		item = qs(0xd06b78be)
	}
	{
		item = qs(0x4a92ed9f)
	}
	{
		heading
		item = qs(0xee4b1197)
	}
	{
		item = qs(0x7a2f2c19)
	}
	{
		item = qs(0x845369bc)
	}
	{
		item = qs(0x29fcd751)
	}
	{
		heading
		item = qs(0x64f7a71c)
	}
	{
		item = qs(0xcedb928b)
	}
	{
		item = qs(0x356a54a8)
	}
	{
		item = qs(0x0c71a7e1)
	}
	{
		item = qs(0x5c825e29)
	}
	{
		item = qs(0x4242f853)
	}
	{
		item = qs(0x0c4d3725)
	}
	{
		heading
		item = qs(0x89c7f5f0)
	}
	{
		item = qs(0xcedb928b)
	}
	{
		item = qs(0xc3942283)
	}
	{
		item = qs(0x1580c267)
	}
	{
		item = qs(0x9427c17d)
	}
	{
		item = qs(0xc52319cb)
	}
	{
		item = qs(0xebb90ad0)
	}
	{
		item = qs(0x5a7143bd)
	}
	{
		heading
		item = qs(0x1c0a764f)
	}
	{
		item = qs(0x497a38b7)
	}
	{
		item = qs(0xdd386a4b)
	}
	{
		item = qs(0xe4be480d)
	}
	{
		item = qs(0x0795e97e)
	}
	{
		item = qs(0x7e9eb02d)
	}
	{
		item = qs(0x7f5b849f)
	}
	{
		heading
		item = qs(0x5f553244)
	}
	{
		item = qs(0x8d68b62a)
	}
	{
		item = qs(0xf14395f1)
	}
	{
		item = qs(0x242cf4e5)
	}
	{
		heading
		item = qs(0xd8ed1db1)
	}
	{
		item = qs(0x0c9e1340)
	}
	{
		heading
		item = qs(0x2d569e1a)
	}
	{
		item = qs(0x49b1a9a3)
	}
	{
		item = qs(0x4daaaa52)
	}
	{
		item = qs(0x071f7b8f)
	}
	{
		item = qs(0x48e15ce1)
	}
	{
		item = qs(0x673f7efb)
	}
	{
		heading
		item = qs(0xb29d4beb)
	}
	{
		item = qs(0xe8f4650b)
	}
	{
		item = qs(0x3659e093)
	}
	{
		item = qs(0x09f2f168)
	}
	{
		item = qs(0xb1885a27)
	}
	{
		item = qs(0x34db137c)
	}
	{
		item = qs(0x3c3b16b0)
	}
	{
		item = qs(0x479ebd03)
	}
	{
		item = qs(0x9858d453)
	}
	{
		item = qs(0x199e014f)
	}
	{
		item = qs(0xb20a69cd)
	}
	{
		item = qs(0xce7257e9)
	}
	{
		item = qs(0x5720906a)
	}
	{
		item = qs(0x5994ebab)
	}
	{
		item = qs(0xf1fe15e7)
	}
	{
		heading
		item = qs(0xa1c869ac)
	}
	{
		item = qs(0xbd3f1c72)
	}
	{
		item = qs(0x9386831a)
	}
	{
		item = qs(0x8b732bc3)
	}
	{
		item = qs(0x7285105d)
	}
	{
		heading
		item = qs(0x29f80dea)
	}
	{
		item = qs(0x99ecf6de)
	}
	{
		item = qs(0x4467c8bf)
	}
	{
		item = qs(0xda713fc0)
	}
	{
		item = qs(0x221432ad)
	}
	{
		item = qs(0xdd0db277)
	}
	{
		item = qs(0xd02d2e18)
	}
	{
		item = qs(0x4b643eb8)
	}
	{
		item = qs(0xef02fa86)
	}
	{
		heading
		item = qs(0x0c577088)
	}
	{
		item = qs(0xb60139a5)
	}
	{
		item = qs(0xab1afadc)
	}
	{
		item = qs(0x5903cfb3)
	}
	{
		item = qs(0x4004d533)
	}
	{
		heading
		item = qs(0x36fc7c5c)
	}
	{
		item = qs(0x8dd943c4)
	}
	{
		item = qs(0xd1c9a364)
	}
	{
		item = qs(0xe0f0c2f9)
	}
	{
		item = qs(0xf1092279)
	}
	{
		item = qs(0xfae93333)
	}
	{
		item = qs(0xa293d1cb)
	}
	{
		item = qs(0xa88982d6)
	}
	{
		item = qs(0x8284716e)
	}
	{
		item = qs(0x1c3c5c44)
	}
	{
		item = qs(0xda92e9e8)
	}
	{
		item = qs(0x03fa5c9f)
	}
	{
		item = qs(0x184d556e)
	}
	{
		item = qs(0x2be4de1e)
	}
	{
		item = qs(0x7a9d087f)
	}
	{
		item = qs(0xccf5bbcd)
	}
	{
		item = qs(0x0f727366)
	}
	{
		item = qs(0x366be810)
	}
	{
		item = qs(0x61bd15f0)
	}
	{
		item = qs(0x25527aa7)
	}
	{
		item = qs(0x86602c19)
	}
	{
		item = qs(0xf99a327f)
	}
	{
		heading
		item = qs(0xaae2927d)
	}
	{
		item = qs(0x422cef10)
	}
	{
		item = qs(0xeab66ea2)
	}
	{
		item = qs(0x1d11f45f)
	}
	{
		item = qs(0x037f7eda)
	}
	{
		item = qs(0x673b8945)
	}
	{
		item = qs(0xf1379e1f)
	}
	{
		item = qs(0x5ef66a97)
	}
	{
		item = qs(0x6b1d2810)
	}
	{
		item = qs(0x3f42821b)
	}
	{
		item = qs(0xab079bac)
	}
	{
		item = qs(0xc688ed33)
	}
	{
		item = qs(0x1445a518)
	}
	{
		item = qs(0x37c768e9)
	}
	{
		heading
		item = qs(0x3f6f76e2)
	}
	{
		item = qs(0x9c345169)
	}
	{
		item = qs(0x25c649bd)
	}
	{
		item = qs(0xfcfa2d61)
	}
	{
		item = qs(0x2db7b4d2)
	}
	{
		item = qs(0x8b8813e3)
	}
	{
		item = qs(0x9f7c525d)
	}
	{
		item = qs(0xbe391d07)
	}
	{
		item = qs(0x9dadd89a)
	}
	{
		heading
		item = qs(0x3a807dcd)
	}
	{
		item = qs(0x17ebf9db)
	}
	{
		item = qs(0xb00de132)
	}
	{
		item = qs(0xfda9649f)
	}
	{
		item = qs(0xd58af28d)
	}
	{
		item = qs(0xc0f83396)
	}
	{
		item = qs(0xc49b04df)
	}
	{
		item = qs(0x0110c482)
	}
	{
		heading
		item = qs(0xc6b1271e)
	}
	{
		item = qs(0x1b34a85e)
	}
	{
		item = qs(0x1e5ccd00)
	}
	{
		item = qs(0x4bc79e85)
	}
	{
		item = qs(0x39a4c332)
	}
	{
		item = qs(0x5bcfe1ac)
	}
	{
		item = qs(0x920470d2)
	}
	{
		heading
		item = qs(0x5d7bb297)
	}
	{
		item = qs(0x3fe5ecb9)
	}
	{
		item = qs(0xdf74d3cc)
	}
	{
		item = qs(0x90c95dbd)
	}
	{
		item = qs(0x9b0bb110)
	}
	{
		item = qs(0x3273c691)
	}
	{
		item = qs(0x8c0c544b)
	}
	{
		item = qs(0xe1bf1ef9)
	}
	{
		item = qs(0xb34e0ecf)
	}
	{
		item = qs(0x3f70add7)
	}
	{
		heading
		item = qs(0xe9587e56)
	}
	{
		item = qs(0x2f6ec697)
	}
	{
		item = qs(0xaf14d2a6)
	}
	{
		item = qs(0x94b68fdc)
	}
	{
		item = qs(0x437ca8cc)
	}
	{
		item = qs(0x818543fe)
	}
	{
		heading
		item = qs(0xacf49fe3)
	}
	{
		item = qs(0x10c27ceb)
	}
	{
		item = qs(0x529d9841)
	}
	{
		heading
		item = qs(0x0b06d55a)
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
		item = qs(0xa6d1dccb)
	}
	{
		heading
		item = qs(0xefa1b00d)
	}
	{
		item = qs(0x195b2e1c)
	}
	{
		item = qs(0x51ac54cf)
	}
	{
		item = qs(0x89e26b6a)
	}
	{
		item = qs(0x1656a842)
	}
	{
		item = qs(0x0c43fabe)
	}
	{
		item = qs(0xa8cef617)
	}
	{
		item = qs(0xa10697f2)
	}
	{
		heading
		item = qs(0xa5ce6068)
	}
	{
		item = qs(0xe07ac98a)
	}
	{
		item = qs(0xd6584b33)
	}
	{
		item = qs(0xfdd28d44)
	}
	{
		item = qs(0xcb9df333)
	}
	{
		item = qs(0x66f9cccc)
	}
	{
		item = qs(0x63c2833b)
	}
	{
		item = qs(0xa2f85944)
	}
	{
		item = qs(0xcf1a98e5)
	}
	{
		item = qs(0xc7072fd5)
	}
	{
		item = qs(0x48686133)
	}
	{
		item = qs(0xd25a2921)
	}
	{
		item = qs(0xee7c0cbc)
	}
	{
		item = qs(0xe9308e11)
	}
	{
		item = qs(0xe644bee5)
	}
	{
		item = qs(0xea9ac559)
	}
	{
		item = qs(0x0cfc2076)
	}
	{
		item = qs(0x0b005e72)
	}
	{
		item = qs(0x4dcda232)
	}
	{
		item = qs(0xfe1de099)
	}
	{
		item = qs(0xae41bfe9)
	}
	{
		item = qs(0xb855be13)
	}
	{
		item = qs(0x4d5dfd84)
	}
	{
		item = qs(0x69127bd1)
	}
	{
		item = qs(0xb0d298c5)
	}
	{
		heading
		item = qs(0xafabd366)
	}
	{
		heading
		item = qs(0x1a9ecc93)
	}
	{
		item = qs(0xc97a4189)
	}
	{
		item = qs(0x59fb325d)
	}
	{
		heading
		item = qs(0x88e8f962)
	}
	{
		item = qs(0x7999cca9)
	}
	{
		item = qs(0xa6871f49)
	}
	{
		heading
		item = qs(0x6cef0954)
	}
	{
		item = qs(0x436d692e)
	}
	{
		item = qs(0x5eaf6c43)
	}
	{
		heading
		item = qs(0x4967ab2c)
	}
	{
		item = qs(0x62ec3ddf)
	}
	{
		item = qs(0xfbc1ddb8)
	}
	{
		heading
		item = qs(0x9d378892)
	}
	{
		item = qs(0xdf6495ef)
	}
	{
		item = qs(0x6cf0723c)
	}
	{
		heading
		item = qs(0x1caa00b4)
	}
	{
		item = qs(0xe1c8e080)
	}
	{
		item = qs(0xe3cc9471)
	}
	{
		heading
		item = qs(0x3cb5f4cc)
	}
	{
		item = qs(0x4193794a)
	}
	{
		item = qs(0xebf05628)
	}
	{
		heading
		item = qs(0x47d85205)
	}
	{
		item = qs(0xa4000d37)
	}
	{
		item = qs(0xa63e99f9)
	}
	{
		heading
		item = qs(0x5ccd3a72)
	}
	{
		item = qs(0xe8d01cbf)
	}
	{
		item = qs(0x4639f9ba)
	}
	{
		heading
		item = qs(0xbb4babe1)
	}
	{
		item = qs(0xa793d184)
	}
	{
		item = qs(0xe3cc9471)
	}
	{
		heading
		item = qs(0xefe60a5f)
	}
	{
		item = qs(0x4a4d3da7)
	}
	{
		item = qs(0xf54b4a24)
	}
	{
		item = qs(0xed9f9247)
	}
	{
		heading
		item = qs(0x12d00ba7)
	}
	{
		item = qs(0x464cd5e3)
	}
	{
		item = qs(0xb3311107)
	}
	{
		heading
		item = qs(0x4b599492)
	}
	{
		item = qs(0x12f03003)
	}
	{
		item = qs(0x7884b9a7)
	}
	{
		heading
		item = qs(0x1e4c0750)
	}
	{
		item = qs(0xca6d26ae)
	}
	{
		item = qs(0x3f144040)
	}
	{
		heading
		item = qs(0x1fc03c8c)
	}
	{
		item = qs(0x3773ce48)
	}
	{
		item = qs(0xb87697ed)
	}
	{
		heading
		item = qs(0x2e4131f3)
	}
	{
		item = qs(0x0bd302b5)
	}
	{
		item = qs(0xd9e96860)
	}
	{
		heading
		item = qs(0xaf4fe85d)
	}
	{
		item = qs(0xc34cb8fd)
	}
	{
		item = qs(0xcf27b51f)
	}
	{
		heading
		item = qs(0x32da67e1)
	}
	{
		item = qs(0xb549a99a)
	}
	{
		item = qs(0xe3cc9471)
	}
	{
		heading
		item = qs(0x3f22a93e)
	}
	{
		item = qs(0x53c12aea)
	}
	{
		item = qs(0xb87697ed)
	}
	{
		heading
		item = qs(0xca68a68d)
	}
	{
		item = qs(0xc54a3691)
	}
	{
		item = qs(0x2d995dc6)
	}
	{
		heading
		item = qs(0x39e71afd)
	}
	{
		item = qs(0xa318f4df)
	}
	{
		item = qs(0x9875edfa)
	}
	{
		heading
		item = qs(0x8bdf4463)
	}
	{
		item = qs(0x25893e73)
	}
	{
		heading
		item = qs(0x23476b30)
	}
	{
		item = qs(0x209f95b6)
	}
	{
		item = qs(0xc52342a5)
	}
	{
		heading
		item = qs(0x14ce7ec5)
	}
	{
		item = qs(0xd1ec1fe1)
	}
	{
		heading
		item = qs(0xb3aea043)
	}
	{
		item = qs(0xceec6c1d)
	}
	{
		item = qs(0x2b875c4b)
	}
	{
		heading
		item = qs(0xe46b4c62)
	}
	{
		item = qs(0x1dcbe4b5)
	}
	{
		item = qs(0x2b875c4b)
	}
	{
		heading
		item = qs(0x40edd7bb)
	}
	{
		item = qs(0x0939901a)
	}
	{
		item = qs(0x88ef84d1)
	}
	{
		heading
		item = qs(0xb5aa35bc)
	}
	{
		item = qs(0x84165742)
	}
	{
		item = qs(0xb87697ed)
	}
	{
		heading
		item = qs(0xea43d932)
	}
	{
		item = qs(0xc7133a39)
	}
	{
		item = qs(0x0bfa58cc)
	}
	{
		heading
		item = qs(0x2600b5a8)
	}
	{
		item = qs(0x31f94503)
	}
	{
		item = qs(0x3b250cea)
	}
	{
		heading
		item = qs(0xb78c0814)
	}
	{
		item = qs(0x9f40ba71)
	}
	{
		item = qs(0x979b1bf8)
	}
	{
		heading
		item = qs(0xd0659058)
	}
	{
		item = qs(0x253342c5)
	}
	{
		item = qs(0x9d9d5feb)
	}
	{
		heading
		item = qs(0x7cf9fb61)
	}
	{
		item = qs(0x34b987a6)
	}
	{
		item = qs(0xe0aad668)
	}
	{
		heading
		item = qs(0x74a68f82)
	}
	{
		item = qs(0x3795788c)
	}
	{
		item = qs(0xdae770f2)
	}
	{
		item = qs(0x564eb35b)
	}
	{
		heading
		item = qs(0x5ed2bc92)
	}
	{
		item = qs(0x990e2e5c)
	}
	{
		item = qs(0xe258519c)
	}
	{
		heading
		item = qs(0x9ceac7f2)
	}
	{
		item = qs(0x0ba69ecd)
	}
	{
		item = qs(0xac4b8de9)
	}
	{
		heading
		item = qs(0xe37fd6d8)
	}
	{
		item = qs(0x0e7f9cfb)
	}
	{
		heading
		item = qs(0x363f360d)
	}
	{
		item = qs(0x05e8b6eb)
	}
	{
		item = qs(0x2b875c4b)
	}
	{
		heading
		item = qs(0x48bb2f55)
	}
	{
		item = qs(0x68c31206)
	}
	{
		item = qs(0xd8507cdc)
	}
	{
		heading
		item = qs(0x38087cc3)
	}
	{
		item = qs(0x458cb929)
	}
	{
		item = qs(0x6c570c90)
	}
	{
		heading
		item = qs(0x60fd2b1d)
	}
	{
		item = qs(0xdd00f9f7)
	}
	{
		item = qs(0x364d57e4)
	}
	{
		heading
		item = qs(0x72eb52c2)
	}
	{
		item = qs(0x988a6337)
	}
	{
		item = qs(0x4bf01673)
	}
	{
		heading
		item = qs(0x9e55b273)
	}
	{
		item = qs(0x49b4bec0)
	}
	{
		item = qs(0x426ee4b1)
	}
	{
		heading
		item = qs(0xc0f5e1a3)
	}
	{
		item = qs(0x7cb0fc64)
	}
	{
		item = qs(0xe7a0be15)
	}
	{
		heading
		item = qs(0x3db476f1)
	}
	{
		item = qs(0x8b6befd3)
	}
	{
		item = qs(0x4be822ce)
	}
	{
		heading
		item = qs(0xac1d6a8d)
	}
	{
		item = qs(0xa8c82f8c)
	}
	{
		item = qs(0xc3839b33)
	}
	{
		item = qs(0x3cda6399)
	}
	{
		heading
		item = qs(0x7156142a)
	}
	{
		item = qs(0x154a1519)
	}
	{
		item = qs(0xe9694523)
	}
	{
		heading
		item = qs(0xf49abbff)
	}
	{
		item = qs(0xf3ac1105)
	}
	{
		item = qs(0xc297b144)
	}
	{
		heading
		item = qs(0xe918262b)
	}
	{
		item = qs(0xcac52b58)
	}
	{
		item = qs(0xceeb620c)
	}
	{
		heading
		item = qs(0xefe0725b)
	}
	{
		item = qs(0xd29e42ec)
	}
	{
		item = qs(0x635a21fa)
	}
	{
		item = qs(0x5c9b5a86)
	}
	{
		heading
		item = qs(0xb4a3caa1)
	}
	{
		item = qs(0x4afdfce2)
	}
	{
		item = qs(0x8c981842)
	}
	{
		item = qs(0x007682c7)
	}
	{
		heading
		item = qs(0x8ed15800)
	}
	{
		item = qs(0xc52c8bac)
	}
	{
		item = qs(0xd8d15b7d)
	}
	{
		heading
		item = qs(0xce76dd21)
	}
	{
		item = qs(0x1dae9209)
	}
	{
		item = qs(0x03593e20)
	}
	{
		heading
		item = qs(0x401eefb5)
	}
	{
		item = qs(0xb2f07359)
	}
	{
		heading
		item = qs(0xaafc300a)
	}
	{
		item = qs(0xf638e7e3)
	}
	{
		item = qs(0x542e379b)
	}
	{
		heading
		item = qs(0x667e7ac6)
	}
	{
		item = qs(0xd7459ba0)
	}
	{
		item = qs(0x824b2af5)
	}
	{
		heading
		item = qs(0xc1f310a4)
	}
	{
		item = qs(0x9930e346)
	}
	{
		item = qs(0x36068a20)
	}
	{
		heading
		item = qs(0xec6981c9)
	}
	{
		item = qs(0xad91c588)
	}
	{
		heading
		item = qs(0x31cd3248)
	}
	{
		item = qs(0xc63a108d)
	}
	{
		item = qs(0x2b89310b)
	}
	{
		item = qs(0x51ad2678)
	}
	{
		heading
		item = qs(0x02ada02f)
	}
	{
		item = qs(0x26b07731)
	}
	{
		item = qs(0xc4d1912f)
	}
	{
		item = qs(0xe3cc9471)
	}
	{
		heading
		item = qs(0x5debfe18)
	}
	{
		item = qs(0x8b32081f)
	}
	{
		item = qs(0xfaf8d022)
	}
	{
		heading
		item = qs(0xcc562bc5)
	}
	{
		item = qs(0xaedccda5)
	}
	{
		heading
		item = qs(0x8514f561)
	}
	{
		item = qs(0x6fc9bad7)
	}
	{
		item = qs(0x0c70b961)
	}
	{
		heading
		item = qs(0x6bb2bf73)
	}
	{
		item = qs(0x652d488a)
	}
	{
		item = qs(0x84d7fdc8)
	}
	{
		heading
		item = qs(0x08c1ef51)
	}
	{
		item = qs(0x22d79050)
	}
	{
		item = qs(0xa60c186a)
	}
	{
		item = qs(0xe4918014)
	}
	{
		item = qs(0xe77ab2ec)
	}
	{
		item = qs(0xf7f30342)
	}
	{
		item = qs(0xdb0c422e)
	}
	{
		item = qs(0x7bbd0957)
	}
]
