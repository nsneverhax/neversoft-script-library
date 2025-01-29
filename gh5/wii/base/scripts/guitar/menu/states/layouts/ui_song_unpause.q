
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
	CreateScreenElement \{parent = root_window
		id = song_unpause
		Type = descinterface
		desc = 'song_unpause'
		z_priority = 10000
		alpha = 0.0}
	if song_unpause :desc_resolvealias \{Name = alias_dude_container
			param = resume_dude_id}
		<resume_dude_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'drose1'}
	endif
	if song_unpause :desc_resolvealias \{Name = alias_dude_container
			param = resume_dude_id}
		<resume_dude_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'drose1'}
	endif
	if song_unpause :desc_resolvealias \{Name = alias_dude2_container
			param = resume_dude2_id}
		<resume_dude_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'drose1'}
	endif
	if song_unpause :desc_resolvealias \{Name = alias_flame_dude_container
			param = flame_dude_id}
		<flame_dude_id> :obj_spawnscript ui_roto
	else
		ScriptAssert \{'drose1'}
	endif
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
	gamemode_gettype
	if NOT (<Type> = freeplay)
		enable_pause
	endif
	if ($calibrate_lag_enabled = 1)
		setup_pause \{pad_start_script = calibrate_hit_pause}
	endif
endscript

script ui_song_unpause 
	if ($calibrate_lag_enabled = 1)
		ui_song_unpause_done
		return
	endif
	gman_songtool_getcurrentsong
	setscriptcannotpause
	get_song_title song = <current_song>
	formatText TextName = title_text qs(0x373caef2) s = <song_title>
	se_setprops title_text = <title_text> number_text = qs(0x050c1ef7)
	ui_event_wait_for_safe
	GetSongTime
	songfilemanager func = get_song_end_time song_name = <current_song>
	printstruct <...> channel = Unpause
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
	printstruct {} times = <times>
	time_index = 0
	begin
	bpm = (60000.0 / (<times> [<time_index>]))
	if (<bpm> > $unpause_counter_max_bpm)
		time_index2 = 0
		begin
		SetArrayElement ArrayName = times index = <time_index2> NewValue = ((<times> [<time_index2>]) * 2.0)
		<time_index2> = (<time_index2> + 1)
		repeat 4
	else
		<time_index> = (<time_index> + 1)
		if (<time_index> = 4)
			break
		endif
	endif
	repeat
	if is_roadie_battle_mode
		getfaceoffratio
		if (<faceoff_ratio> > 0)
			SoundEvent \{event = roadie_battle_roadie1_repairs1}
		elseif (<faceoff_ratio> = 0)
		else
			SoundEvent \{event = roadie_battle_roadie2_repairs1}
		endif
	endif
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
