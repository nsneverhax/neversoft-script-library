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
		heading_text = qs(0xb764670b)
		context = Default
		net_system = None}
	ui_sfx \{menustate = Generic
		uitype = warningmessage}
	if (<net_system> = None)
		netstatus_geterrors context = <context>
	else
		netstatus_geterrors net_system = <net_system>
	endif
	format_net_error_text code = <error_code> text = <error_text>
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
	if (<unfocus_script> = NULL)
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
	netstatus_showederrortouser net_system = <net_system>
endscript

script get_last_connection_error_text \{context = Default
		net_system = None}
	if (<net_system> = None)
		netstatus_geterrors context = <context>
	else
		netstatus_geterrors net_system = <net_system>
	endif
	format_net_error_text code = <error_code> text = <error_text>
	return error_text = <text>
endscript

script format_net_error_text \{code = 0
		text = qs(0x00000000)}
	if (<code> != 0)
		formatText TextName = text qs(0xcfb2fe82) d = (<code>) s = (<text>)
	else
		formatText TextName = text qs(0x73307931) s = (<text>)
	endif
	return text = <text>
endscript

script destroy_last_connection_error_dialog 
	destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script wii_utils_user_requested_online 
	ui_signin_start_always_on_lobby_task
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
	if (<contains_bad_words> = FALSE)
		Change \{g_was_acceptable_string = 1}
	else
		Change \{g_was_acceptable_string = 0}
	endif
	printf '--- setting g_was_acceptable_string = %d ---' d = ($g_was_acceptable_string)
	broadcastevent Type = profanity_check_complete data = {failed = <contains_bad_words>}
endscript

script is_ds_connected 
	<current_ds_count> = 0
	wiidscommunication :getstatus
	if (<current_ds_count> > 0)
		return \{true}
	endif
	return \{FALSE}
endscript

script is_net_id_zero \{net_id = [
			0
			0
		]}
	if ((<net_id> [0]) = 0)
		if ((<net_id> [1]) = 0)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script net_id_compare \{net_id_left = !a1768515945
		net_id_right = !a1768515945}
	if ((<net_id_left> [0]) = (<net_id_right> [0]))
		if ((<net_id_left> [1]) = (<net_id_right> [1]))
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script convert_to_ds_enum \{order_array_name = !q1768515945
		checksum_value = !q1768515945
		assert = 0x00000038
		out_name = ds_enum_value}
	GetArraySize $<order_array_name>
	<index> = 0
	<ds_enum_value> = -1
	begin
	if ($<order_array_name> [<index>] = <checksum_value>)
		<ds_enum_value> = <index>
		<return_params> = {}
		setstructureparam struct_name = return_params param = <out_name> value = <ds_enum_value>
		return true <return_params>
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	if ((<assert> = true) && (<ds_enum_value> = -1))
		ScriptAssert 'Unable to convert %c to DS enum' c = <checksum_value>
	endif
	return \{FALSE}
endscript

script calculate_text_width \{text = 0x69696969
		font = !q1768515945
		Scale = (1.0, 1.0)}
	CreateScreenElement {
		parent = root_window
		Type = TextElement
		fit_width = `expand	dims`
		text = <text>
		font = <font>
		Scale = <Scale>
	}
	GetScreenElementDims id = <id>
	DestroyScreenElement id = <id>
	return text_width = <width>
endscript
