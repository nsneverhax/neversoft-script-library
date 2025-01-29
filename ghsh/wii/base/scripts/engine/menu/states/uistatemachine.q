ui_task_menu_default_focus_id = current_menu
ui_task_menu_default_anim_in_script = task_menu_default_anim_in
ui_task_menu_default_anim_out_script = task_menu_default_anim_out
0x86fdcfea = {
	enable = true
	Active = FALSE
	0xd77d3b61 = FALSE
}
0x8e314709 = true

script 0x31956c10 
	if GotParam \{true}
		Change \{structurename = 0x86fdcfea
			enable = true}
	elseif GotParam \{FALSE}
		if 0x16cc1b60
			0xd8bd876f
		endif
		Change \{structurename = 0x86fdcfea
			enable = FALSE}
	else
		0x93d8d5cf \{qs(0x76a9f1b5)}
	endif
endscript

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
			base_name = 'null'
		}}
endscript

script ui_print_states 
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
	if NOT ((<event> = menu_anim_in_done) || (<event> = menu_anim_out_done) || (<event> = menu_add_data) || (<event> = menu_remove_data))
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

script ui_event_spawned \{event = menu_change
		data = {
		}}
	if StructureContains \{structure = data
			Name = state}
		0x8dbdaee4 qs(0xd6e589bd) e = <event> s = (<data>.state) channel = ui_event
	else
		0x8dbdaee4 qs(0xde330243) e = <event> channel = ui_event
	endif
	if GotParam \{0x1c97beb0}
		Change \{structurename = 0x86fdcfea
			0xd77d3b61 = true}
	else
		<0xc6361ec6> = uistate_null
		if GotParam \{state}
			<0xc6361ec6> = <state>
		endif
		if StructureContains \{structure = data
				Name = state}
			<0xc6361ec6> = (<data>.state)
		endif
		switch <0xc6361ec6>
			case uistate_boot_iis
			case uistate_signin
			case uistate_mainmenu_intro
			case Uistate_gameplay
			case Uistate_pausemenu
			case uistate_song_unpause
			Change \{structurename = 0x86fdcfea
				0xd77d3b61 = true}
		endswitch
	endif
	UI :Unpause
	UI :eventcache_add event_id = <event> event_data = <data>
endscript

script ui_event_add_params 
	ui_event event = menu_add_data data = <...>
endscript

script ui_event_remove_params 
	ui_event event = menu_remove_data data = <...>
endscript

script ui_event_add_continue \{event = menu_change}
	ui_event event = menu_add data = <add_state_data>
	begin
	if NOT is_ui_event_running
		break
	endif
	Wait \{1
		gameframe}
	repeat
	ui_event event = <event> data = <continue_state_data>
	begin
	if NOT is_ui_event_running
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ui_event_block \{event = menu_change
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	ui_event_spawned event = <event> data = <data>
	Block \{Type = taskmenu_callback}
endscript

script ui_event_wait \{event = menu_change
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
	if (<stack_size> < 1)
		return \{FALSE}
	endif
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
	if ($0x86fdcfea.Active = true)
		Change \{structurename = 0x86fdcfea
			Active = FALSE}
		printf \{'ui_event: pop_mini_loading_screen'}
		printstruct <...>
		0xdf9f604d
	endif
	ui_event \{event = menu_anim_in_done}
endscript

script ui_state_anim_out_done 
	hide_glitch
	if ($0x86fdcfea.enable = true)
		if ($0x86fdcfea.Active = FALSE)
			if ($0x86fdcfea.0xd77d3b61 = true)
				Change \{structurename = 0x86fdcfea
					0xd77d3b61 = FALSE}
			else
				Change \{structurename = 0x86fdcfea
					Active = true}
				printf \{'ui_event: push_mini_loading_screen'}
				printstruct <...>
				0x10b35a47
			endif
		endif
	endif
	ui_event \{event = menu_anim_out_done}
endscript

script ui_event_get_top 
	ui_event_get_stack
	GetArraySize <stack>
	if (<array_Size> > 0)
		return (<stack> [0])
	endif
endscript
