
script savegame_async_is_busy 
	getarraysize \{$savegame_async_queue}
	if (<array_size> > 0)
		i = 0
		begin
		entry = ($savegame_async_queue [<i>])
		if gotparam \{savegame}
			if (<entry>.savegame = <savegame>)
				return \{true}
			endif
		else
			return \{true}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script savegame_async_button_in 
	requireparams \{[
			savegame
			callback
		]
		all}
	savegame_async_checks savegame = <savegame>
	savegame_async_add_request savegame = <savegame> state = button_in callback = <callback> data = <data>
endscript

script savegame_async_save 
	requireparams \{[
			savegame
			callback
		]
		all}
	savegame_async_checks savegame = <savegame>
	savegame_async_add_request savegame = <savegame> state = saving callback = <callback> data = <data>
endscript

script savegame_async_add_request \{data = {
		}}
	requireparams \{[
			savegame
			data
			callback
		]
		all}
	addarrayelement array = ($savegame_async_queue) element = {savegame = <savegame> state = <state> callback = <callback> data = <data>}
	change savegame_async_queue = <array>
endscript

script savegame_async_init 
	if scriptisrunning \{savegame_async_update}
		scriptassert \{'savegame_async_init already called'}
	endif
	spawnscriptnow \{savegame_async_update}
endscript

script savegame_async_deinit 
	if savegame_async_is_busy
		printstruct \{$savegame_async_queue}
		scriptassert \{'Still in the middle of a savegame_async operation'}
	endif
	killspawnedscript \{name = savegame_async_update}
endscript

script savegame_async_checks 
	requireparams \{[
			savegame
		]
		all}
	if NOT scriptisrunning \{savegame_async_update}
		scriptassert \{'savegame_async_init was not called'}
	endif
endscript

script savegame_async_update 
	setscriptcannotpause
	begin
	getarraysize ($savegame_async_queue)
	if (<array_size> > 0)
		params = (($savegame_async_queue) [0])
		pushunsafeforshutdown \{context = savegame_async_update}
		if savegame_async_update_worker <params> savegame = <chosen_index>
			printf 'savegame_async_update - Completed without errors (%a)' a = (<params>.savegame)
			spawnscriptlater (<params>.callback) params = {data = (<params>.data) savegame = (<params>.savegame) success = 1}
		else
			printf 'savegame_async_update - Completed with errors (%a)' a = (<params>.savegame)
			spawnscriptlater (<params>.callback) params = {data = (<params>.data) savegame = (<params>.savegame) success = 0 error = <error> error_params = <error_params>}
		endif
		popunsafeforshutdown \{context = savegame_async_update}
		removearrayelement array = ($savegame_async_queue) index = 0
		change savegame_async_queue = <array>
		if gotparam \{error}
			printf 'savegame_async_update - Completed with fatal error %e (%a)' e = <error> a = (<params>.savegame)
			change \{savegame_async_queue = [
				]}
			change savegame_async_last_error = <error>
			return
		else
			change \{savegame_async_last_error = none}
		endif
	endif
	wait \{1
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
				return \{false}
			endif
			printf \{'savegame_async_update_worker - dlc scan'}
			savegame_async_update_dlc_scan <...>
			return \{true}
		endif
		default
		scriptassert 'savegame_async_update_worker - invalid state %s' s = <state>
	endswitch
	return false error = <error> error_params = <error_params>
endscript
