
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
		alpha = 0.0}
	song_unpause :obj_spawnscript \{ui_song_unpause}
	LaunchEvent \{Type = focus
		target = song_unpause}
endscript

script ui_destroy_song_unpause 
	DestroyScreenElement \{id = song_unpause}
	SpawnScriptNow \{ui_destroy_song_spawned}
endscript

script ui_destroy_song_spawned 
	ui_event_wait_for_safe
	enable_pause
endscript

script ui_song_unpause 
	setscriptcannotpause
	get_song_title song = ($current_song)
	formatText TextName = title_text qs(0x373caef2) s = <song_title>
	se_setprops title_text = <title_text> number_text = qs(0x050c1ef7)
	ui_event_wait_for_safe
	GetSongTime
	get_song_end_time song = ($current_song)
	printstruct <...> channel = Unpause
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
	printstruct {} times = <times>
	SoundEvent \{event = countoff_sfx_sticks_normal_hard}
	Wait ((<times> [0]) / 1000.0) Seconds ignoreslomo
	i = 3
	begin
	formatText TextName = number_text qs(0xc31d83ea) i = <i>
	se_setprops number_text = <number_text>
	SoundEvent \{event = countoff_sfx_sticks_normal_hard}
	Wait ((<times> [(4 - <i>)]) / 1000.0) Seconds ignoreslomo
	i = (<i> - 1)
	repeat 3
	ui_song_unpause_done
endscript

script ui_song_unpause_done 
	setscriptcannotpause
	ui_event_wait_for_safe
	do_gh3_unpause
	ui_event \{event = menu_back
		data = {
			state = Uistate_gameplay
		}}
	if IsObjectScript
		Die
	endif
endscript

script ui_song_unpause_repause 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
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
		printf \{qs(0x20ab9428)
			channel = here}
		generic_menu_pad_choose_sound
		ui_event event = menu_replace state = Uistate_pausemenu data = {device_num = <device_num>}
	endif
endscript

script ui_song_unpause_anim_out 
	StartRendering \{reason = menu_transition}
endscript
