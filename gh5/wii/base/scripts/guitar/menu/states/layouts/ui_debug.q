is_in_debug = 0

script ui_init_debug 
	Change \{is_in_debug = 1}
endscript

script ui_create_debug 
	create_debugging_menu <...>
endscript

script ui_destroy_debug 
	destroy_debugging_menu
endscript

script ui_deinit_debug 
	if NOT CD
		ui_event_get_stack
		i = 0
		begin
		if ((<stack> [<i>].base_name) = 'debug')
			if GotParam \{hit}
				return
			endif
			hit = 1
		endif
		i = (<i> + 1)
		repeat <stack_size>
	endif
	Change \{is_in_debug = 0}
endscript
