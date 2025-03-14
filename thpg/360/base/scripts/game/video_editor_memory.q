ve_memory_state = unused
ve_playback_render = 0
ve_render_edit_size = 2096896
ve_current_mem_multiplier = 1

script ve_set_memory_state 
	printf 've_set_memory_state - %s' s = <state>
	if (<state> = user_camera)
		state = playback
	endif
	if ($ve_memory_state = <state>)
		printf 've_set_memory_state - Already using %s' s = <state>
		return
	endif
	if ($ve_memory_state = playback_freed_peds)
		if (<state> = playback)
			printf 've_set_memory_state - No need to change to playback state'
			return
		endif
	endif
	ve_free_bink_buffers
	ve_free_extra_zones
	if NOT (<state> = playback_freed_peds)
		ve_free_recorded_clip
	endif
	if ($ve_playback_render = 0)
		EditBufferFunc func = free_buffer
	endif
	switch ($ve_memory_state)
		case render
		case playback_freed_peds
		VideoClipSlotFunc free_all
		case playback
		if NOT (<state> = playback_freed_peds)
			VideoClipSlotFunc free_all
		endif
		case record
		case user_camera
		case unused
		nullscript
		default
		scriptassert 'Meh'
	endswitch
	change ve_memory_state = <state>
	switch (<state>)
		case playback_freed_peds
		ve_unload_ped_pak
		ve_alloc_extra_zones
		ve_allocate_bink_buffers
		case playback
		ve_ensure_slots_allocated
		case render
		ve_ensure_slots_allocated render_slots_only
		mempushcontext scratch
		EditBufferFunc func = allocate_buffer ($ve_render_edit_size)
		mempopcontext
		case user_camera
		scriptassert 'not implemented yet'
		case unused
		if NOT ($ve_preview_actor = none)
			ve_destroy_preview_objects
		endif
		if NOT gotparam dont_reload_ped_pak
			ve_load_ped_pak
		endif
		case record
		nullscript
		default
		scriptassert 'Meh'
	endswitch
endscript

script ve_set_render_playback 
	ve_set_memory_state \{state = playback}
	if NOT ($ve_playback_render = <toggle>)
		printf 've_set_render_playback %d' d = <toggle>
		VideoClipSlotFunc \{free_all}
		if (<toggle> = 1)
			mempushcontext \{animexportdata}
			EditBufferFunc func = allocate_buffer ($ve_render_edit_size)
			mempopcontext
		else
			EditBufferFunc \{func = clear}
			EditBufferFunc \{func = free_buffer}
			ve_ensure_slots_allocated
		endif
		change ve_playback_render = <toggle>
	endif
endscript

script ve_free_temporaries_level_unload 
	ve_set_memory_state \{state = unused
		dont_reload_ped_pak}
	if NOT IsInCrib
		EnablePakManStreaming
	endif
	ve_restore_temp_changes \{not_zone_objects}
	change \{video_editor_in_video_editor = 0}
endscript

script ve_ensure_slots_allocated 
	VideoClipSlotFunc \{get_num_slots}
	if (<num_slots> = 0)
		if ($ve_memory_state = render)
			mempushcontext \{scratch}
			VideoClipSlotFunc \{allocate
				num_slots = 1}
			mempopcontext
		else
			if ($ve_playback_render = 0)
				mempushcontext \{animexportcapture}
				VideoClipSlotFunc \{allocate
					num_slots = 5}
				mempopcontext
				mempushcontext \{animexportdata}
				VideoClipSlotFunc \{allocate
					num_slots = 5}
				mempopcontext
			endif
		endif
	endif
endscript

script ve_unload_ped_pak 
	if isassetloaded name = `zones/z_peds/z_peds.qb`
		printf 've_unload_ped_pak'
		ve_stall_for_zone_loads
		goal_kill_all_peds ignore_goal = null block
		KillAllPedLifeObjects
		AI_LevelUnloadCleanup
		unloadpak 'zones/z_vehicles/z_vehicles.pak'
		unloadpak 'zones/z_peds/z_peds.pak'
		waitunloadpak 'zones/z_vehicles/z_vehicles.pak'
		waitunloadpak 'zones/z_peds/z_peds.pak'
		CleanupOrphanEntities
		flushdeadobjects
	endif
endscript

script ve_load_ped_pak 
	if NOT isassetloaded name = `zones/z_peds/z_peds.qb`
		printf 've_load_ped_pak'
		ve_show_loading_screen
		ve_free_bink_buffers
		ve_free_extra_zones
		waitunloadpak
		CleanupOrphanEntities
		flushdeadobjects
		printf 've_load_ped_pak - Loading paks'
		loadpak 'zones/z_peds/z_peds.pak' heap = pedparts
		loadpak 'zones/z_vehicles/z_vehicles.pak' heap = pedparts
		printf 've_load_ped_pak - Loaded paks'
		if NOT IsInCrib
			printf 've_load_ped_pak - Parsing nodearrays'
			parsenodearray {
				zone_name = z_peds
				array_name = Z_Peds_NodeArray
				queue
			}
			parsenodearray {
				zone_name = z_vehicles
				array_name = z_vehicles_NodeArray
				queue
			}
			printf 've_load_ped_pak - Blocking for parsing'
			parsenodearray block
			printf 've_load_ped_pak - Done blocking'
		endif
		ve_stall_for_zone_loads
		if gotparam shown_loading_screen
			ve_hide_loading_screen
		endif
	endif
endscript

script ve_show_loading_screen 
	if NOT isloadingscreenactive
		setbuttoneventmappings \{block_menu_input}
		load_level_handle_loading_screen
		return \{true
			shown_loading_screen = 1}
	else
		return \{false}
	endif
endscript

script ve_hide_loading_screen 
	if isloadingscreenactive
		hideloadingscreen
		setbuttoneventmappings \{unblock_menu_input}
	endif
endscript

script ve_free_up_scratch_heap 
	printf \{"ve_free_up_scratch_heap"}
	ve_free_bink_buffers
	waitunloadpak
	CleanupOrphanEntities
	flushdeadobjects
endscript

script ve_restore_scratch_heap 
	printf \{"ve_restore_scratch_heap"}
	waitunloadpak
	CleanupOrphanEntities
	flushdeadobjects
endscript

script ve_in_playback_state 
	if (($ve_memory_state = playback) || ($ve_memory_state = playback_freed_peds))
		return \{true}
	endif
	return \{false}
endscript

script ve_adjust_for_buffer_sizes \{multiplier = 1}
	if NOT ($ve_max_record_time = 15.0)
		scriptassert \{'Call this only once! Or update this number to match the new default'}
	endif
	change ve_max_record_time = (<multiplier> * ($ve_max_record_time))
	change video_max_length = (<multiplier> * ($video_max_length))
	change timeline_max_length = ($video_max_length + $ve_max_record_time)
	SetVideoClipBufferSizeMultiplier multiplier = <multiplier>
	change ve_current_mem_multiplier = (<multiplier>)
endscript
