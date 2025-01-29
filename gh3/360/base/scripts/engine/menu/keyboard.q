current_page = 0
current_cpu = 0

script handle_keyboard_input 
	if gotparam \{got_escape}
		if ($show_gpu_time = 1)
			togglemetrics \{mode = 5}
			if isps3
				change \{current_cpu = 2}
			else
				change \{current_cpu = 6}
			endif
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
		formattext textname = key_name "%k" k = <key>
		if (<text> = <key_name>)
			if (<mode> = 2)
				if ((<key> - 1) < <num_cpus>)
					change current_cpu = (<key> -1)
					printf \{"Current CPU %c"
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
			if (<text> = " ")
				moveprofilecursor cpu = ($current_cpu) freeze
			endif
		endif
		if (<mode> = 2)
			if (<text> = "d")
				dumpprofilestart
				dumpprofile cpu = ($current_cpu) title = "Profile Dump:"
				dumpprofileend \{output_text
					output_file}
			endif
		endif
		if (<text> = "g")
			change show_gpu_time = (1 - $show_gpu_time)
			if ($show_gpu_time = 1)
				togglemetrics \{mode = 5}
				if isps3
					change \{current_cpu = 2}
				else
					change \{current_cpu = 6}
				endif
			else
				togglemetrics \{mode = 0}
			endif
		endif
		user_keyboard_script text = <text>
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
