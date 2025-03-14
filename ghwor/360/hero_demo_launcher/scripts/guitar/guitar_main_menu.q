force_mainmenu_signin = 0
0x582f33f9 = [
	{
		alpha = 0
		scale = (2.0, 2.0)
		pos = (420.0, 50.0)
		z = 50
	}
	{
		alpha = 1
		scale = (1.0, 1.0)
		pos = (183.5, 6.0)
		z = 49
	}
	{
		alpha = 1
		scale = (0.85, 0.85)
		pos = (53.5, 6.0)
		z = 48
	}
	{
		alpha = 1
		scale = (0.7, 0.7)
		pos = (-34.5, 4.5)
		z = 47
	}
	{
		alpha = 1
		scale = (0.55, 0.55)
		pos = (-75.5, 3.0)
		z = 46
	}
	{
		alpha = 0
		scale = (0.55, 0.55)
		pos = (-320.0, 3.0)
		z = 45
	}
]

script create_main_menu 
	change \{respond_to_signin_changed = 0}
	frontend_load_soundcheck
	clear_exclusive_devices
	setmenuautorepeattimes \{(0.3, 0.05)}
	disable_pause
	unpausegame
	change \{current_num_players = 1}
	change structurename = player1_status controller = ($primary_controller)
	disable_pause
	change \{current_song = $startup_song}
	change \{rich_presence_context = presence_menus}
	change \{player1_device = 0}
	change \{player2_device = 1}
	change \{player3_device = 2}
	change \{player4_device = 3}
	killmovie \{textureslot = 1}
	spawnscriptnow \{menu_music_fade
		params = {
			in
			time = 0.01
		}}
endscript

script create_main_menu_elements 
	if NOT ($invite_controller = -1)
		return
	endif
	if screenelementexists \{id = current_menu_anchor}
		current_menu_anchor :die
	endif
	createscreenelement \{type = descinterface
		id = current_menu_anchor
		parent = root_window
		desc = 'main_menu_layout'
		just = [
			center
			center
		]
		tags = {
			current_preview = none
		}}
	current_menu_anchor :obj_spawnscriptnow \{0x23fe67af}
	if current_menu_anchor :desc_resolvealias \{name = 0x8196d1b1}
		assignalias id = <resolved_id> alias = scrolling_menu
		scrolling_menu :se_setprops \{top_selection = true}
	endif
	if current_menu_anchor :desc_resolvealias \{name = 0x109627e0}
		assignalias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_up
					0x17cc8dd7
					params = {
						direction = right
					}
				}
				{
					pad_down
					0x17cc8dd7
					params = {
						direction = left
					}
				}
				{
					pad_left
					0x17cc8dd7
					params = {
						direction = right
					}
				}
				{
					pad_right
					0x17cc8dd7
					params = {
						direction = left
					}
				}
				{
					pad_up
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_down
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
				{
					pad_left
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
				{
					pad_right
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_up
					0x6f9d6496
				}
				{
					pad_down
					0x6f9d6496
				}
				{
					pad_left
					0x6f9d6496
				}
				{
					pad_right
					0x6f9d6496
				}
			]}
		current_menu_anchor :desc_resolvealias \{name = 0x54f059a1}
		assignalias id = <resolved_id> alias = 0x8c8c965f
		getscreenelementchildren \{id = 0x8c8c965f}
		acc = <children>
		0x95185f8d
		getarraysize \{$0x9bb9f9d7}
		i = $0x48ad7e7f
		begin
		if (<i> >= <array_size>)
			i = (<i> - <array_size>)
		endif
		if (<i> < 0)
			i = 0
		endif
		if (<i> < <array_size>)
			break
		endif
		repeat
		0x6fdeebff = <array_size>
		if (<0x6fdeebff> < 4)
			0x6fdeebff = 4
		endif
		begin
		0x1d991286 = (($0x9bb9f9d7) [<i>])
		if ((($<0x1d991286>).0x8ba1e7d9) = movie)
			event_handlers = [
				{focus mainmenu_item_focus}
				{unfocus mainmenu_item_unfocus}
				{pad_choose 0x39b65d66 params = {0x1d991286 = <0x1d991286>}}
			]
		else
			event_handlers = [
				{focus mainmenu_item_focus}
				{unfocus mainmenu_item_unfocus}
				{pad_choose 0x5d55d294}
			]
		endif
		createscreenelement {
			type = descinterface
			parent = current_menu
			desc = 'GameBox_Item'
			dims = (293.0, 415.0)
			z_priority = 10
			scale = (1.0, 1.0)
			event_handlers = <event_handlers>
			tags = {
				0x1d991286 = <0x1d991286>
			}
		}
		0xe377ad34 = (<acc> [<i>])
		<0xe377ad34> :se_setprops {
			0x28851fe1 = (($g_menu_colors).0x4b1beb1c)
		}
		i = (<i> + 1)
		if (<i> = <array_size>)
			i = 0
		endif
		repeat <0x6fdeebff>
	endif
	getarraysize \{$0x9bb9f9d7}
	i = $0x48ad7e7f
	begin
	if (<i> >= <array_size>)
		i = (<i> - <array_size>)
	endif
	if (<i> < 0)
		i = 0
	endif
	if (<i> < <array_size>)
		break
	endif
	repeat
	j = 0
	0x6fdeebff = <array_size>
	if (<0x6fdeebff> < 4)
		0x6fdeebff = 4
	endif
	begin
	0x1d991286 = (($0x9bb9f9d7) [<i>])
	0xe377ad34 = (<acc> [<j>])
	<0xe377ad34> :se_setprops {
		0xe9cc5b29 = (($<0x1d991286>).0x7598abf0)
	}
	i = (<i> - 1)
	if (<i> < 0)
		i = (<array_size> - 1)
	endif
	j = (<j> + 1)
	repeat <0x6fdeebff>
	current_menu_anchor :desc_resolvealias \{name = 0x54f059a1}
	getscreenelementchildren id = <resolved_id>
	0xa11da1a3 = (<children> [($0x898a1331)])
	<0xa11da1a3> :obj_spawnscriptnow 0x54a4a614
	if ($0x4380f73c = 1)
		runscriptonscreenelement \{0xc759f565
			id = current_menu}
		runscriptonscreenelement \{0xe728e90c
			id = current_menu}
	endif
