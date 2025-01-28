0x2a11eea8 = 0
0x835bc19f = 0
0xb27d2ca9 = {
	create = 0x0d9081a0
	destroy = 0x59c98abb
	actions = [
		{
			action = add_friend
			flow_state = 0xae98b7cd
		}
		{
			action = go_back
			flow_state = online_menu_fs
		}
		{
			action = 0x81029e0b
			flow_state = quick_match_joining_game_fs
		}
		{
			action = 0x3c1e25a0
			flow_state = create_match_select_venue_fs
		}
		{
			action = invite_friend
			transition_screen = default_joining_screen
			func = setup_and_post_game
			flow_state = online_character_select_fs
		}
	]
}
0xe6143c16 = [
	setlist_page1_line_solid1
	setlist_page1_line_solid2
	setlist_page1_line_solid3
]
0x8d928868 = [
	setlist_page1_line_dotted1
	setlist_page1_line_dotted2
	setlist_page1_line_dotted3
]
0x3e9de008 = [
	setlist_page1_loop_star1
	setlist_page1_loop_star2
	setlist_page1_loop_star3
]
0x35a58d58 = 0
0x6b48e2a3 = 26
0x1d0ddbee = (340.0, 440.0)
0x3c4c5b75 = (0.0, 0.0)
0x4445ac9a = (0.0, 0.0)
0x346b7a27 = (0.0, 676.0)
0x68f133e5 = 0
0x4640f15d = (160.0, 768.0)
0xb2ec8820 = 0
0x1687a485 = 0
0xd69fede6 = 1
0x6daff016 = 1
friendlist_selection_index = 0
0x1f4e5ddd = 1
0x9a7c6573 = 1
0x50a3ec0a = 0
0x3f37283e = 0
0x6427121d = 0
0xe4fe5d9e = (0.0, 0.0)
0x3ee35506 = (0.0, 0.0)
0x993dc8d5 = (0.0, 80.0)
0x2a7d6f44 = 0
0x885156b6 = (922.0, 512.0)
0xab00bea2 = 4.1
0x47d23a39 = 0

script 0xa6d8454a 
	if ($0x2a11eea8 = 0)
		ui_flow_manager_respond_to_action \{action = go_back}
	else
		ui_flow_manager_respond_to_action \{action = 0x3c1e25a0}
	endif
endscript

script friendlist_add_friend 
	ui_flow_manager_respond_to_action \{action = add_friend}
endscript

script friendlist_friend_options 
	0xee38fd7b
	create_context_friend_menu
endscript

script friendlist_delete_friend 
	friend = $friendlist_selection_index
	printf 'Friend Selection %a ' a = <friend>
	printf 'Deleting Friend with index %c' c = <friend>
	deletefriend index = <friend>
endscript
0x30deb559 = 0
0x58d90782 = 0
0x54119b09 = 0

script 0x257d4dc9 
	getmyfriendnum
	printf 'My Friend Number: %n' n = <myfriendkey>
	getnumfriends
	printf 'Number of Friends: %i' i = <0x9e033fad>
	change 0x30deb559 = <numfriendsonline>
	if ($0x2a11eea8 = 0)
		change 0x58d90782 = <numfriendsoffline>
		change 0x54119b09 = <numfriendspending>
	else
		if (<numfriendsonline> = 0)
			spawn_no_friends_dialog
		endif
		change \{0x58d90782 = 0}
		change \{0x54119b09 = 0}
	endif
endscript
0x12c9227c = 0

script 0x7bea71c1 
	return \{allowed = $0x12c9227c}
endscript

script 0xee38fd7b 
	change \{0x12c9227c = 0}
endscript

script 0x7132524e 
	change \{0x12c9227c = 1}
endscript

