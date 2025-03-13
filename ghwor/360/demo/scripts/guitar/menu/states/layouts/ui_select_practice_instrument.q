
script ui_create_select_practice_instrument 
	gamemode_gettype
	if (<type> = practice)
		hide_band
		hide_crowd_models
	endif
	create_mainmenu_bg
	createscreenelement \{type = descinterface
		parent = root_window
		id = practiceselectinstrumentinterface
		desc = 'practice_menu_popup'
		z_priority = 100
		practice_head_text = qs(0xd667f733)}
	practiceselectinstrumentinterface :desc_resolvealias \{name = alias_menu}
	assignalias id = <resolved_id> alias = current_menu
	current_menu :se_setprops \{event_handlers = [
			{
				pad_back
				ui_sfx
				params = {
					menustate = generic
					uitype = back
				}
			}
			{
				pad_up
				ui_sfx
				params = {
					menustate = generic
					uitype = scrollup
				}
			}
			{
				pad_down
				ui_sfx
				params = {
					menustate = generic
					uitype = scrolldown
				}
			}
			{
				pad_back
				generic_event_back
			}
		]}
	createscreenelement \{type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x9504b94a)
		autosizedims = true
		event_handlers = [
			{
				focus
				practice_difficulty_focus
			}
			{
				unfocus
				practice_difficulty_unfocus
			}
			{
				pad_choose
				practice_choose_instrument
				params = {
					instrument = guitar
				}
			}
		]}
	createscreenelement \{type = descinterface
		parent = current_menu
		desc = 'practice_menu_popup_item'
		item_text = qs(0x7d4f9214)
		autosizedims = true
		highlight_btn_alpha = 0
		event_handlers = [
			{
				focus
				practice_difficulty_focus
			}
			{
				unfocus
				practice_difficulty_unfocus
			}
			{
				pad_choose
				practice_choose_instrument
				params = {
					instrument = bass
				}
			}
		]}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	launchevent \{type = focus
		target = current_menu}
endscript

script ui_destroy_select_practice_instrument 
	destroy_mainmenu_bg
	clean_up_user_control_helpers
	if screenelementexists \{id = practiceselectinstrumentinterface}
		destroyscreenelement \{id = practiceselectinstrumentinterface}
	endif
endscript

script practice_choose_instrument 
	ui_sfx \{menustate = generic
		uitype = select}
	getfirstplayer
	setplayerinfo <player> part = <instrument>
	get_progression_instrument_user_option part = <instrument> controller = <device_num> option = 'hyperspeed'
	if (<user_option> != -1)
		setplayerinfo <player> cheat_hyperspeed_value = <user_option>
	endif
	generic_event_choose \{state = uistate_select_practice_difficulty}
endscript

script practice_setup_part_and_continue 
	hide_glitch \{num_frames = 4}
	destroy_friend_feed
	getcontrollertype controller = <device_num>
	getfirstplayer
	if (<controller_type> = guitar)
		state = uistate_select_practice_instrument
	elseif (<controller_type> = drum)
		setplayerinfo <player> part = drum
		state = uistate_select_practice_difficulty
	else
		setplayerinfo <player> part = vocals
		state = uistate_select_practice_difficulty
	endif
	vocals_distribute_mics
	ui_event event = menu_change state = <state>
endscript