endscript

script mainmenu_item_focus 
	se_getparentid
	<parent_id> :gettags
	getarraysize \{$0x9bb9f9d7}
	i = $0x48ad7e7f
	begin
	if (<i> >= <array_size>)
		i = (<i> - <array_size>)
	endif
	if (<i> < 0)
		i = 0
	endif
	if (<i> < <array_size>)
		break
	endif
	repeat
	0x55cd0e3d = (<tag_selected_index> + <i>)
	begin
	if (<0x55cd0e3d> >= <array_size>)
		0x55cd0e3d = (<0x55cd0e3d> - <array_size>)
	endif
	if (<0x55cd0e3d> < 0)
		0x55cd0e3d = 0
	endif
	if (<0x55cd0e3d> < <array_size>)
		break
	endif
	repeat
	0x6fdeebff = <array_size>
	if (<0x6fdeebff> < 4)
		0x6fdeebff = 4
	endif
	0x1d991286 = (($0x9bb9f9d7) [<0x55cd0e3d>])
	getarraysize (($<0x1d991286>).songs)
	if (<array_size> > 4)
		num_songs = 4
	else
		num_songs = <array_size>
	endif
	text_props = {}
	i = 1
	begin
	formattext checksumname = song_text 'Song_%a_text' a = <i>
	formattext checksumname = artist_text 'Artist_%b_text' b = <i>
	if (<i> <= <num_songs>)
		addparam structure_name = text_props name = <song_text> value = (($<0x1d991286>).songs [(<i> -1)])
		addparam structure_name = text_props name = <artist_text> value = (($<0x1d991286>).artists [(<i> -1)])
	else
		addparam structure_name = text_props name = <song_text> value = qs(0x00000000)
		addparam structure_name = text_props name = <artist_text> value = qs(0x00000000)
	endif
	<i> = (<i> + 1)
	repeat <0x6fdeebff>
	current_menu_anchor :se_setprops <text_props>
	current_menu_anchor :se_setprops {
		game_title_text = (($<0x1d991286>).0x1f8c884c)
	}
	spawnscriptnow 0x46f3f511 params = {0x1d991286 = <0x1d991286>}
	spawnscriptnow 0xf971ea91 params = {0x1d991286 = <0x1d991286>}
