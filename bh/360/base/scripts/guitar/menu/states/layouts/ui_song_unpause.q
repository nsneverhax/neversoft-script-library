
script ui_create_song_unpause 
	hide_glitch \{num_frames = 4}
	if NOT CD
		if GlobalExists \{name = disable_unpause_countdown}
			if ($disable_unpause_countdown = 1)
				spawnscriptnow \{ui_song_unpause_done}
				return
			endif
		endif
	endif
	if ($transition_playing = true)
		spawnscriptnow \{ui_song_unpause_done}
		return
	endif
	if ($is_network_game)
		spawnscriptnow \{ui_song_unpause_done}
		return
	endif
	if ($game_mode = practice)
		spawnscriptnow \{ui_song_unpause_done}
		return
	endif
	CreateScreenElement \{parent = root_window
		id = song_unpause
		type = DescInterface
		desc = 'song_unpause'
		z_priority = 10000
		alpha = 0.0}
	if song_unpause :Desc_ResolveAlias \{name = alias_dude2_container
			param = unpause_dotted_id}
		<unpause_dotted_id> :Obj_SpawnScript ui_rotate_scale_03
	else
		ScriptAssert \{'drose1'}
	endif
	if song_unpause :Desc_ResolveAlias \{name = alias_dude_container
			param = unpause_circle_id}
		<unpause_circle_id> :Obj_SpawnScript ui_rotate_scale_04
	else
		ScriptAssert \{'drose1'}
	endif
	song_unpause :Obj_SpawnScript \{ui_song_unpause}
	LaunchEvent \{type = focus
		target = song_unpause}
endscript

script ui_destroy_song_unpause 
	DestroyScreenElement \{id = song_unpause}
	spawnscriptnow \{ui_destroy_song_spawned}
endscript

script ui_destroy_song_spawned 
	ui_event_wait_for_safe
	GameMode_GetType
	if NOT (<type> = freeplay)
		if NOT ui_event_exists_in_stack \{above = 'gameplay'
				name = 'song_breakdown'}
			enable_pause
		endif
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
	GMan_SongTool_GetCurrentSong
	SetScriptCannotPause
	get_song_title song = <current_song>
	FormatText TextName = title_text qs(0x373caef2) s = <song_title>
	SE_SetProps title_text = <title_text>
	ui_event_wait_for_safe
	GetSongTime
	SongFileManager func = get_song_end_time song_name = <current_song>
	printstruct <...> channel = UnPause
	if ((<songtime> < 0.0) || ((<songtime> * 1000) >= <total_end_time>))
		ui_song_unpause_done
		return
	endif
	songtime = (<songtime> * 1000)
	SongFileManager func = get_num_fretbar_notes song_name = <current_song>
	i = 0
	begin
	SongFileManager func = get_fretbar_note song_name = <current_song> index = <i>
	if (<songtime> < <fretbar_time>)
		i = (<i> - 1)
		break
	endif
	i = (<i> + 1)
	repeat <num_fretbar_notes>
	if (<i> < 4)
		i = 4
	endif
	song_unpause :SE_SetProps \{alpha = 1.0}
	times = [0.0 0.0 0.0 0.0]
	SongFileManager func = get_fretbar_note song_name = <current_song> index = (<i> + 1)
	<time> = <fretbar_time>
	j = 0
	begin
	SongFileManager func = get_fretbar_note song_name = <current_song> index = (<i> - <j>)
	SetArrayElement arrayName = times index = (3 - <j>) newValue = (<time> - <fretbar_time>)
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
		SetArrayElement arrayName = times index = <time_index2> newValue = ((<times> [<time_index2>]) * 2.0)
		<time_index2> = (<time_index2> + 1)
		repeat 4
	else
		<time_index> = (<time_index> + 1)
		if (<time_index> = 4)
			break
		endif
	endif
	repeat
	idx = 0
	time = (<times> [0])
	begin
	time0 = (<times> [<idx>])
	time1 = (<times> [(<idx> + 1)])
	if (<time0> > <time1>)
		diff = (<time1> / <time0>)
	else
		diff = (<time0> / <time1>)
	endif
	time = ((<time> + <time1>) / 2.0)
	if (<diff> < 0.7)
		time = (<times> [3])
		break
	endif
	idx = (<idx> + 1)
	repeat 3
	get_lag_values
	Obj_GetID
	SoundEvent \{event = Countoff_SFX_Sticks_Normal_Hard}
	<objID> :Obj_SpawnScriptNow fireoff_countdown_by_user_lag params = {video_offset = <video_offset> audio_offset = <audio_offset> i = 4}
	wait (<time> / 1000.0) seconds ignoreslomo
	i = 3
	begin
	<objID> :Obj_SpawnScriptNow fireoff_countdown_by_user_lag params = {video_offset = <video_offset> audio_offset = <audio_offset> i = <i>}
	SoundEvent \{event = Countoff_SFX_Sticks_Normal_Hard}
	wait (<time> / 1000.0) seconds ignoreslomo
	i = (<i> - 1)
	repeat 3
	ui_song_unpause_done
endscript

script fireoff_countdown_by_user_lag 
	wait_time = (<video_offset> - <audio_offset>)
	if (<wait_time> < 0)
		wait_time = 0
	endif
	wait (<wait_time> / 1000.0) seconds
	FormatText TextName = number_text qs(0xc31d83ea) i = <i>
	SE_SetProps number_text = <number_text>
endscript

script ui_song_unpause_done 
	SetScriptCannotPause
	ui_event_wait_for_safe
	do_gh3_unpause
	ui_event \{event = menu_back
		data = {
			state = uistate_gameplay
			repausing = false
		}}
	if IsObjectScript
		Die
	endif
endscript

script ui_song_unpause_repause 
	SetScriptCannotPause
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	killspawnedscript \{name = ui_song_unpause}
	ui_event_wait_for_safe
	if GotParam \{from_system}
		if ui_event_exists_in_stack \{name = 'gameplay'}
			ui_event \{event = menu_back
				data = {
					state = uistate_gameplay
					repausing = true
				}}
		else
			ui_event \{event = menu_back}
		endif
	else
		printf \{qs(0x20ab9428)
			channel = here}
		generic_menu_pad_choose_sound
		ui_event event = menu_replace state = UIstate_pausemenu data = {device_num = <device_num>}
	endif
endscript
