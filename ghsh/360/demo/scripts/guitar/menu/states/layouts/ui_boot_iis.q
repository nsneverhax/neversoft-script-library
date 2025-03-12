attract_disabled = 0
attract_wait_time = 110
invalid_controller_lock = 0

script ui_init_boot_iis 
	reacquirecontrollers
	change \{primary_controller_assigned = 0}
	change \{respond_to_signin_changed = 0}
	netsessionfunc \{func = live_settings_init}
	netsessionfunc \{func = motd_init}
	enableusermusic \{disable}
	soundevent \{event = menu_guitar_lick_sfx}
	unpausegame
endscript

script ui_create_boot_iis 
	clean_up_user_control_helpers
	dumpcompactpoolprofile \{0}
	change \{rich_presence_context = presence_signed_in_2_3_and_4}
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	isgreatesthits
	if (<is_greatest_hits>)
		tex = gh_spirit_logo_eu
	else
		tex = gh_spirit_logo
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = current_menu
		pos = (0.0, 0.0)
		just = [
			center
			center
		]
		z_priority = 0
		event_handlers = [
		]}
	createscreenelement {
		type = spriteelement
		parent = current_menu
		id = header
		texture = <tex>
		pos = (650.0, 350.0)
		dims = (1100.0, 550.0)
		just = [center center]
		scale = [1.4499999 , 1.4499999]
		z_priority = 1
	}
	createscreenelement \{type = spriteelement
		parent = current_menu
		id = bg
		texture = main_menu_bg_1
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
		texture = main_menu_bg_2
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 0.5
		alpha = 1}
	runscriptonscreenelement \{boot_bg_swap
		id = bg2}
	createscreenelement {
		type = textblockelement
		parent = current_menu
		font = fontgrid_bordello
		text = qs(0xea5afc2b)
		dims = (750.0, 70.0)
		pos = (260.0, 600.0)
		rot_angle = 0
		just = [left , top]
		internal_just = [center center]
		rgba = [230 230 230 255]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($g_menu_colors).menu_shadow)
		scale = 1
		z_priority = 1
		fit_width = `scale down if larger`
		fit_height = `scale down if larger`
	}
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
	wait \{0.38750002
		seconds}
	se_setprops \{alpha = 1
		time = 0}
	wait \{0.38750002
		seconds}
	repeat
endscript

script ui_destroy_boot_iis 
	fadetoblack \{on
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
	if screenelementexists \{id = current_menu}
		current_menu :die
	endif
	kill_notify_box \{container_id = notify_invalid_device}
endscript

script ui_boot_iis_attract_wait 
	wait_time = ($attract_wait_time)
	begin
	printf qs(0x1ef1103f) i = <wait_time> channel = attract
	if ($0x9cf507d8 = 0)
		if (<wait_time> = 1)
			wait \{0.5
				seconds
				ignoreslomo}
			obj_killspawnedscript \{name = ui_boot_iis_input}
			setprops \{event_handlers = [
				]
				replace_handlers}
			wait \{0.5
				seconds
				ignoreslomo}
			break
		endif
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
	setprops event_handlers = <event_handlers> replace_handlers
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
		assign_new_primary_controller device_num = <device_num>
		ui_event \{event = menu_replace
			data = {
				state = uistate_mainmenu
			}}
		return
		if isxenon
			ui_event event = menu_replace data = {state = uistate_signin device_num = <device_num> boot = 1}
		else
			begin
			gettrophyinitstate
			if (<state> != initializing)
				break
			endif
			wait \{10
				gameframes}
			repeat
			if (<state> = not_enough_space)
				ui_event event = menu_replace data = {state = uistate_trophy_warning device_num = <device_num>}
			elseif (<state> = ok)
				ui_event event = menu_replace data = {state = uistate_signin device_num = <device_num> boot = 1}
			else
				scriptassert qs(0xfd48a693) s = <state>
			endif
		endif
	endif
endscript