endscript

script mainmenu_item_unfocus 
	se_getparentid
	<parent_id> :gettags
endscript

script 0xf971ea91 
	requireparams \{[
			0x1d991286
		]
		all}
	clean_up_user_control_helpers
	if ((($<0x1d991286>).0x8ba1e7d9) = movie)
		add_user_control_helper \{text = qs(0x4ff85c08)
			button = green
			z = 10
			all_buttons
			0xdfe0a18c = 0}
	elseif ((($<0x1d991286>).0x8ba1e7d9) = 0x29bd205f)
		add_user_control_helper \{text = qs(0xcdaa4ea8)
			button = green
			z = 10
			all_buttons
			0xdfe0a18c = 0}
	endif
endscript
0xbf6bcade = 0
anim_time = 0.2
0x898a1331 = 0

script 0x17cc8dd7 
	requireparams \{[
			direction
		]
		all}
	setbuttoneventmappings \{block_menu_input}
	current_menu_anchor :desc_resolvealias \{name = 0x54f059a1}
	assignalias id = <resolved_id> alias = 0x8c8c965f
	getscreenelementchildren \{id = 0x8c8c965f}
	acc = <children>
	getarraysize <acc>
	0x4b6701eb = <array_size>
	getarraysize \{$0x9bb9f9d7}
	0xf3b204b8 = <array_size>
	current_menu :gettags
	getarraysize \{$0x9bb9f9d7}
	tag_selected_index = (<tag_selected_index> + $0x48ad7e7f)
	begin
	if (<tag_selected_index> >= <array_size>)
		tag_selected_index = (<tag_selected_index> - <array_size>)
	endif
	if (<tag_selected_index> < 0)
		tag_selected_index = 0
	endif
	if (<tag_selected_index> < <array_size>)
		break
	endif
	repeat
	if (<direction> = left)
		if NOT (($0x898a1331) = 0)
			change 0x898a1331 = ($0x898a1331 - 1)
		else
			change 0x898a1331 = (<0x4b6701eb> - 1)
		endif
		gamma = ((<0x4b6701eb> - 1) - ($0xbf6bcade))
		if NOT (($0xbf6bcade) = (<0x4b6701eb> - 1))
			change 0xbf6bcade = (($0xbf6bcade) + 1)
		else
			change \{0xbf6bcade = 0}
		endif
		if NOT (<tag_selected_index> = (<0xf3b204b8> - 1))
			0x8322fe50 = (<tag_selected_index> + 1)
		else
			0x8322fe50 = 0
		endif
		0x1d991286 = ($0x9bb9f9d7 [<0x8322fe50>])
		0xe377ad34 = (<acc> [<gamma>])
		<0xe377ad34> :se_setprops {
			0xe9cc5b29 = (($<0x1d991286>).0x7598abf0)
		}
	elseif (<direction> = right)
		if NOT (($0x898a1331) = (<0x4b6701eb> - 1))
			change 0x898a1331 = ($0x898a1331 + 1)
		else
			change \{0x898a1331 = 0}
		endif
		if NOT (($0xbf6bcade) = 0)
			change 0xbf6bcade = (($0xbf6bcade) - 1)
		else
			change 0xbf6bcade = (<0x4b6701eb> - 1)
		endif
		gamma = ((<0x4b6701eb> - (($0xbf6bcade) + 1)) + 4)
		if (<gamma> > (<0x4b6701eb> - 1))
			gamma = (<gamma> - <0x4b6701eb>)
		endif
		0x8322fe50 = (<tag_selected_index> - 4)
		if (<0x8322fe50> < 0)
			0x8322fe50 = (<0x8322fe50> + 4)
		endif
		0x1d991286 = ($0x9bb9f9d7 [<0x8322fe50>])
		0xe377ad34 = (<acc> [<gamma>])
		<0xe377ad34> :se_setprops {
			0xe9cc5b29 = (($<0x1d991286>).0x7598abf0)
		}
	endif
	i = 0
	begin
	delta = (($0xbf6bcade) + <i>)
	if (<delta> > (<0x4b6701eb> - 1))
		delta = (<delta> - <0x4b6701eb>)
	endif
	if NOT (<delta> = (<0x4b6701eb> - 1))
		0xf3b0d3d3 = ($0x582f33f9 [(<delta> + 1)])
	else
		0xf3b0d3d3 = ($0x582f33f9 [0])
	endif
	0xe377ad34 = (<acc> [<i>])
	if NOT (<i> = ($0x898a1331))
		<0xe377ad34> :se_setprops {
			time = ($anim_time)
			anim = linear
			pos = (<0xf3b0d3d3>.pos)
			alpha = (<0xf3b0d3d3>.alpha)
			scale = (<0xf3b0d3d3>.scale)
			z_priority = (<0xf3b0d3d3>.z)
			0x28851fe1 = (($g_menu_colors).0x4b1beb1c)
			0xe4b28524 = 0
		}
	else
		<0xe377ad34> :se_setprops {
			time = ($anim_time)
			anim = linear
			pos = (<0xf3b0d3d3>.pos)
			alpha = (<0xf3b0d3d3>.alpha)
			scale = (<0xf3b0d3d3>.scale)
			z_priority = (<0xf3b0d3d3>.z)
			0x28851fe1 = (($g_menu_colors).0xe2b2766d)
			0xe4b28524 = 0.8
		}
	endif
	i = (<i> + 1)
	repeat <0x4b6701eb>
	if scriptisrunning \{0x54a4a614}
		killspawnedscript \{name = 0x54a4a614}
	endif
	wait (($anim_time) * 0.75) second
	0xa11da1a3 = (<acc> [($0x898a1331)])
	<0xa11da1a3> :obj_spawnscriptnow 0x54a4a614
	setbuttoneventmappings \{unblock_menu_input}
