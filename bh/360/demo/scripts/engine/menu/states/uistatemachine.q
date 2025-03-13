ui_task_menu_default_focus_id = current_menu
ui_task_menu_default_anim_in_script = task_menu_default_anim_in
ui_task_menu_default_anim_out_script = task_menu_default_anim_out

script ui_initializestatemachine 
	if objectexists \{id = ui}
		return
	endif
	<com_disabled> = 0
	if NOT iscompositeobjectmanagerenabled
		<com_disabled> = 1
		compositeobjectmanagersetenable \{on}
	endif
	createcompositeobject \{params = {
			name = ui
			permanent
		}
		components = [
			{
				component = eventcache
			}
			{
				component = statemachinemanager
			}
			{
				component = menustack
			}
		]
		heap = frontend}
	createcompositeobject \{params = {
			name = ui_object2
			permanent
		}
		components = [
			{
				component = eventcache
			}
			{
				component = statemachinemanager
			}
			{
				component = menustack
			}
		]
		heap = frontend}
	if (<com_disabled> = 1)
		compositeobjectmanagersetenable \{off}
	endif
	registeruistates
	mempushcontext \{heap_ui_pak_slot}
	createpakmanmap \{map = ui_paks
		links = uipaks
		folder = 'Pak/ui/'
		allocheap = heap_ui_pak_slot
		vramheap = heap_ui_pak_slot}
	mempopcontext
	ui :fsm_set \{state = uistate_null
		replacement = this
		params = {
			object = 1
			base_name = 'null'
			initing = 1
		}}
endscript

script ui_print_states 
	if gotparam \{name}
		ui_event_get_stack
		getarraysize <stack>
		printf qs(0x68fcfcbc) n = <array_size>
		if (<array_size> > 0)
			i = 0
			begin
			printf qs(0x32d9cad3) i = (<i> + 1) s = (<stack> [<i>].base_name)
			i = (<i> + 1)
			repeat <array_size>
		endif
	else
		ui :unpause
		ui :fsm_printstatemachine
		ui :menustack_printcontents
	endif
endscript

script is_ui_event_running 
	if scriptisrunning \{ui_event_block}
		return \{true}
	endif
	return \{false}
endscript

script ui_event_if_camera_finished 
	if is_menu_camera_finished
		ui_event <...>
	endif
endscript

script ui_event \{force_event = false}
	if gotparam \{choose_sfx}
		soundevent \{event = ui_sfx_select}
	endif
	if NOT ((<event> = menu_anim_in_done) || (<event> = menu_anim_out_done) || (<event> = menu_add_data) || (<event> = menu_remove_data))
		if (<force_event> = false)
			if is_ui_event_running
				return
			endif
		endif
		spawnscriptnow ui_event_block params = <...>
	else
		ui_event_spawned <...>
	endif
endscript

script ui_event_spawned \{object = 1
		event = menu_change
		data = {
		}}
	if structurecontains \{structure = data
			name = state}
		printf qs(0x37276fb1) p = <object> e = <event> s = (<data>.state) channel = ui_event
	else
		printf qs(0x7a06c2ff) p = <object> e = <event> channel = ui_event
	endif
	<data> = {object = <object> <data>}
	if (<object> = 1)
		ui :unpause
		ui :eventcache_add event_id = <event> event_data = <data>
	elseif (<object> = 2)
		ui_object2 :unpause
		ui_object2 :eventcache_add event_id = <event> event_data = <data>
	endif
endscript

script ui_event_add_params \{object = 1}
	ui_event event = menu_add_data data = <...>
endscript

script ui_event_remove_params \{object = 1}
	ui_event event = menu_remove_data data = <...>
endscript

script ui_event_change_device \{object = 1}
	ui_event event = menu_change_device data = <...>
endscript

script ui_event_add_continue \{event = menu_change
		object = 1}
	ui_event event = menu_add data = <add_state_data> object = <object>
	begin
	if NOT is_ui_event_running
		break
	endif
	wait \{1
		gameframe}
	repeat
	ui_event event = <event> data = <continue_state_data> object = <object>
	begin
	if NOT is_ui_event_running
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script ui_event_block \{object = 1
		event = menu_change
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	ui_event_spawned event = <event> data = <data> object = <object>
	block \{type = taskmenu_callback}
endscript

script ui_event_wait \{object = 1
		event = menu_change
		data = {
		}}
	spawnscriptnow ui_event_wait_spawned params = {<...>}
endscript

script ui_event_wait_spawned 
	ui_event_wait_for_safe
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	spawnscriptnow ui_event_block params = <...>
endscript

script ui_event_wait_for_safe 
	wait \{1
		gameframe}
	begin
	if NOT is_ui_event_running
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script ui_event_exists_in_stack 
	requireparams \{[
			name
		]
		all}
	ui :menustack_getstackcontents
	if (<stack_size> = 0)
		return \{false}
	endif
	i = 0
	begin
	if ((<stack> [<i>].base_name) = <name>)
		return \{true}
	endif
	if gotparam \{above}
		if ((<stack> [<i>].base_name) = <above>)
			return \{false}
		endif
	endif
	i = (<i> + 1)
	repeat <stack_size>
	return \{false}
endscript

script ui_event_get_stack 
	ui :menustack_getstackcontents
	return <...>
endscript

script ui_state_pak_load 
	printf channel = taskmenu 'UI: Loading pak "%s"' s = <pakname>
	setpakmancurrent map = ui_paks pakname = <pakname>
endscript

script ui_state_anim_in_done 
	ui_event event = menu_anim_in_done object = <object>
endscript

script ui_state_anim_out_done 
	if ($game_mode != freeplay)
		hide_glitch
	endif
	ui_event event = menu_anim_out_done object = <object>
endscript

script ui_event_get_top 
	ui_event_get_stack
	getarraysize \{stack}
	if (<array_size> > 0)
		return (<stack> [0])
	endif
endscript

script ui_event_is_top_popup 
	ui_event_get_top
	if gotparam \{is_popup}
		return \{true}
	else
		return \{false}
	endif
endscript
