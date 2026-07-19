attract_disabled = 0
attract_wait_time = 110
invalid_controller_lock = 0

script ui_init_boot_iis 
	ReAcquireControllers
	change \{primary_controller_assigned = 0}
	change \{respond_to_signin_changed = 0}
	NetSessionFunc \{func = live_settings_init}
	NetSessionFunc \{func = motd_init}
	EnableUserMusic \{disable}
	SoundEvent \{event = Menu_Guitar_Lick_SFX}
	UnPauseGame
endscript

script ui_create_boot_iis 
	clean_up_user_control_helpers
	dumpcompactpoolprofile \{0}
	change \{rich_presence_context = presence_signed_in_2_3_and_4}
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	GetTerritory
	if (<territory> = territory_europe)
		tex = GH_Spirit_Logo_EU
	else
		tex = gh_Spirit_logo
	endif
	CreateScreenElement \{type = ContainerElement
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
	CreateScreenElement {
		type = SpriteElement
		parent = current_menu
		id = header
		texture = <tex>
		pos = (650.0, 350.0)
		dims = (1100.0, 550.0)
		just = [center center]
		scale = [1.4499999 , 1.4499999]
		z_priority = 1
	}
	CreateScreenElement \{type = SpriteElement
		parent = current_menu
		id = bG
		texture = main_menu_bg_1
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 0}
	CreateScreenElement \{type = SpriteElement
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
	RunScriptOnScreenElement \{boot_bg_swap
		id = bg2}
	CreateScreenElement {
		type = TextBlockElement
		parent = current_menu
		font = fontgrid_bordello
		text = qs("PRESS ANY BUTTON TO ROCK!")
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
		RunScriptOnScreenElement \{ui_boot_iis_attract_wait
			id = current_menu}
	endif
	RunScriptOnScreenElement \{ui_boot_iis_input
		id = current_menu}
endscript

script boot_bg_swap 
	begin
	SE_SetProps \{alpha = 0
		time = 0}
	Wait \{0.38750002
		seconds}
	SE_SetProps \{alpha = 1
		time = 0}
	Wait \{0.38750002
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
	if ScreenElementExists \{id = current_menu}
		current_menu :Die
	endif
	kill_notify_box \{container_id = notify_invalid_device}
endscript

script ui_boot_iis_attract_wait 
	wait_time = ($attract_wait_time)
	begin
	printf qs("\LWait_time for begin attract %i") i = <wait_time> channel = attract
	if ($in_demo_marketing_sequence = 0)
		if (<wait_time> = 1)
			Wait \{0.5
				seconds
				ignoreslomo}
			Obj_KillSpawnedScript \{name = ui_boot_iis_input}
			SetProps \{event_handlers = [
				]
				replace_handlers}
			Wait \{0.5
				seconds
				ignoreslomo}
			break
		endif
	endif
	Wait \{1
		second
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
	if NOT ScriptIsRunning \{ui_boot_iis_continue}
		KillSpawnedScript \{name = ui_boot_iis_input}
		ui_event \{event = menu_change
			data = {
				state = UIstate_boot_attract
			}}
	endif
endscript

script ui_boot_iis_input \{button1 = {
		}
		button2 = {
		}}
	Wait \{30
		gameframes}
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
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	if ($invalid_controller_lock = 0)
		StopSoundEvent \{Menu_Guitar_Lick_SFX}
		generic_menu_pad_choose_sound
		get_handlers_for_all_buttons
		current_menu :SetProps event_handlers = <event_handlers> replace_handlers
		KillSpawnedScript \{name = ui_boot_iis_input}
		frontend_load_soundcheck \{loadingscreen
			async = 0}
		z_soundcheck_UIResetPos
		z_soundcheck_UIAnimationPre
		assign_new_primary_controller device_num = <device_num>
		ui_event \{event = menu_replace
			data = {
				state = UIstate_mainmenu
			}}
		return
		if isXenon
			ui_event event = menu_replace data = {state = uistate_signin device_num = <device_num> boot = 1}
		else
			begin
			GetTrophyInitState
			if (<state> != initializing)
				break
			endif
			Wait \{10
				gameframes}
			repeat
			if (<state> = not_enough_space)
				ui_event event = menu_replace data = {state = UIstate_trophy_warning device_num = <device_num>}
			elseif (<state> = ok)
				ui_event event = menu_replace data = {state = uistate_signin device_num = <device_num> boot = 1}
			else
				ScriptAssert qs("\Ltrophy init unknown state %s") s = <state>
			endif
		endif
	endif
endscript
