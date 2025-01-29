attract_disabled = 0
attract_wait_time = 30
invalid_controller_lock = 0

script ui_init_boot_iis 
	ReAcquireControllers
	Change \{primary_controller_assigned = 0}
	Change \{respond_to_signin_changed = 0}
	SoundEvent \{event = menu_guitar_lick_sfx}
	UnPauseGame
endscript

script ui_create_boot_iis 
	clean_up_user_control_helpers
	dumpcompactpoolprofile \{0}
	Change \{rich_presence_context = presence_signed_in_2_3_and_4}
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = current_menu
		Pos = (0.0, 0.0)
		just = [
			left
			center
		]
		z_priority = 0
		event_handlers = [
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = current_menu
		id = bg
		texture = boot_copyright_bg_1
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 0}
	CreateScreenElement \{Type = SpriteElement
		parent = current_menu
		blend = blend
		id = 0x466a9d75
		texture = 0xd39400bd
		Pos = (720.0, 0.0)
		dims = (450.0, 375.0)
		just = [
			left
			top
		]
		z_priority = 0.5
		rot_angle = -4.7
		alpha = 1.0}
	CreateScreenElement \{Type = SpriteElement
		parent = current_menu
		blend = add
		id = 0x6ca2d201
		texture = 0xd39400bd
		Pos = (720.0, 0.0)
		dims = (450.0, 375.0)
		just = [
			left
			top
		]
		z_priority = 0.6
		rot_angle = -4.7
		alpha = 0.0}
	0x6ca2d201 :obj_spawnscript \{0xa7a510a8
		params = {
			0x4d641ae8
			0xe99089a3 = $0x187899ed
			0xffd05882 = $0xddccbea4
		}}
	CreateScreenElement \{Type = TextBlockElement
		parent = current_menu
		font = fontgrid_text_a1
		text = qs(0x71da7fc7)
		dims = (450.0, 240.0)
		Pos = (75.0, 225.0)
		just = [
			left
			top
		]
		internal_just = [
			center
			center
		]
		rgba = [
			220
			220
			220
			255
		]
		Scale = 0.9
		rot_angle = 8.0
		fit_width = wrap
		fit_height = `scale	down	if	larger`}
	fadetoblack \{OFF
		time = 0.0
		no_wait}
	if ($attract_disabled = 0)
		RunScriptOnScreenElement \{ui_boot_iis_attract_wait
			id = current_menu}
	endif
	RunScriptOnScreenElement \{ui_boot_iis_input
		id = current_menu}
	destroy_loading_screen
endscript

script boot_bg_swap 
	begin
	se_setprops \{alpha = 0
		time = 0}
	Wait \{0.25
		Seconds}
	se_setprops \{alpha = 1
		time = 0}
	Wait \{0.4
		Seconds}
	repeat
endscript

script ui_destroy_boot_iis 
	if ScreenElementExists \{id = current_menu}
		current_menu :Die
	endif
	kill_notify_box \{container_id = notify_invalid_device}
endscript

script ui_boot_iis_attract_wait 
	wait_time = ($attract_wait_time)
	begin

	if (<wait_time> = 1)
		Wait \{0.5
			Seconds
			ignoreslomo}
		Obj_KillSpawnedScript \{Name = ui_boot_iis_input}
		SetProps \{event_handlers = [
			]
			replace_handlers}
		Wait \{0.5
			Seconds
			ignoreslomo}
		break
	endif
	Wait \{1
		Second
		ignoreslomo}
	wait_time = (<wait_time> - 1)
	repeat
	if ($invalid_controller_lock = 1)
		begin
		if ($invalid_controller_lock = 0)
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	KillSpawnedScript \{Name = ui_boot_iis_input}
	ui_event \{event = menu_change
		data = {
			state = uistate_boot_attract
		}}
endscript

script ui_boot_iis_input \{button1 = {
		}
		button2 = {
		}}
	get_handlers_for_all_buttons \{event_script = ui_boot_iis_continue}
	begin
	RemoveParameter \{makes}
	RemoveParameter \{device_num}
	SetProps event_handlers = <event_handlers> replace_handlers
	Wait \{1
		gameframe}
	repeat
endscript

script ui_boot_iis_continue 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ($invalid_controller_lock = 0)
		StopSoundEvent \{menu_guitar_lick_sfx}
		generic_menu_pad_choose_sound
		get_handlers_for_all_buttons
		current_menu :SetProps event_handlers = <event_handlers> replace_handlers
		KillSpawnedScript \{Name = ui_boot_iis_input}
		Change primary_controller = <device_num>
		ui_event event = menu_replace data = {state = uistate_signin device_num = <device_num> boot = 1}
	endif
endscript
