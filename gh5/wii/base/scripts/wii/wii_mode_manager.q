wii_current_mode = None

script wii_change_mode 
	RequireParams \{[
			mode
		]
		all}
	if ($wii_current_mode = <mode>)
		printf \{'Attempted to change to same mode, skipping'}
		return
	endif
	wii_exit_mode \{mode = $wii_current_mode}
	wii_enter_mode mode = <mode>
	Change wii_current_mode = <mode>
endscript

script wii_enter_mode 
	RequireParams \{[
			mode
		]
		all}
	printf 'Entering mode %a' a = <mode>
	wii_assert_mode_exists mode = <mode>
	quota_ptr = ($wii_mode_settings.<mode>.quotas)
	setupmemoryquotas $<quota_ptr>
	if StructureContains structure = ($wii_mode_settings.<mode>) zone_links
		MemPushContext \{quota_venue}
		CreatePakManMap map = zones links = ($wii_mode_settings.<mode>.zone_links) folder = 'zones/' uselinkslots
		MemPopContext
	endif
	if StructureContains structure = ($wii_mode_settings.<mode>) load_func
		func_ptr = ($wii_mode_settings.<mode>.load_func)
		<func_ptr>
	endif
endscript

script wii_exit_mode 
	RequireParams \{[
			mode
		]
		all}
	printf 'Exiting mode %a' a = <mode>
	wii_assert_mode_exists mode = <mode>
	if StructureContains structure = ($wii_mode_settings.<mode>) unload_func
		func_ptr = ($wii_mode_settings.<mode>.unload_func)
		<func_ptr>
	endif
	mpm_wait_until_free
	guitar_force_unload_anim_paks
	guitar_destroy_character_maps
	if existspakmanmap \{map = zones}
		SetPakManCurrentBlock \{map = zones
			pak = None}
		DestroyPakManMap \{map = zones}
	endif
	wii_unload_all_sfx
	clearcustomsong
endscript

script wii_change_sfx_mode 
	RequireParams \{[
			sfx_mode
		]
		all}
	wii_load_mode_sfx mode = <sfx_mode>
endscript

script wii_notify_state_change 
	RequireParams \{[
			ui_state
		]
		all}
	if wii_find_appropriate_mode ui_state = <ui_state>
		if ($wii_current_mode != <mode>)
			printf 'Changing mode to %d' d = <mode>
			if (<mode> = freestyle)
				anim_paks_set_state \{state = freestyle
					async = 0}
			endif
			wii_change_mode mode = <mode>
			printf 'Done changing mode to %d' d = <mode>
		endif
	endif
	if wii_find_appropriate_sfx_mode ui_state = <ui_state>
		wii_change_sfx_mode sfx_mode = <sfx_mode>
	endif
	printf \{'Sending menu_mode_switch_done'}
	ui_event \{event = menu_mode_switch_done}
endscript

script wii_is_state_change_needed 
	RequireParams \{[
			ui_state
		]
		all}
	<Change> = 0
	if wii_find_appropriate_mode ui_state = <ui_state>
		if ($wii_current_mode != <mode>)
			<Change> = 1
			return <Change>
		endif
	endif
	if wii_find_appropriate_sfx_mode ui_state = <ui_state>
		if ($wii_sfx_current_mode != <sfx_mode>)
			<Change> = 1
			return <Change>
		endif
	endif
	return <Change>
endscript

script wii_assert_mode_exists 
	RequireParams \{[
			mode
		]
		all}
	if NOT StructureContains structure = $wii_mode_settings <mode>
		ScriptAssert 'No settings exist for mode %a' a = <mode>
	endif
endscript

script wii_check_mode_settings 
	GetArraySize \{$wii_mode_list}
	if (<array_Size> > 0)
		i = 0
		begin
		mode = ($wii_mode_list [<i>])
		wii_assert_mode_exists mode = <mode>
		if NOT StructureContains structure = ($wii_mode_settings.<mode>) quotas
			ScriptAssert 'No quota settings exist for mode %a' a = <mode>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript
