
script generic_alpha_fade_animation 
	requireparams \{[
			container_id
			num_loops
			loop_start_index
			loop_end_index
			alpha_time
		]
		all}
	getscreenelementchildren id = <container_id>
	getarraysize <children>
	index_to_add = 1
	finish_animation = 0
	if (<array_size> > 1)
		i = 0
		loop_counter = -1
		begin
		if (<loop_counter> = <num_loops>)
			<finish_animation> = 1
		endif
		if (<finish_animation> = 0)
			if gotparam \{reverse_loop}
				if (<i> = <loop_start_index>)
					<index_to_add> = 1
					<loop_counter> = (<loop_counter> + 1)
				elseif (<i> = <loop_end_index>)
					<index_to_add> = -1
				endif
			else
				if (<i> = <loop_end_index>)
					<i> = <loop_start_index>
				endif
			endif
		else
			if gotparam \{reverse_loop}
				if (<index_to_add> = 1)
					index_to_add = -1
				else
					if (<i> = -1)
						break
					endif
				endif
			else
				if (<index_to_add> = -1)
					index_to_add = 1
				else
					if (<i> = <array_size>)
						break
					endif
				endif
			endif
		endif
		if ((<index_to_add> = 1) || (<i> = <loop_end_index>))
			if ((<i> - 1) >= 0)
				(<children> [(<i> - 1)]) :se_setprops {
					alpha = 0
					time = <alpha_time>
				}
			endif
		else
			if ((<i> + 1) < <array_size>)
				(<children> [(<i> + 1)]) :se_setprops {
					alpha = 0
					time = <alpha_time>
				}
			endif
		endif
		(<children> [<i>]) :se_setprops {
			alpha = 1
			time = <alpha_time>
		}
		(<children> [<i>]) :se_waitprops
		<i> = (<i> + <index_to_add>)
		repeat
		die
	endif
endscript
