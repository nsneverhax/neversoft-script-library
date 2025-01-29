attract_disabled = 0
attract_wait_time = 110
invalid_controller_lock = 0

script ui_init_boot_iis 
	reacquirecontrollers
	change \{primary_controller_assigned = 0}
	change \{respond_to_signin_changed = 0}
	soundevent \{event = menu_guitar_lick_sfx}
	spawnscriptnow \{menu_music_on
		params = {
			waitforguitarlick = 1
		}}
	unpausegame
endscript

script ui_create_boot_iis 
	clean_up_user_control_helpers
	dumpcompactpoolprofile \{0}
	createscreenelement \{type = containerelement
		parent = root_window
		id = current_menu
		pos = (0.0, 0.0)
		just = [
			left
			center
		]
		z_priority = 0
		event_handlers = [
		]}
	createscreenelement \{type = spriteelement
		parent = current_menu
		id = bg
		texture = boot_copyright_bg_1
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 0}
	createscreenelement \{type = spriteelement
		parent = current_menu
		id = bg2
		texture = boot_copyright_bg_2
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 0.5
		alpha = 1}
	runscriptonscreenelement boot_bg_swap id = <id>
	createscreenelement \{type = textblockelement
		parent = current_menu
		font = fontgrid_text_a6
		text = qs(0x71da7fc7)
		dims = (450.0, 240.0)
		pos = (755.0, 450.0)
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
		scale = 0.6
		fit_width = wrap
		fit_height = `scale down if larger`}
	fadetoblack \{off
		time = 0.0
		no_wait}
	if ($attract_disabled = 0)
		runscriptonscreenelement \{ui_boot_iis_attract_wait
			id = current_menu}
	endif
	runscriptonscreenelement \{ui_boot_iis_input
		id = current_menu}
endscript

script boot_bg_swap 
	begin
	se_setprops \{alpha = 0
		time = 0}
	wait \{0.25
		seconds}
	se_setprops \{alpha = 1
		time = 0}
	wait \{0.4
		seconds}
	repeat
endscript

script ui_destroy_boot_iis 
	fadetoblack \{on
		alpha = 1.0
		time = 0.0
		z_priority = -100
		no_wait}
	if screenelementexists \{id = current_menu}
		current_menu :die
	endif
	kill_notify_box \{container_id = notify_invalid_device}
endscript

script ui_boot_iis_attract_wait 
	wait_time = ($attract_wait_time)
	begin
	printf qs(0x1ef1103f) i = <wait_time> channel = attract
	if (<wait_time> = 0)
		break
	endif
	wait \{1
		second
		ignoreslomo}
	wait_time = (<wait_time> - 1)
	repeat
	if ($invalid_controller_lock = 1)
		begin
		if ($invalid_controller_lock = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	killspawnedscript \{name = ui_boot_iis_input}
	ui_event \{event = menu_change
		data = {
			state = uistate_boot_attract
		}}
endscript

script ui_boot_iis_input \{button1 = {
		}
		button2 = {
		}}
	wait \{30
		gameframes}
	get_handlers_for_all_buttons \{event_script = ui_boot_iis_continue}
	begin
	removeparameter \{makes}
	removeparameter \{device_num}
	current_menu :setprops event_handlers = <event_handlers> replace_handlers
	wait \{1
		gameframe}
	repeat
endscript

script ui_boot_iis_continue 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if ($invalid_controller_lock = 0)
		stopsoundevent \{menu_guitar_lick_sfx}
		generic_menu_pad_choose_sound
		get_handlers_for_all_buttons
		current_menu :setprops event_handlers = <event_handlers> replace_handlers
		killspawnedscript \{name = ui_boot_iis_input}
		frontend_load_soundcheck \{loadingscreen
			async = 0}
		z_soundcheck_uiresetpos
		z_soundcheck_uianimationpre
		ui_event event = menu_replace data = {state = uistate_signin device_num = <device_num> boot = 1}
	endif
endscript
