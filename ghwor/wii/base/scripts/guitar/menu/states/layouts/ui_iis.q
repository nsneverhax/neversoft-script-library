
script ui_init_iis 
	lockglobaltags \{OFF}
	lockglobaltags \{freeplay_check_off}
endscript

script ui_deinit_iis 
	lockglobaltags \{freeplay_check_on}
	lockglobaltags
endscript

script ui_create_iis \{from_boot = 0}
	destroy_loading_screen
	CreateScreenElement \{parent = root_window
		id = iis_id
		Type = descinterface
		desc = 'mainmenu'}
	iis_id :desc_applyscene \{Name = scene_attract}
	iis_id :Obj_SpawnScriptNow \{fg_objects_1
		params = {
			desc_id = iis_id
		}}
	iis_id :Obj_SpawnScriptNow \{ampzilla_anim
		params = {
			desc_id = iis_id
		}}
	iis_id :Obj_SpawnScriptNow \{anim_clouds
		params = {
			desc_id = iis_id
		}}
endscript

script ui_destroy_iis 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = iis_id}
		DestroyScreenElement \{id = iis_id}
	endif
endscript

script ui_iis_anim_in 
	get_handlers_for_all_buttons \{event_script = ui_iis_continue}
	iis_id :se_setprops event_handlers = <event_handlers>
	add_user_control_helper \{text = qs(0xa233ec28)
		button = green
		z = 100
		all_buttons}
	LaunchEvent \{Type = focus
		target = iis_id}
endscript

script ui_iis_continue 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = Generic
		uitype = select}
	<next_state> = uistate_mainmenu
	if social_networks_is_first_boot
		<next_state> = uistate_social_networks_setup
	endif
	Change \{g_boot_sysnotify_wait = FALSE}
	set_primary_controller device_num = <device_num> optional_signin = 1 state = <next_state> data = {no_sound = 1 clear_previous_stack}
endscript
