
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

script create_mic_debugging_menu \{player = 1}
	getplayerinfo <player> controller
	createscreenelement \{parent = root_window
		id = mic_debug_menu
		type = descinterface
		desc = 'mic_debugger'
		pos = (0.0, 0.0)
		event_handlers = [
			{
				pad_back
				ui_sfx
				params = {
					menustate = generic
					uitype = back
				}
			}
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
	mic_debug_menu :obj_spawnscriptnow \{mic_debugger_update
		params = {
			use_pre_amp = 1
		}}
	mic_debug_menu :obj_spawnscriptnow \{mic_debugger_update
		params = {
			use_pre_amp = 0
		}}
	launchevent \{type = focus
		target = mic_debug_menu}
endscript

script destroy_mic_debugging_menu 
	getplayerinfo \{1
		controller}
	killspawnedscript \{name = mic_debugger_update}
	microphone_deinit controller = <controller>
	clean_up_user_control_helpers
	if screenelementexists \{id = mic_debug_menu}
		destroyscreenelement \{id = mic_debug_menu}
	endif
endscript

script mic_debugger_update \{use_pre_amp = 1}
	getplayerinfo \{1
		controller}
	<last_frame> = 0
	<current_peak> = 0
	<num_changed> = 0
	<max_peak> = 26
	<max_peak_hold> = 26
	<hold_time> = 120
	<floating_peak_timer> = 0
	<fall_speed_frames> = 5
	<sensitivity> = 1.5
	if (<use_pre_amp> = 1)
		<alias> = alias_input_eq
	else
		<alias> = alias_output_eq
	endif
	begin
	microphone_updatedebugeq controller = <controller>
	if (<use_pre_amp> = 1)
		<amplitude> = (<pre_amplitude> * <sensitivity>)
	else
		<amplitude> = (<post_amplitude> * <sensitivity>)
	endif
	<current_peak> = ((26 - (<amplitude> * 26)) + 1)
	casttointeger \{current_peak}
	if (<current_peak> < 0)
		<current_peak> = 0
	endif
	if (<current_peak> < <last_frame>)
		<num_changed> = (<last_frame> - <current_peak>)
		casttointeger \{num_changed}
		if (<num_changed> > 0)
			<gem_index> = <last_frame>
			begin
			mic_debugger_set_color alias = <alias> index = <gem_index>
			<gem_index> = (<gem_index> - 1)
			repeat <num_changed>
		endif
	elseif (<current_peak> > <last_frame>)
		<num_changed> = (<current_peak> - <last_frame>)
		casttointeger \{num_changed}
		if (<num_changed> > 0)
			<gem_index> = <last_frame>
			begin
			if ((<gem_index> != <max_peak_hold>) && (<gem_index> != 1))
				mic_debugger_set_color alias = <alias> index = <gem_index> color_off = 1
			endif
			<gem_index> = (<gem_index> + 1)
			repeat <num_changed>
		endif
	endif
	if (<current_peak> < <max_peak>)
		<max_peak> = <current_peak>
		formattext textname = max_text qs(0x35b12509) a = <vol_db> decimalplaces = 1 dontassertforchecksums
		if (<use_pre_amp> = 1)
			mic_debug_menu :se_setprops input_max_peak_text = <max_text>
		else
			mic_debug_menu :se_setprops output_max_peak_text = <max_text>
		endif
	endif
	if ((<current_peak> < <max_peak_hold>) && (<current_peak> > 0))
		<max_peak_hold> = <current_peak>
		formattext textname = hold_text qs(0x35b12509) a = <vol_db> decimalplaces = 1 dontassertforchecksums
		if (<use_pre_amp> = 1)
			mic_debug_menu :se_setprops input_peak_hold_text = <hold_text>
		else
			mic_debug_menu :se_setprops output_peak_hold_text = <hold_text>
		endif
		if (<max_peak_hold> > 1)
			mic_debugger_set_color alias = <alias> index = <max_peak_hold>
		endif
		<floating_peak_timer> = <hold_time>
	endif
	if (<floating_peak_timer> > 0)
		<floating_peak_timer> = (<floating_peak_timer> - 1)
		if (<floating_peak_timer> = 0)
			if (<max_peak_hold> > 1)
				mic_debugger_set_color alias = <alias> index = <max_peak_hold> color_off = 1
			endif
			<max_peak_hold> = (<max_peak_hold> + 1)
			if (<max_peak_hold> < 26)
				mic_debugger_set_color alias = <alias> index = <max_peak_hold>
				<floating_peak_timer> = <fall_speed_frames>
			endif
		endif
	endif
	<last_frame> = <current_peak>
	wait \{1
		gameframe}
	repeat
endscript

script mic_debugger_gem_color 
	color_red = [255 50 50 255]
	color_yellow = [255 255 30 255]
	color_orange = [220 150 30 255]
	color_green = [0 255 0 255]
	if (<index> > 16)
		color = <color_green>
	elseif (<index> > 7)
		color = <color_orange>
	elseif (<index> > 2)
		color = <color_yellow>
	else
		color = <color_red>
	endif
	return color = <color>
endscript

script mic_debugger_reset 
	color_off = [50 50 50 255]
	killspawnedscript \{name = mic_debugger_update}
	mic_debug_menu :se_setprops \{input_max_peak_text = qs(0x5abecfbe)}
	mic_debug_menu :se_setprops \{output_max_peak_text = qs(0x5abecfbe)}
	mic_debug_menu :se_setprops \{input_peak_hold_text = qs(0x5abecfbe)}
	mic_debug_menu :se_setprops \{output_peak_hold_text = qs(0x5abecfbe)}
	if mic_debug_menu :desc_resolvealias \{name = alias_input_eq}
		resolvescreenelementid id = {<resolved_id> child = 0}
		<resolved_id> :se_setprops rgba = <color_off>
	endif
	if mic_debug_menu :desc_resolvealias \{name = alias_output_eq}
		resolvescreenelementid id = {<resolved_id> child = 0}
		<resolved_id> :se_setprops rgba = <color_off>
	endif
	mic_debug_menu :obj_spawnscriptnow \{mic_debugger_update
		params = {
			use_pre_amp = 1
		}}
	mic_debug_menu :obj_spawnscriptnow \{mic_debugger_update
		params = {
			use_pre_amp = 0
		}}
endscript

script mic_debugger_synch 
	generic_event_replace \{state = uistate_mic_debug}
endscript

script mic_debugger_set_color \{alias = alias_input_eq
		index = 1
		color_off = 0}
	if mic_debug_menu :desc_resolvealias name = <alias>
		if (0 < <index> && <index> < 26)
			mic_debugger_gem_color index = <index>
			resolvescreenelementid id = {<resolved_id> child = (<index> - 1)}
			if (<color_off> = 1)
				color = [50 50 50 255]
			endif
			<resolved_id> :se_setprops rgba = <color>
		endif
	endif
endscript
