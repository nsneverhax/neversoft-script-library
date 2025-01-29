
script ui_init_mic_debug 
endscript

script ui_create_mic_debug 
	create_mic_debugging_menu
endscript

script ui_destroy_mic_debug 
	destroy_mic_debugging_menu
endscript

script ui_deinit_mic_debug 
endscript

script create_mic_debugging_menu \{Player = 1}
	getplayerinfo <Player> controller
	CreateScreenElement \{parent = root_window
		id = mic_debug_menu
		Type = descinterface
		desc = 'mic_debugger'
		Pos = (0.0, 0.0)
		event_handlers = [
			{
				pad_back
				generic_event_back
			}
			{
				pad_option
				mic_debugger_reset
			}
			{
				pad_select
				mic_debugger_synch
			}
		]}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x806c1bed)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0x38ee4773)
		button = blue
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	microphone_initdebugeq controller = <controller>
	switch (<mic_type>)
		case invalid
		mic_debug_menu :se_setprops \{mic_info_text = qs(0x83d4533b)}
		case headset
		mic_debug_menu :se_setprops \{mic_info_text = qs(0x4ccc7144)}
		case logitech
		mic_debug_menu :se_setprops \{mic_info_text = qs(0xc5fdb8bb)}
		case singstar
		mic_debug_menu :se_setprops \{mic_info_text = qs(0x832e2eef)}
		case microsoft_wireless
		mic_debug_menu :se_setprops \{mic_info_text = qs(0xd6cc8888)}
	endswitch
	SpawnScriptNow \{mic_debugger_update}
	LaunchEvent \{Type = focus
		target = mic_debug_menu}
endscript

script destroy_mic_debugging_menu 
	getplayerinfo \{1
		controller}
	KillSpawnedScript \{Name = mic_debugger_update}
	microphone_deinit controller = <controller>
	clean_up_user_control_helpers
	if ScreenElementExists \{id = mic_debug_menu}
		DestroyScreenElement \{id = mic_debug_menu}
	endif
endscript

script mic_debugger_update 
	getplayerinfo \{1
		controller}
	last_frame = 0
	current_peak = 0
	num_changed = 0
	max_peak = 26
	max_peak_hold = 26
	hold_time = 120
	floating_peak_timer = 0
	fall_speed_frames = 5
	color_off = [50 50 50 255]
	sensitivity = 1.5
	begin
	microphone_updatedebugeq controller = <controller>
	amplitude = (<amplitude> * <sensitivity>)
	current_peak = ((26 - (<amplitude> * 26)) + 1)
	CastToInteger \{current_peak}
	if (<current_peak> < 0)
		<current_peak> = 0
	endif
	if (<current_peak> < <last_frame>)
		num_changed = (<last_frame> - <current_peak>)
		CastToInteger \{num_changed}
		if (<num_changed> > 0)
			gem_index = <last_frame>
			begin
			formatText checksumName = gem_id 'input_gem_%s' s = <gem_index>
			if mic_debug_menu :desc_resolvealias Name = <gem_id>
				mic_debugger_gem_color index = <gem_index>
				<resolved_id> :se_setprops rgba = <Color>
			endif
			gem_index = (<gem_index> - 1)
			repeat <num_changed>
		endif
	elseif (<current_peak> > <last_frame>)
		num_changed = (<current_peak> - <last_frame>)
		CastToInteger \{num_changed}
		if (<num_changed> > 0)
			gem_index = <last_frame>
			begin
			if ((<gem_index> != <max_peak_hold>) && (<gem_index> != 1))
				formatText checksumName = gem_id 'input_gem_%s' s = <gem_index>
				if mic_debug_menu :desc_resolvealias Name = <gem_id>
					<resolved_id> :se_setprops rgba = <color_off>
				endif
			endif
			gem_index = (<gem_index> + 1)
			repeat <num_changed>
		endif
	endif
	if (<current_peak> < <max_peak>)
		max_peak = <current_peak>
		formatText TextName = max_text qs(0x35b12509) a = <vol_db> DecimalPlaces = 1 DontAssertForChecksums
		mic_debug_menu :se_setprops max_peak_value_text = <max_text>
	endif
	if ((<current_peak> < <max_peak_hold>) && (<current_peak> > 0))
		max_peak_hold = <current_peak>
		formatText TextName = hold_text qs(0x35b12509) a = <vol_db> DecimalPlaces = 1 DontAssertForChecksums
		mic_debug_menu :se_setprops peak_hold_value_text = <hold_text>
		if (<max_peak_hold> > 1)
			formatText checksumName = gem_id 'input_gem_%s' s = <max_peak_hold>
			if mic_debug_menu :desc_resolvealias Name = <gem_id>
				mic_debugger_gem_color index = <max_peak_hold>
				<resolved_id> :se_setprops rgba = <Color>
			endif
		endif
		floating_peak_timer = <hold_time>
	endif
	if (<floating_peak_timer> > 0)
		floating_peak_timer = (<floating_peak_timer> - 1)
		if (<floating_peak_timer> = 0)
			if (<max_peak_hold> > 1)
				formatText checksumName = gem_id 'input_gem_%s' s = <max_peak_hold>
				if mic_debug_menu :desc_resolvealias Name = <gem_id>
					<resolved_id> :se_setprops rgba = <color_off>
				endif
			endif
			max_peak_hold = (<max_peak_hold> + 1)
			if (<max_peak_hold> < 26)
				formatText checksumName = gem_id 'input_gem_%s' s = <max_peak_hold>
				if mic_debug_menu :desc_resolvealias Name = <gem_id>
					mic_debugger_gem_color index = <max_peak_hold>
					<resolved_id> :se_setprops rgba = <Color>
				endif
				floating_peak_timer = <fall_speed_frames>
			endif
		endif
	endif
	last_frame = <current_peak>
	Wait \{1
		gameframe}
	repeat
endscript

script mic_debugger_gem_color 
	color_red = [255 50 50 255]
	color_yellow = [255 255 30 255]
	color_orange = [220 150 30 255]
	color_green = [0 255 0 255]
	if (<index> > 16)
		Color = <color_green>
	elseif (<index> > 7)
		Color = <color_orange>
	elseif (<index> > 2)
		Color = <color_yellow>
	else
		Color = <color_red>
	endif
	return Color = <Color>
endscript

script mic_debugger_reset 
	color_off = [50 50 50 255]
	if mic_debug_menu :desc_resolvealias \{Name = input_gem_1}
		<resolved_id> :se_setprops rgba = <color_off>
	endif
endscript

script mic_debugger_synch 
	generic_event_replace \{state = uistate_mic_debug}
endscript
