
script ui_create_select_practice_difficulty device_num = ($primary_controller)
	spawnscriptnow \{menu_music_on}
	createscreenelement \{type = descinterface
		parent = root_window
		id = practiceselectdifficultyinterface
		desc = 'practice_menu_popup'
		practice_head_text = qs(0xcfdbea0e)}
	if practiceselectdifficultyinterface :desc_resolvealias \{name = alias_bkgd
			param = practice_frame_add_id}
		<practice_frame_add_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'pdetrich'}
	endif
	if practiceselectdifficultyinterface :desc_resolvealias \{name = alias_bkgd
			param = practice_frame_add_id}
		<practice_frame_add_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'pdetrich'}
	endif
	practiceselectdifficultyinterface :desc_resolvealias \{name = alias_menu}
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
		item_text = qs(0x8d657387)
		autosizedims = true
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = easy}}
		]
		exclusive_device = <device_num>
	}
	create_2d_spring_system desc_id = <id> num_springs = 2 stiffness = 50 rest_length = 1
	createscreenelement {
		type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x6ef11a01)
		autosizedims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = medium}}
		]
		exclusive_device = <device_num>
	}
	create_2d_spring_system desc_id = <id> num_springs = 2 stiffness = 50 rest_length = 1
	createscreenelement {
		type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x51b06d2f)
		autosizedims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = hard}}
		]
		exclusive_device = <device_num>
	}
	create_2d_spring_system desc_id = <id> num_springs = 2 stiffness = 50 rest_length = 1
	createscreenelement {
		type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x334908ac)
		autosizedims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = expert}}
		]
		exclusive_device = <device_num>
	}
	create_2d_spring_system desc_id = <id> num_springs = 2 stiffness = 50 rest_length = 1
	get_controller_type controller_index = <device_num>
	if (<controller_type> = drum)
		createscreenelement {
			type = descinterface
			parent = current_menu
			desc = 'practice_menu_popup_item'
			item_text = qs(0x7a19b5f7)
			autosizedims = true
			highlight_btn_alpha = 0
			event_handlers = [
				{focus practice_difficulty_focus}
				{unfocus practice_difficulty_unfocus}
				{pad_choose practice_choose_difficulty params = {difficulty = expert_plus}}
			]
			exclusive_device = <device_num>
		}
		create_2d_spring_system desc_id = <id> num_springs = 2 stiffness = 50 rest_length = 1
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red}
	launchevent \{type = focus
		target = current_menu}
	spawnscriptnow \{reset_mainmenu_camera}
endscript

script ui_destroy_select_practice_difficulty 
	clean_up_user_control_helpers
	if screenelementexists \{id = practiceselectdifficultyinterface}
		destroyscreenelement \{id = practiceselectdifficultyinterface}
	endif
endscript

script practice_difficulty_focus 
	generic_menu_up_or_down_sound
	se_setprops \{highlight_btn_alpha = 1
		item_rgba = [
			0
			0
			0
			255
		]}
endscript

script practice_difficulty_unfocus 
	se_setprops \{highlight_btn_alpha = 0
		item_rgba = grey_lt}
endscript

script practice_choose_difficulty 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	getfirstplayer
	if (<difficulty> = expert_plus)
		setplayerinfo <player> double_kick_drum = 1
		difficulty = expert
	else
		setplayerinfo <player> double_kick_drum = 0
	endif
	setplayerinfo <player> difficulty = <difficulty>
	gman_songtool_getcurrentsong
	if ($current_song_qpak != <current_song>)
		unload_songqpak
		load_songqpak song_name = <current_song>
		begin
		if ($loadpak_lock = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	generic_event_choose \{state = uistate_select_song_section}
endscript
