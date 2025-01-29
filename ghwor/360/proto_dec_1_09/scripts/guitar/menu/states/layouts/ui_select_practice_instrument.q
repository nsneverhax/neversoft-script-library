
script ui_create_select_practice_instrument 
	CreateScreenElement \{Type = descinterface
		parent = root_window
		id = practiceselectinstrumentinterface
		desc = 'practice_menu_popup'
		practice_head_text = qs(0xd667f733)}
	practiceselectinstrumentinterface :desc_resolvealias \{Name = alias_menu}
	AssignAlias id = <resolved_id> alias = current_menu
	current_menu :se_setprops \{event_handlers = [
			{
				pad_back
				ui_sfx
				params = {
					menustate = Generic
					uitype = back
				}
			}
			{
				pad_back
				generic_event_back
			}
		]}
	CreateScreenElement \{Type = descinterface
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
	CreateScreenElement \{Type = descinterface
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
		button = green}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script ui_destroy_select_practice_instrument 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = practiceselectinstrumentinterface}
		DestroyScreenElement \{id = practiceselectinstrumentinterface}
	endif
endscript

script practice_choose_instrument 
	ui_sfx \{menustate = Generic
		uitype = select}
	getfirstplayer
	setplayerinfo <Player> part = <instrument>
	get_progression_instrument_user_option part = <instrument> controller = <device_num> option = 'hyperspeed'
	if (<user_option> != -1)
		setplayerinfo <Player> cheat_hyperspeed_value = <user_option>
	endif
	generic_event_choose \{state = uistate_select_practice_difficulty}
endscript

script practice_setup_part_and_continue 
	getcontrollertype controller = <device_num>
	getfirstplayer
	if (<controller_type> = guitar)
		state = uistate_select_practice_instrument
	elseif (<controller_type> = drum)
		setplayerinfo <Player> part = drum
		state = uistate_select_practice_difficulty
	else
		setplayerinfo <Player> part = vocals
		state = uistate_select_practice_difficulty
	endif
	vocals_distribute_mics
	ui_event event = menu_change state = <state>
endscript
