
script ui_create_practice_select_speed 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	getplayerinfo \{1
		part}
	if (<part> = vocals && $game_mode = practice)
		SpawnScriptLater \{menu_choose_practice_speed_auto_go_to_gameplay_for_vocals}
		Change menu_flow_locked = ($menu_flow_locked - 1)
		return
	endif
	if GotParam \{from_pause}
		make_generic_menu {
			title = qs(0x452d8770)
			exclusive_device = <player_device>
			centered
			extra_z = 1000
			bg_pos = (200.0, 0.0)
			title_bg_pos = (620.0, 50.0)
		}
	else
		0x5e1a3a04 \{title = qs(0x452d8770)}
	endif
	<speeds> = [
		{
			text = qs(0xe73aac0d)
			speed = full
		}
		{
			text = qs(0x3d7913f6)
			speed = slow
		}
		{
			text = qs(0x0a09c6b9)
			speed = slower
		}
		{
			text = qs(0xb4efa3ea)
			speed = slowest
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
	if GotParam \{from_pause}
		add_menu_frontend_item {
			text = (<speeds> [<i>].text)
			pad_choose_script = menu_choose_practice_speed_set_speed
			pad_choose_params = {speed = (<speeds> [<i>].speed) from_pause = <from_pause> from_song_breakdown = <from_song_breakdown>}
			<focusable>
		}
	elseif StructureContains structure = <focusable> not_focusable
		0x9d0992fe {
			text = (<speeds> [<i>].text)
			pad_choose_script = nullscript
			pad_choose_sound = ui_bonus_videos_negative_sfx
			focus_rgba = [160 150 140 175]
			unfocus_rgba = [160 150 140 175]
		}
	else
		0x9d0992fe {
			text = (<speeds> [<i>].text)
			pad_choose_script = menu_choose_practice_speed_set_speed
			pad_choose_params = {speed = (<speeds> [<i>].speed) from_pause = <from_pause> from_song_breakdown = <from_song_breakdown>}
		}
	endif
	i = (<i> + 1)
	repeat <array_Size>
	0x87679bf6 \{z_offset = 200.0}
	menu_finish
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_practice_select_speed 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	0xafd96096
	generic_ui_destroy
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script menu_choose_practice_speed_set_speed \{speed = full}
	Change \{0x0fda6dc9 = 1}
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
