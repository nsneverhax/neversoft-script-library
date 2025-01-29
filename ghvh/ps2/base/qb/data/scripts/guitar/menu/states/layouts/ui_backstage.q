
script ui_create_backstage 
	Change \{top_rockers_enabled = 0}
	if GetPakManCurrent \{map = zones}
		if NOT (<pak> = z_soundcheck)
			SpawnScriptNow ui_create_backstage_spawned params = {<...> spawned}
			return
		endif
	endif
	ui_create_backstage_spawned
endscript

script ui_destroy_backstage 
	KillSpawnedScript \{Name = ui_create_backstage_spawned}
	generic_ui_destroy
endscript

script ui_create_backstage_spawned 
	if GotParam \{spawned}
		create_loading_screen
		destroy_band
		destroy_bandname_viewport
		frontend_load_soundcheck
		destroy_loading_screen
	else
		cas_destroy_all_characters
	endif
	backstage_create_menu \{title = qs(0x17044f94)}
	add_menu_frontend_item \{text = qs(0xa43d5ac3)
		desc = 'backstage_menu_text'
		choose_state = uistate_extras}
	add_menu_frontend_item \{text = qs(0x9f894c1e)
		desc = 'backstage_menu_text'
		pad_choose_script = main_menu_select_cas
		internal_scale = 0.9}
	<item_container_id> :SetTags spinner_offset = -10
	add_menu_frontend_item \{text = qs(0x88572463)
		desc = 'backstage_menu_text'
		pad_choose_script = setup_top_rockers_single
		internal_scale = 0.9}
	current_menu :obj_spawnscript \{highlight_motion}
	if GotParam \{spawned}
		LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
	endif
	menu_finish
	destroy_loading_screen
	dumppakman
endscript

script backstage_create_menu 
	RemoveParameter \{exclusive_device}
	get_all_exclusive_devices
	CreateScreenElement {
		Type = descinterface
		desc = 'backstage'
		id = current_menu_anchor
		parent = root_window
		just = [center center]
		exclusive_device = <exclusive_device>
	}
	set_focus_color rgba = (($g_menu_colors).menu_backstage_focus)
	set_unfocus_color rgba = (($g_menu_colors).menu_backstage_unfocus)
	current_menu_anchor :set_banner_title title = <title>
	if current_menu_anchor :desc_resolvealias \{Name = alias_menu_items}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_up
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_down
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
				{
					pad_back
					0x92c45b3a
				}
			]}
		current_menu :obj_spawnscript \{highlight_motion}
	endif
	current_menu_anchor :obj_spawnscript \{spin_object
		params = {
			Name = alias_tone_knob
		}}
endscript

script ui_backstage_focus 
	Obj_GetID
	GetTags
	if current_menu_anchor :desc_resolvealias \{Name = alias_highlight}
		Wait \{2
			gameframe}
		<objID> :se_getparentid
		<parent_id> :se_getprops
		<resolved_id> :se_setprops rot_angle = <rot_angle>
		GetScreenElementDims id = <objID>
		Scale = (((1.0, 0.0) * (((<width> + 20.0) / 256.0))) + (0.0, 1.5))
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale>
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + (0.0, -10.0))} time = 0.05
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale> time = 0.05
		<resolved_id> :se_waitprops
	endif
endscript

script ui_backstage_unfocus 
endscript

script ui_backstage_anim_in 
	menu_transition_in \{menu = current_menu_anchor}
endscript

script ui_backstage_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript

script 0x92c45b3a 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	create_loading_screen
	generic_event_back
endscript
