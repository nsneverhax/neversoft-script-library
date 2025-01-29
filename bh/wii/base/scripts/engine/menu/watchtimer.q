
script make_watch_timer \{id = watch_timer
		parent = root_window}
	CreateScreenElement {
		id = <id>
		parent = <parent>
		Type = descinterface
		desc = 'watch_timer'
		Pos = <Pos>
		z_priority = 4
		autosizedims = true
	}
	<id> :animate_watch_timer
endscript

script animate_watch_timer 
	if ($cas_loading_setup != lobby)
		Obj_SpawnScriptNow \{animate_watch_timer_swing}
	endif
	Obj_SpawnScriptNow \{animate_watch_timer_sweep_second}
	Obj_SpawnScriptNow \{animate_watch_timer_sweep_minute}
endscript

script animate_watch_timer_swing 
	setscriptcannotpause
	se_setprops \{timer_rot_angle = -3}
	se_setprops \{timer_watch_alpha = 0.0}
	se_setprops \{timer_hand_big_alpha = 0.0}
	se_setprops \{timer_hand_small_alpha = 0.0}
	Wait \{15
		gameframes}
	se_setprops \{timer_watch_alpha = 1.0
		time = 0.25}
	se_setprops \{timer_hand_big_alpha = 1.0
		time = 0.25}
	se_setprops \{timer_hand_small_alpha = 1.0
		time = 0.25}
	begin
	se_setprops \{timer_rot_angle = -2
		time = 0.5
		motion = ease_out}
	Wait \{0.5
		Seconds}
	se_setprops \{timer_rot_angle = 0
		time = 0.5
		motion = ease_in}
	Wait \{0.5
		Seconds}
	se_setprops \{timer_rot_angle = 2
		time = 0.5
		motion = ease_out}
	Wait \{0.5
		Seconds}
	se_setprops \{timer_rot_angle = 0
		time = 0.5
		motion = ease_in}
	Wait \{0.5
		Seconds}
	repeat
endscript

script animate_watch_timer_sweep_second 
	setscriptcannotpause
	i = 90
	begin
	se_setprops timer_hand_small_rot_angle = (-1 * <i>)
	begin
	se_setprops timer_hand_small_rot_angle = (-1 * <i>) time = 0.005 anim = gentle
	Wait \{0.005
		Seconds}
	i = (<i> -1)
	repeat 360
	i = (<i> + 360)
	repeat
endscript

script animate_watch_timer_sweep_minute 
	i = 0
	setscriptcannotpause
	begin
	se_setprops timer_hand_big_rot_angle = (-1 * <i>)
	begin
	se_setprops timer_hand_big_rot_angle = (-1 * <i>) time = 0.2 anim = gentle
	Wait \{0.2
		Seconds}
	i = (<i> -1)
	repeat 360
	i = (<i> + 360)
	repeat
endscript

script watch_animate_in 
	setscriptcannotpause
	if GetSingleTag \{animating_out}
		if (<animating_out> = 0)
			return
		endif
		SetTags \{animating_out = 0}
		se_setprops timer_watch_alpha = 0.7 time = <time>
		se_setprops timer_hand_big_alpha = 0.7 time = <time>
		se_setprops timer_hand_small_alpha = 0.7 time = <time>
	endif
endscript

script watch_animate_out 
	setscriptcannotpause
	SetTags \{animating_out = 1}
	se_setprops timer_watch_alpha = 0.0 time = <time>
	se_setprops timer_hand_big_alpha = 0.0 time = <time>
	se_setprops timer_hand_small_alpha = 0.0 time = <time>
endscript
