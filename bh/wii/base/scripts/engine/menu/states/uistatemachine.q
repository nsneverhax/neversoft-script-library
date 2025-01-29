ui_task_menu_default_focus_id = current_menu
ui_task_menu_default_anim_in_script = task_menu_default_anim_in
ui_task_menu_default_anim_out_script = task_menu_default_anim_out
0x6e8ed3ec = 10
0x9cd6325d = [
]

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
	array = []
	begin
	AddArrayElement array = <array> element = {state = NULL line = 0 file = NULL caller = NULL}
	repeat $0x6e8ed3ec
	Change 0x9cd6325d = <array>
endscript

script ui_print_states \{object = 1}
	UI :Unpause
	UI :fsm_printstatemachine
	UI :menustack_printcontents
	0xfe05d455
endscript

script 0xfe05d455 \{final = 0}
	printf \{'UIState history:'}
	i = 0
	begin
	0xf6503e00 = ($0x9cd6325d [<i>])
	if (<0xf6503e00>.state = NULL)
		break
	endif
	0xa8f36571 num = <i> struct = <0xf6503e00> final = <final>
	i = (<i> + 1)
	repeat $0x6e8ed3ec
endscript

script 0x6c838a67 
	osprintf \{'UIState history:'}
	0xfe05d455 \{final = 1}
endscript

script 0x8b43f711 
	RequireParams \{[
			state
			line
			file
			caller
		]
		all}
	new_entry = {state = (<state>) line = <line> file = <file> caller = <caller>}
	array = []
	AddArrayElement array = <array> element = <new_entry>
	i = 0
	begin
	AddArrayElement array = <array> element = ($0x9cd6325d [<i>])
	i = (<i> + 1)
	repeat ($0x6e8ed3ec - 1)
	Change 0x9cd6325d = <array>
endscript

script is_ui_event_running 
	if ScriptIsRunning \{ui_event_block}
		return \{true}
	endif
	return \{FALSE}
endscript

script ui_event_if_camera_finished 
	if is_menu_camera_finished
		getcallerinfo
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
	if NOT GotParam \{caller}
		getcallerinfo
	endif
	if NOT ((<event> = menu_anim_in_done) || (<event> = menu_anim_out_done) || (<event> = menu_add_data) || (<event> = menu_remove_data) || (<event> = menu_mode_switch_done))
		if (<force_event> = FALSE)
			if is_ui_event_running
				return
			endif
		endif
		SpawnScriptNow ui_event_block params = <...>
	else
		ui_event_spawned <...> 0x6651a360
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
	if GotParam \{caller}
		printf ' from %a(%b) %c' a = <file> b = <line> c = <caller>
	endif
	if StructureContains \{structure = data
			Name = set_dialogue}
		ui_set_dialogue \{value = 1}
	endif
	if NOT GotParam \{0x6651a360}
		0x7c12c659 = NULL
		if StructureContains \{structure = data
				Name = state}
			0x7c12c659 = (<data>.state)
		elseif (<event> = menu_back)
			0x7c12c659 = <event>
		endif
		if (<0x7c12c659> != NULL)
			0x8b43f711 state = (<0x7c12c659>) line = <line> file = <file> caller = <caller>
		endif
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
	getcallerinfo
	ui_event event = menu_add data = <add_state_data> object = <object> line = <line> file = <file> caller = <caller>
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
	sdcardmanagerfunc \{func = push_lock_card}
	OnExitRun \{ui_event_block_done}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	if (($hack_block_ui_back_for_a_bit = 1) && (<event> = menu_back))
		return
	endif
	if NOT GotParam \{caller}
		getcallerinfo
	endif
	ui_event_spawned event = <event> data = <data> object = <object> line = <line> file = <file> caller = <caller>
	Block \{Type = taskmenu_callback}
	hide_flares \{num_frames = 5}
endscript

script ui_event_block_done 
	pop_hide_flares
	sdcardmanagerfunc \{func = pop_lock_card}
endscript

script ui_event_wait \{object = 1
		event = menu_change
		data = {
		}}
	getcallerinfo
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
