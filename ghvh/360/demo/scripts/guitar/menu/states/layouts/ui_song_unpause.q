
script ui_create_song_unpause 
	if NOT cd
		if globalexists \{name = disable_unpause_countdown}
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
	if ($game_mode = training)
		spawnscriptnow \{ui_song_unpause_done}
		return
	endif
	createscreenelement \{parent = root_window
		id = song_unpause
		type = descinterface
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
	song_unpause :obj_spawnscript \{ui_song_unpause_animate}
	soundevent \{event = generic_menu_back_sfx}
	launchevent \{type = focus
		target = song_unpause}
endscript

script ui_destroy_song_unpause 
	destroyscreenelement \{id = song_unpause}
	spawnscriptnow \{ui_destroy_song_spawned}
endscript

script ui_destroy_song_spawned 
	ui_event_wait_for_safe
	if ($playing_song = 1)
		if NOT ($game_mode = training)
			enable_pause
		endif
	endif
endscript

script ui_song_unpause 
	setscriptcannotpause
	get_song_title song = ($current_song)
	formattext textname = title_text qs(0x373caef2) s = <song_title>
	se_setprops title_text = <title_text> number_text = qs(0x050c1ef7)
	if screenelementexists \{id = intro_container}
		printf \{channel = ui
			qs(0x396171a8)}
		destroyscreenelement \{id = intro_container}
	endif
	ui_event_wait_for_safe
	getsongtime
	get_song_end_time song = ($current_song)
	printstruct <...> channel = unpause
	if ((<songtime> < 0.0) || ((<songtime> * 1000) >= <total_end_time>))
		ui_song_unpause_done
		return
	endif
	songtime = (<songtime> * 1000)
	get_song_prefix song = ($current_song)
	formattext checksumname = fretbar_array '%s_fretbars' s = <song_prefix> addtostringlookup
	getarraysize $<fretbar_array>
	i = 0
	begin
	if (<songtime> < ($<fretbar_array> [<i>]))
		i = (<i> - 1)
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (<i> < 4)
		i = 4
	endif
	song_unpause :se_setprops \{alpha = 1.0}
	times = [0.0 0.0 0.0 0.0]
	<time> = ($<fretbar_array> [(<i> + 1)])
	j = 0
	begin
	setarrayelement arrayname = times index = (3 - <j>) newvalue = (<time> - ($<fretbar_array> [(<i> - <j>)]))
	time = ($<fretbar_array> [(<i> - <j>)])
	j = (<j> + 1)
	repeat 4
	printstruct {} times = <times>
	soundevent \{event = countoff_sfx_sticks_normal_hard}
	wait ((<times> [0]) / 1000.0) seconds ignoreslomo
	i = 3
	begin
	formattext textname = number_text qs(0xc31d83ea) i = <i>
	se_setprops number_text = <number_text>
	soundevent \{event = countoff_sfx_sticks_normal_hard}
	wait ((<times> [(4 - <i>)]) / 1000.0) seconds ignoreslomo
	i = (<i> - 1)
	repeat 3
	ui_song_unpause_done
endscript

script ui_song_unpause_animate 
	onexitrun \{ui_mainmenu_anim_in_spawned_cleanup}
	wait \{0.04
		seconds}
	se_setprops \{scale = 1.75}
	ui_fx_set_blur \{amount = 1.6700001
		time = 0.04}
	wait \{0.02
		seconds}
	se_setprops \{scale = 2.0}
	ui_fx_set_blur \{amount = 1.75
		time = 0.04}
	wait \{0.02
		seconds}
	se_setprops \{scale = 1.75}
	ui_fx_set_blur \{amount = 1.6700001
		time = 0.04}
	wait \{0.02
		seconds}
	ui_fx_set_blur \{amount = 1.3299999
		time = 0.04}
	se_setprops \{scale = 1.0}
	wait \{0.04
		seconds}
	ui_fx_set_blur \{amount = 0.0
		time = 0.04}
	wait \{0.04
		seconds}
endscript

script ui_song_unpause_done 
	setscriptcannotpause
	ui_event_wait_for_safe
	if ($paused_for_hardware = 1)
		return
	endif
	do_gh3_unpause
	ui_event \{event = menu_back
		data = {
			state = uistate_gameplay
		}}
	if isobjectscript
		die
	endif
endscript

script ui_song_unpause_repause 
	setscriptcannotpause
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	disable_pause
	killspawnedscript \{name = ui_song_unpause}
	ui_event_wait_for_safe
	if gotparam \{from_system}
		if ui_event_exists_in_stack \{name = 'gameplay'}
			ui_event \{event = menu_back
				data = {
					state = uistate_gameplay
				}}
		else
			ui_event \{event = menu_back}
		endif
	else
		printf \{qs(0x20ab9428)
			channel = here}
		generic_menu_pad_choose_sound
		ui_event event = menu_replace state = uistate_pausemenu data = {device_num = <device_num>}
	endif
	ui_event_wait_for_safe
	enable_pause
endscript
