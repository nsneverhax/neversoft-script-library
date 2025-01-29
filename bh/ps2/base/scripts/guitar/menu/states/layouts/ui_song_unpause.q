
script 0x57ddb8a5 
	disable_pause
endscript

script ui_create_song_unpause 
	if ($transition_playing = true)
		0x93d8d5cf \{'Attempted to put up unpause countdown when a transition was playing.'}
		SpawnScriptNow \{unpausegh3}
		return
	endif
	CreateScreenElement \{parent = root_window
		id = song_unpause
		Type = descinterface
		desc = 'song_unpause'
		z_priority = 10000
		alpha = 0.0}
	if song_unpause :desc_resolvealias \{Name = alias_dude2_container
			param = 0xc992c555}
		<0xc992c555> :obj_spawnscript ui_rotate_scale_03
	else

	endif
	if song_unpause :desc_resolvealias \{Name = alias_dude_container
			param = 0xa333a316}
		<0xa333a316> :obj_spawnscript 0x1a6095a7
	else

	endif
	song_unpause :obj_spawnscript \{ui_song_unpause}
	LaunchEvent \{Type = focus
		target = song_unpause}
endscript

script ui_destroy_song_unpause 
	DestroyScreenElement \{id = song_unpause}
	if ($calibrate_lag_enabled = 1)
		setup_pause \{pad_start_script = calibrate_hit_pause}
	endif
endscript

script ui_song_unpause 
	gman_songtool_getcurrentsong
	setscriptcannotpause
	get_song_title song = <current_song>
	formatText TextName = title_text qs(0x373caef2) s = <song_title>
	se_setprops title_text = <title_text> number_text = qs(0x050c1ef7)
	ui_event_wait_for_safe
	GetSongTime
	songfilemanager func = get_song_end_time song_name = <current_song>

	if ((<songtime> < 0.0) || ((<songtime> * 1000) >= <total_end_time>))
		ui_song_unpause_done
		return
	endif
	songtime = (<songtime> * 1000)
	songfilemanager func = get_num_fretbar_notes song_name = <current_song>
	i = 0
	begin
	songfilemanager func = get_fretbar_note song_name = <current_song> index = <i>
	if (<songtime> < <fretbar_time>)
		i = (<i> - 1)
		break
	endif
	i = (<i> + 1)
	repeat <num_fretbar_notes>
	if (<i> < 4)
		i = 4
	endif
	song_unpause :se_setprops \{alpha = 1.0}
	times = [0.0 0.0 0.0 0.0]
	songfilemanager func = get_fretbar_note song_name = <current_song> index = (<i> + 1)
	<time> = <fretbar_time>
	j = 0
	begin
	songfilemanager func = get_fretbar_note song_name = <current_song> index = (<i> - <j>)
	SetArrayElement ArrayName = times index = (3 - <j>) NewValue = (<time> - <fretbar_time>)
	time = <fretbar_time>
	j = (<j> + 1)
	repeat 4
	SoundEvent \{event = countoff_sfx_sticks_normal_hard}
	Wait ((<times> [0]) / 1000.0) Seconds ignoreslomo
	i = 3
	begin
	if (<i> = 1)
		0xa0f36ddb = ((<times> [(4 - <i>)]) / 1000.0 + 0.1)
		SpawnScriptNow 0xc20c8a0d params = {time = <0xa0f36ddb>}
	endif
	formatText TextName = number_text qs(0xc31d83ea) i = <i>
	se_setprops number_text = <number_text>
	SoundEvent \{event = countoff_sfx_sticks_normal_hard}
	Wait ((<times> [(4 - <i>)]) / 1000.0) Seconds ignoreslomo
	i = (<i> - 1)
	repeat 3
	ui_song_unpause_done
endscript

script ui_song_unpause_done 
	0xd3f993c8 \{sustain}
	OnExitRun \{0xe5a305c6}
	setscriptcannotpause
	ui_event_wait_for_safe
	SpawnScriptNow \{unpausegh3}
	Block
endscript

script ui_song_unpause_repause 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	disable_pause
	KillSpawnedScript \{Name = ui_song_unpause}
	ui_event_wait event = menu_replace state = Uistate_pausemenu data = {device_num = <device_num>} 0xd1b494c2
endscript

script 0xc20c8a0d \{time = 1.0}
	SetButtonEventMappings \{block_menu_input}
	Wait <time> Seconds ignoreslomo
	SetButtonEventMappings \{unblock_menu_input}
endscript
