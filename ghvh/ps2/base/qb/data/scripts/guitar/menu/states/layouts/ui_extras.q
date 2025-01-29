
script ui_create_extras 
	destroy_loading_screen
	SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
		params = {
			BG_SFX_Area = frontend_menu_music
		}}
	if GetPakManCurrent \{map = zones}
		if NOT (<pak> = z_soundcheck)
			SpawnScriptNow ui_create_extras_spawned params = {<...> spawned}
			return
		endif
	endif
	ui_create_extras_spawned
endscript

script ui_destroy_extras 
	KillSpawnedScript \{Name = ui_create_extras_spawned}
	generic_ui_destroy
endscript

script ui_create_extras_spawned 
	if GotParam \{spawned}
		create_loading_screen
		destroy_band
		destroy_bandname_viewport
		frontend_load_soundcheck
		destroy_loading_screen
	endif
	backstage_create_menu \{title = qs(0xa43d5ac3)}
	add_menu_frontend_item \{text = qs(0xd3213838)
		desc = 'backstage_menu_text'
		pad_choose_script = 0x2c77f159
		font = fontgrid_text_3
		internal_scale = 1}
	add_menu_frontend_item \{text = qs(0x96ef5e32)
		desc = 'backstage_menu_text'
		pad_choose_script = 0x7cedcd97
		font = fontgrid_text_3
		internal_scale = 1}
	add_menu_frontend_item \{text = qs(0xeb365db4)
		choose_state = uistate_bonus_videos_credits
		desc = 'backstage_menu_text'
		font = fontgrid_text_3
		internal_scale = 1}
	if GotParam \{spawned}
		LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
	endif
	menu_finish
endscript

script ui_extras_anim_in 
	menu_transition_in \{menu = current_menu_anchor}
endscript

script ui_extras_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript

script 0x2c77f159 
	create_loading_screen
	ui_event \{event = menu_change
		data = {
			state = uistate_setlist_lyrics
		}}
endscript

script 0x7cedcd97 
	create_loading_screen
	ui_event \{event = menu_change
		data = {
			state = uistate_soundboard
		}}
endscript
