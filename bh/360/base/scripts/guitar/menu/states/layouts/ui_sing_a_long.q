in_sing_a_long = false

script ui_init_sing_a_long 
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
	Change \{in_sing_a_long = true}
	if NOT GotParam \{venue}
		venue = $current_level
	endif
	CreateScreenElement {
		type = ContainerElement
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
			Cheat_Invincible = ($Cheat_Invincible)
			disable_all_starpower = ($disable_all_starpower)
			num_mics_plugged_in = 0
		}
		event_handlers = [
			{pad_back ui_sing_a_long_back}
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
	PlayerInfoStore <i>
	i = (<i> + 1)
	repeat 4
	i = 1
	begin
	SetPlayerInfo <i> part = vocals
	SetPlayerInfo <i> scoring = 0
	SetPlayerInfo <i> vocals_highway_view = karaoke
	SetPlayerInfo <i> in_game = 1
	SetPlayerInfo <i> difficulty = beginner
	SetPlayerInfo <i> controller = (<i> - 1)
	i = (<i> + 1)
	repeat 4
	Change \{game_mode = p4_quickplay}
	Change \{Cheat_Invincible = 1}
	Change \{disable_all_starpower = 1}
	GMan_SongFunc \{func = clear_play_list}
	GMan_SongFunc func = set_current_song params = {song = <song>}
	Change g_band_lobby_current_level = <venue>
	kill_all_achievement_scripts
	sing_a_long_container :Obj_SpawnScript \{ui_sing_a_long_spawned}
endscript

script ui_create_sing_a_long 
endscript

script ui_destroy_sing_a_long 
endscript

script ui_deinit_sing_a_long 
	sing_a_long_container :GetTags
	i = 1
	begin
	PlayerInfoRestore <i>
	i = (<i> + 1)
	repeat 4
	if ($invite_controller = -1)
		ui_sing_a_long_remove_controllers_in_game
	endif
	sanity_check_fix_deleted_characters
	Change game_mode = <game_mode>
	Change Cheat_Invincible = <Cheat_Invincible>
	Change disable_all_starpower = <disable_all_starpower>
	DestroyScreenElement \{id = sing_a_long_container}
	destroy_dialog_box
	Change \{in_sing_a_long = false}
endscript

script ui_sing_a_long_spawned 
	SetScriptCannotPause
	GetTags
	ui_event_wait_for_safe
	begin
	if persistent_band_finished_building
		break
	endif
	wait \{1
		gameframe}
	repeat
	ui_event_block \{event = menu_change
		data = {
			state = uistate_play_song
		}}
	begin
	if ui_event_exists_in_stack \{name = 'gameplay'}
		break
	endif
	wait \{1
		gameframe}
	repeat
	ui_event_wait_for_safe
	StartRendering
	LaunchEvent \{type = focus
		target = sing_a_long_container}
	wait \{1
		second}
	begin
	if ScreenElementExists \{id = Vignette_of_failure}
		Vignette_of_failure :SE_SetProps \{hide}
	endif
	if ScreenElementExists \{id = hud_root}
		hud_root :SE_SetProps \{hide}
	endif
	VocalsHighway_GetId \{player = 1}
	if ScreenElementExists id = <vocals_highway_id>
		<vocals_highway_id> :SE_SetProps hide
	endif
	Change \{Cheat_Invincible = 1}
	disable_pause \{nospam}
	ResumeControllerChecking
	ui_sing_a_long_check_disconnect
	ui_sing_a_long_reinit_mics
	ui_sing_a_long_add_controllers_in_game
	wait \{1
		gameframe}
	repeat
endscript

script ui_sing_a_long_check_disconnect 
	get_num_mics_plugged_in
	controllers = 0
	i = 0
	begin
	if IsControllerPluggedIn controller = <i>
		controllers = (<controllers> + 1)
	endif
	i = (<i> + 1)
	repeat 4
	if (<num_mics_plugged_in> = 0 || <controllers> = 0)
		if NOT ScreenElementExists \{id = dialog_box_desc_id}
			sing_a_long_container :SE_SetProps \{block_events}
			do_gh3_pause
			options = [
				{
					func = ui_sing_a_long_popup_back
					text = qs(0x67d9c56d)
					sound_func = nullscript
				}
				{
					func = ui_sing_a_long_resume
					text = qs(0x0e41fe46)
					sound_func = nullscript
				}
			]
			create_dialog_box {
				heading_text = qs(0xaa163738)
				body_text = qs(0x00000000)
				options = <options>
				dlg_z_priority = ($ps3_fade_overlay_z + 100)
				use_all_controllers = 1
			}
			clean_up_user_control_helpers
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 1000000
				all_buttons}
			dialog_box_desc_id :Obj_SpawnScript \{ui_sing_a_long_check_disconnect_update}
		endif
	endif
endscript