endscript

script 0x23fe67af 
	begin
	se_setprops \{time = 0.55
		0x72b1f185 = 1
		0xd4c6fa31 = 0}
	wait \{0.6
		seconds}
	se_setprops \{time = 0.55
		0x72b1f185 = 0
		0xd4c6fa31 = 1}
	wait \{0.6
		seconds}
	se_setprops \{time = 0.55
		0x72b1f185 = 0
		0xd4c6fa31 = 0}
	wait \{0.6
		seconds}
	repeat
endscript

script 0x54a4a614 
	wait ($anim_time) second
	se_setprops {
		0x28851fe1 = (($g_menu_colors).0xe2b2766d)
		0xe4b28524 = 0.7
	}
	begin
	se_setprops \{0xe4b28524 = 0.5
		time = 0.55}
	wait \{0.8
		seconds}
	se_setprops \{0xe4b28524 = 0.8
		time = 0.25}
	wait \{0.8
		seconds}
	repeat
endscript
0xf54f5034 = 0
0xe825afcc = 0

script 0xc759f565 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	wait_time = ($0x8e81c1aa)
	begin
	0xc890cbcb = <wait_time>
	begin
	printf qs(0xc2723725) i = <0xc890cbcb> channel = 0x37807f54
	if (<0xc890cbcb> = 0)
		printf \{qs(0x9f12cd2b)
			channel = 0x37807f54}
		waitformovieloop \{textureslot = 1}
		obj_killspawnedscript \{name = 0xe728e90c}
		break
	endif
	wait \{1
		second
		ignoreslomo}
	if ($0xf54f5034 = 0)
		0xc890cbcb = (<0xc890cbcb> - 1)
	else
		0xc890cbcb = <wait_time>
	endif
	repeat
	current_menu :gettags
	getarraysize \{$0x9bb9f9d7}
	0xed1a8183 = (<tag_selected_index> + $0x48ad7e7f)
	begin
	if (<0xed1a8183> >= <array_size>)
		0xed1a8183 = (<0xed1a8183> - <array_size>)
	endif
	if (<0xed1a8183> < 0)
		0xed1a8183 = 0
	endif
	if (<0xed1a8183> < <array_size>)
		break
	endif
	repeat
	i = (<0xed1a8183> + 1)
	change \{0x268807fc = 0}
	change \{0x05866133 = 1}
	begin
	if (<i> >= <array_size>)
		i = 0
	endif
	current = (($0x9bb9f9d7) [<i>])
	printf qs(0x8f5ce990) s = <current> channel = 0x37807f54
	change 0xe825afcc = <i>
	if NOT screenelementexists \{id = 0xc6a6863a}
		createscreenelement \{type = spriteelement
			parent = root_window
			id = 0xc6a6863a
			desc = 'GameBox_Item'
			dims = (1600.0, 1200.0)
			pos = (-200.0, -100.0)
			just = [
				left
				top
			]
			rgba = [
				0
				0
				0
				255
			]
			z_priority = 500}
	endif
	0x39b65d66 0x1d991286 = <current>
	if ($0x268807fc = 1)
		change \{0x05866133 = 0}
		change \{0x268807fc = 0}
		destroyscreenelement \{id = 0xc6a6863a}
		0x1d991286 = (($0x9bb9f9d7) [<0xed1a8183>])
		spawnscriptnow 0x46f3f511 params = {0x1d991286 = <0x1d991286>}
		break
	endif
	i = (<i> + 1)
	wait \{2
		seconds}
	repeat
	repeat
