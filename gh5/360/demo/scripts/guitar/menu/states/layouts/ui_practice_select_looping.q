
script ui_create_practice_select_looping device_num = ($primary_controller)
	menu_music_on
	createscreenelement \{type = descinterface
		parent = root_window
		id = practiceselectloopinginterface
		desc = 'practice_menu_popup'
		z_priority = 100
		practice_head_text = qs(0xf352e399)}
	if practiceselectloopinginterface :desc_resolvealias \{name = alias_bkgd
			param = practice_frame_add_id}
		<practice_frame_add_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'pdetrich'}
	endif
	if practiceselectloopinginterface :desc_resolvealias \{name = alias_bkgd
			param = practice_frame_add_id}
		<practice_frame_add_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'pdetrich'}
	endif
	practiceselectloopinginterface :desc_resolvealias \{name = alias_menu}
	assignalias id = <resolved_id> alias = current_menu
	current_menu :se_setprops {
		event_handlers = [
			{pad_back generic_event_back}
		]
		exclusive_device = <device_num>
	}
	createscreenelement {
		type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x5b9dd758)
		autosizedims = true
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_looping params = {<...> choice = once}}
		]
		exclusive_device = <device_num>
	}
	create_2d_spring_system desc_id = <id> num_springs = 2 stiffness = 50 rest_length = 1
	createscreenelement {
		type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0xd1cccae6)
		autosizedims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_looping params = {<...> choice = looping}}
		]
		exclusive_device = <device_num>
	}
	create_2d_spring_system desc_id = <id> num_springs = 2 stiffness = 50 rest_length = 1
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red}
	launchevent \{type = focus
		target = current_menu}
endscript

script ui_destroy_practice_select_looping 
	clean_up_user_control_helpers
	if screenelementexists \{id = practiceselectloopinginterface}
		destroyscreenelement \{id = practiceselectloopinginterface}
	endif
endscript

script menu_choose_practice_looping 
	if (<choice> = looping)
		change \{practice_loop_section = 1}
	else
		change \{practice_loop_section = 0}
	endif
	getfirstplayer
	setplayerinfo <player> in_game = 1
	setplayerinfo <player> controller = <device_num>
	change \{game_mode = practice}
	change \{practice_enabled = 1}
	getplayerinfo <player> part
	if (<part> = vocals)
		spawnscriptlater \{menu_choose_practice_speed_auto_go_to_gameplay_for_vocals}
		return
	endif
	if ui_event_exists_in_stack \{name = 'gameplay'}
		create_loading_screen
		practice_restart_song
	elseif NOT gotparam \{from_pause}
		generic_event_choose \{state = uistate_play_song}
	else
		restart_warning_select_restart \{dont_save_song_data}
	endif
endscript
