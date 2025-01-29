
script ui_init_music_store_scan_marketplace 
endscript

script ui_deinit_music_store_scan_marketplace 
endscript

script ui_create_music_store_scan_marketplace 
	SpawnScriptNow ui_create_music_store_scan_marketplace_spawned params = <...>
endscript

script ui_create_music_store_scan_marketplace_spawned 
	hide_glitch \{num_frames = 8}
	Wait \{2
		gameframes}
	if ($g_marketplace_responding_to_error = 1)
		return
	endif
	if NOT ui_event_exists_in_stack \{Name = 'music_store_scan_marketplace'}
		return
	endif
	LaunchEvent \{Type = unfocus
		target = current_menu}
	create_dialog_box {
		heading_text = qs(0xea124b1e)
		body_text = qs(0x4818fd85)
		player_device = ($primary_controller)
	}
	CreateScreenElement \{Type = descinterface
		desc = 'instrument_spinner'
		parent = dialog_box_container
		id = autosave_icon
		Pos = (640.0, 492.0)
		just = [
			center
			center
		]
		z_priority = 200001
		autosizedims = true}
	autosave_icon :Obj_SpawnScriptNow \{instrument_spinner_ui_icon_anim}
	GetTrueStartTime
	songlist_component :membfunc_songlist_uistack_getlistname
	if isps3
		vmheap \{func = free_commerce}
		vmheap \{func = swap_in}
		create_song_and_musicstudio_heaps
	endif
	if contentmanfunc func = refresh Name = <list_name>
		begin
		if contentmanfunc func = is_ready Name = <list_name>
			Change \{g_songlist_refresh_menus = 1}
			Change \{g_songlist_requires_unblock = 1}
			if GotParam \{pre_refresh_script}
				ui_event event = menu_back data = {state = uistate_songlist pre_refresh_script = <pre_refresh_script>}
			else
				generic_event_back \{state = uistate_songlist
					nosound}
			endif
			return
		endif
		Wait \{0.1
			Seconds}
		repeat 200
	endif
	destroy_dialog_box
	callback_marketplace_content_general_timedout
endscript

script ui_destroy_music_store_scan_marketplace 
	destroy_dialog_box
endscript
