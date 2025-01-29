attract_disabled = 0
attract_wait_time = 30
invalid_controller_lock = 0

script ui_init_boot_iis 
	ReAcquireControllers
	Change \{primary_controller_assigned = 0}
	Change \{respond_to_signin_changed = 0}
	SoundEvent \{event = menu_guitar_lick_sfx}
	SpawnScriptNow \{menu_music_on
		params = {
			waitforguitarlick = 1
		}}
	UnPauseGame
endscript

script ui_create_boot_iis 
	clean_up_user_control_helpers
	dumpcompactpoolprofile \{0}
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
		dims = (640.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 0}
	CreateScreenElement \{Type = SpriteElement
		parent = current_menu
		id = bg2
		texture = boot_copyright_bg_2
		Pos = (640.0, 0.0)
		dims = (640.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 0.5
		alpha = 1}
	CreateScreenElement \{Type = TextBlockElement
		parent = current_menu
		id = pressanytextid
		font = fontgrid_title_a1
		text = qs(0x71da7fc7)
		dims = (700.0, 180.0)
		Pos = (150.0, 510.0)
		rot_angle = 0
		just = [
			left
			top
		]
		internal_just = [
			center
			center
		]
		rgba = [
			235
			235
			235
			255
		]
		Scale = 1
		1
		z_priority = 100
		fit_width = `scale	each	line	to	fit`
		fit_height = `scale	down	if	larger`}
	RunScriptOnScreenElement \{boot_bg_swap
		id = bg2}
	fadetoblack \{OFF
		time = 0.0
		no_wait}
	StartRendering
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
	if ScreenElementExists \{id = pressanytextid}
		pressanytextid :se_setprops \{alpha = 0.5
			time = 0.5}
	endif
	Wait \{0.5
		Seconds}
	if ScreenElementExists \{id = pressanytextid}
		pressanytextid :se_setprops \{alpha = 1
			time = 0.5}
	endif
	Wait \{2
		Seconds}
	repeat
endscript

script ui_destroy_boot_iis 
	fadetoblack \{On
		alpha = 1.0
		time = 0.0
		z_priority = -100
		no_wait}
	if ScreenElementExists \{id = current_menu}
		current_menu :Die
	endif
	kill_notify_box \{container_id = notify_invalid_device}
endscript

script ui_boot_iis_attract_wait 
	wait_time = ($attract_wait_time)
	begin
	if (<wait_time> = 0)
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
	current_menu :SetProps event_handlers = <event_handlers> replace_handlers
	Wait \{1
		gameframe}
	repeat
endscript

script ui_boot_iis_continue 
	if ((GotParam pad_L2) && (<device_num> = 2))
		return
	endif
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ($invalid_controller_lock = 0)
		generic_menu_pad_choose_sound
		get_handlers_for_all_buttons
		current_menu :SetProps event_handlers = <event_handlers> replace_handlers
		KillSpawnedScript \{Name = ui_boot_iis_input}
		Change primary_controller = <device_num>
		ui_event event = menu_replace data = {state = uistate_signin params = {device_num = <device_num> boot = 1}}
	endif
endscript
