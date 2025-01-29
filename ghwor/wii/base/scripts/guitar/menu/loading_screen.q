g_in_loading_screen = 0
g_loading_screen_is_for_invite = 0

script create_venue_loading_screen \{movie_params = 0x69696969
		destroy_script = nullscript}
	printscriptinfo \{'create_venue_loading_screen'}
	create_loading_screen {
		loading_screen_type = static
		destroy_script = <destroy_script>
	}
endscript

script create_empty_loading_screen \{use_ui_element = None
		destroy_script = nullscript}
	create_loading_screen {
		loading_screen_type = empty
		use_ui_element = <use_ui_element>
		destroy_script = <destroy_script>
	}
endscript

script create_loading_screen \{use_ui_element = None
		loading_screen_type = static
		destroy_script = nullscript
		saving_warning = 0
		for_invite = 0}
	printscriptinfo \{'create_loading_screen'}
	disable_pause
	Change g_loading_screen_is_for_invite = <for_invite>
	audio_ui_menu_music_off \{setflag = 1}
	if ($is_changing_levels = 1)
		return
	endif
	if ScreenElementExists \{id = loading_screen_container}
		return
	endif
	if ($g_in_loading_screen = 1)
		return
	endif
	wii_timer_start \{label = 'loading_screen'}
	Change \{is_changing_levels = 1}
	Change \{g_in_loading_screen = 1}
	pushunsafeforshutdown \{context = loading_screen
		Type = unchecked}
	push_block_home_button
	halt_wii_notifications
	destroy_wii_invites_menu
	push_disable_wii_invites_menu
	if (<loading_screen_type> = bink)
		loading_screen_type = static
	endif
	if (<loading_screen_type> = static)
		SpawnScriptNow show_static_loading_screen_spawned params = {
			saving_warning = <saving_warning>
			display_params = {
			}
		}
		return
	endif
	if (<loading_screen_type> = empty)
		if (<use_ui_element> != None)
			AssignAlias id = <use_ui_element> alias = loading_screen_container
			loading_screen_container :SetTags {
				destroy_script = <destroy_script>
			}
		endif
		return
	endif
	if (<loading_screen_type> != bink)
		ScriptAssert 'loading_screen_type is invalid: %a' a = <loading_screen_type>
	endif
	desc = 'loading'
	loading_text = qs(0xfab8f6e7)
	if GotParam \{leaderboard}
		loading_text = qs(0x10ce7efd)
	endif
	if (<use_ui_element> = None)
		CreateScreenElement {
			Type = descinterface
			parent = root_window
			desc = <desc>
			id = loading_screen_container
			loading_text = qs(0x03ac90f0)
			tip_text = qs(0x03ac90f0)
			z_priority = 500000
		}
	else
		AssignAlias id = <use_ui_element> alias = loading_screen_container
	endif
	loading_screen_container :SetTags {
		loading_text = <loading_text>
		tip_text = qs(0x03ac90f0)
		destroy_script = <destroy_script>
	}
	if GotParam \{spawn}
		loading_screen_container :Obj_SpawnScriptNow \{create_bink_loading_screen_spawned
			params = {
			}}
	else
		create_bink_loading_screen_spawned {
		}
	endif
	wii_timer_stop \{label = 'loading_screen'}
endscript

script create_bink_loading_screen_spawned {
	}
	ScriptAssert \{'create_bink_loading_screen_spawned'}
endscript

script destroy_loading_screen \{wait_for_end = 0}
	printscriptinfo \{'destroy_loading_screen'}
	if ($hold_loading_screen = 1)
		Change \{is_changing_levels = 0}
		popunsafeforshutdown \{context = loading_screen
			Type = unchecked}
		fadetoblack \{OFF
			time = 0
			no_wait}
		return
	endif
	if ($autolaunch_go != -1)
		<wait_for_end> = 0
	endif
	if ($g_in_loading_screen = 1)
		if NOT ScriptIsRunning \{destroy_loading_screen_spawned}
			finalprintf \{'destroy_loading_screen - $g_in_loading_screen = 1 ... destroying'}
			SpawnScriptNow destroy_loading_screen_spawned params = {wait_for_end = <wait_for_end>}
			HideLoadingScreen
			if ($playing_song = 0 || $end_credits = 1)
				Change \{is_changing_levels = 0}
			endif
		endif
	endif
	fadetoblack \{OFF
		time = 0
		no_wait}
endscript

script destroy_loading_screen_spawned \{time = 0.1
		wait_for_end = !i1768515945}
	finalprintf \{'destroy_loading_screen_spawned'}
	if ($playing_song = 1)
		Wait \{4
			gameframes}
	endif
	setscriptcannotpause
	if ScreenElementExists \{id = loading_screen_container}
		loading_screen_container :GetTags
	endif
	OnExitRun \{loading_screen_premature_end_script}
	popunsafeforshutdown \{context = loading_screen
		Type = unchecked}
	pop_block_home_button
	allow_wii_notifications
	pop_disable_wii_invites_menu
	hide_glitch \{num_frames = 5}
	OnExitRun \{nullscript}
	Change \{g_in_loading_screen = 0}
	Change \{g_loading_screen_is_for_invite = 0}
	finalprintf \{'destroy_loading_screen_spawned - Done!'}
	if ScreenElementExists \{id = loading_screen_container}
		loading_screen_container :Die
	endif
	if GotParam \{destroy_script}
		<destroy_script>
	endif
endscript

script show_static_loading_screen_spawned \{display_params = 0x69696969
		saving_warning = 0}
	setscriptcannotpause
	OnExitRun \{loading_screen_premature_end_script}
	loading_screen_random
	printstruct channel = clayton <loading_screen>
	CreateScreenElement {
		id = loading_screen_container
		parent = root_window
		Type = descinterface
		desc = 'loading'
		tip_text = (<loading_screen>.text)
		background_texture = (<loading_screen>.texture)
		z_priority = 101000
	}
	if (<saving_warning> = 1)
		loading_screen_container :se_setprops \{loading_text_frame_alpha = 0}
		loading_screen_container :se_setprops \{saving_warning_alpha = 1}
	endif
	wii_timer_start \{label = 'loading_screen_cfunc'}
	predisplayloadingscreen
	wii_timer_stop \{label = 'loading_screen_cfunc'}
	OnExitRun \{nullscript}
endscript

script loading_screen_premature_end_script 
	ScriptAssert \{'Loading screen ended too soon! Probably a killed off spawn script?'}
endscript
