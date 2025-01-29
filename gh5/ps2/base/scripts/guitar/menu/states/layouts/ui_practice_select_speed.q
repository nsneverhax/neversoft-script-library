
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
		make_menu_frontend \{title = qs(0x452d8770)}
	endif
	<speeds> = [
		{
			text = qs(0x9c71754c)
			speed = full
		}
		{
			text = qs(0x3d7913f6)
			speed = slow
		}
		{
			text = qs(0x52bac34b)
			speed = slower
		}
		{
			text = qs(0xe20f8ce9)
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
	add_menu_frontend_item {
		text = (<speeds> [<i>].text)
		pad_choose_script = menu_choose_practice_speed_set_speed
		pad_choose_params = {speed = (<speeds> [<i>].speed) from_pause = <from_pause> from_song_breakdown = <from_song_breakdown>}
		<focusable>
	}
	i = (<i> + 1)
	repeat <array_Size>
	if <desc_id> :desc_resolvealias Name = 0xa954edbf param = 0xa1309942
		<0xa1309942> :se_setprops dims = (685.04926, 670.0)
		<0xa1309942> :se_setprops Pos = (950.0, 325.0)
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xd389b1ff param = 0xb9ea5094
		<0xb9ea5094> :se_setprops dims = (685.04926, 670.0)
		<0xb9ea5094> :se_setprops Pos = (950.0, 325.0)
		<0xb9ea5094> :obj_spawnscript 0xd5b5a21b params = {0xc2c7c0e4}
	else

	endif
	menu_finish
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_practice_select_speed 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	generic_ui_destroy
	KillSpawnedScript \{Name = career_menu_jaw_anim}
	Change menu_flow_locked = ($menu_flow_locked - 1)
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
