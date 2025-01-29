0x1428a1f6 = 0.0
0x36451372 = 0.0
0x5e6ada5f = 0.0

script make_watch_timer \{id = watch_timer}
	CreateScreenElement {
		id = <id>
		parent = root_window
		Type = descinterface
		desc = 'watch_timer'
		Pos = <Pos>
	}
	<id> :animate_watch_timer
endscript

script animate_watch_timer 
	Obj_SpawnScriptNow \{animate_watch_timer_swing}
	Obj_SpawnScriptNow \{animate_watch_timer_sweep_second}
	Obj_SpawnScriptNow \{animate_watch_timer_sweep_minute}
endscript

script animate_watch_timer_swing 
	setscriptcannotpause
	se_setprops \{timer_watch_alpha = 0.0}
	se_setprops \{timer_hand_big_alpha = 0.0}
	se_setprops \{timer_hand_small_alpha = 0.0}
	se_setprops \{timer_watch_alpha = 1.0
		time = 0.25}
	se_setprops \{timer_hand_big_alpha = 1.0
		time = 0.25}
	se_setprops \{timer_hand_small_alpha = 1.0
		time = 0.25}
	<angle> = $0x1428a1f6
	begin
	sin <angle>
	se_setprops timer_rot_angle = (3.0 * <sin>)
	WaitOneGameFrame
	<angle> = (<angle> + 5.0)
	if (<angle> > 360.0)
		<angle> = (<angle> - 360.0)
	endif
	Change 0x1428a1f6 = <angle>
	repeat
endscript

script animate_watch_timer_sweep_second 
	setscriptcannotpause
	<angle> = $0x36451372
	begin
	se_setprops timer_hand_big_rot_angle = <angle>
	WaitOneGameFrame
	<angle> = (<angle> + 10.0)
	if (<angle> > 360.0)
		<angle> = (<angle> - 360.0)
	endif
	Change 0x36451372 = <angle>
	repeat
endscript

script animate_watch_timer_sweep_minute 
	setscriptcannotpause
	<angle> = $0x5e6ada5f
	begin
	se_setprops timer_hand_small_rot_angle = <angle>
	WaitOneGameFrame
	<angle> = (<angle> + 1.0)
	if (<angle> > 360.0)
		<angle> = (<angle> - 360.0)
	endif
	Change 0x5e6ada5f = <angle>
	repeat
endscript

script watch_animate_in 
	setscriptcannotpause
	if GetSingleTag \{animating_out}
		if (<animating_out> = 0)
			return
		endif
		SetTags \{animating_out = 0}
		se_setprops timer_watch_alpha = 1.0 time = <time>
		se_setprops timer_hand_big_alpha = 1.0 time = <time>
		se_setprops timer_hand_small_alpha = 1.0 time = <time>
	endif
endscript

script watch_animate_out 
	setscriptcannotpause
	SetTags \{animating_out = 1}
	se_setprops timer_watch_alpha = 0.0 time = <time>
	se_setprops timer_hand_big_alpha = 0.0 time = <time>
	se_setprops timer_hand_small_alpha = 0.0 time = <time>
endscript
