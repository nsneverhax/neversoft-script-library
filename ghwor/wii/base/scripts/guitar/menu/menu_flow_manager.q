null_flow_state = {
	is_null
	actions = [
		{
			action = null_action
			flow_state = null_flow_state
		}
	]
}
ui_flow_manager_state = [
	main_menu_fs
	null_flow_state
	null_flow_state
	null_flow_state
]
previous_flow_manager_state = [
	null_flow_state
	null_flow_state
	null_flow_state
	null_flow_state
]
ui_flow_manager_under = [
	null_flow_state
	null_flow_state
	null_flow_state
	null_flow_state
]
g_flow_manager_responding_to_action = [
	0
	0
	0
	0
]
menu_flow_locked = 0
menu_flow_play_sound = 1
ui_flow_hack_previous_state = None

script ui_flow_manager_respond_to_action \{device_num = 0
		Player = 1
		create_params = {
		}
		destroy_params = {
		}
		func_params = {
		}
		flow_state_func_params = {
		}
		play_sound = 1}
	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	if NOT ((<Player> = 1) || (<Player> = 2))
		ScriptAssert \{qs(0xd9be3552)}
	endif
	player_index = (<Player> - 1)
	current_flow_state_name = ($ui_flow_manager_state [<player_index>])
	current_flow_state = ($<current_flow_state_name>)
	new_state_name = <current_flow_state_name>
	previous_flow_state_name = ($previous_flow_manager_state [<player_index>])
	previous_flow_state = ($<previous_flow_state_name>)
	under_flow_state_name = ($ui_flow_manager_under [<player_index>])
	under_flow_state = ($<under_flow_state_name>)
	null_flow_state_name = null_flow_state
	found_action = 0
	if ((GotParam action) && ($g_flow_manager_responding_to_action [<player_index>] = 0))
		SetArrayElement ArrayName = g_flow_manager_responding_to_action globalarray index = (<player_index>) NewValue = 1 ResolveGlobals = 0
		GetArraySize (<current_flow_state>.actions)
		action_array_size = <array_Size>
		array_entry = 0
		begin
		if (<action> = <current_flow_state>.actions [(<array_entry>)].action)
			if ($menu_flow_play_sound = 1)
				if (<play_sound> = 1)
					if (<action> = go_back)
						SoundEvent \{event = Generic_Menu_Back_SFX}
					else
						ui_sfx \{menustate = Generic
							uitype = select}
					endif
				endif
			else
				Change \{menu_flow_play_sound = 1}
			endif
			<found_action> = 1
			spawned_func = 0
			if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) func
				action_function = (<current_flow_state>.actions [<array_entry>].func)
				if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) func_params
					func_params = (<current_flow_state>.actions [<array_entry>].func_params)
				endif
				if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) spawned_func
					<spawned_func> = 1
				endif
			endif
			if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) use_last_flow_state
				<new_state_name> = <previous_flow_state_name>
			else
				if StructureContains structure = ((<current_flow_state>.actions [(<array_entry>)])) flow_state
					<new_state_name> = ((<current_flow_state>.actions [(<array_entry>)]).flow_state)
				elseif StructureContains structure = ((<current_flow_state>.actions [(<array_entry>)])) flow_state_func
					if StructureContains structure = ((<current_flow_state>.actions [(<array_entry>)])) flow_state_func_params
						<flow_state_func_params> = ((<current_flow_state>.actions [(<array_entry>)]).flow_state_func_params)
					endif
					Change \{transitions_locked = 1}
					flow_state_func = ((<current_flow_state>.actions [(<array_entry>)]).flow_state_func)
					<flow_state_func> <flow_state_func_params>
					Change \{transitions_locked = 0}
					if NOT GotParam \{flow_state}
						ScriptAssert \{qs(0x2ef45bde)}
					endif
					<new_state_name> = <flow_state>
				else
					ScriptAssert \{qs(0x1425075c)}
				endif
			endif
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <action_array_size>
		SetArrayElement ArrayName = g_flow_manager_responding_to_action globalarray index = (<player_index>) NewValue = 0 ResolveGlobals = 0
	endif
	hack_ps2_get_saveload_successor_checksum
	if ((<ps2_saveload_successor_checksum> != None) && (<new_state_name> = hack_ps2_saveload_successor))
		printf \{qs(0xe8ffab09)}
		hack_ps2_set_saveload_successor_checksum \{None}
		new_state_name = <ps2_saveload_successor_checksum>
		if (ui_flow_hack_previous_state != None)
			previous_flow_state_name = ($ui_flow_hack_previous_state)
			previous_flow_state = (<previous_flow_state_name>)
		endif
		if StructureContains structure = ($ps2_saveload_successor_action_state) func
			action_function = ($ps2_saveload_successor_action_state.func)
		endif
		if StructureContains structure = ($ps2_saveload_successor_action_state) func_params
			func_params = (<current_flow_state>.actions [<array_entry>].func_params)
		endif
		if StructureContains structure = ($ps2_saveload_successor_action_state) spawned_func
			<spawned_func> = 1
		endif
		Change \{ps2_saveload_successor_action_state = {
				please_dont_crash
			}}
	endif
	if (<found_action>)
		new_state = ($<new_state_name>)
		is_popup = (0)
		if StructureContains structure = (<new_state>) popup
			<is_popup> = (1)
		endif
		state_destroy_params = {}
		if StructureContains structure = (<new_state>) destroy_params
			state_destroy_params = (<new_state>.destroy_params)
		endif
		if ($playing_song = 0)
			if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) transition_screen
				transition_screen_struct = ((<current_flow_state>.actions [<array_entry>]).transition_screen)
				transition_create_func = (<transition_screen_struct>.create)
				<transition_create_func>
			endif
		endif
		if (<is_popup>)
			if NOT StructureContains structure = (<under_flow_state>) is_null
				if StructureContains structure = (<current_flow_state>) Destroy
					destroy_func = (<current_flow_state>.Destroy)
					<destroy_func> Player = <Player> <destroy_params> <state_destroy_params>
				endif
			endif
			SetArrayElement ArrayName = ui_flow_manager_under globalarray index = (<player_index>) NewValue = <current_flow_state_name> ResolveGlobals = 0
			LaunchEvent \{Type = unfocus
				target = root_window}
		else
			if StructureContains structure = (<current_flow_state>) Destroy
				destroy_func = (<current_flow_state>.Destroy)
				<destroy_func> Player = <Player> <destroy_params> <state_destroy_params>
			endif
			if NOT StructureContains structure = (<under_flow_state>) is_null
				if StructureContains structure = (<under_flow_state>) Destroy
					destroy_func = (<under_flow_state>.Destroy)
					<destroy_func> Player = <Player> <destroy_params> <state_destroy_params>
				endif
				SetArrayElement ArrayName = ui_flow_manager_under globalarray index = (<player_index>) NewValue = <null_flow_state_name> ResolveGlobals = 0
				LaunchEvent \{Type = focus
					target = root_window}
			endif
		endif
		SetArrayElement ArrayName = previous_flow_manager_state globalarray index = (<player_index>) NewValue = <current_flow_state_name> ResolveGlobals = 0
		SetArrayElement ArrayName = ui_flow_manager_state globalarray index = (<player_index>) NewValue = <new_state_name> ResolveGlobals = 0
		if GotParam \{action_function}
			if (<spawned_func> = 1)
				SpawnScriptNow <action_function> params = {device_num = (<device_num>) <func_params>}
			else
				<action_function> device_num = (<device_num>) <func_params>
			endif
		endif
		if ($playing_song = 0)
			if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) transition_screen
				transition_screen_struct = ((<current_flow_state>.actions [<array_entry>]).transition_screen)
				transition_destroy_func = (<transition_screen_struct>.Destroy)
				<transition_destroy_func>
			endif
		endif
		pak = <new_state_name>
		state_create_params = {}
		if StructureContains structure = (<new_state>) create_params
			state_create_params = (<new_state>.create_params)
		endif
		if StructureContains structure = (<new_state>) create
			create_func = (<new_state>.create)
			<create_func> Player = <Player> <create_params> <state_create_params>
			if ScreenElementExists \{id = gh3c_fade_box}
				DestroyScreenElement \{id = gh3c_fade_box}
			endif
		endif
		if (<play_sound>)
			if (<action> = go_back)
				SoundEvent \{event = Generic_Menu_Back_SFX}
			else
				ui_sfx \{menustate = Generic
					uitype = select}
			endif
		endif
		check_front_end_animations flow_state = <new_state_name>
	endif