script 0x0d9081a0 
	0x7132524e
	menu_music_off \{setflag = 1}
	0x48f4d9fe
	change \{0x47d23a39 = 3.5}
	0x257d4dc9
	createscreenelement \{type = containerelement
		parent = root_window
		id = 0x6fceafe1
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	displaysprite \{parent = 0x6fceafe1
		tex = setlist_page1_loop
		pos = $0x4640f15d
		dims = $0x885156b6
		z = $0x47d23a39}
	<tab> = 0x0e8bbddd
	0x8d6f51e0 <tab>
	if ($0x30deb559 < 1)
		if ($0x58d90782 < 1)
			change \{0x1f4e5ddd = 3}
		else
			change \{0x1f4e5ddd = 2}
		endif
	else
		change \{0x1f4e5ddd = 1}
	endif
	change \{friendlist_selection_index = 0}
	change \{0x9a7c6573 = 1}
	getnumfriends
	if ((<0x9e033fad> = 0) && ($0x835bc19f = 0))
		change \{0x835bc19f = 1}
		create_generic_popup \{ok_menu
			full_blackout = 0.6
			message_scale = 0.746
			message = $wii_invite_info
			ok_eventhandlers = [
				{
					focus
					popup_menu_focus
				}
				{
					unfocus
					popup_menu_unfocus
				}
				{
					pad_choose
					block_refresh_and_destroy
				}
			]}
		wait \{1
			gameframe}
		base_pos = (150.0, 40.0)
		top_pos = (<base_pos> + (19.0, 0.0))
		createscreenelement \{type = containerelement
			parent = generic_popup_container
			id = 0x850b2a1b
			pos = (0.0, 0.0)
			internal_just = [
				center
				center
			]}
		displaysprite parent = 0x850b2a1b tex = 0xd4bfbb6c pos = <base_pos> dims = (128.0, 128.0) z = 150
		displaysprite parent = 0x850b2a1b tex = 0x59c4e6e9 pos = <top_pos> dims = (128.0, 128.0) z = 151
		setscreenelementprops \{id = 0x850b2a1b
			alpha = 0}
		0x8de22eb3
	else
		spawnscript \{0x0d6b931b}
	endif
endscript

script 0x48f4d9fe 
	if ($0x2a11eea8 = 0)
		0x57fa1b69 = [
			{pad_up 0x4634072e params = {dir = up}}
			{pad_down 0x4634072e params = {dir = down}}
			{pad_back 0xa6d8454a}
			{pad_choose friendlist_friend_options}
			{pad_l1 friendlist_add_friend}
		]
	else
		0x57fa1b69 = [
			{pad_up 0x4634072e params = {dir = up}}
			{pad_down 0x4634072e params = {dir = down}}
			{pad_back 0xa6d8454a}
			{pad_choose friendlist_invite_friend}
		]
	endif
	new_menu {
		scrollid = 0xf6bc92ba
		vmenuid = vmenu_friendlist
		use_backdrop = 0
		no_wrap
		z = -1
		event_handlers = <0x57fa1b69>
	}
	set_focus_color \{rgba = [
			200
			120
			0
			250
		]}
	set_unfocus_color \{rgba = [
			50
			30
			10
			255
		]}
endscript

script 0x881c1875 
	destroy_menu \{menu_id = 0xf6bc92ba}
	clean_up_user_control_helpers
endscript

script 0x59c98abb 
	0xee38fd7b
	change \{0x1f4e5ddd = 1}
	change \{friendlist_selection_index = 0}
	change \{0x9a7c6573 = 1}
	destroy_menu \{menu_id = 0xf6bc92ba}
	destroy_menu \{menu_id = 0x7e1239af}
	destroy_menu \{menu_id = 0x6fceafe1}
	0x15c2689e \{del}
	clean_up_user_control_helpers
endscript

script 0x4634072e \{dir = down}
	if ($0x50a3ec0a = 0)
		return
	endif
	if (<dir> = down)
		if ($friendlist_selection_index + 1 = $0x50a3ec0a)
			return
		endif
	else
		if ($friendlist_selection_index - 1 < 0)
			return
		endif
	endif
	formattext \{checksumname = textid
		'id_friend%i'
		i = $friendlist_selection_index
		addtostringlookup = true}
	retail_menu_unfocus id = <textid>
	setscreenelementprops id = <textid> no_shadow
	if (<dir> = down)
		printf \{'Moving down from Tier: %a , Selection Index: %b, Selection Friend %c'
			a = $0x1f4e5ddd
			b = $friendlist_selection_index
			c = $0x9a7c6573}
		jump_tier = 0
		change friendlist_selection_index = ($friendlist_selection_index + 1)
		change 0x9a7c6573 = ($0x9a7c6573 + 1)
		if ($0x1f4e5ddd = 1)
			if ($0x9a7c6573 > $0x30deb559)
				change \{0x9a7c6573 = 1}
				if ($0x58d90782 = 0)
					change 0x1f4e5ddd = ($0x1f4e5ddd + 2)
				else
					change 0x1f4e5ddd = ($0x1f4e5ddd + 1)
				endif
				jump_tier = 1
			endif
		endif
		if ($0x1f4e5ddd = 2)
			if ($0x9a7c6573 > $0x58d90782)
				change \{0x9a7c6573 = 1}
				change 0x1f4e5ddd = ($0x1f4e5ddd + 1)
				jump_tier = 1
			endif
		endif
		jump_tier_amt = (0.0, -240.0)
		if ($friendlist_selection_index = 0)
			song_jump_amt = (0.0, -80.0)
			getscreenelementprops \{id = 0xcfdc53db}
			setscreenelementprops id = 0xcfdc53db pos = (<pos> - (0.0, 80.0))
			getscreenelementprops \{id = 0xc3e4051e}
			setscreenelementprops id = 0xc3e4051e pos = (<pos> - (0.0, 80.0))
			getscreenelementprops \{id = 0x7e05e5d8}
			setscreenelementprops id = 0x7e05e5d8 pos = (<pos> - (0.0, 80.0))
		else
			song_jump_amt = (0.0, -80.0)
		endif
	else
		printf \{'Moving up from Tier: %a , Selection Index: %b, Selection Friend %c'
			a = $0x1f4e5ddd
			b = $friendlist_selection_index
			c = $0x9a7c6573}
		jump_tier = 0
		change friendlist_selection_index = ($friendlist_selection_index - 1)
		change 0x9a7c6573 = ($0x9a7c6573 - 1)
		if ($0x1f4e5ddd = 2)
			if ($0x9a7c6573 = 0)
				change 0x1f4e5ddd = ($0x1f4e5ddd - 1)
				change \{0x9a7c6573 = $0x30deb559}
				jump_tier = 1
			endif
		elseif ($0x1f4e5ddd = 3)
			if ($0x9a7c6573 = 0)
				if ($0x58d90782 = 0)
					change 0x1f4e5ddd = ($0x1f4e5ddd - 2)
					change \{0x9a7c6573 = $0x30deb559}
				else
					change 0x1f4e5ddd = ($0x1f4e5ddd - 1)
					change \{0x9a7c6573 = $0x58d90782}
				endif
				jump_tier = 1
			endif
		endif
		jump_tier_amt = (0.0, 240.0)
		song_jump_amt = (0.0, 80.0)
	endif
	formattext \{checksumname = textid
		'id_friend%i'
		i = $friendlist_selection_index
		addtostringlookup = true}
	retail_menu_focus id = <textid>
	setscreenelementprops id = <textid> shadow
	<not_header> = 1
	if (<jump_tier> = 1)
		change 0x3c4c5b75 = ($0x3c4c5b75 + <jump_tier_amt>)
		setscreenelementprops \{id = 0xf6bc92ba
			pos = $0x3c4c5b75}
		change 0x4445ac9a = ($0x4445ac9a + <jump_tier_amt>)
		<not_header> = 0
	endif
	if (<not_header>)
		change 0x3c4c5b75 = ($0x3c4c5b75 + <song_jump_amt>)
		setscreenelementprops \{id = 0xf6bc92ba
			pos = $0x3c4c5b75}
		change 0x4445ac9a = ($0x4445ac9a + <song_jump_amt>)
	endif
	setscreenelementprops \{id = 0x7e1239af
		pos = $0x4445ac9a}
	setscreenelementprops \{id = 0x6fceafe1
		pos = $0x4445ac9a}
	if ($0x6427121d)
		setscreenelementprops id = 0xc3e4051e rot_angle = (0 - $0x3f37283e)
		change \{0x6427121d = 0}
	else
		getrandomvalue \{name = rot
			a = 10.0
			b = -30.0}
		setscreenelementprops id = 0xc3e4051e rot_angle = <rot>
		change 0x3f37283e = <rot>
		change \{0x6427121d = 1}
	endif
	if (<dir> = down)
		change 0x68f133e5 = ($0x68f133e5 + 1)
		if ($0x68f133e5 = 10)
			change \{0x68f133e5 = 0}
			change 0x346b7a27 = ($0x346b7a27 + (0.0, 1308.0))
			displaysprite \{parent = 0x7e1239af
				tex = setlist_bg_loop
				pos = $0x346b7a27
				dims = (1280.0, 1308.0)
				z = 3.1
				blendmode = diffuse}
			0x140ab9cd = Random (@ 1 @ 2 )
			0xdc2a1e61 = $0x346b7a27
			0x33b6bf13 = (<0xdc2a1e61> + (900.0, 0.0))
			0xe67f49e2 = flip_h
			0x589bc553 = flip_v
			if (<0x140ab9cd> = 1)
				<0xdc2a1e61> = (<0xdc2a1e61> + (1100.0, 0.0))
				<0x33b6bf13> = $0x346b7a27
				<0xe67f49e2> = flip_v
				<0x589bc553> = flip_h
			endif
		endif
		change 0xb2ec8820 = ($0xb2ec8820 + 1)
		if ($0xb2ec8820 = 4)
			change \{0xb2ec8820 = 0}
			change 0x4640f15d = ($0x4640f15d + (0.0, 512.0))
			displaysprite \{parent = 0x6fceafe1
				tex = setlist_page1_loop
				pos = $0x4640f15d
				dims = $0x885156b6
				z = $0x47d23a39}
		endif
		change 0x2a7d6f44 = ($0x2a7d6f44 + 1)
		if ($0x2a7d6f44 = 1)
			change \{0x2a7d6f44 = 0}
			<i> = 1
			if NOT (<not_header>)
				<i> = 3
			endif
			begin
			if ($0x35a58d58 = $0x6b48e2a3)
				change \{0x35a58d58 = 0}
			endif
			<line> = ($0xe6143c16 [0])
			displaysprite parent = 0x7e1239af tex = <line> pos = $0xe4fe5d9e dims = (896.0, 16.0) z = ($0x47d23a39 + 0.1)
			change 0x35a58d58 = ($0x35a58d58 + 1)
			if ($0x35a58d58 = $0x6b48e2a3)
				change \{0x35a58d58 = 0}
			endif
			<line> = ($0x8d928868 [0])
			displaysprite parent = 0x7e1239af tex = <line> pos = $0x3ee35506 dims = (896.0, 16.0) z = ($0x47d23a39 + 0.1)
			change 0x35a58d58 = ($0x35a58d58 + 1)
			change 0xe4fe5d9e = (($0xe4fe5d9e) + ($0x993dc8d5))
			change 0x3ee35506 = (($0x3ee35506) + ($0x993dc8d5))
			repeat <i>
		endif
	else
		change 0x68f133e5 = ($0x68f133e5 - 1)
		change 0xb2ec8820 = ($0xb2ec8820 - 1)
		change 0x2a7d6f44 = ($0x2a7d6f44 - 1)
		change 0x35a58d58 = ($0x35a58d58 + 1)
		if ($0x35a58d58 = $0x6b48e2a3)
			change \{0x35a58d58 = 0}
		endif
	endif
	printf \{'After Move-  Tier: %a , Selection Index: %b, Selection Friend %c'
		a = $0x1f4e5ddd
		b = $friendlist_selection_index
		c = $0x9a7c6573}
	if gotparam \{up}
		generic_menu_up_or_down_sound \{up}
	endif
	if gotparam \{down}
		generic_menu_up_or_down_sound \{down}
	endif
endscript

script 0x15c2689e 
	if gotparam \{del}
		change \{0x3c4c5b75 = (0.0, 0.0)}
		change \{0x4445ac9a = (0.0, 0.0)}
		change \{0x346b7a27 = (0.0, 676.0)}
		change \{0x68f133e5 = 0}
		change \{friendlist_selection_index = 0}
		change \{0x9a7c6573 = 0}
		destroy_menu \{menu_id = 0x1c9e1d64}
		destroy_menu \{menu_id = 0xcfdc53db}
		destroy_menu \{menu_id = 0xc3e4051e}
		destroy_menu \{menu_id = 0x1a476a8f}
		destroy_menu \{menu_id = 0x7e05e5d8}
		destroy_menu \{menu_id = 0x657c2c36}
	endif
	change \{0xb2ec8820 = 0}
	change \{0x4640f15d = (157.0, 768.0)}
	change \{0x2a7d6f44 = 0}
	change \{0x35a58d58 = 0}
	change \{0x3f37283e = 0}
	change \{0x6427121d = 0}
endscript

script refresh_friends_list 
	if ($0x12c9227c = 0)
		return
	endif
	change \{0x1687a485 = $friendlist_selection_index}
	change \{0xd69fede6 = $0x1f4e5ddd}
	change \{0x6daff016 = $0x9a7c6573}
	change \{0x3c4c5b75 = (0.0, 0.0)}
	change \{0x4445ac9a = (0.0, 0.0)}
	change \{0x346b7a27 = (0.0, 676.0)}
	change \{0x68f133e5 = 0}
	change \{friendlist_selection_index = 0}
	change \{0x9a7c6573 = 0}
	destroy_menu \{menu_id = 0x7e1239af}
	destroy_menu \{menu_id = 0x1c9e1d64}
	destroy_menu \{menu_id = 0xcfdc53db}
	destroy_menu \{menu_id = 0xc3e4051e}
	destroy_menu \{menu_id = 0x1a476a8f}
	destroy_menu \{menu_id = 0x7e05e5d8}
	destroy_menu \{menu_id = 0x657c2c36}
	change \{0xb2ec8820 = 0}
	change \{0x4640f15d = (157.0, 768.0)}
	change \{0x2a7d6f44 = 0}
	change \{0x35a58d58 = 0}
	change \{0x3f37283e = 0}
	change \{0x6427121d = 0}
	0x257d4dc9
	if ($0x30deb559 < 1)
		if ($0x58d90782 < 1)
			change \{0x1f4e5ddd = 3}
		else
			change \{0x1f4e5ddd = 2}
		endif
	else
		change \{0x1f4e5ddd = 1}
	endif
	change \{friendlist_selection_index = 0}
	change \{0x9a7c6573 = 1}
	0x8d6f51e0
	change \{disable_menu_sounds = 1}
	begin
	if ($0x1f4e5ddd >= $0xd69fede6)
		if ($0x9a7c6573 >= $0x6daff016)
			break
		endif
	endif
	last_tier = ($0x1f4e5ddd)
	0x2016d144 = ($0x9a7c6573)
	printf \{'Launching Down Event for FriendList'}
	launchevent \{type = pad_down
		target = vmenu_friendlist}
	if (<last_tier> = $0x1f4e5ddd)
		if (<0x2016d144> = $0x9a7c6573)
			break
		endif
	endif
	repeat
	change \{disable_menu_sounds = 0}
endscript

script 0x0d6b931b 
	wait \{5
		gameframes}
	refresh_friends_list
endscript

script 0x8d6f51e0 
	createscreenelement \{type = containerelement
		parent = root_window
		id = 0x7e1239af
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	displaysprite \{id = sl_bg_head
		parent = 0x7e1239af
		tex = setlist_bg_head
		pos = (0.0, 0.0)
		dims = (1280.0, 676.0)
		z = 3.1
		blendmode = diffuse}
	displaysprite \{id = sl_bg_loop
		parent = 0x7e1239af
		tex = setlist_bg_loop
		pos = $0x346b7a27
		dims = (1280.0, 1352.0)
		z = 3.1
		blendmode = diffuse}
	displaysprite \{id = sl_page1_head
		parent = 0x7e1239af
		tex = setlist_page1_head
		pos = (160.0, 0.0)
		dims = (922.0, 768.0)
		z = $0x47d23a39}
	displaysprite parent = 0x7e1239af tex = setlist_page1_line_red pos = (300.0, 12.0) dims = (8.0, 6400.0) z = ($0x47d23a39 + 0.1)
	<title_pos> = (300.0, 380.0)
	displaysprite id = sl_page1_head_lines parent = 0x7e1239af tex = setlist_page1_head_lines pos = (176.0, 64.0) dims = (896.0, 320.0) z = ($0x47d23a39 + 0.1)
	<begin_line> = (176.0, 420.0)
	<solid_line_pos> = (176.0, 340.0)
	<dotted_line_pos> = (176.0, 380.0)
	<dotted_line_add> = ($0x993dc8d5)
	begin
	<line> = ($0xe6143c16 [0])
	<solid_line_pos> = (<solid_line_pos> + $0x993dc8d5)
	displaysprite parent = 0x7e1239af tex = <line> pos = <solid_line_pos> dims = (883.0, 16.0) z = ($0x47d23a39 + 0.1)
	repeat 8
	begin
	<line> = ($0x8d928868 [0])
	<dotted_line_pos> = (<dotted_line_pos> + <dotted_line_add>)
	displaysprite parent = 0x7e1239af tex = <line> pos = <dotted_line_pos> dims = (883.0, 16.0) z = ($0x47d23a39 + 0.1)
	repeat 8
	<solid_line_pos> = (<solid_line_pos> + $0x993dc8d5)
	<dotted_line_pos> = (<dotted_line_pos> + <dotted_line_add>)
	change 0xe4fe5d9e = <solid_line_pos>
	change 0x3ee35506 = <dotted_line_pos>
	change \{0x50a3ec0a = 0}
	if english
		0x4096a057 = 0x73a1fb69
	elseif french
		0x4096a057 = 0x4c8df4e5
	elseif spanish
		0x4096a057 = 0x953673dd
	elseif german
		0x4096a057 = 0xfd6813a0
	elseif italian
		0x4096a057 = 0x22764d1f
	endif
	displaysprite id = sl_page1_title parent = 0x7e1239af tex = <0x4096a057> pos = (380.0, 130.0) dims = (512.0, 256.0) z = ($0x47d23a39 + 0.2) rot_angle = 5
	if ($0x30deb559 > 0)
		displaytext id = sl_text_1 parent = 0x7e1239af scale = (1.3, 1.0) text = $wii_friend_online rgba = [195 80 45 255] pos = <title_pos> z = $0xab00bea2 noshadow
		<text_pos> = (<title_pos> + (40.0, 54.0))
	else
		<text_pos> = (<title_pos> + (40.0, -106.0))
	endif
	num_tiers = 3
	printf \{'About to print %a Online friends, %b Offline friends, and %c Pending friends'
		a = $0x30deb559
		b = $0x58d90782
		c = $0x54119b09}
	<tier> = 0
	friend = 0
	begin
	<tier> = (<tier> + 1)
	printf 'Printing Tier %a' a = <tier>
	if (<tier> = 2)
		if ($0x58d90782 > 0)
			<text_pos> = (<text_pos> + (-40.0, 106.0))
			displaytext parent = 0x7e1239af scale = (1.0, 1.0) text = $wii_friend_offline rgba = [190 75 40 255] pos = <text_pos> z = $0xab00bea2 noshadow
			<text_pos> = (<text_pos> + (40.0, 54.0))
		endif
	endif
	if (<tier> = 3)
		if ($0x54119b09 > 0)
			<text_pos> = (<text_pos> + (-40.0, 106.0))
			displaytext parent = 0x7e1239af scale = (1.0, 1.0) text = $wii_friend_pending rgba = [190 75 40 255] pos = <text_pos> z = $0xab00bea2 noshadow
			<text_pos> = (<text_pos> + (40.0, 54.0))
		endif
	endif
	num_friends = 0
	if (<tier> = 1)
		<num_friends> = $0x30deb559
	elseif (<tier> = 2)
		<num_friends> = $0x58d90782
	else
		<num_friends> = $0x54119b09
	endif
	if (<num_friends> > 0)
		begin
		getfriendinfo index = <friend>
		formattext checksumname = textid 'id_friend%i' i = <friend> addtostringlookup = true
		createscreenelement {
			type = textelement
			id = <textid>
			parent = 0x7e1239af
			scale = (0.75, 0.75)
			text = <nickname>
			pos = <text_pos>
			rgba = [50 30 10 255]
			z_priority = $0xab00bea2
			font = text_a5
			just = [left top]
			no_shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
		}
		<status_pos> = (<text_pos> + (600.0, -7.0))
		if ($0x2a11eea8 = 0)
			if (<haspendinginvite> = 1)
				base_pos = (0.0, 0.0)
				top_pos = (<base_pos> + (11.0, 0.0))
				formattext checksumname = inviteid 'invite_id%a' a = <friend>
				createscreenelement {
					type = containerelement
					id = <inviteid>
					parent = 0x7e1239af
					pos = <status_pos>
				}
				displaysprite parent = <inviteid> tex = 0xd4bfbb6c pos = <base_pos> dims = (80.0, 80.0) z = 101
				displaysprite parent = <inviteid> tex = 0x59c4e6e9 pos = <top_pos> dims = (80.0, 80.0) z = 101.1
				switch <game_mode>
					case 0
					<game_mode_text> = 'Co-op'
					case 1
					<game_mode_text> = 'Battle'
					case 2
					<game_mode_text> = 'Pro Face-Off'
					case 3
					<game_mode_text> = 'Face-Off'
				endswitch
				switch <num_songs>
					case 1
					<num_songs_text> = '1'
					case 3
					<num_songs_text> = '3'
					case 5
					<num_songs_text> = '5'
					case 7
					<num_songs_text> = '7'
				endswitch
				if (<game_mode> = 2)
					switch <diff>
						case 0
						<diff_text> = 'Easy'
						case 1
						<diff_text> = 'Medium'
						case 2
						<diff_text> = 'Hard'
						case 3
						<diff_text> = 'Expert'
					endswitch
					formattext textname = 0xfa9b2a85 '%a - %b - %c' a = <game_mode_text> b = <diff_text> c = <num_songs_text>
				else
					formattext textname = 0xfa9b2a85 '%a - %c' a = <game_mode_text> c = <num_songs_text>
				endif
				<text_pos> = (<text_pos> + (0.0, 40.0))
				displaytext parent = 0x7e1239af scale = (0.75, 0.75) id = <0xb958c304> text = <0xfa9b2a85> rgba = [20 60 100 255] pos = <text_pos> z = $0xab00bea2 noshadow
				<text_pos> = (<text_pos> + (0.0, 40.0))
			else
				<text_pos> = (<text_pos> + (0.0, 80.0))
			endif
		else
			<text_pos> = (<text_pos> + (0.0, 80.0))
		endif
		change 0x50a3ec0a = ($0x50a3ec0a + 1)
		friend = (<friend> + 1)
		repeat <num_friends>
	endif
	repeat <num_tiers>
	change \{0x3c4c5b75 = 0x1d0ddbee}
	if ($0x50a3ec0a > 0)
		retail_menu_focus \{id = 0xef5936cc}
		setscreenelementprops \{id = 0xef5936cc
			shadow}
	endif
	if screenelementexists \{0x657c2c36}
	else
		createscreenelement \{type = containerelement
			parent = root_window
			id = 0x657c2c36
			pos = (0.0, 0.0)
			just = [
				left
				top
			]}
		<clip_pos> = (160.0, 420.0)
		displaysprite id = 0xcfdc53db parent = 0x657c2c36 tex = 0x2349e696 pos = <clip_pos> dims = (154.0, 102.0) z = ($0xab00bea2 + 0.1)
		<clip_pos> = (<clip_pos> - (20.0, -40.0))
		displaysprite id = 0xc3e4051e parent = 0x657c2c36 tex = setlist_clip pos = <clip_pos> dims = (141.0, 102.0) z = ($0xab00bea2 + 0.2)
		hilite_dims = (762.0, 80.0)
		displaysprite id = 0x7e05e5d8 parent = 0x657c2c36 tex = white pos = (300.0, 428.0) dims = <hilite_dims> z = ($0xab00bea2 - 0.1) rgba = [255 255 255 128]
		<bg_helper_pos> = (140.0, 585.0)
		<helper_rgba> = [105 65 7 160]
	endif
	if ($0x2a11eea8 = 0)
		0x48599387 pos = (<bg_helper_pos> + (120.0, 4.0))
	else
		0x7b930455 pos = (<bg_helper_pos> + (120.0, 4.0))
	endif
	displaysprite \{id = 0x1c9e1d64
		rgba = [
			105
			65
			7
			160
		]
		parent = root_window
		tex = setlist_overshadow
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 5.0}
endscript

script 0x48599387 
	if screenelementexists \{0x657c2c36}
	else
		clean_up_user_control_helpers
		text_options = [
			$wii_updown
			$wii_options
			$wii_back
			$wii_add_friend
		]
		button_options = [
			'\\bb'
			'\\b4'
			'\\b5'
			'\\b8'
		]
		i = 0
		begin
		<text1> = (<button_options> [<i>])
		<text2> = (<text_options> [<i>])
		switch <text1>
			case '\\bb'
			<button> = strumbar
			case '\\b4'
			<button> = green
			case '\\b5'
			<button> = red
			case '\\b6'
			<button> = yellow
			case '\\b7'
			<button> = blue
			case '\\b8'
			<button> = orange
		endswitch
		add_user_control_helper text = <text2> button = <button> z = 100
		<i> = (<i> + 1)
		tabs_text = $wii_friend_code2
		0xcacec212 = (260.0, 100.0)
		repeat 4
	endif
	tab_text_pos = (<0xcacec212>)
	displaytext parent = 0x7e1239af scale = 1 text = (<tabs_text>) rgba = [0 0 0 255] pos = <tab_text_pos> z = 50 noshadow
	getmyfriendnum
	<tab_text_pos> = (<tab_text_pos> + (-15.0, 40.0))
	displaytext parent = 0x7e1239af scale = 1 text = <myfriendkey> rgba = [50 50 50 255] pos = <tab_text_pos> z = 50 noshadow
endscript

script 0x1805f8ad \{spacing = 16}
	if screenelementexists \{0x657c2c36}
	else
		text_options = [
			$wii_updown
			$wii_options
			$wii_back
			$wii_add_friend
		]
		button_options = [
			'\\bb'
			'\\b4'
			'\\b5'
			'\\b8'
		]
		i = 0
		begin
		<text> = (<button_options> [<i>])
		displaytext parent = 0x657c2c36 scale = (1.0, 0.8) text = <text> pos = <pos> z = ($0xab00bea2 + 0.3) font = buttonsps2
		getscreenelementdims id = <id>
		<width> = (<width> + <spacing>)
		<pos> = (<pos> + (<width> * (1.0, 0.0)))
		<text> = (<text_options> [<i>])
		displaytext parent = 0x657c2c36 scale = (0.7, 0.9) text = <text> rgba = [230 230 230 255] pos = (<pos> + (0.0, 11.0)) z = ($0xab00bea2 + 0.3) font = text_a1
		getscreenelementdims id = <id>
		<width> = (<width> + <spacing>)
		<pos> = (<pos> + (<width> * (1.0, 0.0)))
		<i> = (<i> + 1)
		repeat 4
		tabs_text = $wii_friend_code2
		0xcacec212 = (260.0, 100.0)
	endif
	tab_text_pos = (<0xcacec212>)
	displaytext parent = 0x7e1239af scale = 1 text = (<tabs_text>) rgba = [0 0 0 255] pos = <tab_text_pos> z = 50 noshadow
	getmyfriendnum
	<tab_text_pos> = (<tab_text_pos> + (-15.0, 40.0))
	displaytext parent = 0x7e1239af scale = 1 text = <myfriendkey> rgba = [50 50 50 255] pos = <tab_text_pos> z = 50 noshadow
endscript

script 0x7b930455 
	if screenelementexists \{0x657c2c36}
	else
		clean_up_user_control_helpers
		text_options = [
			$wii_updown
			$wii_invite
			$wii_back
		]
		button_options = [
			'\\bb'
			'\\b4'
			'\\b5'
		]
		i = 0
		begin
		<text1> = (<button_options> [<i>])
		<text2> = (<text_options> [<i>])
		switch <text1>
			case '\\bb'
			<button> = strumbar
			case '\\b4'
			<button> = green
			case '\\b5'
			<button> = red
			case '\\b6'
			<button> = yellow
			case '\\b7'
			<button> = blue
			case '\\b8'
			<button> = orange
		endswitch
		add_user_control_helper text = <text2> button = <button> z = 100
		<i> = (<i> + 1)
		repeat 3
	endif
endscript

script 0x60c2282b \{spacing = 16}
	if screenelementexists \{0x657c2c36}
	else
		text_options = [
			$wii_updown
			$wii_invite
			$wii_back
		]
		button_options = [
			'\\bb'
			'\\b4'
			'\\b5'
		]
		i = 0
		begin
		<text> = (<button_options> [<i>])
		displaytext parent = 0x657c2c36 scale = (1.0, 0.8) text = <text> pos = <pos> z = ($0xab00bea2 + 0.3) font = buttonsps2
		getscreenelementdims id = <id>
		<width> = (<width> + <spacing>)
		<pos> = (<pos> + (<width> * (1.0, 0.0)))
		<text> = (<text_options> [<i>])
		displaytext parent = 0x657c2c36 scale = (0.7, 0.9) text = <text> rgba = [230 230 230 255] pos = (<pos> + (0.0, 11.0)) z = ($0xab00bea2 + 0.3) font = text_a1
		getscreenelementdims id = <id>
		<width> = (<width> + <spacing>)
		<pos> = (<pos> + (<width> * (1.0, 0.0)))
		<i> = (<i> + 1)
		repeat 3
	endif
endscript

script create_context_friend_menu 
	getnumfriends
	totalfriends = (<numfriendsonline> + <numfriendsoffline> + <numfriendspending>)
	if (<totalfriends> = 0)
		return
	endif
	friend = $friendlist_selection_index
	getfriendinfo index = <friend>
	formattext textname = text $wii_options_for a = <nickname>
	if (<haspendinginvite> = 1)
		create_generic_popup {
			title = $wii_options
			option_menu = 4
			focus_option = 4
			message = <text>
			option1 = {
				title = $wii_accept_invite
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose accept_invite}
				]
			}
			option2 = {
				title = $wii_reject_invite
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose choose_reject_phrase}
				]
			}
			option3 = {
				title = $wii_delete_friend
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose confirm_delete_friend params = {name = <nickname>}}
				]
			}
			option4 = {
				title = $wii_cancel
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose block_refresh_and_destroy}
				]
			}
			previous_menu = vmenu_friendlist
		}
	else
		create_generic_popup {
			title = $wii_options
			option_menu = 2
			focus_option = 2
			message = <text>
			option1 = {
				title = $wii_delete_friend
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose confirm_delete_friend params = {name = <nickname>}}
				]
			}
			option2 = {
				title = $wii_cancel
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose block_refresh_and_destroy}
				]
			}
			previous_menu = vmenu_friendlist
		}
	endif