script ui_sing_a_long_check_disconnect_update 
	old_text = qs(0x00000000)
	begin
	get_num_mics_plugged_in
	controllers = 0
	i = 0
	begin
	if IsControllerPluggedIn controller = <i>
		controllers = (<controllers> + 1)
	endif
	i = (<i> + 1)
	repeat 4
	if (<num_mics_plugged_in> = 0)
		if isXenon
			if (<controllers> > 0)
				text = qs(0x462b4cd5)
			else
				text = qs(0x97b603ee)
			endif
		else
			if (<controllers> > 0)
				text = qs(0xc5324d0f)
			else
				text = qs(0x5474f973)
			endif
		endif
	elseif (<controllers> = 0)
		if isXenon
			text = qs(0xcd6424e0)
		else
			text = qs(0x66e1f5cd)
		endif
	else
		if isXenon
			text = qs(0xcfd0f5ac)
		else
			text = qs(0x559caf37)
		endif
	endif
	if NOT (<old_text> = <text>)
		SE_SetProps {dlog_body_text = <text>}
		old_text = <text>
	endif
	wait \{1
		gameframe}
	repeat
endscript

script ui_sing_a_long_popup_back 
	sing_a_long_container :Obj_SpawnScript \{ui_sing_a_long_back}
endscript

script ui_sing_a_long_resume 
	get_num_mics_plugged_in
	if (<num_mics_plugged_in> = 0)
		menu_scroll_end_sound
		return
	endif
	generic_menu_pad_back_sound
	do_gh3_unpause
	sing_a_long_container :SE_SetProps \{unblock_events}
	destroy_dialog_box
endscript

script ui_sing_a_long_back 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	SE_SetProps \{block_events}
	songlist_clear_playlist
	GetSingleTag \{back_state}
	if NOT GotParam \{back_state}
		back_state = uistate_mainmenu
	endif
	ui_event_wait_for_safe
	spawnscriptnow \{BG_Crowd_Front_End_Silence}
	StopSound \{$Current_Crowd_Anticipation
		fade_time = 3
		fade_type = log_slow}
	generic_event_back state = <back_state>
endscript

script ui_sing_a_long_start 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT GotParam \{venue}
		venue = $current_level
	endif
	create_venue_loading_screen movie_params = ($LevelZones.$current_level)
	RequireParams \{[
			song
		]
		all}
	songlist_clear_playlist
	ui_event_get_top
	FormatText checksumname = back_state 'uistate_%b' b = <base_name>
	generic_event_choose state = UIstate_sing_a_long data = {song = <song> venue = <venue> back_state = <back_state>}
endscript

script ui_sing_a_long_songlist 
	SE_SetProps \{block_events}
	Change \{current_leaderboard_instrument = 'mic'}
	songlist_clear_playlist
	Change \{game_mode = career}
	Change primary_controller = <device_num>
	generic_event_choose \{state = uistate_songlist
		data = {
			mode = sing_a_long
		}}
endscript

script ui_sing_a_long_reinit_mics 
	GetSingleTag \{num_mics_plugged_in}
	previous_num_mics_plugged_in = <num_mics_plugged_in>
	get_num_mics_plugged_in
	if NOT (<num_mics_plugged_in> = <previous_num_mics_plugged_in>)
		vocals_reset_mics
		if IsPS3
			i = 1
			begin
			ui_sing_a_long_assign_mic player = <i> mic_type = any_mic
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
					ui_sing_a_long_assign_mic player = (<i> + 1) mic_type = any_mic
					num_mics = (<num_mics> - 1)
					count = (<count> + 1)
				endif
				i = (<i> + 1)
				repeat 4
			endif
			GetArraySize <controllers_with_headsets>
			if (<array_size> > 0)
				<index> = (<array_size> - 1)
				begin
				if (<num_mics> = 0 || <count> >= 4)
					break
				endif
				i = (<controllers_with_headsets> [<index>])
				RemoveArrayElement array = <controllers_with_headsets> index = <index>
				<controllers_with_headsets> = <array>
				ui_sing_a_long_assign_mic player = (<i> + 1) mic_type = any_mic
				num_mics = (<num_mics> - 1)
				count = (<count> + 1)
				index = (<index> - 1)
				repeat <array_size>
				GetArraySize <controllers_with_headsets>
				if (<array_size> > 0)
					<index> = 0
					begin
					if (<count> >= 4)
						break
					endif
					i = (<controllers_with_headsets> [<index>])
					<controllers_with_headsets> = <array>
					ui_sing_a_long_assign_mic player = (<i> + 1) mic_type = headset
					count = (<count> + 1)
					index = (<index> + 1)
					repeat <array_size>
				endif
			endif
		endif
		SetTags num_mics_plugged_in = <num_mics_plugged_in>
	endif
endscript

script ui_sing_a_long_assign_mic 
	RequireParams \{[
			player
			mic_type
		]
		all}
	vocals_safely_assign_mic player = <player> mic_type = <mic_type>
	VocalsInput_ReinitMic player = <player>
	mic_set_device_volume player = <player> micvolume = 7
endscript

script ui_sing_a_long_get_num_mics 
	mic = 0
	num_mics = 0
	begin
	if IsMicrophonePluggedIn number = <mic>
		<num_mics> = (<num_mics> + 1)
	endif
	<mic> = (<mic> + 1)
	repeat 4
	return num_mics = <num_mics>
endscript

script ui_sing_a_long_get_controllers_with_headsets 
	if IsPS3
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
	NetSessionFunc \{func = RemoveAllControllers}
endscript