endscript

script start_flow_manager \{flow_state = main_menu_fs
		Player = 1
		create_params = {
		}}
	if NOT ((<Player> = 1) || (<Player> = 2))
		ScriptAssert \{qs(0xd9be3552)}
	endif
	player_index = (<Player> - 1)
	SetArrayElement ArrayName = ui_flow_manager_state globalarray index = (<player_index>) NewValue = <flow_state> ResolveGlobals = 0
	current_flow_state_name = ($ui_flow_manager_state [<player_index>])
	current_flow_state = ($<current_flow_state_name>)
	printf \{qs(0x24f2c8a3)}
	pak = <current_flow_state_name>
	hack_ps2_get_saveload_successor_checksum
	if ((<ps2_saveload_successor_checksum> != None) && (<pak> = hack_ps2_saveload_successor))
		hack_ps2_set_saveload_successor_checksum \{None}
		pak = <ps2_saveload_successor_checksum>
		if (ui_flow_hack_previous_state != None)
			previous_flow_state_name = ($ui_flow_hack_previous_state)
			previous_flow_state = (<previous_flow_state_name>)
		endif
	endif
	state_create_params = {}
	if StructureContains structure = (<current_flow_state>) create_params
		state_create_params = (<current_flow_state>.create_params)
	endif
	if StructureContains structure = (<current_flow_state>) create
		create_func = (<current_flow_state>.create)
		<create_func> Player = <Player> <create_params> <state_create_params>
	endif
endscript

script shut_down_flow_manager \{Player = 1}
	if NOT ((<Player> = 1) || (<Player> = 2))
		ScriptAssert \{qs(0xd9be3552)}
	endif
	player_index = (<Player> - 1)
	current_flow_state_name = ($ui_flow_manager_state [<player_index>])
	current_flow_state = ($<current_flow_state_name>)
	if StructureContains structure = (<current_flow_state>) Destroy
		destroy_func = (<current_flow_state>.Destroy)
		<destroy_func> Player = <Player> <destroy_params>
	endif
	if GotParam \{resetstate}
		SetArrayElement ArrayName = ui_flow_manager_state globalarray index = (<player_index>) NewValue = null_flow_state ResolveGlobals = 0
	endif
endscript
