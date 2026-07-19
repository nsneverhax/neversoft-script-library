
script make_watch_timer \{id = watch_timer}
	createscreenelement {
		id = <id>
		parent = root_window
		type = descinterface
		desc = 'watch_timer'
		pos = <pos>
	}
	<id> :animate_watch_timer
endscript

script animate_watch_timer 
	obj_spawnscriptnow \{animate_watch_timer_swing}
	obj_spawnscriptnow \{animate_watch_timer_sweep_second}
	obj_spawnscriptnow \{animate_watch_timer_sweep_minute}
endscript

script animate_watch_timer_swing 
	setscriptcannotpause
	se_setprops \{timer_rot_angle = -3}
	se_setprops \{timer_watch_alpha = 0.0}
	se_setprops \{timer_hand_big_alpha = 0.0}
	se_setprops \{timer_hand_small_alpha = 0.0}
	wait \{15
		gameframes}
	se_setprops \{timer_watch_alpha = 1.0
		time = 0.25}
	se_setprops \{timer_hand_big_alpha = 1.0
		time = 0.25}
	se_setprops \{timer_hand_small_alpha = 1.0
		time = 0.25}
	begin
	se_setprops \{timer_rot_angle = 3
		time = 0.6
		anim = slow_out}
	wait \{0.63
		seconds}
	se_setprops \{timer_rot_angle = -3
		time = 0.6
		anim = slow_out}
	wait \{0.63
		seconds}
	repeat
endscript

script animate_watch_timer_sweep_second 
	setscriptcannotpause
	begin
	se_setprops \{timer_hand_small_rot_angle = 0}
	i = 0
	begin
	se_setprops timer_hand_small_rot_angle = (-1 * <i>) time = 0.005 anim = gentle
	wait \{0.005
		seconds}
	i = (<i> + 1)
	repeat 359
	repeat
endscript

script animate_watch_timer_sweep_minute 
	setscriptcannotpause
	begin
	se_setprops \{timer_hand_big_rot_angle = 0}
	i = 0
	begin
	se_setprops timer_hand_big_rot_angle = (-1 * <i>) time = 0.2 anim = gentle
	wait \{0.2
		seconds}
	i = (<i> + 1)
	repeat 359
	repeat
endscript

script watch_animate_in 
	setscriptcannotpause
	if getsingletag \{animating_out}
		if (<animating_out> = 0)
			return
		endif
		settags \{animating_out = 0}
		se_setprops timer_watch_alpha = 1.0 time = <time>
		se_setprops timer_hand_big_alpha = 1.0 time = <time>
		se_setprops timer_hand_small_alpha = 1.0 time = <time>
	endif
endscript

script watch_animate_out 
	setscriptcannotpause
	settags \{animating_out = 1}
	se_setprops timer_watch_alpha = 0.0 time = <time>
	se_setprops timer_hand_big_alpha = 0.0 time = <time>
	se_setprops timer_hand_small_alpha = 0.0 time = <time>
endscript
