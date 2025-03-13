
script debug_create_medley 
	switch (<index>)
		case 0
		change \{current_medley_info = [
				{
					song = thejoker
					index = 8
				}
				{
					song = byob
					index = 6
				}
				{
					song = themiddle
					index = 8
				}
				{
					song = labamba
					index = 10
				}
				{
					song = kickoutthejams
					index = 4
				}
				{
					song = beautifulmourning
					index = 24
				}
				{
					song = hotforteacher
					index = 20
				}
			]}
		case 1
		change \{current_medley_info = [
				{
					song = thejoker
					index = 8
				}
				{
					song = themiddle
					index = 12
				}
				{
					song = labamba
					index = 10
				}
				{
					song = kickoutthejams
					index = 4
				}
				{
					song = beautifulmourning
					index = 24
				}
			]}
		case 2
		change \{current_medley_info = [
				{
					song = allalongthewatchtower
					index = 0
				}
				{
					song = blueorchid
					index = 0
				}
				{
					song = deadbolt
					index = 0
				}
				{
					song = demon
					index = 12
				}
				{
					song = hangmeuptodry
					index = 0
				}
				{
					song = inthemeantime
					index = 12
				}
				{
					song = lovetoken
					index = 10
				}
				{
					song = mirrorpeople
					index = 8
				}
				{
					song = nearlylostyou
					index = 4
				}
				{
					song = onebigholiday
					index = 12
				}
				{
					song = playthatfunkymusic
					index = 18
				}
				{
					song = sexonfire
					index = 10
				}
				{
					song = shoutitoutloud
					index = 18
				}
				{
					song = song2
					index = 6
				}
				{
					song = sowingseason
					index = 14
				}
				{
					song = steadyasshegoes
					index = 22
				}
				{
					song = wereanamericanband
					index = 0
				}
				{
					song = whybother
					index = 4
				}
				{
					song = yougivelove
					index = 0
				}
			]}
	endswitch
endscript

script ui_create_test_medley_mode 
	make_generic_menu {
		vmenu_id = test_medley_mode_vmenu
		pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_debug_menu
		title = qs(0x8bcfc148)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item {
		text = qs(0x136227f1)
		pad_choose_script = test_medley_select
		pad_choose_params = {<...> index = 0}
	}
	add_generic_menu_text_item {
		text = qs(0x384f7432)
		pad_choose_script = test_medley_select
		pad_choose_params = {<...> index = 1}
	}
	add_generic_menu_text_item {
		text = qs(0x21544573)
		pad_choose_script = test_medley_select
		pad_choose_params = {<...> index = 2}
	}
endscript

script ui_destroy_test_medley_mode 
	generic_ui_destroy
endscript

script test_medley_select 
	launchevent \{type = unfocus
		target = test_medley_mode_vmenu}
	test_medley_create_part_menu <...>
endscript

script test_medley_create_diff_menu 
	generic_ui_destroy
	make_generic_menu {
		vmenu_id = test_medley_mode_difficulty_vmenu
		pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_debug_menu
		title = qs(0xc475e0ea)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item {
		text = qs(0x66a003c6)
		pad_choose_script = test_medley_mode_launch
		pad_choose_params = {<...> difficulty = beginner}
	}
	add_generic_menu_text_item {
		text = qs(0x1c7f1488)
		pad_choose_script = test_medley_mode_launch
		pad_choose_params = {<...> difficulty = easy}
	}
	add_generic_menu_text_item {
		text = qs(0x79990567)
		pad_choose_script = test_medley_mode_launch
		pad_choose_params = {<...> difficulty = medium}
	}
	add_generic_menu_text_item {
		text = qs(0xc0aa0a20)
		pad_choose_script = test_medley_mode_launch
		pad_choose_params = {<...> difficulty = hard}
	}
	add_generic_menu_text_item {
		text = qs(0x242117ca)
		pad_choose_script = test_medley_mode_launch
		pad_choose_params = {<...> difficulty = expert}
	}
	launchevent \{type = focus
		target = test_medley_mode_difficulty_vmenu}
endscript

script test_medley_create_part_menu 
	generic_ui_destroy
	make_generic_menu {
		vmenu_id = test_medley_mode_part_vmenu
		pos = ($menu_pos - (0.0, 80.0))
		dims = (400.0, 500.0)
		z_priority = 100.0
		title_pos = ($menu_pos - (0.0, 80.0))
		title_just = [left top]
		pad_back_script = back_to_debug_menu
		title = qs(0xddc9fdd7)
		scrolling
		use_all_controllers
	}
	add_generic_menu_text_item {
		text = qs(0x826ca62c)
		pad_choose_script = test_medley_create_diff_menu
		pad_choose_params = {<...> part = guitar}
	}
	add_generic_menu_text_item {
		text = qs(0xec55f51b)
		pad_choose_script = test_medley_create_diff_menu
		pad_choose_params = {<...> part = bass}
	}
	add_generic_menu_text_item {
		text = qs(0xf9468e57)
		pad_choose_script = test_medley_create_diff_menu
		pad_choose_params = {<...> part = drum}
	}
	add_generic_menu_text_item {
		text = qs(0x0cf770e2)
		pad_choose_script = test_medley_create_diff_menu
		pad_choose_params = {<...> part = vocals}
	}
	add_generic_menu_text_item {
		text = qs(0x4ba5fecf)
		pad_choose_script = test_medley_create_diff_menu
		pad_choose_params = {<...> part = band}
	}
	launchevent \{type = focus
		target = test_medley_mode_part_vmenu}
endscript

script test_medley_mode_launch 
	debug_create_medley <...>
	medley_reset
	if (<part> = band)
		setplayerinfo \{1
			bot_play = 1}
		setplayerinfo \{2
			bot_play = 1}
		setplayerinfo \{3
			bot_play = 1}
		setplayerinfo \{4
			bot_play = 1}
		change \{game_mode = p4_quickplay}
		setplayerinfo \{1
			part = guitar}
		setplayerinfo \{2
			part = drum}
		setplayerinfo \{3
			part = bass}
		setplayerinfo \{4
			part = vocals}
		setplayerinfo 1 difficulty = <difficulty>
		setplayerinfo 2 difficulty = <difficulty>
		setplayerinfo 3 difficulty = <difficulty>
		setplayerinfo 4 difficulty = <difficulty>
		setplayerinfo \{1
			in_game = 1}
		setplayerinfo \{2
			in_game = 1}
		setplayerinfo \{3
			in_game = 1}
		setplayerinfo \{4
			in_game = 1}
	else
		setplayerinfo 1 difficulty = <difficulty>
		setplayerinfo 1 part = <part>
		setplayerinfo 1 controller = <device_num>
		setplayerinfo \{1
			in_game = 1}
		change \{game_mode = p1_quickplay}
	endif
	change \{medley_mode_on = 1}
	gman_songfunc \{func = clear_play_list}
	gman_songfunc \{func = set_current_song
		params = {
			song = medley
		}}
	gman_songfunc \{func = start_song
		params = {
			data = {
				starttime = $medley_intro_start_time
			}
		}}
endscript
