
script ui_create_practice_select_looping device_num = ($primary_controller)
	createscreenelement \{type = descinterface
		parent = root_window
		id = practiceselectloopinginterface
		desc = 'practice_menu_popup'
		practice_head_text = qs(0xf352e399)}
	if practiceselectloopinginterface :desc_resolvealias \{name = alias_diamondbling
			param = diamondbling_id}
		<diamondbling_id> :obj_spawnscript 0x01315b7f params = {minwidth = 100 maxwidth = 200 maxtime = 0.5}
	else
		scriptassert \{'UI_art'}
	endif
	if practiceselectloopinginterface :desc_resolvealias \{name = alias_diamondbling2
			param = diamondbling_id2}
		<diamondbling_id2> :obj_spawnscript 0x01315b7f params = {minwidth = 100 maxwidth = 300 maxtime = 0.5}
	else
		scriptassert \{'UI_art'}
	endif
	particle_id = <id>
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
	if <particle_id> :desc_resolvealias name = 0x4ad34825 param = 0x12b40ebc
		<0x12b40ebc> :obj_spawnscript 0x0542334f params = {pos = (420.0, -90.0) z = 1011 parent = <0x12b40ebc>}
	else
		scriptassert \{'UI_art'}
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 1011}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 1011}
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
