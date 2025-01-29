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
		id = speakers
		texture = 0x1fb6513b
		Pos = (1280.0, 720.0)
		dims = (812.0, 512.0)
		just = [
			right
			bottom
		]
		z_priority = 1.0
		rot_angle = 0.0
		alpha = 1.0}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = 0x910fcd46
		Pos = (0.0, 95.0)
		just = [
			left
			center
		]
		z_priority = 0
		event_handlers = [
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = 0x910fcd46
		blend = blend
		id = 0x4460d7d4
		texture = 0xf1b3b2d0
		Pos = (0.0, 0.0)
		dims = (1280.0, 20.0)
		just = [
			left
			center
		]
		z_priority = 0.6
		rot_angle = 0.0
		alpha = 0.7}
	CreateScreenElement \{Type = SpriteElement
		parent = 0x910fcd46
		blend = blend
		id = 0xdd69866e
		texture = 0xf1b3b2d0
		Pos = (-1280.0, 0.0)
		dims = (1280.0, 20.0)
		just = [
			left
			center
		]
		z_priority = 0.6
		rot_angle = 0.0
		alpha = 0.7}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = 0xa5e5db29
		Pos = (0.0, 630.0)
		just = [
			left
			center
		]
		z_priority = 0
		event_handlers = [
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = 0xa5e5db29
		blend = blend
		id = 0x52d12107
		texture = 0xf1b3b2d0
		Pos = (0.0, 0.0)
		dims = (1280.0, 20.0)
		just = [
			left
			center
		]
		z_priority = 0.6
		rot_angle = 0.0
		alpha = 0.7}
	CreateScreenElement \{Type = SpriteElement
		parent = 0xa5e5db29
		blend = blend
		id = 0xcbd870bd
		texture = 0xf1b3b2d0
		Pos = (-1280.0, 0.0)
		dims = (1280.0, 20.0)
		just = [
			left
			center
		]
		z_priority = 0.6
		rot_angle = 0.0
		alpha = 0.7}
	0x1fa60a33 = 1280
	0x00c77a7d = 5
	0x910fcd46 :obj_spawnscript 0xc5c70e9b params = {width = <0x1fa60a33> move_time = <0x00c77a7d>}
	0xa5e5db29 :obj_spawnscript 0xc5c70e9b params = {width = <0x1fa60a33> move_time = <0x00c77a7d>}
	CreateScreenElement \{Type = TextBlockElement
		parent = current_menu
		font = fontgrid_text_a1
		text = qs(0x71da7fc7)
		dims = (450.0, 240.0)
		Pos = (580.0, 105.0)
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
		rot_angle = 0.0
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

script ui_destroy_boot_iis 
	if ScreenElementExists \{id = current_menu}
		current_menu :Die
	endif
	if ScreenElementExists \{id = 0x910fcd46}
		0x910fcd46 :Die
	endif
	if ScreenElementExists \{id = 0xa5e5db29}
		0xa5e5db29 :Die
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

script 0xc5c70e9b 
	begin
	se_setprops Pos = {((1.0, 0.0) * <width>) relative} time = (<move_time> * 0.5)
	se_waitprops
	se_setprops Pos = {((-1.0, 0.0) * <width>) relative}
	repeat
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
