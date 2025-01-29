current_page = 0
current_cpu = 0

script handle_keyboard_input 
	if NOT GlobalExists \{name = Profile_Pages}
		return
	endif
	if GotParam \{got_escape}
		if ($show_gpu_time = 1)
			ToggleMetrics \{mode = 5}
			Change \{current_cpu = 6}
		else
			ToggleMetrics \{mode = 0}
		endif
	endif
	if GotParam \{got_f1}
		ToggleMetrics \{mode = 1}
	endif
	if GotParam \{got_f2}
		ToggleMetrics \{mode = 2}
	endif
	if GotParam \{got_f3}
		ToggleMetrics \{mode = 3}
	endif
	if GotParam \{got_f4}
		ToggleMetrics \{mode = 4}
	endif
	GetMetricsMode
	GetArraySize \{$Profile_Pages}
	num_pages = <array_size>
	num_cpus = 7
	if IsPS3
		<num_cpus> = 3
	endif
	if GotParam \{text}
		<key> = 1
		begin
		FormatText TextName = key_name qs(0xf12be168) k = <key>
		if (<text> = <key_name>)
			if (<mode> = 2)
				if ((<key> - 1) < <num_cpus>)
					Change current_cpu = (<key> -1)
					printf \{qs(0x34de4ddc)
						c = $current_cpu}
					break
				endif
			endif
			if (<mode> = 3)
				if ((<key> - 1) < <num_pages>)
					Change current_page = (<key> -1)
					break
				endif
			endif
		endif
		<key> = (<key> + 1)
		repeat 9
		if (<mode> >= 2)
			if (<text> = qs(0x713755f7))
				MoveProfileCursor cpu = ($current_cpu) freeze
			endif
		endif
		if (<mode> = 2)
			if (<text> = qs(0xe522dff6))
				dumpprofilestart
				dumpprofile cpu = ($current_cpu) Title = qs(0x056363d7)
				dumpprofileend \{output_text
					output_file}
			endif
		endif
		if (<text> = qs(0xce0f8c35))
			Change show_gpu_time = (1 - $show_gpu_time)
			if ($show_gpu_time = 1)
				ToggleMetrics \{mode = 5}
				Change \{current_cpu = 6}
			else
				ToggleMetrics \{mode = 0}
			endif
		endif
		if (<text> = qs(0xaa634931))
			BeginCPUCapture \{1}
		endif
		if ScriptExists \{user_keyboard_script}
			user_keyboard_script text = <text>
		endif
	endif
	if (<mode> = 2)
		if GotParam \{got_left}
			MoveProfileCursor cpu = ($current_cpu) left
		endif
		if GotParam \{got_right}
			MoveProfileCursor cpu = ($current_cpu) right
		endif
		if GotParam \{got_up}
			MoveProfileCursor cpu = ($current_cpu) up
		endif
		if GotParam \{got_down}
			MoveProfileCursor cpu = ($current_cpu) down
		endif
	endif
endscript
