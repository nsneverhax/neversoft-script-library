achievements_ui_exit_script = empty_script
achievements_ui_exit_script_params = {
}
achievements_read_successfully = FALSE
achievement_dates_read_successfully = FALSE

script create_achievements_ui \{exit_Script = empty_script
		exit_script_params = {
		}
		friends_uid = [
			0
			0
		]
		friends_name = qs(0x00000000)}
	social_networks_broadcast_init
	Change achievements_ui_exit_script = <exit_Script>
	Change achievements_ui_exit_script_params = <exit_script_params>
	spawnscript create_achievements_ui_spawned params = {friends_uid = <friends_uid> friends_name = <friends_name>}
endscript

script create_achievements_ui_spawned \{friends_uid = [
			0
			0
		]
		friends_name = qs(0x00000000)}
	NetSessionFunc \{func = get_gamertag}
	create_achievements_menu player_name = <Name> friends_uid = <friends_uid> friends_name = <friends_name>
	achievements_ui_loading_anim_begin
	load_achievements friends_uid = <friends_uid>
	for_compare = 1
	if is_net_id_zero net_id = <friends_uid>
		<for_compare> = 0
	endif
	populate_title_achievements player_name = <Name> friends_name = <friends_name> for_compare = <for_compare>
	achievements_ui_loading_anim_end
	achievements_ui_add_helper_pills_and_focus
endscript

script load_achievements \{friends_uid = [
			0
			0
		]}
	read_my_achievements
	Block \{Type = achievements_read_complete}
	Change achievements_read_successfully = (<event_data>.success)
	RemoveParameter \{event_data}
	if NOT is_net_id_zero net_id = <friends_uid>
		read_friends_achievements friends_uid = <friends_uid>
		Block \{Type = achievements_read_complete}
		RemoveParameter \{event_data}
	endif
endscript

script create_achievements_menu \{friends_uid = [
			0
			0
		]
		player_name = 0x69696969
		friends_name = qs(0x5217670b)}
	clean_up_user_control_helpers
	friend_alpha = 1
	if is_net_id_zero net_id = <friends_uid>
		<friend_alpha> = 0
	endif
	show_broadcast = 1
	if social_networks_broadcast_allowed
		if NOT facebook_check_is_registered_flag
			if NOT twitter_check_is_registered_flag
				<show_broadcast> = 0
				printf \{'nothing registered'}
			endif
		endif
	else
		<show_broadcast> = 0
	endif
	CreateScreenElement {
		Type = descinterface
		desc = 'achievements_menu'
		parent = root_window
		id = wii_achievements_popup
		z_priority = 1000.0
		player_name_text = <player_name>
		friend_name_text = <friends_name>
		friend_container_alpha = <friend_alpha>
		loading_container_alpha = 0
		event_handlers = [
			{pad_back ui_sfx params = {menustate = Generic uitype = back}}
			{pad_back destroy_achievements_menu}
		]
		tags = {show_broadcast = <show_broadcast>}
	}
	if wii_achievements_popup :desc_resolvealias \{Name = alias_menu}
		AssignAlias id = <resolved_id> alias = achievements_menu
		scroll_sound_event_handlers = [
			{pad_up ui_sfx params = {menustate = Generic uitype = scrollup}}
			{pad_down ui_sfx params = {menustate = Generic uitype = scrolldown}}
		]
		achievements_menu :se_setprops event_handlers = <scroll_sound_event_handlers>
	else
		ScriptAssert \{'failed to resolve alias_menu'}
	endif
	if wii_achievements_popup :desc_resolvealias \{Name = alias_item_highlight}
		AssignAlias id = <resolved_id> alias = item_highlight
	else
		ScriptAssert \{'failed to resolve alias_item_highlight'}
	endif
	if wii_achievements_popup :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
		AssignAlias id = <resolved_id> alias = achievements_scrollbar_wgt
	else
		ScriptAssert \{'failed to resolve alias_generic_scrollbar_wgt'}
	endif
	generic_scrollbar_wgt_initialize \{id = achievements_scrollbar_wgt}
	generic_scrollbar_wgt_set_resolution id = achievements_scrollbar_wgt num_elements = ($g_total_num_achievements)
endscript