endscript

script 0xe728e90c \{button1 = {
		}
		button2 = {
		}}
	wait \{30
		gameframes}
	get_handlers_for_all_buttons \{event_script = 0x6f9d6496}
	begin
	removeparameter \{makes}
	removeparameter \{device_num}
	setprops event_handlers = <event_handlers> replace_handlers
	wait \{1
		gameframe}
	repeat
endscript

script 0x6f9d6496 
	if ($0x4380f73c = 1)
		killspawnedscript \{name = 0xc759f565}
		printf \{qs(0xd6010d61)
			channel = 0x37807f54}
		wait \{30
			gameframes}
		begin
		if NOT scriptisrunning \{0xc759f565}
			runscriptonscreenelement \{0xc759f565
				id = current_menu}
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script 0x6e229336 
	requireparams \{[
			0x38588519
		]
		all}
	0x4e5b06b1 = none
	0x03975c29
	if (<0x19f26901>)
		getlocale
		if ((<locale> != locale_united_kingdom) && (<locale> != locale_germany))
			0x4e5b06b1 = ((<0x38588519>).0xe54aad28)
		endif
	else
		0x4e5b06b1 = ((<0x38588519>).esrb)
	endif
	return 0x4e5b06b1 = <0x4e5b06b1>
endscript

script 0x8377b203 
	requireparams \{[
			0x38588519
		]
		all}
	0x4e5b06b1 = ((<0x38588519>).0x350839e4)
	if french
		if structurecontains \{structure = 0x38588519
				0x0383ea35}
			0x4e5b06b1 = ((<0x38588519>).0x0383ea35)
		endif
	elseif italian
		if structurecontains \{structure = 0x38588519
				0x933cf7a4}
			0x4e5b06b1 = ((<0x38588519>).0x933cf7a4)
		endif
	elseif german
		if structurecontains \{structure = 0x38588519
				0x7484daa3}
			0x4e5b06b1 = ((<0x38588519>).0x7484daa3)
		endif
	elseif spanish
		if structurecontains \{structure = 0x38588519
				0x6e5e0ede}
			0x4e5b06b1 = ((<0x38588519>).0x6e5e0ede)
		endif
	endif
	return 0x4e5b06b1 = <0x4e5b06b1>
endscript

