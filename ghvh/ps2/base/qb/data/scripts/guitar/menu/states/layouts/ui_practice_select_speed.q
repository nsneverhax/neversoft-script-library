
script ui_create_practice_select_speed 
	if 0x8658e568
		destroy_loading_screen
	endif
	Change menu_flow_locked = ($menu_flow_locked + 1)
	getplayerinfo \{1
		part}
	if (<part> = vocals && $game_mode = training)
		SpawnScriptLater \{menu_choose_practice_speed_auto_go_to_gameplay_for_vocals}
		return
	endif
	make_menu_frontend \{title = qs(0x452d8770)
		spacing_between = -15}
	add_item_script = add_menu_frontend_item
	create_frontend_bg
	<speeds> = [
		{
			text = qs(0xab4bfb64)
			speed = full
			desc = 'menu_tape_01'
		}
		{
			text = qs(0x0f639d5c)
			speed = slow
			desc = 'menu_tape_02'
		}
		{
			text = qs(0x8e382995)
			speed = slower
			desc = 'menu_tape_03'
		}
		{
			text = qs(0x28ef973e)
			speed = slowest
			desc = 'menu_tape_04'
		}
	]
	getplayerinfo \{1
		part}
	GetArraySize <speeds>
	i = 0
	begin
	if (<part> = vocals && (<speeds> [<i>].speed) != full)
		focusable = {not_focusable}
	else
		RemoveParameter \{focusable}
	endif
	add_menu_frontend_item {
		text = (<speeds> [<i>].text)
		desc = (<speeds> [<i>].desc)
		pad_choose_script = menu_choose_practice_speed_set_speed
		pad_choose_params = {speed = (<speeds> [<i>].speed) from_pause = <from_pause> from_song_breakdown = <from_song_breakdown>}
		<focusable>
	}
	i = (<i> + 1)
	repeat <array_Size>
	menu_finish
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_practice_select_speed 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	cleanup_frontend_bg
	generic_ui_destroy
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_deinit_practice_select_speed 
	create_loading_screen \{spawn}
endscript

script menu_choose_practice_speed_set_speed \{speed = full}
	switch <speed>
		case full
		Change \{current_speedfactor = 1.0}
		case slow
		Change \{current_speedfactor = 0.8}
		case slower
		Change \{current_speedfactor = 0.66666675}
		case slowest
		Change \{current_speedfactor = 0.5}
	endswitch
	if GotParam \{from_song_breakdown}
		practice_restart_song
		generic_event_back \{state = Uistate_gameplay}
	elseif NOT GotParam \{from_pause}
		generic_event_choose \{state = uistate_play_song}
	else
		restart_warning_select_restart \{dont_save_song_data}
	endif
endscript

script menu_choose_practice_speed_auto_go_to_gameplay_for_vocals 
	ui_event_wait_for_safe
	generic_event_choose \{state = uistate_play_song}
endscript