endscript

script choose_reject_phrase 
	destroy_generic_popup
	wait \{1
		gameframe}
	create_generic_popup \{title = $wii_reason
		phrase_window
		font_scale = 0.75
		phrase_array = reject_phrases_short
		phrase_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				send_reject_phrase
				params = {
					phrase_array = reject_phrases_short
				}
			}
			{
				pad_back
				back_out_of_rejection
			}
		]
		previous_menu = vmenu_friendlist}
endscript

script back_out_of_rejection 
	destroy_generic_popup
	create_context_friend_menu
endscript

script send_reject_phrase 
	friend = $friendlist_selection_index
	printf 'Friend Selection %a' a = <friend>
	phrase = ($phrase_index)
	phrase_text = ($<phrase_array> [<phrase>])
	printf 'Sending phrase:\\n %a \\nto Friend at index %b' a = <phrase_text> b = <friend>
	sendrejectphrase index = <friend> phrase = <phrase>
	formattext \{checksumname = inviteid
		'invite_id%a'
		a = $friendlist_selection_index}
	if screenelementexists id = <inviteid>
		destroyscreenelement id = <inviteid>
	endif
	block_refresh_and_destroy
endscript

script confirm_delete_friend 
	destroy_generic_popup
	wait \{1
		gameframe}
	formattext textname = text $wii_delete_confirm a = <name>
	create_generic_popup {
		title = $wii_delete
		yes_no_menu
		focus_no
		message = <text>
		yes_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose context_menu_choose_delete_friend params = {name = <name>}}
		]
		no_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose block_refresh_and_destroy}
		]
		previous_menu = vmenu_friendlist
	}
