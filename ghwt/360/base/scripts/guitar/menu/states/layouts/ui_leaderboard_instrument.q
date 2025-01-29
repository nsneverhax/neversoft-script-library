
script ui_create_leaderboard_instrument 
	make_menu_frontend {
		screen = GUITARIST
		title = qs(0x8694014b)
		exclusive_device = ($primary_controller)
	}
	add_menu_frontend_item \{text = qs(0x9504b94a)
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'guitar'
		}}
	add_menu_frontend_item \{text = qs(0x7d4f9214)
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'backup'
		}}
	add_menu_frontend_item \{text = qs(0x388cd3db)
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'drums'
		}}
	add_menu_frontend_item \{text = qs(0x1b9f6f84)
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'mic'
		}}
	add_menu_frontend_item \{text = qs(0xdabf99c0)
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'band'
		}}
	menu_finish
endscript

script ui_destroy_leaderboard_instrument 
	generic_ui_destroy
endscript

script ui_leaderboard_instrument_select 
	if (<instrument> = 'band')
		Change \{game_mode = p4_quickplay}
	else
		Change \{game_mode = p1_quickplay}
		switch (<instrument>)
			case 'guitar'
			setplayerinfo \{1
				part = guitar}
			case 'backup'
			setplayerinfo \{1
				part = bass}
			case 'drums'
			setplayerinfo \{1
				part = drum}
			case 'mic'
			setplayerinfo \{1
				part = vocals}
		endswitch
	endif
	formatText checksumName = instrument_checksum '%i' i = <instrument>
	Change current_leaderboard_instrument = <instrument_checksum>
	generic_event_choose \{state = uistate_setlist
		data = {
			from_leaderboard = 1
		}}
endscript
