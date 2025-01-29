0x2a11eea8 = 0
0x835bc19f = 0
0xb27d2ca9 = {
	create = 0x0d9081a0
	Destroy = 0x59c98abb
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
	Setlist_Page1_Line_Solid1
	Setlist_Page1_Line_Solid2
	Setlist_Page1_Line_Solid3
]
0x8d928868 = [
	Setlist_Page1_Line_Dotted1
	Setlist_Page1_Line_Dotted2
	Setlist_Page1_Line_Dotted3
]
0x3e9de008 = [
	Setlist_Page1_Loop_Star1
	Setlist_Page1_Loop_Star2
	Setlist_Page1_Loop_Star3
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


	deletefriend index = <friend>
endscript
0x30deb559 = 0
0x58d90782 = 0
0x54119b09 = 0

script 0x257d4dc9 
	getmyfriendnum

	getnumfriends

	Change 0x30deb559 = <numfriendsonline>
	if ($0x2a11eea8 = 0)
		Change 0x58d90782 = <numfriendsoffline>
		Change 0x54119b09 = <numfriendspending>
	else
		if (<numfriendsonline> = 0)
			spawn_no_friends_dialog
		endif
		Change \{0x58d90782 = 0}
		Change \{0x54119b09 = 0}
	endif
endscript
0x12c9227c = 0

script 0x7bea71c1 
	return \{allowed = $0x12c9227c}
endscript

script 0xee38fd7b 
	Change \{0x12c9227c = 0}
endscript

script 0x7132524e 
	Change \{0x12c9227c = 1}
endscript

script 0x0d9081a0 
	0x7132524e
	menu_music_off \{setflag = 1}
	0x48f4d9fe
	Change \{0x47d23a39 = 3.5}
	0x257d4dc9
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = 0x6fceafe1
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	displaySprite \{parent = 0x6fceafe1
		tex = Setlist_Page1_Loop
		Pos = $0x4640f15d
		dims = $0x885156b6
		z = $0x47d23a39}
	<tab> = 0x0e8bbddd
	0x8d6f51e0 <tab>
	if ($0x30deb559 < 1)
		if ($0x58d90782 < 1)
			Change \{0x1f4e5ddd = 3}
		else
			Change \{0x1f4e5ddd = 2}
		endif
	else
		Change \{0x1f4e5ddd = 1}
	endif
	Change \{friendlist_selection_index = 0}
	Change \{0x9a7c6573 = 1}
	getnumfriends
	if ((<0x9e033fad> = 0) && ($0x835bc19f = 0))
		Change \{0x835bc19f = 1}
		if Spanish
			create_generic_popup \{ok_menu
				default_blackout
				long_text
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
		else
			create_generic_popup \{ok_menu
				default_blackout
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
		endif
		Wait \{1
			gameframe}
		base_pos = (150.0, 40.0)
		top_pos = (<base_pos> + (19.0, 0.0))
		if ScreenElementExists \{id = generic_popup_container}
			CreateScreenElement \{Type = ContainerElement
				parent = generic_popup_container
				id = 0x850b2a1b
				Pos = (0.0, 0.0)
				internal_just = [
					center
					center
				]}
			displaySprite parent = 0x850b2a1b tex = 0xd4bfbb6c Pos = <base_pos> dims = (128.0, 128.0) z = 150
			displaySprite parent = 0x850b2a1b tex = 0x59c4e6e9 Pos = <top_pos> dims = (128.0, 128.0) z = 151
			SetScreenElementProps \{id = 0x850b2a1b
				alpha = 0}
			0x8de22eb3
		endif
	else
		spawnscript \{0x0d6b931b}
	endif
endscript

script 0x48f4d9fe 
	if ($0x2a11eea8 = 0)
		0x57fa1b69 = [
			{pad_up 0x4634072e params = {Dir = up}}
			{pad_down 0x4634072e params = {Dir = down}}
			{pad_back 0xa6d8454a}
			{pad_choose friendlist_friend_options}
			{pad_L1 friendlist_add_friend}
		]
	else
		0x57fa1b69 = [
			{pad_up 0x4634072e params = {Dir = up}}
			{pad_down 0x4634072e params = {Dir = down}}
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
	Change \{0x1f4e5ddd = 1}
	Change \{friendlist_selection_index = 0}
	Change \{0x9a7c6573 = 1}
	destroy_menu \{menu_id = 0xf6bc92ba}
	destroy_menu \{menu_id = 0x7e1239af}
	destroy_menu \{menu_id = 0x6fceafe1}
	0x15c2689e \{del}
	clean_up_user_control_helpers
endscript

script 0x4634072e \{Dir = down}
	if ($0x50a3ec0a = 0)
		return
	endif
	if (<Dir> = down)
		if ($friendlist_selection_index + 1 = $0x50a3ec0a)
			return
		endif
	else
		if ($friendlist_selection_index - 1 < 0)
			return
		endif
	endif
	formatText \{checksumName = textid
		'id_friend%i'
		i = $friendlist_selection_index
		AddToStringLookup = true}
	retail_menu_unfocus id = <textid>
	SetScreenElementProps id = <textid> no_shadow
	if (<Dir> = down)

		jump_tier = 0
		Change friendlist_selection_index = ($friendlist_selection_index + 1)
		Change 0x9a7c6573 = ($0x9a7c6573 + 1)
		if ($0x1f4e5ddd = 1)
			if ($0x9a7c6573 > $0x30deb559)
				Change \{0x9a7c6573 = 1}
				if ($0x58d90782 = 0)
					Change 0x1f4e5ddd = ($0x1f4e5ddd + 2)
				else
					Change 0x1f4e5ddd = ($0x1f4e5ddd + 1)
				endif
				jump_tier = 1
			endif
		endif
		if ($0x1f4e5ddd = 2)
			if ($0x9a7c6573 > $0x58d90782)
				Change \{0x9a7c6573 = 1}
				Change 0x1f4e5ddd = ($0x1f4e5ddd + 1)
				jump_tier = 1
			endif
		endif
		jump_tier_amt = (0.0, -240.0)
		if ($friendlist_selection_index = 0)
			song_jump_amt = (0.0, -80.0)
			GetScreenElementProps \{id = 0xcfdc53db}
			SetScreenElementProps id = 0xcfdc53db Pos = (<Pos> - (0.0, 80.0))
			GetScreenElementProps \{id = 0xc3e4051e}
			SetScreenElementProps id = 0xc3e4051e Pos = (<Pos> - (0.0, 80.0))
			GetScreenElementProps \{id = 0x7e05e5d8}
			SetScreenElementProps id = 0x7e05e5d8 Pos = (<Pos> - (0.0, 80.0))
		else
			song_jump_amt = (0.0, -80.0)
		endif
	else

		jump_tier = 0
		Change friendlist_selection_index = ($friendlist_selection_index - 1)
		Change 0x9a7c6573 = ($0x9a7c6573 - 1)
		if ($0x1f4e5ddd = 2)
			if ($0x9a7c6573 = 0)
				Change 0x1f4e5ddd = ($0x1f4e5ddd - 1)
				Change \{0x9a7c6573 = $0x30deb559}
				jump_tier = 1
			endif
		elseif ($0x1f4e5ddd = 3)
			if ($0x9a7c6573 = 0)
				if ($0x58d90782 = 0)
					Change 0x1f4e5ddd = ($0x1f4e5ddd - 2)
					Change \{0x9a7c6573 = $0x30deb559}
				else
					Change 0x1f4e5ddd = ($0x1f4e5ddd - 1)
					Change \{0x9a7c6573 = $0x58d90782}
				endif
				jump_tier = 1
			endif
		endif
		jump_tier_amt = (0.0, 240.0)
		song_jump_amt = (0.0, 80.0)
	endif
	formatText \{checksumName = textid
		'id_friend%i'
		i = $friendlist_selection_index
		AddToStringLookup = true}
	retail_menu_focus id = <textid>
	SetScreenElementProps id = <textid> Shadow
	<not_header> = 1
	if (<jump_tier> = 1)
		Change 0x3c4c5b75 = ($0x3c4c5b75 + <jump_tier_amt>)
		SetScreenElementProps \{id = 0xf6bc92ba
			Pos = $0x3c4c5b75}
		Change 0x4445ac9a = ($0x4445ac9a + <jump_tier_amt>)
		<not_header> = 0
	endif
	if (<not_header>)
		Change 0x3c4c5b75 = ($0x3c4c5b75 + <song_jump_amt>)
		SetScreenElementProps \{id = 0xf6bc92ba
			Pos = $0x3c4c5b75}
		Change 0x4445ac9a = ($0x4445ac9a + <song_jump_amt>)
	endif
	SetScreenElementProps \{id = 0x7e1239af
		Pos = $0x4445ac9a}
	SetScreenElementProps \{id = 0x6fceafe1
		Pos = $0x4445ac9a}
	if ($0x6427121d)
		SetScreenElementProps id = 0xc3e4051e rot_angle = (0 - $0x3f37283e)
		Change \{0x6427121d = 0}
	else
		GetRandomValue \{Name = rot
			a = 10.0
			b = -30.0}
		SetScreenElementProps id = 0xc3e4051e rot_angle = <rot>
		Change 0x3f37283e = <rot>
		Change \{0x6427121d = 1}
	endif
	if (<Dir> = down)
		Change 0x68f133e5 = ($0x68f133e5 + 1)
		if ($0x68f133e5 = 10)
			Change \{0x68f133e5 = 0}
			Change 0x346b7a27 = ($0x346b7a27 + (0.0, 1308.0))
			displaySprite \{parent = 0x7e1239af
				tex = Setlist_BG_Loop
				Pos = $0x346b7a27
				dims = (1280.0, 1308.0)
				z = 3.1
				BlendMode = diffuse}
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
		Change 0xb2ec8820 = ($0xb2ec8820 + 1)
		if ($0xb2ec8820 = 4)
			Change \{0xb2ec8820 = 0}
			Change 0x4640f15d = ($0x4640f15d + (0.0, 512.0))
			displaySprite \{parent = 0x6fceafe1
				tex = Setlist_Page1_Loop
				Pos = $0x4640f15d
				dims = $0x885156b6
				z = $0x47d23a39}
		endif
		Change 0x2a7d6f44 = ($0x2a7d6f44 + 1)
		if ($0x2a7d6f44 = 1)
			Change \{0x2a7d6f44 = 0}
			<i> = 1
			if NOT (<not_header>)
				<i> = 3
			endif
			begin
			if ($0x35a58d58 = $0x6b48e2a3)
				Change \{0x35a58d58 = 0}
			endif
			<line> = ($0xe6143c16 [0])
			displaySprite parent = 0x7e1239af tex = <line> Pos = $0xe4fe5d9e dims = (896.0, 16.0) z = ($0x47d23a39 + 0.1)
			Change 0x35a58d58 = ($0x35a58d58 + 1)
			if ($0x35a58d58 = $0x6b48e2a3)
				Change \{0x35a58d58 = 0}
			endif
			<line> = ($0x8d928868 [0])
			displaySprite parent = 0x7e1239af tex = <line> Pos = $0x3ee35506 dims = (896.0, 16.0) z = ($0x47d23a39 + 0.1)
			Change 0x35a58d58 = ($0x35a58d58 + 1)
			Change 0xe4fe5d9e = (($0xe4fe5d9e) + ($0x993dc8d5))
			Change 0x3ee35506 = (($0x3ee35506) + ($0x993dc8d5))
			repeat <i>
		endif
	else
		Change 0x68f133e5 = ($0x68f133e5 - 1)
		Change 0xb2ec8820 = ($0xb2ec8820 - 1)
		Change 0x2a7d6f44 = ($0x2a7d6f44 - 1)
		Change 0x35a58d58 = ($0x35a58d58 + 1)
		if ($0x35a58d58 = $0x6b48e2a3)
			Change \{0x35a58d58 = 0}
		endif
	endif

	if GotParam \{up}
		generic_menu_up_or_down_sound \{up}
	endif
	if GotParam \{down}
		generic_menu_up_or_down_sound \{down}
	endif
endscript

script 0x15c2689e 
	if GotParam \{del}
		Change \{0x3c4c5b75 = (0.0, 0.0)}
		Change \{0x4445ac9a = (0.0, 0.0)}
		Change \{0x346b7a27 = (0.0, 676.0)}
		Change \{0x68f133e5 = 0}
		Change \{friendlist_selection_index = 0}
		Change \{0x9a7c6573 = 0}
		destroy_menu \{menu_id = 0x1c9e1d64}
		destroy_menu \{menu_id = 0xcfdc53db}
		destroy_menu \{menu_id = 0xc3e4051e}
		destroy_menu \{menu_id = 0x1a476a8f}
		destroy_menu \{menu_id = 0x7e05e5d8}
		destroy_menu \{menu_id = 0x657c2c36}
	endif
	Change \{0xb2ec8820 = 0}
	Change \{0x4640f15d = (157.0, 768.0)}
	Change \{0x2a7d6f44 = 0}
	Change \{0x35a58d58 = 0}
	Change \{0x3f37283e = 0}
	Change \{0x6427121d = 0}
endscript

script refresh_friends_list 
	if ($0x12c9227c = 0)
		return
	endif
	Change \{0x1687a485 = $friendlist_selection_index}
	Change \{0xd69fede6 = $0x1f4e5ddd}
	Change \{0x6daff016 = $0x9a7c6573}
	Change \{0x3c4c5b75 = (0.0, 0.0)}
	Change \{0x4445ac9a = (0.0, 0.0)}
	Change \{0x346b7a27 = (0.0, 676.0)}
	Change \{0x68f133e5 = 0}
	Change \{friendlist_selection_index = 0}
	Change \{0x9a7c6573 = 0}
	destroy_menu \{menu_id = 0x7e1239af}
	destroy_menu \{menu_id = 0x1c9e1d64}
	destroy_menu \{menu_id = 0xcfdc53db}
	destroy_menu \{menu_id = 0xc3e4051e}
	destroy_menu \{menu_id = 0x1a476a8f}
	destroy_menu \{menu_id = 0x7e05e5d8}
	destroy_menu \{menu_id = 0x657c2c36}
	Change \{0xb2ec8820 = 0}
	Change \{0x4640f15d = (157.0, 768.0)}
	Change \{0x2a7d6f44 = 0}
	Change \{0x35a58d58 = 0}
	Change \{0x3f37283e = 0}
	Change \{0x6427121d = 0}
	0x257d4dc9
	if ($0x30deb559 < 1)
		if ($0x58d90782 < 1)
			Change \{0x1f4e5ddd = 3}
		else
			Change \{0x1f4e5ddd = 2}
		endif
	else
		Change \{0x1f4e5ddd = 1}
	endif
	Change \{friendlist_selection_index = 0}
	Change \{0x9a7c6573 = 1}
	0x8d6f51e0
	Change \{disable_menu_sounds = 1}
	begin
	if ($0x1f4e5ddd >= $0xd69fede6)
		if ($0x9a7c6573 >= $0x6daff016)
			break
		endif
	endif
	last_tier = ($0x1f4e5ddd)
	0x2016d144 = ($0x9a7c6573)

	LaunchEvent \{Type = pad_down
		target = vmenu_friendlist}
	if (<last_tier> = $0x1f4e5ddd)
		if (<0x2016d144> = $0x9a7c6573)
			break
		endif
	endif
	repeat
	Change \{disable_menu_sounds = 0}
endscript

script 0x0d6b931b 
	Wait \{5
		gameframes}
	refresh_friends_list
endscript

script 0x8d6f51e0 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = 0x7e1239af
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	displaySprite \{id = sl_bg_head
		parent = 0x7e1239af
		tex = Setlist_BG_Head
		Pos = (0.0, 0.0)
		dims = (1280.0, 676.0)
		z = 3.1
		BlendMode = diffuse}
	displaySprite \{id = sl_bg_loop
		parent = 0x7e1239af
		tex = Setlist_BG_Loop
		Pos = $0x346b7a27
		dims = (1280.0, 1352.0)
		z = 3.1
		BlendMode = diffuse}
	displaySprite \{id = sl_page1_head
		parent = 0x7e1239af
		tex = Setlist_Page1_Head
		Pos = (160.0, 0.0)
		dims = (922.0, 768.0)
		z = $0x47d23a39}
	displaySprite parent = 0x7e1239af tex = Setlist_Page1_Line_Red Pos = (300.0, 12.0) dims = (8.0, 6400.0) z = ($0x47d23a39 + 0.1)
	<title_pos> = (300.0, 380.0)
	displaySprite id = sl_page1_head_lines parent = 0x7e1239af tex = Setlist_Page1_Head_Lines Pos = (176.0, 64.0) dims = (896.0, 320.0) z = ($0x47d23a39 + 0.1)
	<begin_line> = (176.0, 420.0)
	<solid_line_pos> = (176.0, 340.0)
	<dotted_line_pos> = (176.0, 380.0)
	<dotted_line_add> = ($0x993dc8d5)
	begin
	<line> = ($0xe6143c16 [0])
	<solid_line_pos> = (<solid_line_pos> + $0x993dc8d5)
	displaySprite parent = 0x7e1239af tex = <line> Pos = <solid_line_pos> dims = (883.0, 16.0) z = ($0x47d23a39 + 0.1)
	repeat 8
	begin
	<line> = ($0x8d928868 [0])
	<dotted_line_pos> = (<dotted_line_pos> + <dotted_line_add>)
	displaySprite parent = 0x7e1239af tex = <line> Pos = <dotted_line_pos> dims = (883.0, 16.0) z = ($0x47d23a39 + 0.1)
	repeat 8
	<solid_line_pos> = (<solid_line_pos> + $0x993dc8d5)
	<dotted_line_pos> = (<dotted_line_pos> + <dotted_line_add>)
	Change 0xe4fe5d9e = <solid_line_pos>
	Change 0x3ee35506 = <dotted_line_pos>
	Change \{0x50a3ec0a = 0}
	if English
		0x4096a057 = 0x73a1fb69
	elseif French
		0x4096a057 = 0x4c8df4e5
	elseif Spanish
		0x4096a057 = 0x953673dd
	elseif German
		0x4096a057 = 0xfd6813a0
	elseif Italian
		0x4096a057 = 0x22764d1f
	endif
	displaySprite id = sl_page1_title parent = 0x7e1239af tex = <0x4096a057> Pos = (380.0, 130.0) dims = (512.0, 256.0) z = ($0x47d23a39 + 0.2) rot_angle = 5
	if ($0x30deb559 > 0)
		displayText id = sl_text_1 parent = 0x7e1239af Scale = (1.3, 1.0) text = $wii_friend_online rgba = [195 80 45 255] Pos = <title_pos> z = $0xab00bea2 noshadow
		<text_pos> = (<title_pos> + (40.0, 54.0))
	else
		<text_pos> = (<title_pos> + (40.0, -106.0))
	endif
	num_tiers = 3

	<Tier> = 0
	friend = 0
	begin
	<Tier> = (<Tier> + 1)

	if (<Tier> = 2)
		if ($0x58d90782 > 0)
			<text_pos> = (<text_pos> + (-40.0, 106.0))
			displayText parent = 0x7e1239af Scale = (1.0, 1.0) text = $wii_friend_offline rgba = [190 75 40 255] Pos = <text_pos> z = $0xab00bea2 noshadow
			<text_pos> = (<text_pos> + (40.0, 54.0))
		endif
	endif
	if (<Tier> = 3)
		if ($0x54119b09 > 0)
			<text_pos> = (<text_pos> + (-40.0, 106.0))
			displayText parent = 0x7e1239af Scale = (1.0, 1.0) text = $wii_friend_pending rgba = [190 75 40 255] Pos = <text_pos> z = $0xab00bea2 noshadow
			<text_pos> = (<text_pos> + (40.0, 54.0))
		endif
	endif
	num_friends = 0
	if (<Tier> = 1)
		<num_friends> = $0x30deb559
	elseif (<Tier> = 2)
		<num_friends> = $0x58d90782
	else
		<num_friends> = $0x54119b09
	endif
	if (<num_friends> > 0)
		begin
		getfriendinfo index = <friend>
		formatText checksumName = textid 'id_friend%i' i = <friend> AddToStringLookup = true
		CreateScreenElement {
			Type = TextElement
			id = <textid>
			parent = 0x7e1239af
			Scale = (0.75, 0.75)
			text = <nickname>
			Pos = <text_pos>
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
				formatText checksumName = inviteid 'invite_id%a' a = <friend>
				CreateScreenElement {
					Type = ContainerElement
					id = <inviteid>
					parent = 0x7e1239af
					Pos = <status_pos>
				}
				displaySprite parent = <inviteid> tex = 0xd4bfbb6c Pos = <base_pos> dims = (80.0, 80.0) z = 101
				displaySprite parent = <inviteid> tex = 0x59c4e6e9 Pos = <top_pos> dims = (80.0, 80.0) z = 101.1
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
				formatText TextName = 0xfa9b2a85 '%a - %c' a = <game_mode_text> c = <num_songs_text>
				<text_pos> = (<text_pos> + (0.0, 40.0))
				displayText parent = 0x7e1239af Scale = (0.75, 0.75) id = <0xb958c304> text = <0xfa9b2a85> rgba = [20 60 100 255] Pos = <text_pos> z = $0xab00bea2 noshadow
				<text_pos> = (<text_pos> + (0.0, 40.0))
			else
				<text_pos> = (<text_pos> + (0.0, 80.0))
			endif
		else
			<text_pos> = (<text_pos> + (0.0, 80.0))
		endif
		Change 0x50a3ec0a = ($0x50a3ec0a + 1)
		friend = (<friend> + 1)
		repeat <num_friends>
	endif
	repeat <num_tiers>
	Change \{0x3c4c5b75 = 0x1d0ddbee}
	if ($0x50a3ec0a > 0)
		retail_menu_focus \{id = 0xef5936cc}
		SetScreenElementProps \{id = 0xef5936cc
			Shadow}
	endif
	if ScreenElementExists \{0x657c2c36}
	else
		CreateScreenElement \{Type = ContainerElement
			parent = root_window
			id = 0x657c2c36
			Pos = (0.0, 0.0)
			just = [
				left
				top
			]}
		<clip_pos> = (160.0, 420.0)
		displaySprite id = 0xcfdc53db parent = 0x657c2c36 tex = 0x2349e696 Pos = <clip_pos> dims = (154.0, 102.0) z = ($0xab00bea2 + 0.1)
		<clip_pos> = (<clip_pos> - (20.0, -40.0))
		displaySprite id = 0xc3e4051e parent = 0x657c2c36 tex = Setlist_Clip Pos = <clip_pos> dims = (141.0, 102.0) z = ($0xab00bea2 + 0.2)
		hilite_dims = (762.0, 80.0)
		displaySprite id = 0x7e05e5d8 parent = 0x657c2c36 tex = white Pos = (300.0, 428.0) dims = <hilite_dims> z = ($0xab00bea2 - 0.1) rgba = [255 255 255 128]
		<bg_helper_pos> = (140.0, 585.0)
		<helper_rgba> = [105 65 7 160]
	endif
	if ($0x2a11eea8 = 0)
		0x48599387 Pos = (<bg_helper_pos> + (120.0, 4.0))
	else
		0x7b930455 Pos = (<bg_helper_pos> + (120.0, 4.0))
	endif
	displaySprite \{id = 0x1c9e1d64
		rgba = [
			105
			65
			7
			160
		]
		parent = root_window
		tex = Setlist_Overshadow
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 5.0}
endscript

script 0x48599387 
	if ScreenElementExists \{0x657c2c36}
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
	displayText parent = 0x7e1239af Scale = 1 text = (<tabs_text>) rgba = [0 0 0 255] Pos = <tab_text_pos> z = 50 noshadow
	getmyfriendnum
	<tab_text_pos> = (<tab_text_pos> + (-15.0, 40.0))
	displayText parent = 0x7e1239af Scale = 1 text = <myfriendkey> rgba = [50 50 50 255] Pos = <tab_text_pos> z = 50 noshadow
endscript

script 0x1805f8ad \{spacing = 16}
	if ScreenElementExists \{0x657c2c36}
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
		displayText parent = 0x657c2c36 Scale = (1.0, 0.8) text = <text> Pos = <Pos> z = ($0xab00bea2 + 0.3) font = buttonsps2
		GetScreenElementDims id = <id>
		<width> = (<width> + <spacing>)
		<Pos> = (<Pos> + (<width> * (1.0, 0.0)))
		<text> = (<text_options> [<i>])
		displayText parent = 0x657c2c36 Scale = (0.7, 0.9) text = <text> rgba = [230 230 230 255] Pos = (<Pos> + (0.0, 11.0)) z = ($0xab00bea2 + 0.3) font = text_a1
		GetScreenElementDims id = <id>
		<width> = (<width> + <spacing>)
		<Pos> = (<Pos> + (<width> * (1.0, 0.0)))
		<i> = (<i> + 1)
		repeat 4
		tabs_text = $wii_friend_code2
		0xcacec212 = (260.0, 100.0)
	endif
	tab_text_pos = (<0xcacec212>)
	displayText parent = 0x7e1239af Scale = 1 text = (<tabs_text>) rgba = [0 0 0 255] Pos = <tab_text_pos> z = 50 noshadow
	getmyfriendnum
	<tab_text_pos> = (<tab_text_pos> + (-15.0, 40.0))
	displayText parent = 0x7e1239af Scale = 1 text = <myfriendkey> rgba = [50 50 50 255] Pos = <tab_text_pos> z = 50 noshadow
endscript

script 0x7b930455 
	if ScreenElementExists \{0x657c2c36}
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
	if ScreenElementExists \{0x657c2c36}
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
		displayText parent = 0x657c2c36 Scale = (1.0, 0.8) text = <text> Pos = <Pos> z = ($0xab00bea2 + 0.3) font = buttonsps2
		GetScreenElementDims id = <id>
		<width> = (<width> + <spacing>)
		<Pos> = (<Pos> + (<width> * (1.0, 0.0)))
		<text> = (<text_options> [<i>])
		displayText parent = 0x657c2c36 Scale = (0.7, 0.9) text = <text> rgba = [230 230 230 255] Pos = (<Pos> + (0.0, 11.0)) z = ($0xab00bea2 + 0.3) font = text_a1
		GetScreenElementDims id = <id>
		<width> = (<width> + <spacing>)
		<Pos> = (<Pos> + (<width> * (1.0, 0.0)))
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
	formatText TextName = text $wii_options_for a = <nickname>
	clean_up_user_control_helpers
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
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
					{pad_back block_refresh_and_destroy}
				]
			}
			option2 = {
				title = $wii_reject_invite
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose choose_reject_phrase}
					{pad_back block_refresh_and_destroy}
				]
			}
			option3 = {
				title = $wii_delete_friend
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose confirm_delete_friend params = {Name = <nickname>}}
					{pad_back block_refresh_and_destroy}
				]
			}
			option4 = {
				title = $wii_cancel
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose block_refresh_and_destroy}
					{pad_back block_refresh_and_destroy}
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
					{pad_choose confirm_delete_friend params = {Name = <nickname>}}
					{pad_back block_refresh_and_destroy}
				]
			}
			option2 = {
				title = $wii_cancel
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose block_refresh_and_destroy}
					{pad_back block_refresh_and_destroy}
				]
			}
			previous_menu = vmenu_friendlist
		}
	endif
