
script ui_create_pausemenu_change_difficulty \{0x3e8a7a4d = -1}
	player_device = ($last_start_pressed_device)
	title_text = qs(0x9f281c76)
	extra_z = 700
	ui_pausemenu_create_bg title_text = <title_text> extra_z = <extra_z>
	if pausemenu_bg :desc_resolvealias \{Name = alias_menu}
		<parent> = <resolved_id>
	endif
	make_generic_barrel_menu {
		title = <title_text>
		pad_back_script = generic_event_back data = (state = Uistate_pausemenu)
		exclusive_device = <player_device>
		max_expansion = 5
		Pos = (1152.0, 554.0)
		z_priority = (600 + <extra_z>)
	}
	pausemenu_change_difficulty_get_current_index 0x3e8a7a4d = <0x3e8a7a4d>
	pausemenu_change_difficulty_get_current_player
	getplayerinfo <Player> part
	diff_index = 0
	GetArraySize \{$difficulty_list}
	0xbe1d0e19 = [
		icon_difficulty_beginner
		icon_difficulty_easy
		icon_difficulty_medium
		icon_difficulty_hard
		icon_difficulty_expert
	]
	icon_dims = (43.0, 43.0)
	icon_pos = (375.0, 27.0)
	spacer = qs(0xf2b125cf)
	begin
	<text> = ($difficulty_list_props.($difficulty_list [<diff_index>]).text)
	if (<difficulty_index> = <diff_index>)
		<text> = (<text> + qs(0x2f976f1e))
	endif
	<text> = (<text> + <spacer>)
	add_generic_barrel_menu_text_item {
		text = <text>
		pad_choose_sound = nullsound
		pad_choose_script = pausemenu_change_difficulty_choose
		pad_choose_params = {<...> difficulty = ($difficulty_list [<diff_index>])}
		additional_focus_script = 0xd04724ad
		additional_focus_params = {child_id = difficulty_icon}
		additional_unfocus_script = 0xf653c16e
		additional_unfocus_params = {child_id = difficulty_icon}
	}
	CreateScreenElement {
		local_id = difficulty_icon
		Type = SpriteElement
		parent = <item_container_id>
		texture = (<0xbe1d0e19> [<diff_index>])
		dims = <icon_dims>
		Pos = <icon_pos>
	}
	<diff_index> = (<diff_index> + 1)
	repeat <array_Size>
	generic_barrel_menu_finish
endscript

script ui_destroy_pausemenu_change_difficulty 
	destroy_generic_barrel_menu
	generic_ui_destroy
	ui_pausemenu_destroy_bg
endscript

script pausemenu_change_difficulty_choose 
	RemoveParameter \{base_name}
	if GotParam \{no_warning}
		generic_event_choose state = uistate_pausemenu_change_difficulty_confirm data = {<...> difficulty = <difficulty> double_kick = 0}
	else
		generic_event_choose state = uistate_pausemenu_change_difficulty_warning data = {<...> difficulty = <difficulty> double_kick = 0}
	endif
endscript

script pausemenu_change_difficulty_get_current_index \{0x3e8a7a4d = -1}
	pausemenu_change_difficulty_get_current_player
	if NOT (<0x3e8a7a4d> = -1)
		<Player> = (<0x3e8a7a4d> + 1)
	endif
	getplayerinfo <Player> difficulty
	switch <difficulty>
		case beginner
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
