
script ui_create_select_practice_instrument 
	gamemode_gettype
	if (<Type> = practice)
		Hide_Band
		hide_crowd_models
	endif
	create_mainmenu_bg
	CreateScreenElement \{Type = descinterface
		parent = root_window
		id = practiceselectinstrumentinterface
		desc = 'practice_menu_popup'
		z_priority = 100
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
				pad_up
				ui_sfx
				params = {
					menustate = Generic
					uitype = scrollup
				}
			}
			{
				pad_down
				ui_sfx
				params = {
					menustate = Generic
					uitype = scrolldown
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
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script ui_destroy_select_practice_instrument 
	destroy_mainmenu_bg
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

script practice_setup_part_and_continue \{device_num = !i1768515945}
	hide_glitch \{num_frames = 4}
	destroy_friend_feed
	unlock_all_controllers
	getcontrollertype controller = <device_num>
	lock_all_controllers
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
	playlist_getcurrentsong
	if load_song_from_sd_needed song_name = <current_song>
		CreateScreenElement \{Type = ContainerElement
			parent = root_window
			id = practice_sd_eject_listener
			event_handlers = [
				{
					sdcard_event
					practice_sd_eject_back_to_songlist
				}
			]}
	endif
	vocals_distribute_mics
	ui_event event = menu_change state = <state>
endscript

script practice_sd_eject_back_to_songlist 
	ui_event_wait_for_safe
	LaunchEvent \{Type = unfocus
		target = current_menu}
	wii_dlc_get_error_text \{error_crc = cntsd_result_sd_ejected}
	create_dialog_box {
		no_background
		heading_text = qs(0x79597197)
		dlg_z_priority = 1500
		body_text = <error_text>
		options = [
			{
				func = practice_error_loading_destroy_dialog
				text = qs(0x9bc5dae4)
			}
		]
	}
	if ScreenElementExists \{id = practice_sd_eject_listener}
		DestroyScreenElement \{id = practice_sd_eject_listener}
	endif
endscript

script practice_error_loading_destroy_dialog 
	destroy_dialog_box
	if ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'songlist'}
		generic_event_back \{state = uistate_songlist}
	else
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript
