
script make_watch_timer \{id = watch_timer}
	CreateScreenElement {
		id = <id>
		parent = root_window
		type = DescInterface
		desc = 'watch_timer'
		pos = <pos>
	}
	<id> :animate_watch_timer
endscript

script animate_watch_timer 
	Obj_SpawnScriptNow \{animate_watch_timer_swing}
	Obj_SpawnScriptNow \{animate_watch_timer_sweep_second}
	Obj_SpawnScriptNow \{animate_watch_timer_sweep_minute}
endscript

script animate_watch_timer_swing 
	SetScriptCannotPause
	SE_SetProps \{Timer_rot_angle = -3}
	SE_SetProps \{Timer_watch_alpha = 0.0}
	SE_SetProps \{Timer_hand_big_alpha = 0.0}
	SE_SetProps \{Timer_hand_small_alpha = 0.0}
	Wait \{15
		gameframes}
	SE_SetProps \{Timer_watch_alpha = 1.0
		time = 0.25}
	SE_SetProps \{Timer_hand_big_alpha = 1.0
		time = 0.25}
	SE_SetProps \{Timer_hand_small_alpha = 1.0
		time = 0.25}
	begin
	SE_SetProps \{Timer_rot_angle = 3
		time = 0.6
		Anim = slow_out}
	Wait \{0.63
		seconds}
	SE_SetProps \{Timer_rot_angle = -3
		time = 0.6
		Anim = slow_out}
	Wait \{0.63
		seconds}
	repeat
endscript

script animate_watch_timer_sweep_second 
	SetScriptCannotPause
	begin
	SE_SetProps \{timer_hand_small_rot_angle = 0}
	i = 0
	begin
	SE_SetProps timer_hand_small_rot_angle = (-1 * <i>) time = 0.005 Anim = gentle
	Wait \{0.005
		seconds}
	i = (<i> + 1)
	repeat 359
	repeat
endscript

script animate_watch_timer_sweep_minute 
	SetScriptCannotPause
	begin
	SE_SetProps \{timer_hand_big_rot_angle = 0}
	i = 0
	begin
	SE_SetProps timer_hand_big_rot_angle = (-1 * <i>) time = 0.2 Anim = gentle
	Wait \{0.2
		seconds}
	i = (<i> + 1)
	repeat 359
	repeat
endscript

script watch_animate_in 
	SetScriptCannotPause
	if GetSingleTag \{animating_out}
		if (<animating_out> = 0)
			return
		endif
		SetTags \{animating_out = 0}
		SE_SetProps Timer_watch_alpha = 1.0 time = <time>
		SE_SetProps Timer_hand_big_alpha = 1.0 time = <time>
		SE_SetProps Timer_hand_small_alpha = 1.0 time = <time>
	endif
endscript

script watch_animate_out 
	SetScriptCannotPause
	SetTags \{animating_out = 1}
	SE_SetProps Timer_watch_alpha = 0.0 time = <time>
	SE_SetProps Timer_hand_big_alpha = 0.0 time = <time>
	SE_SetProps Timer_hand_small_alpha = 0.0 time = <time>
endscript
