ui_task_menu_default_focus_id = current_menu
ui_task_menu_default_anim_in_script = task_menu_default_anim_in
ui_task_menu_default_anim_out_script = task_menu_default_anim_out

script UI_InitializeStateMachine 
	if ObjectExists \{id = ui}
		return
	endif
	<com_disabled> = 0
	if NOT IsCompositeObjectManagerEnabled
		<com_disabled> = 1
		CompositeObjectManagerSetEnable \{on}
	endif
	CreateCompositeObject \{params = {
			name = ui
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
				component = MenuStack
			}
		]
		heap = FrontEnd}
	CreateCompositeObject \{params = {
			name = UI_object2
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
				component = MenuStack
			}
		]
		heap = FrontEnd}
	if (<com_disabled> = 1)
		CompositeObjectManagerSetEnable \{off}
	endif
	RegisterUIStates
	MemPushContext \{heap_ui_pak_slot}
	CreatePakManMap \{map = ui_paks
		links = UIPaks
		folder = 'Pak/ui/'
		allocheap = heap_ui_pak_slot
		vramheap = heap_ui_pak_slot}
	MemPopContext
	ui :fsm_set \{state = UIstate_null
		replacement = this
		params = {
			Object = 1
			base_name = 'null'
			initing = 1
		}}
endscript

script ui_print_states 
	if GotParam \{name}
		ui_event_get_stack
		GetArraySize <stack>
		printf qs(0x68fcfcbc) n = <array_size>
		if (<array_size> > 0)
			i = 0
			begin
			printf qs(0x32d9cad3) i = (<i> + 1) s = (<stack> [<i>].base_name)
			i = (<i> + 1)
			repeat <array_size>
		endif
	else
		ui :UnPause
		ui :FSM_PrintStateMachine
		ui :MenuStack_PrintContents
	endif
endscript

script Is_ui_event_running 
	if ScriptIsRunning \{ui_event_block}
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
	if GotParam \{choose_sfx}
		SoundEvent \{event = ui_sfx_select}
	endif
	if NOT ((<event> = menu_anim_in_done) || (<event> = menu_anim_out_done) || (<event> = menu_add_data) || (<event> = menu_remove_data))
		if (<force_event> = false)
			if Is_ui_event_running
				return
			endif
		endif
		spawnscriptnow ui_event_block params = <...>
	else
		ui_event_spawned <...>
	endif
endscript

script ui_event_spawned \{Object = 1
		event = menu_change
		data = {
		}}
	if StructureContains \{structure = data
			name = state}
		printf qs(0x37276fb1) p = <Object> e = <event> s = (<data>.state) channel = ui_event
	else
		printf qs(0x7a06c2ff) p = <Object> e = <event> channel = ui_event
	endif
	<data> = {Object = <Object> <data>}
	if (<Object> = 1)
		ui :UnPause
		ui :EventCache_Add event_id = <event> event_data = <data>
	elseif (<Object> = 2)
		UI_object2 :UnPause
		UI_object2 :EventCache_Add event_id = <event> event_data = <data>
	endif
endscript

script ui_event_add_params \{Object = 1}
	ui_event event = menu_add_data data = <...>
endscript

script ui_event_remove_params \{Object = 1}
	ui_event event = menu_remove_data data = <...>
endscript

script ui_event_change_device \{Object = 1}
	ui_event event = menu_change_device data = <...>
endscript

script ui_event_add_continue \{event = menu_change
		Object = 1}
	ui_event event = menu_add data = <add_state_data> Object = <Object>
	begin
	if NOT Is_ui_event_running
		break
	endif
	wait \{1
		gameframe}
	repeat
	ui_event event = <event> data = <continue_state_data> Object = <Object>
	begin
	if NOT Is_ui_event_running
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script ui_event_block \{Object = 1
		event = menu_change
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	ui_event_spawned event = <event> data = <data> Object = <Object>
	Block \{type = TaskMenu_Callback}
endscript

script ui_event_wait \{Object = 1
		event = menu_change
		data = {
		}}
	spawnscriptnow ui_event_wait_spawned params = {<...>}
endscript

script ui_event_wait_spawned 
	ui_event_wait_for_safe
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	spawnscriptnow ui_event_block params = <...>
endscript

script ui_event_wait_for_safe 
	wait \{1
		gameframe}
	begin
	if NOT Is_ui_event_running
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script ui_event_exists_in_stack 
	RequireParams \{[
			name
		]
		all}
	ui :MenuStack_GetStackContents
	if (<stack_size> = 0)
		return \{false}
	endif
	i = 0
	begin
	if ((<stack> [<i>].base_name) = <name>)
		return \{true}
	endif
	if GotParam \{above}
		if ((<stack> [<i>].base_name) = <above>)
			return \{false}
		endif
	endif
	i = (<i> + 1)
	repeat <stack_size>
	return \{false}
endscript

script ui_event_get_stack 
	ui :MenuStack_GetStackContents
	return <...>
endscript

script ui_state_pak_load 
	printf channel = TaskMenu 'UI: Loading pak "%s"' s = <pakname>
	SetPakManCurrent map = ui_paks pakname = <pakname>
endscript

script ui_state_anim_in_done 
	ui_event event = menu_anim_in_done Object = <Object>
endscript

script ui_state_anim_out_done 
	if ($game_mode != freeplay)
		hide_glitch
	endif
	ui_event event = menu_anim_out_done Object = <Object>
endscript

script ui_event_get_top 
	ui_event_get_stack
	GetArraySize \{stack}
	if (<array_size> > 0)
		return (<stack> [0])
	endif
endscript

script ui_event_is_top_popup 
	ui_event_get_top
	if GotParam \{is_popup}
		return \{true}
	else
		return \{false}
	endif
endscript
