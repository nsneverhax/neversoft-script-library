
script menu_stack_push \{menu_params = {
		}}
	if NOT gotparam \{menu_script}
		scriptassert \{qs(0xda5fd6f0)}
	endif
	menu_stack_push_or_pop_menu <...> func = push
	if NOT gotparam \{no_create}
		menu_stack_create_latest
	endif
endscript

script menu_stack_pop 
	menu_stack_push_or_pop_menu \{func = pop}
	if NOT gotparam \{no_create}
		menu_stack_create_latest
	endif
endscript

script menu_stack_create_latest 
	if menu_stack_can_pop_menu
		if NOT gotparam \{no_destroy}
			if screenelementexists \{id = current_menu_anchor}
				destroyscreenelement \{id = current_menu_anchor}
			endif
		endif
		menu_stack_get_local_stack
		pop \{menu_script}
		pop \{menu_params}
		<menu_script> <menu_params>
		return \{true}
	else
		printf \{qs(0xcac68d70)}
		return \{false}
	endif
endscript

script menu_stack_clear 
	root_window :removetags \{[
			menu_stack
		]}
endscript

script menu_stack_can_pop_menu 
	menu_stack_get_local_stack
	if canpop \{menu_script}
		return \{true}
	else
		return \{false}
	endif
endscript

script menu_stack_get_local_stack 
	root_window :getsingletag \{menu_stack}
	return param_stacks = <menu_stack>
endscript

script menu_stack_push_or_pop_menu \{func = push}
	menu_stack_get_local_stack
	printf \{qs(0xc807a75b)}
	<func> menu_script
	<func> menu_params
	menu_stack_clear
	root_window :settags menu_stack = <param_stacks>
endscript
