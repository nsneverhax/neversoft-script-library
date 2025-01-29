
script ui_create_pausemenu_change_difficulty 
	player_device = ($last_start_pressed_device)
	ui_pausemenu_create_bg \{title_text = qs(0x9f281c76)}
	if pausemenu_bg :desc_resolvealias \{name = alias_menu}
		<parent> = <resolved_id>
	endif
	make_menu {
		parent = <parent>
		centered_offset = (-400.0, -250.0)
		exclusive_device = <player_device>
		extra_z = 600
		centered
		nobg
	}
	pausemenu_change_difficulty_get_current_index
	diff_index = 0
	getarraysize \{$difficulty_list}
	begin
	<text> = ($difficulty_list_props.($difficulty_list [<diff_index>]).text)
	if (<difficulty_index> = <diff_index>)
		<text> = (<text> + qs(0x11e243f5))
	endif
	add_menu_item {
		text = <text>
		pad_choose_script = pausemenu_change_difficulty_choose
		pad_choose_params = {<...> difficulty = ($difficulty_list [<diff_index>])}
	}
	<diff_index> = (<diff_index> + 1)
	repeat <array_size>
	add_gamertag_helper \{exclusive_device = $last_start_pressed_device}
	menu_finish
endscript

script ui_destroy_pausemenu_change_difficulty 
	generic_ui_destroy
	ui_pausemenu_destroy_bg
endscript

script pausemenu_change_difficulty_choose 
	removeparameter \{base_name}
	if gotparam \{no_warning}
		generic_event_choose state = uistate_pausemenu_change_difficulty_confirm data = {<...> difficulty = <difficulty>}
	else
		generic_event_choose state = uistate_pausemenu_change_difficulty_warning data = {<...> difficulty = <difficulty>}
	endif
endscript

script pausemenu_change_difficulty_get_current_index 
	<player> = 1
	if ($current_num_players > 1)
		<player_device> = ($last_start_pressed_device)
		<i> = 1
		begin
		getplayerinfo <i> controller
		if (<controller> = <player_device>)
			<player> = <i>
			break
		endif
		<i> = (<i> + 1)
		repeat ($current_num_players)
	endif
	getplayerinfo <player> difficulty
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
