credits_menu_scroll = horizontal
real_end_credits = 0

script debug_credits_assert \{msg = 'blah'}
endscript

script ui_create_end_credits 
	debug_credits_assert \{msg = 'ui_create_end_credits'}
	spawn_player_drop_listeners \{drop_player_script = credits_drop_player
		end_game_script = credits_end_game}
	SpawnScriptNow ui_create_end_credits_spawned params = {<...>}
endscript

script ui_create_end_credits_spawned 
	debug_credits_assert \{msg = 'ui_create_end_credits_spawned'}
	kill_gem_scroller
	Progression_EndCredits
endscript

script ui_destroy_end_credits 
endscript
g_credits_music_stream = None

script play_credits_music 
	PreloadStream \{credits_song}
	Change g_credits_music_stream = <unique_id>
	begin
	printf \{channel = clayton
		'Preloading credits music stream'}
	if PreloadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	StartPreLoadedStream <unique_id> buss = Front_End forcesafepreload = 1 vol = 3 Priority = 1 num_loops = -1
endscript

script kill_credits_music 
	if NOT (($g_credits_music_stream) = None)
		stopsound \{unique_id = $g_credits_music_stream
			fade_time = 0.1
			fade_type = linear}
	else
		printf \{channel = clayton
			'Trying to kill credits music but g_credits_music_stream is none'}
	endif
endscript

script create_credits_menu 
	debug_credits_assert \{msg = 'create_credits_menu'}
	hide_glitch \{hide_glitch
		num_frames = 12}
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if ($end_credits = 0)
		disable_pause
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = credits_backdrop_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	audio_ui_menu_music_off
	play_credits_music
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
	if ($real_end_credits = 1)
		<allow_skip> = true
		if InNetGame
			if NOT IsHost
				<allow_skip> = FALSE
			endif
		endif
		if (<allow_skip> = true)
			<event_handlers> = [
				{pad_choose end_credits_button params = <...>}
			]
		else
			<event_handlers> = []
		endif
		new_menu scrollid = mc_scroll vmenuid = current_menu event_handlers = <event_handlers>
		if (<allow_skip> = true)
			add_user_control_helper \{text = qs(0x784c64ff)
				button = green
				z = 1001}
		endif
	elseif ($end_credits = 0)
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
	text_params = {parent = current_menu Type = TextElement font = ($credits_menu_font) rgba = ($menu_unfocus_color)}
	RunScriptOnScreenElement \{id = credits_backdrop_container
		scrolling_list_begin_credits}
	LaunchEvent \{target = current_menu
		Type = focus}
endscript

script end_credits_button 
	if InNetGame
		if IsHost
			SendStructure \{callback = end_credits_button
				data_to_send = {
					None
				}}
		endif
	endif
	ui_sfx \{menustate = Generic
		uitype = select}
	destroy_credits_menu
	if NOT ($real_end_credits = 1)
		generic_event_back
	endif
endscript

script destroy_credits_menu 
	debug_credits_assert \{msg = 'destroy_credits_menu'}
	kill_credits_music
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
	debug_credits_assert \{msg = 'scrolling_list_begin_credits'}
	if ($end_credits > 0)
		Wait \{2
			Seconds}
		if NOT ScreenElementExists \{id = credits_backdrop_container}
			CreateScreenElement \{Type = ContainerElement
				parent = root_window
				id = credits_backdrop_container
				Pos = (0.0, 0.0)
				just = [
					left
					top
				]}
			debug_credits_assert \{msg = 'scrolling_list_begin_credits - created credits_backdrop_container'}
		endif
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
	printf \{channel = clayton
		'scrolling_list_add_item'}
	if (<i> = <array_Size>)
		debug_credits_assert \{msg = 'Finished'}
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
	else
		Scale = <scale_body>
		Color = <color_body>
	endif
	if StructureContains structure = ($Credits [<i>]) title
		Scale = <scale_title>
		Color = <color_title>
	endif
	if StructureContains structure = ($Credits [<i>]) song
		Scale = <scale_song>
		Color = <color_song>
	endif
	if StructureContains structure = ($Credits [<i>]) small
		Scale = 0.5
		Color = <color_body>
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
		font = fontgrid_text_a1
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
	printf \{channel = clayton
		'scrolling_list_move_item'}
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
	printf \{channel = clayton
		'scrolling_list_queue_next_item'}
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
	debug_credits_assert \{msg = 'scrolling_list_init_credits'}
	if ($end_credits > 0)
		z_priority_credits = 20
	else
		z_priority_credits = 100
	endif
	<rate> = 250
	<screen_height> = 600
	<scale_head> = 0.7
	<color_head> = [95 12 16 255]
	<scale_title> = 0.5
	<color_title> = [95 12 16 255]
	<scale_body> = 0.5
	<color_body> = [52 32 8 255]
	<scale_song> = 0.7
	<color_song> = [166 30 45 255]
	<screen_width> = 1280
	if ($credits_menu_scroll = vertical)
		<just> = [center bottom]
		<base_pos> = ((640.0, 0.0) + ((0.0, 1.0) * <screen_height>))
		<column_width> = 450
		<our_dims> = (<column_width> * (1.0, 0.0))
		<spacer> = 5
	else
		<just> = [left center]
		<base_pos> = ((0.0, 340.0) + ((1.0, 0.0) * <screen_width>))
		<column_height> = 180
		<our_dims> = ((<column_height> * (0.0, 1.0)) + (70.0, 0.0))
		<spacer> = 18
	endif
	if ScreenElementExists \{id = credits_list_container}
		DestroyScreenElement \{id = credits_list_container}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = credits_backdrop_container
		id = credits_list_container
		Pos = (0.0, 0.0)}
	debug_credits_assert \{msg = 'scrolling_list_init_credits - created credits_list_container'}
	return <...>
endscript

script credits_end_game 
	if isngc
		destroy_credits_menu
	endif
	wait_for_safe_shutdown
	gameplay_end_game <...>
endscript