endscript

script context_menu_choose_delete_friend 
	destroy_generic_popup
	wait \{1
		gameframe}
	friendlist_delete_friend
	enable_network_wait_variable
	create_generic_popup \{loading_window
		message = $wii_deleting_friend
		wait_variable = network_wait_var
		previous_menu = vmenu_friendlist}
	formattext textname = text $wii_deleted_friend a = <name>
	wait \{1
		gameframe}
	create_generic_popup {
		title = $wii_done
		ok_menu
		message = <text>
		ok_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose block_refresh_and_destroy}
		]
		previous_menu = vmenu_friendlist
	}
endscript

script friendlist_invite_friend 
	destroy_generic_popup
	friend = $friendlist_selection_index
	getfriendinfo index = <friend>
	formattext textname = text $wii_invite_confirm a = <nickname>
	create_generic_popup {
		title = $wii_invite_title
		yes_no_menu
		message = <text>
		yes_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose friendlist_confirm_invite_friend params = {index = <resolvedindex>}}
		]
		no_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose block_refresh_and_destroy}
		]
		previous_menu = vmenu_friendlist
	}
endscript

script friendlist_confirm_invite_friend 
	destroy_generic_popup
	wait \{5
		gameframe}
	change invite_index = <index>
	if ($0x5061d9ed = 1)
		change \{0x5061d9ed = 0}
		skiprenderframes \{10}
	endif
	ui_flow_manager_respond_to_action \{action = invite_friend}
