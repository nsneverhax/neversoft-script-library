
script ui_create_failed_three_times_warning 
	soundevent \{event = fail_screen_sfx}
	soundevent \{event = menu_warning_sfx_softer}
	disable_pause
	if NOT gotparam \{controller}
		<controller> = $primary_controller
	endif
	create_popup_warning_menu {
		textblock = {
			text = qs(0x26948c0d)
			dims = (800.0, 100.0)
			scale = 0.55
		}
		player_device = <controller>
		no_background
		force_menu_pos_off = (-15.0, -50.0)
		options = [
			{
				func = failed_3_times_skip_never_pass
				text = qs(0x52115fbd)
				dims = (500.0, 50.0)
				fit_height = `scale down if larger`
				fit_width = warp
			}
			{
				func = failed_3_times_skip_maybe_pass
				text = qs(0xadc93d70)
				dims = (500.0, 50.0)
				fit_height = `scale down if larger`
				fit_width = warp
			}
			{
				func = failed_3_times_retry
				text = qs(0x96e78a5c)
				dims = (100.0, 50.0)
				fit_height = `scale down if larger`
				fit_width = warp
			}
		]
	}
endscript

script ui_destroy_failed_three_times_warning 
	destroy_popup_warning_menu
	enable_pause
endscript

script failed_3_times_skip_never_pass 
	if isxenon
		if NOT ($current_song = jamsession)
			writesongdatatofile \{failed = 1
				failed_3_times_option_chose = qs(0x21be7e52)}
		endif
	endif
	failed_3_times_skip
endscript

script failed_3_times_skip_maybe_pass 
	if isxenon
		if NOT ($current_song = jamsession)
			writesongdatatofile \{failed = 1
				failed_3_times_option_chose = qs(0xd3d4a68f)}
		endif
	endif
	failed_3_times_skip
endscript

script failed_3_times_skip 
	gamemode_gettype
	if (<type> = quickplay)
		quickplay_skip_song
	elseif (<type> = career)
		if NOT progression_check_intro_complete
			progression_set_intro_complete
			generic_event_back \{state = uistate_mainmenu}
		else
			generic_event_back \{state = uistate_gig_posters}
		endif
	endif
endscript

script failed_3_times_retry 
	if isxenon
		if NOT ($current_song = jamsession)
			writesongdatatofile \{failed = 1}
		endif
	endif
	fail_song_menu_select_retry_song
endscript
