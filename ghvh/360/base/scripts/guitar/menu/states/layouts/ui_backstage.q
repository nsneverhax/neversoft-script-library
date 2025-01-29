
script ui_create_backstage 
	update_ingame_controllers controller = ($primary_controller)
	SpawnScriptNow \{cleanup_frontend_bg_movie}
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

script ui_deinit_backstage 
endscript

script ui_create_backstage_spawned 
	Change \{practice_enabled = 0}
	printf channel = kim qs(0x07696d91) p = ($practice_enabled)
	Change \{rich_presence_context = presence_menus}
	if GotParam \{spawned}
		create_loading_screen
		destroy_band
		destroy_bandname_viewport
		frontend_load_soundcheck
		destroy_loading_screen
	else
		cas_destroy_all_characters
	endif
	signin_params = {local}
	if isps3
		signin_params = {}
	endif
	if NOT CheckForSignIn <signin_params> controller_index = ($primary_controller)
		not_signed_in = 1
	endif
	backstage_create_menu \{title = qs(0x17044f94)}
	add_menu_frontend_item \{text = qs(0x3ea7dec9)
		desc = 'backstage_menu_text'
		pad_choose_script = ui_select_practice_mode_choose
		pad_choose_params = {
			practice = 1
		}}
	add_menu_frontend_item \{text = qs(0xa43d5ac3)
		desc = 'backstage_menu_text'
		choose_state = uistate_extras}
	add_menu_frontend_item \{text = qs(0x9f894c1e)
		desc = 'backstage_menu_text'
		pad_choose_script = main_menu_select_cas
		internal_scale = 0.9}
	<item_container_id> :SetTags spinner_offset = -10
	add_menu_frontend_item \{text = qs(0xa1ae7e56)
		desc = 'backstage_menu_text'
		choose_state = uistate_top_rockers_mode}
	add_menu_frontend_item \{text = qs(0x549f855b)
		desc = 'backstage_menu_text'
		choose_state = uistate_guitarhero_com}
	if GotParam \{not_signed_in}
		<item_container_id> :se_setprops not_focusable item_color = [64 64 64 255]
	endif
	if GotParam \{spawned}
		LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
	endif
	menu_finish
	destroy_loading_screen
	unblock_invites
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
					generic_event_back
				}
			]}
		current_menu :obj_spawnscript \{highlight_motion}
	endif
	current_menu_anchor :obj_spawnscript \{spin_object
		params = {
			Name = alias_tone_knob
		}}
endscript

script showbackstage_halfscreen 
	if is_soundcheck_loaded
		if ((($practice_enabled) = 1) && (($came_to_practice_from) = main_menu))
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script ui_backstage_anim_in 
	SpawnScriptNow \{task_menu_default_anim_in
		params = {
			base_name = 'backstage'
		}}
	menu_transition_in \{menu = current_menu_anchor
		anim_type = zoom_blur}
endscript

script ui_backstage_anim_out 
	menu_transition_out \{menu = current_menu_anchor
		anim_type = zoom_blur}
endscript
