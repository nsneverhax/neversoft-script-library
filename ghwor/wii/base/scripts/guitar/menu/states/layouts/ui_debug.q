is_in_debug = 0

script ui_init_debug \{from_gameplay = 0}
	Change \{is_in_debug = 1}
	if (<from_gameplay> = 1)
		Change \{debug_from_gameplay = 1}
	else
		Change \{debug_from_gameplay = 0}
	endif
endscript

script ui_create_debug 
	SpawnScriptNow ui_create_debug_spawned params = {<...>}
endscript

script ui_create_debug_spawned 
	if debug_submenu_exists \{id = 'main'}
		ui_sfx \{menustate = Generic
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
	Change \{debug_from_gameplay = 0}
endscript
