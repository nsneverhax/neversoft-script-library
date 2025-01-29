in_sing_a_long = FALSE

script ui_init_sing_a_long 
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
	Change \{in_sing_a_long = true}
	if NOT GotParam \{venue}
		venue = $current_level
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = sing_a_long_container
		parent = root_window
		pos_anchor = [left top]
		just = [left top]
		dims = (1280.0, 720.0)
		tags = {
			back_state = <back_state>
			song = <song>
			venue = <venue>
			game_mode = ($game_mode)
			cheat_invincible = ($cheat_invincible)
			disable_all_starpower = ($disable_all_starpower)
			num_mics_plugged_in = 0
		}
		event_handlers = [
			{pad_circle ui_sing_a_long_back}
		]
	}
	add_user_control_helper {
		override_parent = sing_a_long_container
		button = red text = qs(0x67d9c56d)
		Pos = (0.0, -72.0)
		just = [center top]
		pos_anchor = [center bottom]
		controller = ($primary_controller)
		all_buttons
	}
	i = 1
	begin
	playerinfostore <i>
	i = (<i> + 1)
	repeat 4
	i = 1
	begin
	setplayerinfo <i> part = vocals
	setplayerinfo <i> scoring = 0
	setplayerinfo <i> vocals_highway_view = karaoke
	setplayerinfo <i> in_game = 1
	setplayerinfo <i> difficulty = beginner
	setplayerinfo <i> controller = (<i> - 1)
	i = (<i> + 1)
	repeat 4
	Change \{game_mode = quickplay}
	Change \{cheat_invincible = 1}
	Change \{disable_all_starpower = 1}
	playlist_clear
	playlist_addsong song = <song>
	Change g_band_lobby_current_level = <venue>
	kill_all_achievement_scripts
	sing_a_long_container :obj_spawnscript \{ui_sing_a_long_spawned}
endscript

script ui_create_sing_a_long 
endscript

script ui_destroy_sing_a_long 
endscript

script ui_deinit_sing_a_long 
	sing_a_long_container :GetTags
	i = 1
	begin
	playerinforestore <i>
	i = (<i> + 1)
	repeat 4
	if ($invite_controller = -1)
		ui_sing_a_long_remove_controllers_in_game
	endif
	sanity_check_fix_deleted_characters
	Change game_mode = <game_mode>
	Change cheat_invincible = <cheat_invincible>
	Change disable_all_starpower = <disable_all_starpower>
	DestroyScreenElement \{id = sing_a_long_container}
	destroy_dialog_box
	Change \{in_sing_a_long = FALSE}
endscript

script ui_sing_a_long_spawned 
	setscriptcannotpause
	GetTags
	printstruct <...> channel = Lars
	ui_event_wait_for_safe
	begin
	if persistent_band_finished_building
		break
	endif
	Wait \{1
		gameframe}
	repeat
	ui_event_block \{event = menu_change
		data = {
			state = uistate_play_song
		}}
	begin
	if ui_event_exists_in_stack \{Name = 'gameplay'}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	ui_event_wait_for_safe
	StartRendering
	LaunchEvent \{Type = focus
		target = sing_a_long_container}
	Wait \{1
		Second}
	begin
	if ScreenElementExists \{id = vignette_of_failure}
		vignette_of_failure :se_setprops \{Hide}
	endif
	if ScreenElementExists \{id = hud_root}
		hud_root :se_setprops \{Hide}
	endif
	<Player> = 1
	begin
	vocalshighway_getid Player = <Player>
	if ScreenElementExists id = <vocals_highway_id>
		<vocals_highway_id> :se_setprops Hide
	endif
	<Player> = (<Player> + 1)
	repeat 4
	Change \{cheat_invincible = 1}
	ResumeControllerChecking
	ui_sing_a_long_reinit_mics
	ui_sing_a_long_add_controllers_in_game
	Wait \{1
		gameframe}
	repeat
endscript

