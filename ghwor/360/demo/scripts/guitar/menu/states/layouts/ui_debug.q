is_in_debug = 0

script ui_init_debug \{from_gameplay = 0}
	change \{is_in_debug = 1}
	if (<from_gameplay> = 1)
		change \{debug_from_gameplay = 1}
	else
		change \{debug_from_gameplay = 0}
	endif
endscript

script ui_create_debug 
	spawnscriptnow ui_create_debug_spawned params = {<...>}
endscript

script ui_create_debug_spawned 
	if debug_submenu_exists \{id = 'main'}
		ui_sfx \{menustate = generic
			uitype = select}
		ui_event_wait \{event = menu_change
			state = uistate_debug_submenu
			data = {
				menu_id = 'main'
			}}
	else
		ui_event_wait \{event = menu_back}
	endif
endscript

script ui_destroy_debug 
endscript

script ui_deinit_debug 
	if NOT cd
		ui_event_get_stack
		i = 0
		begin
		if ((<stack> [<i>].base_name) = 'debug')
			if gotparam \{hit}
				return
			endif
			hit = 1
		endif
		i = (<i> + 1)
		repeat <stack_size>
	endif
	change \{is_in_debug = 0}
	change \{debug_from_gameplay = 0}
endscript
