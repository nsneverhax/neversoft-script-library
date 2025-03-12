
script ui_create_select_practice_difficulty device_num = ($primary_controller)
	gamemode_gettype
	if (<type> = practice)
		hide_band
		hide_crowd_models
	endif
	create_mainmenu_bg
	createscreenelement \{type = descinterface
		parent = root_window
		id = practiceselectdifficultyinterface
		desc = 'practice_menu_popup'
		z_priority = 100
		practice_head_text = qs(0xcfdbea0e)}
	practiceselectdifficultyinterface :desc_resolvealias \{name = alias_menu}
	assignalias id = <resolved_id> alias = current_menu
	current_menu :se_setprops {
		event_handlers = [
			{pad_back generic_event_back}
			{pad_back ui_sfx params = {menustate = generic uitype = back}}
			{pad_up ui_sfx params = {menustate = generic uitype = scrollup}}
			{pad_down ui_sfx params = {menustate = generic uitype = scrolldown}}
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
	createscreenelement {
		type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x6ef11a01)
		autosizedims = true
		light_bar_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = medium}}
		]
		exclusive_device = <device_num>
	}
	createscreenelement {
		type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x51b06d2f)
		autosizedims = true
		light_bar_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = hard}}
		]
		exclusive_device = <device_num>
	}
	createscreenelement {
		type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x334908ac)
		autosizedims = true
		light_bar_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose practice_choose_difficulty params = {difficulty = expert}}
		]
		exclusive_device = <device_num>
	}
	get_controller_type controller_index = <device_num>
	if (<controller_type> = drum)
		if any_song_has_double_kick
			createscreenelement {
				type = descinterface
				parent = current_menu
				desc = 'practice_menu_popup_item'
				item_text = qs(0x7a19b5f7)
				autosizedims = true
				light_bar_alpha = 0
				event_handlers = [
					{focus practice_difficulty_focus}
					{unfocus practice_difficulty_unfocus}
					{pad_choose practice_choose_difficulty params = {difficulty = expert_plus}}
				]
				exclusive_device = <device_num>
			}
		endif
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	launchevent \{type = focus
		target = current_menu}
	spawnscriptnow \{reset_mainmenu_camera}
endscript

script ui_destroy_select_practice_difficulty 
	destroy_mainmenu_bg
	clean_up_user_control_helpers
	if screenelementexists \{id = practiceselectdifficultyinterface}
		destroyscreenelement \{id = practiceselectdifficultyinterface}
	endif
endscript

script practice_difficulty_focus 
	se_setprops \{light_bar_alpha = 1
		item_rgba = [
			0
			0
			0
			255
		]}
endscript

script practice_difficulty_unfocus 
	se_setprops \{light_bar_alpha = 0
		item_rgba = grey_lt}
endscript

script practice_choose_difficulty 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = generic
		uitype = select}
	getfirstplayer
	if (<difficulty> = expert_plus)
		setplayerinfo <player> double_kick_drum = 1
		difficulty = expert
	else
		setplayerinfo <player> double_kick_drum = 0
	endif
	setplayerinfo <player> difficulty = <difficulty>
	playlist_getcurrentsong
	if ($current_song_qpak != <current_song>)
		unload_songqpak
		load_songqpak song_name = <current_song>
		begin
		if ($g_loadpak_lock = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	generic_event_choose \{state = uistate_select_song_section}
endscript
