
script make_watch_timer \{id = watch_timer
		parent = root_window}
	CreateScreenElement {
		id = <id>
		parent = <parent>
		type = DescInterface
		desc = 'watch_timer'
		Pos = <Pos>
		z_priority = 4
		autoSizeDims = true
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
	SetScriptCannotPause
	SE_SetProps \{Timer_rot_angle = -3}
	SE_SetProps \{timer_watch_alpha = 0.0}
	SE_SetProps \{timer_hand_big_alpha = 0.0}
	SE_SetProps \{timer_hand_small_alpha = 0.0}
	wait \{15
		gameframes}
	SE_SetProps \{timer_watch_alpha = 1.0
		time = 0.25}
	SE_SetProps \{timer_hand_big_alpha = 1.0
		time = 0.25}
	SE_SetProps \{timer_hand_small_alpha = 1.0
		time = 0.25}
	begin
	SE_SetProps \{Timer_rot_angle = -2
		time = 0.5
		motion = ease_out}
	wait \{0.5
		seconds}
	SE_SetProps \{Timer_rot_angle = 0
		time = 0.5
		motion = ease_in}
	wait \{0.5
		seconds}
	SE_SetProps \{Timer_rot_angle = 2
		time = 0.5
		motion = ease_out}
	wait \{0.5
		seconds}
	SE_SetProps \{Timer_rot_angle = 0
		time = 0.5
		motion = ease_in}
	wait \{0.5
		seconds}
	repeat
endscript

script animate_watch_timer_sweep_second 
	SetScriptCannotPause
	i = 90
	begin
	SE_SetProps timer_hand_small_rot_angle = (-1 * <i>)
	begin
	SE_SetProps timer_hand_small_rot_angle = (-1 * <i>) time = 0.005 anim = gentle
	wait \{0.005
		seconds}
	i = (<i> -1)
	repeat 360
	i = (<i> + 360)
	repeat
endscript

script animate_watch_timer_sweep_minute 
	i = 0
	SetScriptCannotPause
	begin
	SE_SetProps timer_hand_big_rot_angle = (-1 * <i>)
	begin
	SE_SetProps timer_hand_big_rot_angle = (-1 * <i>) time = 0.2 anim = gentle
	wait \{0.2
		seconds}
	i = (<i> -1)
	repeat 360
	i = (<i> + 360)
	repeat
endscript

script watch_animate_in 
	SetScriptCannotPause
	if GetSingleTag \{animating_out}
		if (<animating_out> = 0)
			return
		endif
		SetTags \{animating_out = 0}
		SE_SetProps timer_watch_alpha = 0.7 time = <time>
		SE_SetProps timer_hand_big_alpha = 0.7 time = <time>
		SE_SetProps timer_hand_small_alpha = 0.7 time = <time>
	endif
endscript

script watch_animate_out 
	SetScriptCannotPause
	SetTags \{animating_out = 1}
	SE_SetProps timer_watch_alpha = 0.0 time = <time>
	SE_SetProps timer_hand_big_alpha = 0.0 time = <time>
	SE_SetProps timer_hand_small_alpha = 0.0 time = <time>
endscript
