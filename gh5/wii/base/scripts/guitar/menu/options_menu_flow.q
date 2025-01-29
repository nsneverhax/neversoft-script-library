options_for_manage_band = 0
top_rockers_which_mode = p1_quickplay

script setup_top_rockers_single 
	Change \{top_rockers_which_mode = p1_quickplay}
	Change \{game_mode = p1_quickplay}
	generic_event_choose \{state = uistate_select_instrument
		data = {
			from_top_rocker = 1
			override_base_name = 'options'
		}}
endscript

script setup_top_rockers_coop 
	ScriptAssert \{'setup_top_rockers_coop: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script setup_top_rockers_for_mode 
	ScriptAssert \{'setup_top_rockers_for_mode: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script reset_top_rockers_mode 
	ScriptAssert \{'reset_top_rockers_mode: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
store_autosave_required = 0

script store_maybe_autosave 
	ScriptAssert \{'store_maybe_autosave: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
