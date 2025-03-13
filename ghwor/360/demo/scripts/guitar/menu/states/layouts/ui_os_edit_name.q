
script ui_create_os_edit_name \{device_num = !i1768515945
		char_limit = !i1768515945
		default_name = 0x69696969
		title = 0x69696969
		os_kb_flags = {
		}
		valid_characters = [
			$name_entry_upper_characters
			$name_entry_lower_characters
			$name_entry_space_character
			$name_entry_number_characters
			$name_entry_misc_characters
			$name_entry_foreign_characters
		]
		keep_trailing_whitespace = 0
		string_validation_script = nullscript
		accept_emtpy = 0}
	clean_up_user_control_helpers
	printf \{qs(0xec55c627)}
	printstruct <...>
	spawnscriptnow os_keyboard_spawned_script params = {
		controller = <device_num>
		max_length = <char_limit>
		initial_text = <default_name>
		dialog_text = <title>
		accept_script = <accept_script>
		accept_params = <accept_params>
		cancel_script = <cancel_script>
		cancel_params = <cancel_params>
		os_kb_flags = <os_kb_flags>
		valid_characters = <valid_characters>
		keep_trailing_whitespace = <keep_trailing_whitespace>
		string_validation_script = <string_validation_script>
		accept_empty = <accept_empty>
	}
endscript

script os_keyboard_spawned_script \{controller = !i1768515945
		max_length = !i1768515945
		dialog_text = 0x69696969
		os_kb_flags = 0x69696969
		valid_characters = !a1768515945
		keep_trailing_whitespace = 0
		string_validation_script = nullscript
		result = none}
	printf \{qs(0x8fc7c934)}
	printstruct <...>
	original_params = <...>
	setbuttoneventmappings \{block_menu_input}
	onexitrun os_keyboard_spawned_script_exit params = {
		controller = <controller>
		cancel_script = <cancel_script>
		cancel_params = <cancel_params>
	}
	oskeyboardshow {
		controller = <controller>
		initial_text = <initial_text>
		max_length = <max_length>
		dialog_text = <dialog_text>
		<os_kb_flags>
	}
	setbuttoneventmappings \{unblock_menu_input}
	onexitrun \{nullscript}
	if (<result> = complete)
		if (<keep_trailing_whitespace> = 0)
			stringremovetrailingwhitespace string = <string>
			<string> = <new_string>
		endif
		os_keyboard_entry_accepted {
			string = <string>
			accept_script = <accept_script>
			accept_params = <accept_params>
			original_params = <original_params>
			valid_characters = <valid_characters>
			string_validation_script = <string_validation_script>
			controller = <controller>
			accept_empty = <accept_empty>
		}
	else
		os_keyboard_entry_cancelled {
			cancel_script = <cancel_script>
			cancel_params = <cancel_params>
			controller = <controller>
		}
	endif
endscript

script os_keyboard_spawned_script_exit 
	setbuttoneventmappings \{unblock_menu_input}
	oskeyboardclose
	os_keyboard_entry_cancelled {
		controller = <controller>
		cancel_script = <cancel_script>
		cancel_params = <cancel_params>
	}
endscript

script os_keyboard_entry_accepted \{string = 0x69696969
		original_params = 0x69696969
		valid_characters = !a1768515945
		controller = !i1768515945
		string_validation_script = !q1768515945
		accept_empty = 0}
	printf \{qs(0xc7b6d4bb)}
	printstruct <...>
	if (<accept_empty> = 0)
		if (<string> = qs(0x03ac90f0))
			os_keyboard_entry_accepted_error_dialog {
				string = <string>
				original_params = <original_params>
				error_text = qs(0xee846c1f)
			}
			return
		endif
	endif
	getarraysize <valid_characters>
	if (<array_size> > 0)
		if NOT checkstringforinvalidchars string = <string> valid_characters = <valid_characters>
			os_keyboard_entry_accepted_error_dialog {
				string = <string>
				original_params = <original_params>
				without_invalid_characters = <corrected_string>
			}
			return
		endif
	endif
	if (<string_validation_script> != nullscript)
		if NOT <string_validation_script> string = <string>
			os_keyboard_entry_accepted_error_dialog {
				string = <string>
				original_params = <original_params>
				error_text = <error_text>
			}
			return
		endif
	endif
	if gotparam \{accept_script}
		<accept_script> text = <string> exclusive_device = <controller> <accept_params>
	else
		generic_event_back data = {text = <string>}
	endif
endscript

script os_keyboard_entry_accepted_error_dialog \{string = 0x69696969
		original_params = 0x69696969
		error_text = qs(0x07458864)}
	addparam structure_name = original_params name = initial_text value = <string>
	os_kb_flags = (<original_params>.os_kb_flags)
	removeparameter \{struct_name = os_kb_flags
		xenon_highlight_text}
	addparam structure_name = original_params name = os_kb_flags value = <os_kb_flags>
	array = [
		{
			func = os_keyboard_entry_accepted_error_dialog_retry
			func_params = {original_params = <original_params>}
			text = qs(0x71c7ac89)
		}
	]
	if gotparam \{without_invalid_characters}
		<invalid_correct_params> = <original_params>
		addparam structure_name = invalid_correct_params name = initial_text value = <without_invalid_characters>
		addarrayelement array = <array> element = {
			func = os_keyboard_entry_accepted_error_dialog_retry
			func_params = {original_params = <invalid_correct_params>}
			text = qs(0xb29db514)
		}
	endif
	addarrayelement array = <array> element = {
		func = os_keyboard_entry_accepted_error_dialog_cancel
		func_params = {original_params = <original_params>}
		text = qs(0x7343df39)
	}
	create_dialog_box {
		dlg_z_priority = 10000
		heading_text = qs(0x66653bcd)
		body_text = <error_text>
		parent = root_window
		no_background
		options = <array>
		player_device = (<original_params>.controller)
	}
endscript

script os_keyboard_entry_accepted_error_dialog_retry \{original_params = 0x69696969}
	destroy_dialog_box
	spawnscriptlater os_keyboard_spawned_script params = <original_params>
endscript

script os_keyboard_entry_accepted_error_dialog_cancel \{original_params = 0x69696969}
	destroy_dialog_box
	spawnscriptlater os_keyboard_entry_cancelled params = <original_params>
endscript

script os_keyboard_entry_cancelled \{controller = !i1768515945}
	if gotparam \{cancel_script}
		<cancel_script> exclusive_device = <controller> <cancel_params>
	else
		generic_event_back
	endif
endscript

script ui_destroy_os_edit_name 
	clean_up_user_control_helpers
endscript

script ui_init_os_edit_name 
endscript

script ui_deinit_os_edit_name 
	killspawnedscript \{name = os_keyboard_spawned_script}
endscript
