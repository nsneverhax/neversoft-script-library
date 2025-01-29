menu_stack_default_focus_id = current_menu
menu_stack_default_anim_in_script = task_menu_default_anim_in
menu_stack_default_anim_out_script = task_menu_default_anim_out
menu_stack_additional_create_script = ui_additional_create
menu_stack_additional_destroy_script = ui_additional_destroy

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
		folder = 'Pak/ui/'
		allocheap = heap_ui_pak_slot
		vramheap = heap_ui_pak_slot
		processingheap = heap_ui_pak_slot}
	MemPopContext
endscript

script ui_registerstate \{Name = !q1768515945
		params = 0x69696969}
	UI :menustack_registerstate {
		Name = <Name>
		params = <params>
	}
endscript

script ui_print_states 
	if GotParam \{Name}
		ui_event_get_stack
		GetArraySize <stack>
		printf qs(0x68fcfcbc) n = <array_Size>
		if (<array_Size> > 0)
			i = 0
			begin
			printf qs(0x32d9cad3) i = (<i> + 1) s = (<stack> [<i>].base_name)
			i = (<i> + 1)
			repeat <array_Size>
		endif
	else
		UI :Unpause
		UI :menustack_printcontents
	endif
endscript

script is_ui_event_running 
	if UI :menustack_isprocesssing
		return \{true}
	endif
	return \{FALSE}
endscript

script ui_event_if_camera_finished 
	if is_menu_camera_finished
		ui_event {
			event = <event>
			state = <state>
			data = <data>
		}
	endif
endscript

script ui_event \{event = !q1768515945
		state = None
		data = {
		}}
	if (<state> != None)
		data = {<data> state = <state>}
		printf qs(0xd6e589bd) e = <event> s = (<data>.state) channel = ui_event
	else
		printf qs(0xde330243) e = <event> channel = ui_event
	endif
	UI :Unpause
	UI :menustack_event event_id = <event> event_data = <data>
endscript

script ui_event_wait \{event = menu_change
		data = {
		}}
	UI :obj_spawnscript {
		ui_event_wait_spawned
		params = {
			event = <event>
			state = <state>
			data = <data>
		}
	}
endscript

script ui_event_wait_spawned \{event = menu_change
		data = {
		}}
	printf \{channel = ui_event
		qs(0xe026f77b)}
	ui_event_wait_for_safe
	ui_event_block {
		event = <event>
		state = <state>
		data = <data>
	}
endscript

script ui_event_block \{event = menu_change
		data = {
		}}
	printf \{channel = ui_event
		qs(0x280e468e)}
	ui_event {
		event = <event>
		state = <state>
		data = <data>
	}
	ui_event_wait_for_safe
endscript

script ui_event_add_params 
	ui_event event = menu_add_data data = <...>
endscript

script ui_event_remove_params 
	ui_event event = menu_remove_data data = <...>
endscript

script ui_event_change_device 
	ui_event event = menu_change_device data = <...>
endscript

script ui_event_get_param_from_top \{param = !q1768515945}
	return_struct = {}
	ui_event_get_stack
	GetArraySize <stack>
	if (<array_Size> > 0)
		if StructureContains structure = (<stack> [0]) <param>
			AddParam structure_name = return_struct Name = <param> value = ((<stack> [0]).<param>)
			return <return_struct>
		endif
	endif
endscript

script ui_event_wait_for_safe 
	begin
	if NOT is_ui_event_running
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ui_event_exists_in_stack \{Name = 0x69696969
		above = 'none'}
	UI :menustack_getstackcontents
	if (<stack_size> = 0)
		return \{FALSE}
	endif
	i = 0
	begin
	if ((<stack> [<i>].base_name) = <Name>)
		return \{true}
	endif
	if (<above> != 'none')
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

script ui_state_pak_load \{pakname = 0x69696969}
	SetPakManCurrent map = ui_paks pakname = <pakname>
endscript

script ui_event_is_top_popup 
	ui_event_get_top
	if GotParam \{is_popup}
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script ui_return_to_safe_state 
	ui_event_wait \{event = menu_change
		state = uistate_freeplay
		data = {
			clear_previous_stack
			signin_change
		}}
endscript

script ui_additional_create 
	printf \{channel = ui_event
		qs(0x392ab336)}
	menu_transition_start_rendering
	update_gameplay_systems base_name = <base_name> systems = <systems>
	maybe_create_ui_visualizer preset = <visualizer_preset>
endscript

script ui_additional_destroy 
	printf \{channel = ui_event
		qs(0x9fcbebfc)}
endscript