script achievements_ui_loading_anim_begin 
	wii_achievements_popup :se_setprops \{loading_container_alpha = 1.0
		time = 0.2}
	wii_achievements_popup :se_waitprops
	RunScriptOnScreenElement \{autosave_spinner_ui_icon_anim
		id = wii_achievements_popup}
endscript

script achievements_ui_loading_anim_end 
	KillSpawnedScript \{Name = instrument_spinner_ui_icon_anim}
	wii_achievements_popup :se_setprops \{loading_container_alpha = 0.0
		time = 0.2}
	wii_achievements_popup :se_waitprops
endscript

script destroy_achievements_menu 
	DestroyScreenElement \{id = wii_achievements_popup}
	clean_up_user_control_helpers
	($achievements_ui_exit_script) ($achievements_ui_exit_script_params)
endscript

script achievement_item_focus \{index = !i1768515945}
	printf \{'-- achievement_item_focus --'}
	generic_scrollbar_wgt_update_thumb_pos id = achievements_scrollbar_wgt index = <index>
	Obj_GetID
	item_highlight :se_setprops {
		parent = <objID>
		Pos = (0.0, 0.0)
		alpha = 0.4
		pos_anchor = [center center]
		just = [center center]
	}
endscript

script populate_title_achievements \{for_compare = 0
		player_name = 0x69696969
		friends_name = qs(0x00000000)}
	if NOT ScreenElementExists \{id = achievements_menu}
		ScriptAssert \{'the achievements popup does not exist or the menu alias could not be resolved'}
		return
	endif
	title = (($all_achievement_list) [0])
	ExtendCrc (<title>.crc) '_data' out = achievements
	bit_mask = (<title>.bit_mask)
	parse_achievements_bitmask {
		high32 = (<bit_mask> [0])
		low32 = (<bit_mask> [1])
		out_name = player_unlock_list
	}
	if (<for_compare> = 1)
		friends_mask = (<title>.friends_mask)
		parse_achievements_bitmask {
			high32 = (<friends_mask> [0])
			low32 = (<friends_mask> [1])
			out_name = friend_unlock_list
		}
	endif
	calculate_achievements_unlocked achievements_mask = <bit_mask>
	formatText TextName = num_achievements qs(0x953baf82) a = <num_unlocked> b = ($g_total_num_achievements)
	wii_achievements_popup :se_setprops num_items_text = <num_achievements>
	achievement = {}
	achievement_color = [0 0 0 0]
	achievement_icon = ach_locked
	blank_dot_alpha_player = 0
	filled_dot_alpha_player = 0
	blank_dot_alpha_friend = 0
	filled_dot_alpha_friend = 0
	unlocked_player = 0
	unlocked_friend = 0
	index = 0
	if wii_achievements_popup :GetSingleTag \{show_broadcast}
		if (<show_broadcast> = 1)
			if (<num_unlocked> > 0)
				wii_achievements_popup :se_setprops event_handlers = [
					{pad_L1 social_networks_choose_broadcast
						params = {
							return_script = achievements_ui_add_helper_pills_and_focus
							message_id = total_wiiwards_unlocked
							passed_variables = {
								total_num_unlocked = <num_unlocked>
							}
						}
					}
				]
			endif
		endif
	endif
	if pushfrontendoverridequota \{quota = quota_misc}
		begin
		<achievement> = ($<achievements> [<index>])
		<achievement_color> = (($wii_achievement_colors).(<achievement>.Color))
		if ((<player_unlock_list> [<index>]) = 1)
			<achievement_icon> = (<achievement>.Name)
			<blank_dot_alpha_player> = 0
			<filled_dot_alpha_player> = 1
			<unlocked_player> = 1
		else
			<achievement_icon> = ach_locked
			<blank_dot_alpha_player> = 1
			<filled_dot_alpha_player> = 0
			<unlocked_player> = 0
		endif
		if (<for_compare> = 1)
			if ((<friend_unlock_list> [<index>]) = 1)
				<blank_dot_alpha_friend> = 0
				<filled_dot_alpha_friend> = 1
				<unlocked_friend> = 1
			else
				<blank_dot_alpha_friend> = 1
				<filled_dot_alpha_friend> = 0
				<unlocked_friend> = 0
			endif
		endif
		default_event_handlers = [
			{pad_choose create_achievement_info_popup
				params = {
					for_compare = <for_compare>
					unlocked_player = <unlocked_player>
					unlocked_friend = <unlocked_friend>
					player_name = <player_name>
					friends_name = <friends_name>
					achievement = <achievement>
				}
			}
			{pad_choose ui_sfx params = {menustate = Generic uitype = select}}
			{focus achievement_item_focus params = {index = <index>}}
		]
		CreateScreenElement {
			Type = descinterface
			desc = 'achievements_item'
			parent = achievements_menu
			autosizedims = true
			icon_texture = <achievement_icon>
			name_text = (<achievement>.title)
			dot1_blank_alpha = <blank_dot_alpha_friend>
			dot1_texture_alpha = <filled_dot_alpha_friend>
			dot1_texture_rgba = <achievement_color>
			dot2_blank_alpha = <blank_dot_alpha_player>
			dot2_texture_alpha = <filled_dot_alpha_player>
			dot2_texture_rgba = <achievement_color>
			event_handlers = (<default_event_handlers>)
		}
		if (<filled_dot_alpha_friend> = 1)
			<id> :desc_resolvealias Name = alias_dot1
			RunScriptOnScreenElement {
				achievement_dot_anim
				id = <resolved_id>
			}
			RemoveParameter \{resolved_id}
		endif
		if (<filled_dot_alpha_player> = 1)
			<id> :desc_resolvealias Name = alias_dot2
			RunScriptOnScreenElement {
				achievement_dot_anim
				id = <resolved_id>
			}
			RemoveParameter \{resolved_id}
		endif
		RemoveParameter \{id}
		<index> = (<index> + 1)
		repeat ($g_total_num_achievements)
		popfrontendoverridequota
	endif