script ui_sing_a_long_back 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = Generic
		uitype = back}
	se_setprops \{block_events}
	songlist_clear_playlist
	GetSingleTag \{back_state}
	if NOT GotParam \{back_state}
		back_state = uistate_mainmenu
	endif
	ui_event_wait_for_safe
	stopsound \{$g_current_crowd_anticipation
		fade_time = 3
		fade_type = log_slow}
	generic_event_back state = <back_state>
endscript

script ui_sing_a_long_reinit_mics 
	GetSingleTag \{num_mics_plugged_in}
	previous_num_mics_plugged_in = <num_mics_plugged_in>
	get_num_mics_plugged_in
	if NOT (<num_mics_plugged_in> = <previous_num_mics_plugged_in>)
		vocals_reset_mics
		if isps3
			i = 1
			begin
			ui_sing_a_long_assign_mic Player = <i> mic_type = any_mic
			i = (<i> + 1)
			repeat 4
		else
			ui_sing_a_long_get_controllers_with_headsets
			ui_sing_a_long_get_num_mics
			total_mics = <num_mics>
			count = 0
			if (<total_mics> > 0)
				i = 0
				begin
				if (<count> >= <total_mics>)
					break
				endif
				if NOT ArrayContains array = <controllers_with_headsets> contains = <i>
					ui_sing_a_long_assign_mic Player = (<i> + 1) mic_type = any_mic
					num_mics = (<num_mics> - 1)
					count = (<count> + 1)
				endif
				i = (<i> + 1)
				repeat 4
			endif
			GetArraySize <controllers_with_headsets>
			if (<array_Size> > 0)
				<index> = (<array_Size> - 1)
				begin
				if (<num_mics> = 0 || <count> >= 4)
					break
				endif
				i = (<controllers_with_headsets> [<index>])
				RemoveArrayElement array = <controllers_with_headsets> index = <index>
				<controllers_with_headsets> = <array>
				ui_sing_a_long_assign_mic Player = (<i> + 1) mic_type = any_mic
				num_mics = (<num_mics> - 1)
				count = (<count> + 1)
				index = (<index> - 1)
				repeat <array_Size>
				GetArraySize <controllers_with_headsets>
				if (<array_Size> > 0)
					<index> = 0
					begin
					if (<count> >= 4)
						break
					endif
					i = (<controllers_with_headsets> [<index>])
					<controllers_with_headsets> = <array>
					ui_sing_a_long_assign_mic Player = (<i> + 1) mic_type = headset
					count = (<count> + 1)
					index = (<index> + 1)
					repeat <array_Size>
				endif
			endif
		endif
		SetTags num_mics_plugged_in = <num_mics_plugged_in>
	endif
endscript

script ui_sing_a_long_assign_mic 
	RequireParams \{[
			Player
			mic_type
		]
		all}
	vocals_safely_assign_mic Player = <Player> mic_type = <mic_type>
	vocalsinput_reinitmic Player = <Player>
	mic_set_device_volume Player = <Player> micvolume = 7
endscript

script ui_sing_a_long_get_num_mics 
	mic = 0
	num_mics = 0
	begin
	if ismicrophonepluggedin number = <mic>
		<num_mics> = (<num_mics> + 1)
	endif
	<mic> = (<mic> + 1)
	repeat 4
	return num_mics = <num_mics>
endscript

script ui_sing_a_long_get_controllers_with_headsets 
	if isps3
		return \{controllers_with_headsets = [
			]}
	endif
	array = []
	controller = 0
	begin
	if controller_has_headset controller = <controller>
		AddArrayElement array = <array> element = <controller>
	endif
	controller = (<controller> + 1)
	repeat 4
	return controllers_with_headsets = <array>
endscript

script ui_sing_a_long_add_controllers_in_game 
	ui_sing_a_long_remove_controllers_in_game
	add_active_controllers_local
endscript

script ui_sing_a_long_remove_controllers_in_game 
	NetSessionFunc \{func = removeallcontrollers}
endscript