endscript

script choose_reject_phrase 
	destroy_generic_popup
	Wait \{1
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

	phrase = ($phrase_index)
	phrase_text = ($<phrase_array> [<phrase>])

	sendrejectphrase index = <friend> phrase = <phrase>
	formatText \{checksumName = inviteid
		'invite_id%a'
		a = $friendlist_selection_index}
	if ScreenElementExists id = <inviteid>
		DestroyScreenElement id = <inviteid>
	endif
	block_refresh_and_destroy
endscript

script confirm_delete_friend 
	destroy_generic_popup
	Wait \{1
		gameframe}
	formatText TextName = text $wii_delete_confirm a = <Name>
	create_generic_popup {
		title = $wii_delete
		yes_no_menu
		focus_no
		message = <text>
		yes_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose context_menu_choose_delete_friend params = {Name = <Name>}}
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
	Wait \{1
		gameframe}
	friendlist_delete_friend
	enable_network_wait_variable
	create_generic_popup \{loading_window
		message = $wii_deleting_friend
		wait_variable = network_wait_var
		previous_menu = vmenu_friendlist}
	formatText TextName = text $wii_deleted_friend a = <Name>
	Wait \{1
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
	formatText TextName = text $wii_invite_confirm a = <nickname>
	create_generic_popup {
		title = $wii_invite_title
		yes_no_menu
		message = <text>
		yes_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose friendlist_confirm_invite_friend params = {index = <resolvedindex>}}
			{pad_back block_refresh_and_destroy}
		]
		no_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose block_refresh_and_destroy}
			{pad_back block_refresh_and_destroy}
		]
		previous_menu = vmenu_friendlist
	}
endscript

script friendlist_confirm_invite_friend 
	destroy_generic_popup
	Wait \{5
		gameframe}
	Change invite_index = <index>
	if ($0x5061d9ed = 1)
		Change \{0x5061d9ed = 0}
		skiprenderframes \{10}
	endif
	ui_flow_manager_respond_to_action \{action = invite_friend}
endscript

script refresh_and_destroy 
	if ScreenElementExists \{id = 0x850b2a1b}
		KillSpawnedScript \{Name = 0x8de22eb3}
	endif
	destroy_generic_popup
	Wait \{1
		gameframe}
	0x7132524e
	refresh_friends_list
endscript

script 0x8de22eb3 
	begin
	if NOT ScreenElementExists \{id = 0x850b2a1b}
		return
	endif
	DoScreenElementMorph \{id = 0x850b2a1b
		alpha = 1.0
		time = 0.5}
	Wait \{0.5
		Seconds}
	DoScreenElementMorph \{id = 0x850b2a1b
		alpha = 0.0
		time = 0.5}
	Wait \{0.5
		Seconds}
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
	SetButtonEventMappings \{block_menu_input}
	refresh_and_destroy
	Wait \{0.5
		Seconds}
	SetButtonEventMappings \{unblock_menu_input}
endscript
