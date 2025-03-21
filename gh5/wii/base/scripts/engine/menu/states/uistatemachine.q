ui_task_menu_default_focus_id = current_menu
ui_task_menu_default_anim_in_script = task_menu_default_anim_in
ui_task_menu_default_anim_out_script = task_menu_default_anim_out

script ui_initializestatemachine 
	if ObjectExists \{id = UI}
		return
	endif
	<com_disabled> = 0
	if NOT IsCompositeObjectManagerEnabled
		<com_disabled> = 1
		CompositeObjectManagerSetEnable \{On}
	endif
	CreateCompositeObject \{params = {
			Name = UI
			permanent
		}
		components = [
			{
				component = EventCache
			}
			{
				component = StateMachineManager
			}
			{
				component = menustack
			}
		]
		Heap = FrontEnd}
	CreateCompositeObject \{params = {
			Name = ui_object2
			permanent
		}
		components = [
			{
				component = EventCache
			}
			{
				component = StateMachineManager
			}
			{
				component = menustack
			}
		]
		Heap = FrontEnd}
	if (<com_disabled> = 1)
		CompositeObjectManagerSetEnable \{OFF}
	endif
	registeruistates
	MemPushContext \{heap_ui_pak_slot}
	CreatePakManMap \{map = ui_paks
		links = uipaks
		folder = 'Pak/ui/'}
	MemPopContext
	UI :fsm_set \{state = uistate_null
		replacement = this
		params = {
			object = 1
			base_name = 'null'
		}}
endscript

script ui_print_states \{object = 1}
	UI :Unpause
	UI :fsm_printstatemachine
	UI :menustack_printcontents
endscript

script is_ui_event_running 
	if ScriptIsRunning \{ui_event_block}
		return \{true}
	endif
	return \{FALSE}
endscript

script ui_event_if_camera_finished 
	if is_menu_camera_finished
		ui_event <...>
	endif
endscript

script ui_event \{force_event = FALSE}
	if GotParam \{choose_sfx}
		SoundEvent \{event = ui_sfx_select}
	endif
	if (($hack_block_ui_back_for_a_bit = 1) && (<event> = menu_back))
		return
	endif
	if NOT ((<event> = menu_anim_in_done) || (<event> = menu_anim_out_done) || (<event> = menu_add_data) || (<event> = menu_remove_data) || (<event> = menu_mode_switch_done))
		if (<force_event> = FALSE)
			if is_ui_event_running
				return
			endif
		endif
		SpawnScriptNow ui_event_block params = <...>
	else
		ui_event_spawned <...>
	endif
endscript
is_event_dialogue_on = 0

script ui_get_dialogue 
	if ($is_event_dialogue_on = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script ui_set_dialogue \{value = 0}
	Change is_event_dialogue_on = <value>
endscript

script ui_event_spawned \{object = 1
		event = menu_change
		data = {
		}}
	if StructureContains \{structure = data
			Name = state}
		printf qs(0x37276fb1) p = <object> e = <event> s = (<data>.state) channel = ui_event
	else
		printf qs(0x7a06c2ff) p = <object> e = <event> channel = ui_event
	endif
	if StructureContains \{structure = data
			Name = set_dialogue}
		ui_set_dialogue \{value = 1}
	endif
	<data> = {object = <object> <data>}
	if (<object> = 1)
		UI :Unpause
		UI :eventcache_add event_id = <event> event_data = <data>
	elseif (<object> = 2)
		ui_object2 :Unpause
		ui_object2 :eventcache_add event_id = <event> event_data = <data>
	endif
endscript

script ui_event_add_params \{object = 1}
	ui_event event = menu_add_data data = <...>
endscript

script ui_event_remove_params \{object = 1}
	ui_event event = menu_remove_data data = <...>
endscript

script ui_event_add_continue \{event = menu_change
		object = 1}
	ui_event event = menu_add data = <add_state_data> object = <object>
	begin
	if NOT is_ui_event_running
		break
	endif
	Wait \{1
		gameframe}
	repeat
	ui_event event = <event> data = <continue_state_data> object = <object>
	begin
	if NOT is_ui_event_running
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ui_event_block \{object = 1
		event = menu_change
		data = {
		}}
	push_hide_flares
	OnExitRun \{pop_hide_flares}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	if (($hack_block_ui_back_for_a_bit = 1) && (<event> = menu_back))
		return
	endif
	ui_event_spawned event = <event> data = <data> object = <object>
	Block \{Type = taskmenu_callback}
	hide_flares \{num_frames = 5}
endscript

script ui_event_wait \{object = 1
		event = menu_change
		data = {
		}}
	SpawnScriptNow ui_event_wait_spawned params = {<...>}
endscript

script ui_event_wait_spawned 
	ui_event_wait_for_safe
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	SpawnScriptNow ui_event_block params = <...>
endscript

script ui_event_wait_for_safe 
	Wait \{1
		gameframe}
	begin
	if NOT is_ui_event_running
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ui_event_exists_in_stack 
	RequireParams \{[
			Name
		]
		all}
	UI :menustack_getstackcontents
	i = 0
	begin
	if ((<stack> [<i>].base_name) = <Name>)
		return \{true}
	endif
	if GotParam \{above}
		if ((<stack> [<i>].base_name) = <above>)
			return \{FALSE}
		endif
	endif
	i = (<i> + 1)
	repeat <stack_size>
	return \{FALSE}
endscript

script ui_event_get_stack 
	UI :menustack_getstackcontents
	return {<...>}
endscript

script ui_state_pak_load 
	printf channel = taskmenu 'UI: Loading pak "%s"' s = <pakname>
	SetPakManCurrent map = ui_paks pakname = <pakname>
endscript

script ui_state_anim_in_done 
	ui_event event = menu_anim_in_done object = <object>
endscript

script ui_state_anim_out_done 
	ui_event event = menu_anim_out_done object = <object>
endscript

script ui_event_get_top 
	ui_event_get_stack
	if (<stack_size> > 0)
		return (<stack> [0])
	else
		base_name = 'null'
		return base_name = <base_name>
	endif
endscript

script ui_event_is_top_popup 
	ui_event_get_top
	if GotParam \{is_popup}
		return \{true}
	else
		return \{FALSE}
	endif
endscript