script 0x46f3f511 
	requireparams \{[
			0x1d991286
		]
		all}
	0x6e229336 0x38588519 = ($<0x1d991286>)
	if (<0x4e5b06b1> != none)
		wait \{0.35000002
			second}
		spawnscriptnow 0x89cb2c63 params = {0x1d991286 = <0x1d991286>}
		wait \{4
			second}
		killspawnedscript \{name = 0x89cb2c63}
		destroyscreenelement \{id = preview_movie}
		waitforallmoviestofinish
	endif
	wait \{0.35000002
		second}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	current_menu_anchor :gettags
	if gotparam \{0x1d991286}
		menu_music_off
		spawnscriptnow \{bg_crowd_front_end_silence
			params = {
				immediate = 1
			}}
		if ((($<0x1d991286>).0x350839e4) = <current_preview>)
			if screenelementexists \{id = preview_movie}
				return
			endif
		endif
		if current_menu_anchor :desc_resolvealias \{name = alias_video_container}
			destroyscreenelement \{id = preview_movie}
			waitforallmoviestofinish
			set_bink_heap_state \{state = big}
			0x8377b203 0x38588519 = ($<0x1d991286>)
			createscreenelement {
				type = movieelement
				parent = <resolved_id>
				id = preview_movie
				dims = (627.0, 399.0)
				just = [center center]
				pos_anchor = [center center]
				pos = (0.0, 0.0)
				textureslot = 1
				texturepri = 4
				no_hold
				movie = <0x4e5b06b1>
				alpha = <alpha>
			}
			current_menu_anchor :settags current_preview = (($<0x1d991286>).0x350839e4)
			begin
			if ismovieplaying \{textureslot = 1}
				break
			endif
			wait \{1
				gameframes}
			repeat
			current_menu_anchor :se_setprops \{video_placeholder_alpha = 0.0
				time = 0.1}
		else
			printf \{qs(0xb0a4d5ff)
				channel = 0x37807f54}
		endif
	endif
endscript

script 0x89cb2c63 
	requireparams \{[
			0x1d991286
		]
		all}
	wait \{0.35000002
		second}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	current_menu_anchor :gettags
	if gotparam \{0x1d991286}
		menu_music_off
		spawnscriptnow \{bg_crowd_front_end_silence
			params = {
				immediate = 1
			}}
		if ((($<0x1d991286>).0x350839e4) = <current_preview>)
			if screenelementexists \{id = preview_movie}
				return
			endif
		endif
		if current_menu_anchor :desc_resolvealias \{name = alias_video_container}
			destroyscreenelement \{id = preview_movie}
			waitforallmoviestofinish
			set_bink_heap_state \{state = big}
			0x6e229336 0x38588519 = ($<0x1d991286>)
			if (<0x4e5b06b1> != none)
				createscreenelement {
					type = movieelement
					parent = <resolved_id>
					id = preview_movie
					dims = (627.0, 399.0)
					just = [center center]
					pos_anchor = [center center]
					pos = (0.0, 0.0)
					textureslot = 1
					texturepri = 4
					no_hold
					movie = <0x4e5b06b1>
					alpha = <alpha>
				}
				current_menu_anchor :settags current_preview = (($<0x1d991286>).0x350839e4)
				begin
				if ismovieplaying \{textureslot = 1}
					break
				endif
				wait \{1
					gameframes}
				repeat
				current_menu_anchor :se_setprops \{video_placeholder_alpha = 0.0
					time = 0.1}
			endif
			waitforallmoviestofinish
		else
			printf \{qs(0xb0a4d5ff)
				channel = 0x37807f54}
		endif
	endif
endscript

