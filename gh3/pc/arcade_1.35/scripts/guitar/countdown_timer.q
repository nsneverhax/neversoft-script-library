countdown_timer_enabled = 1
countdown_timer_running = 0
countdown_timer_expired = 0
countdown_timer_value = 0
countdown_timer_warning_value = 10
countdown_timer_master_enable = 1
countdown_timer_position = (645.0, 644.0)

script create_countdown_timer 
	if ($countdown_timer_master_enable = 1)
		CreateScreenElement \{Type = ContainerElement
			id = countdown_timer_container
			parent = root_window
			Pos = (0.0, 0.0)}
		CreateScreenElement \{Type = TextElement
			parent = countdown_timer_container
			font = text_a6
			Scale = 1.5
			rgba = [
				255
				255
				255
				220
			]
			text = "0"
			id = countdown_timer
			Pos = $countdown_timer_position
			just = [
				center
				center
			]
			rot_angle = 0
			z_priority = 10001}
		CreateScreenElement {
			Type = TextElement
			parent = countdown_timer_container
			font = text_a6
			Scale = 1.5
			rgba = [0 0 0 220]
			text = "0"
			id = countdown_timer_shadow
			Pos = ($countdown_timer_position + (5.0, 5.0))
			just = [center center]
			rot_angle = 0
			z_priority = 10001
			Hide
		}
		hide_countdown_timer
	endif
endscript

script destroy_countdown_timer 
endscript

script update_timer_text 
	formatText \{TextName = timer_current
		"%d"
		d = $countdown_timer_value}
	countdown_timer :SetProps text = <timer_current>
	countdown_timer_shadow :SetProps text = <timer_current>
endscript

script update_countdown_timer 
	begin
	if ($countdown_timer_enabled = 1 && $countdown_timer_master_enable = 1)
		if ($countdown_timer_running = 1)
			update_timer_text
			if ($countdown_timer_value < ($countdown_timer_warning_value + 1))
				countdown_timer :DoMorph \{rgba = [
						255
						0
						0
						255
					]
					time = 0.15}
				countdown_timer :DoMorph \{rgba = [
						255
						255
						255
						255
					]
					time = 0.15}
			endif
		endif
	endif
	Wait \{1
		Second}
	if ($countdown_timer_enabled = 1 && $countdown_timer_master_enable = 1)
		if ($countdown_timer_running = 1)
			increment_countdown_timer
		endif
	endif
	if ($countdown_timer_enabled = 0)
		printf \{"update_countdown_timer: timer disabled"}
	endif
	if ($countdown_timer_master_enable = 0)
		printf \{"update_countdown_timer: timer master disabled"}
	endif
	if ($countdown_timer_running = 0)
		printf \{"update_countdown_timer: not running"}
	endif
	repeat
endscript

script set_countdown_timer \{timer_value = 15
		warning_val = 5}
	if ($countdown_timer_master_enable = 1)
		printf "set_countdown_timer: Called with timer_value=%d" d = <timer_value>
		if GotParam \{hidden}
			printf \{"set_countdown_timer: hidden"}
		endif
		Change countdown_timer_value = <timer_value>
		Change countdown_timer_warning_value = <warning_val>
		printf \{"set_countdown_timer: Setting timer_value to %d"
			d = $countdown_timer_value}
		if ($countdown_timer_value > 0)
			printf \{"set_countdown_timer: setting timer vars"}
			Change \{countdown_timer_enabled = 1}
			Change \{countdown_timer_running = 1}
			Change \{countdown_timer_expired = 0}
			if NOT GotParam \{hidden}
				formatText \{TextName = timer_current
					"%d"
					d = $countdown_timer_value}
				countdown_timer :SetProps text = <timer_current>
				countdown_timer :DoMorph \{alpha = 1.0
					time = 0}
				countdown_timer :DoMorph \{rgba = [
						255
						255
						255
						255
					]
					time = 0}
				countdown_timer_shadow :SetProps text = <timer_current>
				countdown_timer_shadow :DoMorph \{alpha = 1.0
					time = 0}
				countdown_timer_shadow :DoMorph \{rgba = [
						0
						0
						0
						255
					]
					time = 0}
			endif
		endif
	endif
endscript

script pause_countdown_timer 
	Change \{countdown_timer_running = 0}
endscript

script unpause_countdown_timer 
	Change \{countdown_timer_running = 0}
endscript

script get_countdown_timer 
	return \{current_countdown_value = $countdown_timer_value}
endscript

script check_countdown_timer 
	return \{timer_has_expired = $countdown_timer_expired}
endscript

script hide_countdown_timer 
	if ($countdown_timer_master_enable = 1)
		countdown_timer :DoMorph \{alpha = 0
			time = 0}
		countdown_timer_shadow :DoMorph \{alpha = 0
			time = 0}
	endif
endscript

script increment_countdown_timer \{inc_val = 1}
	Change countdown_timer_value = ($countdown_timer_value - <inc_val>)
	if ($countdown_timer_value <= 0)
		Change \{countdown_timer_value = 0}
		printf \{"update_countdown_timer: timer expired"}
		Change \{countdown_timer_running = 0}
		Change \{countdown_timer_expired = 1}
	endif
	update_timer_text
endscript