script credits_drop_player 
	if isngc
		destroy_credits_menu
	endif
	wait_for_safe_shutdown
	gameplay_drop_player <...>
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
		item = qs(0xf4e13e4d)
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
		title
		item = qs(0x684c5d57)
	}
	{
		item = qs(0xb42f9410)
	}
	{
		title
		item = qs(0x8ff04f24)
	}
	{
		item = qs(0x6a365cc3)
	}
	{
		title
		item = qs(0x181be137)
	}
	{
		item = qs(0xdd7251e9)
	}
	{
		title
		item = qs(0x39bc0889)
	}
	{
		item = qs(0x8af818be)
	}
	{
		title
		item = qs(0xd8cb3aa4)
	}
	{
		item = qs(0x3b005683)
	}
	{
		title
		item = qs(0x75143e1f)
	}
	{
		item = qs(0xf6d3fe8b)
	}
	{
		item = qs(0x3b992cf5)
	}
	{
		item = qs(0x1ddd709b)
	}
	{
		item = qs(0xf89ee184)
	}
	{
		title
		item = qs(0xa59a1431)
	}
	{
		item = qs(0x2a40478f)
	}
	{
		title
		item = qs(0xbfe2c8bf)
	}
	{
		item = qs(0x74c86d49)
	}
	{
		title
		item = qs(0x893a6f64)
	}
	{
		item = qs(0xaf9ad30a)
	}
	{
		title
		item = qs(0x6e07bb21)
	}
	{
		item = qs(0x879721db)
	}
	{
		item = qs(0xd90fcd73)
	}
	{
		item = qs(0x8f5738b9)
	}
	{
		item = qs(0x3b0bcbd8)
	}
	{
		title
		item = qs(0x9aabd25c)
	}
	{
		item = qs(0x052b9743)
	}
	{
		title
		item = qs(0x6c62e26c)
	}
	{
		item = qs(0xa4e3c99b)
	}
	{
		title
		item = qs(0xc1d6b28c)
	}
	{
		item = qs(0x4c466de5)
	}
	{
		title
		item = qs(0x97638525)
	}
	{
		item = qs(0x7d5e5218)
	}
	{
		title
		item = qs(0xd348be89)
	}
	{
		item = qs(0x9d2f6a84)
	}
	{
		title
		item = qs(0xe5c544fa)
	}
	{
		item = qs(0x3f78d367)
	}
	{
		title
		item = qs(0xc50a2cb9)
	}
	{
		item = qs(0x53a1f67f)
	}
	{
		title
		item = qs(0x2e827c6a)
	}
	{
		item = qs(0x9d0cfefd)
	}
	{
		title
		item = qs(0x12b704c7)
	}
	{
		item = qs(0x43c8ad86)
	}
	{
		title
		item = qs(0x13087c18)
	}
	{
		item = qs(0x7147221f)
	}
	{
		title
		item = qs(0x907fdc64)
	}
	{
		item = qs(0xedf0e27d)
	}
	{
		title
		item = qs(0x35b1cfe3)
	}
	{
		item = qs(0x1e16906a)
	}
	{
		title
		item = qs(0xc7e891dc)
	}
	{
		item = qs(0x2c6414d1)
	}
	{
		item = qs(0x7afda181)
	}
	{
		item = qs(0x3bbaf1fd)
	}
	{
		item = qs(0x08a0deec)
	}
	{
		item = qs(0x6fce6dd3)
	}
	{
		item = qs(0x759b6a7c)
	}
	{
		item = qs(0xc031babe)
	}
	{
		item = qs(0x562c30e0)
	}
	{
		item = qs(0xda97f6fc)
	}
	{
		item = qs(0x417ba589)
	}
	{
		title
		item = qs(0xe39b9117)
	}
	{
		item = qs(0x93572f9e)
	}
	{
		item = qs(0x107dc650)
	}
	{
		item = qs(0x7d501550)
	}
	{
		item = qs(0x46404b2e)
	}
	{
		title
		item = qs(0xe2d20e5f)
	}
	{
		item = qs(0xa664ea1d)
	}
	{
		item = qs(0xe452ac6d)
	}
	{
		item = qs(0x8af1577e)
	}
	{
		item = qs(0xaf2e96b7)
	}
	{
		title
		item = qs(0x990442d3)
	}
	{
		item = qs(0x4c4d04f6)
	}
	{
		title
		item = qs(0x4c413faa)
	}
	{
		item = qs(0x260c7f96)
	}
	{
		item = qs(0x3946c118)
	}
	{
		item = qs(0x93bc026e)
	}
	{
		item = qs(0x78482a97)
	}
	{
		item = qs(0x7a23ff90)
	}
	{
		item = qs(0xb079cd29)
	}
	{
		item = qs(0xdf64c75d)
	}
	{
		item = qs(0x5f7d71d6)
	}
	{
		item = qs(0x6f85f337)
	}
	{
		item = qs(0xad673786)
	}
	{
		item = qs(0xf6a6f480)
	}
	{
		item = qs(0x2b9624dc)
	}
	{
		item = qs(0xdbde95fb)
	}
	{
		item = qs(0x2d2fd50f)
	}
	{
		item = qs(0x394244c7)
	}
	{
		item = qs(0x853ea8e6)
	}
	{
		item = qs(0xa19173f4)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x814d3898)
	}
	{
		item = qs(0xb373e3fa)
	}
	{
		item = qs(0x26d3a92f)
	}
	{
		item = qs(0x053d4bca)
	}
	{
		item = qs(0x7f9e16a2)
	}
	{
		item = qs(0xf438581f)
	}
	{
		item = qs(0xc8fb0e62)
	}
	{
		item = qs(0x10694cf7)
	}
	{
		item = qs(0xca9d1e6d)
	}
	{
		item = qs(0xc0181c61)
	}
	{
		item = qs(0x2f20198e)
	}
	{
		item = qs(0xb4cdbb39)
	}
	{
		item = qs(0x17e1d83f)
	}
	{
		item = qs(0x6db38d2f)
	}
	{
		item = qs(0xd3a1b769)
	}
	{
		item = qs(0x3ac560b8)
	}
	{
		item = qs(0xa69bf46a)
	}
	{
		item = qs(0xb61a4497)
	}
	{
		item = qs(0x06bc9deb)
	}
	{
		item = qs(0x327cdef5)
	}
	{
		item = qs(0x785688d2)
	}
	{
		item = qs(0x205af5da)
	}
	{
		item = qs(0x78df8d0b)
	}
	{
		item = qs(0x2675a9fd)
	}
	{
		item = qs(0xe6fd53c7)
	}
	{
		item = qs(0x435fd527)
	}
	{
		item = qs(0xa0d0d266)
	}
	{
		item = qs(0xe53c7ef6)
	}
	{
		item = qs(0x665bc543)
	}
	{
		item = qs(0x9c94e730)
	}
	{
		item = qs(0x965e89fc)
	}
	{
		item = qs(0xeb474871)
	}
	{
		item = qs(0xe6c5846f)
	}
	{
		item = qs(0x3d992959)
	}
	{
		item = qs(0xab66ad47)
	}
	{
		item = qs(0x439f5991)
	}
	{
		item = qs(0x779a4264)
	}
	{
		heading
		item = qs(0x22e92d61)
	}
	{
		item = qs(0x339f528d)
	}
	{
		item = qs(0xf771960a)
	}
	{
		item = qs(0xe3f4f60c)
	}
	{
		item = qs(0x21556431)
	}
	{
		item = qs(0x8c862698)
	}
	{
		item = qs(0x91d8c534)
	}
	{
		item = qs(0x530f527a)
	}
	{
		item = qs(0x718accf7)
	}
	{
		heading
		item = qs(0xfdd0c2dc)
	}
	{
		item = qs(0xbfc71857)
	}
	{
		item = qs(0x2f17a64a)
	}
	{
		item = qs(0x4dc8390c)
	}
	{
		item = qs(0x01e12014)
	}
	{
		item = qs(0x64fb87c1)
	}
	{
		item = qs(0xeabffbae)
	}
	{
		item = qs(0x75365110)
	}
	{
		item = qs(0x3121f9d4)
	}
	{
		item = qs(0x1de5835b)
	}
	{
		item = qs(0xec89f263)
	}
	{
		item = qs(0x55157bf7)
	}
	{
		item = qs(0xb68e3fa6)
	}
	{
		heading
		item = qs(0xf1f3315d)
	}
	{
		item = qs(0x93adaf19)
	}
	{
		item = qs(0x94c9da5c)
	}
	{
		heading
		item = qs(0xdf69f20b)
	}
	{
		item = qs(0x6e4b8422)
	}
	{
		heading
		item = qs(0x861a5ffe)
	}
	{
		item = qs(0x521c14d4)
	}
	{
		item = qs(0xb15224bd)
	}
	{
		item = qs(0xe959e6cf)
	}
	{
		heading
		item = qs(0x07d3a043)
	}
	{
		item = qs(0x1de6bf80)
	}
	{
		item = qs(0xd93ec39f)
	}
	{
		item = qs(0x8b649b30)
	}
	{
		item = qs(0x8558a032)
	}
	{
		heading
		item = qs(0x0529d34b)
	}
	{
		song
		item = qs(0xc2969d7e)
	}
	{
		item = qs(0x6b7a9b7c)
	}
	{
		song
		item = qs(0xf8b63038)
	}
	{
		item = qs(0xe141f1c3)
	}
	{
		song
		item = qs(0x7bfb1243)
	}
	{
		item = qs(0x69c341f8)
	}
	{
		song
		item = qs(0x8f04b8a5)
	}
	{
		item = qs(0xc06ade95)
	}
	{
		song
		item = qs(0xab8c6aa8)
	}
	{
		item = qs(0xb3e4009b)
	}
	{
		song
		item = qs(0xcda55b3a)
	}
	{
		item = qs(0x3018162c)
	}
	{
		song
		item = qs(0x2608e34d)
	}
	{
		item = qs(0x0224e010)
	}
	{
		song
		item = qs(0xbf68b407)
	}
	{
		item = qs(0xc547a51a)
	}
	{
		item = qs(0xa7f3c8ff)
	}
	{
		song
		item = qs(0x8e8f56df)
	}
	{
		item = qs(0xe9b5c568)
	}
	{
		song
		item = qs(0x4a53dd8e)
	}
	{
		item = qs(0xceeca99e)
	}
	{
		song
		item = qs(0xae6d9be8)
	}
	{
		item = qs(0x6538e049)
	}
	{
		song
		item = qs(0xc002511a)
	}
	{
		item = qs(0x2269075b)
	}
	{
		song
		item = qs(0x05b64ea7)
	}
	{
		item = qs(0xfd56346a)
	}
	{
		song
		item = qs(0xc4c9847f)
	}
	{
		item = qs(0x29a60ffc)
	}
	{
		song
		item = qs(0x4afae2f4)
	}
	{
		item = qs(0x8833cebf)
	}
	{
		item = qs(0x702cfb5c)
	}
	{
		song
		item = qs(0xcb4baaff)
	}
	{
		item = qs(0x80c19cc6)
	}
	{
		song
		item = qs(0x82c3c39d)
	}
	{
		item = qs(0x3d57b93c)
	}
	{
		item = qs(0x6ebaad1c)
	}
	{
		item = qs(0xe2478b45)
	}
	{
		item = qs(0xe2947146)
	}
	{
		song
		item = qs(0xd8a452bb)
	}
	{
		item = qs(0x4a6bfc7b)
	}
	{
		song
		item = qs(0x3e396284)
	}
	{
		item = qs(0xc5ceeaea)
	}
	{
		song
		item = qs(0x85d0fa73)
	}
	{
		item = qs(0xa4240a2d)
	}
	{
		item = qs(0xb3307920)
	}
	{
		song
		item = qs(0x03b75fc0)
	}
	{
		item = qs(0x24bfe2d6)
	}
	{
		song
		item = qs(0xfbeadc4a)
	}
	{
		item = qs(0x3fb77cea)
	}
	{
		song
		item = qs(0xa55a862c)
	}
	{
		item = qs(0x902a013e)
	}
	{
		song
		item = qs(0x3af67227)
	}
	{
		item = qs(0x3a02452b)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x651a7baf)
	}
	{
		song
		item = qs(0xf390353d)
	}
	{
		item = qs(0x899b4c6d)
	}
	{
		item = qs(0x2910cda5)
	}
	{
		item = qs(0x4563f1eb)
	}
	{
		item = qs(0x2231f91a)
	}
	{
		item = qs(0x66175d78)
	}
	{
		item = qs(0x820e69a3)
	}
	{
		item = qs(0x20c0136a)
	}
	{
		item = qs(0x340046c4)
	}
	{
		item = qs(0x655d0e63)
	}
	{
		item = qs(0xa6cb69f0)
	}
	{
		song
		item = qs(0x55fefa6c)
	}
	{
		item = qs(0x708f8edc)
	}
	{
		item = qs(0xc2b69bb0)
	}
	{
		item = qs(0x7d085bd6)
	}
	{
		item = qs(0x66ec052b)
	}
	{
		item = qs(0x32cb397b)
	}
	{
		item = qs(0xb3a88c0e)
	}
	{
		item = qs(0x7dce2968)
	}
	{
		item = qs(0xa95a8aba)
	}
	{
		item = qs(0xcf2ed2e8)
	}
	{
		item = qs(0x6663ad54)
	}
	{
		heading
		item = qs(0x7e404716)
	}
	{
		song
		item = qs(0x80405e5e)
	}
	{
		item = qs(0xb9ed3b94)
	}
	{
		item = qs(0x616d73eb)
	}
	{
		item = qs(0x02e3493e)
	}
	{
		item = qs(0xe992d6f0)
	}
	{
		item = qs(0x02e7b76e)
	}
	{
		item = qs(0x6d3d21c1)
	}
	{
		item = qs(0xf96e58c9)
	}
	{
		item = qs(0x900cf3de)
	}
	{
		item = qs(0xa5484895)
	}
	{
		item = qs(0x6599640a)
	}
	{
		item = qs(0xa9cb8253)
	}
	{
		item = qs(0xc34ecb7f)
	}
	{
		item = qs(0x8a635e6f)
	}
	{
		item = qs(0x7ecd7dbd)
	}
	{
		item = qs(0x5bf5759c)
	}
	{
		item = qs(0x154b589a)
	}
	{
		item = qs(0x00abf34c)
	}
	{
		item = qs(0x47950a25)
	}
	{
		item = qs(0x2410d4f7)
	}
	{
		item = qs(0x2ac7c6b3)
	}
	{
		item = qs(0x116395c7)
	}
	{
		item = qs(0x4c10f804)
	}
	{
		item = qs(0x6b38622c)
	}
	{
		item = qs(0xb2f64e9c)
	}
	{
		item = qs(0x0eca1b5a)
	}
	{
		item = qs(0xf78cb82d)
	}
	{
		item = qs(0xe17a69d3)
	}
	{
		item = qs(0xa4c54230)
	}
	{
		item = qs(0x7558fa6b)
	}
	{
		item = qs(0x81353cbe)
	}
	{
		item = qs(0xa63f5e7b)
	}
	{
		item = qs(0x8734887e)
	}
	{
		item = qs(0xf6efbb40)
	}
	{
		item = qs(0x509cc4a5)
	}
	{
		song
		item = qs(0xa9c7a812)
	}
	{
		item = qs(0xec12e327)
	}
	{
		item = qs(0x10afb484)
	}
	{
		item = qs(0x68b79983)
	}
	{
		item = qs(0x0fb0f42e)
	}
	{
		item = qs(0xd75c8ba7)
	}
	{
		item = qs(0xeb09396a)
	}
	{
		item = qs(0x406a3b48)
	}
	{
		item = qs(0x765b284d)
	}
	{
		item = qs(0xea3ec009)
	}
	{
		item = qs(0xb991c18a)
	}
	{
		item = qs(0xcce6f320)
	}
	{
		item = qs(0x1e239e97)
	}
	{
		item = qs(0xfae56e8f)
	}
	{
		item = qs(0x5941e085)
	}
	{
		item = qs(0xf1925435)
	}
	{
		item = qs(0xbe20b460)
	}
	{
		item = qs(0x2b770a04)
	}
	{
		item = qs(0x94acd521)
	}
	{
		item = qs(0x33cdaf90)
	}
	{
		item = qs(0x1dc3d33f)
	}
	{
		song
		item = qs(0x64cde4e9)
	}
	{
		item = qs(0x905f9e6b)
	}
	{
		item = qs(0x28602f2f)
	}
	{
		item = qs(0x01a18e7f)
	}
	{
		song
		item = qs(0x6da38be8)
	}
	{
		item = qs(0xdb79e495)
	}
	{
		item = qs(0x387d3ee7)
	}
	{
		song
		item = qs(0x8a232966)
	}
	{
		item = qs(0x45e6d6ee)
	}
	{
		item = qs(0x988263e3)
	}
	{
		item = qs(0x5594827c)
	}
	{
		item = qs(0xba60897e)
	}
	{
		song
		item = qs(0xd48c89dc)
	}
	{
		item = qs(0xf091963b)
	}
	{
		item = qs(0x31e4a043)
	}
	{
		item = qs(0x1bfd2ac8)
	}
	{
		item = qs(0x0c45b3df)
	}
	{
		song
		item = qs(0x0320a808)
	}
	{
		item = qs(0x75cc65c7)
	}
	{
		item = qs(0x30356ee7)
	}
	{
		item = qs(0x9e34521f)
	}
	{
		item = qs(0xd13f9302)
	}
	{
		song
		item = qs(0xe02f27e2)
	}
	{
		item = qs(0x609453fe)
	}
	{
		item = qs(0x36d8e594)
	}
	{
		item = qs(0x8c95ff0e)
	}
	{
		item = qs(0x6246b759)
	}
	{
		song
		item = qs(0x275698c2)
	}
	{
		item = qs(0x10bb0df1)
	}
	{
		item = qs(0xfb6aee33)
	}
	{
		item = qs(0x6a6bea6a)
	}
	{
		song
		item = qs(0xdc8b13dc)
	}
	{
		item = qs(0x6059ba81)
	}
	{
		item = qs(0x1c40f6e7)
	}
	{
		item = qs(0xa8523b42)
	}
	{
		item = qs(0x4ecefeb8)
	}
	{
		song
		item = qs(0x7731622c)
	}
	{
		item = qs(0x49b1a9a3)
	}
	{
		item = qs(0x4daaaa52)
	}
	{
		item = qs(0xc8c5036b)
	}
	{
		item = qs(0x48e15ce1)
	}
	{
		item = qs(0x95cad44a)
	}
	{
		item = qs(0x1b9c9c97)
	}
	{
		item = qs(0x6ef7e2f5)
	}
	{
		song
		item = qs(0xdc76829f)
	}
	{
		item = qs(0x53739093)
	}
	{
		item = qs(0xc39b4f08)
	}
	{
		item = qs(0xe5119d18)
	}
	{
		item = qs(0x043f93d8)
	}
	{
		item = qs(0x7f322c6c)
	}
	{
		item = qs(0x0d54866a)
	}
	{
		item = qs(0xa1fcca34)
	}
	{
		item = qs(0x7edda56e)
	}
	{
		item = qs(0xb6c2f45e)
	}
	{
		item = qs(0x65b7c2b1)
	}
	{
		item = qs(0x61fd4b38)
	}
	{
		item = qs(0xb8629dc6)
	}
	{
		item = qs(0xd0ede669)
	}
	{
		item = qs(0x11f22320)
	}
	{
		item = qs(0x5f931946)
	}
	{
		item = qs(0x817c11e9)
	}
	{
		item = qs(0xd37de694)
	}
	{
		heading
		item = qs(0x66046021)
	}
	{
		song
		item = qs(0xe5a0f112)
	}
	{
		item = qs(0x5b5dc4ff)
	}
	{
		item = qs(0xf55f8f22)
	}
	{
		item = qs(0x95d767b3)
	}
	{
		item = qs(0x6ddd733b)
	}
	{
		item = qs(0x5510aaf9)
	}
	{
		song
		item = qs(0x07981ca9)
	}
	{
		item = qs(0x7ae4b4c2)
	}
	{
		item = qs(0xca39271c)
	}
	{
		item = qs(0x8fa523ce)
	}
	{
		item = qs(0x708651eb)
	}
	{
		item = qs(0x0f397a84)
	}
	{
		heading
		item = qs(0xf93521a2)
	}
	{
		song
		item = qs(0x2d124335)
	}
	{
		item = qs(0x70ec714c)
	}
	{
		item = qs(0x340e1ec6)
	}
	{
		song
		item = qs(0x81ec206b)
	}
	{
		item = qs(0x6c69b48d)
	}
	{
		item = qs(0x7170a950)
	}
	{
		item = qs(0x0427e842)
	}
	{
		song
		item = qs(0xfdbef4d0)
	}
	{
		item = qs(0x84167909)
	}
	{
		song
		item = qs(0x65fb42a1)
	}
	{
		item = qs(0xdfc04f95)
	}
	{
		item = qs(0xf79b271c)
	}
	{
		item = qs(0x4101a4d6)
	}
	{
		item = qs(0x268dfc32)
	}
	{
		item = qs(0x78c2b1df)
	}
	{
		item = qs(0x8e8216d4)
	}
	{
		item = qs(0x180cc8bc)
	}
	{
		item = qs(0x805717ce)
	}
	{
		item = qs(0x10034b6b)
	}
	{
		item = qs(0x8a2977df)
	}
	{
		item = qs(0x75528283)
	}
	{
		item = qs(0xad3170d4)
	}
	{
		item = qs(0xfd39c8bf)
	}
	{
		item = qs(0x6237c5e7)
	}
	{
		item = qs(0x961c4f02)
	}
	{
		item = qs(0x88e7aacf)
	}
	{
		item = qs(0xab7dc925)
	}
	{
		song
		item = qs(0x69709ecc)
	}
	{
		item = qs(0x57b288a9)
	}
	{
		item = qs(0x41d9c97d)
	}
	{
		item = qs(0xbff38414)
	}
	{
		item = qs(0xde476c98)
	}
	{
		item = qs(0x249cea73)
	}
	{
		item = qs(0xeb7184a4)
	}
	{
		item = qs(0x04e3ce39)
	}
	{
		item = qs(0xa4ee16b7)
	}
	{
		item = qs(0x5370005e)
	}
	{
		item = qs(0x40bc8250)
	}
	{
		song
		item = qs(0x644498a6)
	}
	{
		item = qs(0xfa31bc71)
	}
	{
		item = qs(0xc42e4536)
	}
	{
		item = qs(0xd033f601)
	}
	{
		item = qs(0x1f246c2f)
	}
	{
		item = qs(0x74e5ef9b)
	}
	{
		item = qs(0xf2e879c3)
	}
	{
		item = qs(0x64144cf9)
	}
	{
		item = qs(0x4b646114)
	}
	{
		song
		item = qs(0x93d4192e)
	}
	{
		item = qs(0xaab8586f)
	}
	{
		item = qs(0xedc43d30)
	}
	{
		item = qs(0x33fa6785)
	}
	{
		item = qs(0x377e2149)
	}
	{
		item = qs(0x4c2dba1a)
	}
	{
		item = qs(0xb780a240)
	}
	{
		item = qs(0x3429b312)
	}
	{
		item = qs(0xdc6e061a)
	}
	{
		item = qs(0x007cc6fd)
	}
	{
		heading
		item = qs(0x1db79d1a)
	}
	{
		item = qs(0x44eed8fe)
	}
	{
		item = qs(0xe1a2caae)
	}
	{
		item = qs(0xd43238e3)
	}
	{
		item = qs(0x76a95776)
	}
	{
		item = qs(0x2e20664e)
	}
	{
		item = qs(0x5381ffa9)
	}
	{
		item = qs(0x3db204c7)
	}
	{
		item = qs(0xa776ad52)
	}
	{
		item = qs(0x7f52abdb)
	}
	{
		item = qs(0xc1195c1b)
	}
	{
		item = qs(0xa59e0ec7)
	}
	{
		item = qs(0x8b077b9f)
	}
	{
		item = qs(0x677dd7fe)
	}
	{
		item = qs(0xa51738c9)
	}
	{
		item = qs(0x38d8f0d8)
	}
	{
		item = qs(0xe654b785)
	}
	{
		item = qs(0x2272000f)
	}
	{
		item = qs(0xa3b5c76a)
	}
	{
		item = qs(0xd5f11b2d)
	}
	{
		item = qs(0x791b6c1a)
	}
	{
		item = qs(0x65beb2ce)
	}
	{
		item = qs(0xd0ad54f4)
	}
	{
		item = qs(0x28281897)
	}
	{
		item = qs(0x1eacd588)
	}
	{
		item = qs(0x224646d6)
	}
	{
		item = qs(0x31a61dea)
	}
	{
		item = qs(0xca72bad8)
	}
	{
		item = qs(0x0e1bb165)
	}
	{
		item = qs(0xa3ae673f)
	}
	{
		item = qs(0xc98adeab)
	}
	{
		item = qs(0xfbfde865)
	}
	{
		song
		item = qs(0x0b06d55a)
	}
	{
		item = qs(0x10cf83b3)
	}
	{
		item = qs(0x776238cd)
	}
	{
		item = qs(0x3eb0fbda)
	}
	{
		item = qs(0xc533a100)
	}
	{
		item = qs(0x59819f14)
	}
	{
		item = qs(0x191e3225)
	}
	{
		item = qs(0x847d58a5)
	}
	{
		item = qs(0xbd503171)
	}
	{
		item = qs(0x21083429)
	}
	{
		song
		item = qs(0xefa1b00d)
	}
	{
		item = qs(0x6afe7fba)
	}
	{
		item = qs(0xb0c8324d)
	}
	{
		item = qs(0x616b8299)
	}
	{
		item = qs(0x05fd3df6)
	}
	{
		item = qs(0x440ca946)
	}
	{
		item = qs(0x079b1a2d)
	}
	{
		item = qs(0x081f2ed0)
	}
	{
		item = qs(0x26336866)
	}
	{
		item = qs(0xa6f73dd5)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xafabd366)
	}
	{
		song
		item = qs(0x18307bb3)
	}
	{
		item = qs(0xacd511fa)
	}
	{
		item = qs(0xbf12def7)
	}
	{
		item = qs(0x013cbb5f)
	}
	{
		item = qs(0x54069962)
	}
	{
		item = qs(0x8069cdd8)
	}
	{
		item = qs(0xb35e57ec)
	}
	{
		item = qs(0x95ee7772)
	}
	{
		item = qs(0x93f3fd8d)
	}
	{
		item = qs(0x2381a621)
	}
	{
		song
		item = qs(0xb78ff6b1)
	}
	{
		item = qs(0xdf505511)
	}
	{
		item = qs(0x80224d83)
	}
	{
		item = qs(0x33124941)
	}
	{
		song
		item = qs(0x0bfb8e36)
	}
	{
		item = qs(0xbbe806df)
	}
	{
		item = qs(0x62063d48)
	}
	{
		song
		item = qs(0x9ea67eb4)
	}
	{
		item = qs(0xcf11240e)
	}
	{
		item = qs(0xdd3cf665)
	}
	{
		song
		item = qs(0x00035fed)
	}
	{
		item = qs(0x33242542)
	}
	{
		item = qs(0x73b13de5)
	}
	{
		song
		item = qs(0x1d669155)
	}
	{
		item = qs(0x2e6296f3)
	}
	{
		item = qs(0x67a0ab09)
	}
	{
		item = qs(0x57e21560)
	}
	{
		song
		item = qs(0xa642851c)
	}
	{
		item = qs(0xe5be8b04)
	}
	{
		item = qs(0xb5e51469)
	}
	{
		song
		item = qs(0x4abda5ed)
	}
	{
		item = qs(0x5769fbc4)
	}
	{
		item = qs(0x559c662c)
	}
	{
		song
		item = qs(0xb79fb6b0)
	}
	{
		item = qs(0x16961553)
	}
	{
		item = qs(0x76913257)
	}
	{
		item = qs(0x3e0743d5)
	}
	{
		song
		item = qs(0x226be551)
	}
	{
		item = qs(0x4bde86cf)
	}
	{
		item = qs(0x95cf9429)
	}
	{
		song
		item = qs(0x3d2958c7)
	}
	{
		item = qs(0x3c83d889)
	}
	{
		item = qs(0xc74ced77)
	}
	{
		song
		item = qs(0x8d3232df)
	}
	{
		item = qs(0x78fb28a4)
	}
	{
		item = qs(0x99492b72)
	}
	{
		song
		item = qs(0xb7737d17)
	}
	{
		item = qs(0x301257ba)
	}
	{
		item = qs(0x2d766c90)
	}
	{
		song
		item = qs(0x1b35bb09)
	}
	{
		item = qs(0x25751ac4)
	}
	{
		item = qs(0x176eb303)
	}
	{
		song
		item = qs(0x00c76233)
	}
	{
		item = qs(0x541dc9f7)
	}
	{
		item = qs(0x03f175d3)
	}
	{
		song
		item = qs(0x2dc8cd79)
	}
	{
		item = qs(0x47c54e64)
	}
	{
		item = qs(0xa879e4e3)
	}
	{
		song
		item = qs(0x0680c136)
	}
	{
		item = qs(0x6f364841)
	}
	{
		item = qs(0x06f39097)
	}
	{
		song
		item = qs(0x6159bf3e)
	}
	{
		item = qs(0xb2da8dd3)
	}
	{
		item = qs(0x04d64220)
	}
	{
		song
		item = qs(0xd179e6dc)
	}
	{
		item = qs(0xc6c26d12)
	}
	{
		item = qs(0x2f560a0d)
	}
	{
		song
		item = qs(0x25f32aa7)
	}
	{
		item = qs(0xd599e0e6)
	}
	{
		item = qs(0x6dba46b0)
	}
	{
		song
		item = qs(0xaf96a174)
	}
	{
		item = qs(0x4a4d468f)
	}
	{
		item = qs(0x0f9e5611)
	}
	{
		song
		item = qs(0x6858317d)
	}
	{
		item = qs(0xcbc99443)
	}
	{
		item = qs(0x5b42b345)
	}
	{
		song
		item = qs(0xd5421da6)
	}
	{
		item = qs(0xa11637b0)
	}
	{
		item = qs(0x2d08657d)
	}
	{
		song
		item = qs(0xc30ffb2f)
	}
	{
		item = qs(0x7efaac31)
	}
	{
		item = qs(0xaf737042)
	}
	{
		item = qs(0x500c66c9)
	}
	{
		song
		item = qs(0x36d35308)
	}
	{
		item = qs(0xb3fe342e)
	}
	{
		item = qs(0x85799e0f)
	}
	{
		song
		item = qs(0x3628bb76)
	}
	{
		item = qs(0xb2ae8ac2)
	}
	{
		item = qs(0xe365afd1)
	}
	{
		song
		item = qs(0x69528363)
	}
	{
		item = qs(0x36ad7a99)
	}
	{
		item = qs(0x65d1ae2c)
	}
	{
		song
		item = qs(0x822bee06)
	}
	{
		item = qs(0x48b49b05)
	}
	{
		item = qs(0x9d4246b7)
	}
	{
		song
		item = qs(0x9ac44cd3)
	}
	{
		item = qs(0xa6fd1943)
	}
	{
		item = qs(0x0221bac8)
	}
	{
		song
		item = qs(0x5b6a557a)
	}
	{
		item = qs(0xe280841a)
	}
	{
		item = qs(0x50e833d0)
	}
	{
		song
		item = qs(0xec62eae3)
	}
	{
		item = qs(0xc56ec75d)
	}
	{
		item = qs(0x26eb4789)
	}
	{
		song
		item = qs(0xfab301f6)
	}
	{
		item = qs(0x2e1c3908)
	}
	{
		item = qs(0x6ba2d831)
	}
	{
		song
		item = qs(0xfa4879cd)
	}
	{
		item = qs(0xaf13b09c)
	}
	{
		item = qs(0xfcef87f4)
	}
	{
		song
		item = qs(0xdf86d451)
	}
	{
		item = qs(0xd71d5494)
	}
	{
		item = qs(0xab4cc091)
	}
	{
		song
		item = qs(0x844e597c)
	}
	{
		item = qs(0x0df4e799)
	}
	{
		item = qs(0xc596b077)
	}
	{
		song
		item = qs(0x383c1f29)
	}
	{
		item = qs(0xfe255f73)
	}
	{
		item = qs(0x6395c1e3)
	}
	{
		song
		item = qs(0xcda592f7)
	}
	{
		item = qs(0x8b482237)
	}
	{
		item = qs(0x6fe6173b)
	}
	{
		song
		item = qs(0xe8be0ed5)
	}
	{
		item = qs(0x541480ad)
	}
	{
		item = qs(0x7379fffc)
	}
	{
		item = qs(0x21658e7c)
	}
	{
		song
		item = qs(0x69e4116e)
	}
	{
		item = qs(0x3ebb38e3)
	}
	{
		item = qs(0x61020e4e)
	}
	{
		song
		item = qs(0x98afe6e4)
	}
	{
		item = qs(0x36ca15e1)
	}
	{
		item = qs(0xb53dca5b)
	}
	{
		song
		item = qs(0x65455955)
	}
	{
		item = qs(0x94d7853b)
	}
	{
		item = qs(0xa7081495)
	}
	{
		item = qs(0xc7ae7352)
	}
	{
		song
		item = qs(0x9457dcfa)
	}
	{
		item = qs(0xf11d3fe4)
	}
	{
		item = qs(0xe29d2d0b)
	}
	{
		song
		item = qs(0x64f374f6)
	}
	{
		item = qs(0x50eb7dcc)
	}
	{
		item = qs(0xe12cab51)
	}
	{
		song
		item = qs(0x4716be58)
	}
	{
		item = qs(0xd88c4c9b)
	}
	{
		item = qs(0xe92bf4a3)
	}
	{
		song
		item = qs(0x1021f0f3)
	}
	{
		item = qs(0x492aca6d)
	}
	{
		item = qs(0xef3b75ca)
	}
	{
		song
		item = qs(0x0bf9fa94)
	}
	{
		item = qs(0x745938e6)
	}
	{
		item = qs(0x07b79148)
	}
	{
		song
		item = qs(0x67248103)
	}
	{
		item = qs(0x64e24804)
	}
	{
		item = qs(0x48e436ae)
	}
	{
		song
		item = qs(0x413dc09c)
	}
	{
		item = qs(0x14a7dadc)
	}
	{
		item = qs(0xda2a9b35)
	}
	{
		song
		item = qs(0xd57d0618)
	}
	{
		item = qs(0xaef4c287)
	}
	{
		item = qs(0x683e0c7a)
	}
	{
		song
		item = qs(0x78820827)
	}
	{
		item = qs(0x339424c9)
	}
	{
		item = qs(0x563ea0ec)
	}
	{
		song
		item = qs(0xdbcf4b77)
	}
	{
		item = qs(0x5c9320dc)
	}
	{
		item = qs(0xd5f88554)
	}
	{
		item = qs(0xf0372f22)
	}
	{
		song
		item = qs(0x20b88f43)
	}
	{
		item = qs(0xf5deaacd)
	}
	{
		item = qs(0xf0b0b495)
	}
	{
		song
		item = qs(0x0be4dd30)
	}
	{
		item = qs(0x8cef9b6a)
	}
	{
		item = qs(0xc3da95d6)
	}
	{
		song
		item = qs(0x4634eea7)
	}
	{
		item = qs(0x71498f5b)
	}
	{
		item = qs(0x9647b3db)
	}
	{
		song
		item = qs(0x7edb1bf0)
	}
	{
		item = qs(0x5b9400da)
	}
	{
		item = qs(0x9928b6e5)
	}
	{
		song
		item = qs(0x5e77075f)
	}
	{
		item = qs(0x32bcd3f8)
	}
	{
		item = qs(0x130e7524)
	}
	{
		item = qs(0xb44b8bb5)
	}
	{
		song
		item = qs(0xe2cac922)
	}
	{
		item = qs(0xdd3ea468)
	}
	{
		item = qs(0x7d4a1f6f)
	}
	{
		song
		item = qs(0x9ee709d1)
	}
	{
		item = qs(0x7d08e404)
	}
	{
		item = qs(0xe9592670)
	}
	{
		song
		item = qs(0xeee94d0b)
	}
	{
		item = qs(0x4040bc48)
	}
	{
		item = qs(0xa73bb260)
	}
	{
		song
		item = qs(0xc759aaaf)
	}
	{
		item = qs(0xe33cb4ff)
	}
	{
		item = qs(0x67429d0c)
	}
	{
		song
		item = qs(0x10ff7a17)
	}
	{
		item = qs(0x7e2c88d9)
	}
	{
		item = qs(0xf262ef06)
	}
	{
		song
		item = qs(0xfd219c3b)
	}
	{
		item = qs(0x3b40def4)
	}
	{
		item = qs(0x5ef20db4)
	}
	{
		song
		item = qs(0xcd9fa9cf)
	}
	{
		item = qs(0x60a9cb39)
	}
	{
		item = qs(0x084a75e0)
	}
	{
		song
		item = qs(0x291c1c19)
	}
	{
		item = qs(0xf5e20829)
	}
	{
		item = qs(0x17720c8b)
	}
	{
		song
		item = qs(0x462bf607)
	}
	{
		item = qs(0xd04a80a1)
	}
	{
		item = qs(0x9496e3dc)
	}
	{
		item = qs(0x5138eeaf)
	}
	{
		song
		item = qs(0xe9be3d0a)
	}
	{
		item = qs(0x379523bd)
	}
	{
		item = qs(0x5eb7837a)
	}
	{
		song
		item = qs(0x60f1865c)
	}
	{
		item = qs(0x6eade957)
	}
	{
		item = qs(0x47fe922c)
	}
	{
		song
		item = qs(0xc83d0c9b)
	}
	{
		item = qs(0x23795f42)
	}
	{
		item = qs(0x13199d9f)
	}
	{
		song
		item = qs(0x01e3d140)
	}
	{
		item = qs(0xb27e3340)
	}
	{
		item = qs(0xae4f922e)
	}
	{
		song
		item = qs(0x1a2095c5)
	}
	{
		item = qs(0x5a271e29)
	}
	{
		item = qs(0x8a215e4b)
	}
	{
		song
		item = qs(0x7109dc90)
	}
	{
		item = qs(0xbc8ac690)
	}
	{
		item = qs(0x518f9965)
	}
	{
		song
		item = qs(0x83175c08)
	}
	{
		item = qs(0x575eaf22)
	}
	{
		item = qs(0x6fe68263)
	}
	{
		song
		item = qs(0x5372e088)
	}
	{
		item = qs(0xd71d5494)
	}
	{
		item = qs(0x702cfe04)
	}
	{
		song
		item = qs(0x75e13a52)
	}
	{
		item = qs(0x709bf544)
	}
	{
		item = qs(0x76ba6148)
	}
	{
		item = qs(0xf0d274d7)
	}
	{
		song
		item = qs(0x05733b87)
	}
	{
		item = qs(0x4dc62aa3)
	}
	{
		item = qs(0xd3491613)
	}
	{
		song
		item = qs(0x07685862)
	}
	{
		item = qs(0xcf11240e)
	}
	{
		item = qs(0xf8e31778)
	}
	{
		song
		item = qs(0x88aada97)
	}
	{
		item = qs(0x559d0fb4)
	}
	{
		item = qs(0xbcb3734d)
	}
	{
		song
		item = qs(0x2ec85921)
	}
	{
		item = qs(0x9b527518)
	}
	{
		item = qs(0x456dd19e)
	}
	{
		song
		item = qs(0x96d4d5b1)
	}
	{
		item = qs(0xd71d5494)
	}
	{
		item = qs(0x1f5b5649)
	}
	{
		song
		item = qs(0x314a74ca)
	}
	{
		item = qs(0xb05078a1)
	}
	{
		item = qs(0x2871207c)
	}
	{
		song
		item = qs(0x95c2964c)
	}
	{
		item = qs(0xfe00de5b)
	}
	{
		item = qs(0xab5255f1)
	}
	{
		song
		item = qs(0x92a89146)
	}
	{
		item = qs(0x43810e37)
	}
	{
		item = qs(0x6e3afce1)
	}
	{
		song
		item = qs(0x1282c4c5)
	}
	{
		item = qs(0x7b6518bb)
	}
	{
		item = qs(0x3aec79d7)
	}
	{
		song
		item = qs(0xc772405e)
	}
	{
		item = qs(0x6d839192)
	}
	{
		item = qs(0xbd8fba9c)
	}
	{
		item = qs(0x5759593e)
	}
	{
		song
		item = qs(0x701ee7ed)
	}
	{
		item = qs(0x96a313b5)
	}
	{
		item = qs(0x070e56f2)
	}
	{
		song
		item = qs(0x69466f6c)
	}
	{
		item = qs(0xa3b13c52)
	}
	{
		item = qs(0x72ff53ee)
	}
	{
		song
		item = qs(0x4a306a8f)
	}
	{
		item = qs(0x945769c4)
	}
	{
		item = qs(0x720b0d06)
	}
	{
		song
		item = qs(0xda3e895d)
	}
	{
		item = qs(0x5d9b24ba)
	}
	{
		item = qs(0xbcf69d86)
	}
	{
		song
		item = qs(0x1cea1e54)
	}
	{
		item = qs(0xd14f6c92)
	}
	{
		item = qs(0x1cba912f)
	}
	{
		song
		item = qs(0xf04f703c)
	}
	{
		item = qs(0xb4c2bf0e)
	}
	{
		item = qs(0x3674f816)
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x0c65f892)
	}
	{
		emptyspace
	}
]