script 0x39b65d66 
	requireparams \{[
			0x1d991286
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	current_menu :se_setprops \{block_events}
	killspawnedscript \{name = 0x46f3f511}
	change \{0xf54f5034 = 1}
	destroyscreenelement \{id = preview_movie}
	waitforallmoviestofinish
	spawnscriptnow \{bg_crowd_front_end_silence
		params = {
			immediate = 1
		}}
	fadetoblack \{on
		alpha = 1.0
		time = 0
		z_priority = 200}
	clean_up_user_control_helpers
	printf qs(0x1d540dc1) a = <0x1d991286> b = (($<0x1d991286>).0x8ba1e7d9) channel = 0x37807f54
	netsessionfunc \{func = removeallcontrollers}
	0x6e229336 0x38588519 = ($<0x1d991286>)
	if (<0x4e5b06b1> != none)
		playmovieandwait noblack movie = <0x4e5b06b1>
	endif
	wait \{0.35000002
		second}
	0x8377b203 0x38588519 = ($<0x1d991286>)
	playmovieandwait noblack movie = <0x4e5b06b1>
	clean_up_user_control_helpers
	destroyscreenelement \{id = 0xf08f574b}
	netsessionfunc func = addcontrollers params = {controller = ($primary_controller)}
	spawnscriptnow 0xf971ea91 params = {0x1d991286 = <0x1d991286>}
	fadetoblack \{off
		time = 0.2}
	change \{0xf54f5034 = 0}
	if (($0x05866133) = 0)
		spawnscript 0x46f3f511 params = <...>
	endif
	current_menu :se_setprops \{unblock_events}
endscript

script 0xa7ebd1fb 
	current = (($0x9bb9f9d7) [$0xe825afcc])
	if ((($<current>).0x8ba1e7d9) = 0x29bd205f)
		0x37807f54 = (($<current>).0x22d18054)
		0x5f145430 = (($<current>).0x5f145430)
		0xe3d77aca 0xf4514b5a = <0x37807f54> 0x5f145430 = <0x5f145430>
	endif
endscript

script 0x5d55d294 
	gettags
	0x37807f54 = (($<0x1d991286>).0x22d18054)
	0x5f145430 = (($<0x1d991286>).0x5f145430)
	0xe3d77aca 0xf4514b5a = <0x37807f54> 0x5f145430 = <0x5f145430>
endscript

script destroy_main_menu 
	generic_ui_destroy
	destroy_viewport_ui
endscript

script 0xe3d77aca \{0xb915deae = 0}
	if 0xdd378374 0xf4514b5a = <0xf4514b5a> 0x5f145430 = <0x5f145430>
		printf \{qs(0xbf2b954f)}
		if screenelementexists \{id = 0xa73e4640}
			destroyscreenelement \{id = 0xa73e4640}
		endif
		wait_for_safe_shutdown
		disable_pause
		0x03975c29
		if (<0x19f26901>)
			legalscreen_name = 'boot_legal'
			change \{bx_game_title = 'Greatest Hits'}
			change \{bx_short_game_title = 'GH'}
		else
			legalscreen_name = 'boot_legal_NA'
			change \{bx_game_title = 'Smash Hits'}
			change \{bx_short_game_title = 'SH'}
		endif
		displayloadingscreen <legalscreen_name> spin3d_texture = 'load_wheel' spin_x = 640 spin_y = 575 scale = 0.05 localized
		stoprendering
		begin
		if NOT scriptisrunning \{0x46f3f511}
			break
		endif
		printf \{channel = 0x37807f54
			qs(0x40079dff)}
		wait \{1
			gameframe}
		repeat
		if ($bink_heap_state != small)
			killallmovies
			waitforallmoviestofinish
			set_bink_heap_state \{state = small}
		endif
		shutdown_game_for_signin_change \{signin_change = 0}
		startrendering
		printf channel = 0x37807f54 qs(0xe8082576) a = <0xf4514b5a> b = <0x5f145430> c = $0xd491a6ab
		0xdd784604 0xf4514b5a = <0xf4514b5a> 0xb915deae = $0xd491a6ab 0x5f145430 = <0x5f145430>
	endif
endscript

script pop_in_new_downloads_notifier \{time = 0.5}
endscript

script main_menu_select_generic 
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	generic_event_choose state = <state> data = <data>
endscript

script set_primary_controller \{event = menu_change}
	requireparams \{[
			device_num
		]
		all}
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if ((gotparam force) || ($force_mainmenu_signin = 1))
		change \{primary_controller = -1}
		change \{last_start_pressed_device = -1}
		change \{force_mainmenu_signin = 0}
	endif
	change \{respond_to_signin_changed = 1}
	change \{signin_jam_mode = 0}
	if ($current_num_players = 1)
		if (<device_num> > -1)
			setplayerinfo 1 controller = <device_num>
		endif
	endif
	if gotparam \{jam}
		if ($jam_view_cam_created = 1)
			scriptassert \{'logic error, this value should be zero here'}
		endif
		change \{signin_jam_mode = 1}
		generic_event_choose event = <event> state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = <data> jam = 1 require_live = <require_live>}
	else
		if gotparam \{require_live}
			force = 1
		elseif gotparam \{leaderboards}
			force = 1
		endif
		change primary_controller = <device_num>
		change last_start_pressed_device = <device_num>
		refresh_autokick_cheat
		restore_globals_from_global_tags
		generic_event_choose event = <event> state = <state> data = <data> no_sound = <no_sound>
		return
		get_savegame_from_controller controller = <device_num>
		if NOT is_autosave_on savegame = <savegame>
			change primary_controller = <device_num>
			change last_start_pressed_device = <device_num>
			refresh_autokick_cheat
			restore_globals_from_global_tags
			generic_event_choose event = <event> state = <state> data = <data> no_sound = <no_sound>
			return
		endif
	endif
endscript
force_pak_caching = 0
disable_pak_caching = 0

script frontend_load_soundcheck \{async = 1}
	printscriptinfo \{'frontend_load_soundcheck'}
	if getpakmancurrent \{map = zones}
		printf 'frontend_load_soundcheck : %s is loaded' s = <pak> donotresolve
		if NOT (<pak> = z_soundcheck)
			load_soundcheck = 1
		endif
		if NOT gotparam \{load_soundcheck}
			if NOT istextureloaded \{id = main_menu_skull}
				load_soundcheck = 1
			endif
		endif
	endif
	if NOT frontend_anim_paks_are_loaded
		load_anims = 1
	endif
	if ((gotparam load_soundcheck) || (gotparam load_anims))
		needs_loading_screen = 1
		if pakfilesarecached
			needs_loading_screen = 0
			if NOT frontend_anim_paks_are_loaded
				needs_loading_screen = 1
			endif
		endif
		if gotparam \{loadingscreen}
			if (<needs_loading_screen> = 1)
				create_loading_screen
			else
				hide_glitch \{num_frames = 3}
			endif
		endif
		if NOT isps3 \{testkit}
			if NOT pakfilesarecached
				if ((cd) || ($force_pak_caching = 1))
					if ($disable_pak_caching = 0)
						if cachepakfiles
							block \{untilevent = cache_pak_files_loaded}
						endif
					endif
				endif
			endif
		endif
		if gotparam \{load_soundcheck}
			if pakfilesarecached
				setpakmancurrentblock \{map = zones
					pak = z_soundcheck
					block_scripts = 1}
			else
				setpakmancurrentblock map = zones pak = z_soundcheck block_scripts = (<async> - 1)
			endif
		endif
		if gotparam \{load_anims}
			load_frontend_anim_paks \{async = 1}
		endif
		if NOT gotparam \{gigboard}
			hide_glitch \{num_frames = 30}
		endif
		if gotparam \{loadingscreen}
			if (<needs_loading_screen> = 1)
				destroy_loading_screen
			endif
		endif
	endif
endscript

script reset_character_ids 
	printf \{'reset_character_ids'}
	change \{structurename = player1_status
		character_id = judy}
	change \{structurename = player2_status
		character_id = judy}
	change \{structurename = player3_status
		character_id = judy}
	change \{structurename = player4_status
		character_id = judy}
	change \{structurename = player5_status
		character_id = judy}
	change \{structurename = player6_status
		character_id = judy}
	change \{structurename = player7_status
		character_id = judy}
	change \{structurename = player8_status
		character_id = judy}
endscript
0x48ad7e7f = 0
0xd491a6ab = 0

script 0x3635ad90 
	if (<0xb915deae> >= 0)
		change 0xd491a6ab = <0xb915deae>
	endif
	printf channel = 0x37807f54 qs(0x49da2c48) d = <0xb915deae>
	0x95185f8d
	getarraysize \{$0x9bb9f9d7}
	if gotparam \{0x5f145430}
		if (<0x5f145430> < <array_size>)
			printf channel = 0x37807f54 qs(0xcfdb755a) d = <0x5f145430>
			change 0x48ad7e7f = <0x5f145430>
		else
			printf channel = 0x37807f54 qs(0xd4480ed5) d = <0x5f145430> a = <array_size>
		endif
	endif
endscript
