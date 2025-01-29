
script ui_create_failed_three_times_warning 
	SoundEvent \{event = fail_screen_sfx}
	SoundEvent \{event = menu_warning_sfx_softer}
	disable_pause
	if NOT GotParam \{controller}
		<controller> = $primary_controller
	endif
	create_dialog_box {
		body_text = qs(0x26948c0d)
		player_device = <controller>
		no_background
		options = [
			{
				func = failed_3_times_retry
				text = qs(0x96e78a5c)
				screenelementprops = {menurow_txt_item_dims = (800.0, 50.0) menurow_just = [center center] menurow_internal_just = [center centeer]}
			}
			{
				func = failed_3_times_skip_never_pass
				text = qs(0x52115fbd)
				screenelementprops = {menurow_txt_item_dims = (800.0, 50.0) menurow_just = [center center] menurow_internal_just = [center centeer]}
				focus_script_params = {grow_scale = 1.0}
			}
			{
				func = failed_3_times_skip_maybe_pass
				text = qs(0xadc93d70)
				screenelementprops = {menurow_txt_item_dims = (800.0, 50.0) menurow_just = [center center] menurow_internal_just = [center centeer]}
				focus_script_params = {grow_scale = 1.0}
			}
		]
	}
endscript

script ui_destroy_failed_three_times_warning 
	destroy_dialog_box
	enable_pause
endscript

script failed_3_times_skip_never_pass 
	if isXenon
		if NOT ($current_song = jamsession)
			writesongdatatofile \{failed = 1
				failed_3_times_option_chose = qs(0x21be7e52)}
		endif
	endif
	failed_3_times_skip
endscript

script failed_3_times_skip_maybe_pass 
	if isXenon
		if NOT ($current_song = jamsession)
			writesongdatatofile \{failed = 1
				failed_3_times_option_chose = qs(0xd3d4a68f)}
		endif
	endif
	failed_3_times_skip
endscript

script failed_3_times_skip 
	gamemode_gettype
	if (<Type> = quickplay)
		quickplay_skip_song
	elseif (<Type> = career)
		generic_event_back \{state = uistate_gig_posters}
	endif
endscript

script failed_3_times_retry 
	if isXenon
		if NOT ($current_song = jamsession)
			writesongdatatofile \{failed = 1}
		endif
	endif
	fail_song_menu_select_retry_song
endscript
