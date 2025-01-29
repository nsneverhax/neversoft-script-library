
script ui_create_practice_select_looping device_num = ($primary_controller)
	CreateScreenElement \{Type = descinterface
		parent = root_window
		id = practiceselectloopinginterface
		desc = 'practice_menu_popup'
		z_priority = 100
		practice_head_text = qs(0xf352e399)}
	create_mainmenu_bg
	practiceselectloopinginterface :desc_resolvealias \{Name = alias_menu}
	AssignAlias id = <resolved_id> alias = current_menu
	current_menu :se_setprops {
		event_handlers = [
			{pad_back ui_sfx params = {menustate = Generic uitype = back}}
			{pad_back generic_event_back}
			{pad_up ui_sfx params = {menustate = Generic uitype = scrollup}}
			{pad_down ui_sfx params = {menustate = Generic uitype = scrolldown}}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		Type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x5b9dd758)
		autosizedims = true
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_looping params = {<...> choice = once}}
			{pad_choose ui_sfx params = {menustate = Generic uitype = complete}}
		]
		exclusive_device = <device_num>
	}
	CreateScreenElement {
		Type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0xd1cccae6)
		autosizedims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{focus practice_difficulty_focus}
			{unfocus practice_difficulty_unfocus}
			{pad_choose menu_choose_practice_looping params = {<...> choice = looping}}
			{pad_choose ui_sfx params = {menustate = Generic uitype = select}}
		]
		exclusive_device = <device_num>
	}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script ui_destroy_practice_select_looping 
	clean_up_user_control_helpers
	destroy_mainmenu_bg
	if ScreenElementExists \{id = practiceselectloopinginterface}
		DestroyScreenElement \{id = practiceselectloopinginterface}
	endif
endscript

script menu_choose_practice_looping 
	if (<choice> = looping)
		Change \{practice_loop_section = 1}
	else
		Change \{practice_loop_section = 0}
	endif
	getfirstplayer
	setplayerinfo <Player> in_game = 1
	setplayerinfo <Player> controller = <device_num>
	Change \{game_mode = practice}
	Change \{practice_enabled = 1}
	reset_all_player_scores
	getplayerinfo <Player> part
	if (<part> = vocals)
		SpawnScriptLater \{menu_choose_practice_speed_auto_go_to_gameplay_for_vocals}
		return
	endif
	if ui_event_exists_in_stack \{Name = 'gameplay'}
		create_loading_screen
		practice_restart_song
	elseif NOT GotParam \{from_pause}
		ui_sfx \{menustate = Generic
			uitype = select}
		generic_event_choose \{state = uistate_play_song}
	else
		restart_warning_select_restart \{dont_save_song_data}
	endif
endscript
