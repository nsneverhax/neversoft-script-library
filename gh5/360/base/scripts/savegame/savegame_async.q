
script savegame_async_is_busy 
	GetArraySize \{$savegame_async_queue}
	if (<array_Size> > 0)
		i = 0
		begin
		entry = ($savegame_async_queue [<i>])
		if GotParam \{savegame}
			if (<entry>.savegame = <savegame>)
				return \{true}
			endif
		else
			return \{true}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script savegame_async_button_in 
	RequireParams \{[
			savegame
			callback
		]
		all}
	savegame_async_checks savegame = <savegame>
	savegame_async_add_request savegame = <savegame> state = button_in callback = <callback> data = <data>
endscript

script savegame_async_save 
	RequireParams \{[
			savegame
			callback
		]
		all}
	savegame_async_checks savegame = <savegame>
	savegame_async_add_request savegame = <savegame> state = saving callback = <callback> data = <data>
endscript

script savegame_async_add_request \{data = {
		}}
	RequireParams \{[
			savegame
			data
			callback
		]
		all}
	AddArrayElement array = ($savegame_async_queue) element = {savegame = <savegame> state = <state> callback = <callback> data = <data>}
	Change savegame_async_queue = <array>
endscript

script savegame_async_init 
	if ScriptIsRunning \{savegame_async_update}
		ScriptAssert \{'savegame_async_init already called'}
	endif
	SpawnScriptNow \{savegame_async_update}
endscript

script savegame_async_deinit 
	if savegame_async_is_busy
		printstruct \{$savegame_async_queue}
		ScriptAssert \{'Still in the middle of a savegame_async operation'}
	endif
	KillSpawnedScript \{Name = savegame_async_update}
endscript

script savegame_async_checks 
	RequireParams \{[
			savegame
		]
		all}
	if NOT ScriptIsRunning \{savegame_async_update}
		ScriptAssert \{'savegame_async_init was not called'}
	endif
endscript

script savegame_async_update 
	setscriptcannotpause
	begin
	GetArraySize ($savegame_async_queue)
	if (<array_Size> > 0)
		params = (($savegame_async_queue) [0])
		push_unsafe_for_shutdown \{reason = savegame_async_update}
		if savegame_async_update_worker <params> savegame = <chosen_index>
			printf 'savegame_async_update - Completed without errors (%a)' a = (<params>.savegame)
			SpawnScriptLater (<params>.callback) params = {data = (<params>.data) savegame = (<params>.savegame) success = 1}
		else
			printf 'savegame_async_update - Completed with errors (%a)' a = (<params>.savegame)
			SpawnScriptLater (<params>.callback) params = {data = (<params>.data) savegame = (<params>.savegame) success = 0 error = <error> error_params = <error_params>}
		endif
		pop_unsafe_for_shutdown \{reason = savegame_async_update}
		RemoveArrayElement array = ($savegame_async_queue) index = 0
		Change savegame_async_queue = <array>
		if GotParam \{error}
			printf 'savegame_async_update - Completed with fatal error %e (%a)' e = <error> a = (<params>.savegame)
			Change \{savegame_async_queue = [
				]}
			Change savegame_async_last_error = <error>
			return
		else
			Change \{savegame_async_last_error = None}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script savegame_async_update_worker 
	switch <state>
		case saving
		printf \{'savegame_async_update_worker - saving'}
		if savegame_async_update_saving <...>
			return \{true}
		endif
		case button_in
		printf \{'savegame_async_update_worker - button_in'}
		if savegame_async_update_button_in <...>
			if abort_for_signout controller = <savegame>
				return \{FALSE}
			endif
			printf \{'savegame_async_update_worker - dlc scan'}
			savegame_async_update_dlc_scan <...>
			return \{true}
		endif
		default
		ScriptAssert 'savegame_async_update_worker - invalid state %s' s = <state>
	endswitch
	return FALSE error = <error> error_params = <error_params>
endscript