endscript

script achievement_dot_anim 
	se_setprops \{sparkle_scale = [
			0
			0
		]
		sparkle_rot_angle = 0
		sparkle_alpha = 0.0}
	begin
	Wait \{0.5
		Seconds}
	se_setprops \{sparkle_scale = [
			1
			1
		]
		sparkle_rot_angle = 360.0
		sparkle_alpha = 1.0
		time = 0.75}
	se_waitprops
	se_setprops \{sparkle_scale = [
			0
			0
		]
		sparkle_rot_angle = 720.0
		sparkle_alpha = 0.0
		time = 0.75}
	se_waitprops
	repeat
endscript

script create_achievement_info_popup \{for_compare = !i1768515945
		unlocked_player = !i1768515945
		unlocked_friend = -1
		player_name = 0x69696969
		friends_name = qs(0x5217670b)
		achievement = 0x69696969}
	LaunchEvent \{Type = unfocus
		target = wii_achievements_popup}
	LaunchEvent \{Type = unfocus
		target = achievements_menu}
	name_text = (<achievement>.title)
	description_text = (<achievement>.how_to)
	single_info_alpha = 1
	compare_info_alpha = 0
	share_event_handlers = []
	broadcast_allowed = 0
	dot_single_blank_alpha = 1
	dot_single_texture_alpha = 0
	dot_single_texture_rgba = (($wii_achievement_colors).(<achievement>.Color))
	info_single_text = <player_name>
	dot_compare1_blank_alpha = 1
	dot_compare1_texture_alpha = 0
	dot_compare1_texture_rgba = (($wii_achievement_colors).(<achievement>.Color))
	info_compare1_text = <friends_name>
	dot_compare2_blank_alpha = 1
	dot_compare2_texture_alpha = 0
	dot_compare2_texture_rgba = (($wii_achievement_colors).(<achievement>.Color))
	info_compare2_text = <player_name>
	if (<unlocked_player> = 1)
		<dot_single_blank_alpha> = 0
		<dot_single_texture_alpha> = 1
		<dot_compare2_blank_alpha> = 0
		<dot_compare2_texture_alpha> = 1
		<description_text> = (<achievement>.desc)
		if wii_achievements_popup :GetSingleTag \{show_broadcast}
			if (<show_broadcast> = 1)
				share_event_handlers = [
					{pad_L1 social_networks_choose_broadcast_from_wiiward_popup
						params = {
							return_script = achievements_ui_add_helper_pills_and_focus
							message_id = wiiward_unlocked
							passed_variables = {
								wiiward_title = <name_text>
								wiiward_desc = <description_text>
							}
						}
					}
				]
			endif
			<broadcast_allowed> = <show_broadcast>
		endif
	endif
	if (<for_compare> = 1)
		<single_info_alpha> = 0
		<compare_info_alpha> = 1
		if (<unlocked_friend> = -1)
			ScriptAssert \{'<unlocked_friend> is a required param if <for_compare> is set to 1'}
			return
		elseif (<unlocked_friend> = 1)
			<dot_compare1_blank_alpha> = 0
			<dot_compare1_texture_alpha> = 1
		endif
	endif
	default_event_handlers = [
		{pad_back ui_sfx params = {menustate = Generic uitype = back}}
		{pad_back destroy_achievement_info_popup}
	]
	CreateScreenElement {
		Type = descinterface
		desc = 'achievement_info'
		parent = root_window
		id = achievement_info_popup
		z_priority = 1020.0
		name_text = <name_text>
		description_text = <description_text>
		single_info_alpha = <single_info_alpha>
		compare_info_alpha = <compare_info_alpha>
		dot_single_blank_alpha = <dot_single_blank_alpha>
		dot_single_texture_alpha = <dot_single_texture_alpha>
		dot_single_texture_rgba = <dot_single_texture_rgba>
		info_single_text = <info_single_text>
		dot_compare1_blank_alpha = <dot_compare1_blank_alpha>
		dot_compare1_texture_alpha = <dot_compare1_texture_alpha>
		dot_compare1_texture_rgba = <dot_compare1_texture_rgba>
		info_compare1_text = <info_compare1_text>
		dot_compare2_blank_alpha = <dot_compare2_blank_alpha>
		dot_compare2_texture_alpha = <dot_compare2_texture_alpha>
		dot_compare2_texture_rgba = <dot_compare2_texture_rgba>
		info_compare2_text = <info_compare2_text>
		event_handlers = (<default_event_handlers> + <share_event_handlers>)
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if (<broadcast_allowed> = 1)
		add_user_control_helper text = ($g_social_networks_broadcast_string) button = orange z = 100000
	endif
	LaunchEvent \{Type = focus
		target = achievement_info_popup}
endscript

script destroy_achievement_info_popup 
	DestroyScreenElement \{id = achievement_info_popup}
	achievements_ui_add_helper_pills_and_focus
endscript

script calculate_achievements_unlocked \{achievements_mask = [
			0
			0
		]}
	test_bit = 0
	num_unlocked = 0
	array_index = 0
	Field = 0
	GetArraySize <achievements_mask>
	if (<array_Size> != 2)
		ScriptAssert \{'invalid achievements_mask param, size should <array_size> should be 2'}
	endif
	begin
	<Field> = (<achievements_mask> [<array_index>])
	<test_bit> = 1
	begin
	if (<test_bit> && <Field>)
		<num_unlocked> = (<num_unlocked> + 1)
	endif
	<test_bit> = (<test_bit> * 2)
	repeat 32
	<array_index> = (<array_index> + 1)
	repeat <array_Size>
	return num_unlocked = <num_unlocked>
endscript

script achievements_ui_add_helper_pills_and_focus 
	Change \{g_social_networks_broadcast_sent = 0}
	Change \{g_facebook_broadcast_armed = 1}
	Change \{g_twitter_broadcast_armed = 1}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if wii_achievements_popup :GetSingleTag \{show_broadcast}
		if (<show_broadcast> = 1)
			add_user_control_helper text = ($g_social_networks_broadcast_string) button = orange z = 100000
		endif
	endif
	LaunchEvent \{Type = focus
		target = wii_achievements_popup}
	achievements_menu :menu_getselectedindex
	LaunchEvent Type = focus target = achievements_menu data = {child_index = <selected_index>}
endscript

script social_networks_choose_broadcast_from_wiiward_popup 
	destroy_achievement_info_popup
	LaunchEvent \{Type = unfocus
		target = wii_achievements_popup}
	LaunchEvent \{Type = unfocus
		target = achievements_menu}
	social_networks_choose_broadcast <...>
endscript

script destroy_achievements_ui 
	if ScreenElementExists \{id = achievement_info_popup}
		DestroyScreenElement \{id = achievement_info_popup}
	endif
	if ScreenElementExists \{id = wii_achievements_popup}
		DestroyScreenElement \{id = wii_achievements_popup}
	endif
	clean_up_user_control_helpers
endscript
