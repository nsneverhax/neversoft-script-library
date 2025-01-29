
script ui_create_pausemenu_change_difficulty \{0x3e8a7a4d = -1}
	player_device = ($last_start_pressed_device)
	ui_pausemenu_create_bg title_text = qs(0x9f281c76) controller = <player_device>
	text_scale = 0.75
	pausemenu_change_difficulty_get_current_index 0x3e8a7a4d = <0x3e8a7a4d>
	pausemenu_change_difficulty_get_current_player
	getplayerinfo <Player> part
	if NOT (<0x3e8a7a4d> = -1)
		<part> = vocals
	endif
	if (<part> = drum)
		getplayerinfo <Player> double_kick_drum
	else
		double_kick_drum = 0
	endif
	diff_index = 0
	GetArraySize \{$difficulty_list}
	begin
	<text> = ($difficulty_list_props.($difficulty_list [<diff_index>]).text)
	if (<difficulty_index> = <diff_index> && <double_kick_drum> = 0)
		<text> = (<text> + qs(0x11e243f5))
	endif
	add_menu_frontend_item {
		text = <text>
		internal_scale = <text_scale>
		pad_choose_script = pausemenu_change_difficulty_choose
		pad_choose_params = {<...> difficulty = ($difficulty_list [<diff_index>]) double_kick = 0}
	}
	<diff_index> = (<diff_index> + 1)
	repeat <array_Size>
	if (<part> = drum)
		includes_double_kick = 0
		if ($permanent_songlist_props.($current_song).double_kick = 1)
			<includes_double_kick> = 1
		endif
		if (<includes_double_kick> = 1)
			if (<difficulty_index> = (<diff_index> -1) && <double_kick_drum> = 1)
				<text> = qs(0x3cad40c9)
			else
				<text> = qs(0x7a19b5f7)
			endif
			add_menu_frontend_item {
				text = <text>
				internal_scale = <text_scale>
				pad_choose_script = pausemenu_change_difficulty_choose
				pad_choose_params = {<...> difficulty = ($difficulty_list [<diff_index> -1]) double_kick = 1}
			}
			if (<difficulty_index> = (<diff_index> -1) && <double_kick_drum> = 1)
				LaunchEvent Type = focus target = current_menu data = {child_index = (<difficulty_index> + 1)}
			else
				LaunchEvent Type = focus target = current_menu data = {child_index = <difficulty_index>}
			endif
		else
			LaunchEvent Type = focus target = current_menu data = {child_index = <difficulty_index>}
		endif
	else
		LaunchEvent Type = focus target = current_menu data = {child_index = <difficulty_index>}
	endif
	add_gamertag_helper \{exclusive_device = $last_start_pressed_device}
	menu_finish
endscript

script ui_destroy_pausemenu_change_difficulty 
	generic_ui_destroy
	ui_pausemenu_destroy_bg
endscript

script pausemenu_change_difficulty_choose \{double_kick = 0}
	RemoveParameter \{base_name}
	if GotParam \{no_warning}
		generic_event_choose state = uistate_pausemenu_change_difficulty_confirm data = {<...> difficulty = <difficulty>}
	else
		generic_event_choose state = uistate_pausemenu_change_difficulty_warning data = {<...> difficulty = <difficulty>}
	endif
endscript

script pausemenu_change_difficulty_get_current_index \{0x3e8a7a4d = -1}
	pausemenu_change_difficulty_get_current_player
	if NOT (<0x3e8a7a4d> = -1)
		<Player> = (<0x3e8a7a4d> + 1)
	endif
	getplayerinfo <Player> difficulty
	switch <difficulty>
		case easy_rhythm
		<difficulty_index> = 0
		case easy
		<difficulty_index> = 1
		case medium
		<difficulty_index> = 2
		case hard
		<difficulty_index> = 3
		case expert
		<difficulty_index> = 4
	endswitch
	return difficulty_index = <difficulty_index>
endscript

script pausemenu_change_difficulty_get_current_player 
	<Player> = 1
	if ($current_num_players > 1)
		<player_device> = ($last_start_pressed_device)
		<i> = 1
		begin
		getplayerinfo <i> controller
		if (<controller> = <player_device>)
			<Player> = <i>
			break
		endif
		<i> = (<i> + 1)
		repeat ($current_num_players)
	endif
	return Player = <Player>
endscript