endscript

script refresh_and_destroy 
	if screenelementexists \{id = 0x850b2a1b}
		killspawnedscript \{name = 0x8de22eb3}
	endif
	destroy_generic_popup
	wait \{1
		gameframe}
	0x7132524e
	refresh_friends_list
endscript

script 0x8de22eb3 
	begin
	if NOT screenelementexists \{id = 0x850b2a1b}
		return
	endif
	doscreenelementmorph \{id = 0x850b2a1b
		alpha = 1.0
		time = 0.5}
	wait \{0.5
		seconds}
	doscreenelementmorph \{id = 0x850b2a1b
		alpha = 0.0
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script get_localized_loading_text 
	return 0x6b8904f0 = ($wii_loading_header)
endscript

script spawn_no_friends_dialog 
	destroy_generic_popup
	create_generic_popup \{title = $wii_error
		ok_menu
		message = $wii_no_friends_online
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				destroy_and_go_back
			}
		]
		previous_menu = vmenu_character_select_p1}
endscript

script destroy_and_go_back 
	destroy_generic_popup
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script block_refresh_and_destroy 
	setbuttoneventmappings \{block_menu_input}
	refresh_and_destroy
	wait \{0.5
		seconds}
	setbuttoneventmappings \{unblock_menu_input}
endscript
