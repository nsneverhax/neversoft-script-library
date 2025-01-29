
script ui_create_song_unpause 
	if NOT CD
		if GlobalExists \{Name = disable_unpause_countdown}
			if ($disable_unpause_countdown = 1)
				SpawnScriptNow \{ui_song_unpause_done}
				return
			endif
		endif
	endif
	if ($transition_playing = true)
		SpawnScriptNow \{ui_song_unpause_done}
		return
	endif
	if ($is_network_game)
		SpawnScriptNow \{ui_song_unpause_done}
		return
	endif
	if ($game_mode = training)
		SpawnScriptNow \{ui_song_unpause_done}
		return
	endif
	CreateScreenElement \{parent = root_window
		id = song_unpause
		Type = descinterface
		desc = 'song_unpause'
		z_priority = 10000
		alpha = 0.0
		just = [
			center
			center
		]
		pos_anchor = [
			center
			center
		]}
	song_unpause :obj_spawnscript \{ui_song_unpause}
	SoundEvent \{event = Generic_Menu_Back_SFX}
	LaunchEvent \{Type = focus
		target = song_unpause}
endscript

script ui_destroy_song_unpause 
	DestroyScreenElement \{id = song_unpause}
	SpawnScriptNow \{ui_destroy_song_spawned}
endscript

script ui_destroy_song_spawned 
	ui_event_wait_for_safe
	if NOT ($game_mode = training)
		enable_pause
	endif
endscript

script ui_song_unpause 
	setscriptcannotpause
	get_song_title song = ($current_song)
	formatText TextName = title_text qs(0x373caef2) s = <song_title>
	se_setprops title_text = <title_text> number_text = qs(0x5f9982a2)
	ui_event_wait_for_safe
	GetSongTime
	get_song_end_time song = ($current_song)
	if ((<songtime> < 0.0) || ((<songtime> * 1000) >= <total_end_time>))
		ui_song_unpause_done
		return
	endif
	songtime = (<songtime> * 1000)
	get_song_prefix song = ($current_song)
	formatText checksumName = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup
	GetArraySize $<fretbar_array>
	i = 0
	begin
	if (<songtime> < ($<fretbar_array> [<i>]))
		i = (<i> - 1)
		break
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if (<i> < 4)
		i = 4
	endif
	song_unpause :se_setprops \{alpha = 1.0}
	times = [0.0 0.0 0.0 0.0]
	<time> = ($<fretbar_array> [(<i> + 1)])
	j = 0
	begin
	SetArrayElement ArrayName = times index = (3 - <j>) NewValue = (<time> - ($<fretbar_array> [(<i> - <j>)]))
	time = ($<fretbar_array> [(<i> - <j>)])
	j = (<j> + 1)
	repeat 4
	SoundEvent \{event = countoff_sfx_sticks_normal_hard}
	if (<times> [0] < 240)
		Wait (((<times> [0]) * 2) / 1000.0) Seconds ignoreslomo
	else
		Wait ((<times> [0]) / 1000.0) Seconds ignoreslomo
	endif
	i = 3
	begin
	if (<i> = 1)
		0xa0f36ddb = ((<times> [(4 - <i>)]) / 1000.0 + 0.1)
		SpawnScriptNow 0xc20c8a0d params = {time = <0xa0f36ddb>}
	endif
	formatText TextName = number_text qs(0xc31d83ea) i = <i>
	se_setprops number_text = <number_text>
	SoundEvent \{event = countoff_sfx_sticks_normal_hard}
	if (<times> [0] < 240)
		Wait (((<times> [(4 - <i>)] * 2)) / 1000.0) Seconds ignoreslomo
	else
		Wait ((<times> [(4 - <i>)]) / 1000.0) Seconds ignoreslomo
	endif
	i = (<i> - 1)
	repeat 3
	ui_song_unpause_done
endscript

script ui_song_unpause_animate 
endscript

script ui_song_unpause_done 
	setscriptcannotpause
	ui_event_wait_for_safe
	SpawnScriptLater \{0x915ef5d8}
	ui_event \{event = menu_back
		data = {
			state = Uistate_gameplay
		}}
	if IsObjectScript
		Die
	endif
endscript

script 0x915ef5d8 
	Wait \{10
		gameframes
		ignoreslomo}
	do_gh3_unpause
endscript

script ui_song_unpause_repause 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	disable_pause
	KillSpawnedScript \{Name = ui_song_unpause}
	ui_event_wait_for_safe
	if GotParam \{from_system}
		if ui_event_exists_in_stack \{Name = 'gameplay'}
			ui_event \{event = menu_back
				data = {
					state = Uistate_gameplay
				}}
		else
			ui_event \{event = menu_back}
		endif
	else

		generic_menu_pad_choose_sound
		ui_event event = menu_replace state = Uistate_pausemenu data = {device_num = <device_num>}
	endif
	ui_event_wait_for_safe
	enable_pause
endscript

script 0xc20c8a0d \{time = 1.0}
	SetButtonEventMappings \{block_menu_input}
	Wait <time> Seconds ignoreslomo
	SetButtonEventMappings \{unblock_menu_input}
endscript
