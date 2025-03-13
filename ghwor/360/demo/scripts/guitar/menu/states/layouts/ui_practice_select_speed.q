practice_speed_factors = {
	full = 1.0
	slow = 0.8
	slower = 0.66666675
	slowest = 0.5
}

script ui_init_practice_select_speed 
	if screenelementexists \{id = practice_sectiontext}
		practice_sectiontext :se_setprops \{alpha = 0}
	endif
endscript

script ui_deinit_practice_select_speed 
	if screenelementexists \{id = practice_sectiontext}
		practice_sectiontext :se_setprops \{alpha = 1}
	endif
endscript

script ui_create_practice_select_speed device_num = ($primary_controller)
	gamemode_gettype
	if (<type> = practice)
		hide_band
		hide_crowd_models
	endif
	create_mainmenu_bg
	createscreenelement \{type = descinterface
		parent = root_window
		id = practiceselectspeedinterface
		desc = 'practice_menu_popup'
		z_priority = 100
		practice_head_text = qs(0x2586eb28)}
	practiceselectspeedinterface :desc_resolvealias \{name = alias_menu}
	assignalias id = <resolved_id> alias = current_menu
	current_menu :se_setprops {
		event_handlers = [
			{pad_back practice_select_speed_back}
			{pad_up ui_sfx params = {menustate = generic uitype = scrollup}}
			{pad_down ui_sfx params = {menustate = generic uitype = scrolldown}}
		]
		exclusive_device = <device_num>
	}
	createscreenelement {
		type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0xab4bfb64)
		autosizedims = true
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = full}}
		]
		exclusive_device = <device_num>
	}
	createscreenelement {
		type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x0f639d5c)
		autosizedims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slow}}
		]
		exclusive_device = <device_num>
	}
	createscreenelement {
		type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x8e382995)
		autosizedims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slower}}
		]
		exclusive_device = <device_num>
	}
	createscreenelement {
		type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x28ef973e)
		autosizedims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slowest}}
		]
		exclusive_device = <device_num>
	}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	launchevent \{type = focus
		target = current_menu}
endscript

script ui_destroy_practice_select_speed 
	destroy_mainmenu_bg
	clean_up_user_control_helpers
	if screenelementexists \{id = practiceselectspeedinterface}
		destroyscreenelement \{id = practiceselectspeedinterface}
	endif
endscript

script practice_select_speed_back 
	ui_sfx \{menustate = generic
		uitype = back}
	audio_ui_menu_music_off
	generic_event_back
endscript

script menu_choose_practice_speed_set_speed \{speed = full}
	ui_sfx \{menustate = generic
		uitype = select}
	audio_stopping_sounds_killsong_lite
	change current_speedfactor = ($practice_speed_factors.<speed>)
	generic_event_choose \{state = uistate_practice_select_looping}
endscript

script menu_choose_practice_speed_auto_go_to_gameplay_for_vocals 
	ui_event_wait_for_safe
	if ui_event_exists_in_stack \{name = 'gameplay'}
		create_loading_screen
		practice_restart_song
	else
		generic_event_choose \{state = uistate_play_song}
	endif
endscript
