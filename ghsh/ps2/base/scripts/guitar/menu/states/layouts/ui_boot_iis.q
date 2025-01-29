attract_wait_time = 30
invalid_controller_lock = 0

script ui_init_boot_iis 
	ReAcquireControllers
	Change \{primary_controller_assigned = 0}
	Change \{respond_to_signin_changed = 0}
	EnableUserMusic \{disable}
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
		id = header
		texture = gh_spirit_logo
		Pos = (256.0, 102.0)
		dims = (768.0, 448.0)
		just = [
			left
			top
		]
		Scale = [
			1.5
			1.5
		]
		z_priority = 1}
	CreateScreenElement \{Type = SpriteElement
		parent = current_menu
		id = bg
		texture = main_menu_bg_1
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 0}
	CreateScreenElement \{Type = SpriteElement
		parent = current_menu
		id = bg2
		texture = main_menu_bg_2
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 0.5
		alpha = 1}
	RunScriptOnScreenElement \{boot_bg_swap
		id = bg2}
	CreateScreenElement {
		Type = TextBlockElement
		parent = current_menu
		font = fontgrid_bordello
		text = qs(0xea5afc2b)
		dims = (750.0, 70.0)
		Pos = (250.0, 600.0)
		rot_angle = 0
		just = [left , top]
		internal_just = [center center]
		rgba = [230 230 230 255]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($g_menu_colors).menu_shadow)
		Scale = 1
		z_priority = 1
		fit_width = `scale	each	line	to	fit`
		fit_height = `scale	to	fit`
	}
	fadetoblack \{OFF
		time = 0.0
		no_wait}
	if ScreenElementExists \{id = black_overlay}
		DestroyScreenElement \{id = black_overlay}
	endif
	RunScriptOnScreenElement \{ui_boot_iis_attract_wait
		id = current_menu}
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
	fadetoblack \{On
		alpha = 1.0
		time = 0.0
		z_priority = -100
		texture = main_menu_bg_1
		rgba = [
			255
			255
			255
			255
		]
		no_wait}
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
