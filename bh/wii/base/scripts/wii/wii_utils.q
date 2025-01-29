wii_connecting_header = qs(0x91605db4)

script unload_pak_and_wait 
	RequireParams \{[
			pak
		]
		all}
	UnLoadPak <pak>
	WaitUnloadPak <pak>
endscript

script show_last_connection_error \{continue_script = destroy_last_connection_error_dialog
		continue_params = {
		}
		unfocus_script = NULL
		unfocus_params = {
		}
		reset = 0
		heading_text = qs(0xb764670b)}
	getngcneterrors reset_on_begin_connect = 1 reset = <reset>
	if (<dwc_error_code> > 0)
		formatText TextName = text qs(0xcfb2fe82) d = (<dwc_error_code>) s = (<dwc_error_text>)
	else
		formatText TextName = text qs(0x73307931) s = (<dwc_error_text>)
	endif
	if (<fatal_error> > 0)
		ngc_nand_fatal
	endif
	options = [
		{
			func = <continue_script>
			func_params = <continue_params>
			text = qs(0x0e41fe46)
		}
	]
	if (unfocus_script = NULL)
		LaunchEvent \{Type = unfocus
			target = current_menu}
	else
		<unfocus_script> <unfocus_params>
	endif
	create_dialog_box {
		heading_text = <heading_text>
		body_text = <text>
		options = <options>
		use_all_controllers
	}
endscript

script destroy_last_connection_error_dialog 
	destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script wii_utils_user_requested_online 
	ui_signin_start_always_on_lobby_task
endscript

script wii_format_date 
	RequireParams \{[
			date_params
		]
		all}
	if English
		GetUpperCaseString (($us_month_names) [(<date_params>.month)])
		formatText TextName = date_text qs(0xeb6a86cb) m = (<UppercaseString>) d = (<date_params>.dayofmonth) y = (<date_params>.year)
	else
		GetUpperCaseString (($us_month_names) [(<date_params>.month)])
		formatText TextName = date_text qs(0x3c57c31a) d = (<date_params>.dayofmonth) m = (<UppercaseString>) y = (<date_params>.year)
	endif
	return date_text = <date_text>
endscript

script show_nwc24_error \{continue_script = destroy_last_connection_error_dialog}
	RequireParams \{[
			error_code
			error_checksum
		]
		all}
	formatText TextName = text qs(0xff84695a) a = <error_code> b = ($<error_checksum>)
	options = [
		{
			func = <continue_script>
			text = qs(0x0e41fe46)
			Scale = (1.0, 1.0)
		}
	]
	if NOT GotParam \{unfocus_script}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	else
		<unfocus_script> <unfocus_params>
	endif
	create_dialog_box {
		heading_text = ($wii_error_header)
		body_text = <text>
		options = <options>
		use_all_controllers
	}
endscript

script hide_flares \{num_frames = 1}
	push_hide_flares
	SpawnScriptNow hide_flares_spawned params = {<...>}
endscript

script hide_flares_spawned 
	OnExitRun \{pop_hide_flares}
	setscriptcannotpause
	Wait <num_frames> gameframes
endscript
hide_flares_count = 0

script push_hide_flares 
	Change hide_flares_count = ($hide_flares_count + 1)
	disableflares
endscript

script pop_hide_flares 
	Change hide_flares_count = ($hide_flares_count - 1)
	if ($hide_flares_count = 0)
		enableflares
	endif
endscript

script lock_all_controllers 
	if ($allow_controller_for_all_instruments = 0)
		setcontrollerlock \{controller = 0
			lock}
		setcontrollerlock \{controller = 1
			lock}
		setcontrollerlock \{controller = 2
			lock}
		setcontrollerlock \{controller = 3
			lock}
	endif
endscript

script unlock_all_controllers 
	if ($allow_controller_for_all_instruments = 0)
		setcontrollerlock \{controller = 0
			unlock}
		setcontrollerlock \{controller = 1
			unlock}
		setcontrollerlock \{controller = 2
			unlock}
		setcontrollerlock \{controller = 3
			unlock}
	endif
endscript
g_was_acceptable_string = 0

script update_was_acceptable_string 
	RequireParams \{[
			num_bad_words
		]
		all}
	printf \{'--- script update_was_acceptable_string ---'}
	if GotParam \{num_bad_words}
		if (<num_bad_words> = 0)
			Change \{g_was_acceptable_string = 1}
		else
			Change \{g_was_acceptable_string = 0}
		endif
		printf '--- setting g_was_acceptable_string = %d ---' d = ($g_was_acceptable_string)
	endif
endscript

script was_acceptable_string 
	printf \{'--- script was_acceptable_string ---'}
	if (($g_was_acceptable_string) = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script isacceptablestring_callback 
	RequireParams \{[
			contains_bad_words
		]
		all}
	broadcastevent Type = profanity_check_complete data = {failed = <contains_bad_words>}
endscript
