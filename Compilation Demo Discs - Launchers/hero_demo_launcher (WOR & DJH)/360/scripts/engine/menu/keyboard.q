current_page = 0
current_cpu = 0

script handle_keyboard_input 
	if NOT globalexists \{name = profile_pages}
		return
	endif
	if gotparam \{got_escape}
		if ($show_gpu_time = 1)
			togglemetrics \{mode = 5}
			change \{current_cpu = 6}
		else
			togglemetrics \{mode = 0}
		endif
	endif
	if gotparam \{got_f1}
		togglemetrics \{mode = 1}
	endif
	if gotparam \{got_f2}
		togglemetrics \{mode = 2}
	endif
	if gotparam \{got_f3}
		togglemetrics \{mode = 3}
	endif
	if gotparam \{got_f4}
		togglemetrics \{mode = 4}
	endif
	getmetricsmode
	getarraysize \{$profile_pages}
	num_pages = <array_size>
	num_cpus = 7
	if isps3
		<num_cpus> = 3
	endif
	if gotparam \{text}
		<key> = 1
		begin
		formattext textname = key_name qs(0xf12be168) k = <key>
		if (<text> = <key_name>)
			if (<mode> = 2)
				if ((<key> - 1) < <num_cpus>)
					change current_cpu = (<key> -1)
					printf \{qs(0x34de4ddc)
						c = $current_cpu}
					break
				endif
			endif
			if (<mode> = 3)
				if ((<key> - 1) < <num_pages>)
					change current_page = (<key> -1)
					break
				endif
			endif
		endif
		<key> = (<key> + 1)
		repeat 9
		if (<mode> >= 2)
			if (<text> = qs(0x713755f7))
				moveprofilecursor cpu = ($current_cpu) freeze
			endif
		endif
		if (<mode> = 2)
			if (<text> = qs(0xe522dff6))
				dumpprofilestart
				dumpprofile cpu = ($current_cpu) title = qs(0x056363d7)
				dumpprofileend \{output_text
					output_file}
			endif
		endif
		if (<text> = qs(0xce0f8c35))
			change show_gpu_time = (1 - $show_gpu_time)
			if ($show_gpu_time = 1)
				togglemetrics \{mode = 5}
				change \{current_cpu = 6}
			else
				togglemetrics \{mode = 0}
			endif
		endif
		if (<text> = qs(0xaa634931))
			begincpucapture \{1}
		endif
		if scriptexists \{user_keyboard_script}
			user_keyboard_script text = <text>
		endif
	endif
	if (<mode> = 2)
		if gotparam \{got_left}
			moveprofilecursor cpu = ($current_cpu) left
		endif
		if gotparam \{got_right}
			moveprofilecursor cpu = ($current_cpu) right
		endif
		if gotparam \{got_up}
			moveprofilecursor cpu = ($current_cpu) up
		endif
		if gotparam \{got_down}
			moveprofilecursor cpu = ($current_cpu) down
		endif
	endif
endscript
